Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C93119DFFA
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 22:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728552AbgDCU7E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 16:59:04 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44265 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727842AbgDCU7E (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 16:59:04 -0400
Received: by mail-pf1-f194.google.com with SMTP id b72so4140923pfb.11
        for <linux-media@vger.kernel.org>; Fri, 03 Apr 2020 13:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pvjQ0gj6bLbK9L+ihzhpAHfrB6E4ryh67VWWfVWtDC0=;
        b=BHzTh99Jn7y/9N5SGMgrRmRc1X5AYZNcBfmDKpZQY5ECMFW04M4VLN+5r5Jv1UeezW
         fAdvhbZH2sp+9+JXCTE8XckKenhc1xjSaC71PeTybWwee1MofqDqtnH5b6siLlUAQREN
         xr4wUwTyZg9RF77ETTNm4nmkYxswAIKCJdIIiw5IkoWlaJJl83kAaAI96OpRZl1D2WUA
         JeuR40YHOYzW+Z+DUMkxDjgP6QAd4PHK3TXc4rGFWYrVIWaGPkKYh+mcZrJBylALsjDT
         XIgUPso92cWCwpo+e3WorRIkuJ3Y+Cg1Vd4VNd4NfdDsRp6ptxWifiAjCCeEuiF/h12S
         eQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pvjQ0gj6bLbK9L+ihzhpAHfrB6E4ryh67VWWfVWtDC0=;
        b=Ooo7QqQNYKGB5Imb+1GjtTdJsPZCFptVVQIZQV9cKQvWUd58hWEGHOCE80SEF+pQhd
         3vYXaK5h+6KlIW65slS/4o5Bwv2BJ+X0ALc3c213YnZpdW+r0A3jQ3ZXqM2U03Ugi3ch
         OSuFJjhBXvWa2heFK75HsK3vvOjsZZzlipeSCxnboRlwtsNJQLeRYwiy57QZlLfAdFaq
         FG9aXKQpTnm8iKbTWK4vYidbDOndFrcstVauFOyKfSl5GSvOheBf/5XMuALakldFj/O3
         0jGeaERnwABfGZhuaF/+EOAMKsBfRa2HzWGm3YOfCKrguf8tHxKxXwTtbL6EXhngH0Yd
         O0yQ==
X-Gm-Message-State: AGi0PuY4YAI+a5dRhQzhQwn8wQLKT3Mgigbe0PfRF6MftDauOr4b/x6K
        aC78ZZ0l+Tsk9eCjqCTGRCSFENOgsyg=
X-Google-Smtp-Source: APiQypIvhiyvKtAqwyz+hUaRtqmyzWDspzttFtvpiI2WEFf1xUVmEf9iefoYtyonroRUrkXEoQUFgQ==
X-Received: by 2002:a63:6fc6:: with SMTP id k189mr9792194pgc.175.1585947541615;
        Fri, 03 Apr 2020 13:59:01 -0700 (PDT)
Received: from mappy.world.mentorg.com (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id s39sm6521266pjb.10.2020.04.03.13.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 13:59:01 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 12/12] media: imx: utils: Split find|enum_format into fourcc and mbus functions
Date:   Fri,  3 Apr 2020 13:58:39 -0700
Message-Id: <20200403205839.4531-13-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403205839.4531-1-slongerbeam@gmail.com>
References: <20200403205839.4531-1-slongerbeam@gmail.com>
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
 drivers/staging/media/imx/imx-media-utils.c | 145 ++++++++++++++------
 1 file changed, 100 insertions(+), 45 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index f8bd0ff32049..11a5b544d58b 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -199,9 +199,15 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 	},
 };
 
-static const struct imx_media_pixfmt *find_format(u32 fourcc,
-						  u32 code,
-						  enum imx_pixfmt_sel fmt_sel)
+/*
+ * Search for and return an entry in the pixel_formats[] array that matches
+ * the requested selection criteria.
+ *
+ * @fourcc: Search for an entry with the given fourcc pixel format.
+ * @fmt_sel: Allow entries only with the given selection criteria.
+ */
+const struct imx_media_pixfmt *
+imx_media_find_pixel_format(u32 fourcc, enum imx_pixfmt_sel fmt_sel)
 {
 	bool sel_ipu = fmt_sel & PIXFMT_SEL_IPU;
 	unsigned int i;
@@ -211,7 +217,6 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
 		enum imx_pixfmt_sel sel;
-		unsigned int j;
 
 		if (sel_ipu && !fmt->ipufmt)
 			continue;
@@ -220,13 +225,42 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
 			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
 			 PIXFMT_SEL_YUV : PIXFMT_SEL_RGB);
 
-		if (!(fmt_sel & sel) || (!fourcc && !fmt->codes))
+		if ((fmt_sel & sel) && fmt->fourcc == fourcc)
+			return fmt;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(imx_media_find_pixel_format);
+
+/*
+ * Search for and return an entry in the pixel_formats[] array that matches
+ * the requested selection criteria.
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
+		if (sel_ipu && !fmt->ipufmt)
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
@@ -237,9 +271,21 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(imx_media_find_mbus_format);
 
-static int enum_formats(u32 *fourcc, u32 *code, u32 index,
-			enum imx_pixfmt_sel fmt_sel)
+/*
+ * Enumerate entries in the pixel_formats[] array that match the
+ * requested selection criteria. Returns the fourcc that matches the
+ * selection criteria at the requested match index.
+ *
+ * @fourcc: The returned fourcc that matches the search criteria at
+ *          the requested match index.
+ * @index: The requested match index.
+ * @fmt_sel: Include in the enumeration entries with the given selection
+ *           criteria.
+ */
+int imx_media_enum_pixel_formats(u32 *fourcc, u32 index,
+				 enum imx_pixfmt_sel fmt_sel)
 {
 	bool sel_ipu = fmt_sel & PIXFMT_SEL_IPU;
 	unsigned int i;
@@ -249,7 +295,6 @@ static int enum_formats(u32 *fourcc, u32 *code, u32 index,
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
 		enum imx_pixfmt_sel sel;
-		unsigned int j;
 
 		if (sel_ipu && !fmt->ipufmt)
 			continue;
@@ -258,18 +303,54 @@ static int enum_formats(u32 *fourcc, u32 *code, u32 index,
 			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
 			 PIXFMT_SEL_YUV : PIXFMT_SEL_RGB);
 
-		if (!(fmt_sel & sel) || (!fourcc && !fmt->codes))
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
+ * @fmt_sel: Include in the enumeration entries with the given selection
+ *           criteria.
+ */
+int imx_media_enum_mbus_formats(u32 *code, u32 index,
+				enum imx_pixfmt_sel fmt_sel)
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
+		if (sel_ipu && !fmt->ipufmt)
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
@@ -283,46 +364,20 @@ static int enum_formats(u32 *fourcc, u32 *code, u32 index,
 
 	return -EINVAL;
 }
-
-const struct imx_media_pixfmt *
-imx_media_find_pixel_format(u32 fourcc, enum imx_pixfmt_sel fmt_sel)
-{
-	return find_format(fourcc, 0, fmt_sel);
-}
-EXPORT_SYMBOL_GPL(imx_media_find_pixel_format);
-
-int imx_media_enum_pixel_formats(u32 *fourcc, u32 index,
-				 enum imx_pixfmt_sel fmt_sel)
-{
-	return enum_formats(fourcc, NULL, index, fmt_sel);
-}
-EXPORT_SYMBOL_GPL(imx_media_enum_pixel_formats);
-
-const struct imx_media_pixfmt *
-imx_media_find_mbus_format(u32 code, enum imx_pixfmt_sel fmt_sel)
-{
-	return find_format(0, code, fmt_sel);
-}
-EXPORT_SYMBOL_GPL(imx_media_find_mbus_format);
-
-int imx_media_enum_mbus_formats(u32 *code, u32 index,
-				enum imx_pixfmt_sel fmt_sel)
-{
-	return enum_formats(NULL, code, index, fmt_sel);
-}
 EXPORT_SYMBOL_GPL(imx_media_enum_mbus_formats);
 
 const struct imx_media_pixfmt *
 imx_media_find_ipu_format(u32 code, enum imx_pixfmt_sel fmt_sel)
 {
-	return find_format(0, code, fmt_sel | PIXFMT_SEL_IPU);
+	return imx_media_find_mbus_format(code, fmt_sel | PIXFMT_SEL_IPU);
 }
 EXPORT_SYMBOL_GPL(imx_media_find_ipu_format);
 
 int imx_media_enum_ipu_formats(u32 *code, u32 index,
 			       enum imx_pixfmt_sel fmt_sel)
 {
-	return enum_formats(NULL, code, index, fmt_sel | PIXFMT_SEL_IPU);
+	return imx_media_enum_mbus_formats(code, index,
+					   fmt_sel | PIXFMT_SEL_IPU);
 }
 EXPORT_SYMBOL_GPL(imx_media_enum_ipu_formats);
 
-- 
2.17.1

