FROM quay.io/kohlstechnology/eunomia-ocp-templates

ENV OPENSHIFT_MODULE_VERSION=0.9.0
ENV KUBE_MODULE_VERSION=9.0.0

USER root

RUN yum install -y --disableplugin=subscription-manager python36-devel gcc python3-pip python3-setuptools && \
    pip3 install ansible openshift==$OPENSHIFT_MODULE_VERSION kubernetes==$KUBE_MODULE_VERSION jmespath passlib && \
    yum remove -y gcc python36-devel

COPY bin/processTemplates.sh /usr/local/bin/processTemplates.sh

USER ${USER_UID}
