Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BBFE25B82
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 03:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728327AbfEVBDp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 21:03:45 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43916 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728099AbfEVBDc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 21:03:32 -0400
Received: by mail-pl1-f196.google.com with SMTP id gn7so179566plb.10;
        Tue, 21 May 2019 18:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KR2SKJZVR7dpL/K3IRH5SfiJbtnvBNtS7TM5fTzvwUU=;
        b=HHgQUWC34be18WJ5hpThjXaJU/6mavEM8ZzuyekAbNVxY/4FX8Cs/A5WF6CsgOwtKE
         NxUmOwiHscHOZ6sxipTWhKlKUD5q3a3HTRuWmduWUtGNyeWty1CBbEAR48zNpf8gxjxV
         T3ss6wWbGfo35ppJ6pmZdjOwfLO7EEJODY5/VgkTlNVvKDVKLeR4B9o3ry0EBX9F6kzx
         zfmP+JnvBG9mV5DZKXKcHjtqAgXCSMI2mmxCjL99jcC1cnirFzqCO8GKMYDaKXRJwEMV
         J/J6k/95z9HZR5yKOo95sEBfgoljDZt45iN33bTeJRM36aW2/3wSHXTg80Je6dQGWvQM
         pLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KR2SKJZVR7dpL/K3IRH5SfiJbtnvBNtS7TM5fTzvwUU=;
        b=J/O8ppkF37bZuLf/fZ2KXQMzFDiy7tT/2/kbH1UHZheft4QibLV85C5/k5BEPxR1+8
         YLz1iY2MbMsngJyfb7/iQs8TmhVjvBAUsR0GG+XlHmScQhjUxySIM+2lLDr5EiSN+XIE
         oerSvhaj5q0+zz21uwnTGu0KT9OfYhGbCw8JLIM9JbIgrYq8tjliG8XrPP9GWdJQh4d5
         JYLgfePU74xmC1ABELjmPNvQN2xCx+KB2SqJ8BVHNXqexfJLLrvBkn6t0K1L1GWtZPBF
         HX6Kj/GRA6QmCORYYX3koCHoFI6O3QvFKRQ8DSyRzUp2ED2wyqedDU/wEkrbhVBJ9mA5
         zCXQ==
X-Gm-Message-State: APjAAAWX2LuoOw4bmDSfTfTFiL6NcCSROYoSz69F+kMom/BRSuDKYika
        ifqS/iqxN9YYvXsJ7LVxORvNfGUA
X-Google-Smtp-Source: APXvYqykPyD2qJbS9WVld6QmroysQrD9PBf86L0y3vxq20JEw07sose/NZ9zVGHthyLMv4cZwb9Qug==
X-Received: by 2002:a17:902:12f:: with SMTP id 44mr40653762plb.137.1558487011546;
        Tue, 21 May 2019 18:03:31 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q193sm34291242pfc.52.2019.05.21.18.03.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 18:03:30 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR FREESCALE
        IMX), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 3/5] gpu: ipu-v3: ipu-ic-csc: Add support for limited range encoding
Date:   Tue, 21 May 2019 18:03:15 -0700
Message-Id: <20190522010317.23710-4-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522010317.23710-1-slongerbeam@gmail.com>
References: <20190522010317.23710-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for encodings to or from limited range quantization.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
Changes in v7:
- hard-code the coefficients instead of deriving the limited range
  coefficients from the full2full coefficients on the fly with
  fixed-point math.
- add support for RGB limited-range.
---
 drivers/gpu/ipu-v3/ipu-ic-csc.c | 180 +++++++++++++++++++++++++++++---
 1 file changed, 166 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-ic-csc.c b/drivers/gpu/ipu-v3/ipu-ic-csc.c
index 5fb469cd64fe..8e9150b1d668 100644
--- a/drivers/gpu/ipu-v3/ipu-ic-csc.c
+++ b/drivers/gpu/ipu-v3/ipu-ic-csc.c
@@ -10,6 +10,10 @@
 #include <linux/sizes.h>
 #include "ipu-prv.h"
 
+#define QUANT_MAP(q)					\
+	((q) == V4L2_QUANTIZATION_FULL_RANGE ||		\
+	 (q) == V4L2_QUANTIZATION_DEFAULT ? 0 : 1)
+
 /* identity matrix */
 static const struct ipu_ic_csc_params identity = {
 	.coeff = {
@@ -21,12 +25,87 @@ static const struct ipu_ic_csc_params identity = {
 	.scale = 2,
 };
 
+/*
+ * RGB full-range to RGB limited-range
+ *
+ * R_lim = 0.8588 * R_full + 16
+ * G_lim = 0.8588 * G_full + 16
+ * B_lim = 0.8588 * B_full + 16
+ */
+static const struct ipu_ic_csc_params rgbf2rgbl = {
+	.coeff = {
+		{  220,    0,    0, },
+		{    0,  220,    0, },
+		{    0,    0,  220, },
+	},
+	.offset = { 64, 64, 64, },
+	.scale = 1,
+};
+
+/*
+ * RGB limited-range to RGB full-range
+ *
+ * R_full = 1.1644 * (R_lim - 16)
+ * G_full = 1.1644 * (G_lim - 16)
+ * B_full = 1.1644 * (B_lim - 16)
+ */
+static const struct ipu_ic_csc_params rgbl2rgbf = {
+	.coeff = {
+		{  149,    0,    0, },
+		{    0,  149,    0, },
+		{    0,    0,  149, },
+	},
+	.offset = { -37, -37, -37, },
+	.scale = 2,
+};
+
+/*
+ * YUV full-range to YUV limited-range
+ *
+ * Y_lim  = 0.8588 * Y_full + 16
+ * Cb_lim = 0.8784 * (Cb_full - 128) + 128
+ * Cr_lim = 0.8784 * (Cr_full - 128) + 128
+ */
+static const struct ipu_ic_csc_params yuvf2yuvl = {
+	.coeff = {
+		{  220,    0,    0, },
+		{    0,  225,    0, },
+		{    0,    0,  225, },
+	},
+	.offset = { 64, 62, 62, },
+	.scale = 1,
+	.sat = true,
+};
+
+/*
+ * YUV limited-range to YUV full-range
+ *
+ * Y_full  = 1.1644 * (Y_lim - 16)
+ * Cb_full = 1.1384 * (Cb_lim - 128) + 128
+ * Cr_full = 1.1384 * (Cr_lim - 128) + 128
+ */
+static const struct ipu_ic_csc_params yuvl2yuvf = {
+	.coeff = {
+		{  149,    0,    0, },
+		{    0,  146,    0, },
+		{    0,    0,  146, },
+	},
+	.offset = { -37, -35, -35, },
+	.scale = 2,
+};
+
 static const struct ipu_ic_csc_params *rgb2rgb[] = {
 	&identity,
+	&rgbf2rgbl,
+	&rgbl2rgbf,
+	&identity,
 };
 
 static const struct ipu_ic_csc_params *yuv2yuv[] = {
 	&identity,
+	&yuvf2yuvl,
+	&yuvl2yuvf,
+	&identity,
 };
 
 /*
@@ -46,6 +125,41 @@ static const struct ipu_ic_csc_params rgbf2yuvf_601 = {
 	.scale = 1,
 };
 
+/* BT.601 RGB full-range to YUV limited-range */
+static const struct ipu_ic_csc_params rgbf2yuvl_601 = {
+	.coeff = {
+		{   66,  129,   25, },
+		{  -38,  -74,  112, },
+		{  112,  -94,  -18, },
+	},
+	.offset = { 64, 512, 512, },
+	.scale = 1,
+	.sat = true,
+};
+
+/* BT.601 RGB limited-range to YUV full-range */
+static const struct ipu_ic_csc_params rgbl2yuvf_601 = {
+	.coeff = {
+		{   89,  175,   34, },
+		{  -50,  -99,  149, },
+		{  149, -125,  -24, },
+	},
+	.offset = { -75, 512, 512, },
+	.scale = 1,
+};
+
+/* BT.601 RGB limited-range to YUV limited-range */
+static const struct ipu_ic_csc_params rgbl2yuvl_601 = {
+	.coeff = {
+		{   77,  150,   29, },
+		{  -44,  -87,  131, },
+		{  131, -110,  -21, },
+	},
+	.offset = { 0, 512, 512, },
+	.scale = 1,
+	.sat = true,
+};
+
 /*
  * BT.601 YUV full-range to RGB full-range
  *
@@ -69,39 +183,77 @@ static const struct ipu_ic_csc_params yuvf2rgbf_601 = {
 	.scale = 2,
 };
 
+/* BT.601 YUV full-range to RGB limited-range */
+static const struct ipu_ic_csc_params yuvf2rgbl_601 = {
+	.coeff = {
+		{  110,    0,  154, },
+		{  110,  -38,  -78, },
+		{  110,  195,    0, },
+	},
+	.offset = { -276, 265, -358, },
+	.scale = 2,
+};
+
+/* BT.601 YUV limited-range to RGB full-range */
+static const struct ipu_ic_csc_params yuvl2rgbf_601 = {
+	.coeff = {
+		{   75,    0,  102, },
+		{   75,  -25,  -52, },
+		{   75,  129,    0, },
+	},
+	.offset = { -223, 136, -277, },
+	.scale = 3,
+};
+
+/* BT.601 YUV limited-range to RGB limited-range */
+static const struct ipu_ic_csc_params yuvl2rgbl_601 = {
+	.coeff = {
+		{  128,    0,  175, },
+		{  128,  -43,  -89, },
+		{  128,  222,    0, },
+	},
+	.offset = { -351, 265, -443, },
+	.scale = 2,
+};
+
 static const struct ipu_ic_csc_params *rgb2yuv_601[] = {
 	&rgbf2yuvf_601,
+	&rgbf2yuvl_601,
+	&rgbl2yuvf_601,
+	&rgbl2yuvl_601,
 };
 
 static const struct ipu_ic_csc_params *yuv2rgb_601[] = {
 	&yuvf2rgbf_601,
+	&yuvf2rgbl_601,
+	&yuvl2rgbf_601,
+	&yuvl2rgbl_601,
 };
 
 static int calc_csc_coeffs(struct ipu_ic_csc *csc)
 {
+	const struct ipu_ic_csc_params **params_tbl;
+	int tbl_idx;
+
 	if (csc->out_cs.enc != V4L2_YCBCR_ENC_601)
 		return -ENOTSUPP;
 
-	if ((csc->in_cs.cs == IPUV3_COLORSPACE_YUV &&
-	     csc->in_cs.quant != V4L2_QUANTIZATION_FULL_RANGE) ||
-	    (csc->out_cs.cs == IPUV3_COLORSPACE_YUV &&
-	     csc->out_cs.quant != V4L2_QUANTIZATION_FULL_RANGE))
-		return -ENOTSUPP;
-
-	if ((csc->in_cs.cs == IPUV3_COLORSPACE_RGB &&
-	     csc->in_cs.quant != V4L2_QUANTIZATION_FULL_RANGE) ||
-	    (csc->out_cs.cs == IPUV3_COLORSPACE_RGB &&
-	     csc->out_cs.quant != V4L2_QUANTIZATION_FULL_RANGE))
-		return -ENOTSUPP;
+	tbl_idx = (QUANT_MAP(csc->in_cs.quant) << 1) |
+		QUANT_MAP(csc->out_cs.quant);
 
 	if (csc->in_cs.cs == csc->out_cs.cs) {
 		csc->params = (csc->in_cs.cs == IPUV3_COLORSPACE_YUV) ?
-			*yuv2yuv[0] : *rgb2rgb[0];
+			*yuv2yuv[tbl_idx] : *rgb2rgb[tbl_idx];
+
 		return 0;
 	}
 
-	csc->params = (csc->in_cs.cs == IPUV3_COLORSPACE_YUV) ?
-		*yuv2rgb_601[0] : *rgb2yuv_601[0];
+	/* YUV <-> RGB encoding is required */
+
+	params_tbl = (csc->in_cs.cs == IPUV3_COLORSPACE_YUV) ?
+		yuv2rgb_601 : rgb2yuv_601;
+
+	csc->params = *params_tbl[tbl_idx];
 
 	return 0;
 }
-- 
2.17.1

