#!/usr/bin/env bash
# a manifest that kills a process named killmenow.

file { 'etc/ssh/ssh_config':
       ensure => present'

content =>"

        #SSH client configuration
        host*
        IdentityFile ~/.ssh/school
        PasswordAuthentication no
        ",
}
