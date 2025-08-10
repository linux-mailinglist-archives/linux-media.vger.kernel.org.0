Return-Path: <linux-media+bounces-39331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA9AB1F7E1
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA9127AB395
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA8E420468D;
	Sun, 10 Aug 2025 01:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Nyi/kDO5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BED01C3BE0
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789580; cv=none; b=VxyYiYfwtQkydle04/2uI+wa+P1fcf8YwFMVKP41U1WW256NZKj0W4XYmDpVKRDigLTgWjWSVwpcdhYiUVbG/Ol4Ey3JemoYbiojKXHgrTaWmQXQig0+1No+eKGiUocqyllq95lcwkslD/pf/+NiWOR+kRM3VUnOU313wVxOFtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789580; c=relaxed/simple;
	bh=N7cq/K5euvXenMdMQutvAiyMmRVmUCAEvZOhL7pPZdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MaE4YFVZdT0ScKVk59kGhaRBgsAzr/3pgEMNoaUPhhm4dOTOOdCgkzQeIKPn/rUXS/sAZ546KM4yWtKflhoor3zN3NSN4FUf7hLzTjJqguSmNM5xQcgSiJFBwHbDN4ENOshea+FCjhIl2IT8QkKHnUhRoyRe9072txodjlH8mUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Nyi/kDO5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 742387E6;
	Sun, 10 Aug 2025 03:32:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789526;
	bh=N7cq/K5euvXenMdMQutvAiyMmRVmUCAEvZOhL7pPZdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nyi/kDO5MLJNQ9Ry6c67Q7EKMsb4AS5e525gVn+S8pgiCY9toT7l/kcmjyAC+3V8l
	 HK5juEqwnOhFyD/wLqWwcQSA1U91yJnZdTy8nsLBcR0frAerLRmreuCWhh+2tYz7K5
	 4VkI4R7WZtbc0JvNCTz2xH90rhgf81UfggtaBt4Y=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 58/76] media: s5p-mfc: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:40 +0300
Message-ID: <20250810013100.29776-59-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Changes since v1:

- Drop fh_to_ctx() macro
---
 .../platform/samsung/s5p-mfc/s5p_mfc_common.h |  4 +---
 .../platform/samsung/s5p-mfc/s5p_mfc_dec.c    | 22 ++++++++---------
 .../platform/samsung/s5p-mfc/s5p_mfc_enc.c    | 24 +++++++++----------
 3 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
index a29228b4207f..58dc1768082c 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
@@ -767,11 +767,9 @@ struct mfc_control {
 #define s5p_mfc_hw_call(f, op, args...) \
 	((f && f->op) ? f->op(args) : (typeof(f->op(args)))(-ENODEV))
 
-#define fh_to_ctx(__fh) container_of(__fh, struct s5p_mfc_ctx, fh)
-
 static inline struct s5p_mfc_ctx *file_to_ctx(struct file *filp)
 {
-	return fh_to_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct s5p_mfc_ctx, fh);
 }
 
 #define ctrl_to_ctx(__ctrl) \
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c
index aefa6da5c609..606e1a7121b5 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c
@@ -345,7 +345,7 @@ static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
 /* Get format */
 static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	struct v4l2_pix_format_mplane *pix_mp;
 
 	mfc_debug_enter();
@@ -442,7 +442,7 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct s5p_mfc_dev *dev = video_drvdata(file);
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	int ret = 0;
 	struct v4l2_pix_format_mplane *pix_mp;
 	const struct s5p_mfc_buf_size *buf_size = dev->variant->buf_size;
@@ -598,7 +598,7 @@ static int vidioc_reqbufs(struct file *file, void *priv,
 					  struct v4l2_requestbuffers *reqbufs)
 {
 	struct s5p_mfc_dev *dev = video_drvdata(file);
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (reqbufs->memory != V4L2_MEMORY_MMAP) {
 		mfc_debug(2, "Only V4L2_MEMORY_MMAP is supported\n");
@@ -619,7 +619,7 @@ static int vidioc_reqbufs(struct file *file, void *priv,
 static int vidioc_querybuf(struct file *file, void *priv,
 						   struct v4l2_buffer *buf)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	int ret;
 	int i;
 
@@ -647,7 +647,7 @@ static int vidioc_querybuf(struct file *file, void *priv,
 /* Queue a buffer */
 static int vidioc_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (ctx->state == MFCINST_ERROR) {
 		mfc_err("Call on QBUF after unrecoverable error\n");
@@ -666,7 +666,7 @@ static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 	const struct v4l2_event ev = {
 		.type = V4L2_EVENT_EOS
 	};
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	int ret;
 
 	if (ctx->state == MFCINST_ERROR) {
@@ -695,7 +695,7 @@ static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 static int vidioc_expbuf(struct file *file, void *priv,
 	struct v4l2_exportbuffer *eb)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (eb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		return vb2_expbuf(&ctx->vq_src, eb);
@@ -708,7 +708,7 @@ static int vidioc_expbuf(struct file *file, void *priv,
 static int vidioc_streamon(struct file *file, void *priv,
 			   enum v4l2_buf_type type)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	int ret = -EINVAL;
 
 	mfc_debug_enter();
@@ -724,7 +724,7 @@ static int vidioc_streamon(struct file *file, void *priv,
 static int vidioc_streamoff(struct file *file, void *priv,
 			    enum v4l2_buf_type type)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		return vb2_streamoff(&ctx->vq_src, type);
@@ -801,7 +801,7 @@ static const struct v4l2_ctrl_ops s5p_mfc_dec_ctrl_ops = {
 static int vidioc_g_selection(struct file *file, void *priv,
 			      struct v4l2_selection *s)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	struct s5p_mfc_dev *dev = ctx->dev;
 	u32 left, right, top, bottom;
 	u32 width, height;
@@ -856,7 +856,7 @@ static int vidioc_g_selection(struct file *file, void *priv,
 static int vidioc_decoder_cmd(struct file *file, void *priv,
 			      struct v4l2_decoder_cmd *cmd)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	struct s5p_mfc_dev *dev = ctx->dev;
 	struct s5p_mfc_buf *buf;
 	unsigned long flags;
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
index 9b77dbd856e7..694b68788a95 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
@@ -1389,8 +1389,8 @@ static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
 
 static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
 	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	mfc_debug(2, "f->type = %d ctx->state = %d\n", f->type, ctx->state);
 	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
@@ -1472,8 +1472,8 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 
 static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	struct s5p_mfc_dev *dev = video_drvdata(file);
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
 	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
 	int ret = 0;
 
@@ -1531,7 +1531,7 @@ static int vidioc_reqbufs(struct file *file, void *priv,
 					  struct v4l2_requestbuffers *reqbufs)
 {
 	struct s5p_mfc_dev *dev = video_drvdata(file);
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	int ret = 0;
 
 	/* if memory is not mmp or userptr or dmabuf return error */
@@ -1601,7 +1601,7 @@ static int vidioc_reqbufs(struct file *file, void *priv,
 static int vidioc_querybuf(struct file *file, void *priv,
 						   struct v4l2_buffer *buf)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	int ret = 0;
 
 	/* if memory is not mmp or userptr or dmabuf return error */
@@ -1636,7 +1636,7 @@ static int vidioc_querybuf(struct file *file, void *priv,
 /* Queue a buffer */
 static int vidioc_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (ctx->state == MFCINST_ERROR) {
 		mfc_err("Call on QBUF after unrecoverable error\n");
@@ -1657,10 +1657,10 @@ static int vidioc_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 /* Dequeue a buffer */
 static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 {
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	const struct v4l2_event ev = {
 		.type = V4L2_EVENT_EOS
 	};
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
 	int ret;
 
 	if (ctx->state == MFCINST_ERROR) {
@@ -1685,7 +1685,7 @@ static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 static int vidioc_expbuf(struct file *file, void *priv,
 	struct v4l2_exportbuffer *eb)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (eb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		return vb2_expbuf(&ctx->vq_src, eb);
@@ -1698,7 +1698,7 @@ static int vidioc_expbuf(struct file *file, void *priv,
 static int vidioc_streamon(struct file *file, void *priv,
 			   enum v4l2_buf_type type)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		return vb2_streamon(&ctx->vq_src, type);
@@ -1711,7 +1711,7 @@ static int vidioc_streamon(struct file *file, void *priv,
 static int vidioc_streamoff(struct file *file, void *priv,
 			    enum v4l2_buf_type type)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		return vb2_streamoff(&ctx->vq_src, type);
@@ -2284,7 +2284,7 @@ static const struct v4l2_ctrl_ops s5p_mfc_enc_ctrl_ops = {
 static int vidioc_s_parm(struct file *file, void *priv,
 			 struct v4l2_streamparm *a)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (a->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		ctx->enc_params.rc_framerate_num =
@@ -2301,7 +2301,7 @@ static int vidioc_s_parm(struct file *file, void *priv,
 static int vidioc_g_parm(struct file *file, void *priv,
 			 struct v4l2_streamparm *a)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (a->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
 		a->parm.output.timeperframe.denominator =
@@ -2318,7 +2318,7 @@ static int vidioc_g_parm(struct file *file, void *priv,
 static int vidioc_encoder_cmd(struct file *file, void *priv,
 			      struct v4l2_encoder_cmd *cmd)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	struct s5p_mfc_dev *dev = ctx->dev;
 	struct s5p_mfc_buf *buf;
 	unsigned long flags;
-- 
Regards,

Laurent Pinchart


