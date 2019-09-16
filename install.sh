#!/bin/bash
mkdir -p \
  ~/workspace/lib/mingw64/debug/lib \
  ~/workspace/lib/mingw64/debug/include/leptonica \
  ~/workspace/lib/mingw64/release/lib \
  ~/workspace/lib/mingw64/release/include/leptonica \
  ~/workspace/lib/unix/lib \
  ~/workspace/lib/unix/include/leptonica
cp ../lib/nodebug/liblept.a /home/simonmeaden/workspace/lib/unix/lib
cp ../lib/debug/liblept.a /home/simonmeaden/workspace/lib/unix/lib/libleptd.a # rename debug version
cp ../lib/mxe_gcc_static/nodebug/liblept.a /home/simonmeaden/workspace/lib/mingw64/release/lib
cp ../lib/mxe_gcc_static/debug/liblept.a /home/simonmeaden/workspace/lib/mingw64/debug/lib
cp *.h /home/simonmeaden/workspace/lib/unix/include/leptonica
cp *.h /home/simonmeaden/workspace/lib/mingw64/release/include/leptonica
cp *.h /home/simonmeaden/workspace/lib/mingw64/debug/include/leptonica
