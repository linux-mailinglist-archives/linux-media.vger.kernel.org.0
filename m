Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3CD0330ACC
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 11:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231570AbhCHKDH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 05:03:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231545AbhCHKDA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Mar 2021 05:03:00 -0500
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A00D6C06174A
        for <linux-media@vger.kernel.org>; Mon,  8 Mar 2021 02:02:59 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 9D72F634C87;
        Mon,  8 Mar 2021 12:00:29 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com
Subject: [PATCH 1/1] v4l: async, fwnode: Improve module organisation
Date:   Mon,  8 Mar 2021 12:02:56 +0200
Message-Id: <20210308100256.26270-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2 async framework is generally used with the V4L2 fwnode, which
also depends on the former. There is only one exception, the CAFE_CCIC
driver, which uses V4L2 async but does not need V4L2 fwnode.

At the same time there is a vast number of systems that need videodev
module, but have no use for v4l2-async that's now part of videodev.

In order to improve, build v4l2-async and v4l2-fwnode as a single module
called v4l2-async (the v4l2-async.c file is renamed as v4l2-async-core.c).
Also the menu item V4L2_FWNODE is renamed as V4L2_ASYNC.

This also moves the initialisation of the debufs entries for async subdevs
to loading of the v4l2-async module. The directory is named as
"v4l2-async".

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
This goes on top of my recent async patches.

 drivers/media/i2c/Kconfig                     | 80 +++++++++----------
 drivers/media/i2c/ccs/Kconfig                 |  2 +-
 drivers/media/i2c/et8ek8/Kconfig              |  2 +-
 drivers/media/pci/intel/ipu3/Kconfig          |  2 +-
 drivers/media/platform/Kconfig                | 16 ++--
 drivers/media/platform/am437x/Kconfig         |  2 +-
 drivers/media/platform/atmel/Kconfig          |  4 +-
 drivers/media/platform/cadence/Kconfig        |  4 +-
 drivers/media/platform/davinci/Kconfig        |  2 +-
 drivers/media/platform/exynos4-is/Kconfig     |  4 +-
 drivers/media/platform/marvell-ccic/Kconfig   |  1 +
 drivers/media/platform/rcar-vin/Kconfig       |  4 +-
 .../media/platform/sunxi/sun4i-csi/Kconfig    |  2 +-
 .../media/platform/sunxi/sun6i-csi/Kconfig    |  2 +-
 drivers/media/platform/xilinx/Kconfig         |  2 +-
 drivers/media/v4l2-core/Kconfig               |  3 +-
 drivers/media/v4l2-core/Makefile              |  6 +-
 .../{v4l2-async.c => v4l2-async-core.c}       | 23 +++++-
 drivers/media/v4l2-core/v4l2-dev.c            |  5 --
 drivers/staging/media/imx/Kconfig             |  2 +-
 drivers/staging/media/tegra-video/Kconfig     |  2 +-
 21 files changed, 94 insertions(+), 76 deletions(-)
 rename drivers/media/v4l2-core/{v4l2-async.c => v4l2-async-core.c} (96%)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 462c0e059754..4f9aeefa8a86 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -70,7 +70,7 @@ config VIDEO_TDA1997X
 	depends on SND_SOC
 	select HDMI
 	select SND_PCM
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	help
@@ -240,7 +240,7 @@ config VIDEO_ADV748X
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP_I2C
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  V4L2 subdevice driver for the Analog Devices
 	  ADV7481 and ADV7482 HDMI/Analog video decoders.
@@ -256,7 +256,7 @@ config VIDEO_ADV7604
 	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP_I2C
 	select HDMI
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  Support for the Analog Devices ADV7604 video decoder.
 
@@ -369,7 +369,7 @@ config VIDEO_TC358743
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select HDMI
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  Support for the Toshiba TC358743 HDMI to MIPI CSI-2 bridge.
 
@@ -387,7 +387,7 @@ config VIDEO_TC358743_CEC
 config VIDEO_TVP514X
 	tristate "Texas Instruments TVP514x video decoder"
 	depends on VIDEO_V4L2 && I2C
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for the TI TVP5146/47
 	  decoder. It is currently working with the TI OMAP3 camera
@@ -399,7 +399,7 @@ config VIDEO_TVP514X
 config VIDEO_TVP5150
 	tristate "Texas Instruments TVP5150 video decoder"
 	depends on VIDEO_V4L2 && I2C
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	select REGMAP_I2C
 	help
 	  Support for the Texas Instruments TVP5150 video decoder.
@@ -410,7 +410,7 @@ config VIDEO_TVP5150
 config VIDEO_TVP7002
 	tristate "Texas Instruments TVP7002 video decoder"
 	depends on VIDEO_V4L2 && I2C
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  Support for the Texas Instruments TVP7002 video decoder.
 
@@ -468,7 +468,7 @@ config VIDEO_MAX9286
 	tristate "Maxim MAX9286 GMSL deserializer support"
 	depends on I2C && I2C_MUX
 	depends on OF_GPIO
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
 	help
@@ -702,7 +702,7 @@ config VIDEO_ST_MIPID02
 	depends on I2C && VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  Support for STMicroelectronics MIPID02 CSI-2 to PARALLEL bridge.
 	  It is used to allow usage of CSI-2 sensor with PARALLEL port
@@ -730,7 +730,7 @@ config VIDEO_HI556
 	depends on I2C && VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for the Hynix
 	  Hi-556 camera.
@@ -741,7 +741,7 @@ config VIDEO_HI556
 config VIDEO_IMX214
 	tristate "Sony IMX214 sensor support"
 	depends on GPIOLIB && I2C && VIDEO_V4L2
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP_I2C
@@ -757,7 +757,7 @@ config VIDEO_IMX219
 	depends on I2C && VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX219 camera.
@@ -793,7 +793,7 @@ config VIDEO_IMX290
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP_I2C
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX290 camera sensor.
@@ -819,7 +819,7 @@ config VIDEO_IMX334
 	depends on I2C && VIDEO_V4L2
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX334 camera.
@@ -844,7 +844,7 @@ config VIDEO_OV02A10
 	depends on VIDEO_V4L2 && I2C
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV02A10 camera.
@@ -865,7 +865,7 @@ config VIDEO_OV2640
 config VIDEO_OV2659
 	tristate "OmniVision OV2659 sensor support"
 	depends on VIDEO_V4L2 && I2C && GPIOLIB
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV2659 camera.
@@ -877,7 +877,7 @@ config VIDEO_OV2680
 	tristate "OmniVision OV2680 sensor support"
 	depends on VIDEO_V4L2 && I2C
 	select MEDIA_CONTROLLER
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV2680 camera.
@@ -889,7 +889,7 @@ config VIDEO_OV2685
 	tristate "OmniVision OV2685 sensor support"
 	depends on VIDEO_V4L2 && I2C
 	select MEDIA_CONTROLLER
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV2685 camera.
@@ -903,7 +903,7 @@ config VIDEO_OV2740
 	depends on ACPI || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	select REGMAP_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -918,7 +918,7 @@ config VIDEO_OV5640
 	depends on GPIOLIB && VIDEO_V4L2 && I2C
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for the Omnivision
 	  OV5640 camera sensor with a MIPI CSI-2 interface.
@@ -929,7 +929,7 @@ config VIDEO_OV5645
 	depends on I2C && VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5645 camera.
@@ -942,7 +942,7 @@ config VIDEO_OV5647
 	depends on I2C && VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5647 camera.
@@ -955,7 +955,7 @@ config VIDEO_OV5648
 	depends on I2C && PM && VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5648 camera.
@@ -978,7 +978,7 @@ config VIDEO_OV5670
 	depends on I2C && VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5670 camera.
@@ -991,7 +991,7 @@ config VIDEO_OV5675
 	depends on I2C && VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5675 camera.
@@ -1002,7 +1002,7 @@ config VIDEO_OV5675
 config VIDEO_OV5695
 	tristate "OmniVision OV5695 sensor support"
 	depends on I2C && VIDEO_V4L2
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5695 camera.
@@ -1015,7 +1015,7 @@ config VIDEO_OV7251
 	depends on I2C && VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV7251 camera.
@@ -1027,7 +1027,7 @@ config VIDEO_OV772X
 	tristate "OmniVision OV772x sensor support"
 	depends on I2C && VIDEO_V4L2
 	select REGMAP_SCCB
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV772x camera.
@@ -1048,7 +1048,7 @@ config VIDEO_OV7640
 config VIDEO_OV7670
 	tristate "OmniVision OV7670 sensor support"
 	depends on I2C && VIDEO_V4L2
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV7670 VGA camera.  It currently only works with the M88ALP01
@@ -1067,7 +1067,7 @@ config VIDEO_OV8856
 	depends on I2C && VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV8856 camera sensor.
@@ -1080,7 +1080,7 @@ config VIDEO_OV8865
 	depends on I2C && PM && VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for OmniVision
 	  OV8865 camera sensor.
@@ -1111,7 +1111,7 @@ config VIDEO_OV9734
 	depends on ACPI || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV9734 camera.
@@ -1124,7 +1124,7 @@ config VIDEO_OV13858
 	depends on I2C && VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV13858 camera.
@@ -1161,7 +1161,7 @@ config VIDEO_MT9M032
 config VIDEO_MT9M111
 	tristate "mt9m111, mt9m112 and mt9m131 support"
 	depends on I2C && VIDEO_V4L2
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This driver supports MT9M111, MT9M112 and MT9M131 cameras from
 	  Micron/Aptina
@@ -1209,7 +1209,7 @@ config VIDEO_MT9V032
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP_I2C
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for the Micron
 	  MT9V032 752x480 CMOS sensor.
@@ -1246,7 +1246,7 @@ config VIDEO_MAX9271_LIB
 config VIDEO_RDACM20
 	tristate "IMI RDACM20 camera support"
 	depends on I2C
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
 	select VIDEO_MAX9271_LIB
@@ -1260,7 +1260,7 @@ config VIDEO_RDACM20
 config VIDEO_RDACM21
 	tristate "IMI RDACM21 camera support"
 	depends on I2C
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
 	select VIDEO_MAX9271_LIB
@@ -1314,7 +1314,7 @@ config VIDEO_S5K5BAF
 	depends on I2C && VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a V4L2 sensor driver for Samsung S5K5BAF 2M
 	  camera sensor with an embedded SoC image signal processor.
@@ -1327,7 +1327,7 @@ config VIDEO_S5C73M3
 	depends on I2C && SPI && VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a V4L2 sensor driver for Samsung S5C73M3
 	  8 Mpixel camera.
@@ -1372,7 +1372,7 @@ config VIDEO_DW9768
 	depends on I2C && VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a driver for the DW9768 camera lens voice coil.
 	  DW9768 is a 10 bit DAC with 100mA output current sink
diff --git a/drivers/media/i2c/ccs/Kconfig b/drivers/media/i2c/ccs/Kconfig
index 59f35b33ddc1..837c94a5247d 100644
--- a/drivers/media/i2c/ccs/Kconfig
+++ b/drivers/media/i2c/ccs/Kconfig
@@ -5,7 +5,7 @@ config VIDEO_CCS
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEO_CCS_PLL
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a generic driver for MIPI CCS, SMIA++ and SMIA compliant
 	  camera sensors.
diff --git a/drivers/media/i2c/et8ek8/Kconfig b/drivers/media/i2c/et8ek8/Kconfig
index afcc4ea764f6..d54eeace8c73 100644
--- a/drivers/media/i2c/et8ek8/Kconfig
+++ b/drivers/media/i2c/et8ek8/Kconfig
@@ -4,7 +4,7 @@ config VIDEO_ET8EK8
 	depends on I2C && VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a driver for the Toshiba ET8EK8 5 MP camera sensor.
 	  It is used for example in Nokia N900 (RX-51).
diff --git a/drivers/media/pci/intel/ipu3/Kconfig b/drivers/media/pci/intel/ipu3/Kconfig
index dce8274c81e6..2858f9e1ad76 100644
--- a/drivers/media/pci/intel/ipu3/Kconfig
+++ b/drivers/media/pci/intel/ipu3/Kconfig
@@ -6,7 +6,7 @@ config VIDEO_IPU3_CIO2
 	depends on X86
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	select VIDEOBUF2_DMA_SG
 
 	help
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index fd1831e97b22..3ccd06f8bfc5 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -67,7 +67,7 @@ config VIDEO_MUX
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This driver provides support for N:1 video bus multiplexers.
 
@@ -81,7 +81,7 @@ config VIDEO_OMAP3
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
 	select MFD_SYSCON
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  Driver for an OMAP 3 camera controller.
 
@@ -97,7 +97,7 @@ config VIDEO_PXA27x
 	depends on PXA27x || COMPILE_TEST
 	select VIDEOBUF2_DMA_SG
 	select SG_SPLIT
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a v4l2 driver for the PXA27x Quick Capture Interface
 
@@ -108,7 +108,7 @@ config VIDEO_QCOM_CAMSS
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_SG
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 
 config VIDEO_S3C_CAMIF
 	tristate "Samsung S3C24XX/S3C64XX SoC Camera Interface driver"
@@ -130,7 +130,7 @@ config VIDEO_STM32_DCMI
 	depends on ARCH_STM32 || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select MEDIA_CONTROLLER
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This module makes the STM32 Digital Camera Memory Interface (DCMI)
 	  available as a v4l2 device.
@@ -143,7 +143,7 @@ config VIDEO_RENESAS_CEU
 	depends on VIDEO_DEV && VIDEO_V4L2
 	depends on ARCH_SHMOBILE || ARCH_R7S72100 || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a v4l2 driver for the Renesas CEU Interface
 
@@ -155,7 +155,7 @@ config VIDEO_ROCKCHIP_ISP1
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_VMALLOC
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	select GENERIC_PHY_MIPI_DPHY
 	default n
 	help
@@ -179,7 +179,7 @@ config VIDEO_TI_CAL
 	select VIDEO_V4L2_SUBDEV_API
 	depends on SOC_DRA7XX || ARCH_K3 || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  Support for the TI CAL (Camera Adaptation Layer) block
 	  found on DRA72X SoC.
diff --git a/drivers/media/platform/am437x/Kconfig b/drivers/media/platform/am437x/Kconfig
index 9ef898f512de..cd7ba318fbb8 100644
--- a/drivers/media/platform/am437x/Kconfig
+++ b/drivers/media/platform/am437x/Kconfig
@@ -6,7 +6,7 @@ config VIDEO_AM437X_VPFE
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	   Support for AM437x Video Processing Front End based Video
 	   Capture Driver.
diff --git a/drivers/media/platform/atmel/Kconfig b/drivers/media/platform/atmel/Kconfig
index 1850fe7f9360..52f427845610 100644
--- a/drivers/media/platform/atmel/Kconfig
+++ b/drivers/media/platform/atmel/Kconfig
@@ -7,7 +7,7 @@ config VIDEO_ATMEL_ISC
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
 	select REGMAP_MMIO
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	   This module makes the ATMEL Image Sensor Controller available
 	   as a v4l2 device.
@@ -17,7 +17,7 @@ config VIDEO_ATMEL_ISI
 	depends on VIDEO_V4L2 && OF
 	depends on ARCH_AT91 || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This module makes the ATMEL Image Sensor Interface available
 	  as a v4l2 device.
diff --git a/drivers/media/platform/cadence/Kconfig b/drivers/media/platform/cadence/Kconfig
index 80cf601323ce..5cb54d661e83 100644
--- a/drivers/media/platform/cadence/Kconfig
+++ b/drivers/media/platform/cadence/Kconfig
@@ -15,7 +15,7 @@ config VIDEO_CADENCE_CSI2RX
 	depends on VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  Support for the Cadence MIPI CSI2 Receiver controller.
 
@@ -27,7 +27,7 @@ config VIDEO_CADENCE_CSI2TX
 	depends on VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  Support for the Cadence MIPI CSI2 Transceiver controller.
 
diff --git a/drivers/media/platform/davinci/Kconfig b/drivers/media/platform/davinci/Kconfig
index 9d2a9eeb3499..ca7c61fbc4d3 100644
--- a/drivers/media/platform/davinci/Kconfig
+++ b/drivers/media/platform/davinci/Kconfig
@@ -21,7 +21,7 @@ config VIDEO_DAVINCI_VPIF_CAPTURE
 	depends on ARCH_DAVINCI || COMPILE_TEST
 	depends on I2C
 	select VIDEOBUF2_DMA_CONTIG
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  Enables Davinci VPIF module used for capture devices.
 	  This module is used for capture on TI DM6467/DA850/OMAPL138
diff --git a/drivers/media/platform/exynos4-is/Kconfig b/drivers/media/platform/exynos4-is/Kconfig
index 136d3b2a0fbb..c97393bc334e 100644
--- a/drivers/media/platform/exynos4-is/Kconfig
+++ b/drivers/media/platform/exynos4-is/Kconfig
@@ -6,7 +6,7 @@ config VIDEO_SAMSUNG_EXYNOS4_IS
 	depends on ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  Say Y here to enable camera host interface devices for
 	  Samsung S5P and EXYNOS SoC series.
@@ -35,7 +35,7 @@ config VIDEO_S5P_MIPI_CSIS
 	tristate "S5P/EXYNOS MIPI-CSI2 receiver (MIPI-CSIS) driver"
 	depends on REGULATOR
 	select GENERIC_PHY
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a V4L2 driver for Samsung S5P and EXYNOS4 SoC MIPI-CSI2
 	  receiver (MIPI-CSIS) devices.
diff --git a/drivers/media/platform/marvell-ccic/Kconfig b/drivers/media/platform/marvell-ccic/Kconfig
index 3e3f86264762..88eefffe68c2 100644
--- a/drivers/media/platform/marvell-ccic/Kconfig
+++ b/drivers/media/platform/marvell-ccic/Kconfig
@@ -7,6 +7,7 @@ config VIDEO_CAFE_CCIC
 	select VIDEOBUF2_VMALLOC
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_DMA_SG
+	select V4L2_ASYNC
 	help
 	  This is a video4linux2 driver for the Marvell 88ALP01 integrated
 	  CMOS camera controller.  This is the controller found on first-
diff --git a/drivers/media/platform/rcar-vin/Kconfig b/drivers/media/platform/rcar-vin/Kconfig
index 030312d862e7..bf9d724f121c 100644
--- a/drivers/media/platform/rcar-vin/Kconfig
+++ b/drivers/media/platform/rcar-vin/Kconfig
@@ -6,7 +6,7 @@ config VIDEO_RCAR_CSI2
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select RESET_CONTROLLER
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  Support for Renesas R-Car MIPI CSI-2 receiver.
 	  Supports R-Car Gen3 and RZ/G2 SoCs.
@@ -21,7 +21,7 @@ config VIDEO_RCAR_VIN
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  Support for Renesas R-Car Video Input (VIN) driver.
 	  Supports R-Car Gen{2,3} and RZ/G{1,2} SoCs.
diff --git a/drivers/media/platform/sunxi/sun4i-csi/Kconfig b/drivers/media/platform/sunxi/sun4i-csi/Kconfig
index 903c6152f6e8..4ae510b51310 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/Kconfig
+++ b/drivers/media/platform/sunxi/sun4i-csi/Kconfig
@@ -7,7 +7,7 @@ config VIDEO_SUN4I_CSI
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  This is a V4L2 driver for the Allwinner A10 CSI
 
diff --git a/drivers/media/platform/sunxi/sun6i-csi/Kconfig b/drivers/media/platform/sunxi/sun6i-csi/Kconfig
index 586e3fb3a80d..6815f73027d5 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/Kconfig
+++ b/drivers/media/platform/sunxi/sun6i-csi/Kconfig
@@ -7,6 +7,6 @@ config VIDEO_SUN6I_CSI
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
 	select REGMAP_MMIO
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	   Support for the Allwinner Camera Sensor Interface Controller on V3s.
diff --git a/drivers/media/platform/xilinx/Kconfig b/drivers/media/platform/xilinx/Kconfig
index 44587dccacf1..7d6b1b04b007 100644
--- a/drivers/media/platform/xilinx/Kconfig
+++ b/drivers/media/platform/xilinx/Kconfig
@@ -6,7 +6,7 @@ config VIDEO_XILINX
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  Driver for Xilinx Video IP Pipelines
 
diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index bf49f83cb86f..26e12db0a4e8 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -62,13 +62,14 @@ config V4L2_FLASH_LED_CLASS
 	tristate "V4L2 flash API for LED flash class devices"
 	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
 	depends on LEDS_CLASS_FLASH
+	select V4L2_ASYNC
 	help
 	  Say Y here to enable V4L2 flash API support for LED flash
 	  class drivers.
 
 	  When in doubt, say N.
 
-config V4L2_FWNODE
+config V4L2_ASYNC
 	tristate
 
 # Used by drivers that need Videobuf modules
diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index e4cd589b99a5..298ca6ba4f32 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -7,14 +7,16 @@ tuner-objs	:=	tuner-core.o
 
 videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
 			v4l2-event.o v4l2-ctrls.o v4l2-subdev.o \
-			v4l2-async.o v4l2-common.o
+			v4l2-common.o
 videodev-$(CONFIG_COMPAT) += v4l2-compat-ioctl32.o
 videodev-$(CONFIG_TRACEPOINTS) += v4l2-trace.o
 videodev-$(CONFIG_MEDIA_CONTROLLER) += v4l2-mc.o
 videodev-$(CONFIG_SPI) += v4l2-spi.o
 videodev-$(CONFIG_VIDEO_V4L2_I2C) += v4l2-i2c.o
 
-obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
+v4l2-async-objs :=	v4l2-async-core.o v4l2-fwnode.o
+
+obj-$(CONFIG_V4L2_ASYNC) += v4l2-async.o
 obj-$(CONFIG_VIDEO_V4L2) += videodev.o
 obj-$(CONFIG_VIDEO_V4L2) += v4l2-dv-timings.o
 
diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async-core.c
similarity index 96%
rename from drivers/media/v4l2-core/v4l2-async.c
rename to drivers/media/v4l2-core/v4l2-async-core.c
index 21b3890b96fc..6e49386f0284 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async-core.c
@@ -852,8 +852,27 @@ static int pending_subdevs_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(pending_subdevs);
 
-void v4l2_async_debug_init(struct dentry *debugfs_dir)
+static struct dentry *v4l2_async_debugfs_dir;
+
+static int __init v4l2_async_init(void)
 {
-	debugfs_create_file("pending_async_subdevices", 0444, debugfs_dir, NULL,
+	v4l2_async_debugfs_dir = debugfs_create_dir("v4l2-async", NULL);
+	debugfs_create_file("pending_async_subdevices", 0444,
+			    v4l2_async_debugfs_dir, NULL,
 			    &pending_subdevs_fops);
+
+	return 0;
+}
+
+static void __exit v4l2_async_exit(void)
+{
+	debugfs_remove_recursive(v4l2_async_debugfs_dir);
 }
+
+subsys_initcall(v4l2_async_init);
+module_exit(v4l2_async_exit);
+
+MODULE_AUTHOR("Guennadi Liakhovetski <g.liakhovetski@gmx.de>");
+MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
+MODULE_AUTHOR("Ezequiel Garcia <ezequiel@collabora.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index b6a72d297775..5002e3cd110f 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -39,8 +39,6 @@
 		       __func__, ##arg);				\
 } while (0)
 
-static struct dentry *v4l2_debugfs_dir;
-
 /*
  *	sysfs stuff
  */
@@ -1120,8 +1118,6 @@ static int __init videodev_init(void)
 		return -EIO;
 	}
 
-	v4l2_debugfs_dir = debugfs_create_dir("video4linux", NULL);
-	v4l2_async_debug_init(v4l2_debugfs_dir);
 	return 0;
 }
 
@@ -1129,7 +1125,6 @@ static void __exit videodev_exit(void)
 {
 	dev_t dev = MKDEV(VIDEO_MAJOR, 0);
 
-	debugfs_remove_recursive(v4l2_debugfs_dir);
 	class_unregister(&video_class);
 	unregister_chrdev_region(dev, VIDEO_NUM_DEVICES);
 }
diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
index 15322dc3124a..c536e8562788 100644
--- a/drivers/staging/media/imx/Kconfig
+++ b/drivers/staging/media/imx/Kconfig
@@ -7,7 +7,7 @@ config VIDEO_IMX_MEDIA
 	select VIDEO_V4L2_SUBDEV_API
 	depends on HAS_DMA
 	select VIDEOBUF2_DMA_CONTIG
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	select V4L2_MEM2MEM_DEV
 	help
 	  Say yes here to enable support for video4linux media controller
diff --git a/drivers/staging/media/tegra-video/Kconfig b/drivers/staging/media/tegra-video/Kconfig
index 1f35da4b134e..3ab34c7fa5e9 100644
--- a/drivers/staging/media/tegra-video/Kconfig
+++ b/drivers/staging/media/tegra-video/Kconfig
@@ -5,7 +5,7 @@ config VIDEO_TEGRA
 	depends on VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEOBUF2_DMA_CONTIG
-	select V4L2_FWNODE
+	select V4L2_ASYNC
 	help
 	  Choose this option if you have an NVIDIA Tegra SoC.
 
-- 
2.29.2

