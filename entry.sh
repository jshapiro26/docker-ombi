#!/bin/bash

# Download and install latest version of Ombi v3
wget https://ci.appveyor.com/api/buildjobs/lr8437akhr3tf9f2/artifacts/linux.tar.gz
tar xzf linux.tar.gz -C /opt/Ombi
rm -f linux.tar.gz
chmod +x /opt/Ombi/Ombi

# Start Ombi server
./Ombi --storage /config
