Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E873F7E6EDC
	for <lists+linux-media@lfdr.de>; Thu,  9 Nov 2023 17:33:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344205AbjKIQdB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Nov 2023 11:33:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343910AbjKIQcs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Nov 2023 11:32:48 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB45B35B3;
        Thu,  9 Nov 2023 08:32:42 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id BAE5A66076A5;
        Thu,  9 Nov 2023 16:32:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1699547561;
        bh=g0dyF+ycz2GdAEZt3jkhDNKqpTl9v7x2nwR0T9Ed9qU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dnGRyHHBFBcoJtkPysfS8CcNJwtONeao9n9wsBmg1CjMFkkP14sUrMocf09SFyQUu
         EQ8KrcacKAcAjqR3fyqTYxVT/mI990/ZSITdQkcrd7Yuwv7m8nNo0QRFXmYmcWSZC1
         R1sXdAmEh7lZtu2l8SKj4XhUKmo33uyh4Gq3BV3LqRGWywCbuwwMe8R3tdMuJ2O1UR
         2ZaSKxtS0PwiTG6fNU50tGPUCspXOtAoR3UHvOjvl+0xqKvRnChtmI+TQCLbZjfCQa
         TUd8AySyWLr2Jn5Wvgz/oQjT6rUVnyCBh9MHJ/5Ijmm2jH5OgzvWla5Rpsgbtakixh
         ZdVZqx41etKkg==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
        ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v15 08/56] media: videobuf2: Use vb2_get_num_buffers() helper
Date:   Thu,  9 Nov 2023 17:29:20 +0100
Message-Id: <20231109163008.179152-9-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231109163008.179152-1-benjamin.gaignard@collabora.com>
References: <20231109163008.179152-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Stop using queue num_buffers field directly, instead use
vb2_get_num_buffers().
This prepares for the future 'delete buffers' feature where there are
holes in the buffer indices.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
version 15:
- Use vb2_get_num_buffers() in __vb2_perform_fileio() intead of testing
  bitmap bits.

 .../media/common/videobuf2/videobuf2-core.c   | 94 ++++++++++---------
 .../media/common/videobuf2/videobuf2-v4l2.c   |  4 +-
 2 files changed, 52 insertions(+), 46 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 0024b82663d4..ce5b84b9bcd4 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -449,13 +449,14 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 			     unsigned int num_buffers, unsigned int num_planes,
 			     const unsigned plane_sizes[VB2_MAX_PLANES])
 {
+	unsigned int q_num_buffers = vb2_get_num_buffers(q);
 	unsigned int buffer, plane;
 	struct vb2_buffer *vb;
 	int ret;
 
 	/* Ensure that q->num_buffers+num_buffers is below VB2_MAX_FRAME */
 	num_buffers = min_t(unsigned int, num_buffers,
-			    VB2_MAX_FRAME - q->num_buffers);
+			    VB2_MAX_FRAME - q_num_buffers);
 
 	for (buffer = 0; buffer < num_buffers; ++buffer) {
 		/* Allocate vb2 buffer structures */
@@ -475,7 +476,7 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 			vb->planes[plane].min_length = plane_sizes[plane];
 		}
 
-		vb2_queue_add_buffer(q, vb, q->num_buffers + buffer);
+		vb2_queue_add_buffer(q, vb, q_num_buffers + buffer);
 		call_void_bufop(q, init_buffer, vb);
 
 		/* Allocate video buffer memory for the MMAP type */
@@ -519,8 +520,9 @@ static void __vb2_free_mem(struct vb2_queue *q, unsigned int buffers)
 {
 	unsigned int buffer;
 	struct vb2_buffer *vb;
+	unsigned int q_num_buffers = vb2_get_num_buffers(q);
 
-	for (buffer = q->num_buffers - buffers; buffer < q->num_buffers;
+	for (buffer = q_num_buffers - buffers; buffer < q_num_buffers;
 	     ++buffer) {
 		vb = vb2_get_buffer(q, buffer);
 		if (!vb)
@@ -544,11 +546,12 @@ static void __vb2_free_mem(struct vb2_queue *q, unsigned int buffers)
 static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
 {
 	unsigned int buffer;
+	unsigned int q_num_buffers = vb2_get_num_buffers(q);
 
 	lockdep_assert_held(&q->mmap_lock);
 
 	/* Call driver-provided cleanup function for each buffer, if provided */
-	for (buffer = q->num_buffers - buffers; buffer < q->num_buffers;
+	for (buffer = q_num_buffers - buffers; buffer < q_num_buffers;
 	     ++buffer) {
 		struct vb2_buffer *vb = vb2_get_buffer(q, buffer);
 
@@ -564,7 +567,7 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
 	 * Check that all the calls were balanced during the life-time of this
 	 * queue. If not then dump the counters to the kernel log.
 	 */
-	if (q->num_buffers) {
+	if (q_num_buffers) {
 		bool unbalanced = q->cnt_start_streaming != q->cnt_stop_streaming ||
 				  q->cnt_prepare_streaming != q->cnt_unprepare_streaming ||
 				  q->cnt_wait_prepare != q->cnt_wait_finish;
@@ -590,7 +593,7 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
 		q->cnt_stop_streaming = 0;
 		q->cnt_unprepare_streaming = 0;
 	}
-	for (buffer = 0; buffer < q->num_buffers; ++buffer) {
+	for (buffer = 0; buffer < vb2_get_num_buffers(q); buffer++) {
 		struct vb2_buffer *vb = vb2_get_buffer(q, buffer);
 		bool unbalanced;
 
@@ -642,7 +645,7 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
 #endif
 
 	/* Free vb2 buffers */
-	for (buffer = q->num_buffers - buffers; buffer < q->num_buffers;
+	for (buffer = q_num_buffers - buffers; buffer < q_num_buffers;
 	     ++buffer) {
 		struct vb2_buffer *vb = vb2_get_buffer(q, buffer);
 
@@ -654,7 +657,7 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
 	}
 
 	q->num_buffers -= buffers;
-	if (!q->num_buffers) {
+	if (!vb2_get_num_buffers(q)) {
 		q->memory = VB2_MEMORY_UNKNOWN;
 		INIT_LIST_HEAD(&q->queued_list);
 	}
@@ -685,7 +688,7 @@ EXPORT_SYMBOL(vb2_buffer_in_use);
 static bool __buffers_in_use(struct vb2_queue *q)
 {
 	unsigned int buffer;
-	for (buffer = 0; buffer < q->num_buffers; ++buffer) {
+	for (buffer = 0; buffer < vb2_get_num_buffers(q); ++buffer) {
 		struct vb2_buffer *vb = vb2_get_buffer(q, buffer);
 
 		if (!vb)
@@ -811,6 +814,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 		     unsigned int flags, unsigned int *count)
 {
 	unsigned int num_buffers, allocated_buffers, num_planes = 0;
+	unsigned int q_num_bufs = vb2_get_num_buffers(q);
 	unsigned plane_sizes[VB2_MAX_PLANES] = { };
 	bool non_coherent_mem = flags & V4L2_MEMORY_FLAG_NON_COHERENT;
 	unsigned int i;
@@ -826,7 +830,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 		return -EBUSY;
 	}
 
-	if (*count == 0 || q->num_buffers != 0 ||
+	if (*count == 0 || q_num_bufs != 0 ||
 	    (q->memory != VB2_MEMORY_UNKNOWN && q->memory != memory) ||
 	    !verify_coherency_flags(q, non_coherent_mem)) {
 		/*
@@ -844,7 +848,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 		 * queued without ever calling STREAMON.
 		 */
 		__vb2_queue_cancel(q);
-		__vb2_queue_free(q, q->num_buffers);
+		__vb2_queue_free(q, q_num_bufs);
 		mutex_unlock(&q->mmap_lock);
 
 		/*
@@ -939,7 +943,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	if (ret < 0) {
 		/*
 		 * Note: __vb2_queue_free() will subtract 'allocated_buffers'
-		 * from q->num_buffers and it will reset q->memory to
+		 * from already queued buffers and it will reset q->memory to
 		 * VB2_MEMORY_UNKNOWN.
 		 */
 		__vb2_queue_free(q, allocated_buffers);
@@ -973,10 +977,11 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 	unsigned int num_planes = 0, num_buffers, allocated_buffers;
 	unsigned plane_sizes[VB2_MAX_PLANES] = { };
 	bool non_coherent_mem = flags & V4L2_MEMORY_FLAG_NON_COHERENT;
-	bool no_previous_buffers = !q->num_buffers;
-	int ret;
+	unsigned int q_num_bufs = vb2_get_num_buffers(q);
+	bool no_previous_buffers = !q_num_bufs;
+	int ret = 0;
 
-	if (q->num_buffers == VB2_MAX_FRAME) {
+	if (q_num_bufs == VB2_MAX_FRAME) {
 		dprintk(q, 1, "maximum number of buffers already allocated\n");
 		return -ENOBUFS;
 	}
@@ -1005,7 +1010,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 			return -EINVAL;
 	}
 
-	num_buffers = min(*count, VB2_MAX_FRAME - q->num_buffers);
+	num_buffers = min(*count, VB2_MAX_FRAME - q_num_bufs);
 
 	if (requested_planes && requested_sizes) {
 		num_planes = requested_planes;
@@ -1037,7 +1042,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 		num_buffers = allocated_buffers;
 
 		/*
-		 * q->num_buffers contains the total number of buffers, that the
+		 * num_buffers contains the total number of buffers, that the
 		 * queue driver has set up
 		 */
 		ret = call_qop(q, queue_setup, q, &num_buffers,
@@ -1058,7 +1063,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 	if (ret < 0) {
 		/*
 		 * Note: __vb2_queue_free() will subtract 'allocated_buffers'
-		 * from q->num_buffers and it will reset q->memory to
+		 * from already queued buffers and it will reset q->memory to
 		 * VB2_MEMORY_UNKNOWN.
 		 */
 		__vb2_queue_free(q, allocated_buffers);
@@ -1675,7 +1680,7 @@ static int vb2_start_streaming(struct vb2_queue *q)
 		 * Forcefully reclaim buffers if the driver did not
 		 * correctly return them to vb2.
 		 */
-		for (i = 0; i < q->num_buffers; ++i) {
+		for (i = 0; i < vb2_get_num_buffers(q); ++i) {
 			vb = vb2_get_buffer(q, i);
 
 			if (!vb)
@@ -2081,7 +2086,7 @@ static void __vb2_queue_cancel(struct vb2_queue *q)
 	 * to vb2 in stop_streaming().
 	 */
 	if (WARN_ON(atomic_read(&q->owned_by_drv_count))) {
-		for (i = 0; i < q->num_buffers; ++i) {
+		for (i = 0; i < vb2_get_num_buffers(q); i++) {
 			struct vb2_buffer *vb = vb2_get_buffer(q, i);
 
 			if (!vb)
@@ -2125,7 +2130,7 @@ static void __vb2_queue_cancel(struct vb2_queue *q)
 	 * call to __fill_user_buffer() after buf_finish(). That order can't
 	 * be changed, so we can't move the buf_finish() to __vb2_dqbuf().
 	 */
-	for (i = 0; i < q->num_buffers; ++i) {
+	for (i = 0; i < vb2_get_num_buffers(q); i++) {
 		struct vb2_buffer *vb;
 		struct media_request *req;
 
@@ -2173,6 +2178,7 @@ static void __vb2_queue_cancel(struct vb2_queue *q)
 
 int vb2_core_streamon(struct vb2_queue *q, unsigned int type)
 {
+	unsigned int q_num_bufs = vb2_get_num_buffers(q);
 	int ret;
 
 	if (type != q->type) {
@@ -2185,12 +2191,12 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type)
 		return 0;
 	}
 
-	if (!q->num_buffers) {
+	if (!q_num_bufs) {
 		dprintk(q, 1, "no buffers have been allocated\n");
 		return -EINVAL;
 	}
 
-	if (q->num_buffers < q->min_buffers_needed) {
+	if (q_num_bufs < q->min_buffers_needed) {
 		dprintk(q, 1, "need at least %u allocated buffers\n",
 				q->min_buffers_needed);
 		return -EINVAL;
@@ -2518,7 +2524,7 @@ void vb2_core_queue_release(struct vb2_queue *q)
 	__vb2_cleanup_fileio(q);
 	__vb2_queue_cancel(q);
 	mutex_lock(&q->mmap_lock);
-	__vb2_queue_free(q, q->num_buffers);
+	__vb2_queue_free(q, vb2_get_num_buffers(q));
 	mutex_unlock(&q->mmap_lock);
 }
 EXPORT_SYMBOL_GPL(vb2_core_queue_release);
@@ -2547,7 +2553,7 @@ __poll_t vb2_core_poll(struct vb2_queue *q, struct file *file,
 	/*
 	 * Start file I/O emulator only if streaming API has not been used yet.
 	 */
-	if (q->num_buffers == 0 && !vb2_fileio_is_active(q)) {
+	if (vb2_get_num_buffers(q) == 0 && !vb2_fileio_is_active(q)) {
 		if (!q->is_output && (q->io_modes & VB2_READ) &&
 				(req_events & (EPOLLIN | EPOLLRDNORM))) {
 			if (__vb2_init_fileio(q, 1))
@@ -2585,7 +2591,7 @@ __poll_t vb2_core_poll(struct vb2_queue *q, struct file *file,
 	 * For output streams you can call write() as long as there are fewer
 	 * buffers queued than there are buffers available.
 	 */
-	if (q->is_output && q->fileio && q->queued_count < q->num_buffers)
+	if (q->is_output && q->fileio && q->queued_count < vb2_get_num_buffers(q))
 		return EPOLLOUT | EPOLLWRNORM;
 
 	if (list_empty(&q->done_list)) {
@@ -2634,8 +2640,8 @@ struct vb2_fileio_buf {
  * struct vb2_fileio_data - queue context used by file io emulator
  *
  * @cur_index:	the index of the buffer currently being read from or
- *		written to. If equal to q->num_buffers then a new buffer
- *		must be dequeued.
+ *		written to. If equal to number of buffers in the vb2_queue
+ *		then a new buffer must be dequeued.
  * @initial_index: in the read() case all buffers are queued up immediately
  *		in __vb2_init_fileio() and __vb2_perform_fileio() just cycles
  *		buffers. However, in the write() case no buffers are initially
@@ -2645,9 +2651,9 @@ struct vb2_fileio_buf {
  *		buffers. This means that initially __vb2_perform_fileio()
  *		needs to know what buffer index to use when it is queuing up
  *		the buffers for the first time. That initial index is stored
- *		in this field. Once it is equal to q->num_buffers all
- *		available buffers have been queued and __vb2_perform_fileio()
- *		should start the normal dequeue/queue cycle.
+ *		in this field. Once it is equal to number of buffers in the
+ *		vb2_queue all available buffers have been queued and
+ *		__vb2_perform_fileio() should start the normal dequeue/queue cycle.
  *
  * vb2 provides a compatibility layer and emulator of file io (read and
  * write) calls on top of streaming API. For proper operation it required
@@ -2695,7 +2701,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 	/*
 	 * Check if streaming api has not been already activated.
 	 */
-	if (q->streaming || q->num_buffers > 0)
+	if (q->streaming || vb2_get_num_buffers(q) > 0)
 		return -EBUSY;
 
 	/*
@@ -2745,7 +2751,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 	/*
 	 * Get kernel address of each buffer.
 	 */
-	for (i = 0; i < q->num_buffers; i++) {
+	for (i = 0; i < vb2_get_num_buffers(q); i++) {
 		/* vb can never be NULL when using fileio. */
 		vb = vb2_get_buffer(q, i);
 
@@ -2764,7 +2770,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 		/*
 		 * Queue all buffers.
 		 */
-		for (i = 0; i < q->num_buffers; i++) {
+		for (i = 0; i < vb2_get_num_buffers(q); i++) {
 			struct vb2_buffer *vb2 = vb2_get_buffer(q, i);
 
 			if (!vb2)
@@ -2777,10 +2783,10 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 		}
 		/*
 		 * All buffers have been queued, so mark that by setting
-		 * initial_index to q->num_buffers
+		 * initial_index to the number of buffers in the vb2_queue
 		 */
-		fileio->initial_index = q->num_buffers;
-		fileio->cur_index = q->num_buffers;
+		fileio->initial_index = vb2_get_num_buffers(q);
+		fileio->cur_index = fileio->initial_index;
 	}
 
 	/*
@@ -2873,7 +2879,7 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
 	 * Check if we need to dequeue the buffer.
 	 */
 	index = fileio->cur_index;
-	if (index >= q->num_buffers) {
+	if (index >= vb2_get_num_buffers(q)) {
 		struct vb2_buffer *b;
 
 		/*
@@ -2974,14 +2980,14 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
 		 * If we are queuing up buffers for the first time, then
 		 * increase initial_index by one.
 		 */
-		if (fileio->initial_index < q->num_buffers)
+		if (fileio->initial_index < vb2_get_num_buffers(q))
 			fileio->initial_index++;
 		/*
 		 * The next buffer to use is either a buffer that's going to be
-		 * queued for the first time (initial_index < q->num_buffers)
-		 * or it is equal to q->num_buffers, meaning that the next
-		 * time we need to dequeue a buffer since we've now queued up
-		 * all the 'first time' buffers.
+		 * queued for the first time (initial_index < number of buffers in the vb2_queue)
+		 * or it is equal to the number of buffers in the vb2_queue,
+		 * meaning that the next time we need to dequeue a buffer since
+		 * we've now queued up all the 'first time' buffers.
 		 */
 		fileio->cur_index = fileio->initial_index;
 	}
@@ -3026,7 +3032,7 @@ static int vb2_thread(void *data)
 	int ret = 0;
 
 	if (q->is_output) {
-		prequeue = q->num_buffers;
+		prequeue = vb2_get_num_buffers(q);
 		copy_timestamp = q->copy_timestamp;
 	}
 
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 6ba13a95323c..9d3b828cc804 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -621,7 +621,7 @@ struct vb2_buffer *vb2_find_buffer(struct vb2_queue *q, u64 timestamp)
 	 * This loop doesn't scale if there is a really large number of buffers.
 	 * Maybe something more efficient will be needed in this case.
 	 */
-	for (i = 0; i < q->num_buffers; i++) {
+	for (i = 0; i < vb2_get_num_buffers(q); i++) {
 		vb2 = vb2_get_buffer(q, i);
 
 		if (!vb2)
@@ -755,7 +755,7 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 
 	fill_buf_caps(q, &create->capabilities);
 	validate_memory_flags(q, create->memory, &create->flags);
-	create->index = q->num_buffers;
+	create->index = vb2_get_num_buffers(q);
 	if (create->count == 0)
 		return ret != -EBUSY ? ret : 0;
 
-- 
2.39.2

