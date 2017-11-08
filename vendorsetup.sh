for device in $(curl -s https://raw.githubusercontent.com/DOSP-Project/official_devices/o8x/devices.json | sed 's/ //; /^$/d' | grep -Po '\"codename\": ".*?"' | sed -e 's/codename//;s/\"//g;s/\: //')
do
for var in eng user userdebug; do
add_lunch_combo dosp_$device-$var
done
done
