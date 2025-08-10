Return-Path: <linux-media+bounces-39330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 782DDB1F7E0
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B8DB17CD01
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977F71C860C;
	Sun, 10 Aug 2025 01:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g29x3np3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75488202C30
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789579; cv=none; b=qy/+lcor2vgpTNSZCMP7lr7APTwWHCdAR5n0c3gLQsVBcDH/G2ef/Hxg71TTmNuwDZ+3Avnl8sya3trj/zM1/y5iRE0Ibt1ET3s+tgU+h06oi73gbhk5VKA7uF4mqCoVtEJ5GSxcCDP87l4eZuCI9usrv5/sXxU2SP3BaVlKEj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789579; c=relaxed/simple;
	bh=QwRGZ/Pi2MaQpi0no0sbMn5zIZOMJ0XolwJSE9V9Yh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=teG+t10/i9hODEqWovD4OGj5CA316+DRctUjmpqY9wOgwc/EFkoG4zbiZFFyHUAFApns67F8a9XnAxscpbIr17HIQIywSzaKkF25yuxrBUL9Z7Ud72WweLwVBymuyLuD34MZ+j9UyoowFZKP0RAV0fQh4PRfY5Vzx7bNm9TerwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g29x3np3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D126818B9;
	Sun, 10 Aug 2025 03:32:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789525;
	bh=QwRGZ/Pi2MaQpi0no0sbMn5zIZOMJ0XolwJSE9V9Yh0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g29x3np3hw7voCROFMH0afuZA1lBKmEpj+FThpQsWn8DiV5nXhbxfwLAsycDgAqB2
	 ztk2bYy5S4k+sOJvbgCmK3J5J1kefAzhR/8PnWbjuk/zUY0hZSoa68qWTgIgQ74kLZ
	 IBne+7azupelXEYUrLZ6+C5+puFmpAIEqc2NXzlU=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 57/76] media: s5p-mfc: Store s5p_mfc_ctx in vb2_queue.drv_priv
Date: Sun, 10 Aug 2025 04:30:39 +0300
Message-ID: <20250810013100.29776-58-laurent.pinchart+renesas@ideasonboard.com>
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


