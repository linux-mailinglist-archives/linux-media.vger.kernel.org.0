Return-Path: <linux-media+bounces-39247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC8EB1F6AB
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56A523AF417
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C989E2C3260;
	Sat,  9 Aug 2025 21:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CQzSumiE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3882BEFED;
	Sat,  9 Aug 2025 21:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774327; cv=none; b=ZaAHk7SYeLLa8QM71Q0WVITMjuwXWUEsmIgICVw0bV7SeYk7VCgidFS5D+nIhKBv5QKHNbQlPOX6p8kqx5LDuwP2VfdrWg2bT7CgfeMuEWBhliCMS9RXeyxQwtIXWBgZgNKzSfwXc+L3kZES+f88+iUGYAUc8rYircaCXl2m/xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774327; c=relaxed/simple;
	bh=VJVTfeHwNFb9lgO+BAZOb6zD69zLMcXDF0sKoMODvcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uNOjIyEiW4cHpyIfHr5Uv72xbyBNA5yMghg93X3M7PCJDQ4Wc/7SC31jZ2pNrRh6foDQ2vLq3zbigXUcTpuYv20KniqOLHImWzIypjQQTBctMOyfKBkMH7zs3xAbWUJwwesWKM1saA/KRmA5I/xrCjfQ40sVVbioEnMkb8syE/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CQzSumiE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4F20C156F;
	Sat,  9 Aug 2025 23:17:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774267;
	bh=VJVTfeHwNFb9lgO+BAZOb6zD69zLMcXDF0sKoMODvcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CQzSumiEDoqGdp1LHQtm53R0ypmuHk9O2VV8G/82bHldDNOpAhgyTTLNpciPzBZIc
	 DMUZ4Gdb+0AuW8pRIisn5OabOnTX9AhPeAqzVRuJP6leglU/UcK3h0BmwWNx9vHsOY
	 KfAzGEdbh8YwwAz1rlQm6RjXzpcsWznuUjKtl74s=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 52/76] media: exynos-gsc: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:29 +0300
Message-ID: <20250809211654.28887-53-laurent.pinchart@ideasonboard.com>
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

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Update file-to-ctx macro due to removal of fh-to-ctx macro
---
 .../platform/samsung/exynos-gsc/gsc-core.h    |  4 +---
 .../platform/samsung/exynos-gsc/gsc-m2m.c     | 24 +++++++++----------
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos-gsc/gsc-core.h b/drivers/media/platform/samsung/exynos-gsc/gsc-core.h
index 56856e9f9baf..265221abf4dc 100644
--- a/drivers/media/platform/samsung/exynos-gsc/gsc-core.h
+++ b/drivers/media/platform/samsung/exynos-gsc/gsc-core.h
@@ -85,8 +85,6 @@ enum gsc_yuv_fmt {
 	GSC_CRCB,
 };
 
-#define fh_to_ctx(__fh) container_of(__fh, struct gsc_ctx, fh)
-
 #define is_rgb(x) (!!((x) & 0x1))
 #define is_yuv420(x) (!!((x) & 0x2))
 #define is_yuv422(x) (!!((x) & 0x4))
@@ -384,7 +382,7 @@ struct gsc_ctx {
 
 static inline struct gsc_ctx *file_to_ctx(struct file *filp)
 {
-	return fh_to_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct gsc_ctx, fh);
 }
 
 void gsc_set_prefbuf(struct gsc_dev *gsc, struct gsc_frame *frm);
diff --git a/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c b/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
index 2999fb2610f0..722e2531e23f 100644
--- a/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
+++ b/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
@@ -297,7 +297,7 @@ static int gsc_m2m_enum_fmt(struct file *file, void *priv,
 static int gsc_m2m_g_fmt_mplane(struct file *file, void *fh,
 			     struct v4l2_format *f)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 
 	return gsc_g_fmt_mplane(ctx, f);
 }
@@ -305,7 +305,7 @@ static int gsc_m2m_g_fmt_mplane(struct file *file, void *fh,
 static int gsc_m2m_try_fmt_mplane(struct file *file, void *fh,
 				  struct v4l2_format *f)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 
 	return gsc_try_fmt_mplane(ctx, f);
 }
@@ -313,7 +313,7 @@ static int gsc_m2m_try_fmt_mplane(struct file *file, void *fh,
 static int gsc_m2m_s_fmt_mplane(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	struct vb2_queue *vq;
 	struct gsc_frame *frame;
 	struct v4l2_pix_format_mplane *pix;
@@ -359,7 +359,7 @@ static int gsc_m2m_s_fmt_mplane(struct file *file, void *fh,
 static int gsc_m2m_reqbufs(struct file *file, void *fh,
 			  struct v4l2_requestbuffers *reqbufs)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	struct gsc_dev *gsc = ctx->gsc_dev;
 	u32 max_cnt;
 
@@ -374,35 +374,35 @@ static int gsc_m2m_reqbufs(struct file *file, void *fh,
 static int gsc_m2m_expbuf(struct file *file, void *fh,
 				struct v4l2_exportbuffer *eb)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	return v4l2_m2m_expbuf(file, ctx->m2m_ctx, eb);
 }
 
 static int gsc_m2m_querybuf(struct file *file, void *fh,
 					struct v4l2_buffer *buf)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	return v4l2_m2m_querybuf(file, ctx->m2m_ctx, buf);
 }
 
 static int gsc_m2m_qbuf(struct file *file, void *fh,
 			  struct v4l2_buffer *buf)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	return v4l2_m2m_qbuf(file, ctx->m2m_ctx, buf);
 }
 
 static int gsc_m2m_dqbuf(struct file *file, void *fh,
 			   struct v4l2_buffer *buf)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	return v4l2_m2m_dqbuf(file, ctx->m2m_ctx, buf);
 }
 
 static int gsc_m2m_streamon(struct file *file, void *fh,
 			   enum v4l2_buf_type type)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 
 	/* The source and target color format need to be set */
 	if (V4L2_TYPE_IS_OUTPUT(type)) {
@@ -418,7 +418,7 @@ static int gsc_m2m_streamon(struct file *file, void *fh,
 static int gsc_m2m_streamoff(struct file *file, void *fh,
 			    enum v4l2_buf_type type)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	return v4l2_m2m_streamoff(file, ctx->m2m_ctx, type);
 }
 
@@ -440,8 +440,8 @@ static int is_rectangle_enclosed(struct v4l2_rect *a, struct v4l2_rect *b)
 static int gsc_m2m_g_selection(struct file *file, void *fh,
 			struct v4l2_selection *s)
 {
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	struct gsc_frame *frame;
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
 
 	if ((s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE) &&
 	    (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT))
@@ -478,7 +478,7 @@ static int gsc_m2m_s_selection(struct file *file, void *fh,
 				struct v4l2_selection *s)
 {
 	struct gsc_frame *frame;
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	struct gsc_variant *variant = ctx->gsc_dev->variant;
 	struct v4l2_selection sel = *s;
 	int ret;
-- 
Regards,

Laurent Pinchart


