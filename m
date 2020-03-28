Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4D07196A03
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2020 00:10:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727797AbgC1XK0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Mar 2020 19:10:26 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:33469 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727506AbgC1XKZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Mar 2020 19:10:25 -0400
Received: by mail-pj1-f68.google.com with SMTP id jz1so5340227pjb.0
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2020 16:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rlGQd07hYQ4jOoVjLagH/BqY8mPdrgQV3Nmqy310vig=;
        b=jOUmvJ65cxclAVxVxbJiLnZDg9aVWXiNY7oQOCbph2/vc0VobcZOjm7eFodP8wAkYF
         jppcPBwBAlE16MzFuQr4q/CMSqVNk6aa3DrPx/vIUjLMaCsYIrUU/2OsSTRLioEgE6VM
         0LvoPox2B/X1zvZ3wbaek4sP8kgLbqoMt3obH9bljbQz+ib5cIealJHqlrrphemU+alj
         8q/DHcShCANGPBvqACUBy1XHnmfmh1QHJ55mTY3Vjtcp4l9FCbhyFamy9vO5f5vwHQ1t
         NW3beAhJGpZppnPZoG6kempbUvA1RRwMc16UXePvMAy1Ip37lOSx2hr/MW7wOAHaVQBJ
         PODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rlGQd07hYQ4jOoVjLagH/BqY8mPdrgQV3Nmqy310vig=;
        b=QZDDdm5I9Hj62iAmj2QIa45rrdPnDcD6CB+k8ynsLcy4TWEbxWafpwcx1h8FDfMaLw
         QJfBgwuJFZyI2rXpBsdOQBZAiyzUVlq3KCdKp9JeSEu15lq91SB6MnbKM1XO357Imdw3
         /SDJu9hluQLgTC3vEegSJQYJaDUVJyFpTjJ/4656s9rbBFQpGHg77E1kITdGxzJui1m1
         DJU1rMIrcu6y69QUPuvXboigB/aSBQweeSESF7vQarB8egi1dNuGn4zDGHRXlso0sH4Y
         oJqsxzzZA4/ST6zEAaTJSQdaF0i7FWcjjj6YOldX86DP9sA3fFKLmri+LuqRm5Jhs+CR
         QuhA==
X-Gm-Message-State: ANhLgQ0pS4GzkJmq6mepbnmZjCdknjY9dbqUSfzNPEinvs1zaSeh+C7T
        SydFv83ProDqaGk59Xv3iVNhp7kflHU=
X-Google-Smtp-Source: ADFU+vvJb0TUzFGhV/olzHHHqJiYxNVvSFFyJz++/66AMv5w8C8TY90hdnwcEHlzgCCV2QCDH1YXaw==
X-Received: by 2002:a17:90a:1acd:: with SMTP id p71mr7688100pjp.112.1585437024392;
        Sat, 28 Mar 2020 16:10:24 -0700 (PDT)
Received: from mappy.nv.charter.com ([2600:6c4e:200:e053:3081:8132:c81a:db99])
        by smtp.gmail.com with ESMTPSA id w74sm3978602pfd.112.2020.03.28.16.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2020 16:10:24 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 10/10] media: imx: utils: Split find|enum_format into fourcc and mbus functions
Date:   Sat, 28 Mar 2020 16:10:02 -0700
Message-Id: <20200328231002.649-11-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200328231002.649-1-slongerbeam@gmail.com>
References: <20200328231002.649-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To make the code easier to follow, split up find_format() into separate
search functions for pixel formats and media-bus codes. In the process
inline the code into the exported functions imx_media_find_pixel_format()
and imx_media_find_mbus_format(). Do the equivalent for enum_formats().

Also add comment blocks for the exported find|enum functions.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 131 +++++++++++++-------
 1 file changed, 88 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 54f6ded0f7c6..c9783b06bdde 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -192,28 +192,58 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 	},
 };
 
-static const struct imx_media_pixfmt *find_format(u32 fourcc,
-						  u32 code,
-						  enum codespace_sel cs_sel)
+/*
+ * Search for and return an entry in the pixel_formats[] array that matches
+ * the requested search criteria.
+ *
+ * @fourcc: Search for an entry with the given fourcc pixel format.
+ * @cs_sel: Search for entries with the given codespace encodings
+ *          (YUV, RGB, and/or BAYER).
+ */
+const struct imx_media_pixfmt *
+imx_media_find_pixel_format(u32 fourcc, enum codespace_sel cs_sel)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
 		enum codespace_sel fmt_cs_sel;
-		unsigned int j;
 
 		fmt_cs_sel = fmt->bayer ? CS_SEL_BAYER :
 			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
 			 CS_SEL_YUV : CS_SEL_RGB);
 
-		if (!(fmt_cs_sel & cs_sel) || (!fourcc && !fmt->codes))
-			continue;
-
-		if (fourcc && fmt->fourcc == fourcc)
+		if ((fmt_cs_sel & cs_sel) && fmt->fourcc == fourcc)
 			return fmt;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(imx_media_find_pixel_format);
+
+/*
+ * Search for and return an entry in the pixel_formats[] array that matches
+ * the requested search criteria.
+ *
+ * @code: Search for an entry with the given media-bus code.
+ * @cs_sel: Search for entries with the given codespace encodings
+ *          (YUV, RGB, and/or BAYER).
+ */
+const struct imx_media_pixfmt *
+imx_media_find_mbus_format(u32 code, enum codespace_sel cs_sel)
+{
+	unsigned int i;
 
-		if (!code || !fmt->codes)
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
+		enum codespace_sel fmt_cs_sel;
+		unsigned int j;
+
+		fmt_cs_sel = fmt->bayer ? CS_SEL_BAYER :
+			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
+			 CS_SEL_YUV : CS_SEL_RGB);
+
+		if (!(fmt_cs_sel & cs_sel) || !fmt->codes)
 			continue;
 
 		for (j = 0; fmt->codes[j]; j++) {
@@ -224,33 +254,74 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(imx_media_find_mbus_format);
 
-static int enum_formats(u32 *fourcc, u32 *code, u32 index,
-			enum codespace_sel cs_sel)
+/*
+ * Enumerate entries in the pixel_formats[] array that match the
+ * requested search criteria. Returns the fourcc that matches the
+ * search criteria at the requested match index.
+ *
+ * @fourcc: The returned fourcc that matches the search criteria at
+ *          the requested match index.
+ * @index: The requested match index.
+ * @cs_sel: Include in the enumeration entries with the given codespace
+ *          encodings (YUV, RGB, and/or BAYER).
+ */
+int imx_media_enum_pixel_formats(u32 *fourcc, u32 index,
+				 enum codespace_sel cs_sel)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
 		enum codespace_sel fmt_cs_sel;
-		unsigned int j;
 
 		fmt_cs_sel = fmt->bayer ? CS_SEL_BAYER :
 			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
 			 CS_SEL_YUV : CS_SEL_RGB);
 
-		if (!(fmt_cs_sel & cs_sel) || (!fourcc && !fmt->codes))
+		if (!(fmt_cs_sel & cs_sel))
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
+EXPORT_SYMBOL_GPL(imx_media_enum_pixel_formats);
+
+/*
+ * Enumerate entries in the pixel_formats[] array that match the
+ * requested search criteria. Returns the media-bus code that matches
+ * the search criteria at the requested match index.
+ *
+ * @code: The returned media-bus code that matches the search criteria at
+ *        the requested match index.
+ * @index: The requested match index.
+ * @cs_sel: Include in the enumeration entries with the given codespace
+ *          encodings (YUV, RGB, and/or BAYER).
+ */
+int imx_media_enum_mbus_formats(u32 *code, u32 index,
+				enum codespace_sel cs_sel)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
+		enum codespace_sel fmt_cs_sel;
+		unsigned int j;
+
+		fmt_cs_sel = fmt->bayer ? CS_SEL_BAYER :
+			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
+			 CS_SEL_YUV : CS_SEL_RGB);
+
+		if (!(fmt_cs_sel & cs_sel) || !fmt->codes)
 			continue;
-		}
 
 		for (j = 0; fmt->codes[j]; j++) {
 			if (index == 0) {
@@ -264,32 +335,6 @@ static int enum_formats(u32 *fourcc, u32 *code, u32 index,
 
 	return -EINVAL;
 }
-
-const struct imx_media_pixfmt *
-imx_media_find_pixel_format(u32 fourcc, enum codespace_sel cs_sel)
-{
-	return find_format(fourcc, 0, cs_sel);
-}
-EXPORT_SYMBOL_GPL(imx_media_find_pixel_format);
-
-int imx_media_enum_pixel_formats(u32 *fourcc, u32 index,
-				 enum codespace_sel cs_sel)
-{
-	return enum_formats(fourcc, NULL, index, cs_sel);
-}
-EXPORT_SYMBOL_GPL(imx_media_enum_pixel_formats);
-
-const struct imx_media_pixfmt *
-imx_media_find_mbus_format(u32 code, enum codespace_sel cs_sel)
-{
-	return find_format(0, code, cs_sel);
-}
-EXPORT_SYMBOL_GPL(imx_media_find_mbus_format);
-
-int imx_media_enum_mbus_formats(u32 *code, u32 index, enum codespace_sel cs_sel)
-{
-	return enum_formats(NULL, code, index, cs_sel);
-}
 EXPORT_SYMBOL_GPL(imx_media_enum_mbus_formats);
 
 /* -----------------------------------------------------------------------------
-- 
2.17.1

