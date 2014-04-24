piOS /source
============

This directory is used for storing source code.

## packages

### organization
The source is organized by folder into /package/subpackage.s (or .c)

### functions

#### i/o
Functions use r0-r3 as inputs, and r0-r3 are not guaranteed to be preserved, and are used for return values.
The remaining registers must remain unchanged and if used, its value will be pushed on the stack.

#### syntax
Function names are named subpackage_Function, ex: io/gpio.s will contain functions prefixed with gpio_.
