#!/bin/bash

# Copyright (c) Microsoft Corporation
# All rights reserved.
#
# MIT License

echo "hello from postbuild.sh"

####################################################################################
#
# Install some utilities for REDCap to work properly
#
####################################################################################

<<<<<<< HEAD
apt-get install -y python3-pip
=======
apt-get install -y python3 python3-pip
>>>>>>> 63be196780b31f978910a70f50f85526c4257001

####################################################################################
#
# Install Python3 modules used to scrape REDCap installation SQL script
#
####################################################################################

python3 -m pip install beautifulsoup4
python3 -m pip install requests

####################################################################################
#
# Scrape the install.php page for SQL commands to execute
#
####################################################################################

cat << EOF > scraper.py
import requests
from bs4 import BeautifulSoup
page = requests.post("https://$WEBSITE_HOSTNAME/install.php")
soup = BeautifulSoup(page.content, "html.parser")
data = soup.find('textarea').text
with open("/home/install.sql", "w") as out:
  for i in range(0, len(data)):
    try:
      out.write(data[i])
    except Exception:
      1+1
EOF
python3 scraper.py

####################################################################################
#
# Copy the install.sh file to the /home directory
#
####################################################################################

cp /home/site/repository/install.sh /home/install.sh