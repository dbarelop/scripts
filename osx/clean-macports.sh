#!/bin/bash
# http://simenhag.blogspot.co.uk/2008/11/cleaning-up-macports.html
sudo port clean --all installed
sudo port -f uninstall inactive
