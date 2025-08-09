Return-Path: <linux-media+bounces-39252-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5F3B1F6B2
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71ECF3B7B02
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC4F2C375E;
	Sat,  9 Aug 2025 21:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CtZvurcq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A6F27875C
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774335; cv=none; b=riXYt5kE6ArDDV7+hXioTk0XX2KMj9qUd33iN9Kw/ILuKa+FLPiyPV3tdRqLfdEd01+GzZQYgHotycB0SmaQSmqFMGl4aeTVvWKWPy3tv3NOtUHZl33XWOR6wovu+3AzGu1RQ1DgX9o1QD/Ay/PCqO0nDDwV26GSwjkPMNUaq+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774335; c=relaxed/simple;
	bh=Mxd2mSbeF4bs69HYy7o/QbBRt6eGtBubrq/fYOZXaVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aj+ybrlKq69B4YsWdTvRpEwDEoez6cOtGYs9w0PXQiz59XmcytLbdWWJK1YMVAg0DANueQ9rh+a5YUEWxQbYPeXDK6WXyFM/7dXF1FMz/6NeoVrymfThvl1vDnsogw3lVQcbANXei103rEpxJeFFuQcsBq8Rdbw2v0oYnf15fxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CtZvurcq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B91A6162B;
	Sat,  9 Aug 2025 23:17:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774275;
	bh=Mxd2mSbeF4bs69HYy7o/QbBRt6eGtBubrq/fYOZXaVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CtZvurcqwrNKYtTyjpXBysvAcwe87jUZKJjeCNG/Q6IOpUAGa0mWKUcSnztwQ6fPx
	 Ey20WP5ZEaUJqcPa6pTKeNPpFm9T4mCRtobGLtx047QWK1ZzdaoHzCLK4jsJ0FCgmw
	 3T2wL7eyil+SN5d06969Oi8DdyrXgdx4lPRtIRO0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 57/76] media: s5p-mfc: Store s5p_mfc_ctx in vb2_queue.drv_priv
Date: Sun, 10 Aug 2025 00:16:34 +0300
Message-ID: <20250809211654.28887-58-laurent.pinchart@ideasonboard.com>
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

The driver stores a pointer to a v4l2_fh in the vb2_queue.drv_priv,
which it then has to cast to a s5p_mfc_ctx pointer in all vb2 queue
operations. Store the pointer to the s5p_mfc_ctx instead to avoid the
cast. While at it, use the vb2_get_drv_priv() helper to access the
field.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c     |  4 ++--
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c | 10 +++++-----
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
index a5e756049620..4948d734eb02 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -876,7 +876,7 @@ static int s5p_mfc_open(struct file *file)
 	/* Init videobuf2 queue for CAPTURE */
 	q = &ctx->vq_dst;
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-	q->drv_priv = &ctx->fh;
+	q->drv_priv = ctx;
 	q->lock = &dev->mfc_mutex;
 	if (vdev == dev->vfd_dec) {
 		q->io_modes = VB2_MMAP;
@@ -903,7 +903,7 @@ static int s5p_mfc_open(struct file *file)
 	/* Init videobuf2 queue for OUTPUT */
 	q = &ctx->vq_src;
 	q->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
-	q->drv_priv = &ctx->fh;
+	q->drv_priv = ctx;
 	q->lock = &dev->mfc_mutex;
 	if (vdev == dev->vfd_dec) {
 		q->io_modes = VB2_MMAP;
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c
index 3efbc3367906..aefa6da5c609 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c
@@ -937,7 +937,7 @@ static int s5p_mfc_queue_setup(struct vb2_queue *vq,
 			unsigned int *plane_count, unsigned int psize[],
 			struct device *alloc_devs[])
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(vq->drv_priv);
+	struct s5p_mfc_ctx *ctx = vb2_get_drv_priv(vq);
 	struct s5p_mfc_dev *dev = ctx->dev;
 	const struct v4l2_format_info *format;
 
@@ -1006,7 +1006,7 @@ static int s5p_mfc_buf_init(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct vb2_queue *vq = vb->vb2_queue;
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(vq->drv_priv);
+	struct s5p_mfc_ctx *ctx = vb2_get_drv_priv(vq);
 	unsigned int i;
 
 	if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
@@ -1068,7 +1068,7 @@ static int s5p_mfc_buf_init(struct vb2_buffer *vb)
 
 static int s5p_mfc_start_streaming(struct vb2_queue *q, unsigned int count)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(q->drv_priv);
+	struct s5p_mfc_ctx *ctx = vb2_get_drv_priv(q);
 	struct s5p_mfc_dev *dev = ctx->dev;
 
 	v4l2_ctrl_handler_setup(&ctx->ctrl_handler);
@@ -1085,7 +1085,7 @@ static int s5p_mfc_start_streaming(struct vb2_queue *q, unsigned int count)
 static void s5p_mfc_stop_streaming(struct vb2_queue *q)
 {
 	unsigned long flags;
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(q->drv_priv);
+	struct s5p_mfc_ctx *ctx = vb2_get_drv_priv(q);
 	struct s5p_mfc_dev *dev = ctx->dev;
 	int aborted = 0;
 
@@ -1130,7 +1130,7 @@ static void s5p_mfc_stop_streaming(struct vb2_queue *q)
 static void s5p_mfc_buf_queue(struct vb2_buffer *vb)
 {
 	struct vb2_queue *vq = vb->vb2_queue;
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(vq->drv_priv);
+	struct s5p_mfc_ctx *ctx = vb2_get_drv_priv(vq);
 	struct s5p_mfc_dev *dev = ctx->dev;
 	unsigned long flags;
 	struct s5p_mfc_buf *mfc_buf;
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
index 6c603dcd5664..9b77dbd856e7 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
@@ -2418,7 +2418,7 @@ static int s5p_mfc_queue_setup(struct vb2_queue *vq,
 			unsigned int *buf_count, unsigned int *plane_count,
 			unsigned int psize[], struct device *alloc_devs[])
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(vq->drv_priv);
+	struct s5p_mfc_ctx *ctx = vb2_get_drv_priv(vq);
 	struct s5p_mfc_dev *dev = ctx->dev;
 
 	if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
@@ -2477,7 +2477,7 @@ static int s5p_mfc_buf_init(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct vb2_queue *vq = vb->vb2_queue;
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(vq->drv_priv);
+	struct s5p_mfc_ctx *ctx = vb2_get_drv_priv(vq);
 	unsigned int i;
 	int ret;
 
@@ -2516,7 +2516,7 @@ static int s5p_mfc_buf_init(struct vb2_buffer *vb)
 static int s5p_mfc_buf_prepare(struct vb2_buffer *vb)
 {
 	struct vb2_queue *vq = vb->vb2_queue;
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(vq->drv_priv);
+	struct s5p_mfc_ctx *ctx = vb2_get_drv_priv(vq);
 	int ret;
 
 	if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
@@ -2557,7 +2557,7 @@ static int s5p_mfc_buf_prepare(struct vb2_buffer *vb)
 
 static int s5p_mfc_start_streaming(struct vb2_queue *q, unsigned int count)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(q->drv_priv);
+	struct s5p_mfc_ctx *ctx = vb2_get_drv_priv(q);
 	struct s5p_mfc_dev *dev = ctx->dev;
 
 	if (IS_MFCV6_PLUS(dev) &&
@@ -2588,7 +2588,7 @@ static int s5p_mfc_start_streaming(struct vb2_queue *q, unsigned int count)
 static void s5p_mfc_stop_streaming(struct vb2_queue *q)
 {
 	unsigned long flags;
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(q->drv_priv);
+	struct s5p_mfc_ctx *ctx = vb2_get_drv_priv(q);
 	struct s5p_mfc_dev *dev = ctx->dev;
 
 	if ((ctx->state == MFCINST_FINISHING ||
@@ -2617,7 +2617,7 @@ static void s5p_mfc_stop_streaming(struct vb2_queue *q)
 static void s5p_mfc_buf_queue(struct vb2_buffer *vb)
 {
 	struct vb2_queue *vq = vb->vb2_queue;
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(vq->drv_priv);
+	struct s5p_mfc_ctx *ctx = vb2_get_drv_priv(vq);
 	struct s5p_mfc_dev *dev = ctx->dev;
 	unsigned long flags;
 	struct s5p_mfc_buf *mfc_buf;
-- 
Regards,

Laurent Pinchart


