Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFD9ADD23
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 18:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390039AbfIIQ0O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 12:26:14 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:54496 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389970AbfIIQ0N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 12:26:13 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x89GQCoD034953;
        Mon, 9 Sep 2019 11:26:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568046372;
        bh=5RY0TSrueUy1sl4aV6eycfVnufXVGVhMjSJNvoKMiDk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=rAMPJLlvjtQK9PKVkftHABQsO/7rWHK7xWNs6/7pfYr4GBPUPHSEp4B/ejQQr8wIR
         6BO8EP8ebDbmnwyba/B6G2M6qqkWvtoOD6+Oxks6yZ/L7c9cYFWSqHvx9JpsWWk3pz
         oLOcGUhKnKyzxvupGkvjcKGWAoZkHRubajdrNwxU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89GQCQq119558;
        Mon, 9 Sep 2019 11:26:12 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 9 Sep
 2019 11:26:12 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 9 Sep 2019 11:26:12 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89GPnoa056522;
        Mon, 9 Sep 2019 11:26:12 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 12/13] media: am437x-vpfe: Remove per bus width static data
Date:   Mon, 9 Sep 2019 11:27:42 -0500
Message-ID: <20190909162743.30114-13-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190909162743.30114-1-bparrot@ti.com>
References: <20190909162743.30114-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The bus related static data include in the vpfe_fmt
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
index 9759ed398943..9855d4cb1d13 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -73,73 +73,43 @@ static struct vpfe_fmt formats[] = {
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
index 0d10d2b4d7a2..2c9e89395bea 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.h
+++ b/drivers/media/platform/am437x/am437x-vpfe.h
@@ -215,28 +215,16 @@ struct vpfe_ccdc {
 	u32 ccdc_ctx[VPFE_REG_END / sizeof(u32)];
 };
 
-/*
- * struct bus_format - VPFE bus format information
- * @width: Bits per pixel (when transferred over a bus)
- * @bpp: Bytes per pixel (when stored in memory)
- */
-struct bus_format {
-	unsigned int width;
-	unsigned int bpp;
-};
-
 /*
  * struct vpfe_fmt - VPFE media bus format information
  * @fourcc: V4L2 pixel format code
  * @code: V4L2 media bus format code
- * @l: 10 bit bus format info
- * @s: 8 bit bus format info
+ * @bitsperpixel: Bits per pixel over the bus
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

