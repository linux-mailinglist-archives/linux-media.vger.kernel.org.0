Return-Path: <linux-media+bounces-1159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3A47FA755
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:58:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88021B218A0
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD703A8F4;
	Mon, 27 Nov 2023 16:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JKdid/dB"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C56E30CF;
	Mon, 27 Nov 2023 08:55:49 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9C2C3660742F;
	Mon, 27 Nov 2023 16:55:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104148;
	bh=QEqxRu1mY/zwGiIOPG4lnpEEGA62Ed1wsxCNtfbcpMs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JKdid/dBmjepTqfqXAYuEvFP40WvHnDGxQJsBMAFXpFVvXjyUI8VOCMePr0y7sr+s
	 n5LH+erX1s5o7qh9DIzZo4AEW/Z20iMI3DaYIZai5jliY6awbDoxbiqJ6veUsW7L3B
	 EcmzTRr97d6HGFq8WG/Z6PrOX/OauRbv45dy7O9PUIPLOCRYu/poZ3+GsNQuHy6ehN
	 /kuNyFjNJKGchrc3L7T6bOmIc0K6WKefJN3UrNJo4qH1Z3ONR7xj+teQJJw3QMEBsg
	 ldHtL8jWHGja2FLxrDM5cEjeGt/gtUx+RubGF1ujSSnaz3d6UZ5CMbzXxbnBX3YV8O
	 K4G/jYILNkZlQ==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	matt.ranostay@konsulko.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH 55/55] media: videobuf2: core: Remove 'min_buffers_needed' field
Date: Mon, 27 Nov 2023 17:54:54 +0100
Message-Id: <20231127165454.166373-56-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
References: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After clean up all the drivers it is possible to remove this
field from vb2_queue structure. It has been replace by
'min_dma_buffers_needed' which indicates how many buffers
a dma engine needs before start streaming and 'min_reqbufs_allocation'
to let drivers specify the minimum number of buffers to be
allocated when calling VIDIO_REQBUFS

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/common/videobuf2/videobuf2-core.c   | 25 ++++++-------------
 include/media/videobuf2-core.h                |  5 ----
 2 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index a6ec55db8635..223521cc135d 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -865,11 +865,10 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	/*
 	 * Make sure the requested values and current defaults are sane.
 	 */
-	num_buffers = max_t(unsigned int, *count, q->min_buffers_needed);
 	if (q->min_reqbufs_allocation)
-		num_buffers = max_t(unsigned int, num_buffers, q->min_reqbufs_allocation);
+		num_buffers = max_t(unsigned int, *count, q->min_reqbufs_allocation);
 	else
-		num_buffers = max_t(unsigned int, num_buffers, q->min_dma_buffers_needed + 1);
+		num_buffers = max_t(unsigned int, *count, q->min_dma_buffers_needed + 1);
 	min_reqbufs_needed = num_buffers;
 	num_buffers = min_t(unsigned int, num_buffers, q->max_num_buffers);
 	memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
@@ -1851,8 +1850,7 @@ int vb2_core_qbuf(struct vb2_queue *q, struct vb2_buffer *vb, void *pb,
 	 * then we can finally call start_streaming().
 	 */
 	if (q->streaming && !q->start_streaming_called &&
-	    ((q->queued_count >= q->min_buffers_needed) ||
-	    (q->queued_count >= q->min_dma_buffers_needed))) {
+	    q->queued_count >= q->min_dma_buffers_needed) {
 		ret = vb2_start_streaming(q);
 		if (ret) {
 			/*
@@ -2216,12 +2214,6 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type)
 		return -EINVAL;
 	}
 
-	if (q_num_bufs < q->min_buffers_needed) {
-		dprintk(q, 1, "need at least %u allocated buffers\n",
-				q->min_buffers_needed);
-		return -EINVAL;
-	}
-
 	if (q_num_bufs < q->min_dma_buffers_needed) {
 		dprintk(q, 1, "need at least %u allocated buffers\n",
 			q->min_dma_buffers_needed);
@@ -2236,8 +2228,7 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type)
 	 * Tell driver to start streaming provided sufficient buffers
 	 * are available.
 	 */
-	if (q->queued_count >= q->min_buffers_needed &&
-	    q->queued_count >= q->min_dma_buffers_needed) {
+	if (q->queued_count >= q->min_dma_buffers_needed) {
 		ret = vb2_start_streaming(q);
 		if (ret)
 			goto unprepare;
@@ -2517,8 +2508,7 @@ int vb2_core_queue_init(struct vb2_queue *q)
 		return -EINVAL;
 
 	if (WARN_ON(q->max_num_buffers > MAX_BUFFER_INDEX) ||
-	    WARN_ON(q->min_dma_buffers_needed > q->max_num_buffers) ||
-	    WARN_ON(q->min_buffers_needed > q->max_num_buffers))
+	    WARN_ON(q->min_dma_buffers_needed > q->max_num_buffers))
 		return -EINVAL;
 
 	if (WARN_ON(q->requires_requests && !q->supports_requests))
@@ -2526,14 +2516,13 @@ int vb2_core_queue_init(struct vb2_queue *q)
 
 	/*
 	 * This combination is not allowed since a non-zero value of
-	 * q->min_buffers_needed can cause vb2_core_qbuf() to fail if
+	 * q->min_dma_buffers_needed can cause vb2_core_qbuf() to fail if
 	 * it has to call start_streaming(), and the Request API expects
 	 * that queueing a request (and thus queueing a buffer contained
 	 * in that request) will always succeed. There is no method of
 	 * propagating an error back to userspace.
 	 */
-	if (WARN_ON(q->supports_requests &&
-		    (q->min_buffers_needed || q->min_dma_buffers_needed)))
+	if (WARN_ON(q->supports_requests && q->min_dma_buffers_needed))
 		return -EINVAL;
 
 	INIT_LIST_HEAD(&q->queued_list);
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 0bc97f28a7ea..353dccee7a30 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -546,10 +546,6 @@ struct vb2_buf_ops {
  * @gfp_flags:	additional gfp flags used when allocating the buffers.
  *		Typically this is 0, but it may be e.g. %GFP_DMA or %__GFP_DMA32
  *		to force the buffer allocation to a specific memory zone.
- * @min_buffers_needed: the minimum number of buffers needed before
- *		@start_streaming can be called. Used when a DMA engine
- *		cannot be started unless at least this number of buffers
- *		have been queued into the driver. (Deprecated)
  * @min_dma_buffers_needed: the minimum number of buffers needed before
  *		@start_streaming can be called. Used when a DMA engine
  *		cannot be started unless at least this number of buffers
@@ -623,7 +619,6 @@ struct vb2_queue {
 	unsigned int			buf_struct_size;
 	u32				timestamp_flags;
 	gfp_t				gfp_flags;
-	u32				min_buffers_needed;
 	u32				min_dma_buffers_needed;
 	u32				min_reqbufs_allocation;
 
-- 
2.39.2


