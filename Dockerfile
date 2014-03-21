FROM fedora:20
MAINTAINER Jiri Stransky <jistr@jistr.com>

RUN yum -y install ccache diffutils file gcc gcc-c++ make pandoc perl python valgrind which

ADD rust-build /root/rust-build

RUN /root/rust-build/build.sh
RUN /root/rust-build/install.sh
RUN rm -rf /root/rust-build

ENTRYPOINT ["/bin/bash"]
