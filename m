Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 042862EAE47
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbhAEPaW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:30:22 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37698 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbhAEPaW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:30:22 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E35306EF;
        Tue,  5 Jan 2021 16:29:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860578;
        bh=TjgMckOMEJb9R+QVcIHbZQdIUJssyITLaSFJkON8idA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hGF7jsnmyfy8hQH9RGikO3j5UHEov609LakD48IwfJoh4moyZK9Uv9UuXWqtj5BlK
         dZUGhsIp7P6Yb9dgznya647StojhYRxRSAIbcDZSBzlidi+61e2IcPmvQ35NRRZ6tM
         zYZ+D/nLTJuAh7/TcWzPT4IZ4yU/QrDuFxp7bo4s=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 02/75] media: imx: Move dependency on VIDEO_DEV to common Kconfig symbol
Date:   Tue,  5 Jan 2021 17:27:39 +0200
Message-Id: <20210105152852.5733-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All the i.MX staging media drivers depend on VIDEO_DEV. Move the
dependency to the common VIDEO_IMX_MEDIA symbol to avoid repeating it.

While at it, sort the dependencies and selections alphabetically.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/Kconfig | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
index 4782f7cfb709..76a9111c189c 100644
--- a/drivers/staging/media/imx/Kconfig
+++ b/drivers/staging/media/imx/Kconfig
@@ -2,13 +2,14 @@
 config VIDEO_IMX_MEDIA
 	tristate "i.MX5/6 V4L2 media core driver"
 	depends on ARCH_MXC || COMPILE_TEST
+	depends on HAS_DMA
+	depends on VIDEO_DEV
 	depends on VIDEO_V4L2 && IMX_IPUV3_CORE
 	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	depends on HAS_DMA
-	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
 	select V4L2_MEM2MEM_DEV
+	select VIDEOBUF2_DMA_CONTIG
+	select VIDEO_V4L2_SUBDEV_API
 	help
 	  Say yes here to enable support for video4linux media controller
 	  driver for the i.MX5/6 SOC.
@@ -18,14 +19,14 @@ menu "i.MX5/6/7 Media Sub devices"
 
 config VIDEO_IMX_CSI
 	tristate "i.MX5/6 Camera Sensor Interface driver"
-	depends on VIDEO_IMX_MEDIA && VIDEO_DEV
+	depends on VIDEO_IMX_MEDIA
 	default y
 	help
 	  A video4linux camera sensor interface driver for i.MX5/6.
 
 config VIDEO_IMX7_CSI
 	tristate "i.MX6UL/L / i.MX7 Camera Sensor Interface driver"
-	depends on VIDEO_IMX_MEDIA && VIDEO_DEV
+	depends on VIDEO_IMX_MEDIA
 	default y
 	help
 	  Enable support for video4linux camera sensor interface driver for
-- 
Regards,

Laurent Pinchart

