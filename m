Return-Path: <linux-media+bounces-43820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1C4BC0ACC
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 10:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BB0719A0751
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 08:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0232E0410;
	Tue,  7 Oct 2025 08:33:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15782E040E
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 08:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759826007; cv=none; b=AaouP6UCF08SmP4vtXK+CB5ZfP3vTIznYiHZ7pjJg24h4D4Xvzg26cl6f20ctRwb0gqdqJBzTFeKBFp5oM9Nf9QF2pzw9tDBMr2yui1awN5NXBu1hVJSr34c8DyQsLU77nBcertZZMSdYKo2x7q6MbPcn3Er0Oi1Ihu9+aq8P/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759826007; c=relaxed/simple;
	bh=X5Lt3l+WINFRGiLQX6Vknkj6+gN4g3rjIVOPtgONkFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bw2BunGKyIMdNC1d0+0BINZQWNr7Hsxn055uKyBi99Gqh2AblcEcxkNv9L/ws5Ex+SjQyRUkahztM1m6D4iQDtab6WC7UlPpd9dBabfUOz2qAD5K5Srn++CPez9VsHIijI9LEItVDOP5tdIGCwdOS9xwuALmZbuEyzoivafo09Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1v637w-0002Hb-3K; Tue, 07 Oct 2025 10:32:56 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 07 Oct 2025 10:32:03 +0200
Subject: [PATCH 10/16] media: rockchip: rga: move rga_fmt to rga-hw.h
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251007-spu-rga3-v1-10-36ad85570402@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
In-Reply-To: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Move rga_fmt to rga-hw in preparation of the RGA3 addition, as the struct
contains many RGA2 specific values. They are used to write the correct
register values quickly based on the chosen format. Therefore the
pointer to the rga_fmt struct is kept but changed to an opaque void
pointer outside of the rga-hw.h.

To enumerate and set the correct formats, two helper functions need to
be exposed in the rga_hw struct:

enum_format just get's the vidioc_enum_fmt format and it's return value
is also returned from vidioc_enum_fmt. This is a simple pass-through,
as the implementation is very simple.

try_format is a simple abstraction around the previous rga_find_format.
But unlike rga_find_format, it always returns a valid format.
Therefore the passed fourcc value is also a pointer to update it in case
the passed fourcc value is not supported by the hardware.
Due to the RGA3 supporting different formats on the capture and output
side, an additional parameter is_capture has been added to support
this use-case.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-buf.c |  2 +-
 drivers/media/platform/rockchip/rga/rga-hw.c  | 52 ++++++++++++++++++++-------
 drivers/media/platform/rockchip/rga/rga-hw.h  | 12 +++++++
 drivers/media/platform/rockchip/rga/rga.c     | 45 ++++++++---------------
 drivers/media/platform/rockchip/rga/rga.h     | 16 ++-------
 5 files changed, 71 insertions(+), 56 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index e44fe870fb9e34aa93404b7a60022fe441adf8f9..ad660d3c8cc737b9f3f41770a14ac13973bc7fea 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -158,7 +158,7 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
 	}
 
 	/* Fill the remaining planes */
-	info = v4l2_format_info(f->fmt->fourcc);
+	info = v4l2_format_info(f->pix.pixelformat);
 	for (i = info->mem_planes; i < info->comp_planes; i++)
 		dma_addrs[i] = dma_addrs[0] + get_plane_offset(f, info, i);
 
diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 66b23c4a4cf1488ce42a7ab1901daaaa55b28fe0..d54183d224b3e9c42d5503acf172257f2e736f7b 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -44,14 +44,15 @@ rga_get_corner_addrs(struct rga_frame *frm, struct rga_addrs *addrs,
 	struct rga_addrs *lt, *lb, *rt, *rb;
 	unsigned int x_div = 0,
 		     y_div = 0, y_stride = 0, uv_stride = 0, pixel_width = 0;
+	struct rga_fmt *fmt = frm->fmt;
 
 	lt = &corner_addrs.left_top;
 	lb = &corner_addrs.left_bottom;
 	rt = &corner_addrs.right_top;
 	rb = &corner_addrs.right_bottom;
 
-	x_div = frm->fmt->x_div;
-	y_div = frm->fmt->y_div;
+	x_div = fmt->x_div;
+	y_div = fmt->y_div;
 	y_stride = frm->pix.plane_fmt[0].bytesperline;
 	uv_stride = y_stride / x_div;
 	pixel_width = y_stride / frm->width;
@@ -165,6 +166,8 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 	union rga_dst_vir_info dst_vir_info;
 	union rga_dst_act_info dst_act_info;
 	u32 in_stride, out_stride;
+	struct rga_fmt *in_fmt = ctx->in.fmt;
+	struct rga_fmt *out_fmt = ctx->out.fmt;
 
 	src_h = ctx->in.crop.height;
 	src_w = ctx->in.crop.width;
@@ -180,18 +183,18 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 	dst_vir_info.val = dest[(RGA_DST_VIR_INFO - RGA_MODE_BASE_REG) >> 2];
 	dst_act_info.val = dest[(RGA_DST_ACT_INFO - RGA_MODE_BASE_REG) >> 2];
 
-	src_info.data.format = ctx->in.fmt->hw_format;
-	src_info.data.swap = ctx->in.fmt->color_swap;
-	dst_info.data.format = ctx->out.fmt->hw_format;
-	dst_info.data.swap = ctx->out.fmt->color_swap;
+	src_info.data.format = in_fmt->hw_format;
+	src_info.data.swap = in_fmt->color_swap;
+	dst_info.data.format = out_fmt->hw_format;
+	dst_info.data.swap = out_fmt->color_swap;
 
 	/*
 	 * CSC mode must only be set when the colorspace families differ between
 	 * input and output. It must remain unset (zeroed) if both are the same.
 	 */
 
-	if (RGA_COLOR_FMT_IS_YUV(ctx->in.fmt->hw_format) &&
-	    RGA_COLOR_FMT_IS_RGB(ctx->out.fmt->hw_format)) {
+	if (RGA_COLOR_FMT_IS_YUV(in_fmt->hw_format) &&
+	    RGA_COLOR_FMT_IS_RGB(out_fmt->hw_format)) {
 		switch (ctx->in.colorspace) {
 		case V4L2_COLORSPACE_REC709:
 			src_info.data.csc_mode = RGA_SRC_CSC_MODE_BT709_R0;
@@ -202,8 +205,8 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 		}
 	}
 
-	if (RGA_COLOR_FMT_IS_RGB(ctx->in.fmt->hw_format) &&
-	    RGA_COLOR_FMT_IS_YUV(ctx->out.fmt->hw_format)) {
+	if (RGA_COLOR_FMT_IS_RGB(in_fmt->hw_format) &&
+	    RGA_COLOR_FMT_IS_YUV(out_fmt->hw_format)) {
 		switch (ctx->out.colorspace) {
 		case V4L2_COLORSPACE_REC709:
 			dst_info.data.csc_mode = RGA_SRC_CSC_MODE_BT709_R0;
@@ -621,11 +624,34 @@ static struct rga_fmt formats[] = {
 	},
 };
 
+static void *rga_try_format(u32 *fourcc, bool is_output)
+{
+	unsigned int i;
+
+	if (!fourcc)
+		return &formats[0];
+
+	for (i = 0; i < ARRAY_SIZE(formats); i++) {
+		if (formats[i].fourcc == *fourcc)
+			return &formats[i];
+	}
+
+	*fourcc = formats[0].fourcc;
+	return &formats[0];
+}
+
+static int rga_enum_format(struct v4l2_fmtdesc *f)
+{
+	if (f->index >= ARRAY_SIZE(formats))
+		return -EINVAL;
+
+	f->pixelformat = formats[f->index].fourcc;
+	return 0;
+}
+
 const struct rga_hw rga2_hw = {
 	.card_type = "rga2",
 	.has_internal_iommu = true,
-	.formats = formats,
-	.num_formats = ARRAY_SIZE(formats),
 	.cmdbuf_size = RGA_CMDBUF_SIZE,
 	.min_width = MIN_WIDTH,
 	.max_width = MAX_WIDTH,
@@ -635,4 +661,6 @@ const struct rga_hw rga2_hw = {
 	.start = rga_hw_start,
 	.handle_irq = rga_handle_irq,
 	.get_version = rga_get_version,
+	.try_format = rga_try_format,
+	.enum_format = rga_enum_format,
 };
diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media/platform/rockchip/rga/rga-hw.h
index 1f52fbfad5fb3b8b773f7f03be0603170c5189f6..0ac3a05c0e0cfd8ed64277cd67e5936fbd52d28f 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.h
+++ b/drivers/media/platform/rockchip/rga/rga-hw.h
@@ -6,6 +6,8 @@
 #ifndef __RGA_HW_H__
 #define __RGA_HW_H__
 
+#include <linux/types.h>
+
 #define RGA_CMDBUF_SIZE 0x20
 
 /* Hardware limits */
@@ -428,4 +430,14 @@ union rga_pat_con {
 	} data;
 };
 
+struct rga_fmt {
+	u32 fourcc;
+	int depth;
+	u8 uv_factor;
+	u8 y_div;
+	u8 x_div;
+	u8 color_swap;
+	u8 hw_format;
+};
+
 #endif
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 6e1a4a6dc6309a6d6d9a3aac0fe982e7200c96de..cd4da01645611e5fb51ed94e09b5f1463dad72c5 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -185,17 +185,6 @@ static int rga_setup_ctrls(struct rga_ctx *ctx)
 	return 0;
 }
 
-static struct rga_fmt *rga_fmt_find(struct rockchip_rga *rga, u32 pixelformat)
-{
-	unsigned int i;
-
-	for (i = 0; i < rga->hw->num_formats; i++) {
-		if (rga->hw->formats[i].fourcc == pixelformat)
-			return &rga->hw->formats[i];
-	}
-	return NULL;
-}
-
 struct rga_frame *rga_get_frame(struct rga_ctx *ctx, enum v4l2_buf_type type)
 {
 	if (V4L2_TYPE_IS_OUTPUT(type))
@@ -210,6 +199,7 @@ static int rga_open(struct file *file)
 	struct rockchip_rga *rga = video_drvdata(file);
 	struct rga_ctx *ctx = NULL;
 	int ret = 0;
+	u32 fourcc;
 	struct rga_frame def_frame = {
 		.width = clamp(DEFAULT_WIDTH, rga->hw->min_width, rga->hw->max_width),
 		.height = clamp(DEFAULT_HEIGHT, rga->hw->min_height, rga->hw->max_height),
@@ -218,7 +208,6 @@ static int rga_open(struct file *file)
 		.crop.top = 0,
 		.crop.width = clamp(DEFAULT_WIDTH, rga->hw->min_width, rga->hw->max_width),
 		.crop.height = clamp(DEFAULT_HEIGHT, rga->hw->min_height, rga->hw->max_height),
-		.fmt = &rga->hw->formats[0],
 	};
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
@@ -229,10 +218,14 @@ static int rga_open(struct file *file)
 	ctx->in = def_frame;
 	ctx->out = def_frame;
 
+	fourcc = 0;
+	ctx->in.fmt = rga->hw->try_format(&fourcc, true);
 	v4l2_fill_pixfmt_mp(&ctx->in.pix,
-			    ctx->in.fmt->fourcc, ctx->out.width, ctx->out.height);
+			    fourcc, ctx->out.width, ctx->out.height);
+	fourcc = 0;
+	ctx->out.fmt = rga->hw->try_format(&fourcc, false);
 	v4l2_fill_pixfmt_mp(&ctx->out.pix,
-			    ctx->out.fmt->fourcc, ctx->out.width, ctx->out.height);
+			    fourcc, ctx->out.width, ctx->out.height);
 
 	if (mutex_lock_interruptible(&rga->mutex)) {
 		kfree(ctx);
@@ -302,15 +295,8 @@ vidioc_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
 static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f)
 {
 	struct rockchip_rga *rga = video_drvdata(file);
-	struct rga_fmt *fmt;
 
-	if (f->index >= rga->hw->num_formats)
-		return -EINVAL;
-
-	fmt = &rga->hw->formats[f->index];
-	f->pixelformat = fmt->fourcc;
-
-	return 0;
+	return rga->hw->enum_format(f);
 }
 
 static void align_pixfmt(struct v4l2_pix_format_mplane *pix_fmt)
@@ -346,7 +332,7 @@ static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	if (IS_ERR(frm))
 		return PTR_ERR(frm);
 
-	v4l2_fill_pixfmt_mp(pix_fmt, frm->fmt->fourcc, frm->width, frm->height);
+	v4l2_fill_pixfmt_mp(pix_fmt, frm->pix.pixelformat, frm->width, frm->height);
 	align_pixfmt(pix_fmt);
 
 	pix_fmt->field = V4L2_FIELD_NONE;
@@ -360,18 +346,16 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
 	struct rockchip_rga *rga = video_drvdata(file);
 	const struct rga_hw *hw = rga->hw;
-	struct rga_fmt *fmt;
 
-	fmt = rga_fmt_find(rga, pix_fmt->pixelformat);
-	if (!fmt)
-		fmt = &hw->formats[0];
+	hw->try_format(&pix_fmt->pixelformat,
+		       V4L2_TYPE_IS_OUTPUT(f->type));
 
 	pix_fmt->width = clamp(pix_fmt->width,
 			       hw->min_width, hw->max_width);
 	pix_fmt->height = clamp(pix_fmt->height,
 				hw->min_height, hw->max_height);
 
-	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width, pix_fmt->height);
+	v4l2_fill_pixfmt_mp(pix_fmt, pix_fmt->pixelformat, pix_fmt->width, pix_fmt->height);
 	align_pixfmt(pix_fmt);
 	pix_fmt->field = V4L2_FIELD_NONE;
 
@@ -404,7 +388,8 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 		return PTR_ERR(frm);
 	frm->width = pix_fmt->width;
 	frm->height = pix_fmt->height;
-	frm->fmt = rga_fmt_find(rga, pix_fmt->pixelformat);
+	frm->fmt = rga->hw->try_format(&pix_fmt->pixelformat,
+				       V4L2_TYPE_IS_OUTPUT(f->type));
 	frm->colorspace = pix_fmt->colorspace;
 
 	/* Reset crop settings */
@@ -418,7 +403,7 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	v4l2_dbg(debug, 1, &rga->v4l2_dev,
 		 "[%s] fmt - %p4cc %dx%d (stride %d)\n",
 		  V4L2_TYPE_IS_OUTPUT(f->type) ? "OUTPUT" : "CAPTURE",
-		  &frm->fmt->fourcc, frm->width, frm->height,
+		  &pix_fmt->pixelformat, frm->width, frm->height,
 		  pix_fmt->plane_fmt[0].bytesperline);
 
 	for (i = 0; i < pix_fmt->num_planes; i++) {
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index d5ec873adc280bc2238b227d2f0c649ca345b836..fc4805ba4e8ef7fb311f780a198ba6ba4d3aff17 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -17,16 +17,6 @@
 #define DEFAULT_WIDTH 100
 #define DEFAULT_HEIGHT 100
 
-struct rga_fmt {
-	u32 fourcc;
-	int depth;
-	u8 uv_factor;
-	u8 y_div;
-	u8 x_div;
-	u8 color_swap;
-	u8 hw_format;
-};
-
 struct rga_frame {
 	/* Original dimensions */
 	u32 width;
@@ -37,7 +27,7 @@ struct rga_frame {
 	struct v4l2_rect crop;
 
 	/* Image format */
-	struct rga_fmt *fmt;
+	void *fmt;
 	struct v4l2_pix_format_mplane pix;
 };
 
@@ -149,8 +139,6 @@ static inline void rga_mod(struct rockchip_rga *rga, u32 reg, u32 val, u32 mask)
 struct rga_hw {
 	const char *card_type;
 	bool has_internal_iommu;
-	struct rga_fmt *formats;
-	u32 num_formats;
 	size_t cmdbuf_size;
 	u32 min_width, min_height;
 	u32 max_width, max_height;
@@ -159,6 +147,8 @@ struct rga_hw {
 		      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
 	bool (*handle_irq)(struct rockchip_rga *rga);
 	void (*get_version)(struct rockchip_rga *rga);
+	void *(*try_format)(u32 *fourcc, bool is_output);
+	int (*enum_format)(struct v4l2_fmtdesc *f);
 };
 
 static inline bool rga_has_internal_iommu(const struct rockchip_rga *rga)

-- 
2.51.0


