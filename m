Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C55B19E7F0
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2020 00:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgDDWlv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Apr 2020 18:41:51 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46438 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbgDDWlu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Apr 2020 18:41:50 -0400
Received: by mail-pf1-f194.google.com with SMTP id q3so5537197pff.13
        for <linux-media@vger.kernel.org>; Sat, 04 Apr 2020 15:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9ab691Q0eg7P5uD9OBbEfp0PkghC2D9TBmGEsQ+98EA=;
        b=DygPbOgIpS5ctd6ZJKexodNBtQwla2vQpTOmgQ2lUNGNxI2NEN4wdwRheaOjRAgTew
         lliMTmZFYkMbEJGjN9tBdxvGZ1ZCLORyTi90h2Fml/600QFbw4lKYMYaSS8ovXBNOHeG
         8tc0zVQ5e7IybPA5mcA9/SQL0sxlVGuPr69d/xb2QFnYqN4tpXDNuTCfzw8RiWE9ZAwz
         uYxskI2rsyL/bDI3LBvm3o1Fi+2SLp0kHIpaNHZ7rlqH+2NZT7nIWQMJI6p40veLMDWO
         bXI9dQPrRj13txt0zfTrtdFQn6/9DD8PR+LzFoYGxF51vIyHrEuuhFCZrHnrvruHw7KY
         8hnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9ab691Q0eg7P5uD9OBbEfp0PkghC2D9TBmGEsQ+98EA=;
        b=B5UnPZlU4JcBZ5/ybIh/4BgK8J7jxwwku3B7EitIpTg9vsxnmQ23oR4Ce+fbFza+vD
         lN42hpCIogboXRUS/XRylPPsdd0vfx0e2lkCCj/W2x2JJUNlzdxS6iVXEBWjJCXwohc8
         R2tJxFx6orlF3uIGYGBFndJPALu/NhxcgTr+whIv/B+JEo/tr6nwlAJ6nre6b2jUypxb
         nAeY2dIKKOPBdDmTtaDqNcInt8RASjwp5QqVfC3FZWJKAjFZxEBf3WwFddbgZF3234ye
         ywEbJeJy7Lp7r/rG4uzGMYOXcppwSdB7TDmuA9P67dDcfskHN31Z5audeCHLEMT3yPSV
         WQiA==
X-Gm-Message-State: AGi0PuYwyTG9dRLYFXax8W+a2LPBmQjPjLuq4ysOa9eCpkq5ArYs3oXi
        ETbUhmEGjDCjHfgQ+cXKCp1jLv2ndfU=
X-Google-Smtp-Source: APiQypK4yXMzxBub74B7JLkcpGIuI/SO1Ns4UGrrN149kqPONZNppT4jboGoTLIYaA1DbpMtCS37tQ==
X-Received: by 2002:a63:741b:: with SMTP id p27mr14518731pgc.68.1586040108712;
        Sat, 04 Apr 2020 15:41:48 -0700 (PDT)
Received: from mappy.world.mentorg.com (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id o11sm8690989pjb.18.2020.04.04.15.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 15:41:48 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 08/11] media: imx: utils: Split find|enum_format into fourcc and mbus functions
Date:   Sat,  4 Apr 2020 15:41:27 -0700
Message-Id: <20200404224130.23118-9-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404224130.23118-1-slongerbeam@gmail.com>
References: <20200404224130.23118-1-slongerbeam@gmail.com>
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

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 148 +++++++++++++-------
 1 file changed, 100 insertions(+), 48 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index bd8ebbf0b26d..a18d826996d1 100644
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
+ * Search for and return an entry in the pixel_formats[] array that matches
+ * the requested selection criteria.
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
+ * requested selection criteria. Returns the fourcc that matches the
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
+ * requested search criteria. Returns the media-bus code that matches
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
@@ -287,45 +364,20 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 
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
 
 const struct imx_media_pixfmt *
 imx_media_find_ipu_format(u32 code, enum imx_pixfmt_sel fmt_sel)
 {
-	return find_format(0, code, fmt_sel | PIXFMT_SEL_IPU, false);
+	return imx_media_find_mbus_format(code, fmt_sel | PIXFMT_SEL_IPU);
 }
 EXPORT_SYMBOL_GPL(imx_media_find_ipu_format);
 
 int imx_media_enum_ipu_format(u32 *code, u32 index,
 			      enum imx_pixfmt_sel fmt_sel)
 {
-	return enum_format(NULL, code, index, fmt_sel | PIXFMT_SEL_IPU, false);
+	return imx_media_enum_mbus_format(code, index,
+					  fmt_sel | PIXFMT_SEL_IPU);
 }
 EXPORT_SYMBOL_GPL(imx_media_enum_ipu_format);
 
-- 
2.17.1

