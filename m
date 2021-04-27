Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5228936C6D2
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 15:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237443AbhD0NPF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 09:15:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236959AbhD0NPC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 09:15:02 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAEC7C06138B
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 06:14:13 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id m6-20020a17090a8586b02901507e1acf0fso7183746pjn.3
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 06:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fUWRCaEtdKdSpUM0RQhyS1J9hLHp8I8tcAhUrT5YG9g=;
        b=Cn/8kKxpLeTsr0gYkkqYY1kj0vXWGl6VTeGg/mC7GerlTuSTBduxWwSpkXno/2a5Zs
         8uRVKZjBSvoQ9QZUKxnG4ADP64Gnud6BhANIhc2/uiwHtFSGJrx76IyAVlUc8xxKkamM
         mf6M/NMU3095ShLWkNzARr12E8ne5giwbbov0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fUWRCaEtdKdSpUM0RQhyS1J9hLHp8I8tcAhUrT5YG9g=;
        b=VqW3l2mmc0gauiZ6FA2m2iFroehS330TwlqyfIY89NzfOij09TnOxalVhKGOtgaIGf
         Mn9ErrCX2PWzXS5m52xYXMG9Yuohf8JN/9CE4YKBP0K9NtjUud2ni5MrseWpIJ7DGX7u
         sKZ7NQ1q3e4MkH0AKdDal17JAfvcup31CjfXwfPQ2DyTpS1TRdwkSqZnFDfwgrKG4KGW
         1rKyFqj01yDbJYnJnolSiJ1J0cC7F/DX8WBGFG07NSLQlWUvBsKrVtnWtRRzysrtKfA0
         mTt4BD0G5UYXTc5PIKGmD7b/VfnJwdJ4ln2j3mGvJ5j+eY1Rwh+ffn2eRcC7kGx2dg8I
         2h4g==
X-Gm-Message-State: AOAM5339win8HFJsfIRkmTdMI5XZsTg2ibUFbUg5zWD2xFGCOo0Pf586
        xHg8HUOSz7OrkzviXTcFZ56kAw==
X-Google-Smtp-Source: ABdhPJzfRv0xa/P2I/GcUt3jU23gQEJ6ZfS290bt9me1qSKX608wWPZ840H4vsULCBwP6QCvkY1dDg==
X-Received: by 2002:a17:902:ee94:b029:ed:4204:5e44 with SMTP id a20-20020a170902ee94b02900ed42045e44mr7592801pld.60.1619529253445;
        Tue, 27 Apr 2021 06:14:13 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:8192:3566:9cd4:8ed7])
        by smtp.gmail.com with ESMTPSA id c8sm2755313pfp.160.2021.04.27.06.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 06:14:12 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv2 6/8] videobuf2: add queue memory coherency parameter
Date:   Tue, 27 Apr 2021 22:13:41 +0900
Message-Id: <20210427131344.139443-7-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427131344.139443-1-senozhatsky@chromium.org>
References: <20210427131344.139443-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Preparations for future V4L2_MEMORY_FLAG_NON_COHERENT support.

Extend vb2_core_reqbufs() parameters list to accept requests'
->flags, which will be used for memory coherency configuration.

An attempt to allocate a buffer with coherency requirements
which don't match queue's consistency model will fail.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/common/videobuf2/videobuf2-core.c   | 38 ++++++++++++++++---
 .../media/common/videobuf2/videobuf2-v4l2.c   |  5 ++-
 drivers/media/dvb-core/dvb_vb2.c              |  2 +-
 include/media/videobuf2-core.h                | 10 ++++-
 4 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 55af63d54f23..af4db310cf5e 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -738,11 +738,31 @@ int vb2_verify_memory_type(struct vb2_queue *q,
 }
 EXPORT_SYMBOL(vb2_verify_memory_type);
 
+static void set_queue_coherency(struct vb2_queue *q, bool coherent_mem)
+{
+	q->coherent_mem = 1;
+
+	if (!vb2_queue_allows_cache_hints(q))
+		return;
+	if (!coherent_mem)
+		q->coherent_mem = 0;
+}
+
+static bool verify_coherency_flags(struct vb2_queue *q, bool coherent_mem)
+{
+	if (coherent_mem != q->coherent_mem) {
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
+	bool coherent_mem = true;
 	unsigned int i;
 	int ret;
 
@@ -757,7 +777,8 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	}
 
 	if (*count == 0 || q->num_buffers != 0 ||
-	    (q->memory != VB2_MEMORY_UNKNOWN && q->memory != memory)) {
+	    (q->memory != VB2_MEMORY_UNKNOWN && q->memory != memory) ||
+	    !verify_coherency_flags(q, coherent_mem)) {
 		/*
 		 * We already have buffers allocated, so first check if they
 		 * are not in use and can be freed.
@@ -794,6 +815,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	num_buffers = min_t(unsigned int, num_buffers, VB2_MAX_FRAME);
 	memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
 	q->memory = memory;
+	set_queue_coherency(q, coherent_mem);
 
 	/*
 	 * Ask the driver how many buffers and planes per buffer it requires.
@@ -878,12 +900,13 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 EXPORT_SYMBOL_GPL(vb2_core_reqbufs);
 
 int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
-			 unsigned int *count,
+			 unsigned int flags, unsigned int *count,
 			 unsigned int requested_planes,
 			 const unsigned int requested_sizes[])
 {
 	unsigned int num_planes = 0, num_buffers, allocated_buffers;
 	unsigned plane_sizes[VB2_MAX_PLANES] = { };
+	bool coherent_mem = true;
 	int ret;
 
 	if (q->num_buffers == VB2_MAX_FRAME) {
@@ -899,11 +922,14 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 		memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
 		q->memory = memory;
 		q->waiting_for_buffers = !q->is_output;
+		set_queue_coherency(q, coherent_mem);
 	} else {
 		if (q->memory != memory) {
 			dprintk(q, 1, "memory model mismatch\n");
 			return -EINVAL;
 		}
+		if (!verify_coherency_flags(q, coherent_mem))
+			return -EINVAL;
 	}
 
 	num_buffers = min(*count, VB2_MAX_FRAME - q->num_buffers);
@@ -2576,7 +2602,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 	fileio->memory = VB2_MEMORY_MMAP;
 	fileio->type = q->type;
 	q->fileio = fileio;
-	ret = vb2_core_reqbufs(q, fileio->memory, &fileio->count);
+	ret = vb2_core_reqbufs(q, fileio->memory, 0, &fileio->count);
 	if (ret)
 		goto err_kfree;
 
@@ -2633,7 +2659,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 
 err_reqbufs:
 	fileio->count = 0;
-	vb2_core_reqbufs(q, fileio->memory, &fileio->count);
+	vb2_core_reqbufs(q, fileio->memory, 0, &fileio->count);
 
 err_kfree:
 	q->fileio = NULL;
@@ -2653,7 +2679,7 @@ static int __vb2_cleanup_fileio(struct vb2_queue *q)
 		vb2_core_streamoff(q, q->type);
 		q->fileio = NULL;
 		fileio->count = 0;
-		vb2_core_reqbufs(q, fileio->memory, &fileio->count);
+		vb2_core_reqbufs(q, fileio->memory, 0, &fileio->count);
 		kfree(fileio);
 		dprintk(q, 3, "file io emulator closed\n");
 	}
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index a02f365bbe60..1166d5a9291a 100644
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
@@ -960,7 +961,7 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
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
index 66e548268242..7e748cd09b7a 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -504,6 +504,8 @@ struct vb2_buf_ops {
  * @allow_cache_hints: when set user-space can pass cache management hints in
  *		order to skip cache flush/invalidation on ->prepare() or/and
  *		->finish().
+ * @coherent_mem: when cleared queue will attempt to allocate buffers using
+ *		non-coherent memory.
  * @lock:	pointer to a mutex that protects the &struct vb2_queue. The
  *		driver can set this to a mutex to let the v4l2 core serialize
  *		the queuing ioctls. If the driver wants to handle locking
@@ -583,6 +585,7 @@ struct vb2_queue {
 	unsigned int			uses_qbuf:1;
 	unsigned int			uses_requests:1;
 	unsigned int			allow_cache_hints:1;
+	unsigned int			coherent_mem:1;
 
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
2.31.1.498.g6c1eba8ee3d-goog

