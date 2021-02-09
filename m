Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3095A314DF1
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 12:11:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232159AbhBILK6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 06:10:58 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:39071 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232120AbhBILKF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 06:10:05 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 45BB76000A;
        Tue,  9 Feb 2021 11:09:18 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-next@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] media: i2c: Kconfig: Make MAX9271 a module
Date:   Tue,  9 Feb 2021 12:09:21 +0100
Message-Id: <20210209110921.20653-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the introduction of the RDACM21 camera module support in commit
a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module") the
symbols defined by the max9271 library were exported twice if multiple
users of the library were compiled in at the same time.

In example:
WARNING: modpost: drivers/media/i2c/rdacm21-camera_module:
'max9271_set_serial_link' exported twice. Previous export was in
drivers/media/i2c/rdacm20-camera_module.ko

Fix this by making the max9271 file a module and have the driver
using its functions select it.

Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/Kconfig  | 5 +++++
 drivers/media/i2c/Makefile | 7 +++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 2d3dc0d82f9e..462c0e059754 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1240,12 +1240,16 @@ config VIDEO_NOON010PC30

 source "drivers/media/i2c/m5mols/Kconfig"

+config VIDEO_MAX9271_LIB
+	tristate
+
 config VIDEO_RDACM20
 	tristate "IMI RDACM20 camera support"
 	depends on I2C
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
+	select VIDEO_MAX9271_LIB
 	help
 	  This driver supports the IMI RDACM20 GMSL camera, used in
 	  ADAS systems.
@@ -1259,6 +1263,7 @@ config VIDEO_RDACM21
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
+	select VIDEO_MAX9271_LIB
 	help
 	  This driver supports the IMI RDACM21 GMSL camera, used in
 	  ADAS systems.
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 6bd22d63e1a7..0c067beca066 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -125,10 +125,9 @@ obj-$(CONFIG_VIDEO_IMX319)	+= imx319.o
 obj-$(CONFIG_VIDEO_IMX334)	+= imx334.o
 obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
 obj-$(CONFIG_VIDEO_MAX9286)	+= max9286.o
-rdacm20-camera_module-objs	:= rdacm20.o max9271.o
-obj-$(CONFIG_VIDEO_RDACM20)	+= rdacm20-camera_module.o
-rdacm21-camera_module-objs	:= rdacm21.o max9271.o
-obj-$(CONFIG_VIDEO_RDACM21)	+= rdacm21-camera_module.o
+obj-$(CONFIG_VIDEO_MAX9271_LIB)	+= max9271.o
+obj-$(CONFIG_VIDEO_RDACM20)	+= rdacm20.o
+obj-$(CONFIG_VIDEO_RDACM21)	+= rdacm21.o
 obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o

 obj-$(CONFIG_SDR_MAX2175) += max2175.o
--
2.30.0

