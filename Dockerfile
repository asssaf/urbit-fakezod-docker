ARG DOCKER_TAG=latest
FROM tloncorp/urbit:$DOCKER_TAG as urbit-base

FROM debian:buster-slim as builder

RUN apt-get update && apt-get install -y git python python-pexpect

# avoid /urbit which is a volume
WORKDIR /tmp

# create fake zod
ENV TERM=xterm
ADD createfakezod.py /tmp/

COPY --from=urbit-base /bin/urbit /bin/
COPY --from=urbit-base /bin/start-urbit /bin/
COPY --from=urbit-base /nix /nix


RUN python createfakezod.py

RUN tar -cvz -C zod -f fakezod-init.tar.gz .urb


FROM urbit-base

COPY --from=builder /tmp/zod/ /tmp/zod/
COPY entrypoint-fakezod.sh /

ENTRYPOINT [ "/entrypoint-fakezod.sh" ]
