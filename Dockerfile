FROM ubuntu:16.04

COPY ./*  /opt/

RUN apt-get update && \ 
    echo "Install python2.7 setuptools and pip" && \
    apt-get update && apt-get install -y ansible python python-pip && \
    pip2 install virtualenv && \
    cd /opt/ && \
    ansible-playbook -i host cvmfs_playbook.yml && \
    cp files/galaxy/welcome.html /srv/galaxy/server/static/welcome.html

#ENV

#ENTRYPOINT ["/opt/docker-entrypoint.sh"]
#CMD ["samtools"]
