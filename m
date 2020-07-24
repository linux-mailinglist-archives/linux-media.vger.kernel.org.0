Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2A5122CC48
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 19:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgGXRj2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 13:39:28 -0400
Received: from linux.microsoft.com ([13.77.154.182]:50146 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbgGXRj2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 13:39:28 -0400
Received: from localhost.localdomain (unknown [76.104.235.235])
        by linux.microsoft.com (Postfix) with ESMTPSA id 0198B20B4908;
        Fri, 24 Jul 2020 10:39:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0198B20B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1595612367;
        bh=nE711dGakSc/ToRJbGAMSPVhnIZmRoRPjk3SpOlNnqs=;
        h=From:To:Cc:Subject:Date:From;
        b=IOmO3EJcIMUD1nO9lgwCqFWvs/IJB/e/m8h1GH8IRmq9SmZJOghIHHFKapiR5NR1o
         23muU49FZEHsZWfR6dsOYZ93tXD5kw1p9iy6p5AncVO6mok2E/paCMjNYBoEg5+mKN
         F6Ptv4Wh/zSySHdwVndUyclk8W7cmGnWsn/TahvE=
From:   jorhand@linux.microsoft.com
To:     linux-media@vger.kernel.org
Cc:     Jordan Hand <jorhand@linux.microsoft.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: ipu3.rst: Format media-ctl and yavta commands as code blocks
Date:   Fri, 24 Jul 2020 10:37:38 -0700
Message-Id: <20200724173738.6064-1-jorhand@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jordan Hand <jorhand@linux.microsoft.com>

Fix improper line breaks and format all example yavta and media-ctl
commands as code blocks to improve readability.

Signed-off-by: Jordan Hand <jorhand@linux.microsoft.com>
---

v2:
- Lined up options in hanging indents
- Removed extra newlines
- Broke up long lines in v4l2n command, added backslashes

 Documentation/admin-guide/media/ipu3.rst | 104 ++++++++++++-----------
 1 file changed, 55 insertions(+), 49 deletions(-)

diff --git a/Documentation/admin-guide/media/ipu3.rst b/Documentation/admin-guide/media/ipu3.rst
index 9361c34f123e..a4cd489fc5dc 100644
--- a/Documentation/admin-guide/media/ipu3.rst
+++ b/Documentation/admin-guide/media/ipu3.rst
@@ -89,41 +89,41 @@ Let us take the example of ov5670 sensor connected to CSI2 port 0, for a
 Using the media contorller APIs, the ov5670 sensor is configured to send
 frames in packed raw Bayer format to IPU3 CSI2 receiver.
 
-# This example assumes /dev/media0 as the CIO2 media device
-
-export MDEV=/dev/media0
-
-# and that ov5670 sensor is connected to i2c bus 10 with address 0x36
-
-export SDEV=$(media-ctl -d $MDEV -e "ov5670 10-0036")
+.. code-block:: none
 
-# Establish the link for the media devices using media-ctl [#f3]_
-media-ctl -d $MDEV -l "ov5670:0 -> ipu3-csi2 0:0[1]"
+    # This example assumes /dev/media0 as the CIO2 media device
+    export MDEV=/dev/media0
 
-# Set the format for the media devices
-media-ctl -d $MDEV -V "ov5670:0 [fmt:SGRBG10/2592x1944]"
+    # and that ov5670 sensor is connected to i2c bus 10 with address 0x36
+    export SDEV=$(media-ctl -d $MDEV -e "ov5670 10-0036")
 
-media-ctl -d $MDEV -V "ipu3-csi2 0:0 [fmt:SGRBG10/2592x1944]"
+    # Establish the link for the media devices using media-ctl [#f3]_
+    media-ctl -d $MDEV -l "ov5670:0 -> ipu3-csi2 0:0[1]"
 
-media-ctl -d $MDEV -V "ipu3-csi2 0:1 [fmt:SGRBG10/2592x1944]"
+    # Set the format for the media devices
+    media-ctl -d $MDEV -V "ov5670:0 [fmt:SGRBG10/2592x1944]"
+    media-ctl -d $MDEV -V "ipu3-csi2 0:0 [fmt:SGRBG10/2592x1944]"
+    media-ctl -d $MDEV -V "ipu3-csi2 0:1 [fmt:SGRBG10/2592x1944]"
 
 Once the media pipeline is configured, desired sensor specific settings
 (such as exposure and gain settings) can be set, using the yavta tool.
 
 e.g
 
-yavta -w 0x009e0903 444 $SDEV
-
-yavta -w 0x009e0913 1024 $SDEV
+.. code-block:: none
 
-yavta -w 0x009e0911 2046 $SDEV
+    yavta -w 0x009e0903 444 $SDEV
+    yavta -w 0x009e0913 1024 $SDEV
+    yavta -w 0x009e0911 2046 $SDEV
 
 Once the desired sensor settings are set, frame captures can be done as below.
 
 e.g
 
-yavta --data-prefix -u -c10 -n5 -I -s2592x1944 --file=/tmp/frame-#.bin \
-      -f IPU3_SGRBG10 $(media-ctl -d $MDEV -e "ipu3-cio2 0")
+.. code-block:: none
+
+    yavta --data-prefix -u -c10 -n5 -I -s2592x1944 --file=/tmp/frame-#.bin \
+          -f IPU3_SGRBG10 $(media-ctl -d $MDEV -e "ipu3-cio2 0")
 
 With the above command, 10 frames are captured at 2592x1944 resolution, with
 sGRBG10 format and output as IPU3_SGRBG10 format.
@@ -269,21 +269,21 @@ all the video nodes setup correctly.
 
 Let us take "ipu3-imgu 0" subdev as an example.
 
-media-ctl -d $MDEV -r
-
-media-ctl -d $MDEV -l "ipu3-imgu 0 input":0 -> "ipu3-imgu 0":0[1]
-
-media-ctl -d $MDEV -l "ipu3-imgu 0":2 -> "ipu3-imgu 0 output":0[1]
-
-media-ctl -d $MDEV -l "ipu3-imgu 0":3 -> "ipu3-imgu 0 viewfinder":0[1]
+.. code-block:: none
 
-media-ctl -d $MDEV -l "ipu3-imgu 0":4 -> "ipu3-imgu 0 3a stat":0[1]
+    media-ctl -d $MDEV -r
+    media-ctl -d $MDEV -l "ipu3-imgu 0 input":0 -> "ipu3-imgu 0":0[1]
+    media-ctl -d $MDEV -l "ipu3-imgu 0":2 -> "ipu3-imgu 0 output":0[1]
+    media-ctl -d $MDEV -l "ipu3-imgu 0":3 -> "ipu3-imgu 0 viewfinder":0[1]
+    media-ctl -d $MDEV -l "ipu3-imgu 0":4 -> "ipu3-imgu 0 3a stat":0[1]
 
 Also the pipe mode of the corresponding V4L2 subdev should be set as desired
 (e.g 0 for video mode or 1 for still mode) through the control id 0x009819a1 as
 below.
 
-yavta -w "0x009819A1 1" /dev/v4l-subdev7
+.. code-block:: none
+
+    yavta -w "0x009819A1 1" /dev/v4l-subdev7
 
 Certain hardware blocks in ImgU pipeline can change the frame resolution by
 cropping or scaling, these hardware blocks include Input Feeder(IF), Bayer Down
@@ -371,30 +371,32 @@ v4l2n command can be used. This helps process the raw Bayer frames and produces
 the desired results for the main output image and the viewfinder output, in NV12
 format.
 
-v4l2n --pipe=4 --load=/tmp/frame-#.bin --open=/dev/video4
---fmt=type:VIDEO_OUTPUT_MPLANE,width=2592,height=1944,pixelformat=0X47337069
---reqbufs=type:VIDEO_OUTPUT_MPLANE,count:1 --pipe=1 --output=/tmp/frames.out
---open=/dev/video5
---fmt=type:VIDEO_CAPTURE_MPLANE,width=2560,height=1920,pixelformat=NV12
---reqbufs=type:VIDEO_CAPTURE_MPLANE,count:1 --pipe=2 --output=/tmp/frames.vf
---open=/dev/video6
---fmt=type:VIDEO_CAPTURE_MPLANE,width=2560,height=1920,pixelformat=NV12
---reqbufs=type:VIDEO_CAPTURE_MPLANE,count:1 --pipe=3 --open=/dev/video7
---output=/tmp/frames.3A --fmt=type:META_CAPTURE,?
---reqbufs=count:1,type:META_CAPTURE --pipe=1,2,3,4 --stream=5
+.. code-block:: none
+
+    v4l2n --pipe=4 --load=/tmp/frame-#.bin --open=/dev/video4
+          --fmt=type:VIDEO_OUTPUT_MPLANE,width=2592,height=1944,pixelformat=0X47337069 \
+          --reqbufs=type:VIDEO_OUTPUT_MPLANE,count:1 --pipe=1 \
+          --output=/tmp/frames.out --open=/dev/video5 \
+          --fmt=type:VIDEO_CAPTURE_MPLANE,width=2560,height=1920,pixelformat=NV12 \
+          --reqbufs=type:VIDEO_CAPTURE_MPLANE,count:1 --pipe=2 \
+          --output=/tmp/frames.vf --open=/dev/video6 \
+          --fmt=type:VIDEO_CAPTURE_MPLANE,width=2560,height=1920,pixelformat=NV12 \
+          --reqbufs=type:VIDEO_CAPTURE_MPLANE,count:1 --pipe=3 --open=/dev/video7 \
+          --output=/tmp/frames.3A --fmt=type:META_CAPTURE,? \
+          --reqbufs=count:1,type:META_CAPTURE --pipe=1,2,3,4 --stream=5
 
 You can also use yavta [#f2]_ command to do same thing as above:
 
 .. code-block:: none
 
-	yavta --data-prefix -Bcapture-mplane -c10 -n5 -I -s2592x1944 \
-	--file=frame-#.out-f NV12 /dev/video5 & \
-	yavta --data-prefix -Bcapture-mplane -c10 -n5 -I -s2592x1944 \
-	--file=frame-#.vf -f NV12 /dev/video6 & \
-	yavta --data-prefix -Bmeta-capture -c10 -n5 -I \
-	--file=frame-#.3a /dev/video7 & \
-	yavta --data-prefix -Boutput-mplane -c10 -n5 -I -s2592x1944 \
-	--file=/tmp/frame-in.cio2 -f IPU3_SGRBG10 /dev/video4
+    yavta --data-prefix -Bcapture-mplane -c10 -n5 -I -s2592x1944 \
+          --file=frame-#.out-f NV12 /dev/video5 & \
+    yavta --data-prefix -Bcapture-mplane -c10 -n5 -I -s2592x1944 \
+          --file=frame-#.vf -f NV12 /dev/video6 & \
+    yavta --data-prefix -Bmeta-capture -c10 -n5 -I \
+          --file=frame-#.3a /dev/video7 & \
+    yavta --data-prefix -Boutput-mplane -c10 -n5 -I -s2592x1944 \
+          --file=/tmp/frame-in.cio2 -f IPU3_SGRBG10 /dev/video4
 
 where /dev/video4, /dev/video5, /dev/video6 and /dev/video7 devices point to
 input, output, viewfinder and 3A statistics video nodes respectively.
@@ -408,7 +410,9 @@ as below.
 Main output frames
 ~~~~~~~~~~~~~~~~~~
 
-raw2pnm -x2560 -y1920 -fNV12 /tmp/frames.out /tmp/frames.out.ppm
+.. code-block:: none
+
+    raw2pnm -x2560 -y1920 -fNV12 /tmp/frames.out /tmp/frames.out.ppm
 
 where 2560x1920 is output resolution, NV12 is the video format, followed
 by input frame and output PNM file.
@@ -416,7 +420,9 @@ by input frame and output PNM file.
 Viewfinder output frames
 ~~~~~~~~~~~~~~~~~~~~~~~~
 
-raw2pnm -x2560 -y1920 -fNV12 /tmp/frames.vf /tmp/frames.vf.ppm
+.. code-block:: none
+
+    raw2pnm -x2560 -y1920 -fNV12 /tmp/frames.vf /tmp/frames.vf.ppm
 
 where 2560x1920 is output resolution, NV12 is the video format, followed
 by input frame and output PNM file.
-- 
2.17.1

