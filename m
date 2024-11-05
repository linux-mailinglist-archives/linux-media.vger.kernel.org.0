Return-Path: <linux-media+bounces-20885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7119BC7AB
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 09:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90EBF1F22D40
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744BD1FEFCD;
	Tue,  5 Nov 2024 08:08:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7721FEFA2
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 08:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730794087; cv=none; b=Q2KIiUZwtK2cMprjEFe/YTp6aBpMOcUI4wnT4KKuUfvbgekFdO1/GoD89uV8Mfraq6S/EPfzoaitABN/qRXyFi/raFFOMBnIvJswyxly7Y24udiN4l1oIKzGemLCO8Ollwwxrr/QKmPGxqNfBd1LgvrMo+vDhGIAzrFiia/ijUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730794087; c=relaxed/simple;
	bh=k1l1YNF6mr9349s8xmIxtextpKbxQiyxO7IIb2UGWYo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=kyAyQ7AyvQhCqiWYD64F39eck57btuoijSbFMSsS5nYGMpreBcPdEcfbygKw/wP1uvFCWsmX/nH7MvAdQGc2wYo2e86zUL8dVyKiz1r0XENPWbMFU28l6R5tvIwnr0BxgjHU+2F0nl5hnYVjZjNo4Ec2yuP0ZnbW5X655tdn9lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B33AC4CECF
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 08:08:06 +0000 (UTC)
Message-ID: <bba26f7c-2a36-4e93-b292-59484dd2ed98@xs4all.nl>
Date: Tue, 5 Nov 2024 09:08:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [RFC PATCH] media: vb2: rename min_reqbufs_allocation to
 rec_num_buffers
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The name 'rec_num_buffers' matches what struct v4l2_create_buffers uses,
and 'recommended number of buffers' is a much more descriptive name.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
This patch sits on top of:
https://patchwork.linuxtv.org/project/linux-media/patch/3c0362e5-aa47-4545-a81e-e696b0e01440@xs4all.nl/
and:
https://patchwork.linuxtv.org/project/linux-media/patch/6b303108-6ab6-43c9-9c7b-7776ef64fb06@xs4all.nl/

I think it makes sense to rename min_reqbufs_allocation to rec_num_buffers,
it is a much better name IMHO.

I considered also renaming min_queued_buffers to min_num_buffers, but
I decided against that. In the context of vb2 'min_queued_buffers' is
more specific: it is the minimum number of queued buffers needed before
start_streaming() can be called.
---
 drivers/media/common/videobuf2/videobuf2-core.c   | 14 +++++++-------
 drivers/media/common/videobuf2/videobuf2-v4l2.c   |  2 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c |  4 ++--
 drivers/media/test-drivers/vimc/vimc-capture.c    |  2 +-
 drivers/media/test-drivers/vivid/vivid-core.c     |  4 ++--
 include/media/videobuf2-core.h                    | 12 +++++++-----
 6 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 3a7303a72202..9c09798bcbf5 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -925,7 +925,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	/*
 	 * Make sure the requested values and current defaults are sane.
 	 */
-	num_buffers = max_t(unsigned int, *count, q->min_reqbufs_allocation);
+	num_buffers = max_t(unsigned int, *count, q->rec_num_buffers);
 	num_buffers = min_t(unsigned int, num_buffers, q->max_num_buffers);
 	memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
 	/*
@@ -982,7 +982,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	 * There is no point in continuing if we can't allocate the minimum
 	 * number of buffers needed by this vb2_queue.
 	 */
-	if (allocated_buffers < q->min_reqbufs_allocation)
+	if (allocated_buffers < q->rec_num_buffers)
 		ret = -ENOMEM;

 	/*
@@ -2683,10 +2683,10 @@ int vb2_core_queue_init(struct vb2_queue *q)
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
@@ -2910,7 +2910,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 		return -EBUSY;

 	dprintk(q, 3, "setting up file io: mode %s, count %d, read_once %d, write_immediately %d\n",
-		(read) ? "read" : "write", q->min_reqbufs_allocation, q->fileio_read_once,
+		(read) ? "read" : "write", q->rec_num_buffers, q->fileio_read_once,
 		q->fileio_write_immediately);

 	fileio = kzalloc(sizeof(*fileio), GFP_KERNEL);
@@ -2924,7 +2924,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
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
index 556ec2a3d411..230ba1925cb2 100644
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
index 8d8f60e15d1d..1cda7f5a65ee 100644
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
index 34b6fd6585b9..89b7600e4cf6 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -564,14 +564,16 @@ struct vb2_buf_ops {
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
@@ -647,7 +649,7 @@ struct vb2_queue {
 	u32				timestamp_flags;
 	gfp_t				gfp_flags;
 	u32				min_queued_buffers;
-	u32				min_reqbufs_allocation;
+	u32				rec_num_buffers;

 	struct device			*alloc_devs[VB2_MAX_PLANES];

-- 
2.45.2


