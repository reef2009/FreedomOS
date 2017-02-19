#!/sbin/sh
# Copyright 2017 Antoine GRAVELOT
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
#
# FreedomOS arise config file generator

rm /sdcard/arise_customize.prop
echo "# ARISE config file" > /sdcard/arise_customize.prop
echo "# Generated by FreedomOS installer" >> /sdcard/arise_customize.prop
echo "install.deuteronomy=true" >> /sdcard/arise_customize.prop
echo "repair.sdcard.permissions=true" >> /sdcard/arise_customize.prop
cat /tmp/aroma/arise.prop >> /sdcard/arise_customize.prop
sed -i 's/=1/=true/g' /sdcard/arise_customize.prop
sed -i 's/=0/=/g' /sdcard/arise_customize.prop
cat /tmp/aroma/ICEconfig.prop >> /sdcard/arise_customize.prop
cat /tmp/aroma/ICEpreset.prop >> /sdcard/arise_customize.prop

if [[ ! -f /tmp/aroma/ICEconfig.prop ]]; then
    touch /tmp/aroma/ICEconfig.prop
fi

if [[ ! -f /tmp/aroma/ICEpreset.prop ]]; then
    touch /tmp/aroma/ICEpreset.prop
fi
