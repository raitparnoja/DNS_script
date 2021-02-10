#!/bin/bash

apt-get --purge remove apache2
apt-get autoremove
apt-get autoclean

