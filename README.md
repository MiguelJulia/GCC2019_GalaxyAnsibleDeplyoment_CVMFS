# GCC2019_GalaxyAnsibleDeplyoment_CVMFS
Example of deployment of a Galaxy Production Instance using CVMFS with Ansible.
For more info, look into [galaxy admin training materials](https://galaxyproject.github.io/training-material/topics/admin/)

#### Deploying a galaxy stance
```
ansible-playbook -i host cvmfs_playbook.yml
```

#### Restart galaxy
```
sudo su - galaxy
supervisorctl restart galaxy
```

#### Variables to modify for quick deployment
Admin user name. This user is not created, still has to be registered the first time and it will automatically get admin permissions:
```
galaxy_config:
  galaxy:
    admin_users: admin@example.com
```

Brand: Whatever appears on the banner
```
galaxy_config:
  galaxy:
    brand: "Freiburg GCC"
```

#### welcome.html
Frontpage is not created by default. You can find the template inside `galaxy_root: /srv/galaxy`, in `server/static/welcome.html.sample`. Just create a `welcome.html` page from this template in that same location and restart galaxy.

#### Deploying yoyr ansible-managed galaxy into a container
We will use [ansible-bender](https://github.com/ansible-community/ansible-bender) for this task. Your playbook will have to be adapted to this plugging standars as described in their documentation, or compare the differences between my cvmfs_playbook.yml and ansible-bender-test.yml to have a quick idea of how it has to be done.

Make sure you are running the right version of ansible, as ansible-bender only works with python3. Still, playbooks designed for python2 can still be used.
