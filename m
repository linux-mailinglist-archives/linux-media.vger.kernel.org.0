Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F33DBB012
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 10:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731186AbfIWI5a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 04:57:30 -0400
Received: from retiisi.org.uk ([95.216.213.190]:50562 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729483AbfIWI5a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 04:57:30 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1001])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 89D87634C87;
        Mon, 23 Sep 2019 11:56:27 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH 1/1] v4l: Put camera sensor, lens and flash drivers under MEDIA_CAMERA_SUPPORT
Date:   Mon, 23 Sep 2019 11:54:20 +0300
Message-Id: <20190923085420.14269-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of individually depending on MEDIA_CAMERA_SUPPORT (or forgetting
it), put all camera sensor, lens and flash drivers under
MEDIA_CAMERA_SUPPORT as a whole. The lens VCM devices didn't use to do
this, but make them depend on MEDIA_CAMERA_SUPPORT as well since there's
no use for these devices without that in practice.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/Kconfig | 51 +++++++++------------------------------
 1 file changed, 11 insertions(+), 40 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index fcffcc31d168..3ef778819c5f 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -566,10 +566,11 @@ config VIDEO_APTINA_PLL
 config VIDEO_SMIAPP_PLL
 	tristate
 
+if MEDIA_CAMERA_SUPPORT
+
 config VIDEO_IMX214
 	tristate "Sony IMX214 sensor support"
 	depends on GPIOLIB && I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on MEDIA_CAMERA_SUPPORT
 	depends on V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -581,7 +582,6 @@ config VIDEO_IMX214
 config VIDEO_IMX258
 	tristate "Sony IMX258 sensor support"
 	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on MEDIA_CAMERA_SUPPORT
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX258 camera.
@@ -592,7 +592,6 @@ config VIDEO_IMX258
 config VIDEO_IMX274
 	tristate "Sony IMX274 sensor support"
 	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on MEDIA_CAMERA_SUPPORT
 	select REGMAP_I2C
 	help
 	  This is a V4L2 sensor driver for the Sony IMX274
@@ -601,7 +600,6 @@ config VIDEO_IMX274
 config VIDEO_IMX319
 	tristate "Sony IMX319 sensor support"
 	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on MEDIA_CAMERA_SUPPORT
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX319 camera.
@@ -612,7 +610,6 @@ config VIDEO_IMX319
 config VIDEO_IMX355
 	tristate "Sony IMX355 sensor support"
 	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on MEDIA_CAMERA_SUPPORT
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX355 camera.
@@ -623,7 +620,6 @@ config VIDEO_IMX355
 config VIDEO_OV2640
 	tristate "OmniVision OV2640 sensor support"
 	depends on VIDEO_V4L2 && I2C
-	depends on MEDIA_CAMERA_SUPPORT
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV2640 camera.
@@ -634,7 +630,6 @@ config VIDEO_OV2640
 config VIDEO_OV2659
 	tristate "OmniVision OV2659 sensor support"
 	depends on VIDEO_V4L2 && I2C
-	depends on MEDIA_CAMERA_SUPPORT
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -646,7 +641,6 @@ config VIDEO_OV2659
 config VIDEO_OV2680
 	tristate "OmniVision OV2680 sensor support"
 	depends on VIDEO_V4L2 && I2C && MEDIA_CONTROLLER
-	depends on MEDIA_CAMERA_SUPPORT
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -658,7 +652,6 @@ config VIDEO_OV2680
 config VIDEO_OV2685
 	tristate "OmniVision OV2685 sensor support"
 	depends on VIDEO_V4L2 && I2C && MEDIA_CONTROLLER
-	depends on MEDIA_CAMERA_SUPPORT
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -671,7 +664,6 @@ config VIDEO_OV5640
 	tristate "OmniVision OV5640 sensor support"
 	depends on OF
 	depends on GPIOLIB && VIDEO_V4L2 && I2C && VIDEO_V4L2_SUBDEV_API
-	depends on MEDIA_CAMERA_SUPPORT
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the Omnivision
@@ -681,7 +673,6 @@ config VIDEO_OV5645
 	tristate "OmniVision OV5645 sensor support"
 	depends on OF
 	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on MEDIA_CAMERA_SUPPORT
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -693,7 +684,6 @@ config VIDEO_OV5645
 config VIDEO_OV5647
 	tristate "OmniVision OV5647 sensor support"
 	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on MEDIA_CAMERA_SUPPORT
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -705,7 +695,6 @@ config VIDEO_OV5647
 config VIDEO_OV6650
 	tristate "OmniVision OV6650 sensor support"
 	depends on I2C && VIDEO_V4L2
-	depends on MEDIA_CAMERA_SUPPORT
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV6650 camera.
@@ -716,7 +705,6 @@ config VIDEO_OV6650
 config VIDEO_OV5670
 	tristate "OmniVision OV5670 sensor support"
 	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on MEDIA_CAMERA_SUPPORT
 	depends on MEDIA_CONTROLLER
 	select V4L2_FWNODE
 	help
@@ -729,7 +717,6 @@ config VIDEO_OV5670
 config VIDEO_OV5675
 	tristate "OmniVision OV5675 sensor support"
 	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on MEDIA_CAMERA_SUPPORT
 	depends on MEDIA_CONTROLLER
 	select V4L2_FWNODE
 	help
@@ -742,7 +729,6 @@ config VIDEO_OV5675
 config VIDEO_OV5695
 	tristate "OmniVision OV5695 sensor support"
 	depends on I2C && VIDEO_V4L2
-	depends on MEDIA_CAMERA_SUPPORT
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5695 camera.
@@ -753,7 +739,6 @@ config VIDEO_OV5695
 config VIDEO_OV7251
 	tristate "OmniVision OV7251 sensor support"
 	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on MEDIA_CAMERA_SUPPORT
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -765,7 +750,6 @@ config VIDEO_OV7251
 config VIDEO_OV772X
 	tristate "OmniVision OV772x sensor support"
 	depends on I2C && VIDEO_V4L2
-	depends on MEDIA_CAMERA_SUPPORT
 	select REGMAP_SCCB
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -777,7 +761,6 @@ config VIDEO_OV772X
 config VIDEO_OV7640
 	tristate "OmniVision OV7640 sensor support"
 	depends on I2C && VIDEO_V4L2
-	depends on MEDIA_CAMERA_SUPPORT
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV7640 camera.
@@ -788,7 +771,6 @@ config VIDEO_OV7640
 config VIDEO_OV7670
 	tristate "OmniVision OV7670 sensor support"
 	depends on I2C && VIDEO_V4L2
-	depends on MEDIA_CAMERA_SUPPORT
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -798,7 +780,6 @@ config VIDEO_OV7670
 config VIDEO_OV7740
 	tristate "OmniVision OV7740 sensor support"
 	depends on I2C && VIDEO_V4L2
-	depends on MEDIA_CAMERA_SUPPORT
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV7740 VGA camera sensor.
@@ -806,7 +787,6 @@ config VIDEO_OV7740
 config VIDEO_OV8856
 	tristate "OmniVision OV8856 sensor support"
 	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on MEDIA_CAMERA_SUPPORT
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -833,7 +813,6 @@ config VIDEO_OV9650
 config VIDEO_OV13858
 	tristate "OmniVision OV13858 sensor support"
 	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on MEDIA_CAMERA_SUPPORT
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -842,7 +821,6 @@ config VIDEO_OV13858
 config VIDEO_VS6624
 	tristate "ST VS6624 sensor support"
 	depends on VIDEO_V4L2 && I2C
-	depends on MEDIA_CAMERA_SUPPORT
 	help
 	  This is a Video4Linux2 sensor driver for the ST VS6624
 	  camera.
@@ -853,7 +831,6 @@ config VIDEO_VS6624
 config VIDEO_MT9M001
 	tristate "mt9m001 support"
 	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on MEDIA_CAMERA_SUPPORT
 	help
 	  This driver supports MT9M001 cameras from Micron, monochrome
 	  and colour models.
@@ -861,7 +838,6 @@ config VIDEO_MT9M001
 config VIDEO_MT9M032
 	tristate "MT9M032 camera sensor support"
 	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on MEDIA_CAMERA_SUPPORT
 	select VIDEO_APTINA_PLL
 	help
 	  This driver supports MT9M032 camera sensors from Aptina, monochrome
@@ -878,7 +854,6 @@ config VIDEO_MT9M111
 config VIDEO_MT9P031
 	tristate "Aptina MT9P031 support"
 	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on MEDIA_CAMERA_SUPPORT
 	select VIDEO_APTINA_PLL
 	help
 	  This is a Video4Linux2 sensor driver for the Aptina
@@ -887,7 +862,6 @@ config VIDEO_MT9P031
 config VIDEO_MT9T001
 	tristate "Aptina MT9T001 support"
 	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on MEDIA_CAMERA_SUPPORT
 	help
 	  This is a Video4Linux2 sensor driver for the Aptina
 	  (Micron) mt0t001 3 Mpixel camera.
@@ -895,7 +869,6 @@ config VIDEO_MT9T001
 config VIDEO_MT9T112
 	tristate "Aptina MT9T111/MT9T112 support"
 	depends on I2C && VIDEO_V4L2
-	depends on MEDIA_CAMERA_SUPPORT
 	help
 	  This is a Video4Linux2 sensor driver for the Aptina
 	  (Micron) MT9T111 and MT9T112 3 Mpixel camera.
@@ -906,7 +879,6 @@ config VIDEO_MT9T112
 config VIDEO_MT9V011
 	tristate "Micron mt9v011 sensor support"
 	depends on I2C && VIDEO_V4L2
-	depends on MEDIA_CAMERA_SUPPORT
 	help
 	  This is a Video4Linux2 sensor driver for the Micron
 	  mt0v011 1.3 Mpixel camera.  It currently only works with the
@@ -915,7 +887,6 @@ config VIDEO_MT9V011
 config VIDEO_MT9V032
 	tristate "Micron MT9V032 sensor support"
 	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on MEDIA_CAMERA_SUPPORT
 	select REGMAP_I2C
 	select V4L2_FWNODE
 	help
@@ -925,7 +896,6 @@ config VIDEO_MT9V032
 config VIDEO_MT9V111
 	tristate "Aptina MT9V111 sensor support"
 	depends on I2C && VIDEO_V4L2
-	depends on MEDIA_CAMERA_SUPPORT
 	help
 	  This is a Video4Linux2 sensor driver for the Aptina/Micron
 	  MT9V111 sensor.
@@ -936,14 +906,12 @@ config VIDEO_MT9V111
 config VIDEO_SR030PC30
 	tristate "Siliconfile SR030PC30 sensor support"
 	depends on I2C && VIDEO_V4L2
-	depends on MEDIA_CAMERA_SUPPORT
 	help
 	  This driver supports SR030PC30 VGA camera from Siliconfile
 
 config VIDEO_NOON010PC30
 	tristate "Siliconfile NOON010PC30 sensor support"
 	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on MEDIA_CAMERA_SUPPORT
 	help
 	  This driver supports NOON010PC30 CIF camera from Siliconfile
 
@@ -952,7 +920,6 @@ source "drivers/media/i2c/m5mols/Kconfig"
 config VIDEO_RJ54N1
 	tristate "Sharp RJ54N1CB0C sensor support"
 	depends on I2C && VIDEO_V4L2
-	depends on MEDIA_CAMERA_SUPPORT
 	help
 	  This is a V4L2 sensor driver for Sharp RJ54N1CB0C CMOS image
 	  sensor.
@@ -962,7 +929,6 @@ config VIDEO_RJ54N1
 
 config VIDEO_S5K6AA
 	tristate "Samsung S5K6AAFX sensor support"
-	depends on MEDIA_CAMERA_SUPPORT
 	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
 	help
 	  This is a V4L2 sensor driver for Samsung S5K6AA(FX) 1.3M
@@ -970,7 +936,6 @@ config VIDEO_S5K6AA
 
 config VIDEO_S5K6A3
 	tristate "Samsung S5K6A3 sensor support"
-	depends on MEDIA_CAMERA_SUPPORT
 	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
 	help
 	  This is a V4L2 sensor driver for Samsung S5K6A3 raw
@@ -1002,9 +967,12 @@ config VIDEO_S5C73M3
 	help
 	  This is a V4L2 sensor driver for Samsung S5C73M3
 	  8 Mpixel camera.
+endif
 
 comment "Lens drivers"
 
+if MEDIA_CAMERA_SUPPORT
+
 config VIDEO_AD5820
 	tristate "AD5820 lens voice coil support"
 	depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
@@ -1042,12 +1010,15 @@ config VIDEO_DW9807_VCM
 	  capability. This is designed for linear control of
 	  voice coil motors, controlled via I2C serial interface.
 
+endif
+
 comment "Flash devices"
 
+if MEDIA_CAMERA_SUPPORT
+
 config VIDEO_ADP1653
 	tristate "ADP1653 flash support"
 	depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
-	depends on MEDIA_CAMERA_SUPPORT
 	help
 	  This is a driver for the ADP1653 flash controller. It is used for
 	  example in Nokia N900.
@@ -1055,7 +1026,6 @@ config VIDEO_ADP1653
 config VIDEO_LM3560
 	tristate "LM3560 dual flash driver support"
 	depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
-	depends on MEDIA_CAMERA_SUPPORT
 	select REGMAP_I2C
 	help
 	  This is a driver for the lm3560 dual flash controllers. It controls
@@ -1064,12 +1034,13 @@ config VIDEO_LM3560
 config VIDEO_LM3646
 	tristate "LM3646 dual flash driver support"
 	depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
-	depends on MEDIA_CAMERA_SUPPORT
 	select REGMAP_I2C
 	help
 	  This is a driver for the lm3646 dual flash controllers. It controls
 	  flash, torch LEDs.
 
+endif
+
 comment "Video improvement chips"
 
 config VIDEO_UPD64031A
-- 
2.20.1

