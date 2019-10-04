Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D29DCC08A
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 18:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731388AbfJDQ2N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 12:28:13 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60642 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731376AbfJDQ2M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 12:28:12 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x94GSBvT081615;
        Fri, 4 Oct 2019 11:28:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570206491;
        bh=b5cigKhoIzSoUXIJLSanGGIh+FR/Ks6qV++YdaAFNZs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ILnca9qIqtluqiM+VD0nLNvCnWZigjQxDEMtrHjUyJWBYVW2S1WJy7xMY44BwWDbc
         vMFPHGIwTiN3mp4dCUX4nhSfjGKG/BtcLfEKvjILjUvD26V7kfsz9V5LnRu6eI86lh
         Ldk6JRhi30xc5EtV2Zwk4bTDagrClSsDSo7WuS2w=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x94GSBpX056482
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 4 Oct 2019 11:28:11 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 11:28:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 11:28:11 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94GRgAN028904;
        Fri, 4 Oct 2019 11:28:11 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 21/21] media: ti-vpe: vpe: don't rely on colorspace member for conversion
Date:   Fri, 4 Oct 2019 11:29:52 -0500
Message-ID: <20191004162952.4963-22-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004162952.4963-1-bparrot@ti.com>
References: <20191004162952.4963-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Up to now VPE was relying on the colorspace value of struct v4l2_format
as an indication to perform color space conversion from YUV to RGB or
not.

Instead we should used the source/destination fourcc codes as a more
reliable indication to perform color space conversion or not.

To do so, we rework the csc module to use "struct v4l2_format *" as
parameters, and reorganize the coefficients tables in a more logical
way.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/csc.c | 220 +++++++++++++++++-----------
 drivers/media/platform/ti-vpe/csc.h |   4 +-
 drivers/media/platform/ti-vpe/vpe.c |  17 +--
 3 files changed, 144 insertions(+), 97 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/csc.c b/drivers/media/platform/ti-vpe/csc.c
index f0c45d187b5f..e2b5bee5e206 100644
--- a/drivers/media/platform/ti-vpe/csc.c
+++ b/drivers/media/platform/ti-vpe/csc.c
@@ -15,76 +15,96 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
+#include <media/v4l2-common.h>
 
 #include "csc.h"
 
 /*
- * 16 coefficients in the order:
+ * 12 coefficients in the order:
  * a0, b0, c0, a1, b1, c1, a2, b2, c2, d0, d1, d2
- * (we may need to pass non-default values from user space later on, we might
- * need to make the coefficient struct more easy to populate)
  */
-struct colorspace_coeffs {
-	u16	sd[12];
-	u16	hd[12];
+struct quantization {
+	u16	coeff[12];
 };
 
-/* VIDEO_RANGE: limited range, GRAPHICS_RANGE: full range */
-#define	CSC_COEFFS_VIDEO_RANGE_Y2R	0
-#define	CSC_COEFFS_GRAPHICS_RANGE_Y2R	1
-#define	CSC_COEFFS_VIDEO_RANGE_R2Y	2
-#define	CSC_COEFFS_GRAPHICS_RANGE_R2Y	3
+struct colorspace {
+	struct quantization limited;
+	struct quantization full;
+};
+
+struct encoding_direction {
+	struct colorspace r601;
+	struct colorspace r709;
+};
+
+struct csc_coeffs {
+	struct encoding_direction y2r;
+	struct encoding_direction r2y;
+};
 
 /* default colorspace coefficients */
-static struct colorspace_coeffs colorspace_coeffs[4] = {
-	[CSC_COEFFS_VIDEO_RANGE_Y2R] = {
-		{
-			/* SDTV */
-			0x0400, 0x0000, 0x057D, 0x0400, 0x1EA7, 0x1D35,
-			0x0400, 0x06EF, 0x1FFE, 0x0D40, 0x0210, 0x0C88,
-		},
-		{
-			/* HDTV */
-			0x0400, 0x0000, 0x0629, 0x0400, 0x1F45, 0x1E2B,
-			0x0400, 0x0742, 0x0000, 0x0CEC, 0x0148, 0x0C60,
-		},
-	},
-	[CSC_COEFFS_GRAPHICS_RANGE_Y2R] = {
-		{
-			/* SDTV */
-			0x04A8, 0x1FFE, 0x0662, 0x04A8, 0x1E6F, 0x1CBF,
-			0x04A8, 0x0812, 0x1FFF, 0x0C84, 0x0220, 0x0BAC,
+static struct csc_coeffs csc_coeffs = {
+	.y2r = {
+		.r601 = {
+			.limited = {
+				{	/* SDTV */
+				0x0400, 0x0000, 0x057D, 0x0400, 0x1EA7, 0x1D35,
+				0x0400, 0x06EF, 0x1FFE, 0x0D40, 0x0210, 0x0C88,
+				}
+			},
+			.full = {
+				{	/* SDTV */
+				0x04A8, 0x1FFE, 0x0662, 0x04A8, 0x1E6F, 0x1CBF,
+				0x04A8, 0x0812, 0x1FFF, 0x0C84, 0x0220, 0x0BAC,
+				}
+			},
 		},
-		{
-			/* HDTV */
-			0x04A8, 0x0000, 0x072C, 0x04A8, 0x1F26, 0x1DDE,
-			0x04A8, 0x0873, 0x0000, 0x0C20, 0x0134, 0x0B7C,
+		.r709 = {
+			.limited = {
+				{	/* HDTV */
+				0x0400, 0x0000, 0x0629, 0x0400, 0x1F45, 0x1E2B,
+				0x0400, 0x0742, 0x0000, 0x0CEC, 0x0148, 0x0C60,
+				}
+			},
+			.full = {
+				{	/* HDTV */
+				0x04A8, 0x0000, 0x072C, 0x04A8, 0x1F26, 0x1DDE,
+				0x04A8, 0x0873, 0x0000, 0x0C20, 0x0134, 0x0B7C,
+				}
+			},
 		},
 	},
-	[CSC_COEFFS_VIDEO_RANGE_R2Y] = {
-		{
-			/* SDTV */
-			0x0132, 0x0259, 0x0075, 0x1F50, 0x1EA5, 0x020B,
-			0x020B, 0x1E4A, 0x1FAB, 0x0000, 0x0200, 0x0200,
+	.r2y = {
+		.r601 = {
+			.limited = {
+				{	/* SDTV */
+				0x0132, 0x0259, 0x0075, 0x1F50, 0x1EA5, 0x020B,
+				0x020B, 0x1E4A, 0x1FAB, 0x0000, 0x0200, 0x0200,
+				}
+			},
+			.full = {
+				{	/* SDTV */
+				0x0107, 0x0204, 0x0064, 0x1F68, 0x1ED6, 0x01C2,
+				0x01C2, 0x1E87, 0x1FB7, 0x0040, 0x0200, 0x0200,
+				}
+			},
 		},
-		{
-			/* HDTV */
-			0x00DA, 0x02DC, 0x004A, 0x1F88, 0x1E6C, 0x020C,
-			0x020C, 0x1E24, 0x1FD0, 0x0000, 0x0200, 0x0200,
-		},
-	},
-	[CSC_COEFFS_GRAPHICS_RANGE_R2Y] = {
-		{
-			/* SDTV */
-			0x0107, 0x0204, 0x0064, 0x1F68, 0x1ED6, 0x01C2,
-			0x01C2, 0x1E87, 0x1FB7, 0x0040, 0x0200, 0x0200,
-		},
-		{
-			/* HDTV */
-			0x00bb, 0x0275, 0x003f, 0x1f99, 0x1ea5, 0x01c2,
-			0x01c2, 0x1e67, 0x1fd7, 0x0040, 0x0200, 0x0200,
+		.r709 = {
+			.limited = {
+				{	/* HDTV */
+				0x00DA, 0x02DC, 0x004A, 0x1F88, 0x1E6C, 0x020C,
+				0x020C, 0x1E24, 0x1FD0, 0x0000, 0x0200, 0x0200,
+				}
+			},
+			.full = {
+				{	/* HDTV */
+				0x00bb, 0x0275, 0x003f, 0x1f99, 0x1ea5, 0x01c2,
+				0x01c2, 0x1e67, 0x1fd7, 0x0040, 0x0200, 0x0200,
+				}
+			},
 		},
 	},
+
 };
 
 void csc_dump_regs(struct csc_data *csc)
@@ -117,46 +137,80 @@ EXPORT_SYMBOL(csc_set_coeff_bypass);
  * set the color space converter coefficient shadow register values
  */
 void csc_set_coeff(struct csc_data *csc, u32 *csc_reg0,
-		enum v4l2_colorspace src_colorspace,
-		enum v4l2_colorspace dst_colorspace)
+		   struct v4l2_format *src_fmt, struct v4l2_format *dst_fmt)
 {
 	u32 *csc_reg5 = csc_reg0 + 5;
 	u32 *shadow_csc = csc_reg0;
-	struct colorspace_coeffs *sd_hd_coeffs;
 	u16 *coeff, *end_coeff;
-	enum v4l2_colorspace yuv_colorspace;
-	int sel = 0;
-
-	/*
-	 * support only graphics data range(full range) for now, a control ioctl
-	 * would be nice here
-	 */
-	/* Y2R */
-	if (dst_colorspace == V4L2_COLORSPACE_SRGB &&
-			(src_colorspace == V4L2_COLORSPACE_SMPTE170M ||
-			src_colorspace == V4L2_COLORSPACE_REC709)) {
+	enum v4l2_ycbcr_encoding ycbcr_enc;
+	enum v4l2_quantization quantization;
+
+	if (v4l2_is_format_yuv(src_fmt->fmt.pix_mp.pixelformat) &&
+	    v4l2_is_format_rgb(dst_fmt->fmt.pix_mp.pixelformat)) {
+
 		/* Y2R */
-		sel = 1;
-		yuv_colorspace = src_colorspace;
-	} else if ((dst_colorspace == V4L2_COLORSPACE_SMPTE170M ||
-			dst_colorspace == V4L2_COLORSPACE_REC709) &&
-			src_colorspace == V4L2_COLORSPACE_SRGB) {
+		ycbcr_enc = src_fmt->fmt.pix_mp.ycbcr_enc;
+		quantization = src_fmt->fmt.pix_mp.quantization;
+
+		/*
+		 * These are not the standard default values but are
+		 * set this way for historical compatibility
+		 */
+		if (ycbcr_enc == V4L2_YCBCR_ENC_DEFAULT)
+			ycbcr_enc = V4L2_YCBCR_ENC_601;
+
+		if (quantization == V4L2_QUANTIZATION_DEFAULT)
+			quantization = V4L2_QUANTIZATION_FULL_RANGE;
+
+		if (ycbcr_enc == V4L2_YCBCR_ENC_601) {
+			if (quantization == V4L2_QUANTIZATION_FULL_RANGE)
+				coeff = csc_coeffs.y2r.r601.full.coeff;
+			else
+				coeff = csc_coeffs.y2r.r601.limited.coeff;
+		} else if (ycbcr_enc == V4L2_YCBCR_ENC_709) {
+			if (quantization == V4L2_QUANTIZATION_FULL_RANGE)
+				coeff = csc_coeffs.y2r.r709.full.coeff;
+			else
+				coeff = csc_coeffs.y2r.r709.limited.coeff;
+		} else {
+			/* Should never reach this, but it keeps gcc happy */
+			coeff = csc_coeffs.y2r.r601.full.coeff;
+		}
+	} else if (v4l2_is_format_rgb(src_fmt->fmt.pix_mp.pixelformat) &&
+		   v4l2_is_format_yuv(dst_fmt->fmt.pix_mp.pixelformat)) {
 		/* R2Y */
-		sel = 3;
-		yuv_colorspace = dst_colorspace;
+		ycbcr_enc = dst_fmt->fmt.pix_mp.ycbcr_enc;
+		quantization = dst_fmt->fmt.pix_mp.quantization;
+
+		/*
+		 * These are not the standard default values but are
+		 * set this way for historical compatibility
+		 */
+		if (ycbcr_enc == V4L2_YCBCR_ENC_DEFAULT)
+			ycbcr_enc = V4L2_YCBCR_ENC_601;
+
+		if (quantization == V4L2_QUANTIZATION_DEFAULT)
+			quantization = V4L2_QUANTIZATION_FULL_RANGE;
+
+		if (ycbcr_enc == V4L2_YCBCR_ENC_601) {
+			if (quantization == V4L2_QUANTIZATION_FULL_RANGE)
+				coeff = csc_coeffs.r2y.r601.full.coeff;
+			else
+				coeff = csc_coeffs.r2y.r601.limited.coeff;
+		} else if (ycbcr_enc == V4L2_YCBCR_ENC_709) {
+			if (quantization == V4L2_QUANTIZATION_FULL_RANGE)
+				coeff = csc_coeffs.r2y.r709.full.coeff;
+			else
+				coeff = csc_coeffs.r2y.r709.limited.coeff;
+		} else {
+			/* Should never reach this, but it keeps gcc happy */
+			coeff = csc_coeffs.y2r.r601.full.coeff;
+		}
 	} else {
 		*csc_reg5 |= CSC_BYPASS;
 		return;
 	}
 
-	sd_hd_coeffs = &colorspace_coeffs[sel];
-
-	/* select between SD or HD coefficients */
-	if (yuv_colorspace == V4L2_COLORSPACE_SMPTE170M)
-		coeff = sd_hd_coeffs->sd;
-	else
-		coeff = sd_hd_coeffs->hd;
-
 	end_coeff = coeff + 12;
 
 	for (; coeff < end_coeff; coeff += 2)
diff --git a/drivers/media/platform/ti-vpe/csc.h b/drivers/media/platform/ti-vpe/csc.h
index de9a58af2ca8..af2e86bccf57 100644
--- a/drivers/media/platform/ti-vpe/csc.h
+++ b/drivers/media/platform/ti-vpe/csc.h
@@ -58,8 +58,8 @@ struct csc_data {
 void csc_dump_regs(struct csc_data *csc);
 void csc_set_coeff_bypass(struct csc_data *csc, u32 *csc_reg5);
 void csc_set_coeff(struct csc_data *csc, u32 *csc_reg0,
-		enum v4l2_colorspace src_colorspace,
-		enum v4l2_colorspace dst_colorspace);
+		   struct v4l2_format *src_fmt, struct v4l2_format *dst_fmt);
+
 struct csc_data *csc_create(struct platform_device *pdev, const char *res_name);
 
 #endif
diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index 19b027c5478a..003db923c8a4 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -756,12 +756,10 @@ static void set_src_registers(struct vpe_ctx *ctx)
 static void set_dst_registers(struct vpe_ctx *ctx)
 {
 	struct vpe_mmr_adb *mmr_adb = ctx->mmr_adb.addr;
-	enum v4l2_colorspace clrspc =
-			ctx->q_data[Q_DATA_DST].format.fmt.pix_mp.colorspace;
 	struct vpe_fmt *fmt = ctx->q_data[Q_DATA_DST].fmt;
 	u32 val = 0;
 
-	if (clrspc == V4L2_COLORSPACE_SRGB) {
+	if (v4l2_is_format_rgb(fmt->fourcc)) {
 		val |= VPE_RGB_OUT_SELECT;
 		vpdma_set_bg_color(ctx->dev->vpdma,
 			(struct vpdma_data_format *)fmt->vpdma_fmt[0], 0xff);
@@ -865,14 +863,12 @@ static int set_srcdst_params(struct vpe_ctx *ctx)
 	unsigned int dst_w = d_q_data->c_rect.width;
 	unsigned int dst_h = d_q_data->c_rect.height;
 	struct v4l2_pix_format_mplane *spix;
-	struct v4l2_pix_format_mplane *dpix;
 	size_t mv_buf_size;
 	int ret;
 
 	ctx->sequence = 0;
 	ctx->field = V4L2_FIELD_TOP;
 	spix = &s_q_data->format.fmt.pix_mp;
-	dpix = &d_q_data->format.fmt.pix_mp;
 
 	if ((s_q_data->flags & Q_IS_INTERLACED) &&
 			!(d_q_data->flags & Q_IS_INTERLACED)) {
@@ -909,7 +905,7 @@ static int set_srcdst_params(struct vpe_ctx *ctx)
 	set_dei_regs(ctx);
 
 	csc_set_coeff(ctx->dev->csc, &mmr_adb->csc_regs[0],
-		      spix->colorspace, dpix->colorspace);
+		      &s_q_data->format, &d_q_data->format);
 
 	sc_set_hs_coeffs(ctx->dev->sc, ctx->sc_coeff_h.addr, src_w, dst_w);
 	sc_set_vs_coeffs(ctx->dev->sc, ctx->sc_coeff_v.addr, src_h, dst_h);
@@ -1287,7 +1283,7 @@ static void device_run(void *priv)
 	if (ctx->deinterlacing)
 		add_out_dtd(ctx, VPE_PORT_MV_OUT);
 
-	if (d_q_data->format.fmt.pix_mp.colorspace == V4L2_COLORSPACE_SRGB) {
+	if (v4l2_is_format_rgb(d_q_data->fmt->fourcc)) {
 		add_out_dtd(ctx, VPE_PORT_RGB_OUT);
 	} else {
 		add_out_dtd(ctx, VPE_PORT_LUMA_OUT);
@@ -1329,7 +1325,7 @@ static void device_run(void *priv)
 	}
 
 	/* sync on channel control descriptors for output ports */
-	if (d_q_data->format.fmt.pix_mp.colorspace == V4L2_COLORSPACE_SRGB) {
+	if (v4l2_is_format_rgb(d_q_data->fmt->fourcc)) {
 		vpdma_add_sync_on_channel_ctd(&ctx->desc_list,
 			VPE_CHAN_RGB_OUT);
 	} else {
@@ -1668,10 +1664,7 @@ static int __vpe_try_fmt(struct vpe_ctx *ctx, struct v4l2_format *f,
 		height = pix->height;
 
 	if (!pix->colorspace) {
-		if (fmt->fourcc == V4L2_PIX_FMT_RGB24 ||
-				fmt->fourcc == V4L2_PIX_FMT_BGR24 ||
-				fmt->fourcc == V4L2_PIX_FMT_RGB32 ||
-				fmt->fourcc == V4L2_PIX_FMT_BGR32) {
+		if (v4l2_is_format_rgb(fmt->fourcc)) {
 			pix->colorspace = V4L2_COLORSPACE_SRGB;
 		} else {
 			if (height > 1280)	/* HD */
-- 
2.17.1

