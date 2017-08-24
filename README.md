Ready to run urbit fakezod docker container

Just run it:
```
$ docker run --rm -ti asssaf/u anrbit-fakezod-alpine

Unpacking initial fakezod state
.urb/
.urb/chk/
.urb/chk/north.bin
.urb/chk/south.bin
.urb/get/
.urb/put/
.urb/sis/
.urb/urbit.pill
.urb/egz.hope
.urb/code.~sansub-mogtul
~
urbit 0.4.5
urbit: home is zod
loom: mapped 2048MB
protected loom
live: loaded: MB/69.795.840
boot: installed 239 jets
arvo: time: ~2017.8.24..20.23.45..833e
ames: czar: ~zod on 31337
rest: checkpoint to event 27
rest: old 0v1v.cr7h5, new 0vq.c2oaa
loaded passcode from zod/.urb/code.~sansub-mogtul

---------------- playback complete----------------
ames: on localhost, UDP 31337.
http: live (insecure, public) on 8080
http: live ("secure", public) on 8443
http: live (insecure, loopback) on 12321
~zod:dojo>
```

For mapping volumes (for storing state between runs and accessing the unix mounts) and network ports (for accessing web) see [`scripts/run`](scripts/run)
