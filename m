Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F05C0CE699
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 17:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729076AbfJGPIP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 11:08:15 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35886 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728989AbfJGPH4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 11:07:56 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97F7tQ4047060;
        Mon, 7 Oct 2019 10:07:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570460875;
        bh=Na031nRtTpHgNLRhoS3VHTXJIvSFYmmw4PDQkJk43X8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=TlWDpIIAue3+sDf+aMw++I1+JaUVlwKox2+RCIoXEi/egdbsPCSb7qHAx0IHcUYny
         pkqAlE1xV2qU64pg/26G7Pc2kyMFjHgHDum1VpfabCzrmO9ONv5e03H+m+I4f8694V
         tjaOdqFgux71hYFuhWEw8shjdkaF6YSoFpAGmZJA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97F7tXY025704
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Oct 2019 10:07:55 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 10:07:53 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 10:07:55 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97F7aFR055156;
        Mon, 7 Oct 2019 10:07:55 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 21/21] media: ti-vpe: vpe: don't rely on colorspace member for conversion
Date:   Mon, 7 Oct 2019 10:10:09 -0500
Message-ID: <20191007151009.22095-22-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007151009.22095-1-bparrot@ti.com>
References: <20191007151009.22095-1-bparrot@ti.com>
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
 drivers/media/platform/ti-vpe/csc.c | 254 +++++++++++++++++++---------
 drivers/media/platform/ti-vpe/csc.h |   4 +-
 drivers/media/platform/ti-vpe/vpe.c |  25 ++-
 3 files changed, 184 insertions(+), 99 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/csc.c b/drivers/media/platform/ti-vpe/csc.c
index f0c45d187b5f..bd923bee4a31 100644
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
-			0x0400, 0x0000, 0x0629, 0x0400, 0x1F45, 0x1E2B,
-			0x0400, 0x0742, 0x0000, 0x0CEC, 0x0148, 0x0C60,
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
-	[CSC_COEFFS_GRAPHICS_RANGE_Y2R] = {
-		{
-			/* SDTV */
-			0x04A8, 0x1FFE, 0x0662, 0x04A8, 0x1E6F, 0x1CBF,
-			0x04A8, 0x0812, 0x1FFF, 0x0C84, 0x0220, 0x0BAC,
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
-			0x04A8, 0x0000, 0x072C, 0x04A8, 0x1F26, 0x1DDE,
-			0x04A8, 0x0873, 0x0000, 0x0C20, 0x0134, 0x0B7C,
-		},
-	},
-	[CSC_COEFFS_VIDEO_RANGE_R2Y] = {
-		{
-			/* SDTV */
-			0x0132, 0x0259, 0x0075, 0x1F50, 0x1EA5, 0x020B,
-			0x020B, 0x1E4A, 0x1FAB, 0x0000, 0x0200, 0x0200,
-		},
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
@@ -117,46 +137,114 @@ EXPORT_SYMBOL(csc_set_coeff_bypass);
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
+	const struct v4l2_pix_format *pix;
+	const struct v4l2_pix_format_mplane *mp;
+	const struct v4l2_format_info *src_finfo, *dst_finfo;
+	enum v4l2_ycbcr_encoding src_ycbcr_enc, dst_ycbcr_enc;
+	enum v4l2_quantization src_quantization, dst_quantization;
+	u32 src_pixelformat, dst_pixelformat;
+
+	switch (src_fmt->type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+		pix = &src_fmt->fmt.pix;
+		src_pixelformat = pix->pixelformat;
+		src_ycbcr_enc = pix->ycbcr_enc;
+		src_quantization = pix->quantization;
+		break;
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+	default:
+		mp = &src_fmt->fmt.pix_mp;
+		src_pixelformat = mp->pixelformat;
+		src_ycbcr_enc = mp->ycbcr_enc;
+		src_quantization = mp->quantization;
+		break;
+	}
+
+	switch (dst_fmt->type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+		pix = &dst_fmt->fmt.pix;
+		dst_pixelformat = pix->pixelformat;
+		dst_ycbcr_enc = pix->ycbcr_enc;
+		dst_quantization = pix->quantization;
+		break;
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+	default:
+		mp = &dst_fmt->fmt.pix_mp;
+		dst_pixelformat = mp->pixelformat;
+		dst_ycbcr_enc = mp->ycbcr_enc;
+		dst_quantization = mp->quantization;
+		break;
+	}
+
+	src_finfo = v4l2_format_info(src_pixelformat);
+	dst_finfo = v4l2_format_info(dst_pixelformat);
+
+	if (v4l2_is_format_yuv(src_finfo) &&
+	    v4l2_is_format_rgb(dst_finfo)) {
 		/* Y2R */
-		sel = 1;
-		yuv_colorspace = src_colorspace;
-	} else if ((dst_colorspace == V4L2_COLORSPACE_SMPTE170M ||
-			dst_colorspace == V4L2_COLORSPACE_REC709) &&
-			src_colorspace == V4L2_COLORSPACE_SRGB) {
+
+		/*
+		 * These are not the standard default values but are
+		 * set this way for historical compatibility
+		 */
+		if (src_ycbcr_enc == V4L2_YCBCR_ENC_DEFAULT)
+			src_ycbcr_enc = V4L2_YCBCR_ENC_601;
+
+		if (src_quantization == V4L2_QUANTIZATION_DEFAULT)
+			src_quantization = V4L2_QUANTIZATION_FULL_RANGE;
+
+		if (src_ycbcr_enc == V4L2_YCBCR_ENC_601) {
+			if (src_quantization == V4L2_QUANTIZATION_FULL_RANGE)
+				coeff = csc_coeffs.y2r.r601.full.coeff;
+			else
+				coeff = csc_coeffs.y2r.r601.limited.coeff;
+		} else if (src_ycbcr_enc == V4L2_YCBCR_ENC_709) {
+			if (src_quantization == V4L2_QUANTIZATION_FULL_RANGE)
+				coeff = csc_coeffs.y2r.r709.full.coeff;
+			else
+				coeff = csc_coeffs.y2r.r709.limited.coeff;
+		} else {
+			/* Should never reach this, but it keeps gcc happy */
+			coeff = csc_coeffs.y2r.r601.full.coeff;
+		}
+	} else if (v4l2_is_format_rgb(src_finfo) &&
+		   v4l2_is_format_yuv(dst_finfo)) {
 		/* R2Y */
-		sel = 3;
-		yuv_colorspace = dst_colorspace;
+
+		/*
+		 * These are not the standard default values but are
+		 * set this way for historical compatibility
+		 */
+		if (dst_ycbcr_enc == V4L2_YCBCR_ENC_DEFAULT)
+			dst_ycbcr_enc = V4L2_YCBCR_ENC_601;
+
+		if (dst_quantization == V4L2_QUANTIZATION_DEFAULT)
+			dst_quantization = V4L2_QUANTIZATION_FULL_RANGE;
+
+		if (dst_ycbcr_enc == V4L2_YCBCR_ENC_601) {
+			if (dst_quantization == V4L2_QUANTIZATION_FULL_RANGE)
+				coeff = csc_coeffs.r2y.r601.full.coeff;
+			else
+				coeff = csc_coeffs.r2y.r601.limited.coeff;
+		} else if (dst_ycbcr_enc == V4L2_YCBCR_ENC_709) {
+			if (dst_quantization == V4L2_QUANTIZATION_FULL_RANGE)
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
index 7c74b21e0164..1bd0d15ed8e0 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -756,12 +756,12 @@ static void set_src_registers(struct vpe_ctx *ctx)
 static void set_dst_registers(struct vpe_ctx *ctx)
 {
 	struct vpe_mmr_adb *mmr_adb = ctx->mmr_adb.addr;
-	struct v4l2_pix_format_mplane *pix;
 	struct vpe_fmt *fmt = ctx->q_data[Q_DATA_DST].fmt;
+	const struct v4l2_format_info *finfo;
 	u32 val = 0;
 
-	pix = &ctx->q_data[Q_DATA_DST].format.fmt.pix_mp;
-	if (pix->colorspace == V4L2_COLORSPACE_SRGB) {
+	finfo = v4l2_format_info(fmt->fourcc);
+	if (v4l2_is_format_rgb(finfo)) {
 		val |= VPE_RGB_OUT_SELECT;
 		vpdma_set_bg_color(ctx->dev->vpdma,
 			(struct vpdma_data_format *)fmt->vpdma_fmt[0], 0xff);
@@ -865,14 +865,12 @@ static int set_srcdst_params(struct vpe_ctx *ctx)
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
@@ -909,7 +907,7 @@ static int set_srcdst_params(struct vpe_ctx *ctx)
 	set_dei_regs(ctx);
 
 	csc_set_coeff(ctx->dev->csc, &mmr_adb->csc_regs[0],
-		      spix->colorspace, dpix->colorspace);
+		      &s_q_data->format, &d_q_data->format);
 
 	sc_set_hs_coeffs(ctx->dev->sc, ctx->sc_coeff_h.addr, src_w, dst_w);
 	sc_set_vs_coeffs(ctx->dev->sc, ctx->sc_coeff_v.addr, src_h, dst_h);
@@ -1215,9 +1213,9 @@ static void device_run(void *priv)
 	struct sc_data *sc = ctx->dev->sc;
 	struct vpe_q_data *d_q_data = &ctx->q_data[Q_DATA_DST];
 	struct vpe_q_data *s_q_data = &ctx->q_data[Q_DATA_SRC];
-	struct v4l2_pix_format_mplane *dpix;
+	const struct v4l2_format_info *d_finfo;
 
-	dpix = &d_q_data->format.fmt.pix_mp;
+	d_finfo = v4l2_format_info(d_q_data->fmt->fourcc);
 
 	if (ctx->deinterlacing && s_q_data->flags & Q_IS_SEQ_XX &&
 	    ctx->sequence % 2 == 0) {
@@ -1290,7 +1288,7 @@ static void device_run(void *priv)
 	if (ctx->deinterlacing)
 		add_out_dtd(ctx, VPE_PORT_MV_OUT);
 
-	if (dpix->colorspace == V4L2_COLORSPACE_SRGB) {
+	if (v4l2_is_format_rgb(d_finfo)) {
 		add_out_dtd(ctx, VPE_PORT_RGB_OUT);
 	} else {
 		add_out_dtd(ctx, VPE_PORT_LUMA_OUT);
@@ -1332,7 +1330,7 @@ static void device_run(void *priv)
 	}
 
 	/* sync on channel control descriptors for output ports */
-	if (dpix->colorspace == V4L2_COLORSPACE_SRGB) {
+	if (v4l2_is_format_rgb(d_finfo)) {
 		vpdma_add_sync_on_channel_ctd(&ctx->desc_list,
 			VPE_CHAN_RGB_OUT);
 	} else {
@@ -1603,6 +1601,7 @@ static int __vpe_try_fmt(struct vpe_ctx *ctx, struct v4l2_format *f,
 	unsigned int w_align;
 	int i, depth, depth_bytes, height;
 	unsigned int stride = 0;
+	const struct v4l2_format_info *finfo;
 
 	if (!fmt || !(fmt->types & type)) {
 		vpe_dbg(ctx->dev, "Fourcc format (0x%08x) invalid.\n",
@@ -1662,6 +1661,7 @@ static int __vpe_try_fmt(struct vpe_ctx *ctx, struct v4l2_format *f,
 		pix->num_planes = 1;
 
 	pix->pixelformat = fmt->fourcc;
+	finfo = v4l2_format_info(fmt->fourcc);
 
 	/*
 	 * For the actual image parameters, we need to consider the field
@@ -1673,10 +1673,7 @@ static int __vpe_try_fmt(struct vpe_ctx *ctx, struct v4l2_format *f,
 		height = pix->height;
 
 	if (!pix->colorspace) {
-		if (fmt->fourcc == V4L2_PIX_FMT_RGB24 ||
-				fmt->fourcc == V4L2_PIX_FMT_BGR24 ||
-				fmt->fourcc == V4L2_PIX_FMT_RGB32 ||
-				fmt->fourcc == V4L2_PIX_FMT_BGR32) {
+		if (v4l2_is_format_rgb(finfo)) {
 			pix->colorspace = V4L2_COLORSPACE_SRGB;
 		} else {
 			if (height > 1280)	/* HD */
-- 
2.17.1

