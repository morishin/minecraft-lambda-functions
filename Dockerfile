FROM amazonlinux:latest

RUN yum -y update && yum -y install gcc libffi-devel python-devel openssl-devel tar gzip
RUN cd /tmp && \
    curl -OL https://pypi.python.org/packages/source/s/setuptools/setuptools-1.4.2.tar.gz && \
    tar -xvf setuptools-1.4.2.tar.gz && \
    cd setuptools-1.4.2 && \
    python2.7 setup.py install && \
    curl https://bootstrap.pypa.io/get-pip.py | python2.7 - && \
    pip install virtualenv
WORKDIR /app
CMD virtualenv -p python2.7 venv-for-deployment && \
    source venv-for-deployment/bin/activate && \
    pip install -r requirements.txt
