Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B53FD19706D
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2020 22:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728892AbgC2U7n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Mar 2020 16:59:43 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:51424 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728891AbgC2U7m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Mar 2020 16:59:42 -0400
Received: by mail-pj1-f68.google.com with SMTP id w9so6639202pjh.1
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2020 13:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jikzjO1cIZhKqzQJbxfjm0dX3etS4p3p0i6KNgHmYWM=;
        b=XthSF840k1NNNWAU8p6RZG1wrhFEu7srtLhR8sr/Jdb80fBRlXxwffOoI/+LRLUvF4
         Cl16WiGSOYfSegtfYHtW+FTFbCRgiFEAIY5g37+li3XtcfKAMa/OzaNwxS3QxY/8A87O
         TZ2TLV1XbPV7wlgdIx0EAfHLuxnqnh0y8telq/SYNCjqiDuWXwwtvyra6AzWo+AaLY5a
         oEs9oRtEfQajXWIhDlWqyqLwnrWFy4qQ4OtFlrSaO+rAMLP/QhfE+4bYNUhiPwpunb1b
         YPfFr32KBaPiquYyWIEAJ/o6An4TEkLo+QRK2aiG4vX4GEQqz3JJvH6ufvu/2k6gWva4
         BG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jikzjO1cIZhKqzQJbxfjm0dX3etS4p3p0i6KNgHmYWM=;
        b=qQG6W8/VV6dnq0Ei47UOMx4v3S2NBe5Iel2ub3kwv0kIV/SXaZjRMh/TsZB3lyauS5
         XtvcO7tsZraOPQ3iCZ4YMqVWOfBxLdi0l1g1m5YBHHJ9ObN1u5oAcddR1RIlf53Y9VPY
         i95/1x2dotX1s3dPAa1bmJyBMxSE9q9AxlJuqCZkG0m4HPGnDxyFKKjfMYtayx2rueBf
         wzv2q4YdgxGa+cWy8pfg6ykM6X6yr46++aP3Kvrwlty8ejdAnRoCcERdhEdbaQbzOYVX
         NVzGkXGAe0n0+eSIzCflWLfg1/AS/1WP00RJUI7kphrS6bct8PTNrk962P84IM5v3x4G
         lKEg==
X-Gm-Message-State: ANhLgQ1RqkA2bu0UXX6rON3A/8UtxTXbX9CTDHdLpdglfUeWNW9HhpxR
        /evkXphRWDz2JD8Tl97tlCZO9gkojf4=
X-Google-Smtp-Source: ADFU+vsFYQFcotDmP8/kMmVmrOETH/I6bjdq0i6FmG8TkI1ZnicnBCUW2vAxqxpUG5CQCDx2B7FebQ==
X-Received: by 2002:a17:902:9042:: with SMTP id w2mr9729932plz.269.1585515580327;
        Sun, 29 Mar 2020 13:59:40 -0700 (PDT)
Received: from mappy.nv.charter.com ([2600:6c4e:200:e053:a0c5:5fbc:c28e:f91f])
        by smtp.gmail.com with ESMTPSA id 15sm8606049pfu.186.2020.03.29.13.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 13:59:39 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 11/11] media: imx: utils: Split find|enum_format into fourcc and mbus functions
Date:   Sun, 29 Mar 2020 13:59:20 -0700
Message-Id: <20200329205920.20118-12-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200329205920.20118-1-slongerbeam@gmail.com>
References: <20200329205920.20118-1-slongerbeam@gmail.com>
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
index 1b0cadb601cd..4be588313681 100644
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

