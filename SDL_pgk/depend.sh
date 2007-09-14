#!/bin/bash
#
# depend.sh - Create dependencies for a source file
#
# Call as: depend.sh <sourcefile> <dependfile> <flags>
#
# The <dependfile> will be overwritten if it exists.
#
# The CC environment variable should be set to the compiler to use.

whole_name="./$2"
the_dir="${whole_name%/*}"
the_dir="${the_dir#./}"

${CC:=gcc} -MM $3 $1 | sed -e "s+^\([^ ]*\).o:+$the_dir/\1.o $2:+g" > $2
exit $?
