#!/bin/bash

fishes=("bass" "blay" "bley" "brit" "carp" "chad" "char" "chub" "clam" "coho" "crab" "cusk" "dace" "dart" "dory" "drum" "fugu" "gade" "goby" "grig" "hake" "hoki" "huso" "jack" "kelt" "keta" "ling" "luce" "mako" "masu" "moki" "mort" "opah" "orfe" "parr" "peal" "peel" "pike" "pope" "pout" "rudd" "ruff" "scad" "scar" "scup" "shad" "snig" "sole" "spat" "tope" "tuna" "tusk" "ablet" "allis" "basse" "bleak" "bream" "brill" "charr" "cisco" "cobia" "cohoe" "coley" "doree" "dorse" "elops" "elver" "fluke" "gaper" "gibel" "grunt" "guppy" "lance" "loach" "manta" "moray" "murry" "nerka" "nurse" "padle" "perai" "perch" "piper" "pirai" "pogge" "porgy" "powan" "prawn" "prawn" "roker" "ruffe" "saith" "sargo" "saury" "sewen" "sewin" "shark" "skate" "smelt" "smolt" "snoek" "snook" "sprat" "sprod" "squid" "squit" "tench" "togue" "torsk" "trout" "tunny" "whelk" "whiff" "witch" "yabby" "alevin" "allice" "anabas" "angler" "barbel" "beluga" "blenny" "bonito" "bowfin" "brassy" "buckie" "bumalo" "burbot" "caplin" "cheven" "chevin" "cockle" "comber" "conger" "conner" "cunner" "darter" "dentex" "dipnoi" "doctor" "dorado" "duncow" "ellops" "finnac" "finnan" "finner" "gadoid" "ganoid" "garvie" "goramy" "gossat" "grilse" "groper" "gunnel" "gurami" "gurnet" "launce" "mahsir" "maigre" "marlin" "meagre" "megrim" "milter" "minnow" "morgay" "mudcat" "mullet" "murena" "murray" "murrey" "mussel" "oyster" "paddle" "paidle" "pirana" "piraya" "plaice" "pollan" "porgie" "remora" "robalo" "ruffin" "saithe" "salmon" "samlet" "sander" "sardel" "sauger" "saurel" "seeder" "sephen" "shanny" "shiner" "shrimp" "sucker" "sucker" "tautog" "trygon" "turbot" "twaite" "weever" "winkle" "wrasse" "yabbie" "zander" "zingel")
random=$(shuf -i 1-${#fishes[@]} -n 1)
name=${fishes[$random-1]}

#get CPU SN
sn=$(cat /proc/cpuinfo | grep Serial)

#merge random name with last 5 chars of SN
newhost=$name-${sn: -5}

#Assign existing hostname to $hostn
hostn=$(cat /etc/hostname)

#change hostname in /etc/hosts & /etc/hostname
sudo sed -i "s/$hostn/$newhost/g" /etc/hosts
sudo sed -i "s/$hostn/$newhost/g" /etc/hostname

#display new hostname and prompt for reboot
echo "Your new hostname is $newhost"
echo "Do you wish to restart now?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) sudo reboot now;;
        No ) exit;;
    esac
done