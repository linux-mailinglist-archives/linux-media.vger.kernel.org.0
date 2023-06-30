Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76828743D26
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 16:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232342AbjF3OEQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 10:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231743AbjF3OEO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 10:04:14 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DFE8BC
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 07:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688133852; x=1719669852;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9pjAIf7BIoOrmzGufP41iX3q33AZWYHEEqL6jpFJy3s=;
  b=GR55sf166HLPzkEB9cBr1H5avuIyvpTzVGchxbPB7cLSZphIi3ozkYSp
   2p+QroZPdj7Mjvu6bJqknUz3fAgr3Wg33ZoqgirYaA/Rd10DksW6yu2dV
   YkZSz3AseSITH1UcMXDOU2mCh8WSyBjdGk2YQlvPqO0A07et+59v1UhYz
   ctasQVlkcMAKMlauwPzzya9Xl69kGdr0JbhBwcrTLm0MK/0RhrJOMBSuR
   NMOeDWtnhu9JlVtXPdXj5ZTqOrQClXOdDUfRSwYWLXjCVrWTVI21E1kw6
   OPPvCh5XZBMY+dj/Nc+NzC5WOZM9p6qvEtz7j4jFCHXMZWXCWDnBbQiWk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="352220890"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="352220890"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 07:04:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="783086520"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="783086520"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 07:04:01 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 9DB9D12078C;
        Fri, 30 Jun 2023 17:03:57 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 2/2] media: i2c: Stop selecting common features for individual camera drivers
Date:   Fri, 30 Jun 2023 17:03:54 +0300
Message-Id: <20230630140354.111404-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630140354.111404-1-sakari.ailus@linux.intel.com>
References: <20230630140354.111404-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As selecting V4L2_FWNODE, MEDIA_CONTROLLER and VIDEO_V4L2_SUBDEV_API are
now selected by the top level menu, they can be dropped from the
individual drivers. Also dropped selectng V4L2_ASYNC for a single driver
as this is already implied by V4L2_FWNODE.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/Kconfig        | 149 -------------------------------
 drivers/media/i2c/ccs/Kconfig    |   3 -
 drivers/media/i2c/et8ek8/Kconfig |   3 -
 3 files changed, 155 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index c7ffaa79abeb..d8ea6be924c0 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -44,9 +44,6 @@ config VIDEO_CCS_PLL
 config VIDEO_AR0521
 	tristate "ON Semiconductor AR0521 sensor support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the ON Semiconductor
 	  AR0521 camera.
@@ -57,9 +54,6 @@ config VIDEO_AR0521
 config VIDEO_HI556
 	tristate "Hynix Hi-556 sensor support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the Hynix
 	  Hi-556 camera.
@@ -70,9 +64,6 @@ config VIDEO_HI556
 config VIDEO_HI846
 	tristate "Hynix Hi-846 sensor support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the Hynix
 	  Hi-846 camera.
@@ -83,9 +74,6 @@ config VIDEO_HI846
 config VIDEO_HI847
         tristate "Hynix Hi-847 sensor support"
         depends on I2C && VIDEO_DEV
-        select MEDIA_CONTROLLER
-        select VIDEO_V4L2_SUBDEV_API
-        select V4L2_FWNODE
         help
           This is a Video4Linux2 sensor driver for the Hynix
           Hi-847 camera.
@@ -96,9 +84,6 @@ config VIDEO_HI847
 config VIDEO_IMX208
 	tristate "Sony IMX208 sensor support"
 	depends on I2C && VIDEO_DEV
-	depends on MEDIA_CAMERA_SUPPORT
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX208 camera.
@@ -109,9 +94,6 @@ config VIDEO_IMX208
 config VIDEO_IMX214
 	tristate "Sony IMX214 sensor support"
 	depends on GPIOLIB && I2C && VIDEO_DEV
-	select V4L2_FWNODE
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -123,9 +105,6 @@ config VIDEO_IMX214
 config VIDEO_IMX219
 	tristate "Sony IMX219 sensor support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX219 camera.
@@ -136,8 +115,6 @@ config VIDEO_IMX219
 config VIDEO_IMX258
 	tristate "Sony IMX258 sensor support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX258 camera.
@@ -148,8 +125,6 @@ config VIDEO_IMX258
 config VIDEO_IMX274
 	tristate "Sony IMX274 sensor support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP_I2C
 	help
 	  This is a V4L2 sensor driver for the Sony IMX274
@@ -158,10 +133,7 @@ config VIDEO_IMX274
 config VIDEO_IMX290
 	tristate "Sony IMX290 sensor support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP_I2C
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX290 camera sensor.
@@ -172,9 +144,6 @@ config VIDEO_IMX290
 config VIDEO_IMX296
 	tristate "Sony IMX296 sensor support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select V4L2_FWNODE
-	select VIDEO_V4L2_SUBDEV_API
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX296 camera.
@@ -185,8 +154,6 @@ config VIDEO_IMX296
 config VIDEO_IMX319
 	tristate "Sony IMX319 sensor support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX319 camera.
@@ -198,9 +165,6 @@ config VIDEO_IMX334
 	tristate "Sony IMX334 sensor support"
 	depends on OF_GPIO
 	depends on I2C && VIDEO_DEV
-	select VIDEO_V4L2_SUBDEV_API
-	select MEDIA_CONTROLLER
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX334 camera.
@@ -212,9 +176,6 @@ config VIDEO_IMX335
 	tristate "Sony IMX335 sensor support"
 	depends on OF_GPIO
 	depends on I2C && VIDEO_DEV
-	select VIDEO_V4L2_SUBDEV_API
-	select MEDIA_CONTROLLER
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX335 camera.
@@ -225,8 +186,6 @@ config VIDEO_IMX335
 config VIDEO_IMX355
 	tristate "Sony IMX355 sensor support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX355 camera.
@@ -238,9 +197,6 @@ config VIDEO_IMX412
 	tristate "Sony IMX412 sensor support"
 	depends on OF_GPIO
 	depends on I2C && VIDEO_DEV
-	select VIDEO_V4L2_SUBDEV_API
-	select MEDIA_CONTROLLER
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX412 camera.
@@ -252,9 +208,6 @@ config VIDEO_IMX415
 	tristate "Sony IMX415 sensor support"
 	depends on OF_GPIO
 	depends on I2C && VIDEO_DEV
-	select VIDEO_V4L2_SUBDEV_API
-	select MEDIA_CONTROLLER
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX415 camera.
@@ -268,8 +221,6 @@ config VIDEO_MAX9271_LIB
 config VIDEO_MT9M001
 	tristate "mt9m001 support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
 	help
 	  This driver supports MT9M001 cameras from Micron, monochrome
 	  and colour models.
@@ -277,7 +228,6 @@ config VIDEO_MT9M001
 config VIDEO_MT9M111
 	tristate "mt9m111, mt9m112 and mt9m131 support"
 	depends on I2C && VIDEO_DEV
-	select V4L2_FWNODE
 	help
 	  This driver supports MT9M111, MT9M112 and MT9M131 cameras from
 	  Micron/Aptina
@@ -285,10 +235,7 @@ config VIDEO_MT9M111
 config VIDEO_MT9P031
 	tristate "Aptina MT9P031 support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
 	select VIDEO_APTINA_PLL
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the Aptina
 	  (Micron) mt9p031 5 Mpixel camera.
@@ -314,10 +261,7 @@ config VIDEO_MT9V011
 config VIDEO_MT9V032
 	tristate "Micron MT9V032 sensor support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP_I2C
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the Micron
 	  MT9V032 752x480 CMOS sensor.
@@ -335,9 +279,6 @@ config VIDEO_MT9V111
 config VIDEO_OG01A1B
 	tristate "OmniVision OG01A1B sensor support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OG01A1B camera.
@@ -348,9 +289,6 @@ config VIDEO_OG01A1B
 config VIDEO_OV01A10
 	tristate "OmniVision OV01A10 sensor support"
 	depends on VIDEO_DEV && I2C
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV01A10 camera.
@@ -361,9 +299,6 @@ config VIDEO_OV01A10
 config VIDEO_OV02A10
 	tristate "OmniVision OV02A10 sensor support"
 	depends on VIDEO_DEV && I2C
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV02A10 camera.
@@ -374,9 +309,6 @@ config VIDEO_OV02A10
 config VIDEO_OV08D10
         tristate "OmniVision OV08D10 sensor support"
         depends on I2C && VIDEO_DEV
-        select MEDIA_CONTROLLER
-        select VIDEO_V4L2_SUBDEV_API
-        select V4L2_FWNODE
         help
           This is a Video4Linux2 sensor driver for the OmniVision
           OV08D10 camera sensor.
@@ -387,9 +319,6 @@ config VIDEO_OV08D10
 config VIDEO_OV08X40
 	tristate "OmniVision OV08X40 sensor support"
 	depends on VIDEO_DEV && I2C
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV08X40 camera.
@@ -400,9 +329,6 @@ config VIDEO_OV08X40
 config VIDEO_OV13858
 	tristate "OmniVision OV13858 sensor support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV13858 camera.
@@ -410,9 +336,6 @@ config VIDEO_OV13858
 config VIDEO_OV13B10
 	tristate "OmniVision OV13B10 sensor support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV13B10 camera.
@@ -420,7 +343,6 @@ config VIDEO_OV13B10
 config VIDEO_OV2640
 	tristate "OmniVision OV2640 sensor support"
 	depends on VIDEO_DEV && I2C
-	select V4L2_ASYNC
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV2640 camera.
@@ -431,7 +353,6 @@ config VIDEO_OV2640
 config VIDEO_OV2659
 	tristate "OmniVision OV2659 sensor support"
 	depends on VIDEO_DEV && I2C && GPIOLIB
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV2659 camera.
@@ -442,8 +363,6 @@ config VIDEO_OV2659
 config VIDEO_OV2680
 	tristate "OmniVision OV2680 sensor support"
 	depends on VIDEO_DEV && I2C
-	select MEDIA_CONTROLLER
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV2680 camera.
@@ -454,9 +373,6 @@ config VIDEO_OV2680
 config VIDEO_OV2685
 	tristate "OmniVision OV2685 sensor support"
 	depends on VIDEO_DEV && I2C
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV2685 camera.
@@ -468,9 +384,6 @@ config VIDEO_OV2740
 	tristate "OmniVision OV2740 sensor support"
 	depends on VIDEO_DEV && I2C
 	depends on ACPI || COMPILE_TEST
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	select REGMAP_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -482,9 +395,6 @@ config VIDEO_OV2740
 config VIDEO_OV4689
 	tristate "OmniVision OV4689 sensor support"
 	depends on GPIOLIB && VIDEO_DEV && I2C
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor-level driver for the OmniVision
 	  OV4689 camera.
@@ -496,9 +406,6 @@ config VIDEO_OV5640
 	tristate "OmniVision OV5640 sensor support"
 	depends on OF
 	depends on GPIOLIB && VIDEO_DEV && I2C
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the Omnivision
 	  OV5640 camera sensor with a MIPI CSI-2 interface.
@@ -507,9 +414,6 @@ config VIDEO_OV5645
 	tristate "OmniVision OV5645 sensor support"
 	depends on OF
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5645 camera.
@@ -520,9 +424,6 @@ config VIDEO_OV5645
 config VIDEO_OV5647
 	tristate "OmniVision OV5647 sensor support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5647 camera.
@@ -533,9 +434,6 @@ config VIDEO_OV5647
 config VIDEO_OV5648
 	tristate "OmniVision OV5648 sensor support"
 	depends on I2C && PM && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5648 camera.
@@ -546,9 +444,6 @@ config VIDEO_OV5648
 config VIDEO_OV5670
 	tristate "OmniVision OV5670 sensor support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5670 camera.
@@ -559,9 +454,6 @@ config VIDEO_OV5670
 config VIDEO_OV5675
 	tristate "OmniVision OV5675 sensor support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5675 camera.
@@ -572,7 +464,6 @@ config VIDEO_OV5675
 config VIDEO_OV5693
 	tristate "OmniVision OV5693 sensor support"
 	depends on I2C && VIDEO_DEV
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5693 camera.
@@ -583,7 +474,6 @@ config VIDEO_OV5693
 config VIDEO_OV5695
 	tristate "OmniVision OV5695 sensor support"
 	depends on I2C && VIDEO_DEV
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5695 camera.
@@ -604,9 +494,6 @@ config VIDEO_OV6650
 config VIDEO_OV7251
 	tristate "OmniVision OV7251 sensor support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV7251 camera.
@@ -627,7 +514,6 @@ config VIDEO_OV7640
 config VIDEO_OV7670
 	tristate "OmniVision OV7670 sensor support"
 	depends on I2C && VIDEO_DEV
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV7670 VGA camera.  It currently only works with the M88ALP01
@@ -637,7 +523,6 @@ config VIDEO_OV772X
 	tristate "OmniVision OV772x sensor support"
 	depends on I2C && VIDEO_DEV
 	select REGMAP_SCCB
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV772x camera.
@@ -656,9 +541,6 @@ config VIDEO_OV7740
 config VIDEO_OV8856
 	tristate "OmniVision OV8856 sensor support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV8856 camera sensor.
@@ -669,9 +551,6 @@ config VIDEO_OV8856
 config VIDEO_OV8858
 	tristate "OmniVision OV8858 sensor support"
 	depends on I2C && PM && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for OmniVision
 	  OV8858 camera sensor.
@@ -682,9 +561,6 @@ config VIDEO_OV8858
 config VIDEO_OV8865
 	tristate "OmniVision OV8865 sensor support"
 	depends on I2C && PM && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for OmniVision
 	  OV8865 camera sensor.
@@ -696,9 +572,6 @@ config VIDEO_OV9282
 	tristate "OmniVision OV9282 sensor support"
 	depends on OF_GPIO
 	depends on I2C && VIDEO_DEV
-	select VIDEO_V4L2_SUBDEV_API
-	select MEDIA_CONTROLLER
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV9282 camera sensor.
@@ -716,8 +589,6 @@ config VIDEO_OV9640
 config VIDEO_OV9650
 	tristate "OmniVision OV9650/OV9652 sensor support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP_SCCB
 	help
 	  This is a V4L2 sensor driver for the Omnivision
@@ -727,9 +598,6 @@ config VIDEO_OV9734
 	tristate "OmniVision OV9734 sensor support"
 	depends on VIDEO_DEV && I2C
 	depends on ACPI || COMPILE_TEST
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV9734 camera.
@@ -740,9 +608,6 @@ config VIDEO_OV9734
 config VIDEO_RDACM20
 	tristate "IMI RDACM20 camera support"
 	depends on I2C
-	select V4L2_FWNODE
-	select VIDEO_V4L2_SUBDEV_API
-	select MEDIA_CONTROLLER
 	select VIDEO_MAX9271_LIB
 	help
 	  This driver supports the IMI RDACM20 GMSL camera, used in
@@ -754,9 +619,6 @@ config VIDEO_RDACM20
 config VIDEO_RDACM21
 	tristate "IMI RDACM21 camera support"
 	depends on I2C
-	select V4L2_FWNODE
-	select VIDEO_V4L2_SUBDEV_API
-	select MEDIA_CONTROLLER
 	select VIDEO_MAX9271_LIB
 	help
 	  This driver supports the IMI RDACM21 GMSL camera, used in
@@ -778,9 +640,6 @@ config VIDEO_RJ54N1
 config VIDEO_S5C73M3
 	tristate "Samsung S5C73M3 sensor support"
 	depends on I2C && SPI && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a V4L2 sensor driver for Samsung S5C73M3
 	  8 Mpixel camera.
@@ -788,9 +647,6 @@ config VIDEO_S5C73M3
 config VIDEO_S5K5BAF
 	tristate "Samsung S5K5BAF sensor support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a V4L2 sensor driver for Samsung S5K5BAF 2M
 	  camera sensor with an embedded SoC image signal processor.
@@ -798,8 +654,6 @@ config VIDEO_S5K5BAF
 config VIDEO_S5K6A3
 	tristate "Samsung S5K6A3 sensor support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
 	help
 	  This is a V4L2 sensor driver for Samsung S5K6A3 raw
 	  camera sensor.
@@ -807,9 +661,6 @@ config VIDEO_S5K6A3
 config VIDEO_ST_VGXY61
 	tristate "ST VGXY61 sensor support"
 	depends on OF && GPIOLIB && VIDEO_DEV && I2C
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the ST VGXY61
 	  camera sensor.
diff --git a/drivers/media/i2c/ccs/Kconfig b/drivers/media/i2c/ccs/Kconfig
index 71671db3d993..7cc17b0e3153 100644
--- a/drivers/media/i2c/ccs/Kconfig
+++ b/drivers/media/i2c/ccs/Kconfig
@@ -2,10 +2,7 @@
 config VIDEO_CCS
 	tristate "MIPI CCS/SMIA++/SMIA sensor support"
 	depends on I2C && VIDEO_DEV && HAVE_CLK
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
 	select VIDEO_CCS_PLL
-	select V4L2_FWNODE
 	help
 	  This is a generic driver for MIPI CCS, SMIA++ and SMIA compliant
 	  camera sensors.
diff --git a/drivers/media/i2c/et8ek8/Kconfig b/drivers/media/i2c/et8ek8/Kconfig
index 398dd4d21df1..9cd2bcedd550 100644
--- a/drivers/media/i2c/et8ek8/Kconfig
+++ b/drivers/media/i2c/et8ek8/Kconfig
@@ -2,9 +2,6 @@
 config VIDEO_ET8EK8
 	tristate "ET8EK8 camera sensor support"
 	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a driver for the Toshiba ET8EK8 5 MP camera sensor.
 	  It is used for example in Nokia N900 (RX-51).
-- 
2.39.2

