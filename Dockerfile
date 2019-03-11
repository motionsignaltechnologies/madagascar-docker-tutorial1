#Copyright 2019 Motion Signal Technologies 
#
#Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
#
#1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
#
#2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
#
#3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
#
#THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

###################################################################
# Madagascar v2.0 build on Ubuntu 18.04 
###################################################################
FROM ubuntu:18.04

###################################################################
# Install some basic pre-requisites
###################################################################
RUN apt-get update && \
    apt-get install -y --no-install-recommends  \
    libxaw7-dev freeglut3-dev libnetpbm10-dev libgd-dev libplplot-dev \
	libavcodec-dev libcairo2-dev libjpeg-dev swig python-dev python-numpy g++ gfortran \
	libopenmpi-dev libfftw3-dev libsuitesparse-dev python-epydoc scons \
	git wget ca-certificates openssl && \
	apt-get -y clean
    
####################################################################
# Madagascar build
####################################################################
RUN git clone https://github.com/ahay/src  /madagascar-src&& \
	cd /madagascar-src && \
	git checkout madagascar-2.0 && \
	./configure API=c++,python --prefix=/usr/local && \
	make install && \
	rm -r /madagascar-src

RUN echo "\n" >> ~/.bashrc && \
	echo "source /usr/local/share/madagascar/etc/env.sh" >> ~/.bashrc 




#