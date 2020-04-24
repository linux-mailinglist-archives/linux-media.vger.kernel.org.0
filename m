Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2DB1B70E4
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 11:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbgDXJbC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 05:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726523AbgDXJbB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 05:31:01 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DF16C09B045;
        Fri, 24 Apr 2020 02:31:01 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id 18so3317343pfv.8;
        Fri, 24 Apr 2020 02:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NEHGaOKTyM7ltSmSqSSPuMjPTHDepy0wQfm/rh0jftw=;
        b=eQkQOYAWcKeKTkYqv65i+rFA9v4AkYZ/Oi8LwPno8uAT+5Mr7WDmp2XKAtWBIcmDPC
         NiChVxfjDs8swxW8i7Q0h2te+LYPVEwBhM/ieqzIZtGc7LhQpMqSiHVldv59YU9R8dld
         xgO+fjBYsm11sKZP+YvlpiuR3YYW/XQ5QtrJaO244dh636TGSV9Ef9ZNfIOamI0/vJGG
         Y1qqKbjO73X30q9fkIM6qBBBONk3j+oE53XXghiQcXTKkMVG9F9iQE8abNhPk/IprFCX
         sSNLPhYmaD5Sva3OaKOG0Z8s7EgXPZQ/MvpmQYcgW8yLIt1AfY1+F9JqkIO7tbfLtQcK
         i46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NEHGaOKTyM7ltSmSqSSPuMjPTHDepy0wQfm/rh0jftw=;
        b=SuPwZgZAL6C3FFcvLTMEcG1eM9L26qFIwrbK93dYzhfdGn94SgV90A0BUkNN3IhRT5
         RK+SF2wLzfHfHkoeCeeR4xDdG7jpcybOMn2aJcy0L3Csk/HgxMdu/fq5qkJI5omyzrFX
         bwDcADzSCZpXBe9OjaJBsBd94T77TfS/c3GFkyzp5kidllvVXtx7A4tkHrHhi0V210V7
         cIjP+a/OVOflRt5DXn0j71VUmnlMI8ck7q8wisstlhmD6T2gzk9BFQclP8PUr4KDYAbh
         TtmR9G4+oumYuttsQ8voBsDCfwh2jUvJpQ/+p6izVW8+wT8aEH6FbAWyBVC1aZo3TikZ
         HXAA==
X-Gm-Message-State: AGi0PuZlpK6ymzPcWjip5REVz3E8Rn425m/OWjXKLBi2oJsk3FO7NoRn
        DJEzaD9O3dg8kE558t+hLGU=
X-Google-Smtp-Source: APiQypJLuqN9lXB07Tgliam/7giAkQ2pmRXSCXO/RcfAA+GJbEt4yGo+WLggcZYxNvBEeEsV/ECUGg==
X-Received: by 2002:aa7:951b:: with SMTP id b27mr8650374pfp.2.1587720660565;
        Fri, 24 Apr 2020 02:31:00 -0700 (PDT)
Received: from localhost.localdomain (146.85.30.125.dy.iij4u.or.jp. [125.30.85.146])
        by smtp.gmail.com with ESMTPSA id 185sm5541315pfv.9.2020.04.24.02.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 02:31:00 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv5 05/13] videobuf2: add queue memory consistency parameter
Date:   Fri, 24 Apr 2020 18:29:12 +0900
Message-Id: <20200424092920.4801-6-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200424092920.4801-1-sergey.senozhatsky@gmail.com>
References: <20200424092920.4801-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sergey Senozhatsky <senozhatsky@chromium.org>

Preparations for future V4L2_FLAG_MEMORY_NON_CONSISTENT support.

Extend vb2_core_reqbufs() with queue memory consistency flag
that is applied to the newly allocated buffers.

An attempt to allocate a buffer with consistency requirements
which don't match queue's consistency model will fail.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/common/videobuf2/videobuf2-core.c   | 52 +++++++++++++++----
 .../media/common/videobuf2/videobuf2-v4l2.c   |  6 +--
 drivers/media/dvb-core/dvb_vb2.c              |  2 +-
 include/media/videobuf2-core.h                |  8 ++-
 4 files changed, 52 insertions(+), 16 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 44d65f5be845..f1a65925bc17 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -664,11 +664,34 @@ int vb2_verify_memory_type(struct vb2_queue *q,
 }
 EXPORT_SYMBOL(vb2_verify_memory_type);
 
+static void set_queue_consistency(struct vb2_queue *q, bool consistent_mem)
+{
+	if (!vb2_queue_allows_cache_hints(q))
+		return;
+
+	if (consistent_mem)
+		q->dma_attrs &= ~DMA_ATTR_NON_CONSISTENT;
+	else
+		q->dma_attrs |= DMA_ATTR_NON_CONSISTENT;
+}
+
+static bool verify_consistency_attr(struct vb2_queue *q, bool consistent_mem)
+{
+	bool queue_is_consistent = !(q->dma_attrs & DMA_ATTR_NON_CONSISTENT);
+
+	if (consistent_mem != queue_is_consistent) {
+		dprintk(1, "memory consistency model mismatch\n");
+		return false;
+	}
+	return true;
+}
+
 int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
-		unsigned int *count)
+		     unsigned int flags, unsigned int *count)
 {
 	unsigned int num_buffers, allocated_buffers, num_planes = 0;
 	unsigned plane_sizes[VB2_MAX_PLANES] = { };
+	bool consistent_mem = true;
 	unsigned int i;
 	int ret;
 
@@ -683,7 +706,8 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	}
 
 	if (*count == 0 || q->num_buffers != 0 ||
-	    (q->memory != VB2_MEMORY_UNKNOWN && q->memory != memory)) {
+	    (q->memory != VB2_MEMORY_UNKNOWN && q->memory != memory) ||
+	    !verify_consistency_attr(q, consistent_mem)) {
 		/*
 		 * We already have buffers allocated, so first check if they
 		 * are not in use and can be freed.
@@ -730,6 +754,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	if (ret)
 		return ret;
 
+	set_queue_consistency(q, consistent_mem);
 	/* Check that driver has set sane values */
 	if (WARN_ON(!num_planes))
 		return -EINVAL;
@@ -804,11 +829,13 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 EXPORT_SYMBOL_GPL(vb2_core_reqbufs);
 
 int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
-		unsigned int *count, unsigned requested_planes,
-		const unsigned requested_sizes[])
+			 unsigned int flags, unsigned int *count,
+			 unsigned int requested_planes,
+			 const unsigned int requested_sizes[])
 {
 	unsigned int num_planes = 0, num_buffers, allocated_buffers;
 	unsigned plane_sizes[VB2_MAX_PLANES] = { };
+	bool consistent_mem = true;
 	int ret;
 
 	if (q->num_buffers == VB2_MAX_FRAME) {
@@ -824,9 +851,13 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 		memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
 		q->memory = memory;
 		q->waiting_for_buffers = !q->is_output;
-	} else if (q->memory != memory) {
-		dprintk(1, "memory model mismatch\n");
-		return -EINVAL;
+	} else {
+		if (q->memory != memory) {
+			dprintk(1, "memory model mismatch\n");
+			return -EINVAL;
+		}
+		if (!verify_consistency_attr(q, consistent_mem))
+			return -EINVAL;
 	}
 
 	num_buffers = min(*count, VB2_MAX_FRAME - q->num_buffers);
@@ -845,6 +876,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 	if (ret)
 		return ret;
 
+	set_queue_consistency(q, consistent_mem);
 	/* Finally, allocate buffers and video memory */
 	allocated_buffers = __vb2_queue_alloc(q, memory, num_buffers,
 				num_planes, plane_sizes);
@@ -2498,7 +2530,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 	fileio->memory = VB2_MEMORY_MMAP;
 	fileio->type = q->type;
 	q->fileio = fileio;
-	ret = vb2_core_reqbufs(q, fileio->memory, &fileio->count);
+	ret = vb2_core_reqbufs(q, fileio->memory, 0, &fileio->count);
 	if (ret)
 		goto err_kfree;
 
@@ -2555,7 +2587,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 
 err_reqbufs:
 	fileio->count = 0;
-	vb2_core_reqbufs(q, fileio->memory, &fileio->count);
+	vb2_core_reqbufs(q, fileio->memory, 0, &fileio->count);
 
 err_kfree:
 	q->fileio = NULL;
@@ -2575,7 +2607,7 @@ static int __vb2_cleanup_fileio(struct vb2_queue *q)
 		vb2_core_streamoff(q, q->type);
 		q->fileio = NULL;
 		fileio->count = 0;
-		vb2_core_reqbufs(q, fileio->memory, &fileio->count);
+		vb2_core_reqbufs(q, fileio->memory, 0, &fileio->count);
 		kfree(fileio);
 		dprintk(3, "file io emulator closed\n");
 	}
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 26716055d914..04ea332567b1 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -723,7 +723,7 @@ int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
 	int ret = vb2_verify_memory_type(q, req->memory, req->type);
 
 	fill_buf_caps(q, &req->capabilities);
-	return ret ? ret : vb2_core_reqbufs(q, req->memory, &req->count);
+	return ret ? ret : vb2_core_reqbufs(q, req->memory, 0, &req->count);
 }
 EXPORT_SYMBOL_GPL(vb2_reqbufs);
 
@@ -797,7 +797,7 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 	for (i = 0; i < requested_planes; i++)
 		if (requested_sizes[i] == 0)
 			return -EINVAL;
-	return ret ? ret : vb2_core_create_bufs(q, create->memory,
+	return ret ? ret : vb2_core_create_bufs(q, create->memory, true,
 		&create->count, requested_planes, requested_sizes);
 }
 EXPORT_SYMBOL_GPL(vb2_create_bufs);
@@ -973,7 +973,7 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
 		return res;
 	if (vb2_queue_is_busy(vdev, file))
 		return -EBUSY;
-	res = vb2_core_reqbufs(vdev->queue, p->memory, &p->count);
+	res = vb2_core_reqbufs(vdev->queue, p->memory, 0, &p->count);
 	/* If count == 0, then the owner has released all buffers and he
 	   is no longer owner of the queue. Otherwise we have a new owner. */
 	if (res == 0)
diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
index 6974f1731529..959d110407a4 100644
--- a/drivers/media/dvb-core/dvb_vb2.c
+++ b/drivers/media/dvb-core/dvb_vb2.c
@@ -342,7 +342,7 @@ int dvb_vb2_reqbufs(struct dvb_vb2_ctx *ctx, struct dmx_requestbuffers *req)
 
 	ctx->buf_siz = req->size;
 	ctx->buf_cnt = req->count;
-	ret = vb2_core_reqbufs(&ctx->vb_q, VB2_MEMORY_MMAP, &req->count);
+	ret = vb2_core_reqbufs(&ctx->vb_q, VB2_MEMORY_MMAP, 0, &req->count);
 	if (ret) {
 		ctx->state = DVB_VB2_STATE_NONE;
 		dprintk(1, "[%s] count=%d size=%d errno=%d\n", ctx->name,
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index ccc5c498d3e3..9e68fe043a6c 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -740,6 +740,8 @@ void vb2_core_querybuf(struct vb2_queue *q, unsigned int index, void *pb);
  * vb2_core_reqbufs() - Initiate streaming.
  * @q:		pointer to &struct vb2_queue with videobuf2 queue.
  * @memory:	memory type, as defined by &enum vb2_memory.
+ * @flags:	auxiliary queue/buffer management flags. Currently, the only
+ *		used flag is %V4L2_FLAG_MEMORY_NON_CONSISTENT.
  * @count:	requested buffer count.
  *
  * Videobuf2 core helper to implement VIDIOC_REQBUF() operation. It is called
@@ -764,12 +766,13 @@ void vb2_core_querybuf(struct vb2_queue *q, unsigned int index, void *pb);
  * Return: returns zero on success; an error code otherwise.
  */
 int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
-		unsigned int *count);
+		    unsigned int flags, unsigned int *count);
 
 /**
  * vb2_core_create_bufs() - Allocate buffers and any required auxiliary structs
  * @q: pointer to &struct vb2_queue with videobuf2 queue.
  * @memory: memory type, as defined by &enum vb2_memory.
+ * @flags: auxiliary queue/buffer management flags.
  * @count: requested buffer count.
  * @requested_planes: number of planes requested.
  * @requested_sizes: array with the size of the planes.
@@ -787,7 +790,8 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
  * Return: returns zero on success; an error code otherwise.
  */
 int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
-			 unsigned int *count, unsigned int requested_planes,
+			 unsigned int flags, unsigned int *count,
+			 unsigned int requested_planes,
 			 const unsigned int requested_sizes[]);
 
 /**
-- 
2.26.2

