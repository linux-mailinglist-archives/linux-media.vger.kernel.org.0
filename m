Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFDA8B82BB
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 22:41:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404587AbfISUje (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 16:39:34 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42674 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392703AbfISUjd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 16:39:33 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8JKdW0j117057;
        Thu, 19 Sep 2019 15:39:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568925572;
        bh=BsJNAa9n7sZi49Q5hXovb2D/EEx3oMvJ1snAAQRmMRM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=y08qj9xFVAh+Ja6rIgxUiI5znKkrqZDNYH5K7HE5Wa3O25b7bSMwQjZMMYTsPP0Im
         lClnsl58/zURu/CUJn76cW5z+U14ecFkZ4Jbu1xc3Zn+Q0rndA2p+SA3+x+z2zK7Au
         9LscpTaupUfrb0Z8MlPkr9Iu7pcvdfyzfKkVX6fU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8JKdWru001893
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Sep 2019 15:39:32 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 19
 Sep 2019 15:39:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 19 Sep 2019 15:39:28 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JKdKIf014276;
        Thu, 19 Sep 2019 15:39:32 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 12/13] media: am437x-vpfe: Remove per bus width static data
Date:   Thu, 19 Sep 2019 15:41:24 -0500
Message-ID: <20190919204125.15254-13-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190919204125.15254-1-bparrot@ti.com>
References: <20190919204125.15254-1-bparrot@ti.com>
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
index 47404d799029..6416b7955fb7 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -73,73 +73,43 @@ static struct vpfe_fmt formats[VPFE_MAX_ACTIVE_FMT] = {
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
index aa5ddaec774c..7556cca308c2 100644
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

