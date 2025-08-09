Return-Path: <linux-media+bounces-39258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5644B1F6B8
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBE463BCDCD
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B50E2D0C64;
	Sat,  9 Aug 2025 21:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="waWZH0K3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C392D028F
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774344; cv=none; b=cfVTUysD+x12/SQtAutvMJ5rJDfOdMnOcHcxNYHGhTA1X+PNOKxCvbwMaOGMZi+N8wS1DpyJ/+njFpqPCFBu2RGWr6jHx9JE0Y84TCty5QmwKvqGs3QDm+svJeGOalK67m7Rna8PngQcn0PJiZIpb3hZE8u+mzk0B5sqXU586MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774344; c=relaxed/simple;
	bh=ZZfERwHvku2qrCiMt+5gsXxNo5bb9wTUeX2X/69zwso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sq9N/VxYn8QOIWzWjBOAsyyZS9sFAhYkBQWALSYACBCsq3MnAmHJnQqARYlYDAyZNwbRHRZtht/Hp0QicAlWYWzhs96HsIMH7scBLK17QYhzscknNpkQbq8ZNzF7YDWv6qNnpKwkKh2ftZftS8+6o+9NoJYN3SkaJZjcfX88C9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=waWZH0K3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 22ABE502;
	Sat,  9 Aug 2025 23:18:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774284;
	bh=ZZfERwHvku2qrCiMt+5gsXxNo5bb9wTUeX2X/69zwso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=waWZH0K3qElbeGS5UVsU5HhQykxLceLX64wbDzJ589j9FcohtKTYkkxTiCvBCZWxk
	 kmL8Ek5/gdjomcdjAy7hXWJMK24sMh91DytVXV+2M+KhKCSLtlet+jrbZy/PLjphoj
	 9z9gbWw7S1K5v+152xR33EEHczDWVbGHAe2Coexc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 62/76] media: hantro: Access v4l2_fh from file->private_data
Date: Sun, 10 Aug 2025 00:16:39 +0300
Message-ID: <20250809211654.28887-63-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

To prepare for the introduction of video_device_state as second argument
of the v4l2_ioctl_ops handler, access the v4l2_fh from
file->private_data instead of using void *priv.

The file->private_data is initialized to point to the v4l2_fh
by the usage of v4l2_fh_init() in the v4l2_file_operations.open()
handler.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
---
Changes since v1:

- Update file-to-ctx macro due to removal of fh-to-ctx macro
---
 drivers/media/platform/verisilicon/hantro.h   |  7 +-----
 .../media/platform/verisilicon/hantro_v4l2.c  | 22 +++++++++----------
 2 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 5b85c8a44706..e0fdc4535b2d 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -382,14 +382,9 @@ extern int hantro_debug;
 	pr_err("%s:%d: " fmt, __func__, __LINE__, ##args)
 
 /* Structure access helpers. */
-static __always_inline struct hantro_ctx *fh_to_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct hantro_ctx, fh);
-}
-
 static __always_inline struct hantro_ctx *file_to_ctx(struct file *filp)
 {
-	return fh_to_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct hantro_ctx, fh);
 }
 
 /* Register accessors. */
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 7c3515cf7d64..6bcd892e7bb4 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -185,7 +185,7 @@ static int vidioc_querycap(struct file *file, void *priv,
 static int vidioc_enum_framesizes(struct file *file, void *priv,
 				  struct v4l2_frmsizeenum *fsize)
 {
-	struct hantro_ctx *ctx = fh_to_ctx(priv);
+	struct hantro_ctx *ctx = file_to_ctx(file);
 	const struct hantro_fmt *fmt;
 
 	fmt = hantro_find_format(ctx, fsize->pixel_format);
@@ -217,7 +217,7 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 			   struct v4l2_fmtdesc *f, bool capture)
 
 {
-	struct hantro_ctx *ctx = fh_to_ctx(priv);
+	struct hantro_ctx *ctx = file_to_ctx(file);
 	const struct hantro_fmt *fmt, *formats;
 	unsigned int num_fmts, i, j = 0;
 	bool skip_mode_none, enum_all_formats;
@@ -297,7 +297,7 @@ static int vidioc_g_fmt_out_mplane(struct file *file, void *priv,
 				   struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct hantro_ctx *ctx = fh_to_ctx(priv);
+	struct hantro_ctx *ctx = file_to_ctx(file);
 
 	vpu_debug(4, "f->type = %d\n", f->type);
 
@@ -310,7 +310,7 @@ static int vidioc_g_fmt_cap_mplane(struct file *file, void *priv,
 				   struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct hantro_ctx *ctx = fh_to_ctx(priv);
+	struct hantro_ctx *ctx = file_to_ctx(file);
 
 	vpu_debug(4, "f->type = %d\n", f->type);
 
@@ -398,13 +398,13 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 static int vidioc_try_fmt_cap_mplane(struct file *file, void *priv,
 				     struct v4l2_format *f)
 {
-	return hantro_try_fmt(fh_to_ctx(priv), &f->fmt.pix_mp, f->type);
+	return hantro_try_fmt(file_to_ctx(file), &f->fmt.pix_mp, f->type);
 }
 
 static int vidioc_try_fmt_out_mplane(struct file *file, void *priv,
 				     struct v4l2_format *f)
 {
-	return hantro_try_fmt(fh_to_ctx(priv), &f->fmt.pix_mp, f->type);
+	return hantro_try_fmt(file_to_ctx(file), &f->fmt.pix_mp, f->type);
 }
 
 static void
@@ -648,19 +648,19 @@ static int hantro_set_fmt_cap(struct hantro_ctx *ctx,
 static int
 vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
 {
-	return hantro_set_fmt_out(fh_to_ctx(priv), &f->fmt.pix_mp, HANTRO_AUTO_POSTPROC);
+	return hantro_set_fmt_out(file_to_ctx(file), &f->fmt.pix_mp, HANTRO_AUTO_POSTPROC);
 }
 
 static int
 vidioc_s_fmt_cap_mplane(struct file *file, void *priv, struct v4l2_format *f)
 {
-	return hantro_set_fmt_cap(fh_to_ctx(priv), &f->fmt.pix_mp);
+	return hantro_set_fmt_cap(file_to_ctx(file), &f->fmt.pix_mp);
 }
 
 static int vidioc_g_selection(struct file *file, void *priv,
 			      struct v4l2_selection *sel)
 {
-	struct hantro_ctx *ctx = fh_to_ctx(priv);
+	struct hantro_ctx *ctx = file_to_ctx(file);
 
 	/* Crop only supported on source. */
 	if (!ctx->is_encoder ||
@@ -691,7 +691,7 @@ static int vidioc_g_selection(struct file *file, void *priv,
 static int vidioc_s_selection(struct file *file, void *priv,
 			      struct v4l2_selection *sel)
 {
-	struct hantro_ctx *ctx = fh_to_ctx(priv);
+	struct hantro_ctx *ctx = file_to_ctx(file);
 	struct v4l2_rect *rect = &sel->r;
 	struct vb2_queue *vq;
 
@@ -738,7 +738,7 @@ static const struct v4l2_event hantro_eos_event = {
 static int vidioc_encoder_cmd(struct file *file, void *priv,
 			      struct v4l2_encoder_cmd *ec)
 {
-	struct hantro_ctx *ctx = fh_to_ctx(priv);
+	struct hantro_ctx *ctx = file_to_ctx(file);
 	int ret;
 
 	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, priv, ec);
-- 
Regards,

Laurent Pinchart


