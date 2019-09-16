I wanted to cross compile Leptonica on Linux, Fedora 30 in my case, using
the MXE cross compile libraries. To do this I modified the makefile.static
file in the leptonica/src directory as suggested on the Leptonica website.

My MXE installation is in '/opt/mxe'. If you have put it elsewhere then
you will need to modify the paths appropriately.

I first ran ./make-for-local which copies src/makefile.static to
src/makefile. Then I modified 'makefile' to allow the use of a COMPILER flag.

So if you want to use these files you should copy makefile into the leptonica/src
directory 'cd  src' to move to that directory and run make with one of the
following commands.

All versions create a library called 'liblept.a'.

- 'make' This will create a no debug static library using your local gcc in leptonica/nodebug.
- 'make COMPILER=GCC' This is exactly the same as above as GCC is the default.
- 'make DEBUG=yes debug' This will create a debug static library sing your local gcc in leptonica/debug.
- 'make COMPILER=GCC DEBUG=yes debug' This is exactly the same as above as GCC is the default.
- 'make COMPILER=MXE_GCC_STATIC' This will create a no debug static library using the MXE static gcc in leptonica/nodebug.
- 'make COMPILER=MXE_GCC_STATIC DEBUG=yes debug'  This will create a debug static library using the MXE static gcc in leptonica/nodebug.

There is a COMPILER=MXE_GCC_SHARED flag but that doesn't work at the moment 
and as I don't want the shared library at the moment I haven't tried to
fault find it.

You can chain the methods together and so long as you don't 'make clean,
all the files will be created in separate directories.

make; make DEBUG=yes debug; make COMPILER=MXE_GCC_STATIC; make COMPILER=MXE_GCC_STATIC DEBUG=yes debug

will create both unix and mingw debug and nodebug static libraries.

I am placing all my created library files in a central location
under ~/workspace/lib.

lib
lib/unix
lib/unix/lib # 'liblept.a' and 'libleptd.a' (the debug version was renamed to unix style)
lib/unix/include
lib/mingw64
lib/mingw64/release
lib/mingw64/release/lib
lib/mingw64/release/include
lib/mingw64/debug
lib/mingw64/debug/lib
lib/mingw64/debug/include

the shell script install.sh makes this directory structure and copies the
various '*.h' files and the "*.a" library files into this structure.

I am certain that there is a more elegant way to do this but it works and
I don't have the time to chase down faults and/or a better method.
Maybe later if I get the time.

All this is placed under the MIT license so if it is of any use to you, 
then use it.

