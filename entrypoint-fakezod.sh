#!/bin/sh

set -e

if [ -e /urbit/zod/.urb ]
then
	echo "Found existing state"
else
	echo "Unpacking initial fakezod state"
	tar xv -f /tmp/fakezod-init.tar.gz -C /urbit/zod
fi

/entrypoint.sh $* -F -I zod zod
