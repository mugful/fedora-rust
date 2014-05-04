#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.

FROM fedora:20
MAINTAINER Jiri Stransky <jistr@jistr.com>

RUN yum -y update; yum clean all
RUN yum -y install ccache diffutils file gcc gcc-c++ make pandoc perl python valgrind which; yum clean all

ADD rust-build /root/rust-build
RUN /root/rust-build/build_and_install.sh

ENTRYPOINT ["/bin/bash"]
