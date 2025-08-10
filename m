Return-Path: <linux-media+bounces-39311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEDEB1F7C8
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB2F93BD3A4
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990F41F130A;
	Sun, 10 Aug 2025 01:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fVYh8TYm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD431F03DE
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789548; cv=none; b=YuUN0b4cUPFMLZEDObhVvE1iEInngVY2bOvLNpHvLUM63uWy65AYi10t+buAQxijH5+Xvo/ApmDhBKqnfJ4R5H/ZpvkcS2d93YqqQVoOjAbYATznZdLWcv6Qj6YH05fkLZqP39ANNzbwDx3ZFv/c/sKYIxzErMdjM1KuNiBUpRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789548; c=relaxed/simple;
	bh=gdd/HwKuZA0DLRgl29hH2ZMbBYZFlP9Fh7nUd924H4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JMnLgMSLV5IHrYwGrQG7+Sjo3XPV5SOwgr0y5cbTeI87XLJdhYLKfq4ELwmUqymlSY3dIAkKd4D0FnDrumhHWXNgt0GdEPv5hM8CuvM46oWgsxjNmcXXupWL9osOvlBkTWSiHVm7+xzflXn5Fx/MvfbPou2PDf12i2XNVkaQHtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fVYh8TYm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9961F1DAB;
	Sun, 10 Aug 2025 03:31:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789493;
	bh=gdd/HwKuZA0DLRgl29hH2ZMbBYZFlP9Fh7nUd924H4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fVYh8TYmlpIkLQR5TDZb0XLWwea1UPaH3RGuDvb65aHg1cqaGrY/nQERmshJr7n1Y
	 qQjlTyhCCW8m+uEmRiYTrf2DP/z3Kuc5pNVLIU+zSD2ChYrDXXjjzAZe6l7FA47LXH
	 tL+u9MEMiwEi2Y5Bn9Ut8VqG8MkN+CTiVuqUOgZw=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v3 38/76] media: coda: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:20 +0300
Message-ID: <20250810013100.29776-39-laurent.pinchart+renesas@ideasonboard.com>
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
 .../platform/chips-media/coda/coda-common.c   | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index 583759eed610..9a57b042d9fd 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -427,7 +427,7 @@ static struct vdoa_data *coda_get_vdoa_data(void)
 static int coda_querycap(struct file *file, void *priv,
 			 struct v4l2_capability *cap)
 {
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 
 	strscpy(cap->driver, CODA_NAME, sizeof(cap->driver));
 	strscpy(cap->card, coda_product_name(ctx->dev->devtype->product),
@@ -447,7 +447,7 @@ static int coda_enum_fmt(struct file *file, void *priv,
 {
 	struct video_device *vdev = video_devdata(file);
 	const struct coda_video_device *cvd = to_coda_video_device(vdev);
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	const u32 *formats;
 
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
@@ -497,7 +497,7 @@ static int coda_g_fmt(struct file *file, void *priv,
 		      struct v4l2_format *f)
 {
 	struct coda_q_data *q_data;
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 
 	q_data = get_q_data(ctx, f->type);
 	if (!q_data)
@@ -658,7 +658,7 @@ static int coda_try_fmt(struct coda_ctx *ctx, const struct coda_codec *codec,
 static int coda_try_fmt_vid_cap(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	const struct coda_q_data *q_data_src;
 	const struct coda_codec *codec;
 	struct vb2_queue *src_vq;
@@ -764,7 +764,7 @@ static void coda_set_default_colorspace(struct v4l2_pix_format *fmt)
 static int coda_try_fmt_vid_out(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct coda_dev *dev = ctx->dev;
 	const struct coda_q_data *q_data_dst;
 	const struct coda_codec *codec;
@@ -858,7 +858,7 @@ static int coda_s_fmt(struct coda_ctx *ctx, struct v4l2_format *f,
 static int coda_s_fmt_vid_cap(struct file *file, void *priv,
 			      struct v4l2_format *f)
 {
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct coda_q_data *q_data_src;
 	const struct coda_codec *codec;
 	struct v4l2_rect r;
@@ -910,7 +910,7 @@ static int coda_s_fmt_vid_cap(struct file *file, void *priv,
 static int coda_s_fmt_vid_out(struct file *file, void *priv,
 			      struct v4l2_format *f)
 {
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	const struct coda_codec *codec;
 	struct v4l2_format f_cap;
 	struct vb2_queue *dst_vq;
@@ -966,7 +966,7 @@ static int coda_s_fmt_vid_out(struct file *file, void *priv,
 static int coda_reqbufs(struct file *file, void *priv,
 			struct v4l2_requestbuffers *rb)
 {
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	int ret;
 
 	ret = v4l2_m2m_reqbufs(file, ctx->fh.m2m_ctx, rb);
@@ -986,7 +986,7 @@ static int coda_reqbufs(struct file *file, void *priv,
 static int coda_qbuf(struct file *file, void *priv,
 		     struct v4l2_buffer *buf)
 {
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 
 	if (ctx->inst_type == CODA_INST_DECODER &&
 	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
@@ -997,7 +997,7 @@ static int coda_qbuf(struct file *file, void *priv,
 
 static int coda_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 {
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	int ret;
 
 	ret = v4l2_m2m_dqbuf(file, ctx->fh.m2m_ctx, buf);
@@ -1025,7 +1025,7 @@ void coda_m2m_buf_done(struct coda_ctx *ctx, struct vb2_v4l2_buffer *buf,
 static int coda_g_selection(struct file *file, void *fh,
 			    struct v4l2_selection *s)
 {
-	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct coda_q_data *q_data;
 	struct v4l2_rect r, *rsel;
 
@@ -1071,7 +1071,7 @@ static int coda_g_selection(struct file *file, void *fh,
 static int coda_s_selection(struct file *file, void *fh,
 			    struct v4l2_selection *s)
 {
-	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct coda_q_data *q_data;
 
 	switch (s->target) {
@@ -1126,7 +1126,7 @@ static void coda_wake_up_capture_queue(struct coda_ctx *ctx)
 static int coda_encoder_cmd(struct file *file, void *fh,
 			    struct v4l2_encoder_cmd *ec)
 {
-	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct vb2_v4l2_buffer *buf;
 	int ret;
 
@@ -1207,7 +1207,7 @@ static bool coda_mark_last_dst_buf(struct coda_ctx *ctx)
 static int coda_decoder_cmd(struct file *file, void *fh,
 			    struct v4l2_decoder_cmd *dc)
 {
-	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct coda_dev *dev = ctx->dev;
 	struct vb2_v4l2_buffer *buf;
 	struct vb2_queue *dst_vq;
@@ -1286,7 +1286,7 @@ static int coda_decoder_cmd(struct file *file, void *fh,
 static int coda_enum_framesizes(struct file *file, void *fh,
 				struct v4l2_frmsizeenum *fsize)
 {
-	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct coda_q_data *q_data_dst;
 	const struct coda_codec *codec;
 
@@ -1319,7 +1319,7 @@ static int coda_enum_framesizes(struct file *file, void *fh,
 static int coda_enum_frameintervals(struct file *file, void *fh,
 				    struct v4l2_frmivalenum *f)
 {
-	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct coda_q_data *q_data;
 	const struct coda_codec *codec;
 
@@ -1358,7 +1358,7 @@ static int coda_enum_frameintervals(struct file *file, void *fh,
 
 static int coda_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 {
-	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct v4l2_fract *tpf;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
@@ -1441,7 +1441,7 @@ static uint32_t coda_timeperframe_to_frate(struct v4l2_fract *timeperframe)
 
 static int coda_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 {
-	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct v4l2_fract *tpf;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
-- 
Regards,

Laurent Pinchart


