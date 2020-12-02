Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEB072CBE07
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 14:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730172AbgLBNOZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 08:14:25 -0500
Received: from comms.puri.sm ([159.203.221.185]:33188 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729896AbgLBNOZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 08:14:25 -0500
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 33AF3E112F;
        Wed,  2 Dec 2020 05:13:14 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Nycj4wAOVjs2; Wed,  2 Dec 2020 05:13:13 -0800 (PST)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     rogerio.silva@nxp.com, slongerbeam@gmail.com,
        p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org,
        festevam@gmail.com, hverkuil@xs4all.nl
Cc:     kernel@puri.sm, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v2] staging: media: imx: Kconfig: support VIDEO_IMX7_CSI for imx8m
Date:   Wed,  2 Dec 2020 14:12:51 +0100
Message-Id: <20201202131251.3422-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As described in NXPs' linux tree, the imx8m SoC includes the same
CSI bridge hardware that is part of imx7d. We should be able to
use the "fsl,imx7-csi" driver for imx8m directly.

Since ipuv3 is not relevant for imx8m, move that dependency to
VIDEO_IMX_CSI. That makes VIDEO_IMX7_CSI available to support imx8m
too.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---

revision history:

v2: (thanks Philipp and Hans for feedback)
  * make only VIDEO_IMX_CSI build imx6-media and thus make VIDEO_IMX_MEDIA
    only build common which can be use by all modules.

v1:
  https://lore.kernel.org/linux-media/20201109091340.7223-1-martin.kepplinger@puri.sm/

 drivers/staging/media/imx/Kconfig  | 9 +++++----
 drivers/staging/media/imx/Makefile | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
index f555aac8a9d5..15322dc3124a 100644
--- a/drivers/staging/media/imx/Kconfig
+++ b/drivers/staging/media/imx/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_IMX_MEDIA
 	tristate "i.MX5/6 V4L2 media core driver"
 	depends on ARCH_MXC || COMPILE_TEST
-	depends on VIDEO_V4L2 && IMX_IPUV3_CORE
+	depends on VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	depends on HAS_DMA
@@ -14,21 +14,22 @@ config VIDEO_IMX_MEDIA
 	  driver for the i.MX5/6 SOC.
 
 if VIDEO_IMX_MEDIA
-menu "i.MX5/6/7 Media Sub devices"
+menu "i.MX5/6/7/8 Media Sub devices"
 
 config VIDEO_IMX_CSI
 	tristate "i.MX5/6 Camera Sensor Interface driver"
 	depends on VIDEO_IMX_MEDIA && VIDEO_DEV && I2C
+	depends on IMX_IPUV3_CORE
 	default y
 	help
 	  A video4linux camera sensor interface driver for i.MX5/6.
 
 config VIDEO_IMX7_CSI
-	tristate "i.MX6UL/L / i.MX7 Camera Sensor Interface driver"
+	tristate "i.MX6UL/L / i.MX7 / i.MX8M Camera Sensor Interface driver"
 	depends on VIDEO_IMX_MEDIA && VIDEO_DEV && I2C
 	default y
 	help
 	  Enable support for video4linux camera sensor interface driver for
-	  i.MX6UL/L or i.MX7.
+	  i.MX6UL/L, i.MX7 or i.MX8M.
 endmenu
 endif
diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
index 9bd9e873ba7c..69cc5da04a2e 100644
--- a/drivers/staging/media/imx/Makefile
+++ b/drivers/staging/media/imx/Makefile
@@ -8,9 +8,9 @@ imx-media-common-objs := imx-media-capture.o imx-media-dev-common.o \
 
 imx6-media-csi-objs := imx-media-csi.o imx-media-fim.o
 
-obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-media.o
 obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-common.o
 
+obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-media.o
 obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-media-csi.o
 obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-mipi-csi2.o
 
-- 
2.20.1

