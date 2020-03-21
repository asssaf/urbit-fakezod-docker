#!/bin/sh

set -e

if [ -e /urbit/zod/.urb ]
then
	echo "Found existing state"
else
	echo "Unpacking initial fakezod state"
	[ -d /urbit/zod ] || mkdir -p /urbit/zod
	tar xv -f /tmp/fakezod-init.tar.gz -C /urbit/zod
fi

/entrypoint.sh $* zod
