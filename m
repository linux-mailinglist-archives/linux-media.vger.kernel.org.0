Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E73F9196EFD
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2020 19:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728485AbgC2Rk1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Mar 2020 13:40:27 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:55459 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728461AbgC2Rk0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Mar 2020 13:40:26 -0400
Received: by mail-pj1-f66.google.com with SMTP id fh8so1384087pjb.5
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2020 10:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=e36BFOP0rsOt3VqDjVlSRI26dtxBFrySQwQiPprc6LM=;
        b=SIm71t/c6AyWk0pV87GyPpmOC95NBMhYRscA6UOCurVkuUaY4oqJJxO2bjjNYkepxb
         FQlg075kKRalkWsjzbdHCdie5mYbCJjiWmxiXbKwMQPMQP86bE15grOb6jz4jBXo+9G8
         LmfBrcwNYfX2ZOHKQm/JkPKGgHETS/BWDMUwmcOkyWiFVa3YmHZl7aNstI+Un5/pCUUn
         jsQ8eRyiIQE1KrZFTydNZbXWcif6HJEBGCX157AetQ70LAheyi+4KzkDtU36sbD5YmZ3
         zWf2TS7PecwBECMYYJDRkxNMzdOw0EhQuAWIvxZZUbG0qtXsVGGUnCVOpSJPmrAcpAPH
         /Krg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=e36BFOP0rsOt3VqDjVlSRI26dtxBFrySQwQiPprc6LM=;
        b=O4roIQTBHxf/d2vfw3nbwe7ING5vcFk1QoPbQysSEuZiy/KHMI4fW4UlwRbnk30Fgy
         qS2fIJ3TOSP1337NQpRXLl2ap8uK+YCEUuM56VJlV/PyoAdAbef+0wCXC4rfMl+XrvuJ
         e/j9QsWX8N+jRBVq7r77bpBW0yf/IuXO1vSAcl7gFJbzPyHhHcsr1Q+zWGQ+8OS4iwA2
         EYIVMAFWLZBeeuNLjrZ0cUbFujbf0Oa+jdkm+xscv47E6XMLfTMjxRCaITAx9JRQ/NHu
         5JWpWnLUtOEkUH8HaVGjo6rNbtq2BAre/PC49KjxdZ6D94TIgqLdk+mbQQDVe+qrVfQI
         hh6A==
X-Gm-Message-State: AGi0PuZloczYWIFPzouXw0777kQeje88QC48VK7Z4WGjw/oaa0TVlWPD
        6dZUryekh+IruxZLo37yhnqbr9tJk0A=
X-Google-Smtp-Source: APiQypKAbBluqu8hE0sXu4aAzxuVrcC/IcE1eEtWH7fFcH6VLMHPoZDqNcFMS6Rh5MZz4nlZyKFXYQ==
X-Received: by 2002:a17:902:a514:: with SMTP id s20mr4160400plq.152.1585503625326;
        Sun, 29 Mar 2020 10:40:25 -0700 (PDT)
Received: from mappy.nv.charter.com ([2600:6c4e:200:e053:a0c5:5fbc:c28e:f91f])
        by smtp.gmail.com with ESMTPSA id b133sm7031253pfb.180.2020.03.29.10.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 10:40:24 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v3 07/10] media: imx: utils: Remove unneeded argument to (find|enum)_format()
Date:   Sun, 29 Mar 2020 10:40:07 -0700
Message-Id: <20200329174010.12304-8-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200329174010.12304-1-slongerbeam@gmail.com>
References: <20200329174010.12304-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The find_format() and enum_format() functions take an argument that
tells whether to take into account formats that don't have associated
media bus codes. The same information can be deduced from the fourcc
argument passed to these functions. Remove the allow_non_mbus argument
and use fourcc instead internally.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index ff4f85be6d65..06527ee81e6b 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -194,8 +194,7 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 
 static const struct imx_media_pixfmt *find_format(u32 fourcc,
 						  u32 code,
-						  enum codespace_sel cs_sel,
-						  bool allow_non_mbus)
+						  enum codespace_sel cs_sel)
 {
 	unsigned int i;
 
@@ -208,8 +207,7 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
 			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
 			 CS_SEL_YUV : CS_SEL_RGB);
 
-		if (!(fmt_cs_sel & cs_sel) ||
-		    (!allow_non_mbus && !fmt->codes))
+		if (!(fmt_cs_sel & cs_sel) || (!fourcc && !fmt->codes))
 			continue;
 
 		if (fourcc && fmt->fourcc == fourcc)
@@ -228,8 +226,7 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
 }
 
 static int enum_format(u32 *fourcc, u32 *code, u32 index,
-		       enum codespace_sel cs_sel,
-		       bool allow_non_mbus)
+		       enum codespace_sel cs_sel)
 {
 	unsigned int i;
 
@@ -242,8 +239,7 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
 			 CS_SEL_YUV : CS_SEL_RGB);
 
-		if (!(fmt_cs_sel & cs_sel) ||
-		    (!allow_non_mbus && !fmt->codes))
+		if (!(fmt_cs_sel & cs_sel) || (!fourcc && !fmt->codes))
 			continue;
 
 		if (fourcc && index == 0) {
@@ -272,26 +268,26 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 const struct imx_media_pixfmt *
 imx_media_find_format(u32 fourcc, enum codespace_sel cs_sel)
 {
-	return find_format(fourcc, 0, cs_sel, true);
+	return find_format(fourcc, 0, cs_sel);
 }
 EXPORT_SYMBOL_GPL(imx_media_find_format);
 
 int imx_media_enum_format(u32 *fourcc, u32 index, enum codespace_sel cs_sel)
 {
-	return enum_format(fourcc, NULL, index, cs_sel, true);
+	return enum_format(fourcc, NULL, index, cs_sel);
 }
 EXPORT_SYMBOL_GPL(imx_media_enum_format);
 
 const struct imx_media_pixfmt *
 imx_media_find_mbus_format(u32 code, enum codespace_sel cs_sel)
 {
-	return find_format(0, code, cs_sel, false);
+	return find_format(0, code, cs_sel);
 }
 EXPORT_SYMBOL_GPL(imx_media_find_mbus_format);
 
 int imx_media_enum_mbus_format(u32 *code, u32 index, enum codespace_sel cs_sel)
 {
-	return enum_format(NULL, code, index, cs_sel, false);
+	return enum_format(NULL, code, index, cs_sel);
 }
 EXPORT_SYMBOL_GPL(imx_media_enum_mbus_format);
 
-- 
2.17.1

