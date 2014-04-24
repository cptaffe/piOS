piOS /source
============

This is the source directory, piOS's kernel is created with the use of these source files by using the Makefile in the root dir. I use some unique rules when coding these libraries for the purposes of expandability, maintainability, and ease of use, which I will enumerate:

## packages

The library uses the idea of packages (pkg) to determine directory structure and function name, this way there will never be function collisions or issues with organization.

### organization

The source is organized by folder into __pkg/sub/pkg_sub.s__ (or .c), ex: __io/gpio/io_gpio.s__

Since the '_' character is used as a separator, identifiers such as pkgs, or funcs must refrain from using them. Instead, pkgs should use short, easy to remember package names.

To keep pkg names short, pkgs should only be nested a maximum of 2-3 levels, ex: _io/gpio_ is nested 2 levels.

### functions

#### i/o
Functions use `r0-r3` as inputs, and those registers are not guaranteed to be preserved, and are used for return values.
The remaining registers must remain unchanged and if used, its value will be pushed on the stack.

#### name mangling
Function names are named __pkg_subpkg_Func__, ex: __io/gpio/io_gpio.s__ will contain functions prefixed with __io_gpio___.
In exported functions (`.globl`), the __Func__ portion is capitalized, while in unexported functions it is not.
