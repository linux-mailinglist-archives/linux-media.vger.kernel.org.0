Return-Path: <linux-media+bounces-21291-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2962C9C521A
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 10:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDAD92877A8
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 09:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100DD20E305;
	Tue, 12 Nov 2024 09:33:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39401ABEC2
	for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 09:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731404006; cv=none; b=a8aGnTVR1A0msB7CbGrKtdiiopAmumgzrC7Wp6yC/M+JUKIx/BnMPWeuS3nrwd6fE8h+qRktj1LHikN3Pt4bZqD6/FSkfalsENgkgeTdinBIdBwlNKfaUzWPspsmZoguIQiC1KVGT6YMVttMAMCbFmrnPmDmGuK1kmY39wUbUB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731404006; c=relaxed/simple;
	bh=eM3wLJuqiGW5HRxK2UO25OQXbgKjow6coDleXOYYOpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LjoGM7ZfAwrbsQlbWvzQpoH8gaIxdzL6VHSwgu/tTd88xHQIuFRk3mmP/Z2QAPrX6hHpC1MzqMmI8+nnAy87D9rLbUBpE9ctQr8jV9y7WFTCjtaQezfTA93AQDFspvFBOznuMCT3YDEDqY7ZlYR2q5FugrcZ1BRspm6MqFUuH1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59EC1C4CECD;
	Tue, 12 Nov 2024 09:33:25 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [RFC PATCHv2 3/5] media: vb2: rename min_reqbufs_allocation to rec_num_buffers
Date: Tue, 12 Nov 2024 10:22:14 +0100
Message-ID: <fd89bd456162420ee67b89ca62eb59d3238dacfc.1731403336.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1731403336.git.hverkuil@xs4all.nl>
References: <cover.1731403336.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The name 'rec_num_buffers' matches what struct v4l2_create_buffers uses,
and 'recommended number of buffers' is a much more descriptive name.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/common/videobuf2/videobuf2-core.c   | 14 +++++++-------
 drivers/media/common/videobuf2/videobuf2-v4l2.c   |  2 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c |  4 ++--
 drivers/media/test-drivers/vimc/vimc-capture.c    |  2 +-
 drivers/media/test-drivers/vivid/vivid-core.c     |  4 ++--
 include/media/videobuf2-core.h                    | 12 +++++++-----
 6 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index c0cc441b5164..4b55280dc8b8 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -923,7 +923,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	/*
 	 * Make sure the requested values and current defaults are sane.
 	 */
-	num_buffers = max_t(unsigned int, *count, q->min_reqbufs_allocation);
+	num_buffers = max_t(unsigned int, *count, q->rec_num_buffers);
 	num_buffers = min_t(unsigned int, num_buffers, q->max_num_buffers);
 	memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
 	/*
@@ -974,7 +974,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	 * There is no point in continuing if we can't allocate the minimum
 	 * number of buffers needed by this vb2_queue.
 	 */
-	if (allocated_buffers < q->min_reqbufs_allocation)
+	if (allocated_buffers < q->rec_num_buffers)
 		ret = -ENOMEM;
 
 	/*
@@ -2647,10 +2647,10 @@ int vb2_core_queue_init(struct vb2_queue *q)
 	 * 'min_queued_buffers + 1' to keep at least one buffer available
 	 * for userspace.
 	 */
-	if (q->min_reqbufs_allocation < q->min_queued_buffers + 1)
-		q->min_reqbufs_allocation = q->min_queued_buffers + 1;
+	if (q->rec_num_buffers < q->min_queued_buffers + 1)
+		q->rec_num_buffers = q->min_queued_buffers + 1;
 
-	if (WARN_ON(q->min_reqbufs_allocation > q->max_num_buffers))
+	if (WARN_ON(q->rec_num_buffers > q->max_num_buffers))
 		return -EINVAL;
 
 	/* Either both or none are set */
@@ -2874,7 +2874,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 		return -EBUSY;
 
 	dprintk(q, 3, "setting up file io: mode %s, count %d, read_once %d, write_immediately %d\n",
-		(read) ? "read" : "write", q->min_reqbufs_allocation, q->fileio_read_once,
+		(read) ? "read" : "write", q->rec_num_buffers, q->fileio_read_once,
 		q->fileio_write_immediately);
 
 	fileio = kzalloc(sizeof(*fileio), GFP_KERNEL);
@@ -2888,7 +2888,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 	 * Request buffers and use MMAP type to force driver
 	 * to allocate buffers by itself.
 	 */
-	fileio->count = q->min_reqbufs_allocation;
+	fileio->count = q->rec_num_buffers;
 	fileio->memory = VB2_MEMORY_MMAP;
 	fileio->type = q->type;
 	q->fileio = fileio;
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 15394bb4168c..f4fdc5d77d9c 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -705,7 +705,7 @@ static void vb2_set_flags_and_caps(struct vb2_queue *q, u32 memory,
 	}
 	if (min_num_bufs && rec_num_bufs) {
 		*min_num_bufs = q->min_queued_buffers + 1;
-		*rec_num_bufs = q->min_reqbufs_allocation;
+		*rec_num_bufs = q->rec_num_buffers;
 		*caps |= V4L2_BUF_CAP_SUPPORTS_MIN_REC_NUM_BUFFERS;
 	}
 }
diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index c45f5cf12ded..7e0b76606c8b 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -1709,7 +1709,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	if (ctx->is_enc) {
 		src_vq->lock = &ctx->dev->stateful_enc.mutex;
-		src_vq->min_reqbufs_allocation = VICODEC_REC_BUFS;
+		src_vq->rec_num_buffers = VICODEC_REC_BUFS;
 	} else if (ctx->is_stateless) {
 		src_vq->lock = &ctx->dev->stateless_dec.mutex;
 	} else {
@@ -1733,7 +1733,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->lock = src_vq->lock;
 	if (!ctx->is_stateless && !ctx->is_enc)
-		dst_vq->min_reqbufs_allocation = VICODEC_REC_BUFS;
+		dst_vq->rec_num_buffers = VICODEC_REC_BUFS;
 
 	return vb2_queue_init(dst_vq);
 }
diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index 10df039278e7..1a1ca1d67fe6 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -427,7 +427,7 @@ static struct vimc_ent_device *vimc_capture_add(struct vimc_device *vimc,
 	q->mem_ops = vimc_allocator == VIMC_ALLOCATOR_DMA_CONTIG
 		   ? &vb2_dma_contig_memops : &vb2_vmalloc_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->min_reqbufs_allocation = 2;
+	q->rec_num_buffers = 2;
 	q->lock = &vcapture->lock;
 	q->dev = v4l2_dev->dev;
 
diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 7477ac8cb955..46ac3fd6e5dd 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -887,7 +887,7 @@ static const struct media_device_ops vivid_media_ops = {
 static int vivid_create_queue(struct vivid_dev *dev,
 			      struct vb2_queue *q,
 			      u32 buf_type,
-			      unsigned int min_reqbufs_allocation,
+			      unsigned int rec_num_buffers,
 			      const struct vb2_ops *ops)
 {
 	if (buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE && dev->multiplanar)
@@ -924,7 +924,7 @@ static int vivid_create_queue(struct vivid_dev *dev,
 	q->mem_ops = allocators[dev->inst] == 1 ? &vb2_dma_contig_memops :
 						  &vb2_vmalloc_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->min_reqbufs_allocation = min_reqbufs_allocation;
+	q->rec_num_buffers = rec_num_buffers;
 	q->lock = &dev->mutex;
 	q->dev = dev->v4l2_dev.dev;
 	q->supports_requests = supports_requests[dev->inst];
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 9b02aeba4108..3282b55179a5 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -555,14 +555,16 @@ struct vb2_buf_ops {
  *		VIDIOC_REQBUFS will ensure at least @min_queued_buffers + 1
  *		buffers will be allocated. Note that VIDIOC_CREATE_BUFS will not
  *		modify the requested buffer count.
- * @min_reqbufs_allocation: the minimum number of buffers to be allocated when
- *		calling VIDIOC_REQBUFS. Note that VIDIOC_CREATE_BUFS will *not*
- *		modify the requested buffer count and does not use this field.
+ * @rec_num_buffers: the recommended number of buffers to allocate for this
+ *		queue. This value is used when calling VIDIOC_REQBUFS: it will
+ *		allocate at least this many buffersa
+ *		Note that VIDIOC_CREATE_BUFS will *not* modify the requested
+ *		buffer count and it does not use this field.
  *		Drivers can set this if there has to be a certain number of
  *		buffers available for the hardware to work effectively.
  *		This allows calling VIDIOC_REQBUFS with a buffer count of 1 and
  *		it will be automatically adjusted to a workable	buffer count.
- *		If set, then @min_reqbufs_allocation must be larger than
+ *		If set, then @rec_num_buffers must be larger than
  *		@min_queued_buffers + 1.
  *		If this field is > 3, then it is highly recommended that the
  *		driver implements the V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT
@@ -638,7 +640,7 @@ struct vb2_queue {
 	u32				timestamp_flags;
 	gfp_t				gfp_flags;
 	u32				min_queued_buffers;
-	u32				min_reqbufs_allocation;
+	u32				rec_num_buffers;
 
 	struct device			*alloc_devs[VB2_MAX_PLANES];
 
-- 
2.45.2


