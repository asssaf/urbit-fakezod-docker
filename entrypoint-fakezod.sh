#!/bin/sh

set -e

if [ -e /urbit/zod/.urb ]
then
	echo "Found existing state"
else
	echo "Unpacking initial fakezod state"
	[ -d /urbit/zod ] || mkdir -p /urbit
	cp -av /tmp/zod /urbit/
fi

/bin/start-urbit $* zod
