Return-Path: <linux-media+bounces-51687-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iG9DFWjQeGmNtQEAu9opvQ
	(envelope-from <linux-media+bounces-51687-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 15:49:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC52495FFE
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 15:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7443A306E9A5
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 14:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4234936604A;
	Tue, 27 Jan 2026 14:41:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2754F366066
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 14:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524859; cv=none; b=sKNF++di4ZFEOEOQDA6N8z9edqOSnokC+MTBOSVEC7868S4UmRBIWaAGTS+iBKpsohrbVcMI8CcobAnkAzgym1HyYudbF7RIt7EDKtu0VoGoJH+AuqjJOL4K7Tzkv9MuDc0m5ToJZZ6EfYbpDaHdhzrOAdsWMF54Fcr6nNSOcYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524859; c=relaxed/simple;
	bh=jVCIMtQ5Oc39w6WM/yRgF86Yn2ql20o6yBm4CyY0j4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RfalvmFd9uitVfmpR7fjB2Cl0mgi0jzCXUEtLWzAfywCRMKiPJzPLvMfPEMz0jXW2AN4AUlyaOFqCd6FTxiHKVGOSabIcdc5He8mYbUqVUVtCJFgwiS8xH4YXei3SH83JmPpz6PbvfkWJaP9FUT4mpNvfPyLsMY20vY3eyxiImQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vkkFN-0007YT-4l; Tue, 27 Jan 2026 15:40:49 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 27 Jan 2026 15:39:32 +0100
Subject: [PATCH v3 23/27] media: rockchip: rga: move rga_fmt to rga-hw.h
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260127-spu-rga3-v3-23-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
In-Reply-To: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51687-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,pengutronix.de:mid,pengutronix.de:email,collabora.com:email]
X-Rspamd-Queue-Id: EC52495FFE
X-Rspamd-Action: no action

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

adjust_and_map_format is a simple abstraction around the previous
rga_find_format. But unlike rga_find_format, it always returns a valid
format. Therefore the passed format value is also a pointer to update
it in case the values are not supported by the hardware.
Due to the RGA3 supporting different formats on the capture and output
side, an additional parameter is_capture has been added to support
this use-case. The additional ctx parameter is also added to allow the
RGA3 to limit the colorimetry only if an RGB<->YCrCb transformation
happens.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-buf.c |  2 +-
 drivers/media/platform/rockchip/rga/rga-hw.c  | 49 +++++++++++++++++++++------
 drivers/media/platform/rockchip/rga/rga-hw.h  |  8 +++++
 drivers/media/platform/rockchip/rga/rga.c     | 39 +++++++--------------
 drivers/media/platform/rockchip/rga/rga.h     | 14 +++-----
 5 files changed, 66 insertions(+), 46 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index c0cc885ba58a8..8632b18cd3fc6 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -162,7 +162,7 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
 	}
 
 	/* Fill the remaining planes */
-	info = v4l2_format_info(f->fmt->fourcc);
+	info = v4l2_format_info(f->pix.pixelformat);
 	for (i = info->mem_planes; i < info->comp_planes; i++)
 		dma_addrs[i] = dma_addrs[0] + get_plane_offset(f, info, i);
 
diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 5d993cf69963d..e76d1994b8684 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -171,6 +171,8 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 	union rga_dst_vir_info dst_vir_info;
 	union rga_dst_act_info dst_act_info;
 	u32 in_stride, out_stride;
+	struct rga_fmt *in_fmt = ctx->in.fmt;
+	struct rga_fmt *out_fmt = ctx->out.fmt;
 
 	src_h = ctx->in.crop.height;
 	src_w = ctx->in.crop.width;
@@ -186,18 +188,18 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
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
 		switch (ctx->in.pix.colorspace) {
 		case V4L2_COLORSPACE_REC709:
 			src_info.data.csc_mode = RGA_SRC_CSC_MODE_BT709_R0;
@@ -208,8 +210,8 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 		}
 	}
 
-	if (RGA_COLOR_FMT_IS_RGB(ctx->in.fmt->hw_format) &&
-	    RGA_COLOR_FMT_IS_YUV(ctx->out.fmt->hw_format)) {
+	if (RGA_COLOR_FMT_IS_RGB(in_fmt->hw_format) &&
+	    RGA_COLOR_FMT_IS_YUV(out_fmt->hw_format)) {
 		switch (ctx->out.pix.colorspace) {
 		case V4L2_COLORSPACE_REC709:
 			dst_info.data.csc_mode = RGA_SRC_CSC_MODE_BT709_R0;
@@ -563,11 +565,36 @@ static struct rga_fmt formats[] = {
 	},
 };
 
+static void *rga_adjust_and_map_format(struct rga_ctx *ctx,
+				       struct v4l2_pix_format_mplane *format,
+				       bool is_output)
+{
+	unsigned int i;
+
+	if (!format)
+		return &formats[0];
+
+	for (i = 0; i < ARRAY_SIZE(formats); i++) {
+		if (formats[i].fourcc == format->pixelformat)
+			return &formats[i];
+	}
+
+	format->pixelformat = formats[0].fourcc;
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
@@ -580,4 +607,6 @@ const struct rga_hw rga2_hw = {
 	.start = rga_hw_start,
 	.handle_irq = rga_handle_irq,
 	.get_version = rga_get_version,
+	.adjust_and_map_format = rga_adjust_and_map_format,
+	.enum_format = rga_enum_format,
 };
diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media/platform/rockchip/rga/rga-hw.h
index fffcab0131225..039a3e868733e 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.h
+++ b/drivers/media/platform/rockchip/rga/rga-hw.h
@@ -6,6 +6,8 @@
 #ifndef __RGA_HW_H__
 #define __RGA_HW_H__
 
+#include <linux/types.h>
+
 #define RGA_CMDBUF_SIZE 0x20
 
 /* Hardware limits */
@@ -431,4 +433,10 @@ union rga_pat_con {
 	} data;
 };
 
+struct rga_fmt {
+	u32 fourcc;
+	u8 color_swap;
+	u8 hw_format;
+};
+
 #endif
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 30d09ec77afca..c1371ad0b1ea1 100644
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
@@ -217,7 +206,6 @@ static int rga_open(struct file *file)
 		.crop.top = 0,
 		.crop.width = def_width,
 		.crop.height = def_height,
-		.fmt = &rga->hw->formats[0],
 	};
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
@@ -238,9 +226,12 @@ static int rga_open(struct file *file)
 	ctx->in = def_frame;
 	ctx->out = def_frame;
 
-	v4l2_fill_pixfmt_mp_aligned(&ctx->in.pix, ctx->in.fmt->fourcc,
+	ctx->in.fmt = rga->hw->adjust_and_map_format(ctx, &ctx->in.pix, true);
+	v4l2_fill_pixfmt_mp_aligned(&ctx->in.pix, ctx->in.pix.pixelformat,
 				    def_width, def_height, rga->hw->stride_alignment);
-	v4l2_fill_pixfmt_mp_aligned(&ctx->out.pix, ctx->out.fmt->fourcc,
+	ctx->out.fmt =
+		rga->hw->adjust_and_map_format(ctx, &ctx->out.pix, false);
+	v4l2_fill_pixfmt_mp_aligned(&ctx->out.pix, ctx->out.pix.pixelformat,
 				    def_width, def_height, rga->hw->stride_alignment);
 
 	if (mutex_lock_interruptible(&rga->mutex)) {
@@ -322,13 +313,11 @@ vidioc_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
 static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f)
 {
 	struct rockchip_rga *rga = video_drvdata(file);
-	struct rga_fmt *fmt;
-
-	if (f->index >= rga->hw->num_formats)
-		return -EINVAL;
+	int ret;
 
-	fmt = &rga->hw->formats[f->index];
-	f->pixelformat = fmt->fourcc;
+	ret = rga->hw->enum_format(f);
+	if (ret != 0)
+		return ret;
 
 	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
 	    f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
@@ -363,7 +352,6 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
 	struct rga_ctx *ctx = file_to_rga_ctx(file);
 	const struct rga_hw *hw = ctx->rga->hw;
-	struct rga_fmt *fmt;
 	struct v4l2_frmsize_stepwise frmsize = {
 		.min_width = hw->min_width,
 		.max_width = hw->max_width,
@@ -394,9 +382,7 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 		pix_fmt->xfer_func = frm->pix.xfer_func;
 	}
 
-	fmt = rga_fmt_find(ctx->rga, pix_fmt->pixelformat);
-	if (!fmt)
-		fmt = &hw->formats[0];
+	hw->adjust_and_map_format(ctx, pix_fmt, V4L2_TYPE_IS_OUTPUT(f->type));
 
 	v4l2_apply_frmsize_constraints(&pix_fmt->width, &pix_fmt->height, &frmsize);
 	v4l2_fill_pixfmt_mp_aligned(pix_fmt, pix_fmt->pixelformat,
@@ -456,7 +442,8 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	frm = rga_get_frame(ctx, f->type);
 	if (IS_ERR(frm))
 		return PTR_ERR(frm);
-	frm->fmt = rga_fmt_find(rga, pix_fmt->pixelformat);
+	frm->fmt = rga->hw->adjust_and_map_format(ctx, pix_fmt,
+						  V4L2_TYPE_IS_OUTPUT(f->type));
 
 	/*
 	 * Copy colorimetry from output to capture as required by the
@@ -480,7 +467,7 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	v4l2_dbg(debug, 1, &rga->v4l2_dev,
 		 "[%s] fmt - %p4cc %dx%d (stride %d)\n",
 		  V4L2_TYPE_IS_OUTPUT(f->type) ? "OUTPUT" : "CAPTURE",
-		  &frm->fmt->fourcc, pix_fmt->width, pix_fmt->height,
+		  &pix_fmt->pixelformat, pix_fmt->width, pix_fmt->height,
 		  pix_fmt->plane_fmt[0].bytesperline);
 
 	for (i = 0; i < pix_fmt->num_planes; i++) {
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index d203b7dae2b03..d98e57c6d7b57 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -17,18 +17,12 @@
 #define DEFAULT_WIDTH 100
 #define DEFAULT_HEIGHT 100
 
-struct rga_fmt {
-	u32 fourcc;
-	u8 color_swap;
-	u8 hw_format;
-};
-
 struct rga_frame {
 	/* Crop */
 	struct v4l2_rect crop;
 
 	/* Image format */
-	struct rga_fmt *fmt;
+	void *fmt;
 	struct v4l2_pix_format_mplane pix;
 };
 
@@ -142,8 +136,6 @@ static inline void rga_mod(struct rockchip_rga *rga, u32 reg, u32 val, u32 mask)
 struct rga_hw {
 	const char *card_type;
 	bool has_internal_iommu;
-	struct rga_fmt *formats;
-	u32 num_formats;
 	size_t cmdbuf_size;
 	u32 min_width, min_height;
 	u32 max_width, max_height;
@@ -155,6 +147,10 @@ struct rga_hw {
 		      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
 	bool (*handle_irq)(struct rockchip_rga *rga);
 	void (*get_version)(struct rockchip_rga *rga);
+	void *(*adjust_and_map_format)(struct rga_ctx *ctx,
+				       struct v4l2_pix_format_mplane *format,
+				       bool is_output);
+	int (*enum_format)(struct v4l2_fmtdesc *f);
 };
 
 static inline bool rga_has_internal_iommu(const struct rockchip_rga *rga)

-- 
2.52.0


