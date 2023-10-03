Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE5C7B6352
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 10:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239488AbjJCIHi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 04:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239318AbjJCIHZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 04:07:25 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68631C4;
        Tue,  3 Oct 2023 01:07:20 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:b6df:b784:6a0f:8451])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 8860D6607328;
        Tue,  3 Oct 2023 09:07:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1696320438;
        bh=ae8sJ6Duy+q0MBFf+Ra1B/rOkrMVbY1h7jDoicoGFN0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=g+K4qBZMLSt6ETXeAfobs5VB4ftfBqAB+AmlRGhjKZ2xSJh7E/GRxwAllEiwbB3K4
         X7e59QWnu51CbGCOD4t+2Lj+ghCVDNZVCBv213dM9yRaOm1PGrlKx/1fESumHnrn/J
         CI7/xipkNbJZ1xLGSBew/2pp309BSlbf1OQNYpZo/s5K2dULrbtU8IpKYJ6P2dG1AM
         vhtkAbMJv51YTFyU74vwJUEKluOrKTACUX6xa0cJd/cVzDGqqM8LhBi8iwmvjjO4CW
         aZhOcQvkbZq+rUOlQDQLn/Dfc74GrqEuSpsvI+k6SP1CrIaYYVSq0AO8/3RKANkbC1
         fb3tC9YD820dg==
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
Subject: [PATCH v10 11/54] media: videobuf2: Access vb2_queue bufs array through helper functions
Date:   Tue,  3 Oct 2023 10:06:20 +0200
Message-Id: <20231003080704.43911-12-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds 2 helpers functions to add and remove vb2 buffers
from a queue. With these 2 and vb2_get_buffer(), bufs field of
struct vb2_queue becomes like a private member of the structure.

After each call to vb2_get_buffer() we need to be sure that we get
a valid pointer so check the return value of all of them.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/common/videobuf2/videobuf2-core.c   | 151 +++++++++++++-----
 .../media/common/videobuf2/videobuf2-v4l2.c   |  51 ++++--
 2 files changed, 146 insertions(+), 56 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index f3ff26b66bd4..d23ee4b86cc0 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -405,6 +405,31 @@ static void init_buffer_cache_hints(struct vb2_queue *q, struct vb2_buffer *vb)
 		vb->skip_cache_sync_on_finish = 1;
 }
 
+/**
+ * vb2_queue_add_buffer() - add a buffer to a queue
+ * @q:	pointer to &struct vb2_queue with videobuf2 queue.
+ * @vb:	pointer to &struct vb2_buffer to be added to the queue.
+ * @index: index where add vb2_buffer in the queue
+ */
+static void vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *vb, unsigned int index)
+{
+	WARN_ON(index >= VB2_MAX_FRAME || q->bufs[index]);
+
+	q->bufs[index] = vb;
+	vb->index = index;
+	vb->vb2_queue = q;
+}
+
+/**
+ * vb2_queue_remove_buffer() - remove a buffer from a queue
+ * @vb:	pointer to &struct vb2_buffer to be removed from the queue.
+ */
+static void vb2_queue_remove_buffer(struct vb2_buffer *vb)
+{
+	vb->vb2_queue->bufs[vb->index] = NULL;
+	vb->vb2_queue = NULL;
+}
+
 /*
  * __vb2_queue_alloc() - allocate vb2 buffer structures and (for MMAP type)
  * video buffer memory for all buffers/planes on the queue and initializes the
@@ -433,9 +458,7 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 		}
 
 		vb->state = VB2_BUF_STATE_DEQUEUED;
-		vb->vb2_queue = q;
 		vb->num_planes = num_planes;
-		vb->index = q->num_buffers + buffer;
 		vb->type = q->type;
 		vb->memory = memory;
 		init_buffer_cache_hints(q, vb);
@@ -443,9 +466,9 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 			vb->planes[plane].length = plane_sizes[plane];
 			vb->planes[plane].min_length = plane_sizes[plane];
 		}
-		call_void_bufop(q, init_buffer, vb);
 
-		q->bufs[vb->index] = vb;
+		vb2_queue_add_buffer(q, vb, q->num_buffers + buffer);
+		call_void_bufop(q, init_buffer, vb);
 
 		/* Allocate video buffer memory for the MMAP type */
 		if (memory == VB2_MEMORY_MMAP) {
@@ -453,7 +476,7 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 			if (ret) {
 				dprintk(q, 1, "failed allocating memory for buffer %d\n",
 					buffer);
-				q->bufs[vb->index] = NULL;
+				vb2_queue_remove_buffer(vb);
 				kfree(vb);
 				break;
 			}
@@ -468,7 +491,7 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 				dprintk(q, 1, "buffer %d %p initialization failed\n",
 					buffer, vb);
 				__vb2_buf_mem_free(vb);
-				q->bufs[vb->index] = NULL;
+				vb2_queue_remove_buffer(vb);
 				kfree(vb);
 				break;
 			}
@@ -491,7 +514,7 @@ static void __vb2_free_mem(struct vb2_queue *q, unsigned int buffers)
 
 	for (buffer = q->num_buffers - buffers; buffer < q->num_buffers;
 	     ++buffer) {
-		vb = q->bufs[buffer];
+		vb = vb2_get_buffer(q, buffer);
 		if (!vb)
 			continue;
 
@@ -519,7 +542,7 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
 	/* Call driver-provided cleanup function for each buffer, if provided */
 	for (buffer = q->num_buffers - buffers; buffer < q->num_buffers;
 	     ++buffer) {
-		struct vb2_buffer *vb = q->bufs[buffer];
+		struct vb2_buffer *vb = vb2_get_buffer(q, buffer);
 
 		if (vb && vb->planes[0].mem_priv)
 			call_void_vb_qop(vb, buf_cleanup, vb);
@@ -560,15 +583,20 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
 		q->cnt_unprepare_streaming = 0;
 	}
 	for (buffer = 0; buffer < q->num_buffers; ++buffer) {
-		struct vb2_buffer *vb = q->bufs[buffer];
-		bool unbalanced = vb->cnt_mem_alloc != vb->cnt_mem_put ||
-				  vb->cnt_mem_prepare != vb->cnt_mem_finish ||
-				  vb->cnt_mem_get_userptr != vb->cnt_mem_put_userptr ||
-				  vb->cnt_mem_attach_dmabuf != vb->cnt_mem_detach_dmabuf ||
-				  vb->cnt_mem_map_dmabuf != vb->cnt_mem_unmap_dmabuf ||
-				  vb->cnt_buf_queue != vb->cnt_buf_done ||
-				  vb->cnt_buf_prepare != vb->cnt_buf_finish ||
-				  vb->cnt_buf_init != vb->cnt_buf_cleanup;
+		struct vb2_buffer *vb = vb2_get_buffer(q, buffer);
+		bool unbalanced;
+
+		if (!vb)
+			continue;
+
+		unbalanced = vb->cnt_mem_alloc != vb->cnt_mem_put ||
+			     vb->cnt_mem_prepare != vb->cnt_mem_finish ||
+			     vb->cnt_mem_get_userptr != vb->cnt_mem_put_userptr ||
+			     vb->cnt_mem_attach_dmabuf != vb->cnt_mem_detach_dmabuf ||
+			     vb->cnt_mem_map_dmabuf != vb->cnt_mem_unmap_dmabuf ||
+			     vb->cnt_buf_queue != vb->cnt_buf_done ||
+			     vb->cnt_buf_prepare != vb->cnt_buf_finish ||
+			     vb->cnt_buf_init != vb->cnt_buf_cleanup;
 
 		if (unbalanced) {
 			pr_info("unbalanced counters for queue %p, buffer %d:\n",
@@ -608,8 +636,13 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
 	/* Free vb2 buffers */
 	for (buffer = q->num_buffers - buffers; buffer < q->num_buffers;
 	     ++buffer) {
-		kfree(q->bufs[buffer]);
-		q->bufs[buffer] = NULL;
+		struct vb2_buffer *vb = vb2_get_buffer(q, buffer);
+
+		if (!vb)
+			continue;
+
+		vb2_queue_remove_buffer(vb);
+		kfree(vb);
 	}
 
 	q->num_buffers -= buffers;
@@ -645,7 +678,12 @@ static bool __buffers_in_use(struct vb2_queue *q)
 {
 	unsigned int buffer;
 	for (buffer = 0; buffer < q->num_buffers; ++buffer) {
-		if (vb2_buffer_in_use(q, q->bufs[buffer]))
+		struct vb2_buffer *vb = vb2_get_buffer(q, buffer);
+
+		if (!vb)
+			continue;
+
+		if (vb2_buffer_in_use(q, vb))
 			return true;
 	}
 	return false;
@@ -1630,7 +1668,11 @@ static int vb2_start_streaming(struct vb2_queue *q)
 		 * correctly return them to vb2.
 		 */
 		for (i = 0; i < q->num_buffers; ++i) {
-			vb = q->bufs[i];
+			vb = vb2_get_buffer(q, i);
+
+			if (!vb)
+				continue;
+
 			if (vb->state == VB2_BUF_STATE_ACTIVE)
 				vb2_buffer_done(vb, VB2_BUF_STATE_QUEUED);
 		}
@@ -2031,12 +2073,18 @@ static void __vb2_queue_cancel(struct vb2_queue *q)
 	 * to vb2 in stop_streaming().
 	 */
 	if (WARN_ON(atomic_read(&q->owned_by_drv_count))) {
-		for (i = 0; i < q->num_buffers; ++i)
-			if (q->bufs[i]->state == VB2_BUF_STATE_ACTIVE) {
-				pr_warn("driver bug: stop_streaming operation is leaving buf %p in active state\n",
-					q->bufs[i]);
-				vb2_buffer_done(q->bufs[i], VB2_BUF_STATE_ERROR);
+		for (i = 0; i < q->num_buffers; ++i) {
+			struct vb2_buffer *vb = vb2_get_buffer(q, i);
+
+			if (!vb)
+				continue;
+
+			if (vb->state == VB2_BUF_STATE_ACTIVE) {
+				pr_warn("driver bug: stop_streaming operation is leaving buffer %u in active state\n",
+					vb->index);
+				vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
 			}
+		}
 		/* Must be zero now */
 		WARN_ON(atomic_read(&q->owned_by_drv_count));
 	}
@@ -2070,9 +2118,14 @@ static void __vb2_queue_cancel(struct vb2_queue *q)
 	 * be changed, so we can't move the buf_finish() to __vb2_dqbuf().
 	 */
 	for (i = 0; i < q->num_buffers; ++i) {
-		struct vb2_buffer *vb = q->bufs[i];
-		struct media_request *req = vb->req_obj.req;
+		struct vb2_buffer *vb;
+		struct media_request *req;
 
+		vb = vb2_get_buffer(q, i);
+		if (!vb)
+			continue;
+
+		req = vb->req_obj.req;
 		/*
 		 * If a request is associated with this buffer, then
 		 * call buf_request_cancel() to give the driver to complete()
@@ -2221,10 +2274,12 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long off,
 	buffer = (off >> PLANE_INDEX_SHIFT) & BUFFER_INDEX_MASK;
 	*plane = (off >> PAGE_SHIFT) & PLANE_INDEX_MASK;
 
-	if (buffer >= q->num_buffers || *plane >= q->bufs[buffer]->num_planes)
+	*vb = vb2_get_buffer(q, buffer);
+	if (!*vb)
+		return -EINVAL;
+	if (*plane >= (*vb)->num_planes)
 		return -EINVAL;
 
-	*vb = q->bufs[buffer];
 	return 0;
 }
 
@@ -2612,6 +2667,7 @@ struct vb2_fileio_data {
 static int __vb2_init_fileio(struct vb2_queue *q, int read)
 {
 	struct vb2_fileio_data *fileio;
+	struct vb2_buffer *vb;
 	int i, ret;
 	unsigned int count = 0;
 
@@ -2662,11 +2718,18 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 	if (ret)
 		goto err_kfree;
 
+	/*
+	 * Userspace can never add or delete buffers later, so there
+	 * will never be holes. It is safe to assume that vb2_get_buffer(q, 0)
+	 * will always return a valid vb pointer
+	 */
+	vb = vb2_get_buffer(q, 0);
+
 	/*
 	 * Check if plane_count is correct
 	 * (multiplane buffers are not supported).
 	 */
-	if (q->bufs[0]->num_planes != 1) {
+	if (vb->num_planes != 1) {
 		ret = -EBUSY;
 		goto err_reqbufs;
 	}
@@ -2675,12 +2738,15 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 	 * Get kernel address of each buffer.
 	 */
 	for (i = 0; i < q->num_buffers; i++) {
-		fileio->bufs[i].vaddr = vb2_plane_vaddr(q->bufs[i], 0);
+		vb = vb2_get_buffer(q, i);
+		WARN_ON_ONCE(!vb);
+
+		fileio->bufs[i].vaddr = vb2_plane_vaddr(vb, 0);
 		if (fileio->bufs[i].vaddr == NULL) {
 			ret = -EINVAL;
 			goto err_reqbufs;
 		}
-		fileio->bufs[i].size = vb2_plane_size(q->bufs[i], 0);
+		fileio->bufs[i].size = vb2_plane_size(vb, 0);
 	}
 
 	/*
@@ -2808,15 +2874,17 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
 
 		fileio->cur_index = index;
 		buf = &fileio->bufs[index];
-		b = q->bufs[index];
+
+		/* b can never be NULL when using fileio. */
+		b = vb2_get_buffer(q, index);
 
 		/*
 		 * Get number of bytes filled by the driver
 		 */
 		buf->pos = 0;
 		buf->queued = 0;
-		buf->size = read ? vb2_get_plane_payload(q->bufs[index], 0)
-				 : vb2_plane_size(q->bufs[index], 0);
+		buf->size = read ? vb2_get_plane_payload(b, 0)
+				 : vb2_plane_size(b, 0);
 		/* Compensate for data_offset on read in the multiplanar case. */
 		if (is_multiplanar && read &&
 				b->planes[0].data_offset < buf->size) {
@@ -2859,7 +2927,8 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
 	 * Queue next buffer if required.
 	 */
 	if (buf->pos == buf->size || (!read && fileio->write_immediately)) {
-		struct vb2_buffer *b = q->bufs[index];
+		/* b can never be NULL when using fileio. */
+		struct vb2_buffer *b = vb2_get_buffer(q, index);
 
 		/*
 		 * Check if this is the last buffer to read.
@@ -2886,7 +2955,7 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
 		 */
 		buf->pos = 0;
 		buf->queued = 1;
-		buf->size = vb2_plane_size(q->bufs[index], 0);
+		buf->size = vb2_plane_size(b, 0);
 		fileio->q_count += 1;
 		/*
 		 * If we are queuing up buffers for the first time, then
@@ -2957,7 +3026,9 @@ static int vb2_thread(void *data)
 		 * Call vb2_dqbuf to get buffer back.
 		 */
 		if (prequeue) {
-			vb = q->bufs[index++];
+			vb = vb2_get_buffer(q, index++);
+			if (!vb)
+				continue;
 			prequeue--;
 		} else {
 			call_void_qop(q, wait_finish, q);
@@ -2966,7 +3037,7 @@ static int vb2_thread(void *data)
 			call_void_qop(q, wait_prepare, q);
 			dprintk(q, 5, "file io: vb2_dqbuf result: %d\n", ret);
 			if (!ret)
-				vb = q->bufs[index];
+				vb = vb2_get_buffer(q, index);
 		}
 		if (ret || threadio->stop)
 			break;
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 697c8a9f98cd..3395e702ad1f 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -383,9 +383,9 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
 		return -EINVAL;
 	}
 
-	if (q->bufs[b->index] == NULL) {
-		/* Should never happen */
-		dprintk(q, 1, "%s: buffer is NULL\n", opname);
+	vb = vb2_get_buffer(q, b->index);
+	if (!vb) {
+		dprintk(q, 1, "%s: buffer %u is NULL\n", opname,  b->index);
 		return -EINVAL;
 	}
 
@@ -394,7 +394,6 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
 		return -EINVAL;
 	}
 
-	vb = q->bufs[b->index];
 	vbuf = to_vb2_v4l2_buffer(vb);
 	ret = __verify_planes_array(vb, b);
 	if (ret)
@@ -628,11 +627,22 @@ static const struct vb2_buf_ops v4l2_buf_ops = {
 struct vb2_buffer *vb2_find_buffer(struct vb2_queue *q, u64 timestamp)
 {
 	unsigned int i;
+	struct vb2_buffer *vb2;
 
-	for (i = 0; i < q->num_buffers; i++)
-		if (q->bufs[i]->copied_timestamp &&
-		    q->bufs[i]->timestamp == timestamp)
-			return vb2_get_buffer(q, i);
+	/*
+	 * This loop doesn't scale if there is a really large number of buffers.
+	 * Maybe something more efficient will be needed in this case.
+	 */
+	for (i = 0; i < q->num_buffers; i++) {
+		vb2 = vb2_get_buffer(q, i);
+
+		if (!vb2)
+			continue;
+
+		if (vb2->copied_timestamp &&
+		    vb2->timestamp == timestamp)
+			return vb2;
+	}
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(vb2_find_buffer);
@@ -660,11 +670,12 @@ int vb2_querybuf(struct vb2_queue *q, struct v4l2_buffer *b)
 		return -EINVAL;
 	}
 
-	if (b->index >= q->num_buffers) {
-		dprintk(q, 1, "buffer index out of range\n");
+	vb = vb2_get_buffer(q, b->index);
+	if (!vb) {
+		dprintk(q, 1, "can't find the requested buffer %u\n", b->index);
 		return -EINVAL;
 	}
-	vb = q->bufs[b->index];
+
 	ret = __verify_planes_array(vb, b);
 	if (!ret)
 		vb2_core_querybuf(q, vb, b);
@@ -734,11 +745,11 @@ int vb2_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
 	if (b->flags & V4L2_BUF_FLAG_REQUEST_FD)
 		return -EINVAL;
 
-	if (b->index >= q->num_buffers) {
-		dprintk(q, 1, "buffer index out of range\n");
+	vb = vb2_get_buffer(q, b->index);
+	if (!vb) {
+		dprintk(q, 1, "can't find the requested buffer %u\n", b->index);
 		return -EINVAL;
 	}
-	vb = q->bufs[b->index];
 
 	ret = vb2_queue_or_prepare_buf(q, mdev, b, true, NULL);
 
@@ -822,7 +833,11 @@ int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
 		dprintk(q, 1, "buffer index out of range\n");
 		return -EINVAL;
 	}
-	vb = q->bufs[b->index];
+	vb = vb2_get_buffer(q, b->index);
+	if (!vb) {
+		dprintk(q, 1, "can't find the requested buffer %u\n", b->index);
+		return -EINVAL;
+	}
 
 	ret = vb2_queue_or_prepare_buf(q, mdev, b, false, &req);
 	if (ret)
@@ -893,7 +908,11 @@ int vb2_expbuf(struct vb2_queue *q, struct v4l2_exportbuffer *eb)
 		dprintk(q, 1, "buffer index out of range\n");
 		return -EINVAL;
 	}
-	vb = q->bufs[eb->index];
+	vb = vb2_get_buffer(q, eb->index);
+	if (!vb) {
+		dprintk(q, 1, "can't find the requested buffer %u\n", eb->index);
+		return -EINVAL;
+	}
 
 	return vb2_core_expbuf(q, &eb->fd, eb->type, vb,
 				eb->plane, eb->flags);
-- 
2.39.2

