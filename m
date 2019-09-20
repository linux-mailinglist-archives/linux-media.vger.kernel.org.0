Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD16B9642
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 19:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406072AbfITREW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 13:04:22 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39352 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405909AbfITREF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 13:04:05 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KH44o2101496;
        Fri, 20 Sep 2019 12:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568999044;
        bh=HcJj0nl1EHDN9X+ArimtfzePVfUUI8cGYiW8HUqphmM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=jF8EhSr/N68L6RNp7R1Vy+kAk9E1fZjmH4v0U6JNO4mMRDv6DqoSzI0vbAu0fyDPR
         QHbwHVOEIe38lbzOKK1qaWa9nKw/ujCykzIC9KFs/gbrOdTIAwASj/uRBDyHKvUmXv
         3u/7qZhyrzbAUHyM3TXoi9pQ4lFzHa79hAazNFzE=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8KH44Zs103391
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Sep 2019 12:04:04 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 20
 Sep 2019 12:04:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 20 Sep 2019 12:03:59 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KH3r75054719;
        Fri, 20 Sep 2019 12:04:04 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 11/13] media: am437x-vpfe: Remove per bus width static data
Date:   Fri, 20 Sep 2019 12:05:52 -0500
Message-ID: <20190920170554.29666-12-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920170554.29666-1-bparrot@ti.com>
References: <20190920170554.29666-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The bus related static data included in the vpfe_fmt
static table can be derived dynamically instead.
This simplify the table and it's use.

We instead replace the per bus data info with just
the usual bit per pixel value for each supported
pixel format.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 56 ++++++---------------
 drivers/media/platform/am437x/am437x-vpfe.h | 16 +-----
 2 files changed, 16 insertions(+), 56 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index e5ce9c8431ee..ff507501057e 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -73,73 +73,43 @@ static struct vpfe_fmt formats[VPFE_NUM_FORMATS] = {
 	{
 		.fourcc		= V4L2_PIX_FMT_YUYV,
 		.code		= MEDIA_BUS_FMT_YUYV8_2X8,
-		.l.width	= 10,
-		.l.bpp		= 4,
-		.s.width	= 8,
-		.s.bpp		= 2,
+		.bitsperpixel	= 16,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_UYVY,
 		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
-		.l.width	= 10,
-		.l.bpp		= 4,
-		.s.width	= 8,
-		.s.bpp		= 2,
+		.bitsperpixel	= 16,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_YVYU,
 		.code		= MEDIA_BUS_FMT_YVYU8_2X8,
-		.l.width	= 10,
-		.l.bpp		= 4,
-		.s.width	= 8,
-		.s.bpp		= 2,
+		.bitsperpixel	= 16,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_VYUY,
 		.code		= MEDIA_BUS_FMT_VYUY8_2X8,
-		.l.width	= 10,
-		.l.bpp		= 4,
-		.s.width	= 8,
-		.s.bpp		= 2,
+		.bitsperpixel	= 16,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_SBGGR8,
 		.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
-		.l.width	= 10,
-		.l.bpp		= 2,
-		.s.width	= 8,
-		.s.bpp		= 1,
+		.bitsperpixel	= 8,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_SGBRG8,
 		.code		= MEDIA_BUS_FMT_SGBRG8_1X8,
-		.l.width	= 10,
-		.l.bpp		= 2,
-		.s.width	= 8,
-		.s.bpp		= 1,
+		.bitsperpixel	= 8,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_SGRBG8,
 		.code		= MEDIA_BUS_FMT_SGRBG8_1X8,
-		.l.width	= 10,
-		.l.bpp		= 2,
-		.s.width	= 8,
-		.s.bpp		= 1,
+		.bitsperpixel	= 8,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_SRGGB8,
 		.code		= MEDIA_BUS_FMT_SRGGB8_1X8,
-		.l.width	= 10,
-		.l.bpp		= 2,
-		.s.width	= 8,
-		.s.bpp		= 1,
+		.bitsperpixel	= 8,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_RGB565,
 		.code		= MEDIA_BUS_FMT_RGB565_2X8_LE,
-		.l.width	= 10,
-		.l.bpp		= 4,
-		.s.width	= 8,
-		.s.bpp		= 2,
+		.bitsperpixel	= 16,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_RGB565X,
 		.code		= MEDIA_BUS_FMT_RGB565_2X8_BE,
-		.l.width	= 10,
-		.l.bpp		= 4,
-		.s.width	= 8,
-		.s.bpp		= 2,
+		.bitsperpixel	= 16,
 	},
 };
 
@@ -184,9 +154,11 @@ static unsigned int __get_bytesperpixel(struct vpfe_device *vpfe,
 {
 	struct vpfe_subdev_info *sdinfo = vpfe->current_subdev;
 	unsigned int bus_width = sdinfo->vpfe_param.bus_width;
-	u32 bpp;
+	u32 bpp, bus_width_bytes, clocksperpixel;
 
-	bpp = (bus_width == 10) ? fmt->l.bpp : fmt->s.bpp;
+	bus_width_bytes = ALIGN(bus_width, 8) >> 3;
+	clocksperpixel = DIV_ROUND_UP(fmt->bitsperpixel, bus_width);
+	bpp = clocksperpixel * bus_width_bytes;
 
 	return bpp;
 }
diff --git a/drivers/media/platform/am437x/am437x-vpfe.h b/drivers/media/platform/am437x/am437x-vpfe.h
index b08b8e19c46b..77ebffeec160 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.h
+++ b/drivers/media/platform/am437x/am437x-vpfe.h
@@ -215,28 +215,16 @@ struct vpfe_ccdc {
 	u32 ccdc_ctx[VPFE_REG_END / sizeof(u32)];
 };
 
-/*
- * struct bus_format - VPFE bus format information
- * width: Bits per pixel (when transferred over a bus)
- * bpp: Bytes per pixel (when stored in memory)
- */
-struct bus_format {
-	unsigned int width;
-	unsigned int bpp;
-};
-
 /*
  * struct vpfe_fmt - VPFE media bus format information
  * fourcc: V4L2 pixel format code
  * code: V4L2 media bus format code
- * l: 10 bit bus format info
- * s: 8 bit bus format info
+ * bitsperpixel: Bits per pixel over the bus
  */
 struct vpfe_fmt {
 	u32 fourcc;
 	u32 code;
-	struct bus_format l;
-	struct bus_format s;
+	u32 bitsperpixel;
 };
 
 /*
-- 
2.17.1

