Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76865196F00
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2020 19:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728466AbgC2Rka (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Mar 2020 13:40:30 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43134 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728489AbgC2Rka (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Mar 2020 13:40:30 -0400
Received: by mail-pf1-f196.google.com with SMTP id f206so7400352pfa.10
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2020 10:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=p9NT3rzEn5Uwidk/XYZ1HQVtghscilmVZcsHmDp1yws=;
        b=ObUdQMBGTWY/FPvc+z+WcQx/gsgKPzwnF/hc0OOdMSIbVMrGk3gSY/RpeON3YBus3O
         TIjXBTPCeMPAfyEDwxny/3jk0on1+hJTAPLu50XnpeCtHE2CDSL/SzLyBjvZcgClUTAf
         NO0IuwhGE1/13if1JqiB8JX7J4mxUnvt7X6IbtD2cDYIIBDoA1sZYd9nmoej4xU3BuPC
         4wMIOnlHNW0Jx9sFLueuhYN9cgJ9kwg6xVMGwLl1iwpMgCSSyWbXcfDY8sOWUoEXN5sv
         JmmWmSszfq1WwuXNwPEnGzEfnI9RtyxVAQzp3KhUNFhFTjhpALHDOPupZoPUo6qZ6eQB
         d0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=p9NT3rzEn5Uwidk/XYZ1HQVtghscilmVZcsHmDp1yws=;
        b=GwU9m9elfgxu8OJZYjmstw855CTZo0+CvaA9nTYcuf7EURLZbib2mDjVb1EiSET/FW
         nmjRUwNNPAUWB3+4Tf52yvqquhEkTRf8IWuyscrVVlQGpfQp8IxRhHjf3PnZJWe+VuDm
         FrUT1s1dxBon6PQ5ygE9nyyKxVyIi4tgoB8tOacyl/sBn7C5/9d40Un36wz+dZVOVQXA
         lZMm28u0q6gStw971s5OwX41mFjsCaCXShyiqKRN4g60wpJKJqfvePDTYswME+IvwxZp
         U84G0XdmJ8MBheMWvRdeS8+WUbYcH3IjyqQX7styKTvcfPfwHi/cBBhECRnsuqMxQb7v
         DSmg==
X-Gm-Message-State: ANhLgQ3mlygLekdil5P7mBZi1dV8kbZPIau0t3pydZvbHlWWyzkTBaKj
        atyTvQfzmOQIBP4AlYOPxl+l5kSYQgg=
X-Google-Smtp-Source: ADFU+vtEQWwHssPGHvac9LY60DSt5gmvoYDN44LQQCn/yHmBtJu6VYOAWH4ILMzPAHkO9ndNG2ufdQ==
X-Received: by 2002:a62:687:: with SMTP id 129mr9759796pfg.209.1585503629137;
        Sun, 29 Mar 2020 10:40:29 -0700 (PDT)
Received: from mappy.nv.charter.com ([2600:6c4e:200:e053:a0c5:5fbc:c28e:f91f])
        by smtp.gmail.com with ESMTPSA id b133sm7031253pfb.180.2020.03.29.10.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 10:40:28 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v3 10/10] media: imx: utils: Split find|enum_format into fourcc and mbus functions
Date:   Sun, 29 Mar 2020 10:40:10 -0700
Message-Id: <20200329174010.12304-11-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200329174010.12304-1-slongerbeam@gmail.com>
References: <20200329174010.12304-1-slongerbeam@gmail.com>
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
index 95fef529b741..aaf71ffab7f6 100644
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

