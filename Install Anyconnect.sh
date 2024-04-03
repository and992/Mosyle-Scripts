mkdir -p /opt/cisco/anyconnect/profile

cat <<EOF>/opt/cisco/anyconnect/profile/profile.xml
<?xml version="1.0" encoding="UTF-8"?>
<AnyConnectProfile xmlns="http://schemas.xmlsoap.org/encoding/">
<ServerList>
<HostEntry>
<HostName>vpn.esis.dk</HostName>
<HostAddress>vpn.esis.dk</HostAddress>
</HostEntry>
</ServerList>
</AnyConnectProfile>
EOF

mkdir /tmp/CiscoAnyConnect
cd /tmp/CiscoAnyConnect
curl -sS https://URL/Cisco/AnyConnect4.10.05111.zip > anyconnect.zip
unzip anyconnect.zip
rm anyconnect.zip
sudo installer -pkg AnyConnect.pkg -applyChoiceChangesXML vpn_install_choices.xml -target /	
rm AnyConnect.pkg
rm vpn_install_choices.xml
rmdir __MACOSX
rmdir /tmp/CiscoAnyConnect
exit 0
