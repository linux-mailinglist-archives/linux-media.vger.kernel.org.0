Return-Path: <linux-media+bounces-39274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4665BB1F780
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 299967AB8FF
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75516F06B;
	Sun, 10 Aug 2025 01:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Dn955cAE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7B3101DE
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789484; cv=none; b=Ig14y5NAgpjJGfMFHcKcuwAvjA2le/dPvRXF+NHOk6XaWcO64Nv25altHsI3bf3fpOk6ucm6ZroRJlC4A7r4U9hnxCNb/2VOrK/gsCm68qfl3z/2dDiYy/uSbo9H9Vv/4xUaL/RAMdTh+RIHUtX1cRhlHflfyWS07bsTSkDMWxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789484; c=relaxed/simple;
	bh=0+kGeksupU8zaRLvgOmn+yQqOrStzEsZvuXb6J642y4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oOrWcHcoFy8g8El8VxkUb+dLPc2i1g2+DIB0HylHgoP5zXUdSnQSmr8n+uvfEq/7aZkQm8eqO8HZzL0iqpddYG7sGw1tvPEYoCYutwm5SZqCqV28DJ/vCmwibV6yx6246PKkRQv+WYW3ymXEeAQRaIP4xmCBSmeYnPt5EkDkzAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Dn955cAE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 47E3099F;
	Sun, 10 Aug 2025 03:30:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789430;
	bh=0+kGeksupU8zaRLvgOmn+yQqOrStzEsZvuXb6J642y4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dn955cAEqneQwMKfwBFXx5cEqjtuNYM17vI4P2eaSmgcXpuMAoqKpNz1ojcMqCOtC
	 RbRYK4eWqFF7v6cRhi/8hGpMwcQmY6iGgKHjerY7L9E9yJjf7/P6bSyVnwk8BJ+tKe
	 dqDr3gB4M6DjIDV2oASEFijP8HvaXMsV0s3w/y5A=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Devarsh Thakkar <devarsht@ti.com>
Subject: [PATCH v3 02/76] media: imagination: Store v4l2_fh pointer in file->private_data
Date: Sun, 10 Aug 2025 04:29:44 +0300
Message-ID: <20250810013100.29776-3-laurent.pinchart+renesas@ideasonboard.com>
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

Most V4L2 drivers store the v4l2_fh pointer in file->private_data. The
e5010-jpeg-enc driver instead stores the pointer to the driver-specific
structure that embeds the v4l2_fh. Switch to storing the v4l2_fh pointer
itself to standardize behaviour across drivers. This also prepares for
future refactoring that depends on v4l2_fh being stored in private_data.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../platform/imagination/e5010-jpeg-enc.c      | 18 +++++++++---------
 .../platform/imagination/e5010-jpeg-enc.h      |  5 +++++
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index ae868d9f73e1..295461325862 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -253,7 +253,7 @@ static int e5010_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f)
 {
 	int i, index = 0;
 	struct e5010_fmt *fmt = NULL;
-	struct e5010_context *ctx = file->private_data;
+	struct e5010_context *ctx = to_e5010_context(file);
 
 	if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
 		v4l2_err(&ctx->e5010->v4l2_dev, "ENUMFMT with Invalid type: %d\n", f->type);
@@ -279,7 +279,7 @@ static int e5010_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f)
 
 static int e5010_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct e5010_context *ctx = file->private_data;
+	struct e5010_context *ctx = to_e5010_context(file);
 	struct e5010_q_data *queue;
 	int i;
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
@@ -380,14 +380,14 @@ static int e5010_jpeg_try_fmt(struct v4l2_format *f, struct e5010_context *ctx)
 
 static int e5010_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct e5010_context *ctx = file->private_data;
+	struct e5010_context *ctx = to_e5010_context(file);
 
 	return e5010_jpeg_try_fmt(f, ctx);
 }
 
 static int e5010_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct e5010_context *ctx = file->private_data;
+	struct e5010_context *ctx = to_e5010_context(file);
 	struct vb2_queue *vq;
 	int ret = 0, i = 0;
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
@@ -462,7 +462,7 @@ static int e5010_enum_framesizes(struct file *file, void *priv, struct v4l2_frms
 
 static int e5010_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
 {
-	struct e5010_context *ctx = file->private_data;
+	struct e5010_context *ctx = to_e5010_context(file);
 	struct e5010_q_data *queue;
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
@@ -490,7 +490,7 @@ static int e5010_g_selection(struct file *file, void *fh, struct v4l2_selection
 
 static int e5010_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
 {
-	struct e5010_context *ctx = file->private_data;
+	struct e5010_context *ctx = to_e5010_context(file);
 	struct e5010_q_data *queue;
 	struct vb2_queue *vq;
 	struct v4l2_rect base_rect;
@@ -742,7 +742,7 @@ static int e5010_open(struct file *file)
 	}
 
 	v4l2_fh_init(&ctx->fh, vdev);
-	file->private_data = ctx;
+	file->private_data = &ctx->fh;
 	v4l2_fh_add(&ctx->fh);
 
 	ctx->e5010 = e5010;
@@ -781,7 +781,7 @@ static int e5010_open(struct file *file)
 static int e5010_release(struct file *file)
 {
 	struct e5010_dev *e5010 = video_drvdata(file);
-	struct e5010_context *ctx = file->private_data;
+	struct e5010_context *ctx = to_e5010_context(file);
 
 	dprintk(e5010, 1, "Releasing instance: 0x%p, m2m_ctx: 0x%p\n", ctx, ctx->fh.m2m_ctx);
 	mutex_lock(&e5010->mutex);
@@ -1262,7 +1262,7 @@ static void e5010_buf_queue(struct vb2_buffer *vb)
 static int e5010_encoder_cmd(struct file *file, void *priv,
 			     struct v4l2_encoder_cmd *cmd)
 {
-	struct e5010_context *ctx = file->private_data;
+	struct e5010_context *ctx = to_e5010_context(file);
 	int ret;
 	struct vb2_queue *cap_vq;
 
diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.h b/drivers/media/platform/imagination/e5010-jpeg-enc.h
index 71f49ead6898..eefaf60489d3 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.h
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.h
@@ -120,6 +120,11 @@ struct e5010_context {
 	u8				chroma_qp[QP_TABLE_SIZE];
 };
 
+static inline struct e5010_context *to_e5010_context(struct file *filp)
+{
+	return container_of(filp->private_data, struct e5010_context, fh);
+}
+
 /*
  * Buffer structure
  * Contains info for all buffers
-- 
Regards,

Laurent Pinchart


