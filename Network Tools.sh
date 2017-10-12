#! /bin/bash

PS3='Please enter your choice: '
options=("Whois" "IP Tracker" "Ping" "Traceroute" "Quit")
select opt in "${options[@]}"
do
  case $opt in
    "Whois")
      echo "Please enter the Domain" # Says the information the string
      read domain # prompts user to input domain
      whois $domain > Desktop/whois.txt
      host -a $domain > Desktop/host.txt
      cat Desktop/whois.txt Desktop/host.txt > Desktop/$domain.txt
      rm Desktop/whois.txt Desktop/host.txt
      echo "A txt file has been saved to the desktop. This contains the data!"

      #OLD open https://whois.domaintools.com/$domain # Opens URL with entered domain
      ;;
    "IP Tracker")
      echo "Please enter the IP address" # Says the information the string
      read tIp # prompts user to input ip
      open http://www.ip-tracker.org/locator/ip-lookup.php?ip=$tIp # Opens URL with entered ip
      ;;
    "Ping")
      echo "Please enter the IP address"
      read pIp
      ping -c 4 $pIp
      ;;
      "Traceroute")
        echo "Please enter the IP address or Domain"
        read traceroute
        traceroute $traceroute
        ;;
    "Quit")
      break
      ;;
    *) echo invalid option;;
  esac
done
