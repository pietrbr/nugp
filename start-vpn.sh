#!/bin/bash

sudo -v && pass show northeastern | ./nugp -u brachdelprever.p@northeastern.edu | sudo openconnect --protocol=gp --usergroup=portal:prelogin-cookie -u "brachdelprever.p" --passwd-on-stdin --interface nutun vpn.northeastern.edu
