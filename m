Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB8D119FA45
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 18:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729516AbgDFQj1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 12:39:27 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46190 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729511AbgDFQj1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 12:39:27 -0400
Received: by mail-pl1-f194.google.com with SMTP id s23so6125745plq.13
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 09:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rxSXLIuTf5b767O1ZQdbdFb6nAroouD8cqb5OH8s1b4=;
        b=FcN0OeXY0tbigg9fXw/SPfY73Hz/UCqRD+vKVNG38HGRry8kLRwTWcNIpcrBoMtXYK
         3/+qDzx7r7oGgchisGFI93dU9MOO3uneA9HMKrUdqTeGU8DkfDrH/FBpIBHiPuf0+PXk
         o4QrMzUGayEMcip1COXO9+7+22Z1344zEUa1B+mrjXOXyQcblcAKUx8U0mGYi5pkvxYL
         pTxcfsVrv4wEx0fIQA8BYs+95Ohlrvc8RrDBV3X+r0Z5+rJ6Ak8wkoKiGHoSDYHfWFh9
         vaNgNNhS0g0E9SP1lpFkZPNBMGgTn/pyVVa7WTy+238KdweB7IXtGKj9Dwdo4tFD9kS+
         Z7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rxSXLIuTf5b767O1ZQdbdFb6nAroouD8cqb5OH8s1b4=;
        b=tnNRU2zqSoRNenGQPNAOVC/czyKaVb/H8Ji+dyCYTCSZj7DA7QgqsBPC+4VWRcidsJ
         KOxa0ixleii4Q+5jew2Z+bZzAWqL8o7cB4Ds59fQ2nIjcK8RSHGnpCXvQxVM/G5rLjC4
         LDtKJQozLX1RlJu/I8ISyefjhns/BcHZfEESMKpzJCv9ZLn5+k8clphwFU7IlR9+30bW
         I1tM1bda+togG3zVpXsil2y+OrdOgT0ZNdRMPt+tDeazG+lUa2bkD7Du9THoBImFBQKT
         Um3WBQEIkjJuQ3Cop3kpOdLLo9ExUAa/K31lho4QxrMpTH0ewRAdH1HR8hy3kQF7YSYE
         9pTw==
X-Gm-Message-State: AGi0PuZpeTYU80YSW1Sc4cSizH5W7mIRYGdtw6pAOo09cL59PE7rT8m5
        1EkT7rc+Ul/zSKXOq2Ec1acW2T1I1Dg=
X-Google-Smtp-Source: APiQypIBUw2N6c1NpJLrPBHqRdmjbpNg9DqdECyUHQ5G3hpUbhrWEGenJjJ8eP7ibk7b4WQeYnRN4A==
X-Received: by 2002:a17:90a:9f86:: with SMTP id o6mr181225pjp.156.1586191164784;
        Mon, 06 Apr 2020 09:39:24 -0700 (PDT)
Received: from mappy.world.mentorg.com (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id w29sm11165131pge.25.2020.04.06.09.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 09:39:24 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v7 09/11] media: imx: utils: Split find|enum_format into fourcc and mbus functions
Date:   Mon,  6 Apr 2020 09:39:03 -0700
Message-Id: <20200406163905.24475-10-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200406163905.24475-1-slongerbeam@gmail.com>
References: <20200406163905.24475-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To make the code easier to follow, split up find_format() into separate
search functions for pixel formats and media-bus codes, and inline
find_format() into the exported functions imx_media_find_format()
and imx_media_find_mbus_format().

Do the equivalent for enum_format().

Also add comment blocks for the exported find|enum functions.

The convenience functions imx_media_find_ipu_format() and
imx_media_enum_ipu_format() can now be made inline and moved to
imx-media.h.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 157 ++++++++++++--------
 drivers/staging/media/imx/imx-media.h       |  17 ++-
 2 files changed, 111 insertions(+), 63 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 8d88c2a8df64..53e4dc1ad06f 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -199,10 +199,15 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 	},
 };
 
-static const struct imx_media_pixfmt *find_format(u32 fourcc,
-						  u32 code,
-						  enum imx_pixfmt_sel fmt_sel,
-						  bool allow_non_mbus)
+/*
+ * Search in the pixel_formats[] array for an entry with the given fourcc
+ * that matches the requested selection criteria and return it.
+ *
+ * @fourcc: Search for an entry with the given fourcc pixel format.
+ * @fmt_sel: Allow entries only with the given selection criteria.
+ */
+const struct imx_media_pixfmt *
+imx_media_find_format(u32 fourcc, enum imx_pixfmt_sel fmt_sel)
 {
 	bool sel_ipu = fmt_sel & PIXFMT_SEL_IPU;
 	unsigned int i;
@@ -212,7 +217,6 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
 		enum imx_pixfmt_sel sel;
-		unsigned int j;
 
 		if (sel_ipu != fmt->ipufmt)
 			continue;
@@ -221,14 +225,42 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
 			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
 			 PIXFMT_SEL_YUV : PIXFMT_SEL_RGB);
 
-		if (!(fmt_sel & sel) ||
-		    (!allow_non_mbus && !fmt->codes))
+		if ((fmt_sel & sel) && fmt->fourcc == fourcc)
+			return fmt;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(imx_media_find_format);
+
+/*
+ * Search in the pixel_formats[] array for an entry with the given media
+ * bus code that matches the requested selection criteria and return it.
+ *
+ * @code: Search for an entry with the given media-bus code.
+ * @fmt_sel: Allow entries only with the given selection criteria.
+ */
+const struct imx_media_pixfmt *
+imx_media_find_mbus_format(u32 code, enum imx_pixfmt_sel fmt_sel)
+{
+	bool sel_ipu = fmt_sel & PIXFMT_SEL_IPU;
+	unsigned int i;
+
+	fmt_sel &= ~PIXFMT_SEL_IPU;
+
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
+		enum imx_pixfmt_sel sel;
+		unsigned int j;
+
+		if (sel_ipu != fmt->ipufmt)
 			continue;
 
-		if (fourcc && fmt->fourcc == fourcc)
-			return fmt;
+		sel = fmt->bayer ? PIXFMT_SEL_BAYER :
+			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
+			 PIXFMT_SEL_YUV : PIXFMT_SEL_RGB);
 
-		if (!code || !fmt->codes)
+		if (!(fmt_sel & sel) || !fmt->codes)
 			continue;
 
 		for (j = 0; fmt->codes[j]; j++) {
@@ -239,10 +271,21 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(imx_media_find_mbus_format);
 
-static int enum_format(u32 *fourcc, u32 *code, u32 index,
-		       enum imx_pixfmt_sel fmt_sel,
-		       bool allow_non_mbus)
+/*
+ * Enumerate entries in the pixel_formats[] array that match the
+ * requested selection criteria. Return the fourcc that matches the
+ * selection criteria at the requested match index.
+ *
+ * @fourcc: The returned fourcc that matches the search criteria at
+ *          the requested match index.
+ * @index: The requested match index.
+ * @fmt_sel: Include in the enumeration entries with the given selection
+ *           criteria.
+ */
+int imx_media_enum_format(u32 *fourcc, u32 index,
+			  enum imx_pixfmt_sel fmt_sel)
 {
 	bool sel_ipu = fmt_sel & PIXFMT_SEL_IPU;
 	unsigned int i;
@@ -252,7 +295,6 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
 		enum imx_pixfmt_sel sel;
-		unsigned int j;
 
 		if (sel_ipu != fmt->ipufmt)
 			continue;
@@ -261,19 +303,54 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
 			 PIXFMT_SEL_YUV : PIXFMT_SEL_RGB);
 
-		if (!(fmt_sel & sel) ||
-		    (!allow_non_mbus && !fmt->codes))
+		if (!(fmt_sel & sel))
 			continue;
 
-		if (fourcc && index == 0) {
+		if (index == 0) {
 			*fourcc = fmt->fourcc;
 			return 0;
 		}
 
-		if (!code) {
-			index--;
+		index--;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(imx_media_enum_format);
+
+/*
+ * Enumerate entries in the pixel_formats[] array that match the
+ * requested search criteria. Return the media-bus code that matches
+ * the search criteria at the requested match index.
+ *
+ * @code: The returned media-bus code that matches the search criteria at
+ *        the requested match index.
+ * @index: The requested match index.
+ * @fmt_sel: Include in the enumeration entries with the given selection
+ *           criteria.
+ */
+int imx_media_enum_mbus_format(u32 *code, u32 index,
+			       enum imx_pixfmt_sel fmt_sel)
+{
+	bool sel_ipu = fmt_sel & PIXFMT_SEL_IPU;
+	unsigned int i;
+
+	fmt_sel &= ~PIXFMT_SEL_IPU;
+
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
+		enum imx_pixfmt_sel sel;
+		unsigned int j;
+
+		if (sel_ipu != fmt->ipufmt)
+			continue;
+
+		sel = fmt->bayer ? PIXFMT_SEL_BAYER :
+			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
+			 PIXFMT_SEL_YUV : PIXFMT_SEL_RGB);
+
+		if (!(fmt_sel & sel) || !fmt->codes)
 			continue;
-		}
 
 		for (j = 0; fmt->codes[j]; j++) {
 			if (index == 0) {
@@ -287,48 +364,8 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 
 	return -EINVAL;
 }
-
-const struct imx_media_pixfmt *
-imx_media_find_format(u32 fourcc, enum imx_pixfmt_sel fmt_sel)
-{
-	return find_format(fourcc, 0, fmt_sel, true);
-}
-EXPORT_SYMBOL_GPL(imx_media_find_format);
-
-int imx_media_enum_format(u32 *fourcc, u32 index, enum imx_pixfmt_sel fmt_sel)
-{
-	return enum_format(fourcc, NULL, index, fmt_sel, true);
-}
-EXPORT_SYMBOL_GPL(imx_media_enum_format);
-
-const struct imx_media_pixfmt *
-imx_media_find_mbus_format(u32 code, enum imx_pixfmt_sel fmt_sel)
-{
-	return find_format(0, code, fmt_sel, false);
-}
-EXPORT_SYMBOL_GPL(imx_media_find_mbus_format);
-
-int imx_media_enum_mbus_format(u32 *code, u32 index,
-			       enum imx_pixfmt_sel fmt_sel)
-{
-	return enum_format(NULL, code, index, fmt_sel, false);
-}
 EXPORT_SYMBOL_GPL(imx_media_enum_mbus_format);
 
-const struct imx_media_pixfmt *
-imx_media_find_ipu_format(u32 code, enum imx_pixfmt_sel fmt_sel)
-{
-	return find_format(0, code, fmt_sel | PIXFMT_SEL_IPU, false);
-}
-EXPORT_SYMBOL_GPL(imx_media_find_ipu_format);
-
-int imx_media_enum_ipu_format(u32 *code, u32 index,
-			      enum imx_pixfmt_sel fmt_sel)
-{
-	return enum_format(NULL, code, index, fmt_sel | PIXFMT_SEL_IPU, false);
-}
-EXPORT_SYMBOL_GPL(imx_media_enum_ipu_format);
-
 int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 			    u32 width, u32 height, u32 code, u32 field,
 			    const struct imx_media_pixfmt **cc)
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 459ec15bcdaf..c0813aeac3f5 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -170,9 +170,20 @@ int imx_media_enum_format(u32 *fourcc, u32 index, enum imx_pixfmt_sel sel);
 const struct imx_media_pixfmt *
 imx_media_find_mbus_format(u32 code, enum imx_pixfmt_sel sel);
 int imx_media_enum_mbus_format(u32 *code, u32 index, enum imx_pixfmt_sel sel);
-const struct imx_media_pixfmt *
-imx_media_find_ipu_format(u32 code, enum imx_pixfmt_sel sel);
-int imx_media_enum_ipu_format(u32 *code, u32 index, enum imx_pixfmt_sel sel);
+
+static inline const struct imx_media_pixfmt *
+imx_media_find_ipu_format(u32 code, enum imx_pixfmt_sel fmt_sel)
+{
+	return imx_media_find_mbus_format(code, fmt_sel | PIXFMT_SEL_IPU);
+}
+
+static inline int imx_media_enum_ipu_format(u32 *code, u32 index,
+					    enum imx_pixfmt_sel fmt_sel)
+{
+	return imx_media_enum_mbus_format(code, index,
+					  fmt_sel | PIXFMT_SEL_IPU);
+}
+
 int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 			    u32 width, u32 height, u32 code, u32 field,
 			    const struct imx_media_pixfmt **cc);
-- 
2.17.1

