Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3713194707
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 20:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728565AbgCZTGB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 15:06:01 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37162 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728533AbgCZTGB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 15:06:01 -0400
Received: by mail-pl1-f195.google.com with SMTP id x1so2521683plm.4
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 12:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NjOy4GFKFVOjgu6LotHMH9B6bYJcmsIghEAgypUB+00=;
        b=Nk9YSuhS027L6bKqfjs/g47Tu+iWSv5khlv+MSyECpqRQ4eWSrqDIc2RrZjUGPdXd1
         EGSKcGmBxpxSCOPN8TgXPGDeSokz7beoyo72MtKYHrqaHCSPWW7tdhGI7SP1QOA9yBko
         IuPwdYuLnz6uWyqQIgSEc6Rk09Af5aiJOSL5LD50p9siEewQD0MzxVdyScA8uZ93Qjhl
         na6RCLkWBX8FMX85+MpuMUEnwdsmpbgOtLL0Jh7zyGQ0k8ucwXs6soAGppnstLwi7iFf
         HaSLa4pRVxm4F4CgXxc2i6ze2dl4P72dfSgGZEKJMgRQdx/hFbNke5qmqzmvZ8CrG9Z3
         hqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NjOy4GFKFVOjgu6LotHMH9B6bYJcmsIghEAgypUB+00=;
        b=KHBABKXU1lLZ+l0iuVJ1rRawll7l8slZrRK2MzdZvJdwZCUktC2+qZ5MzUnU8VM8s6
         KP4wElldSJ0Zuqy/VHRmMI4tln4U0Bmuet3fBSH/quoXIAeHVLsZW4H75Gx3WYMOHqbs
         CY5/UeZF26l6SQD3+K6AHqb0fGuWK+6oMnAUjiDBS+qPmRBOQLW4+9KcqJ3+S1j8hcwQ
         +0HBY7i3h2GRfA8Py9HYp+yaKSxhb9wF+PVx8id1EfBJc9LwoqHDdF6AJ2WmyA9KKTvh
         Twwz66B2a43ZA3ZPlk7nQzITyx18Cq7kgi5ALXa8NmoTCxz6Tv8b1luOFR3jvFSsOaNe
         QI5g==
X-Gm-Message-State: ANhLgQ2XxpAp7SX+RdT+CyLXYfTIZ3mggIQ74N3t1q5FRwX0F2kZI3zh
        Yj3d9jE4u+JYGDxNc54BkvsGlHT6/Vs=
X-Google-Smtp-Source: ADFU+vs00Pug6wBNqw0Hd91Yzl2NVqEepPOTiODJqwIoWf2BxPzuk3q1W5PEtQBQy1HfjNxQEMmxxg==
X-Received: by 2002:a17:90a:2103:: with SMTP id a3mr1577300pje.181.1585249559485;
        Thu, 26 Mar 2020 12:05:59 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q103sm7414623pjc.1.2020.03.26.12.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 12:05:59 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH 10/10] media: imx: utils: Split find|enum_format into fourcc and mbus functions
Date:   Thu, 26 Mar 2020 12:05:44 -0700
Message-Id: <20200326190544.16349-11-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326190544.16349-1-slongerbeam@gmail.com>
References: <20200326190544.16349-1-slongerbeam@gmail.com>
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
 drivers/staging/media/imx/imx-media-utils.c | 152 +++++++++++++-------
 1 file changed, 98 insertions(+), 54 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index ef3702703936..a806a146f1a6 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -192,12 +192,19 @@ static const struct imx_media_pixfmt pixel_formats[] = {
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
 	const struct imx_media_pixfmt *fmt;
-	int i, j;
+	int i;
 
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		enum codespace_sel fmt_cs_sel;
@@ -207,13 +214,37 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
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
+	const struct imx_media_pixfmt *fmt;
+	int i, j;
 
-		if (!code || !fmt->codes)
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		enum codespace_sel fmt_cs_sel;
+
+		fmt = &pixel_formats[i];
+		fmt_cs_sel = fmt->bayer ? CS_SEL_BAYER :
+			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
+			 CS_SEL_YUV : CS_SEL_RGB);
+
+		if (!(fmt_cs_sel & cs_sel) || !fmt->codes)
 			continue;
 
 		for (j = 0; fmt->codes[j]; j++) {
@@ -221,14 +252,27 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
 				return fmt;
 		}
 	}
+
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
 	const struct imx_media_pixfmt *fmt;
-	unsigned int i, j = 0, match_index = 0;
+	unsigned int i, match_index = 0;
 
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		enum codespace_sel fmt_cs_sel;
@@ -238,60 +282,60 @@ static int enum_formats(u32 *fourcc, u32 *code, u32 index,
 			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
 			 CS_SEL_YUV : CS_SEL_RGB);
 
-		if (!(fmt_cs_sel & cs_sel) || (!fourcc && !fmt->codes))
+		if (!(fmt_cs_sel & cs_sel))
 			continue;
 
-		if (fourcc && index == match_index)
-			break;
-
-		if (!code) {
-			match_index++;
-			continue;
+		if (index == match_index) {
+			*fourcc = fmt->fourcc;
+			return 0;
 		}
 
-		for (j = 0; j < fmt->codes[j]; j++) {
-			if (index == match_index)
-				goto out;
-
-			match_index++;
-		}
+		match_index++;
 	}
-	if (i == ARRAY_SIZE(pixel_formats))
-		return -EINVAL;
-
-out:
-	if (fourcc)
-		*fourcc = fmt->fourcc;
-	if (code)
-		*code = fmt->codes ? fmt->codes[j] : 0;
 
-	return 0;
+	return -EINVAL;
 }
+EXPORT_SYMBOL_GPL(imx_media_enum_pixel_formats);
 
-const struct imx_media_pixfmt *
-imx_media_find_pixel_format(u32 fourcc, enum codespace_sel cs_sel)
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
 {
-	return find_format(fourcc, 0, cs_sel);
-}
-EXPORT_SYMBOL_GPL(imx_media_find_pixel_format);
+	const struct imx_media_pixfmt *fmt;
+	unsigned int i, j = 0, match_index = 0;
 
-int imx_media_enum_pixel_formats(u32 *fourcc, u32 index,
-				 enum codespace_sel cs_sel)
-{
-	return enum_formats(fourcc, NULL, index, cs_sel);
-}
-EXPORT_SYMBOL_GPL(imx_media_enum_pixel_formats);
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		enum codespace_sel fmt_cs_sel;
 
-const struct imx_media_pixfmt *
-imx_media_find_mbus_format(u32 code, enum codespace_sel cs_sel)
-{
-	return find_format(0, code, cs_sel);
-}
-EXPORT_SYMBOL_GPL(imx_media_find_mbus_format);
+		fmt = &pixel_formats[i];
+		fmt_cs_sel = fmt->bayer ? CS_SEL_BAYER :
+			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
+			 CS_SEL_YUV : CS_SEL_RGB);
 
-int imx_media_enum_mbus_formats(u32 *code, u32 index, enum codespace_sel cs_sel)
-{
-	return enum_formats(NULL, code, index, cs_sel);
+		if (!(fmt_cs_sel & cs_sel) || !fmt->codes)
+			continue;
+
+		for (j = 0; j < fmt->codes[j]; j++) {
+			if (index == match_index) {
+				*code = fmt->codes[j];
+				return 0;
+			}
+
+			match_index++;
+		}
+	}
+
+	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(imx_media_enum_mbus_formats);
 
-- 
2.17.1

