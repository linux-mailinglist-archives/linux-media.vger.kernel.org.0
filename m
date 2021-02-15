Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6715631B487
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:29:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbhBOE26 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:28:58 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45318 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbhBOE25 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:28:57 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 96C15B23;
        Mon, 15 Feb 2021 05:28:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363293;
        bh=lz5+luCqSOqGMQjHDZW6HFX0ZIdiflJo3OC0wAx2Nkw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=atuFDEmfCUsiOBbZ4K1FUEabeBAt/6HkzGACrb1po5gXYRRg02x0M0ctfy1+L3Jb8
         IzUp9XKD+IWNxqX1TXfMMP6Nn9m+OGHumN/McqXjxi65p59z1+cCy1fsJ5/WvF2s4P
         uz7eTnwTVmbcKUOw6tYF0SvUNK7mwUkoqJVBucWo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 02/77] media: imx: Move dependency on VIDEO_DEV to common Kconfig symbol
Date:   Mon, 15 Feb 2021 06:26:26 +0200
Message-Id: <20210215042741.28850-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All the i.MX staging media drivers depend on VIDEO_DEV. Move the
dependency to the common VIDEO_IMX_MEDIA symbol to avoid repeating it.

While at it, sort the dependencies and selections alphabetically.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/media/imx/Kconfig | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
index 743e43742211..e3ca3c9d5d22 100644
--- a/drivers/staging/media/imx/Kconfig
+++ b/drivers/staging/media/imx/Kconfig
@@ -2,13 +2,14 @@
 config VIDEO_IMX_MEDIA
 	tristate "i.MX5/6 V4L2 media core driver"
 	depends on ARCH_MXC || COMPILE_TEST
+	depends on HAS_DMA
+	depends on VIDEO_DEV
 	depends on VIDEO_V4L2
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
@@ -18,7 +19,7 @@ menu "i.MX5/6/7/8 Media Sub devices"
 
 config VIDEO_IMX_CSI
 	tristate "i.MX5/6 Camera Sensor Interface driver"
-	depends on VIDEO_IMX_MEDIA && VIDEO_DEV
+	depends on VIDEO_IMX_MEDIA
 	depends on IMX_IPUV3_CORE
 	default y
 	help
@@ -26,7 +27,7 @@ config VIDEO_IMX_CSI
 
 config VIDEO_IMX7_CSI
 	tristate "i.MX6UL/L / i.MX7 / i.MX8M Camera Sensor Interface driver"
-	depends on VIDEO_IMX_MEDIA && VIDEO_DEV
+	depends on VIDEO_IMX_MEDIA
 	default y
 	help
 	  Enable support for video4linux camera sensor interface driver for
-- 
Regards,

Laurent Pinchart

