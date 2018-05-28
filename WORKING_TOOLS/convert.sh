#!/bin/sh
perl -pi -e 's@\r\n?@\n@' $1
perl -pi -e 's@^//@@' $1
perl -pi -e 's@$@;@' $1
perl -pi -e 's@^;$@@' $1
perl -pi -e 's@:;$@:@' $1
perl -pi -e 's@(#.+);$@$1@' $1
perl -pi -e 's@(\W)self\.@$1this.@g' $1
perl -pi -e 's@ def (\S+?)\(self, ?(.+?)\):$@ public UNK $1($2) {@' $1
perl -pi -e 's@ def (\S+?)\(self\):$@ public UNK $1() {@' $1
perl -pi -e 's@ if (.+):$@ if ($1) {@' $1
perl -pi -e 's@ else:$@ } else {@' $1
perl -pi -e 's@ elif (.+):$@ } else if ($1) {@' $1
perl -pi -e 's@ raise @ throw new @' $1
perl -pi -e 's@ try:$@ try {@' $1
perl -pi -e 's@ except:$@ } catch (Exception e) {@' $1
perl -pi -e 's@ and @ && @g' $1
perl -pi -e 's@ or @ || @g' $1
perl -pi -e 's@ <> @ != @g' $1
perl -pi -e 's@ is None(\W)@ == null$1@g' $1
perl -pi -e 's@(\W)not @$1!@g' $1
perl -pi -e 's@ for (.+?):$@ foreach (var $1) {@g' $1
perl -pi -e 's@(\W)False(\W)@$1false$2@g' $1
perl -pi -e 's@(\W)True(\W)@$1true$2@g' $1
perl -pi -e 's@([^"'\''\w])None([^"'\''\w])@$1null$2@g' $1
perl -pi -e 's@\(self\)@(this)@g' $1
perl -pi -e 's@#@//@' $1
perl -pi -e 's@\n@\r\n@' $1
