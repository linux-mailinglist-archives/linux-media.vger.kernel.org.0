Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B61EA19DFF3
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 22:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728464AbgDCU64 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 16:58:56 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34889 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727907AbgDCU64 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 16:58:56 -0400
Received: by mail-pl1-f195.google.com with SMTP id c12so3244179plz.2
        for <linux-media@vger.kernel.org>; Fri, 03 Apr 2020 13:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lTcgObL+/HQVhYVuwMyP7x81+0XA5GAvjv1OxS6I+/U=;
        b=idiyU2Dr87mei0ngAA/KZvfQCjK+eogYQC9fV4FddRpwtajIpC79p4BM11qj9Ru8+F
         0oxlC2vnfitiPEt81gWSoJufpLmQSt38oREh+eUODqzzj5PhywDAePX4vUedbSnk/rp5
         jswnz0UzE2LbfznLoUJnda8iMPrbHGMbjF0TBYMQHJpT88wbqIoFgMUL8yM16big2U4v
         DQO+6hDDAxQhv0EVZux8kvoDQkeK82Cy4DLrPjwhEp/z6sSS8Ucr950m/T31yZbpL3TM
         FwZF7UcIK9C3uliiYace5id+bbXNNcrmbWiCPH+2kvTVqXpfAVA8+kiy4ZlfgfOrgd8x
         Zy8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lTcgObL+/HQVhYVuwMyP7x81+0XA5GAvjv1OxS6I+/U=;
        b=o/WMowmyKVD66MGjOnW8tJFGOL568mQNiFS8WXdzMfLfSmFoGklpmYZpYtG4jBNtyh
         CBWfTgnKuhl92pB2FcGM09BdoZgH4MVs3+TBxFgZw0ud6rDtTE/lbMje4+bfOyJ+4L3l
         TEVjFDw+TNFLtfjb+eFhs44Eyy/biF4PQpa1j2RMmBFtn4+l5DtSbvxZT69frRyxfqDI
         ukXmLUe80/ucGq81p1qRkYgzg6dUme3yJvwAycHM6Neuj2Yd9st/wwxtQ+4TluVY7KZE
         9bK4u6Gjdkd9w0PmFOyTBf6UuJcS7RD4BeJ/9QWqdvBp92TvY1r/rGRS6Pz/p2G190tB
         vVxQ==
X-Gm-Message-State: AGi0PuZpeFVYCdZ41aZ9UdR6v6ED14tgdxeIf+7OFtESmtjupkVjqbHu
        AfJUBpwsdHcVqVRtcPTIsaJg6HMeeyc=
X-Google-Smtp-Source: APiQypJcdldZKd1FGKVWH59RG3rqlpAjjokLPW+HoeXtasysNQ/ZykRWlt73O0VIp/nBWG2me0oDnA==
X-Received: by 2002:a17:90a:f30e:: with SMTP id ca14mr10282346pjb.134.1585947533983;
        Fri, 03 Apr 2020 13:58:53 -0700 (PDT)
Received: from mappy.world.mentorg.com (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id s39sm6521266pjb.10.2020.04.03.13.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 13:58:53 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 06/12] media: imx: utils: Introduce PIXFMT_SEL_IPU
Date:   Fri,  3 Apr 2020 13:58:33 -0700
Message-Id: <20200403205839.4531-7-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403205839.4531-1-slongerbeam@gmail.com>
References: <20200403205839.4531-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a PIXFMT_SEL_IPU selection flag, to select only the IPU-internal
pixel formats, and move the single-entry IPU-internal pixel format
arrays into pixel_formats[]. imx_media_find_ipu_format() and
imx_media_enum_ipu_format() can now simply call find_format() and
enum_format().

The RGB32 format is both an IPU-internal format, and an in-memory format
via idmac channels that is supported by the IPUv3 driver, so it appears
twice in pixel_formats[], one with ipufmt=false for the in-memory format,
and again with ipufmt=true for the IPU-internal format.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 118 +++++---------------
 drivers/staging/media/imx/imx-media.h       |   1 +
 2 files changed, 27 insertions(+), 92 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index beaa920d7ac7..00a10bbd9a2d 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -53,7 +53,13 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 		.cs     = IPUV3_COLORSPACE_YUV,
 		.bpp    = 16,
 		.planar = true,
-	},
+	}, {
+		.fourcc = V4L2_PIX_FMT_YUV32,
+		.codes  = {MEDIA_BUS_FMT_AYUV8_1X32},
+		.cs     = IPUV3_COLORSPACE_YUV,
+		.bpp    = 32,
+		.ipufmt = true,
+        },
 	/*** RGB formats start here ***/
 	{
 		.fourcc	= V4L2_PIX_FMT_RGB565,
@@ -73,6 +79,11 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 		.fourcc	= V4L2_PIX_FMT_BGR24,
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 24,
+	}, {
+		.fourcc	= V4L2_PIX_FMT_XRGB32,
+		.codes  = {MEDIA_BUS_FMT_ARGB8888_1X32},
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 32,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_XRGB32,
 		.codes  = {MEDIA_BUS_FMT_ARGB8888_1X32},
@@ -186,42 +197,24 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 	},
 };
 
-static const struct imx_media_pixfmt ipu_yuv_formats[] = {
-	{
-		.fourcc = V4L2_PIX_FMT_YUV32,
-		.codes  = {MEDIA_BUS_FMT_AYUV8_1X32},
-		.cs     = IPUV3_COLORSPACE_YUV,
-		.bpp    = 32,
-		.ipufmt = true,
-	},
-};
-
-#define NUM_IPU_YUV_FORMATS ARRAY_SIZE(ipu_yuv_formats)
-
-static const struct imx_media_pixfmt ipu_rgb_formats[] = {
-	{
-		.fourcc	= V4L2_PIX_FMT_XRGB32,
-		.codes  = {MEDIA_BUS_FMT_ARGB8888_1X32},
-		.cs     = IPUV3_COLORSPACE_RGB,
-		.bpp    = 32,
-		.ipufmt = true,
-	},
-};
-
-#define NUM_IPU_RGB_FORMATS ARRAY_SIZE(ipu_rgb_formats)
-
 static const struct imx_media_pixfmt *find_format(u32 fourcc,
 						  u32 code,
 						  enum imx_pixfmt_sel fmt_sel,
 						  bool allow_non_mbus)
 {
+	bool sel_ipu = fmt_sel & PIXFMT_SEL_IPU;
 	unsigned int i;
 
+	fmt_sel &= ~PIXFMT_SEL_IPU;
+
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
 		enum imx_pixfmt_sel sel;
 		unsigned int j;
 
+		if (sel_ipu && !fmt->ipufmt)
+			continue;
+
 		sel = fmt->bayer ? PIXFMT_SEL_BAYER :
 			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
 			 PIXFMT_SEL_YUV : PIXFMT_SEL_RGB);
@@ -249,13 +242,19 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 		       enum imx_pixfmt_sel fmt_sel,
 		       bool allow_non_mbus)
 {
+	bool sel_ipu = fmt_sel & PIXFMT_SEL_IPU;
 	unsigned int i;
 
+	fmt_sel &= ~PIXFMT_SEL_IPU;
+
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
 		enum imx_pixfmt_sel sel;
 		unsigned int j;
 
+		if (sel_ipu && !fmt->ipufmt)
+			continue;
+
 		sel = fmt->bayer ? PIXFMT_SEL_BAYER :
 			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
 			 PIXFMT_SEL_YUV : PIXFMT_SEL_RGB);
@@ -317,79 +316,14 @@ EXPORT_SYMBOL_GPL(imx_media_enum_mbus_format);
 const struct imx_media_pixfmt *
 imx_media_find_ipu_format(u32 code, enum imx_pixfmt_sel fmt_sel)
 {
-	const struct imx_media_pixfmt *array, *fmt, *ret = NULL;
-	u32 array_size;
-	int i, j;
-
-	fmt_sel &= ~PIXFMT_SEL_BAYER;
-
-	switch (fmt_sel) {
-	case PIXFMT_SEL_YUV:
-		array_size = NUM_IPU_YUV_FORMATS;
-		array = ipu_yuv_formats;
-		break;
-	case PIXFMT_SEL_RGB:
-		array_size = NUM_IPU_RGB_FORMATS;
-		array = ipu_rgb_formats;
-		break;
-	case PIXFMT_SEL_YUV_RGB:
-		array_size = NUM_IPU_YUV_FORMATS + NUM_IPU_RGB_FORMATS;
-		array = ipu_yuv_formats;
-		break;
-	default:
-		return NULL;
-	}
-
-	for (i = 0; i < array_size; i++) {
-		if (fmt_sel == PIXFMT_SEL_YUV_RGB && i >= NUM_IPU_YUV_FORMATS)
-			fmt = &ipu_rgb_formats[i - NUM_IPU_YUV_FORMATS];
-		else
-			fmt = &array[i];
-
-		for (j = 0; code && fmt->codes[j]; j++) {
-			if (code == fmt->codes[j]) {
-				ret = fmt;
-				goto out;
-			}
-		}
-	}
-
-out:
-	return ret;
+	return find_format(0, code, fmt_sel | PIXFMT_SEL_IPU, false);
 }
 EXPORT_SYMBOL_GPL(imx_media_find_ipu_format);
 
 int imx_media_enum_ipu_format(u32 *code, u32 index,
 			      enum imx_pixfmt_sel fmt_sel)
 {
-	fmt_sel &= ~PIXFMT_SEL_BAYER;
-
-	switch (fmt_sel) {
-	case PIXFMT_SEL_YUV:
-		if (index >= NUM_IPU_YUV_FORMATS)
-			return -EINVAL;
-		*code = ipu_yuv_formats[index].codes[0];
-		break;
-	case PIXFMT_SEL_RGB:
-		if (index >= NUM_IPU_RGB_FORMATS)
-			return -EINVAL;
-		*code = ipu_rgb_formats[index].codes[0];
-		break;
-	case PIXFMT_SEL_YUV_RGB:
-		if (index >= NUM_IPU_YUV_FORMATS + NUM_IPU_RGB_FORMATS)
-			return -EINVAL;
-		if (index >= NUM_IPU_YUV_FORMATS) {
-			index -= NUM_IPU_YUV_FORMATS;
-			*code = ipu_rgb_formats[index].codes[0];
-		} else {
-			*code = ipu_yuv_formats[index].codes[0];
-		}
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
+	return enum_format(NULL, code, index, fmt_sel | PIXFMT_SEL_IPU, false);
 }
 EXPORT_SYMBOL_GPL(imx_media_enum_ipu_format);
 
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index ac7c521d8148..c61592750729 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -83,6 +83,7 @@ enum imx_pixfmt_sel {
 	PIXFMT_SEL_YUV   = BIT(0), /* select YUV formats */
 	PIXFMT_SEL_RGB   = BIT(1), /* select RGB formats */
 	PIXFMT_SEL_BAYER = BIT(2), /* select BAYER formats */
+	PIXFMT_SEL_IPU   = BIT(3), /* select IPU-internal formats */
 	PIXFMT_SEL_YUV_RGB = PIXFMT_SEL_YUV | PIXFMT_SEL_RGB,
 	PIXFMT_SEL_ANY = PIXFMT_SEL_YUV | PIXFMT_SEL_RGB | PIXFMT_SEL_BAYER,
 };
-- 
2.17.1

