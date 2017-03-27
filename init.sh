#!/bin/bash
mkdir -p ansible/{inventory,reports,playbooks,roles,resources,library,callback_plugins}
mkdir -p ansible/reports/{day1,day2,day3,day4,day-Final}
mkdir -p ansible/resources/virtualbox
touch ansible/playbooks/{ansible.cfg,application_tests.yml,deploy.yml,createvm.yml,provisionvm.yml} 


  # ansible/                    #  Ansible project directory
  #   inventory/                #  folder with inventory files
  #     dev                     #  dev stack inventory file
  #   playbooks/                #  Playbooks for stages
  #     ansible.cfg             #  Ansible configuration file
  #     application_tests.yml   #  (from homework)
  #     deploy.yml              #  (from homework)
  #     createvm.yml            #  (from homework)
  #     provisionvm.yml         #  (from homework)
  #   roles/                    #  Project roles folder
  #     ...                     #  All your roles (from homeworks)
  #   resources/                #  Folder with Resources
  #     virtualbox/
  #       Vagrantfile           #  vagrantfile with your configuration
  #   library/                  #  Folder with Ansible modules
  #     vagrant                 #  module for managing vagrant VM (from homework)
  #   callback_plugins/         #  Callback plugins folder
  #     output.py               #  STDOUT callback plugin file (from homework)
