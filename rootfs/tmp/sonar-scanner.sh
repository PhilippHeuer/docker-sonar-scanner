#!/usr/bin/env sh

############################################################
# Configuration
############################################################
SONAR_SCANNER_VERSION="3.0.0.702"

############################################################
# Sonar Scanner
############################################################

# Download
wget -O /tmp/sonar-scanner-cli.zip --no-check-certificate "https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$SONAR_SCANNER_VERSION-linux.zip"

# Extract
mkdir -p /opt/sonar-scanner
unzip /tmp/sonar-scanner-cli.zip -d /opt/sonar-scanner

# Link
ln -s "/opt/sonar-scanner/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin/sonar-scanner" "/usr/local/bin/sonar-scanner"
ln -s "/opt/sonar-scanner/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin/sonar-scanner-debug" "/usr/local/bin/sonar-scanner-debug"

# Replace embedded JRE
rm -rf "/opt/sonar-scanner/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/jre"
ln -s "$JAVA_HOME" "/opt/sonar-scanner/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/jre"

# Build Log
echo -ne "Sonar Scanner - $SONAR_SCANNER_VERSION\n" >> /root/.built
