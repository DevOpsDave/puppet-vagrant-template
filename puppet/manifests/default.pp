node default {
  notice("Hi!")

  package { 'docker.io': ensure => latest, }

  package { 'multitail': ensure => latest, }

  package { 'nmap': ensure => latest, }

  package { 'git': ensure => latest, }

}
