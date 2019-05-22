Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C841825B7F
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 03:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728262AbfEVBDf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 21:03:35 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44304 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727208AbfEVBDe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 21:03:34 -0400
Received: by mail-pg1-f193.google.com with SMTP id n2so373843pgp.11;
        Tue, 21 May 2019 18:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4LWWo6vClK616q2qAdH10ez3h7JYhnb9DJf05zCL0Rc=;
        b=HbANLn+g0LwhyL73Znthe1lIqjmXuS5dqUXxR+6LYakUxm9jvTiZqWvFAXWT6Mg0Cu
         VxWu2fAdjE+2eb5xGK+NY38ms+xhOutmalOoq/bJWbCnk73gDzvGFRQimK5EVDONrWZm
         Ho93lEevjG5LyoArdC6YBvHYJzIPtn3GhFJIFGqhQm/FpkxIMJl22y6Dx6vclvMMAr9C
         wdKsrcvKRrOKH5OgtQZherSQQ5CdFYgrze/sRst4uhjq+9249vdQ6TtiZCyqN7qAAp4X
         aXafPWhJQaFdqPWtnw/SYFfKwRN75UkKzBF+gmethj1+YRDrsNgKFiZR3RLBLQivMAbZ
         oDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4LWWo6vClK616q2qAdH10ez3h7JYhnb9DJf05zCL0Rc=;
        b=Aiw/CHEWzv+dW2W7Zg6aKw83O5bEsTmr4plR7upNH/dzZ8k+rtzHyYAOQGlxrHp4Hj
         bbQ0pG7LbWRy56uMwEbtTptVSC9oT7b8DV6Ja8PK1+QzCFcFemloc4Q1HL5bzIDmoUlB
         jJxdzoyb8HYnSi8QyrSdlJlbN3XEbRpzczZgjJFrvAIJBVXxfPRVsS+B26/aHIZFYOxt
         Z9t5f9ol6NwHZf9VJ5nw7RWk/NAhsafAKgLdD4ysQbyTHJNE9Ga7QxPqk/v8uMMvgtO/
         p7oNuE39ZkTWl1gn2X6mxKPgzKNMBHS0SKbsBeSVGjTOpOopokIrIctADg96MmwLd3Pl
         R/Sw==
X-Gm-Message-State: APjAAAW/p9oAG7NgHSFAJaFZJk8zqulUbzgMtiVvl2gVjnXRVOeHlJ3t
        99rluUMXSvkIkff7GXfnBD2alBT/
X-Google-Smtp-Source: APXvYqx46cgSSnZBSN8MWy4w7UZ6LJ5vZdvCQjHSWoe3hmviwnIYYozuLF6vRtAMmZFD3wJxA9CP7A==
X-Received: by 2002:a62:575b:: with SMTP id l88mr91654511pfb.143.1558487013025;
        Tue, 21 May 2019 18:03:33 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q193sm34291242pfc.52.2019.05.21.18.03.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 18:03:32 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR FREESCALE
        IMX), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 4/5] gpu: ipu-v3: ipu-ic-csc: Add support for Rec.709 encoding
Date:   Tue, 21 May 2019 18:03:16 -0700
Message-Id: <20190522010317.23710-5-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522010317.23710-1-slongerbeam@gmail.com>
References: <20190522010317.23710-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for Rec.709 encoding and inverse encoding.

Reported-by: Tim Harvey <tharvey@gateworks.com>
Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
Changes in v7:
- moved CSC tables to new module ipu-ic-csc.c.
- express negative coefficients as true signed int's, for better
  readability.
Changes in v5:
- moved API changes to a previous patch.
- moved CSC coeff calc to new function calc_csc_coeffs().
Changes in v4:
- fix compile error.
Chnges in v3:
- none.
Changes in v2:
- only return "Unsupported YCbCr encoding" error if inf != outf,
  since if inf == outf, the identity matrix can be used. Reported
  by Tim Harvey.
---
 drivers/gpu/ipu-v3/ipu-ic-csc.c | 139 ++++++++++++++++++++++++++++++--
 1 file changed, 134 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-ic-csc.c b/drivers/gpu/ipu-v3/ipu-ic-csc.c
index 8e9150b1d668..09e94aa12c40 100644
--- a/drivers/gpu/ipu-v3/ipu-ic-csc.c
+++ b/drivers/gpu/ipu-v3/ipu-ic-csc.c
@@ -230,14 +230,133 @@ static const struct ipu_ic_csc_params *yuv2rgb_601[] = {
 	&yuvl2rgbl_601,
 };
 
+/*
+ * REC.709 encoding from RGB full range to YUV full range:
+ *
+ * Y =  .2126 * R + .7152 * G + .0722 * B
+ * U = -.1146 * R - .3854 * G + .5000 * B + 128
+ * V =  .5000 * R - .4542 * G - .0458 * B + 128
+ */
+static const struct ipu_ic_csc_params rgbf2yuvf_709 = {
+	.coeff = {
+		{  54,  183,  19 },
+		{ -29,  -99, 128 },
+		{ 128, -116, -12 },
+	},
+	.offset = { 0, 512, 512 },
+	.scale = 1,
+};
+
+/* Rec.709 RGB full-range to YUV limited-range */
+static const struct ipu_ic_csc_params rgbf2yuvl_709 = {
+	.coeff = {
+		{   47,  157,   16, },
+		{  -26,  -87,  112, },
+		{  112, -102,  -10, },
+	},
+	.offset = { 64, 512, 512, },
+	.scale = 1,
+	.sat = true,
+};
+
+/* Rec.709 RGB limited-range to YUV full-range */
+static const struct ipu_ic_csc_params rgbl2yuvf_709 = {
+	.coeff = {
+		{   63,  213,   22, },
+		{  -34, -115,  149, },
+		{  149, -135,  -14, },
+	},
+	.offset = { -75, 512, 512, },
+	.scale = 1,
+};
+
+/* Rec.709 RGB limited-range to YUV limited-range */
+static const struct ipu_ic_csc_params rgbl2yuvl_709 = {
+	.coeff = {
+		{   54,  183,   18, },
+		{  -30, -101,  131, },
+		{  131, -119,  -12, },
+	},
+	.offset = { 0, 512, 512, },
+	.scale = 1,
+	.sat = true,
+};
+
+/*
+ * Inverse REC.709 encoding from YUV full range to RGB full range:
+ *
+ * R = 1. * Y +      0 * (Cb - 128) + 1.5748 * (Cr - 128)
+ * G = 1. * Y -  .1873 * (Cb - 128) -  .4681 * (Cr - 128)
+ * B = 1. * Y + 1.8556 * (Cb - 128) +      0 * (Cr - 128)
+ *
+ * equivalently (factoring out the offsets):
+ *
+ * R = 1. * Y  +      0 * Cb + 1.5748 * Cr - 201.574
+ * G = 1. * Y  -  .1873 * Cb -  .4681 * Cr +  83.891
+ * B = 1. * Y  + 1.8556 * Cb +      0 * Cr - 237.517
+ */
+static const struct ipu_ic_csc_params yuvf2rgbf_709 = {
+	.coeff = {
+		{  128,   0, 202 },
+		{  128, -24, -60 },
+		{  128, 238,   0 },
+	},
+	.offset = { -403, 168, -475 },
+	.scale = 2,
+};
+
+/* Rec.709 YUV full-range to RGB limited-range */
+static const struct ipu_ic_csc_params yuvf2rgbl_709 = {
+	.coeff = {
+		{  110,    0,  173, },
+		{  110,  -21,  -51, },
+		{  110,  204,    0, },
+	},
+	.offset = { -314, 176, -376, },
+	.scale = 2,
+};
+
+/* Rec.709 YUV limited-range to RGB full-range */
+static const struct ipu_ic_csc_params yuvl2rgbf_709 = {
+	.coeff = {
+		{   75,    0,  115, },
+		{   75,  -14,  -34, },
+		{   75,  135,    0, },
+	},
+	.offset = { -248, 77, -289, },
+	.scale = 3,
+};
+
+/* Rec.709 YUV limited-range to RGB limited-range */
+static const struct ipu_ic_csc_params yuvl2rgbl_709 = {
+	.coeff = {
+		{  128,    0,  197, },
+		{  128,  -23,  -59, },
+		{  128,  232,    0, },
+	},
+	.offset = { -394, 164, -464, },
+	.scale = 2,
+};
+
+static const struct ipu_ic_csc_params *rgb2yuv_709[] = {
+	&rgbf2yuvf_709,
+	&rgbf2yuvl_709,
+	&rgbl2yuvf_709,
+	&rgbl2yuvl_709,
+};
+
+static const struct ipu_ic_csc_params *yuv2rgb_709[] = {
+	&yuvf2rgbf_709,
+	&yuvf2rgbl_709,
+	&yuvl2rgbf_709,
+	&yuvl2rgbl_709,
+};
+
 static int calc_csc_coeffs(struct ipu_ic_csc *csc)
 {
 	const struct ipu_ic_csc_params **params_tbl;
 	int tbl_idx;
 
-	if (csc->out_cs.enc != V4L2_YCBCR_ENC_601)
-		return -ENOTSUPP;
-
 	tbl_idx = (QUANT_MAP(csc->in_cs.quant) << 1) |
 		QUANT_MAP(csc->out_cs.quant);
 
@@ -250,8 +369,18 @@ static int calc_csc_coeffs(struct ipu_ic_csc *csc)
 
 	/* YUV <-> RGB encoding is required */
 
-	params_tbl = (csc->in_cs.cs == IPUV3_COLORSPACE_YUV) ?
-		yuv2rgb_601 : rgb2yuv_601;
+	switch (csc->out_cs.enc) {
+	case V4L2_YCBCR_ENC_601:
+		params_tbl = (csc->in_cs.cs == IPUV3_COLORSPACE_YUV) ?
+			yuv2rgb_601 : rgb2yuv_601;
+		break;
+	case V4L2_YCBCR_ENC_709:
+		params_tbl = (csc->in_cs.cs == IPUV3_COLORSPACE_YUV) ?
+			yuv2rgb_709 : rgb2yuv_709;
+		break;
+	default:
+		return -ENOTSUPP;
+	}
 
 	csc->params = *params_tbl[tbl_idx];
 
-- 
2.17.1

