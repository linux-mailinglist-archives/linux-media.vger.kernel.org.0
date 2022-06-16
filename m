Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A311B54E768
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 18:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233941AbiFPQg4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 12:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233539AbiFPQg4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 12:36:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68AFE289A6
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 09:36:55 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 852AF415;
        Thu, 16 Jun 2022 18:36:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655397414;
        bh=Zmg5sPGNTDvwpZ17avmn6dfrXAK8Sr4OFXzA7G1Ne6M=;
        h=From:To:Cc:Subject:Date:From;
        b=i8ihwnfKkuFCSeaXc+aoIjoPSX/uMm/x8QZhQuSa7M/Jbr7K9NWTLh3u5vZodJgYl
         S3SjvNOQI0d7Foo8HxWx9d8ZhrMk1bb2O9keuo6XpJ1uYKRnfTAj4m7fts6bl0evbU
         KZzjzU/OWyJrV16mC5fXwyspBmYWtoNzfAMcEqrc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH] media: Replace dependency on VIDEO_V4L2_SUBDEV_API with select
Date:   Thu, 16 Jun 2022 19:36:32 +0300
Message-Id: <20220616163632.13562-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The VIDEO_V4L2_SUBDEV_API Kconfig symbol is mostly selected
automatically, with a a handful of drivers still using it as a
dependency. Fix them to use selection, and drop the symbol title text to
not expose it for manual selection.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/Kconfig            | 3 ++-
 drivers/media/platform/atmel/Kconfig | 3 ++-
 drivers/media/v4l2-core/Kconfig      | 5 +++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 2b20aa6c37b1..51fc3fb72d95 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -75,8 +75,9 @@ config VIDEO_HI847
 
 config VIDEO_IMX208
 	tristate "Sony IMX208 sensor support"
-	depends on I2C && VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_DEV
 	depends on MEDIA_CAMERA_SUPPORT
+	select VIDEO_V4L2_SUBDEV_API
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX208 camera.
diff --git a/drivers/media/platform/atmel/Kconfig b/drivers/media/platform/atmel/Kconfig
index 83aebee0c8eb..da8ffc39d11d 100644
--- a/drivers/media/platform/atmel/Kconfig
+++ b/drivers/media/platform/atmel/Kconfig
@@ -20,12 +20,13 @@ config VIDEO_ATMEL_ISC
 config VIDEO_ATMEL_XISC
 	tristate "ATMEL eXtended Image Sensor Controller (XISC) support"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_DEV && COMMON_CLK && VIDEO_V4L2_SUBDEV_API
+	depends on VIDEO_DEV && COMMON_CLK
 	depends on ARCH_AT91 || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select REGMAP_MMIO
 	select V4L2_FWNODE
 	select VIDEO_ATMEL_ISC_BASE
+	select VIDEO_V4L2_SUBDEV_API
 	help
 	   This module makes the ATMEL eXtended Image Sensor Controller
 	   available as a v4l2 device.
diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index 1be9a2cc947a..5141c8215b2f 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -9,7 +9,7 @@ config VIDEO_V4L2_I2C
 	default y
 
 config VIDEO_V4L2_SUBDEV_API
-	bool "V4L2 sub-device userspace API"
+	bool
 	depends on VIDEO_DEV && MEDIA_CONTROLLER
 	help
 	  Enables the V4L2 sub-device pad-level userspace API used to configure
@@ -56,9 +56,10 @@ config V4L2_MEM2MEM_DEV
 # Used by LED subsystem flash drivers
 config V4L2_FLASH_LED_CLASS
 	tristate "V4L2 flash API for LED flash class devices"
-	depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
+	depends on VIDEO_DEV
 	depends on LEDS_CLASS_FLASH
 	select V4L2_ASYNC
+	select VIDEO_V4L2_SUBDEV_API
 	help
 	  Say Y here to enable V4L2 flash API support for LED flash
 	  class drivers.
-- 
Regards,

Laurent Pinchart

