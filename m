Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCB471994EB
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 13:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730682AbgCaLMU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 07:12:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:58052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730680AbgCaLMS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 07:12:18 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B750220B80;
        Tue, 31 Mar 2020 11:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585653137;
        bh=CuBhmmLRK27HV22JV65+MIuICL6Ah7BI66tsMJPplMA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f5n8ErGZXRKY740jiL0YFz/xurgOfjue4dK1V3LvowFee8sxeBeymDMJeeHduJ0D7
         noacEy3h56vGgcX0PY2U2LDtDCTzpyQoOB/+/dbjHTl2MX9/sa/4u0hK/7t7R05ynQ
         wdVjQ4/AWhpRt1COXz5isvA+VNE47aUBa0qxSYrE=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jJEoV-002brK-LE; Tue, 31 Mar 2020 13:12:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Heungjun Kim <riverful.kim@samsung.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Yong Deng <yong.deng@magewell.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org
Subject: [PATCH v4 19/33] media: Kconfig files: use select for V4L2 subdevs and MC
Date:   Tue, 31 Mar 2020 13:11:55 +0200
Message-Id: <fb754b29ecd7883acfaa0aef05bd83a305d2727b.1585651678.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585651678.git.mchehab+huawei@kernel.org>
References: <cover.1585651678.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are lots of drivers that only work when the media controller
and/or the V4L2 subdev APIs are present.

Right now, someone need to first enable those APIs before
using those drivers.

Well, ideally, drivers, should, instead *optionally*
depend on it, in order for PC camera drivers to be able to use
them, but nowadays most drivers are UVC cameras, with don't
require a sensor driver.

So, be it.

Let's instead make them select the MEDIA_CONTROLLER and the
SUBDEV API, in order to make easier for people to be able
of enabling them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/Kconfig                     | 210 ++++++++++++------
 drivers/media/i2c/et8ek8/Kconfig              |   4 +-
 drivers/media/i2c/m5mols/Kconfig              |   5 +-
 drivers/media/i2c/smiapp/Kconfig              |   5 +-
 drivers/media/mc/Kconfig                      |   2 +-
 drivers/media/pci/cobalt/Kconfig              |   4 +-
 drivers/media/pci/intel/ipu3/Kconfig          |   4 +-
 drivers/media/pci/sta2x11/Kconfig             |   6 +-
 drivers/media/platform/Kconfig                |  28 ++-
 drivers/media/platform/am437x/Kconfig         |   4 +-
 drivers/media/platform/atmel/Kconfig          |   4 +-
 drivers/media/platform/cadence/Kconfig        |   8 +-
 drivers/media/platform/exynos4-is/Kconfig     |   5 +-
 drivers/media/platform/rcar-vin/Kconfig       |   8 +-
 .../media/platform/sunxi/sun4i-csi/Kconfig    |   4 +-
 .../media/platform/sunxi/sun6i-csi/Kconfig    |   4 +-
 drivers/media/platform/xilinx/Kconfig         |   4 +-
 drivers/media/spi/Kconfig                     |   4 +-
 drivers/media/test_drivers/vimc/Kconfig       |   4 +-
 drivers/staging/media/hantro/Kconfig          |   5 +-
 drivers/staging/media/imx/Kconfig             |   5 +-
 drivers/staging/media/ipu3/Kconfig            |   3 +-
 drivers/staging/media/omap4iss/Kconfig        |   4 +-
 drivers/staging/media/rkisp1/Kconfig          |   4 +-
 drivers/staging/media/sunxi/cedrus/Kconfig    |   5 +-
 25 files changed, 237 insertions(+), 106 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 125d596c13dd..4bc4cfea2f20 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -19,7 +19,7 @@ config VIDEO_IR_I2C
 	  In doubt, say Y.
 
 #
-# Encoder / Decoder module configuration
+# V4L2 I2C drivers that aren't related with Camera support
 #
 
 comment "I2C drivers hidden by 'Autoselect ancillary drivers'"
@@ -28,6 +28,10 @@ comment "I2C drivers hidden by 'Autoselect ancillary drivers'"
 menu "I2C Encoders, decoders, sensors and other helper chips"
 	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
+#
+# Encoder / Decoder module configuration
+#
+
 comment "Audio decoders, processors and mixers"
 
 config VIDEO_TVAUDIO
@@ -62,11 +66,13 @@ config VIDEO_TDA9840
 
 config VIDEO_TDA1997X
 	tristate "NXP TDA1997x HDMI receiver"
-	depends on VIDEO_V4L2 && I2C && VIDEO_V4L2_SUBDEV_API
+	depends on VIDEO_V4L2 && I2C
 	depends on SND_SOC
 	select HDMI
 	select SND_PCM
 	select V4L2_FWNODE
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	help
 	  V4L2 subdevice driver for the NXP TDA1997x HDMI receivers.
 
@@ -204,7 +210,9 @@ comment "Video decoders"
 
 config VIDEO_ADV7180
 	tristate "Analog Devices ADV7180 decoder"
-	depends on GPIOLIB && VIDEO_V4L2 && I2C && VIDEO_V4L2_SUBDEV_API
+	depends on GPIOLIB && VIDEO_V4L2 && I2C
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	help
 	  Support for the Analog Devices ADV7180 video decoder.
 
@@ -223,8 +231,10 @@ config VIDEO_ADV7183
 
 config VIDEO_ADV748X
 	tristate "Analog Devices ADV748x decoder"
-	depends on VIDEO_V4L2 && I2C && VIDEO_V4L2_SUBDEV_API
+	depends on VIDEO_V4L2 && I2C
 	depends on OF
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP_I2C
 	select V4L2_FWNODE
 	help
@@ -236,8 +246,10 @@ config VIDEO_ADV748X
 
 config VIDEO_ADV7604
 	tristate "Analog Devices ADV7604 decoder"
-	depends on VIDEO_V4L2 && I2C && VIDEO_V4L2_SUBDEV_API
+	depends on VIDEO_V4L2 && I2C
 	depends on GPIOLIB || COMPILE_TEST
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP_I2C
 	select HDMI
 	select V4L2_FWNODE
@@ -260,7 +272,9 @@ config VIDEO_ADV7604_CEC
 
 config VIDEO_ADV7842
 	tristate "Analog Devices ADV7842 decoder"
-	depends on VIDEO_V4L2 && I2C && VIDEO_V4L2_SUBDEV_API
+	depends on VIDEO_V4L2 && I2C
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select HDMI
 	help
 	  Support for the Analog Devices ADV7842 video decoder.
@@ -347,7 +361,9 @@ config VIDEO_SAA711X
 
 config VIDEO_TC358743
 	tristate "Toshiba TC358743 decoder"
-	depends on VIDEO_V4L2 && I2C && VIDEO_V4L2_SUBDEV_API
+	depends on VIDEO_V4L2 && I2C
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select HDMI
 	select V4L2_FWNODE
 	help
@@ -515,8 +531,10 @@ config VIDEO_ADV7393
 
 config VIDEO_ADV7511
 	tristate "Analog Devices ADV7511 encoder"
-	depends on VIDEO_V4L2 && I2C && VIDEO_V4L2_SUBDEV_API
+	depends on VIDEO_V4L2 && I2C
 	depends on DRM_I2C_ADV7511=n || COMPILE_TEST
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select HDMI
 	help
 	  Support for the Analog Devices ADV7511 video encoder.
@@ -536,7 +554,10 @@ config VIDEO_ADV7511_CEC
 
 config VIDEO_AD9389B
 	tristate "Analog Devices AD9389B encoder"
-	depends on VIDEO_V4L2 && I2C && VIDEO_V4L2_SUBDEV_API
+	depends on VIDEO_V4L2 && I2C
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+
 	help
 	  Support for the Analog Devices AD9389B video encoder.
 
@@ -568,12 +589,17 @@ config VIDEO_APTINA_PLL
 config VIDEO_SMIAPP_PLL
 	tristate
 
+#
+# All drivers that are related to Media Camera Support should be here
+#
+
 if MEDIA_CAMERA_SUPPORT
 
 config VIDEO_HI556
 	tristate "Hynix Hi-556 sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on MEDIA_CONTROLLER
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the Hynix
@@ -584,8 +610,10 @@ config VIDEO_HI556
 
 config VIDEO_IMX214
 	tristate "Sony IMX214 sensor support"
-	depends on GPIOLIB && I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on GPIOLIB && I2C && VIDEO_V4L2
 	depends on V4L2_FWNODE
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -596,7 +624,9 @@ config VIDEO_IMX214
 
 config VIDEO_IMX219
 	tristate "Sony IMX219 sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -607,7 +637,9 @@ config VIDEO_IMX219
 
 config VIDEO_IMX258
 	tristate "Sony IMX258 sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX258 camera.
@@ -617,7 +649,9 @@ config VIDEO_IMX258
 
 config VIDEO_IMX274
 	tristate "Sony IMX274 sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP_I2C
 	help
 	  This is a V4L2 sensor driver for the Sony IMX274
@@ -625,7 +659,9 @@ config VIDEO_IMX274
 
 config VIDEO_IMX290
 	tristate "Sony IMX290 sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP_I2C
 	select V4L2_FWNODE
 	help
@@ -637,7 +673,9 @@ config VIDEO_IMX290
 
 config VIDEO_IMX319
 	tristate "Sony IMX319 sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX319 camera.
@@ -647,7 +685,9 @@ config VIDEO_IMX319
 
 config VIDEO_IMX355
 	tristate "Sony IMX355 sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX355 camera.
@@ -678,7 +718,8 @@ config VIDEO_OV2659
 
 config VIDEO_OV2680
 	tristate "OmniVision OV2680 sensor support"
-	depends on VIDEO_V4L2 && I2C && MEDIA_CONTROLLER
+	depends on VIDEO_V4L2 && I2C
+	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -689,7 +730,8 @@ config VIDEO_OV2680
 
 config VIDEO_OV2685
 	tristate "OmniVision OV2685 sensor support"
-	depends on VIDEO_V4L2 && I2C && MEDIA_CONTROLLER
+	depends on VIDEO_V4L2 && I2C
+	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -701,7 +743,9 @@ config VIDEO_OV2685
 config VIDEO_OV5640
 	tristate "OmniVision OV5640 sensor support"
 	depends on OF
-	depends on GPIOLIB && VIDEO_V4L2 && I2C && VIDEO_V4L2_SUBDEV_API
+	depends on GPIOLIB && VIDEO_V4L2 && I2C
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the Omnivision
@@ -710,7 +754,9 @@ config VIDEO_OV5640
 config VIDEO_OV5645
 	tristate "OmniVision OV5645 sensor support"
 	depends on OF
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -721,7 +767,9 @@ config VIDEO_OV5645
 
 config VIDEO_OV5647
 	tristate "OmniVision OV5647 sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -742,8 +790,9 @@ config VIDEO_OV6650
 
 config VIDEO_OV5670
 	tristate "OmniVision OV5670 sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on MEDIA_CONTROLLER
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -754,8 +803,9 @@ config VIDEO_OV5670
 
 config VIDEO_OV5675
 	tristate "OmniVision OV5675 sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on MEDIA_CONTROLLER
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -777,7 +827,9 @@ config VIDEO_OV5695
 
 config VIDEO_OV7251
 	tristate "OmniVision OV7251 sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -826,7 +878,9 @@ config VIDEO_OV7740
 
 config VIDEO_OV8856
 	tristate "OmniVision OV8856 sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -844,7 +898,9 @@ config VIDEO_OV9640
 
 config VIDEO_OV9650
 	tristate "OmniVision OV9650/OV9652 sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP_SCCB
 	help
 	  This is a V4L2 sensor driver for the Omnivision
@@ -852,7 +908,9 @@ config VIDEO_OV9650
 
 config VIDEO_OV13858
 	tristate "OmniVision OV13858 sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -870,14 +928,18 @@ config VIDEO_VS6624
 
 config VIDEO_MT9M001
 	tristate "mt9m001 support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	help
 	  This driver supports MT9M001 cameras from Micron, monochrome
 	  and colour models.
 
 config VIDEO_MT9M032
 	tristate "MT9M032 camera sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select VIDEO_APTINA_PLL
 	help
 	  This driver supports MT9M032 camera sensors from Aptina, monochrome
@@ -893,7 +955,9 @@ config VIDEO_MT9M111
 
 config VIDEO_MT9P031
 	tristate "Aptina MT9P031 support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select VIDEO_APTINA_PLL
 	help
 	  This is a Video4Linux2 sensor driver for the Aptina
@@ -901,7 +965,9 @@ config VIDEO_MT9P031
 
 config VIDEO_MT9T001
 	tristate "Aptina MT9T001 support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	help
 	  This is a Video4Linux2 sensor driver for the Aptina
 	  (Micron) mt0t001 3 Mpixel camera.
@@ -926,7 +992,9 @@ config VIDEO_MT9V011
 
 config VIDEO_MT9V032
 	tristate "Micron MT9V032 sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP_I2C
 	select V4L2_FWNODE
 	help
@@ -951,7 +1019,9 @@ config VIDEO_SR030PC30
 
 config VIDEO_NOON010PC30
 	tristate "Siliconfile NOON010PC30 sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	help
 	  This driver supports NOON010PC30 CIF camera from Siliconfile
 
@@ -969,21 +1039,27 @@ config VIDEO_RJ54N1
 
 config VIDEO_S5K6AA
 	tristate "Samsung S5K6AAFX sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	help
 	  This is a V4L2 sensor driver for Samsung S5K6AA(FX) 1.3M
 	  camera sensor with an embedded SoC image signal processor.
 
 config VIDEO_S5K6A3
 	tristate "Samsung S5K6A3 sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	help
 	  This is a V4L2 sensor driver for Samsung S5K6A3 raw
 	  camera sensor.
 
 config VIDEO_S5K4ECGX
 	tristate "Samsung S5K4ECGX sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select CRC32
 	help
 	  This is a V4L2 sensor driver for Samsung S5K4ECGX 5M
@@ -991,7 +1067,9 @@ config VIDEO_S5K4ECGX
 
 config VIDEO_S5K5BAF
 	tristate "Samsung S5K5BAF sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
 	help
 	  This is a V4L2 sensor driver for Samsung S5K5BAF 2M
@@ -1002,28 +1080,29 @@ source "drivers/media/i2c/et8ek8/Kconfig"
 
 config VIDEO_S5C73M3
 	tristate "Samsung S5C73M3 sensor support"
-	depends on I2C && SPI && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && SPI && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
 	help
 	  This is a V4L2 sensor driver for Samsung S5C73M3
 	  8 Mpixel camera.
-endif
 
 comment "Lens drivers"
 
-if MEDIA_CAMERA_SUPPORT
-
 config VIDEO_AD5820
 	tristate "AD5820 lens voice coil support"
-	depends on GPIOLIB && I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
+	depends on GPIOLIB && I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
 	help
 	  This is a driver for the AD5820 camera lens voice coil.
 	  It is used for example in Nokia N900 (RX-51).
 
 config VIDEO_AK7375
 	tristate "AK7375 lens voice coil support"
-	depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
-	depends on VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	help
 	  This is a driver for the AK7375 camera lens voice coil.
 	  AK7375 is a 12 bit DAC with 120mA output current sink
@@ -1032,8 +1111,9 @@ config VIDEO_AK7375
 
 config VIDEO_DW9714
 	tristate "DW9714 lens voice coil support"
-	depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
-	depends on VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	help
 	  This is a driver for the DW9714 camera lens voice coil.
 	  DW9714 is a 10 bit DAC with 120mA output current sink
@@ -1042,30 +1122,30 @@ config VIDEO_DW9714
 
 config VIDEO_DW9807_VCM
 	tristate "DW9807 lens voice coil support"
-	depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
-	depends on VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	help
 	  This is a driver for the DW9807 camera lens voice coil.
 	  DW9807 is a 10 bit DAC with 100mA output current sink
 	  capability. This is designed for linear control of
 	  voice coil motors, controlled via I2C serial interface.
 
-endif
 
 comment "Flash devices"
 
-if MEDIA_CAMERA_SUPPORT
-
 config VIDEO_ADP1653
 	tristate "ADP1653 flash support"
-	depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
 	help
 	  This is a driver for the ADP1653 flash controller. It is used for
 	  example in Nokia N900.
 
 config VIDEO_LM3560
 	tristate "LM3560 dual flash driver support"
-	depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
 	select REGMAP_I2C
 	help
 	  This is a driver for the lm3560 dual flash controllers. It controls
@@ -1073,13 +1153,18 @@ config VIDEO_LM3560
 
 config VIDEO_LM3646
 	tristate "LM3646 dual flash driver support"
-	depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
 	select REGMAP_I2C
 	help
 	  This is a driver for the lm3646 dual flash controllers. It controls
 	  flash, torch LEDs.
 
-endif
+endif # MEDIA_CAMERA_SUPPORT
+
+#
+# Other V4L2 drivers that aren't related with Camera support
+#
 
 comment "Video improvement chips"
 
@@ -1168,8 +1253,9 @@ config VIDEO_I2C
 
 config VIDEO_ST_MIPID02
 	tristate "STMicroelectronics MIPID02 CSI-2 to PARALLEL bridge"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on MEDIA_CAMERA_SUPPORT
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
 	help
 	  Support for STMicroelectronics MIPID02 CSI-2 to PARALLEL bridge.
@@ -1181,4 +1267,4 @@ config VIDEO_ST_MIPID02
 
 endmenu
 
-endif
+endif # VIDEO_V4L2
diff --git a/drivers/media/i2c/et8ek8/Kconfig b/drivers/media/i2c/et8ek8/Kconfig
index 1c6909874d56..afcc4ea764f6 100644
--- a/drivers/media/i2c/et8ek8/Kconfig
+++ b/drivers/media/i2c/et8ek8/Kconfig
@@ -1,7 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_ET8EK8
 	tristate "ET8EK8 camera sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
 	help
 	  This is a driver for the Toshiba ET8EK8 5 MP camera sensor.
diff --git a/drivers/media/i2c/m5mols/Kconfig b/drivers/media/i2c/m5mols/Kconfig
index e573482f269f..6f0ef33b7ee1 100644
--- a/drivers/media/i2c/m5mols/Kconfig
+++ b/drivers/media/i2c/m5mols/Kconfig
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_M5MOLS
 	tristate "Fujitsu M-5MOLS 8MP sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on MEDIA_CAMERA_SUPPORT
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	help
 	  This driver supports Fujitsu M-5MOLS camera sensor with ISP
diff --git a/drivers/media/i2c/smiapp/Kconfig b/drivers/media/i2c/smiapp/Kconfig
index fcaa7f9494a8..6893b532824f 100644
--- a/drivers/media/i2c/smiapp/Kconfig
+++ b/drivers/media/i2c/smiapp/Kconfig
@@ -1,8 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_SMIAPP
 	tristate "SMIA++/SMIA sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API && HAVE_CLK
-	depends on MEDIA_CAMERA_SUPPORT
+	depends on I2C && VIDEO_V4L2 && HAVE_CLK
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select VIDEO_SMIAPP_PLL
 	select V4L2_FWNODE
 	help
diff --git a/drivers/media/mc/Kconfig b/drivers/media/mc/Kconfig
index 0c5c52f14c64..e740ace54d7f 100644
--- a/drivers/media/mc/Kconfig
+++ b/drivers/media/mc/Kconfig
@@ -7,7 +7,7 @@
 
 config MEDIA_CONTROLLER
 	bool "Media Controller API"
-	depends on MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT
+	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_PLATFORM_SUPPORT
 	help
 	  Enable the media controller API used to query media devices internal
 	  topology and configure it dynamically.
diff --git a/drivers/media/pci/cobalt/Kconfig b/drivers/media/pci/cobalt/Kconfig
index e0e7df460a92..d8d9ea6b09bc 100644
--- a/drivers/media/pci/cobalt/Kconfig
+++ b/drivers/media/pci/cobalt/Kconfig
@@ -1,11 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_COBALT
 	tristate "Cisco Cobalt support"
-	depends on VIDEO_V4L2 && I2C && VIDEO_V4L2_SUBDEV_API
+	depends on VIDEO_V4L2 && I2C
 	depends on PCI_MSI && MTD_COMPLEX_MAPPINGS
 	depends on (GPIOLIB && DRM_I2C_ADV7511=n) || COMPILE_TEST
 	depends on SND
 	depends on MTD
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select I2C_ALGOBIT
 	select SND_PCM
 	select VIDEO_ADV7604
diff --git a/drivers/media/pci/intel/ipu3/Kconfig b/drivers/media/pci/intel/ipu3/Kconfig
index f35bba16b60e..82d7f17e6a02 100644
--- a/drivers/media/pci/intel/ipu3/Kconfig
+++ b/drivers/media/pci/intel/ipu3/Kconfig
@@ -2,9 +2,9 @@
 config VIDEO_IPU3_CIO2
 	tristate "Intel ipu3-cio2 driver"
 	depends on VIDEO_V4L2 && PCI
-	depends on VIDEO_V4L2_SUBDEV_API
 	depends on (X86 && ACPI) || COMPILE_TEST
-	depends on MEDIA_CONTROLLER
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
 	select VIDEOBUF2_DMA_SG
 
diff --git a/drivers/media/pci/sta2x11/Kconfig b/drivers/media/pci/sta2x11/Kconfig
index 011b766f0bff..4dd98f94a91e 100644
--- a/drivers/media/pci/sta2x11/Kconfig
+++ b/drivers/media/pci/sta2x11/Kconfig
@@ -1,12 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config STA2X11_VIP
 	tristate "STA2X11 VIP Video For Linux"
+	depends on PCI && VIDEO_V4L2 && VIRT_TO_BUS && I2C
 	depends on STA2X11 || COMPILE_TEST
 	select VIDEO_ADV7180 if MEDIA_SUBDRV_AUTOSELECT
 	select VIDEOBUF2_DMA_CONTIG
-	depends on PCI && VIDEO_V4L2 && VIRT_TO_BUS
-	depends on VIDEO_V4L2_SUBDEV_API
-	depends on I2C
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	help
 	  Say Y for support for STA2X11 VIP (Video Input Port) capture
 	  device.
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 6b693cd0576e..b8b2de5f1541 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -63,7 +63,9 @@ config VIDEO_VIU
 config VIDEO_MUX
 	tristate "Video Multiplexer"
 	select MULTIPLEXER
-	depends on VIDEO_V4L2 && OF && VIDEO_V4L2_SUBDEV_API && MEDIA_CONTROLLER
+	depends on VIDEO_V4L2 && OF
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP
 	select V4L2_FWNODE
 	help
@@ -71,10 +73,12 @@ config VIDEO_MUX
 
 config VIDEO_OMAP3
 	tristate "OMAP 3 Camera support"
-	depends on VIDEO_V4L2 && I2C && VIDEO_V4L2_SUBDEV_API
+	depends on VIDEO_V4L2 && I2C
 	depends on (ARCH_OMAP3 && OMAP_IOMMU) || COMPILE_TEST
 	depends on COMMON_CLK && OF
 	select ARM_DMA_USE_IOMMU if OMAP_IOMMU
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
 	select MFD_SYSCON
 	select V4L2_FWNODE
@@ -99,16 +103,19 @@ config VIDEO_PXA27x
 
 config VIDEO_QCOM_CAMSS
 	tristate "Qualcomm V4L2 Camera Subsystem driver"
-	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on VIDEO_V4L2
 	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_SG
 	select V4L2_FWNODE
 
 config VIDEO_S3C_CAMIF
 	tristate "Samsung S3C24XX/S3C64XX SoC Camera Interface driver"
-	depends on VIDEO_V4L2 && I2C && VIDEO_V4L2_SUBDEV_API
-	depends on PM
+	depends on VIDEO_V4L2 && I2C && PM
 	depends on ARCH_S3C64XX || PLAT_S3C24XX || COMPILE_TEST
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
 	help
 	  This is a v4l2 driver for s3c24xx and s3c64xx SoC series camera
@@ -119,9 +126,10 @@ config VIDEO_S3C_CAMIF
 
 config VIDEO_STM32_DCMI
 	tristate "STM32 Digital Camera Memory Interface (DCMI) support"
-	depends on VIDEO_V4L2 && OF && MEDIA_CONTROLLER
+	depends on VIDEO_V4L2 && OF
 	depends on ARCH_STM32 || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
+	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
 	help
 	  This module makes the STM32 Digital Camera Memory Interface (DCMI)
@@ -148,7 +156,9 @@ source "drivers/media/platform/sunxi/Kconfig"
 
 config VIDEO_TI_CAL
 	tristate "TI CAL (Camera Adaptation Layer) driver"
-	depends on VIDEO_DEV && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on VIDEO_DEV && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	depends on SOC_DRA7XX || ARCH_K3 || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
@@ -432,9 +442,11 @@ config VIDEO_RENESAS_FCP
 
 config VIDEO_RENESAS_VSP1
 	tristate "Renesas VSP1 Video Processing Engine"
-	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on VIDEO_V4L2
 	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on (!ARM64 && !VIDEO_RENESAS_FCP) || VIDEO_RENESAS_FCP
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_VMALLOC
 	help
diff --git a/drivers/media/platform/am437x/Kconfig b/drivers/media/platform/am437x/Kconfig
index d6f2e3d0cbef..9ef898f512de 100644
--- a/drivers/media/platform/am437x/Kconfig
+++ b/drivers/media/platform/am437x/Kconfig
@@ -1,8 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_AM437X_VPFE
 	tristate "TI AM437x VPFE video capture driver"
-	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on VIDEO_V4L2
 	depends on SOC_AM43XX || COMPILE_TEST
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
 	help
diff --git a/drivers/media/platform/atmel/Kconfig b/drivers/media/platform/atmel/Kconfig
index 5ae3f60b81b1..1850fe7f9360 100644
--- a/drivers/media/platform/atmel/Kconfig
+++ b/drivers/media/platform/atmel/Kconfig
@@ -1,8 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_ATMEL_ISC
 	tristate "ATMEL Image Sensor Controller (ISC) support"
-	depends on VIDEO_V4L2 && COMMON_CLK && VIDEO_V4L2_SUBDEV_API
+	depends on VIDEO_V4L2 && COMMON_CLK
 	depends on ARCH_AT91 || COMPILE_TEST
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
 	select REGMAP_MMIO
 	select V4L2_FWNODE
diff --git a/drivers/media/platform/cadence/Kconfig b/drivers/media/platform/cadence/Kconfig
index c154e368d701..80cf601323ce 100644
--- a/drivers/media/platform/cadence/Kconfig
+++ b/drivers/media/platform/cadence/Kconfig
@@ -13,8 +13,8 @@ if VIDEO_CADENCE
 config VIDEO_CADENCE_CSI2RX
 	tristate "Cadence MIPI-CSI2 RX Controller"
 	depends on VIDEO_V4L2
-	depends on MEDIA_CONTROLLER
-	depends on VIDEO_V4L2_SUBDEV_API
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
 	help
 	  Support for the Cadence MIPI CSI2 Receiver controller.
@@ -25,8 +25,8 @@ config VIDEO_CADENCE_CSI2RX
 config VIDEO_CADENCE_CSI2TX
 	tristate "Cadence MIPI-CSI2 TX Controller"
 	depends on VIDEO_V4L2
-	depends on MEDIA_CONTROLLER
-	depends on VIDEO_V4L2_SUBDEV_API
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
 	help
 	  Support for the Cadence MIPI CSI2 Transceiver controller.
diff --git a/drivers/media/platform/exynos4-is/Kconfig b/drivers/media/platform/exynos4-is/Kconfig
index be4effcbfe7b..136d3b2a0fbb 100644
--- a/drivers/media/platform/exynos4-is/Kconfig
+++ b/drivers/media/platform/exynos4-is/Kconfig
@@ -2,9 +2,10 @@
 
 config VIDEO_SAMSUNG_EXYNOS4_IS
 	tristate "Samsung S5P/EXYNOS4 SoC series Camera Subsystem driver"
-	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on VIDEO_V4L2 && OF && COMMON_CLK
 	depends on ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
-	depends on OF && COMMON_CLK
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
 	help
 	  Say Y here to enable camera host interface devices for
diff --git a/drivers/media/platform/rcar-vin/Kconfig b/drivers/media/platform/rcar-vin/Kconfig
index 240ac3f3c941..ca0d906dce2f 100644
--- a/drivers/media/platform/rcar-vin/Kconfig
+++ b/drivers/media/platform/rcar-vin/Kconfig
@@ -1,8 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 config VIDEO_RCAR_CSI2
 	tristate "R-Car MIPI CSI-2 Receiver"
-	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API && OF
+	depends on VIDEO_V4L2 && OF
 	depends on ARCH_RENESAS || COMPILE_TEST
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select RESET_CONTROLLER
 	select V4L2_FWNODE
 	help
@@ -14,8 +16,10 @@ config VIDEO_RCAR_CSI2
 
 config VIDEO_RCAR_VIN
 	tristate "R-Car Video Input (VIN) Driver"
-	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API && OF && MEDIA_CONTROLLER
+	depends on VIDEO_V4L2 && OF
 	depends on ARCH_RENESAS || COMPILE_TEST
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
 	help
diff --git a/drivers/media/platform/sunxi/sun4i-csi/Kconfig b/drivers/media/platform/sunxi/sun4i-csi/Kconfig
index 93b4e82a2655..903c6152f6e8 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/Kconfig
+++ b/drivers/media/platform/sunxi/sun4i-csi/Kconfig
@@ -2,8 +2,10 @@
 
 config VIDEO_SUN4I_CSI
 	tristate "Allwinner A10 CMOS Sensor Interface Support"
-	depends on VIDEO_V4L2 && COMMON_CLK && VIDEO_V4L2_SUBDEV_API && HAS_DMA
+	depends on VIDEO_V4L2 && COMMON_CLK  && HAS_DMA
 	depends on ARCH_SUNXI || COMPILE_TEST
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
 	help
diff --git a/drivers/media/platform/sunxi/sun6i-csi/Kconfig b/drivers/media/platform/sunxi/sun6i-csi/Kconfig
index 269b3ebf4f52..586e3fb3a80d 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/Kconfig
+++ b/drivers/media/platform/sunxi/sun6i-csi/Kconfig
@@ -1,8 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_SUN6I_CSI
 	tristate "Allwinner V3s Camera Sensor Interface driver"
-	depends on VIDEO_V4L2 && COMMON_CLK && VIDEO_V4L2_SUBDEV_API && HAS_DMA
+	depends on VIDEO_V4L2 && COMMON_CLK  && HAS_DMA
 	depends on ARCH_SUNXI || COMPILE_TEST
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
 	select REGMAP_MMIO
 	select V4L2_FWNODE
diff --git a/drivers/media/platform/xilinx/Kconfig b/drivers/media/platform/xilinx/Kconfig
index a2773ad7c185..01c96fb66414 100644
--- a/drivers/media/platform/xilinx/Kconfig
+++ b/drivers/media/platform/xilinx/Kconfig
@@ -2,7 +2,9 @@
 
 config VIDEO_XILINX
 	tristate "Xilinx Video IP (EXPERIMENTAL)"
-	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API && OF && HAS_DMA
+	depends on VIDEO_V4L2  && OF && HAS_DMA
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
 	help
diff --git a/drivers/media/spi/Kconfig b/drivers/media/spi/Kconfig
index bcc49cb47de6..bf385d503cab 100644
--- a/drivers/media/spi/Kconfig
+++ b/drivers/media/spi/Kconfig
@@ -9,7 +9,9 @@ menu "SPI helper chips"
 
 config VIDEO_GS1662
 	tristate "Gennum Serializers video"
-	depends on SPI && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on SPI && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	help
 	  Enable the GS1662 driver which serializes video streams.
 
diff --git a/drivers/media/test_drivers/vimc/Kconfig b/drivers/media/test_drivers/vimc/Kconfig
index bd221d3e1a4a..4068a67585f9 100644
--- a/drivers/media/test_drivers/vimc/Kconfig
+++ b/drivers/media/test_drivers/vimc/Kconfig
@@ -1,7 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_VIMC
 	tristate "Virtual Media Controller Driver (VIMC)"
-	depends on VIDEO_DEV && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on VIDEO_DEV && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_VMALLOC
 	select VIDEO_V4L2_TPG
 	help
diff --git a/drivers/staging/media/hantro/Kconfig b/drivers/staging/media/hantro/Kconfig
index 99aed9a5b0b9..68e5b06cdab7 100644
--- a/drivers/staging/media/hantro/Kconfig
+++ b/drivers/staging/media/hantro/Kconfig
@@ -2,8 +2,9 @@
 config VIDEO_HANTRO
 	tristate "Hantro VPU driver"
 	depends on ARCH_MXC || ARCH_ROCKCHIP || COMPILE_TEST
-	depends on VIDEO_DEV && VIDEO_V4L2 && MEDIA_CONTROLLER
-	depends on MEDIA_CONTROLLER_REQUEST_API
+	depends on VIDEO_DEV && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select MEDIA_CONTROLLER_REQUEST_API
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_VMALLOC
 	select V4L2_MEM2MEM_DEV
diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
index 8f1ae50a4abd..f555aac8a9d5 100644
--- a/drivers/staging/media/imx/Kconfig
+++ b/drivers/staging/media/imx/Kconfig
@@ -2,8 +2,9 @@
 config VIDEO_IMX_MEDIA
 	tristate "i.MX5/6 V4L2 media core driver"
 	depends on ARCH_MXC || COMPILE_TEST
-	depends on MEDIA_CONTROLLER && VIDEO_V4L2 && IMX_IPUV3_CORE
-	depends on VIDEO_V4L2_SUBDEV_API
+	depends on VIDEO_V4L2 && IMX_IPUV3_CORE
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	depends on HAS_DMA
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
diff --git a/drivers/staging/media/ipu3/Kconfig b/drivers/staging/media/ipu3/Kconfig
index 4b51c67eac88..3e9640523e50 100644
--- a/drivers/staging/media/ipu3/Kconfig
+++ b/drivers/staging/media/ipu3/Kconfig
@@ -2,8 +2,9 @@
 config VIDEO_IPU3_IMGU
 	tristate "Intel ipu3-imgu driver"
 	depends on PCI && VIDEO_V4L2
-	depends on MEDIA_CONTROLLER && VIDEO_V4L2_SUBDEV_API
 	depends on X86
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select IOMMU_IOVA
 	select VIDEOBUF2_DMA_SG
 	help
diff --git a/drivers/staging/media/omap4iss/Kconfig b/drivers/staging/media/omap4iss/Kconfig
index 4dcbc5065821..6c254907a27b 100644
--- a/drivers/staging/media/omap4iss/Kconfig
+++ b/drivers/staging/media/omap4iss/Kconfig
@@ -2,8 +2,10 @@
 
 config VIDEO_OMAP4
 	tristate "OMAP 4 Camera support"
-	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API && I2C
+	depends on VIDEO_V4L2  && I2C
 	depends on ARCH_OMAP4 || COMPILE_TEST
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select MFD_SYSCON
 	select VIDEOBUF2_DMA_CONTIG
 	help
diff --git a/drivers/staging/media/rkisp1/Kconfig b/drivers/staging/media/rkisp1/Kconfig
index b859a493caba..5ecbefa0f5ec 100644
--- a/drivers/staging/media/rkisp1/Kconfig
+++ b/drivers/staging/media/rkisp1/Kconfig
@@ -2,8 +2,10 @@
 
 config VIDEO_ROCKCHIP_ISP1
 	tristate "Rockchip Image Signal Processing v1 Unit driver"
-	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on VIDEO_V4L2
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_VMALLOC
 	select V4L2_FWNODE
diff --git a/drivers/staging/media/sunxi/cedrus/Kconfig b/drivers/staging/media/sunxi/cedrus/Kconfig
index 17733e9a088f..da369950bbf2 100644
--- a/drivers/staging/media/sunxi/cedrus/Kconfig
+++ b/drivers/staging/media/sunxi/cedrus/Kconfig
@@ -1,10 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
 config VIDEO_SUNXI_CEDRUS
 	tristate "Allwinner Cedrus VPU driver"
-	depends on VIDEO_DEV && VIDEO_V4L2 && MEDIA_CONTROLLER
+	depends on VIDEO_DEV && VIDEO_V4L2
 	depends on HAS_DMA
 	depends on OF
-	depends on MEDIA_CONTROLLER_REQUEST_API
+	select MEDIA_CONTROLLER
+	select MEDIA_CONTROLLER_REQUEST_API
 	select SUNXI_SRAM
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
-- 
2.25.1

