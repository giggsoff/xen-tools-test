FROM alpine:3.13 as geniso

RUN apk add --no-cache cdrkit=1.1.11-r3

COPY user-data /

RUN { echo instance-id: iid-local01; echo local-hostname: cloudimg; } > meta-data

RUN genisoimage  -output seed.iso -volid cidata -joliet -rock user-data meta-data

FROM lfedge/eve-xen-tools:783cd6df8b34f2991bb8c239d771d54341746d21

WORKDIR /test

COPY qemu.conf /test/

COPY --from=geniso /seed.iso /test/

VOLUME /test

CMD ["/usr/lib/xen/bin/qemu-system-x86_64", "-nographic", "-display", "none", "-serial", "stdio", "-nodefaults", "-no-user-config", "-no-hpet", "-readconfig", "/test/qemu.conf"]