FROM fedora:20
MAINTAINER Jiri Stransky <jistr@jistr.com>

RUN yum -y install ccache diffutils file gcc gcc-c++ make pandoc perl python valgrind which

ADD rust-build/variables.sh /root/rust-build/variables.sh

ADD rust-build/build.sh /root/rust-build/build.sh
RUN /root/rust-build/build.sh

ADD rust-build/install.sh /root/rust-build/install.sh
RUN /root/rust-build/install.sh

ENTRYPOINT ["/bin/bash"]
