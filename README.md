# IUPWrapper

This is a wrapper for IUP library for the OpenEuphoria programming language. The IUP functions have been wrapped to match the C library as closely as possible. While also being Euphoria friendly as well. Some examples are included to show off the wrapper. 

Note: Current wrapper is based off of IUP version 3.29 due to a bug in IUP 3.3.0

# LICENSE (ZLIB)

Copyright (c) <2023> <Andy P., Icy_Viking Games>

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

1. The origin of this software must not be misrepresented; you must not
   claim that you wrote the original software. If you use this software
   in a product, an acknowledgment in the product documentation would be
   appreciated but is not required.
2. Altered source versions must be plainly marked as such, and must not be
   misrepresented as being the original software.
3. This notice may not be removed or altered from any source distribution.

# EXAMPLE

```euphoria
--Very simple Hello World example

include std/ffi.e

include IUP.e

IupOpen(NULL,NULL)

IupMessage("Hello","Hello World")

IupClose()
```
