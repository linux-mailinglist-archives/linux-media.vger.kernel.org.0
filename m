Return-Path: <linux-media+bounces-4752-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F83B84AF88
	for <lists+linux-media@lfdr.de>; Tue,  6 Feb 2024 09:04:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DEEA28700B
	for <lists+linux-media@lfdr.de>; Tue,  6 Feb 2024 08:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763BA12D14B;
	Tue,  6 Feb 2024 08:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="i2eCpqSO"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9473B12B176;
	Tue,  6 Feb 2024 08:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707206558; cv=none; b=NtXhcsq8eCB0C/PRvBD53citSX4qHMDU6FODZtFUhBiyXfuB8QoVsmBJEej7Yfyv33WFLIxqNn+Rb6b4FVz7NdCHQu3rKnCLdsCYKcMTIH16eEIVQsqsVHgUZmuc+eRkVe+KksjNpanrIW4STCLt+80GnZ2PSnKxBtNXxiUByOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707206558; c=relaxed/simple;
	bh=sUbC7vuHTN50zvKn2VfoNDjyzyMo/J0seu1cP364rs4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CEiUSfVL4rObqQUmbSQNezu6s5Y/e/tqupCqlDFsLrdt+3rVsMFRqZYJS2OJRMBL6FfTLwshvQsS6lVCAz+9FqXi6CQqXWRVlQPTfgbq19kzjvHUlYf+9WB1iAUFT93l7YUZxDmv0WFo3keK4hyGszsQk2jRH2YnKqqmhnXPbL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=i2eCpqSO; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707206548;
	bh=sUbC7vuHTN50zvKn2VfoNDjyzyMo/J0seu1cP364rs4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i2eCpqSO/rtv5gq2hIRjhipgdQB6VK1m8er+9E0paKf2G2rRkaUBcsT30rewLnGx0
	 NTsk+uX8X4sUUw3W2uPddPq+/62RR50KZsrtyQjB+hISkTAlJ0r9yUhsrdYT9qnhaq
	 LRWmBzKkuUxF/E7sowqvRoBK1bIPv+zHQ4eRmbCPMW089vU12k12cldC0pBjgRTRS9
	 NEznh0PGzx9OI8zPBReO5DMWIL61BB1ZrYiBGRRU8Oi3OAtSLf23LY6oC3DgRRipJV
	 7PW0WyOZYNblL0q5YmdZjPOyaFANhWfCAFX0docTdgKs9wZLsjMEOBsqR54l4PW4rJ
	 xWU0M46kaB/+A==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EC6883782077;
	Tue,  6 Feb 2024 08:02:27 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v19 5/9] media: core: Add bitmap manage bufs array entries
Date: Tue,  6 Feb 2024 09:02:15 +0100
Message-Id: <20240206080219.11951-6-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240206080219.11951-1-benjamin.gaignard@collabora.com>
References: <20240206080219.11951-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a bitmap field to know which of bufs array entries are
used or not.
Remove no more used num_buffers field from queue structure.
Use bitmap_find_next_zero_area() to find the first possible
range when creating new buffers to fill the gaps.
If no suitable range is found try to allocate less buffers
than requested.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/common/videobuf2/videobuf2-core.c   | 71 ++++++++++++++-----
 include/media/videobuf2-core.h                | 18 +++--
 2 files changed, 64 insertions(+), 25 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 8e819d198c34..ec81426d4d79 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -421,11 +421,12 @@ static void init_buffer_cache_hints(struct vb2_queue *q, struct vb2_buffer *vb)
  */
 static void vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *vb, unsigned int index)
 {
-	WARN_ON(index >= q->max_num_buffers || q->bufs[index] || vb->vb2_queue);
+	WARN_ON(index >= q->max_num_buffers || test_bit(index, q->bufs_bitmap) || vb->vb2_queue);
 
 	q->bufs[index] = vb;
 	vb->index = index;
 	vb->vb2_queue = q;
+	set_bit(index, q->bufs_bitmap);
 }
 
 /**
@@ -434,6 +435,7 @@ static void vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *vb, uns
  */
 static void vb2_queue_remove_buffer(struct vb2_buffer *vb)
 {
+	clear_bit(vb->index, vb->vb2_queue->bufs_bitmap);
 	vb->vb2_queue->bufs[vb->index] = NULL;
 	vb->vb2_queue = NULL;
 }
@@ -452,9 +454,9 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 			     const unsigned int plane_sizes[VB2_MAX_PLANES],
 			     unsigned int *first_index)
 {
-	unsigned int q_num_buffers = vb2_get_num_buffers(q);
 	unsigned int buffer, plane;
 	struct vb2_buffer *vb;
+	unsigned long index = q->max_num_buffers;
 	int ret;
 
 	/*
@@ -462,9 +464,25 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 	 * in the queue is below q->max_num_buffers
 	 */
 	num_buffers = min_t(unsigned int, num_buffers,
-			    q->max_num_buffers - q_num_buffers);
+			    q->max_num_buffers - vb2_get_num_buffers(q));
+
+	while (num_buffers) {
+		index = bitmap_find_next_zero_area(q->bufs_bitmap, q->max_num_buffers,
+						   0, num_buffers, 0);
+
+		if (index < q->max_num_buffers)
+			break;
+		/* Try to find free space for less buffers */
+		num_buffers--;
+	}
+
+	/* If there is no space left to allocate buffers return 0 to indicate the error */
+	if (!num_buffers) {
+		*first_index = 0;
+		return 0;
+	}
 
-	*first_index = q_num_buffers;
+	*first_index = index;
 
 	for (buffer = 0; buffer < num_buffers; ++buffer) {
 		/* Allocate vb2 buffer structures */
@@ -484,7 +502,7 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 			vb->planes[plane].min_length = plane_sizes[plane];
 		}
 
-		vb2_queue_add_buffer(q, vb, q_num_buffers + buffer);
+		vb2_queue_add_buffer(q, vb, index++);
 		call_void_bufop(q, init_buffer, vb);
 
 		/* Allocate video buffer memory for the MMAP type */
@@ -664,7 +682,6 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
 		kfree(vb);
 	}
 
-	q->num_buffers -= buffers;
 	if (!vb2_get_num_buffers(q)) {
 		q->memory = VB2_MEMORY_UNKNOWN;
 		INIT_LIST_HEAD(&q->queued_list);
@@ -818,6 +835,32 @@ static bool verify_coherency_flags(struct vb2_queue *q, bool non_coherent_mem)
 	return true;
 }
 
+static int vb2_core_allocated_buffers_storage(struct vb2_queue *q)
+{
+	if (!q->bufs)
+		q->bufs = kcalloc(q->max_num_buffers, sizeof(*q->bufs), GFP_KERNEL);
+	if (!q->bufs)
+		return -ENOMEM;
+
+	if (!q->bufs_bitmap)
+		q->bufs_bitmap = bitmap_zalloc(q->max_num_buffers, GFP_KERNEL);
+	if (!q->bufs_bitmap) {
+		kfree(q->bufs);
+		q->bufs = NULL;
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static void vb2_core_free_buffers_storage(struct vb2_queue *q)
+{
+	kfree(q->bufs);
+	q->bufs = NULL;
+	bitmap_free(q->bufs_bitmap);
+	q->bufs_bitmap = NULL;
+}
+
 int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 		     unsigned int flags, unsigned int *count)
 {
@@ -879,10 +922,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	 * in the queue_setup op.
 	 */
 	mutex_lock(&q->mmap_lock);
-	if (!q->bufs)
-		q->bufs = kcalloc(q->max_num_buffers, sizeof(*q->bufs), GFP_KERNEL);
-	if (!q->bufs)
-		ret = -ENOMEM;
+	ret = vb2_core_allocated_buffers_storage(q);
 	q->memory = memory;
 	mutex_unlock(&q->mmap_lock);
 	if (ret)
@@ -954,7 +994,6 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	}
 
 	mutex_lock(&q->mmap_lock);
-	q->num_buffers = allocated_buffers;
 
 	if (ret < 0) {
 		/*
@@ -982,6 +1021,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	mutex_lock(&q->mmap_lock);
 	q->memory = VB2_MEMORY_UNKNOWN;
 	mutex_unlock(&q->mmap_lock);
+	vb2_core_free_buffers_storage(q);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(vb2_core_reqbufs);
@@ -1015,11 +1055,8 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 		 * value in the queue_setup op.
 		 */
 		mutex_lock(&q->mmap_lock);
+		ret = vb2_core_allocated_buffers_storage(q);
 		q->memory = memory;
-		if (!q->bufs)
-			q->bufs = kcalloc(q->max_num_buffers, sizeof(*q->bufs), GFP_KERNEL);
-		if (!q->bufs)
-			ret = -ENOMEM;
 		mutex_unlock(&q->mmap_lock);
 		if (ret)
 			return ret;
@@ -1082,7 +1119,6 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 	}
 
 	mutex_lock(&q->mmap_lock);
-	q->num_buffers += allocated_buffers;
 
 	if (ret < 0) {
 		/*
@@ -2583,8 +2619,7 @@ void vb2_core_queue_release(struct vb2_queue *q)
 	__vb2_queue_cancel(q);
 	mutex_lock(&q->mmap_lock);
 	__vb2_queue_free(q, vb2_get_num_buffers(q));
-	kfree(q->bufs);
-	q->bufs = NULL;
+	vb2_core_free_buffers_storage(q);
 	q->is_busy = 0;
 	mutex_unlock(&q->mmap_lock);
 }
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 2a9ca70e99c7..88e35a3b7730 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -346,8 +346,8 @@ struct vb2_buffer {
  *			describes the requested number of planes and sizes\[\]
  *			contains the requested plane sizes. In this case
  *			\*num_buffers are being allocated additionally to
- *			q->num_buffers. If either \*num_planes or the requested
- *			sizes are invalid callback must return %-EINVAL.
+ *			the buffers already allocated. If either \*num_planes
+ *			or the requested sizes are invalid callback must return %-EINVAL.
  * @wait_prepare:	release any locks taken while calling vb2 functions;
  *			it is called before an ioctl needs to wait for a new
  *			buffer to arrive; required to avoid a deadlock in
@@ -571,8 +571,9 @@ struct vb2_buf_ops {
  * @mmap_lock:	private mutex used when buffers are allocated/freed/mmapped
  * @memory:	current memory type used
  * @dma_dir:	DMA mapping direction.
- * @bufs:	videobuf2 buffer structures
- * @num_buffers: number of allocated/used buffers
+ * @bufs:	videobuf2 buffer structures. If it is non-NULL then
+ *		bufs_bitmap is also non-NULL.
+ * @bufs_bitmap: bitmap tracking whether each bufs[] entry is used
  * @max_num_buffers: upper limit of number of allocated/used buffers.
  *		     If set to 0 v4l2 core will change it VB2_MAX_FRAME
  *		     for backward compatibility.
@@ -640,7 +641,7 @@ struct vb2_queue {
 	unsigned int			memory;
 	enum dma_data_direction		dma_dir;
 	struct vb2_buffer		**bufs;
-	unsigned int			num_buffers;
+	unsigned long			*bufs_bitmap;
 	unsigned int			max_num_buffers;
 
 	struct list_head		queued_list;
@@ -1170,7 +1171,10 @@ static inline bool vb2_fileio_is_active(struct vb2_queue *q)
  */
 static inline unsigned int vb2_get_num_buffers(struct vb2_queue *q)
 {
-	return q->num_buffers;
+	if (q->bufs_bitmap)
+		return bitmap_weight(q->bufs_bitmap, q->max_num_buffers);
+
+	return 0;
 }
 
 /**
@@ -1279,7 +1283,7 @@ static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
 	if (index >= q->max_num_buffers)
 		return NULL;
 
-	if (index < q->num_buffers)
+	if (test_bit(index, q->bufs_bitmap))
 		return q->bufs[index];
 	return NULL;
 }
-- 
2.40.1


