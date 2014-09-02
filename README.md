# CoreOS Sandbox
This repo is a fork of [coreos/coreos-vagrant](https://github.com/coreos/coreos-vagrant).
This provides a template Vagrantfile to create CoreOS clusters using Virtualbox and Vagrant.

## REQUIREMENTS
Install dependencies

* [VirtualBox][virtualbox] 4.3.10 or greater.
* [Vagrant][vagrant] 1.6 or greater.

## GETTING STARTED
Clone this project and bootstrapping

```
$ git clone https://github.com/spesnova/coreos-sandbox && coreos-sandbox
$ script/bootstrap
```

Startup and SSH

```
vagrant up
vagrant ssh
```
