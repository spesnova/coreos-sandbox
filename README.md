# CoreOS Sandbox
This repo is a fork of [coreos/coreos-vagrant](https://github.com/coreos/coreos-vagrant).
This provides a template Vagrantfile to create CoreOS clusters using Virtualbox and Vagrant.

## REQUIREMENTS
Install dependencies

* [VirtualBox](https://www.virtualbox.org/) 4.3.10 or greater.
* [Vagrant](https://www.vagrantup.com/downloads.html) 1.6 or greater.

## GETTING STARTED
Clone this project and bootstrapping

```
$ git clone https://github.com/spesnova/coreos-sandbox && coreos-sandbox
$ script/bootstrap
```

Startup and SSH

```
$ vagrant up
$ vagrant ssh
```

### USING GITHUB SSH KEY TO LOGIN

`user-data.yml.erb`

```
#cloud-config

users:
  - name: seigo
  coreos-ssh-import-github: spesnova
```

`~/.ssh/config`

```
# Local CoreOS Cluster
Host core-01
  HostName 172.17.8.101
  User         seigo
  IdentityFile ~/.ssh/github_ssh_private_key
```

You can login to CoreOS machine using GitHub SSH key.

```bash
$ ssh seigo@core-01
```
