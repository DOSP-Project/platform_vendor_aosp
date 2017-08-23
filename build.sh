#! /bin/bash

#    
# ██ ██████         ██ ██       ██ ██ ██    ██ ████    
# ██       ██    ██       ██    ██          ██     ██ 
# ██       ██    ██       ██    ██ ██ ██    ██ ████    
# ██       ██    ██       ██          ██    ██          
# ██ ██████         ██ ██       ██ ██ ██    ██    ── ── 
#
# Copyright 2017 DOSPTeam
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


TEAM_NAME="DOSP"
TARGET=Desi
VARIANT=userdebug
AOSP_VER=7.2.1
OUT="out/target/product/Desi"
FILENAME=DOSP-"$AOSP_VER"-"$(date +%Y%m%d)"-"$TARGET"-GSM."$USER"

UNIFIED=false
FILENAME2=DOSP-"$AOSP_VER"-"$(date +%Y%m%d)"-"$TARGET"."$USER"

buildROM()
{
	echo "Building..."
	time schedtool -B -n 1 -e ionice -n 1 make otapackage -j"$CPU_NUM" "$@"
	if [ "$?" == 0 ]; then
		echo "Build done"
	else
		echo "Build failed"
	fi
	croot
}

anythingElse() {
    echo " "
    echo " "
    echo "Anything else?"
    select more in "Yes" "No"; do
        case $more in
            Yes ) bash build.sh; break;;
            No ) exit 0; break;;
        esac
    done ;
}

clean() {
	make clean && make clobber
}

deepClean() {
	ccache -C && ccache -c
}

rename() {
	cp -r "$OUT"/DOSP_desi-ota-eng* $(pwd)
	if [ "$UNIFIED" == "true" ]; then
		mv DOSP_desi-ota-eng* "$FILENAME2".zip
		md5sum "$FILENAME2".zip > "$FILENAME2".zip.md5
	else
		mv DOSP_desi-ota-eng* "$FILENAME".zip
		md5sum "$FILENAME".zip > "$FILENAME".zip.md5
	fi
	
	echo "Renamed ROM is located at " $(pwd)
}

echo " "
echo -e "\e[1;91mWelcome to the $TEAM_NAME build script"
echo -e "\e[0m "
echo "Setting up build environment..."
. build/envsetup.sh > /dev/null
echo "Setting build target $TARGET""..."
lunch "$TEAM_NAME"_"$TARGET"-"$VARIANT" > /dev/null
echo " "
echo -e "\e[1;91mPlease make your selections carefully"
echo -e "\e[0m "
echo " "
select build in "Build ROM" "Clean" "Deep clean(inc. ccache)" "Rename ROM" "Exit"; do
	case $build in
		"Build ROM" ) buildROM; anythingElse; break;;
		"Clean" ) clean; anythingElse; break;;
		"Deep clean(inc. ccache)" ) clean; deepClean; anythingElse; break;;
		"Rename ROM" ) rename; anythingElse; break;;
		"Exit" ) exit 0; break;;

	esac
done
exit 0
