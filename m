Return-Path: <linux-media+bounces-59790-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LldMU148GmiTwEAu9opvQ
	(envelope-from <linux-media+bounces-59790-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:05:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 970E0480DCD
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6DDF5306E8D5
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 09:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85DB93DE451;
	Tue, 28 Apr 2026 09:01:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682283DA7FD
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 09:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777366861; cv=none; b=qSA4fLxDLcDxISQKiPbX3ReCXUaIoZGg9KLHrWZ+1AeKqwp/Iy9T8LXTV0bucJjOwl98+jq/vH24E87LVBUB+iW+KG9yhah+pgw127QxXqngkEUZmn+CefPDG+BbLYVF+YhwO/1PvrTFNluCKYI5ioyWZPFqYOYpJE+2saNzgVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777366861; c=relaxed/simple;
	bh=eb0HVwcvyYdHcbAqk88/gzJjmki0m+Dx2IZBwYkohNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fj6tr9z9UcjRlVNXY2bil9qT+OIyuZNwR/UXx+Ef2LYNrqJ9vY7nRsnsR5vuuVVPcPC8Rp7W9Xa0RT9cJ7P3lVSxeWOCI3zAF4kveJmoozSAEIW6JWdmYrjv+6fEsDmqYSW9iXNJj8eu3CU/6XwDvY69ZM+qQTteS1cDAQKk7Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wHeJC-0004Lz-GU; Tue, 28 Apr 2026 11:00:46 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 28 Apr 2026 11:00:44 +0200
Subject: [PATCH v5 09/29] media: rockchip: rga: remove redundant rga_frame
 variables
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-spu-rga3-v5-9-eb7f5d019d86@pengutronix.de>
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
In-Reply-To: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Queue-Id: 970E0480DCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59790-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email,pengutronix.de:mid,pengutronix.de:email]

Remove the redundant rga_frame variables width, height and color space.
The value of these variables is already contained in the pix member
of rga_frame. The code also keeps these values in sync. Therefore drop
them in favor of the existing pix member.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-buf.c |  6 ++---
 drivers/media/platform/rockchip/rga/rga-hw.c  |  6 ++---
 drivers/media/platform/rockchip/rga/rga.c     | 32 ++++++++++-----------------
 drivers/media/platform/rockchip/rga/rga.h     |  5 -----
 4 files changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index 65fc0d5b4aa10..ffc6162b2e681 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -103,10 +103,10 @@ static int get_plane_offset(struct rga_frame *f,
 	if (plane == 0)
 		return 0;
 	if (plane == 1)
-		return stride * f->height;
+		return stride * f->pix.height;
 	if (plane == 2)
-		return stride * f->height +
-		       (stride * f->height / info->hdiv / info->vdiv);
+		return stride * f->pix.height +
+		       (stride * f->pix.height / info->hdiv / info->vdiv);
 
 	return -EINVAL;
 }
diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index d1618bb247501..ec6c17504ca15 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -53,7 +53,7 @@ rga_get_addr_offset(struct rga_frame *frm, struct rga_addr_offset *offset,
 	x_div = frm->fmt->x_div;
 	y_div = frm->fmt->y_div;
 	uv_stride = frm->stride / x_div;
-	pixel_width = frm->stride / frm->width;
+	pixel_width = frm->stride / frm->pix.width;
 
 	lt->y_off = offset->y_off + y * frm->stride + x * pixel_width;
 	lt->u_off = offset->u_off + (y / y_div) * uv_stride + x / x_div;
@@ -191,7 +191,7 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 
 	if (RGA_COLOR_FMT_IS_YUV(ctx->in.fmt->hw_format) &&
 	    RGA_COLOR_FMT_IS_RGB(ctx->out.fmt->hw_format)) {
-		switch (ctx->in.colorspace) {
+		switch (ctx->in.pix.colorspace) {
 		case V4L2_COLORSPACE_REC709:
 			src_info.data.csc_mode = RGA_SRC_CSC_MODE_BT709_R0;
 			break;
@@ -203,7 +203,7 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 
 	if (RGA_COLOR_FMT_IS_RGB(ctx->in.fmt->hw_format) &&
 	    RGA_COLOR_FMT_IS_YUV(ctx->out.fmt->hw_format)) {
-		switch (ctx->out.colorspace) {
+		switch (ctx->out.pix.colorspace) {
 		case V4L2_COLORSPACE_REC709:
 			dst_info.data.csc_mode = RGA_SRC_CSC_MODE_BT709_R0;
 			break;
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index c07207edffdb6..ca8d8a53dc251 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -329,9 +329,6 @@ static struct rga_fmt *rga_fmt_find(u32 pixelformat)
 }
 
 static struct rga_frame def_frame = {
-	.width = DEFAULT_WIDTH,
-	.height = DEFAULT_HEIGHT,
-	.colorspace = V4L2_COLORSPACE_DEFAULT,
 	.crop.left = 0,
 	.crop.top = 0,
 	.crop.width = DEFAULT_WIDTH,
@@ -363,9 +360,9 @@ static int rga_open(struct file *file)
 	ctx->out = def_frame;
 
 	v4l2_fill_pixfmt_mp(&ctx->in.pix,
-			    ctx->in.fmt->fourcc, ctx->out.width, ctx->out.height);
+			    ctx->in.fmt->fourcc, DEFAULT_WIDTH, DEFAULT_HEIGHT);
 	v4l2_fill_pixfmt_mp(&ctx->out.pix,
-			    ctx->out.fmt->fourcc, ctx->out.width, ctx->out.height);
+			    ctx->out.fmt->fourcc, DEFAULT_WIDTH, DEFAULT_HEIGHT);
 
 	if (mutex_lock_interruptible(&rga->mutex)) {
 		kfree(ctx);
@@ -453,10 +450,8 @@ static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	if (IS_ERR(frm))
 		return PTR_ERR(frm);
 
-	v4l2_fill_pixfmt_mp(pix_fmt, frm->fmt->fourcc, frm->width, frm->height);
-
+	*pix_fmt = frm->pix;
 	pix_fmt->field = V4L2_FIELD_NONE;
-	pix_fmt->colorspace = frm->colorspace;
 
 	return 0;
 }
@@ -505,27 +500,24 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	frm = rga_get_frame(ctx, f->type);
 	if (IS_ERR(frm))
 		return PTR_ERR(frm);
-	frm->width = pix_fmt->width;
-	frm->height = pix_fmt->height;
 	frm->size = 0;
 	for (i = 0; i < pix_fmt->num_planes; i++)
 		frm->size += pix_fmt->plane_fmt[i].sizeimage;
 	frm->fmt = rga_fmt_find(pix_fmt->pixelformat);
 	frm->stride = pix_fmt->plane_fmt[0].bytesperline;
-	frm->colorspace = pix_fmt->colorspace;
 
 	/* Reset crop settings */
 	frm->crop.left = 0;
 	frm->crop.top = 0;
-	frm->crop.width = frm->width;
-	frm->crop.height = frm->height;
+	frm->crop.width = pix_fmt->width;
+	frm->crop.height = pix_fmt->height;
 
 	frm->pix = *pix_fmt;
 
 	v4l2_dbg(debug, 1, &rga->v4l2_dev,
 		 "[%s] fmt - %p4cc %dx%d (stride %d, sizeimage %d)\n",
 		  V4L2_TYPE_IS_OUTPUT(f->type) ? "OUTPUT" : "CAPTURE",
-		  &frm->fmt->fourcc, frm->width, frm->height,
+		  &frm->fmt->fourcc, pix_fmt->width, pix_fmt->height,
 		  frm->stride, frm->size);
 
 	for (i = 0; i < pix_fmt->num_planes; i++) {
@@ -579,8 +571,8 @@ static int vidioc_g_selection(struct file *file, void *priv,
 	} else {
 		s->r.left = 0;
 		s->r.top = 0;
-		s->r.width = f->width;
-		s->r.height = f->height;
+		s->r.width = f->pix.width;
+		s->r.height = f->pix.height;
 	}
 
 	return 0;
@@ -629,8 +621,8 @@ static int vidioc_s_selection(struct file *file, void *priv,
 		return -EINVAL;
 	}
 
-	if (s->r.left + s->r.width > f->width ||
-	    s->r.top + s->r.height > f->height ||
+	if (s->r.left + s->r.width > f->pix.width ||
+	    s->r.top + s->r.height > f->pix.height ||
 	    s->r.width < MIN_WIDTH || s->r.height < MIN_HEIGHT) {
 		v4l2_dbg(debug, 1, &rga->v4l2_dev, "unsupported crop value.\n");
 		return -EINVAL;
@@ -821,8 +813,8 @@ static int rga_probe(struct platform_device *pdev)
 		goto rel_m2m;
 	}
 
-	def_frame.stride = (def_frame.width * def_frame.fmt->depth) >> 3;
-	def_frame.size = def_frame.stride * def_frame.height;
+	def_frame.stride = (DEFAULT_WIDTH * def_frame.fmt->depth) >> 3;
+	def_frame.size = def_frame.stride * DEFAULT_HEIGHT;
 
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
 	if (ret) {
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 477cf5b62bbb2..c4a3905a48f0d 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -24,11 +24,6 @@ struct rga_fmt {
 };
 
 struct rga_frame {
-	/* Original dimensions */
-	u32 width;
-	u32 height;
-	u32 colorspace;
-
 	/* Crop */
 	struct v4l2_rect crop;
 

-- 
2.54.0


