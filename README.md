# saymyname.sh
It will permanently change (will survive reboot) Raspberry Pi hostname to the 10-12 characters word combined of 4-6 chars fish name and last 5 chars of RPi serial number (which is MAC address actually). e.g.:

```
bass-720ea
manta-5bfa0
beluga-1a7a9
```

It may be useful if you plan to deploy a lot of boards and need unique yet human readable hostnames for all of them.

## Installation and usage
```sh
$ curl -sSOJ https://raw.githubusercontent.com/Atarity/say-my-name/master/saymyname.sh

$ chmod +x saymyname.sh

$ sudo ./saymyname.sh

Your new hostname is whelk-45ba6
Do you wish to restart now?
1) Yes
2) No
```
This script dependencies *shuf* and *yn* is already in default Raspbian package.