Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC95F404940
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 13:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235939AbhIIL0J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 07:26:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235980AbhIIL0G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Sep 2021 07:26:06 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C82C061575
        for <linux-media@vger.kernel.org>; Thu,  9 Sep 2021 04:24:57 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id q68so1440440pga.9
        for <linux-media@vger.kernel.org>; Thu, 09 Sep 2021 04:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O8CM0f8scW5RQspnEWbPj2Rku0hsxQtzo6NTJqy7EvU=;
        b=RVSd9kD0gcnGn9KQT98QXnTYPdJ71uZ+bLQ1MwAim+jzoxE1YoH6i5YzYQ3gUF8WUq
         mJRh+CTqPKrV2aHkNwTlhsBMT1B7xrie4uYBNWfrZ+FKsdckUxpMJFgR2oFTQzk8dBnq
         tIvYogsTlCFlC30QD4vrT2bRGI0+w1vk7JC90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O8CM0f8scW5RQspnEWbPj2Rku0hsxQtzo6NTJqy7EvU=;
        b=iJzdTvzlK/zusd4S5Z0edgAs6uTK/8EGsBodfhE20ApB6OC5S+25Jds58ubce3W1dI
         Llb8dspgNvHARZ+hsizHG0Gc1polQnq9erWbHnJ0m6VUjl/DhICt8LlvEd80c94/fiaQ
         YGYPhh9iyEJUJqXyC/FXfRBvfQewsW0ahUx4KDTBrOBXtg8QccO3yiU5XsiwBZde0TnC
         48jzey8DtAiqA11Xd82wTvERTaPdUP7fuqQ6H/rk/eRQ8WbncmOGnwOzAuYw5gPwI49Z
         hG4tz5t6RI6VKy3ehsq/ujNbAK6wd3FbOFxw9RXQM2xP8I/80Iq5w5sFfRaTkssfFZqr
         YCTQ==
X-Gm-Message-State: AOAM5311J1HgzG7ZDnbzVhFCyJkFAEcFjerkDgWJCi6KXhHQsUCTZ2Gx
        DlzzDCquG7kmAUNbyxJNBSk22w==
X-Google-Smtp-Source: ABdhPJx9V1T2vkni8g81sG4ngse9u+awmiJM6Ut2DI+bIf1vnbe8I8FSNDg3xtRPiKQjIdZCwEJhdA==
X-Received: by 2002:a63:6f06:: with SMTP id k6mr2203841pgc.281.1631186696611;
        Thu, 09 Sep 2021 04:24:56 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:166b:dcfc:dcf2:bbe2])
        by smtp.gmail.com with ESMTPSA id 141sm2046860pgg.16.2021.09.09.04.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 04:24:56 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv6 6/8] videobuf2: add queue memory coherency parameter
Date:   Thu,  9 Sep 2021 20:24:28 +0900
Message-Id: <20210909112430.61243-7-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
In-Reply-To: <20210909112430.61243-1-senozhatsky@chromium.org>
References: <20210909112430.61243-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Preparations for future V4L2_MEMORY_FLAG_NON_COHERENT support.

Extend the vb2_core_reqbufs() parameters list to accept requests'
->flags, which will be used for memory coherency configuration.

An attempt to allocate a buffer with coherency requirements
that do not match the queue's consistency model will fail.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/common/videobuf2/videobuf2-core.c   | 37 ++++++++++++++++---
 .../media/common/videobuf2/videobuf2-v4l2.c   |  5 ++-
 drivers/media/dvb-core/dvb_vb2.c              |  2 +-
 include/media/videobuf2-core.h                | 10 ++++-
 4 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 8fa9f92ed028..60fb43b8f134 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -738,11 +738,30 @@ int vb2_verify_memory_type(struct vb2_queue *q,
 }
 EXPORT_SYMBOL(vb2_verify_memory_type);
 
+static void set_queue_coherency(struct vb2_queue *q, bool non_coherent_mem)
+{
+	q->non_coherent_mem = 0;
+
+	if (!vb2_queue_allows_cache_hints(q))
+		return;
+	q->non_coherent_mem = non_coherent_mem;
+}
+
+static bool verify_coherency_flags(struct vb2_queue *q, bool non_coherent_mem)
+{
+	if (non_coherent_mem != q->non_coherent_mem) {
+		dprintk(q, 1, "memory coherency model mismatch\n");
+		return false;
+	}
+	return true;
+}
+
 int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
-		     unsigned int *count)
+		     unsigned int flags, unsigned int *count)
 {
 	unsigned int num_buffers, allocated_buffers, num_planes = 0;
 	unsigned plane_sizes[VB2_MAX_PLANES] = { };
+	bool non_coherent_mem = false;
 	unsigned int i;
 	int ret;
 
@@ -757,7 +776,8 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	}
 
 	if (*count == 0 || q->num_buffers != 0 ||
-	    (q->memory != VB2_MEMORY_UNKNOWN && q->memory != memory)) {
+	    (q->memory != VB2_MEMORY_UNKNOWN && q->memory != memory) ||
+	    !verify_coherency_flags(q, non_coherent_mem)) {
 		/*
 		 * We already have buffers allocated, so first check if they
 		 * are not in use and can be freed.
@@ -794,6 +814,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	num_buffers = min_t(unsigned int, num_buffers, VB2_MAX_FRAME);
 	memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
 	q->memory = memory;
+	set_queue_coherency(q, non_coherent_mem);
 
 	/*
 	 * Ask the driver how many buffers and planes per buffer it requires.
@@ -878,12 +899,13 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 EXPORT_SYMBOL_GPL(vb2_core_reqbufs);
 
 int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
-			 unsigned int *count,
+			 unsigned int flags, unsigned int *count,
 			 unsigned int requested_planes,
 			 const unsigned int requested_sizes[])
 {
 	unsigned int num_planes = 0, num_buffers, allocated_buffers;
 	unsigned plane_sizes[VB2_MAX_PLANES] = { };
+	bool non_coherent_mem = false;
 	int ret;
 
 	if (q->num_buffers == VB2_MAX_FRAME) {
@@ -899,11 +921,14 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 		memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
 		q->memory = memory;
 		q->waiting_for_buffers = !q->is_output;
+		set_queue_coherency(q, non_coherent_mem);
 	} else {
 		if (q->memory != memory) {
 			dprintk(q, 1, "memory model mismatch\n");
 			return -EINVAL;
 		}
+		if (!verify_coherency_flags(q, non_coherent_mem))
+			return -EINVAL;
 	}
 
 	num_buffers = min(*count, VB2_MAX_FRAME - q->num_buffers);
@@ -2608,7 +2633,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 	fileio->memory = VB2_MEMORY_MMAP;
 	fileio->type = q->type;
 	q->fileio = fileio;
-	ret = vb2_core_reqbufs(q, fileio->memory, &fileio->count);
+	ret = vb2_core_reqbufs(q, fileio->memory, 0, &fileio->count);
 	if (ret)
 		goto err_kfree;
 
@@ -2665,7 +2690,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 
 err_reqbufs:
 	fileio->count = 0;
-	vb2_core_reqbufs(q, fileio->memory, &fileio->count);
+	vb2_core_reqbufs(q, fileio->memory, 0, &fileio->count);
 
 err_kfree:
 	q->fileio = NULL;
@@ -2685,7 +2710,7 @@ static int __vb2_cleanup_fileio(struct vb2_queue *q)
 		vb2_core_streamoff(q, q->type);
 		q->fileio = NULL;
 		fileio->count = 0;
-		vb2_core_reqbufs(q, fileio->memory, &fileio->count);
+		vb2_core_reqbufs(q, fileio->memory, 0, &fileio->count);
 		kfree(fileio);
 		dprintk(q, 3, "file io emulator closed\n");
 	}
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 2fbae9bd7b52..b4f70ddb09b0 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -697,7 +697,7 @@ int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
 	int ret = vb2_verify_memory_type(q, req->memory, req->type);
 
 	fill_buf_caps(q, &req->capabilities);
-	return ret ? ret : vb2_core_reqbufs(q, req->memory, &req->count);
+	return ret ? ret : vb2_core_reqbufs(q, req->memory, 0, &req->count);
 }
 EXPORT_SYMBOL_GPL(vb2_reqbufs);
 
@@ -772,6 +772,7 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 		if (requested_sizes[i] == 0)
 			return -EINVAL;
 	return ret ? ret : vb2_core_create_bufs(q, create->memory,
+						0,
 						&create->count,
 						requested_planes,
 						requested_sizes);
@@ -974,7 +975,7 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
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
index 66e548268242..2467284e5f26 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -504,6 +504,8 @@ struct vb2_buf_ops {
  * @allow_cache_hints: when set user-space can pass cache management hints in
  *		order to skip cache flush/invalidation on ->prepare() or/and
  *		->finish().
+ * @non_coherent_mem: when set queue will attempt to allocate buffers using
+ *		non-coherent memory.
  * @lock:	pointer to a mutex that protects the &struct vb2_queue. The
  *		driver can set this to a mutex to let the v4l2 core serialize
  *		the queuing ioctls. If the driver wants to handle locking
@@ -583,6 +585,7 @@ struct vb2_queue {
 	unsigned int			uses_qbuf:1;
 	unsigned int			uses_requests:1;
 	unsigned int			allow_cache_hints:1;
+	unsigned int			non_coherent_mem:1;
 
 	struct mutex			*lock;
 	void				*owner;
@@ -748,6 +751,8 @@ void vb2_core_querybuf(struct vb2_queue *q, unsigned int index, void *pb);
  * vb2_core_reqbufs() - Initiate streaming.
  * @q:		pointer to &struct vb2_queue with videobuf2 queue.
  * @memory:	memory type, as defined by &enum vb2_memory.
+ * @flags:	auxiliary queue/buffer management flags. Currently, the only
+ *		used flag is %V4L2_MEMORY_FLAG_NON_COHERENT.
  * @count:	requested buffer count.
  *
  * Videobuf2 core helper to implement VIDIOC_REQBUF() operation. It is called
@@ -772,12 +777,13 @@ void vb2_core_querybuf(struct vb2_queue *q, unsigned int index, void *pb);
  * Return: returns zero on success; an error code otherwise.
  */
 int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
-		    unsigned int *count);
+		     unsigned int flags, unsigned int *count);
 
 /**
  * vb2_core_create_bufs() - Allocate buffers and any required auxiliary structs
  * @q: pointer to &struct vb2_queue with videobuf2 queue.
  * @memory: memory type, as defined by &enum vb2_memory.
+ * @flags: auxiliary queue/buffer management flags.
  * @count: requested buffer count.
  * @requested_planes: number of planes requested.
  * @requested_sizes: array with the size of the planes.
@@ -795,7 +801,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
  * Return: returns zero on success; an error code otherwise.
  */
 int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
-			 unsigned int *count,
+			 unsigned int flags, unsigned int *count,
 			 unsigned int requested_planes,
 			 const unsigned int requested_sizes[]);
 
-- 
2.33.0.153.gba50c8fa24-goog

