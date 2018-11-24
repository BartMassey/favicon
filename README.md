# Netpbm Favicon Builder
Copyright (c) 2007 Bart Massey

I do a lot of web site maintenance, and everybody these days
expects to see a
"[favicon](http://en.wikipedia.org/wiki/Favicon)": the
little custom icon that appears left of the URL in the
address bar and bookmarks of most browsers.  Favicons are
loaded by the browser automatically, preferably by
referencing a LINK REL element in the HEAD of the document
being accessed. Older browsers expect to see
[Windows Icon Files](http://en.wikipedia.org/wiki/ICO_(icon_image_file_format),
so it is probably best to supply those.  But of course, this
is a pain in the neck, especially in my Linux environment.

I have written a shell script to munge an arbitrary image in
PNG (easily adaptable to most any other standard format)
into a workable favicon.  The script makes heavy use of
utilities from the [Netpbm](http://netpbm.sourceforge.net/)
collection.  It takes a source image file as its argument,
and makes a giant mess in the directory it is run in,
including a favicon file that contains the image at a
multiple of resolutions.  The formats in the favicon are
currently hard-coded to a recommendation from the <a
href="http://netpbm.sourceforge.net/doc/ppmtowinicon.html">ppmtowinicon</a>
manual page, but the script should be easily adaptable to
include other formats.  I left the garbage around because
sometimes one wants to hand-edit it; the
<tt>--prescaled</tt> flag will make the script use
validly-named files that are already present rather than
generating them itself.

This program is licensed under "GPL version 3 or
later". Please see the file `COPYING` in this distribution
for license terms.
