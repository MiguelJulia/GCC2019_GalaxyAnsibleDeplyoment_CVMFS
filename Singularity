Bootstrap: docker
From: ubuntu:16.04

%files
        ./* /opt/

%post
        echo "Install python2.7 setuptools and pip"
        apt-get install ansible python2 python-pip

        echo "Install virtualenv"
        pip2 install virtualenv

        echo "Install Galaxy"
        cd /opt/
        ansible-playbook -i host cvmfs_playbook.yml

        echo "Set wellcome webpage"
        cp files/galaxy/welcome.html /srv/galaxy/server/static/welcome.html

%runscript
    exec scif "$@"
