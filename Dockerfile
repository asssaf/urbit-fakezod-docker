FROM asssaf/urbit-alpine

ENV PV=maint-ceb3589
ENV FAKEZOD_URL=https://github.com/asssaf/urbit-fakezod-docker-alpine/releases/download/$PV/fakezod-init.tar.gz

RUN wget -O /urbit/fakezod-init.tar.gz $FAKEZOD_URL
COPY entrypoint-fakezod.sh /
RUN mkdir /urbit/zod && chmod 777 /urbit/zod

ENTRYPOINT [ "/entrypoint-fakezod.sh" ]
