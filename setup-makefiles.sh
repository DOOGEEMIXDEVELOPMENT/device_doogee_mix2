#!/bin/bash

DEVICE=mix2
VENDOR=doogee

OUTDIR=vendor/$VENDOR/$DEVICE
MAKEFILE=../../../$OUTDIR/$DEVICE-vendor-blobs.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh

PRODUCT_COPY_FILES += \\
EOF
#ifeq (\$(MTKPATH),)
#PRODUCT_COPY_FILES += \\
#EOF

#LINEEND=" \\"
#FILES=$(eval echo `egrep -v '(^#|^$)' proprietary-files-mtk.txt`)
#COUNT=`echo $FILES | wc -w`
#
#for FILE in $FILES; do
#  COUNT=`expr $COUNT - 1`
#  if [ $COUNT = "0" ]; then
#    LINEEND=""
#  fi
#  # Split the file from the destination (format is "file[:destination]")
#  OLDIFS=$IFS IFS=":" PARSING_ARRAY=($FILE) IFS=$OLDIFS
#  if [[ ! "$FILE" =~ ^-.* ]]; then
#    FILE=`echo ${PARSING_ARRAY[0]} | sed -e "s/^-//g"`
#    DEST=${PARSING_ARRAY[1]}
#    if [ -n "$DEST" ]; then
#      FILE=$DEST
#    fi
#    echo "    $OUTDIR/$FILE:system/$FILE$LINEEND" >> $MAKEFILE
#  fi
#done
#(cat << EOF) >> $MAKEFILE
#endif
#
#ifeq (\$(WITH_GMS),true)
#
#PRODUCT_COPY_FILES += \\
#   $OUTDIR/etc/permissions/com.google.widevine.software.drm.xml:system/etc/permissions/com.google.widevine.software.drm.xml \\
#    $OUTDIR/framework/com.google.widevine.software.drm.jar:system/framework/com.google.widevine.software.drm.jar
#
#endif # WITH_GMS
#
#PRODUCT_COPY_FILES += \\
#EOF

LINEEND=" \\"
FILES=$(eval echo `egrep -v '(^#|^$)' proprietary-files.txt`)
COUNT=`echo $FILES | wc -w`

for FILE in $FILES; do
  COUNT=`expr $COUNT - 1`
  if [ $COUNT = "0" ]; then
    LINEEND=""
  fi
  # Split the file from the destination (format is "file[:destination]")
  OLDIFS=$IFS IFS=":" PARSING_ARRAY=($FILE) IFS=$OLDIFS
  if [[ ! "$FILE" =~ ^-.* ]]; then
    FILE=`echo ${PARSING_ARRAY[0]} | sed -e "s/^-//g"`
    DEST=${PARSING_ARRAY[1]}
    if [ -n "$DEST" ]; then
      FILE=$DEST
    fi
    # Do not include files that not exists in *.mk to avoid errors [+] Decker
    CFILE=../../../$OUTDIR/$FILE
    if [[ -f "$CFILE" ]]; then
    	echo "    $OUTDIR/$FILE:system/$FILE$LINEEND" >> $MAKEFILE
    else
    	echo "    $OUTDIR/$FILE - not found !"
    fi
  fi
done
(cat << EOF) >> $MAKEFILE
EOF

(cat << EOF) > ../../../$OUTDIR/$DEVICE-vendor.mk
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh

\$(call inherit-product, vendor/$VENDOR/$DEVICE/$DEVICE-vendor-blobs.mk)
EOF

(cat << EOF) > ../../../$OUTDIR/Android.mk
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# This file is generated by device/doogee/mix2/setup-makefiles.sh
LOCAL_PATH := \$(call my-dir)

ifneq (\$(filter mix2, \$(TARGET_DEVICE)),)

include \$(CLEAR_VARS)
LOCAL_MODULE := libaudiocustparam
LOCAL_SRC_FILES_64 := vendor/lib64/libaudiocustparam.so
LOCAL_SRC_FILES_32 := vendor/lib/libaudiocustparam.so
LOCAL_MULTILIB := both
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libmtkcam_fwkutils
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_MULTILIB := both
LOCAL_SRC_FILES_64 := vendor/lib64/libmtkcam_fwkutils.so
LOCAL_SRC_FILES_32 := vendor/lib/libmtkcam_fwkutils.so
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libdpframework
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX = .so
LOCAL_MULTILIB := both
LOCAL_SRC_FILES_64 := vendor/lib64/libdpframework.so
LOCAL_SRC_FILES_32 := vendor/lib/libdpframework.so
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libcam.client
LOCAL_SRC_FILES_64 := vendor/lib64/libcam.client.so
LOCAL_SRC_FILES_32 := vendor/lib/libcam.client.so
LOCAL_MULTILIB := both
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libcameracustom
LOCAL_SRC_FILES_64 := vendor/lib64/libcameracustom.so
LOCAL_SRC_FILES_32 := vendor/lib/libcameracustom.so
LOCAL_MULTILIB := both
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libvcodecdrv
LOCAL_SRC_FILES_64 := vendor/lib64/libvcodecdrv.so
LOCAL_SRC_FILES_32 := vendor/lib/libvcodecdrv.so
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MULTILIB := both
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvram
LOCAL_SRC_FILES_64 := vendor/lib64/libnvram.so
LOCAL_SRC_FILES_32 := vendor/lib/libnvram.so
LOCAL_MULTILIB := both
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libged
LOCAL_SRC_FILES_64 := vendor/lib64/libged.so
LOCAL_SRC_FILES_32 := vendor/lib/libged.so
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MULTILIB := both
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE = libRSDriver_mtk
LOCAL_MODULE_CLASS = SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX = .so
LOCAL_PROPRIETARY_MODULE = true
LOCAL_MODULE_TAGS = optional
LOCAL_SHARED_LIBRARIES = libc++ libz libutils libRS_internal libbcinfo liblog libEGL libGLESv1_CM libGLESv2 libnativewindow
LOCAL_MULTILIB = both
LOCAL_SRC_FILES_64 := vendor/lib64/libRSDriver_mtk.so
LOCAL_SRC_FILES_32 := vendor/lib/libRSDriver_mtk.so
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libmtkplayer
LOCAL_SRC_FILES_64 := vendor/lib64/libmtkplayer.so
LOCAL_SRC_FILES_32 := vendor/lib/libmtkplayer.so
LOCAL_MULTILIB := both
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := mtk-ril
LOCAL_SRC_FILES_64 := vendor/lib64/mtk-ril.so
LOCAL_SRC_FILES_32 := vendor/lib/mtk-ril.so
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MULTILIB := both
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
include \$(BUILD_PREBUILT)


include \$(CLEAR_VARS)
LOCAL_MODULE := mtk-rilmd2
LOCAL_SRC_FILES_64 := vendor/lib64/mtk-rilmd2.so
LOCAL_SRC_FILES_32 := vendor/lib/mtk-rilmd2.so
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MULTILIB := both
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
include \$(BUILD_PREBUILT)


include \$(CLEAR_VARS)
LOCAL_MODULE := mtk-rilproxy
LOCAL_SRC_FILES_64 := vendor/lib64/mtk-rilproxy.so
LOCAL_SRC_FILES_32 := vendor/lib/mtk-rilproxy.so
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MULTILIB := both
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
include \$(BUILD_PREBUILT)

endif

EOF
