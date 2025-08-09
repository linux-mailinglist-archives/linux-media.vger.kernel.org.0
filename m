Return-Path: <linux-media+bounces-39251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B6EB1F6B1
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A70E7B1A84
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4B72BF3CC;
	Sat,  9 Aug 2025 21:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Kw3waXLO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2CB27EFE3
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774334; cv=none; b=CrtGlVY/EmiYEEhY4jxydrXGkxRZft1Cz269G5jD+83KnCLmDEMvb4vOxMsE8Zp4aHvEoiV21vCThK9j3UX0oMTKW4WNQnJ0aB+P7/ed7BJAC9BtxexSMF8VbyMMaQZgEZsmBEbpZVsGB7GvJYyTpP2RMyndh8WY8R5pknJkdP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774334; c=relaxed/simple;
	bh=wo5NKGaetHKlFIyopd6naw1ltpha/XckyBihK5e7a2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oWrSojezAWon6x4IjafeMpbNfcL+YAPtBRDxunqGpQVeS8sjK/kxBhmMQC5bVPLvE4JQTnPkJFvHR+y+L1wEo5EI9ctdad7M1y/uweYhusHoTDbX1wEI64m0QMegklrNjfe6ZhujFleuEyKfkHfcEn1kbqeWNGOiGZxUE/fjDmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Kw3waXLO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 27946502;
	Sat,  9 Aug 2025 23:17:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774274;
	bh=wo5NKGaetHKlFIyopd6naw1ltpha/XckyBihK5e7a2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kw3waXLOGNj76PNveWGPyPxKByAfWkx/AsizDNDZE6VIBcC6eSRiRBZqPaItTVZwq
	 kIF5uUqnRh69MHnWwEeQQc7Mp+7ahKa436oPMBtr1S7UY81Jyz6K+ibsrgV9vYhLNr
	 81tunb/LzieweRLb0jncX6RajVoDxLdH1jQ41bmA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 56/76] media: s5p-jpeg: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:33 +0300
Message-ID: <20250809211654.28887-57-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Update file-to-ctx macro due to removal of fh-to-ctx macro
---
 .../platform/samsung/s5p-jpeg/jpeg-core.c     | 27 ++++++++-----------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
index 65f256db4c76..81792f7f8b16 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
@@ -580,14 +580,9 @@ static inline struct s5p_jpeg_ctx *ctrl_to_ctx(struct v4l2_ctrl *c)
 	return container_of(c->handler, struct s5p_jpeg_ctx, ctrl_handler);
 }
 
-static inline struct s5p_jpeg_ctx *fh_to_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct s5p_jpeg_ctx, fh);
-}
-
 static inline struct s5p_jpeg_ctx *file_to_ctx(struct file *filp)
 {
-	return fh_to_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct s5p_jpeg_ctx, fh);
 }
 
 static int s5p_jpeg_to_user_subsampling(struct s5p_jpeg_ctx *ctx)
@@ -1015,8 +1010,8 @@ static int s5p_jpeg_open(struct file *file)
 
 static int s5p_jpeg_release(struct file *file)
 {
-	struct s5p_jpeg *jpeg = video_drvdata(file);
 	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
+	struct s5p_jpeg *jpeg = video_drvdata(file);
 
 	mutex_lock(&jpeg->lock);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
@@ -1253,7 +1248,7 @@ static bool s5p_jpeg_parse_hdr(struct s5p_jpeg_q_data *result,
 static int s5p_jpeg_querycap(struct file *file, void *priv,
 			   struct v4l2_capability *cap)
 {
-	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
 
 	if (ctx->mode == S5P_JPEG_ENCODE) {
 		strscpy(cap->driver, S5P_JPEG_M2M_NAME,
@@ -1301,7 +1296,7 @@ static int enum_fmt(struct s5p_jpeg_ctx *ctx,
 static int s5p_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
 				   struct v4l2_fmtdesc *f)
 {
-	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
 
 	if (ctx->mode == S5P_JPEG_ENCODE)
 		return enum_fmt(ctx, sjpeg_formats, SJPEG_NUM_FORMATS, f,
@@ -1314,7 +1309,7 @@ static int s5p_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
 static int s5p_jpeg_enum_fmt_vid_out(struct file *file, void *priv,
 				   struct v4l2_fmtdesc *f)
 {
-	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
 
 	if (ctx->mode == S5P_JPEG_ENCODE)
 		return enum_fmt(ctx, sjpeg_formats, SJPEG_NUM_FORMATS, f,
@@ -1340,7 +1335,7 @@ static int s5p_jpeg_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	struct vb2_queue *vq;
 	struct s5p_jpeg_q_data *q_data = NULL;
 	struct v4l2_pix_format *pix = &f->fmt.pix;
-	struct s5p_jpeg_ctx *ct = fh_to_ctx(priv);
+	struct s5p_jpeg_ctx *ct = file_to_ctx(file);
 
 	vq = v4l2_m2m_get_vq(ct->fh.m2m_ctx, f->type);
 	if (!vq)
@@ -1480,7 +1475,7 @@ static int vidioc_try_fmt(struct v4l2_format *f, struct s5p_jpeg_fmt *fmt,
 static int s5p_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
-	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
 	struct v4l2_pix_format *pix = &f->fmt.pix;
 	struct s5p_jpeg_fmt *fmt;
 	int ret;
@@ -1539,7 +1534,7 @@ static int s5p_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
 static int s5p_jpeg_try_fmt_vid_out(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
-	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
 	struct s5p_jpeg_fmt *fmt;
 
 	fmt = s5p_jpeg_find_format(ctx, f->fmt.pix.pixelformat,
@@ -1686,7 +1681,7 @@ static int s5p_jpeg_s_fmt_vid_cap(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	return s5p_jpeg_s_fmt(fh_to_ctx(priv), f);
+	return s5p_jpeg_s_fmt(file_to_ctx(file), f);
 }
 
 static int s5p_jpeg_s_fmt_vid_out(struct file *file, void *priv,
@@ -1698,7 +1693,7 @@ static int s5p_jpeg_s_fmt_vid_out(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	return s5p_jpeg_s_fmt(fh_to_ctx(priv), f);
+	return s5p_jpeg_s_fmt(file_to_ctx(file), f);
 }
 
 static int s5p_jpeg_subscribe_event(struct v4l2_fh *fh,
@@ -1795,7 +1790,7 @@ static int exynos3250_jpeg_try_crop(struct s5p_jpeg_ctx *ctx,
 static int s5p_jpeg_g_selection(struct file *file, void *priv,
 			 struct v4l2_selection *s)
 {
-	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
 	    s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
-- 
Regards,

Laurent Pinchart


