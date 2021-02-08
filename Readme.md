# Steps to run

Download qcow2 umage of ubuntu (`/home/giggsoff/Downloads/ubuntu.qcow2` in the lines below).

Run the command to boot into Ubuntu:

```bash
docker run --cpus=2 --memory=2.6G --privileged -v /home/giggsoff/Downloads/ubuntu.qcow2:/test/ubuntu.qcow2 -it --rm giggsoff/xen-tools-test:0.1
```

Login into ubuntu with `ubuntu:passw0rd`.