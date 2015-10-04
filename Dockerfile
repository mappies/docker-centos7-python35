FROM mappies/centos7-devel
MAINTAINER Nithiwat K. <mappies@gmail.com>

# Install dependencies
RUN yum install -y zlib-devel bzip2-devel openssl-devel sqlite-devel

# Install Python 3.5
RUN curl -O https://www.python.org/ftp/python/3.5.0/Python-3.5.0.tgz
RUN tar xf Python-3.5.0.tgz
WORKDIR Python-3.5.0
RUN ./configure --prefix=/usr/local --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib"
RUN make && make altinstall
WORKDIR ..
RUN rm -f Python-3.5.0.tgz && rm -rf Python-3.5.0

# Install pip for Python 3.5
RUN curl https://bootstrap.pypa.io/ez_setup.py  | python3.5
RUN easy_install-3.5 pip
