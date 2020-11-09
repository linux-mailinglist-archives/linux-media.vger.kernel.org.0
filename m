Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F15F02AB3E9
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 10:46:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729037AbgKIJqt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 04:46:49 -0500
Received: from comms.puri.sm ([159.203.221.185]:59448 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728866AbgKIJqs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Nov 2020 04:46:48 -0500
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 275A4E03D9;
        Mon,  9 Nov 2020 01:46:48 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id W6rHdbftXP-5; Mon,  9 Nov 2020 01:46:47 -0800 (PST)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     rogerio.silva@nxp.com, slongerbeam@gmail.com,
        p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org,
        festevam@gmail.com
Cc:     iain.galloway@nxp.com, kernel@puri.sm, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH] staging: media: imx: Split config option in 2
Date:   Mon,  9 Nov 2020 10:46:33 +0100
Message-Id: <20201109094633.13518-1-martin.kepplinger@puri.sm>
In-Reply-To: <2aec3ae20bf5a9eefbe691a69c76c91b09af2a35.camel@pengutronix.de>
References: <2aec3ae20bf5a9eefbe691a69c76c91b09af2a35.camel@pengutronix.de>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As described in NXPs' linux tree, the imx8m SoC includes the same
CSI bridge hardware that is part of imx7d. We should be able to
use the "fsl,imx7-csi" driver for imx8m directly.

Since ipuv3 is not relevant for imx8m we create VIDEO_IMX7_MEDIA and
split up the configuration option in 2 menus (on 1 entry each
for now but that can be changed later).

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---

thanks, you're right. did you have something like this in mind?

                            martin



 drivers/staging/media/imx/Kconfig | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
index f555aac8a9d5..a888d9b918b5 100644
--- a/drivers/staging/media/imx/Kconfig
+++ b/drivers/staging/media/imx/Kconfig
@@ -13,6 +13,20 @@ config VIDEO_IMX_MEDIA
 	  Say yes here to enable support for video4linux media controller
 	  driver for the i.MX5/6 SOC.
 
+config VIDEO_IMX7_MEDIA
+	tristate "i.MX7/8 V4L2 media core driver"
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	depends on HAS_DMA
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_FWNODE
+	select V4L2_MEM2MEM_DEV
+	help
+	  Say yes here to enable support for video4linux media controller
+	  driver for the i.MX7/8M SOC.
+
 if VIDEO_IMX_MEDIA
 menu "i.MX5/6/7 Media Sub devices"
 
@@ -23,12 +37,19 @@ config VIDEO_IMX_CSI
 	help
 	  A video4linux camera sensor interface driver for i.MX5/6.
 
+endmenu
+endif
+
+if VIDEO_IMX7_MEDIA
+menu "i.MX7/8 Media Sub devices"
+
 config VIDEO_IMX7_CSI
-	tristate "i.MX6UL/L / i.MX7 Camera Sensor Interface driver"
-	depends on VIDEO_IMX_MEDIA && VIDEO_DEV && I2C
+	tristate "i.MX7 / i.MX8M Camera Sensor Interface driver"
+	depends on VIDEO_IMX7_MEDIA && VIDEO_DEV && I2C
 	default y
 	help
 	  Enable support for video4linux camera sensor interface driver for
-	  i.MX6UL/L or i.MX7.
+	  i.MX6UL/L, i.MX7 or i.MX8M.
+
 endmenu
 endif
-- 
2.20.1

