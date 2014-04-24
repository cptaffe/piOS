piOS /source
============

This directory is used for storing source code.

## packages

### organization

The source is organized by folder into __package/subpackage.s__ (or .c), ex: __io/gpio.s__

### functions

#### i/o
Functions use `r0-r3` as inputs, and those registers are not guaranteed to be preserved, and are used for return values.
The remaining registers must remain unchanged and if used, its value will be pushed on the stack.

#### name mangling
Function names are named __pkg_subpkg_Func__, ex: __io/gpio.s__ will contain functions prefixed with __io_gpio___.
In exported functions (`.globl`), the __Func__ portion is capitalized, while in unexported it is not.
