Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0F225B7B
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 03:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728215AbfEVBDc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 21:03:32 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43914 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727208AbfEVBDb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 21:03:31 -0400
Received: by mail-pl1-f194.google.com with SMTP id gn7so179549plb.10;
        Tue, 21 May 2019 18:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7hje4FsfBPJPMKbxtLZB2p363LKCH0+OWM/5l2pYlCQ=;
        b=cJfIE37IhFI1J+tbPbzYI52k0rd7G7+wj/XfuUKd0kUZxwBlOtbqM1OapByKS84pVk
         4vaOECZBoVljnGEB2PAXht1SZZhqmznzCiWenPP7zyp8/z7Cxwn3PjK8UMrTE3m6P5mZ
         kLnIgAqbrJipIroW0bshtF3iuYEHxZpPaidesEcEGsDEj0tzLgPoLMeGc2X2y0aLZui1
         tJGkVdV9W+ygxnJn/2wYN2cztVfecVNo4FhryhHxKR/aorAg0OJP4cJb541orj3L+FKf
         WEmZsqXyJCvi2zBR+r6iBMFvm6La2jWKVEEbkgCzRW+/Lcw91wWK/41zp5nSjeUQLclY
         qOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7hje4FsfBPJPMKbxtLZB2p363LKCH0+OWM/5l2pYlCQ=;
        b=ud23s9WXH3OrNtQt7PMvEzdDwqY/Lyjqy+bPNiLt7Fhz3h9xhGnV6z25HkIuBon59z
         trr8TnqovHRl5lq+glT3jzcJ/pbKLyJ6mS6ax78BINwmoQzSEXRUlN8h1f/JdPdI7ANE
         5tolZMn9s3yclbTaYSs+uyjk6v/t8fA6sgMx4UU3pMwifMfoDcoZq2bFPOHADH4OFFvz
         Lv+Xy7Aq92vLGXcFE7LqhGJcW2mfndvt1s8e6sE5jHZFcKkAGksc22Zxp6cHqYUKc9N4
         F3XtI7l/Ohmou9pJB9hb94hd+wV7gqByZ5eE0Dn5T3TUXlnhl0/Aivvdm6Mvk6xmVJY9
         f8eg==
X-Gm-Message-State: APjAAAVXI7EiXJaguuWjZOgWItJ/17/k7YQVlsTqGnocKbVR+84EXNUY
        5nrwDnBIdr0mAwdBsGzWOZYxh8Cb
X-Google-Smtp-Source: APXvYqy6HXFpMBopQ5N+7EA4FCDrWyrwi9faPF2z60FqUVwkDffdxvrpUvcQprh7YxSXJuWYuE5FPA==
X-Received: by 2002:a17:902:4623:: with SMTP id o32mr66617798pld.276.1558487010155;
        Tue, 21 May 2019 18:03:30 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q193sm34291242pfc.52.2019.05.21.18.03.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 18:03:29 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-kernel@vger.kernel.org (open list),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR FREESCALE
        IMX), devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE),
        linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER)
Subject: [PATCH v8 2/5] gpu: ipu-v3: ipu-ic: Fully describe colorspace conversions
Date:   Tue, 21 May 2019 18:03:14 -0700
Message-Id: <20190522010317.23710-3-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522010317.23710-1-slongerbeam@gmail.com>
References: <20190522010317.23710-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Only providing the input and output RGB/YUV space to the IC task init
functions is not sufficient. To fully characterize a colorspace
conversion, the Y'CbCr encoding standard, and quantization also
need to be specified.

Define a 'struct ipu_ic_colorspace' that includes all the above.

This allows to actually enforce the fact that the IC:

- can only encode to/from YUV and RGB full range. A follow-up patch will
  remove this restriction.
- can only encode using BT.601 standard. A follow-up patch will add
  Rec.709 encoding support.

The determination of the CSC coefficients based on the input/output
'struct ipu_ic_colorspace' are moved to a new exported function
ipu_ic_calc_csc(), and 'struct ic_csc_params' is exported as
'struct ipu_ic_csc_params'. ipu_ic_calc_csc() fills a 'struct ipu_ic_csc'
with the input/output 'struct ipu_ic_colorspace' and the calculated
'struct ic_csc_params' from those input/output colorspaces.

The functions ipu_ic_task_init(_rsc)() now take a filled 'struct
ipu_ic_csc'.

The existing CSC coefficient tables and ipu_ic_calc_csc() are moved
to a new module ipu-ic-csc.c. This is in preparation for adding more
coefficient tables for limited range quantization and more encoding
standards.

The existing ycbcr2rgb and inverse rgb2ycbcr tables defined the BT.601
Y'CbCr encoding coefficients. The rgb2ycbcr table specifically described
the BT.601 encoding from full range RGB to full range YUV. Table
comments have been added in ipu-ic-csc.c to make this more clear.

The ycbcr2rgb inverse table described encoding YUV limited range to RGB
full range. To be consistent with the rgb2ycbcr table, this table is
converted to YUV full range to RGB full range, and the comments are
expanded in ipu-ic-csc.c.

The ic_csc_rgb2rgb table was just an identity matrix, so it is renamed
'identity' in ipu-ic-csc.c.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
Changes in v8:
- remove Fixes: and cc: stable. This patch is too difficult to backport
  to stable trees.
Changes in v7:
- squashed with "gpu: ipu-v3: ipu-ic: Fix BT.601 coefficients".
- moved the coefficient tables and calc_csc_coeffs() to a new
  module ipu-ic-csc.c, and added exported ipu_ic_calc_csc() to it.
- drop v4l2_colorspace (chromaticities) from 'struct ipu_ic_colorspace'.
  It's implied that xfer_func (gamma function) must be the same for input
  and output, so make that implicit for chromaticities too.
- drop passing priv to calc_csc_coeffs(), was only used to print error
  messages.
- removed the inverse_encode boolean in calc_csc_coeffs().
- express negative coefficients as true signed int's, for better
  readability.
- tweak inverse coeff in comments, no change to rounded table values.
---
 drivers/gpu/ipu-v3/Makefile                 |   4 +-
 drivers/gpu/ipu-v3/ipu-ic-csc.c             | 129 ++++++++++++++++++
 drivers/gpu/ipu-v3/ipu-ic.c                 | 138 +++++++-------------
 drivers/gpu/ipu-v3/ipu-image-convert.c      |  28 ++--
 drivers/staging/media/imx/imx-ic-prpencvf.c |  34 ++++-
 include/video/imx-ipu-v3.h                  |  56 +++++++-
 6 files changed, 271 insertions(+), 118 deletions(-)
 create mode 100644 drivers/gpu/ipu-v3/ipu-ic-csc.c

diff --git a/drivers/gpu/ipu-v3/Makefile b/drivers/gpu/ipu-v3/Makefile
index 7cc8b47e488b..5fe5ef20701a 100644
--- a/drivers/gpu/ipu-v3/Makefile
+++ b/drivers/gpu/ipu-v3/Makefile
@@ -2,8 +2,8 @@
 obj-$(CONFIG_IMX_IPUV3_CORE) += imx-ipu-v3.o
 
 imx-ipu-v3-objs := ipu-common.o ipu-cpmem.o ipu-csi.o ipu-dc.o ipu-di.o \
-		ipu-dp.o ipu-dmfc.o ipu-ic.o ipu-image-convert.o \
-		ipu-smfc.o ipu-vdi.o
+		ipu-dp.o ipu-dmfc.o ipu-ic.o ipu-ic-csc.o \
+		ipu-image-convert.o ipu-smfc.o ipu-vdi.o
 
 ifdef CONFIG_DRM
 	imx-ipu-v3-objs += ipu-pre.o ipu-prg.o
diff --git a/drivers/gpu/ipu-v3/ipu-ic-csc.c b/drivers/gpu/ipu-v3/ipu-ic-csc.c
new file mode 100644
index 000000000000..5fb469cd64fe
--- /dev/null
+++ b/drivers/gpu/ipu-v3/ipu-ic-csc.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2019 Mentor Graphics Inc.
+ */
+
+#include <linux/types.h>
+#include <linux/init.h>
+#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/sizes.h>
+#include "ipu-prv.h"
+
+/* identity matrix */
+static const struct ipu_ic_csc_params identity = {
+	.coeff = {
+		{  128,    0,    0, },
+		{    0,  128,    0, },
+		{    0,    0,  128, },
+	},
+	.offset = { 0, 0, 0, },
+	.scale = 2,
+};
+
+static const struct ipu_ic_csc_params *rgb2rgb[] = {
+	&identity,
+};
+
+static const struct ipu_ic_csc_params *yuv2yuv[] = {
+	&identity,
+};
+
+/*
+ * BT.601 RGB full-range to YUV full-range
+ *
+ * Y =  .2990 * R + .5870 * G + .1140 * B
+ * U = -.1687 * R - .3313 * G + .5000 * B + 128
+ * V =  .5000 * R - .4187 * G - .0813 * B + 128
+ */
+static const struct ipu_ic_csc_params rgbf2yuvf_601 = {
+	.coeff = {
+		{   77,  150,   29, },
+		{  -43,  -85,  128, },
+		{  128, -107,  -21, },
+	},
+	.offset = { 0, 512, 512, },
+	.scale = 1,
+};
+
+/*
+ * BT.601 YUV full-range to RGB full-range
+ *
+ * R = 1. * Y +      0 * (Cb - 128) + 1.4020 * (Cr - 128)
+ * G = 1. * Y -  .3441 * (Cb - 128) -  .7141 * (Cr - 128)
+ * B = 1. * Y + 1.7720 * (Cb - 128) +      0 * (Cr - 128)
+ *
+ * equivalently (factoring out the offsets):
+ *
+ * R = 1. * Y  +      0 * Cb + 1.4020 * Cr - 179.456
+ * G = 1. * Y  -  .3441 * Cb -  .7141 * Cr + 135.450
+ * B = 1. * Y  + 1.7720 * Cb +      0 * Cr - 226.816
+ */
+static const struct ipu_ic_csc_params yuvf2rgbf_601 = {
+	.coeff = {
+		{  128,    0,  179, },
+		{  128,  -44,  -91, },
+		{  128,  227,    0, },
+	},
+	.offset = { -359, 271, -454, },
+	.scale = 2,
+};
+
+static const struct ipu_ic_csc_params *rgb2yuv_601[] = {
+	&rgbf2yuvf_601,
+};
+
+static const struct ipu_ic_csc_params *yuv2rgb_601[] = {
+	&yuvf2rgbf_601,
+};
+
+static int calc_csc_coeffs(struct ipu_ic_csc *csc)
+{
+	if (csc->out_cs.enc != V4L2_YCBCR_ENC_601)
+		return -ENOTSUPP;
+
+	if ((csc->in_cs.cs == IPUV3_COLORSPACE_YUV &&
+	     csc->in_cs.quant != V4L2_QUANTIZATION_FULL_RANGE) ||
+	    (csc->out_cs.cs == IPUV3_COLORSPACE_YUV &&
+	     csc->out_cs.quant != V4L2_QUANTIZATION_FULL_RANGE))
+		return -ENOTSUPP;
+
+	if ((csc->in_cs.cs == IPUV3_COLORSPACE_RGB &&
+	     csc->in_cs.quant != V4L2_QUANTIZATION_FULL_RANGE) ||
+	    (csc->out_cs.cs == IPUV3_COLORSPACE_RGB &&
+	     csc->out_cs.quant != V4L2_QUANTIZATION_FULL_RANGE))
+		return -ENOTSUPP;
+
+	if (csc->in_cs.cs == csc->out_cs.cs) {
+		csc->params = (csc->in_cs.cs == IPUV3_COLORSPACE_YUV) ?
+			*yuv2yuv[0] : *rgb2rgb[0];
+		return 0;
+	}
+
+	csc->params = (csc->in_cs.cs == IPUV3_COLORSPACE_YUV) ?
+		*yuv2rgb_601[0] : *rgb2yuv_601[0];
+
+	return 0;
+}
+
+int __ipu_ic_calc_csc(struct ipu_ic_csc *csc)
+{
+	return calc_csc_coeffs(csc);
+}
+EXPORT_SYMBOL_GPL(__ipu_ic_calc_csc);
+
+int ipu_ic_calc_csc(struct ipu_ic_csc *csc,
+		    enum v4l2_ycbcr_encoding in_enc,
+		    enum v4l2_quantization in_quant,
+		    enum ipu_color_space in_cs,
+		    enum v4l2_ycbcr_encoding out_enc,
+		    enum v4l2_quantization out_quant,
+		    enum ipu_color_space out_cs)
+{
+	ipu_ic_fill_colorspace(&csc->in_cs, in_enc, in_quant, in_cs);
+	ipu_ic_fill_colorspace(&csc->out_cs, out_enc, out_quant, out_cs);
+
+	return __ipu_ic_calc_csc(csc);
+
+}
+EXPORT_SYMBOL_GPL(ipu_ic_calc_csc);
diff --git a/drivers/gpu/ipu-v3/ipu-ic.c b/drivers/gpu/ipu-v3/ipu-ic.c
index 18816ccf600e..d64083c24940 100644
--- a/drivers/gpu/ipu-v3/ipu-ic.c
+++ b/drivers/gpu/ipu-v3/ipu-ic.c
@@ -146,8 +146,10 @@ struct ipu_ic {
 	const struct ic_task_regoffs *reg;
 	const struct ic_task_bitfields *bit;
 
-	enum ipu_color_space in_cs, g_in_cs;
-	enum ipu_color_space out_cs;
+	struct ipu_ic_colorspace in_cs;
+	struct ipu_ic_colorspace g_in_cs;
+	struct ipu_ic_colorspace out_cs;
+
 	bool graphics;
 	bool rotation;
 	bool in_use;
@@ -175,60 +177,11 @@ static inline void ipu_ic_write(struct ipu_ic *ic, u32 value, unsigned offset)
 	writel(value, ic->priv->base + offset);
 }
 
-struct ic_csc_params {
-	s16 coeff[3][3];	/* signed 9-bit integer coefficients */
-	s16 offset[3];		/* signed 11+2-bit fixed point offset */
-	u8 scale:2;		/* scale coefficients * 2^(scale-1) */
-	bool sat:1;		/* saturate to (16, 235(Y) / 240(U, V)) */
-};
-
-/*
- * Y = R *  .299 + G *  .587 + B *  .114;
- * U = R * -.169 + G * -.332 + B *  .500 + 128.;
- * V = R *  .500 + G * -.419 + B * -.0813 + 128.;
- */
-static const struct ic_csc_params ic_csc_rgb2ycbcr = {
-	.coeff = {
-		{ 77, 150, 29 },
-		{ 469, 427, 128 },
-		{ 128, 405, 491 },
-	},
-	.offset = { 0, 512, 512 },
-	.scale = 1,
-};
-
-/* transparent RGB->RGB matrix for graphics combining */
-static const struct ic_csc_params ic_csc_rgb2rgb = {
-	.coeff = {
-		{ 128, 0, 0 },
-		{ 0, 128, 0 },
-		{ 0, 0, 128 },
-	},
-	.scale = 2,
-};
-
-/*
- * R = (1.164 * (Y - 16)) + (1.596 * (Cr - 128));
- * G = (1.164 * (Y - 16)) - (0.392 * (Cb - 128)) - (0.813 * (Cr - 128));
- * B = (1.164 * (Y - 16)) + (2.017 * (Cb - 128);
- */
-static const struct ic_csc_params ic_csc_ycbcr2rgb = {
-	.coeff = {
-		{ 149, 0, 204 },
-		{ 149, 462, 408 },
-		{ 149, 255, 0 },
-	},
-	.offset = { -446, 266, -554 },
-	.scale = 2,
-};
-
 static int init_csc(struct ipu_ic *ic,
-		    enum ipu_color_space inf,
-		    enum ipu_color_space outf,
+		    const struct ipu_ic_csc *csc,
 		    int csc_index)
 {
 	struct ipu_ic_priv *priv = ic->priv;
-	const struct ic_csc_params *params;
 	u32 __iomem *base;
 	const u16 (*c)[3];
 	const u16 *a;
@@ -237,27 +190,16 @@ static int init_csc(struct ipu_ic *ic,
 	base = (u32 __iomem *)
 		(priv->tpmem_base + ic->reg->tpmem_csc[csc_index]);
 
-	if (inf == IPUV3_COLORSPACE_YUV && outf == IPUV3_COLORSPACE_RGB)
-		params = &ic_csc_ycbcr2rgb;
-	else if (inf == IPUV3_COLORSPACE_RGB && outf == IPUV3_COLORSPACE_YUV)
-		params = &ic_csc_rgb2ycbcr;
-	else if (inf == IPUV3_COLORSPACE_RGB && outf == IPUV3_COLORSPACE_RGB)
-		params = &ic_csc_rgb2rgb;
-	else {
-		dev_err(priv->ipu->dev, "Unsupported color space conversion\n");
-		return -EINVAL;
-	}
-
 	/* Cast to unsigned */
-	c = (const u16 (*)[3])params->coeff;
-	a = (const u16 *)params->offset;
+	c = (const u16 (*)[3])csc->params.coeff;
+	a = (const u16 *)csc->params.offset;
 
 	param = ((a[0] & 0x1f) << 27) | ((c[0][0] & 0x1ff) << 18) |
 		((c[1][1] & 0x1ff) << 9) | (c[2][2] & 0x1ff);
 	writel(param, base++);
 
-	param = ((a[0] & 0x1fe0) >> 5) | (params->scale << 8) |
-		(params->sat << 10);
+	param = ((a[0] & 0x1fe0) >> 5) | (csc->params.scale << 8) |
+		(csc->params.sat << 10);
 	writel(param, base++);
 
 	param = ((a[1] & 0x1f) << 27) | ((c[0][1] & 0x1ff) << 18) |
@@ -344,14 +286,14 @@ void ipu_ic_task_enable(struct ipu_ic *ic)
 	if (ic->rotation)
 		ic_conf |= ic->bit->ic_conf_rot_en;
 
-	if (ic->in_cs != ic->out_cs)
+	if (ic->in_cs.cs != ic->out_cs.cs)
 		ic_conf |= ic->bit->ic_conf_csc1_en;
 
 	if (ic->graphics) {
 		ic_conf |= ic->bit->ic_conf_cmb_en;
 		ic_conf |= ic->bit->ic_conf_csc1_en;
 
-		if (ic->g_in_cs != ic->out_cs)
+		if (ic->g_in_cs.cs != ic->out_cs.cs)
 			ic_conf |= ic->bit->ic_conf_csc2_en;
 	}
 
@@ -386,11 +328,12 @@ void ipu_ic_task_disable(struct ipu_ic *ic)
 EXPORT_SYMBOL_GPL(ipu_ic_task_disable);
 
 int ipu_ic_task_graphics_init(struct ipu_ic *ic,
-			      enum ipu_color_space in_g_cs,
+			      const struct ipu_ic_colorspace *g_in_cs,
 			      bool galpha_en, u32 galpha,
 			      bool colorkey_en, u32 colorkey)
 {
 	struct ipu_ic_priv *priv = ic->priv;
+	struct ipu_ic_csc csc2;
 	unsigned long flags;
 	u32 reg, ic_conf;
 	int ret = 0;
@@ -403,21 +346,36 @@ int ipu_ic_task_graphics_init(struct ipu_ic *ic,
 	ic_conf = ipu_ic_read(ic, IC_CONF);
 
 	if (!(ic_conf & ic->bit->ic_conf_csc1_en)) {
-		/* need transparent CSC1 conversion */
-		ret = init_csc(ic, IPUV3_COLORSPACE_RGB,
-			       IPUV3_COLORSPACE_RGB, 0);
+		struct ipu_ic_csc csc1;
+
+		ret = ipu_ic_calc_csc(&csc1,
+				      V4L2_YCBCR_ENC_601,
+				      V4L2_QUANTIZATION_FULL_RANGE,
+				      IPUV3_COLORSPACE_RGB,
+				      V4L2_YCBCR_ENC_601,
+				      V4L2_QUANTIZATION_FULL_RANGE,
+				      IPUV3_COLORSPACE_RGB);
 		if (ret)
 			goto unlock;
-	}
-
-	ic->g_in_cs = in_g_cs;
 
-	if (ic->g_in_cs != ic->out_cs) {
-		ret = init_csc(ic, ic->g_in_cs, ic->out_cs, 1);
+		/* need transparent CSC1 conversion */
+		ret = init_csc(ic, &csc1, 0);
 		if (ret)
 			goto unlock;
 	}
 
+	ic->g_in_cs = *g_in_cs;
+	csc2.in_cs = ic->g_in_cs;
+	csc2.out_cs = ic->out_cs;
+
+	ret = __ipu_ic_calc_csc(&csc2);
+	if (ret)
+		goto unlock;
+
+	ret = init_csc(ic, &csc2, 1);
+	if (ret)
+		goto unlock;
+
 	if (galpha_en) {
 		ic_conf |= IC_CONF_IC_GLB_LOC_A;
 		reg = ipu_ic_read(ic, IC_CMBP_1);
@@ -443,10 +401,9 @@ int ipu_ic_task_graphics_init(struct ipu_ic *ic,
 EXPORT_SYMBOL_GPL(ipu_ic_task_graphics_init);
 
 int ipu_ic_task_init_rsc(struct ipu_ic *ic,
+			 const struct ipu_ic_csc *csc,
 			 int in_width, int in_height,
 			 int out_width, int out_height,
-			 enum ipu_color_space in_cs,
-			 enum ipu_color_space out_cs,
 			 u32 rsc)
 {
 	struct ipu_ic_priv *priv = ic->priv;
@@ -478,28 +435,23 @@ int ipu_ic_task_init_rsc(struct ipu_ic *ic,
 	ipu_ic_write(ic, rsc, ic->reg->rsc);
 
 	/* Setup color space conversion */
-	ic->in_cs = in_cs;
-	ic->out_cs = out_cs;
+	ic->in_cs = csc->in_cs;
+	ic->out_cs = csc->out_cs;
 
-	if (ic->in_cs != ic->out_cs) {
-		ret = init_csc(ic, ic->in_cs, ic->out_cs, 0);
-		if (ret)
-			goto unlock;
-	}
+	ret = init_csc(ic, csc, 0);
 
-unlock:
 	spin_unlock_irqrestore(&priv->lock, flags);
 	return ret;
 }
 
 int ipu_ic_task_init(struct ipu_ic *ic,
+		     const struct ipu_ic_csc *csc,
 		     int in_width, int in_height,
-		     int out_width, int out_height,
-		     enum ipu_color_space in_cs,
-		     enum ipu_color_space out_cs)
+		     int out_width, int out_height)
 {
-	return ipu_ic_task_init_rsc(ic, in_width, in_height, out_width,
-				    out_height, in_cs, out_cs, 0);
+	return ipu_ic_task_init_rsc(ic, csc,
+				    in_width, in_height,
+				    out_width, out_height, 0);
 }
 EXPORT_SYMBOL_GPL(ipu_ic_task_init);
 
diff --git a/drivers/gpu/ipu-v3/ipu-image-convert.c b/drivers/gpu/ipu-v3/ipu-image-convert.c
index 13103ab86050..3520eac0eacc 100644
--- a/drivers/gpu/ipu-v3/ipu-image-convert.c
+++ b/drivers/gpu/ipu-v3/ipu-image-convert.c
@@ -155,6 +155,7 @@ struct ipu_image_convert_ctx {
 	/* Source/destination image data and rotation mode */
 	struct ipu_image_convert_image in;
 	struct ipu_image_convert_image out;
+	struct ipu_ic_csc csc;
 	enum ipu_rotate_mode rot_mode;
 	u32 downsize_coeff_h;
 	u32 downsize_coeff_v;
@@ -1317,7 +1318,6 @@ static int convert_start(struct ipu_image_convert_run *run, unsigned int tile)
 	struct ipu_image_convert_priv *priv = chan->priv;
 	struct ipu_image_convert_image *s_image = &ctx->in;
 	struct ipu_image_convert_image *d_image = &ctx->out;
-	enum ipu_color_space src_cs, dest_cs;
 	unsigned int dst_tile = ctx->out_tile_map[tile];
 	unsigned int dest_width, dest_height;
 	unsigned int col, row;
@@ -1327,9 +1327,6 @@ static int convert_start(struct ipu_image_convert_run *run, unsigned int tile)
 	dev_dbg(priv->ipu->dev, "%s: task %u: starting ctx %p run %p tile %u -> %u\n",
 		__func__, chan->ic_task, ctx, run, tile, dst_tile);
 
-	src_cs = ipu_pixelformat_to_colorspace(s_image->fmt->fourcc);
-	dest_cs = ipu_pixelformat_to_colorspace(d_image->fmt->fourcc);
-
 	if (ipu_rot_mode_is_irt(ctx->rot_mode)) {
 		/* swap width/height for resizer */
 		dest_width = d_image->tile[dst_tile].height;
@@ -1352,13 +1349,12 @@ static int convert_start(struct ipu_image_convert_run *run, unsigned int tile)
 		s_image->tile[tile].height, dest_width, dest_height, rsc);
 
 	/* setup the IC resizer and CSC */
-	ret = ipu_ic_task_init_rsc(chan->ic,
-			       s_image->tile[tile].width,
-			       s_image->tile[tile].height,
-			       dest_width,
-			       dest_height,
-			       src_cs, dest_cs,
-			       rsc);
+	ret = ipu_ic_task_init_rsc(chan->ic, &ctx->csc,
+				   s_image->tile[tile].width,
+				   s_image->tile[tile].height,
+				   dest_width,
+				   dest_height,
+				   rsc);
 	if (ret) {
 		dev_err(priv->ipu->dev, "ipu_ic_task_init failed, %d\n", ret);
 		return ret;
@@ -2058,6 +2054,16 @@ ipu_image_convert_prepare(struct ipu_soc *ipu, enum ipu_ic_task ic_task,
 
 	calc_tile_resize_coefficients(ctx);
 
+	ret = ipu_ic_calc_csc(&ctx->csc,
+			s_image->base.pix.ycbcr_enc,
+			s_image->base.pix.quantization,
+			ipu_pixelformat_to_colorspace(s_image->fmt->fourcc),
+			d_image->base.pix.ycbcr_enc,
+			d_image->base.pix.quantization,
+			ipu_pixelformat_to_colorspace(d_image->fmt->fourcc));
+	if (ret)
+		goto out_free;
+
 	dump_format(ctx, s_image);
 	dump_format(ctx, d_image);
 
diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 64037b0a8387..e8b36a181ccc 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -456,6 +456,7 @@ static int prp_setup_rotation(struct prp_priv *priv)
 	const struct imx_media_pixfmt *outcc, *incc;
 	struct v4l2_mbus_framefmt *infmt;
 	struct v4l2_pix_format *outfmt;
+	struct ipu_ic_csc csc;
 	dma_addr_t phys[2];
 	int ret;
 
@@ -464,6 +465,17 @@ static int prp_setup_rotation(struct prp_priv *priv)
 	incc = priv->cc[PRPENCVF_SINK_PAD];
 	outcc = vdev->cc;
 
+	ret = ipu_ic_calc_csc(&csc,
+			      infmt->ycbcr_enc, infmt->quantization,
+			      incc->cs,
+			      outfmt->ycbcr_enc, outfmt->quantization,
+			      outcc->cs);
+	if (ret) {
+		v4l2_err(&ic_priv->sd, "ipu_ic_calc_csc failed, %d\n",
+			 ret);
+		return ret;
+	}
+
 	ret = imx_media_alloc_dma_buf(priv->md, &priv->rot_buf[0],
 				      outfmt->sizeimage);
 	if (ret) {
@@ -477,10 +489,9 @@ static int prp_setup_rotation(struct prp_priv *priv)
 		goto free_rot0;
 	}
 
-	ret = ipu_ic_task_init(priv->ic,
+	ret = ipu_ic_task_init(priv->ic, &csc,
 			       infmt->width, infmt->height,
-			       outfmt->height, outfmt->width,
-			       incc->cs, outcc->cs);
+			       outfmt->height, outfmt->width);
 	if (ret) {
 		v4l2_err(&ic_priv->sd, "ipu_ic_task_init failed, %d\n", ret);
 		goto free_rot1;
@@ -572,6 +583,7 @@ static int prp_setup_norotation(struct prp_priv *priv)
 	const struct imx_media_pixfmt *outcc, *incc;
 	struct v4l2_mbus_framefmt *infmt;
 	struct v4l2_pix_format *outfmt;
+	struct ipu_ic_csc csc;
 	dma_addr_t phys[2];
 	int ret;
 
@@ -580,10 +592,20 @@ static int prp_setup_norotation(struct prp_priv *priv)
 	incc = priv->cc[PRPENCVF_SINK_PAD];
 	outcc = vdev->cc;
 
-	ret = ipu_ic_task_init(priv->ic,
+	ret = ipu_ic_calc_csc(&csc,
+			      infmt->ycbcr_enc, infmt->quantization,
+			      incc->cs,
+			      outfmt->ycbcr_enc, outfmt->quantization,
+			      outcc->cs);
+	if (ret) {
+		v4l2_err(&ic_priv->sd, "ipu_ic_calc_csc failed, %d\n",
+			 ret);
+		return ret;
+	}
+
+	ret = ipu_ic_task_init(priv->ic, &csc,
 			       infmt->width, infmt->height,
-			       outfmt->width, outfmt->height,
-			       incc->cs, outcc->cs);
+			       outfmt->width, outfmt->height);
 	if (ret) {
 		v4l2_err(&ic_priv->sd, "ipu_ic_task_init failed, %d\n", ret);
 		return ret;
diff --git a/include/video/imx-ipu-v3.h b/include/video/imx-ipu-v3.h
index b03fafa1ff58..06b0b57e996c 100644
--- a/include/video/imx-ipu-v3.h
+++ b/include/video/imx-ipu-v3.h
@@ -387,20 +387,64 @@ enum ipu_ic_task {
 	IC_NUM_TASKS,
 };
 
+/*
+ * The parameters that describe a colorspace according to the
+ * Image Converter:
+ *    - Y'CbCr encoding
+ *    - quantization
+ *    - "colorspace" (RGB or YUV).
+ */
+struct ipu_ic_colorspace {
+	enum v4l2_ycbcr_encoding enc;
+	enum v4l2_quantization quant;
+	enum ipu_color_space cs;
+};
+
+static inline void
+ipu_ic_fill_colorspace(struct ipu_ic_colorspace *ic_cs,
+		       enum v4l2_ycbcr_encoding enc,
+		       enum v4l2_quantization quant,
+		       enum ipu_color_space cs)
+{
+	ic_cs->enc = enc;
+	ic_cs->quant = quant;
+	ic_cs->cs = cs;
+}
+
+struct ipu_ic_csc_params {
+	s16 coeff[3][3];	/* signed 9-bit integer coefficients */
+	s16 offset[3];		/* signed 11+2-bit fixed point offset */
+	u8 scale:2;		/* scale coefficients * 2^(scale-1) */
+	bool sat:1;		/* saturate to (16, 235(Y) / 240(U, V)) */
+};
+
+struct ipu_ic_csc {
+	struct ipu_ic_colorspace in_cs;
+	struct ipu_ic_colorspace out_cs;
+	struct ipu_ic_csc_params params;
+};
+
 struct ipu_ic;
+
+int __ipu_ic_calc_csc(struct ipu_ic_csc *csc);
+int ipu_ic_calc_csc(struct ipu_ic_csc *csc,
+		    enum v4l2_ycbcr_encoding in_enc,
+		    enum v4l2_quantization in_quant,
+		    enum ipu_color_space in_cs,
+		    enum v4l2_ycbcr_encoding out_enc,
+		    enum v4l2_quantization out_quant,
+		    enum ipu_color_space out_cs);
 int ipu_ic_task_init(struct ipu_ic *ic,
+		     const struct ipu_ic_csc *csc,
 		     int in_width, int in_height,
-		     int out_width, int out_height,
-		     enum ipu_color_space in_cs,
-		     enum ipu_color_space out_cs);
+		     int out_width, int out_height);
 int ipu_ic_task_init_rsc(struct ipu_ic *ic,
+			 const struct ipu_ic_csc *csc,
 			 int in_width, int in_height,
 			 int out_width, int out_height,
-			 enum ipu_color_space in_cs,
-			 enum ipu_color_space out_cs,
 			 u32 rsc);
 int ipu_ic_task_graphics_init(struct ipu_ic *ic,
-			      enum ipu_color_space in_g_cs,
+			      const struct ipu_ic_colorspace *g_in_cs,
 			      bool galpha_en, u32 galpha,
 			      bool colorkey_en, u32 colorkey);
 void ipu_ic_task_enable(struct ipu_ic *ic);
-- 
2.17.1

