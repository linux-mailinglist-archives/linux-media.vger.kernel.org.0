Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10A0B151458
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2020 03:57:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbgBDC5G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 21:57:06 -0500
Received: from mail-pf1-f182.google.com ([209.85.210.182]:45937 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727209AbgBDC5F (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Feb 2020 21:57:05 -0500
Received: by mail-pf1-f182.google.com with SMTP id 2so8648154pfg.12
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2020 18:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ynjMjGRfG1bUjxJQNZ1F73iayP+/byptvDIws6P29NM=;
        b=XpxzCTmJjkNl9Thw+PLpSUFXcWgAsaBLq+8wh3qacsFWOKa+7ZHdItPx+Fca0WbVI0
         U4URpLup5mfURIqJfAyF6vWQkVTsdgLZ1HTjislehyYWYRRT96VUrLFd0a6An62qe9y3
         0Okc1fLq2z7t++cJf/uqLbhQyL43iaqKOOVzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ynjMjGRfG1bUjxJQNZ1F73iayP+/byptvDIws6P29NM=;
        b=owCfquSLPisYbUCHnRruTeIdixCw06TCuMKuAyb2XqcG6zwD0+5mqvS1/VAGC2YKIe
         DoIK497xDVq7VYxQO6WPVYxW1aho3HAegLlzEGojwg4K+nsP6xfrQ/L/Dxtnbckvxo6l
         FMPLbKEchnz3A+reRJ8iuEwmm51IsC30sEjBMsuF//jXWIMlANxYsZHoLAfojQr7gHMH
         bZ9zkjz4T7Dbg1wkXKFlQPjmhZn7nfPFmKzB0CyHToCAQ2cXaWLjnflwOTngbATW3CfP
         LsPPLpzM49ZO+3CznKjUSe1jVux02b8htkWDxpzViC5XpYNYbbPPglqaZetcasIYzRSj
         m7PQ==
X-Gm-Message-State: APjAAAUdR2OxoxjZ0BYAACYhZGUu0hPW9prwYpd+TnVdsBxk+KkyQSKM
        XNPMXCp7rih0cm0Fqz8NzOlAX8fxaon7LQ==
X-Google-Smtp-Source: APXvYqznDDT+Vo7xL2rL9nEuP0bCv0UNR9+m5bCNp047RV+Le8xlpd5sN5h1pH1Gm3qlcLMCXyMedw==
X-Received: by 2002:a63:f202:: with SMTP id v2mr28272709pgh.420.1580785023546;
        Mon, 03 Feb 2020 18:57:03 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id e1sm22491971pfl.98.2020.02.03.18.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 18:57:03 -0800 (PST)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [RFC][PATCHv2 04/12] videobuf2: add queue memory consistency parameter
Date:   Tue,  4 Feb 2020 11:56:33 +0900
Message-Id: <20200204025641.218376-5-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200204025641.218376-1-senozhatsky@chromium.org>
References: <20200204025641.218376-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Preparations for future V4L2_FLAG_MEMORY_NON_CONSISTENT support.

Extend vb2_core_reqbufs() with queue memory consistency flag
that is applied to the newly allocated buffers.

An attempt to allocate a buffer with consistency requirements
which don't match queue's consistency model will fail.

Change-Id: Ia40362553b6bd96fea3b652f4a376e7a3467df0a
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/common/videobuf2/videobuf2-core.c   | 47 +++++++++++++++----
 .../media/common/videobuf2/videobuf2-v4l2.c   |  6 +--
 drivers/media/dvb-core/dvb_vb2.c              |  2 +-
 include/media/videobuf2-core.h                |  7 ++-
 4 files changed, 47 insertions(+), 15 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 4489744fbbd9..56fd17eafb6c 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -664,8 +664,19 @@ int vb2_verify_memory_type(struct vb2_queue *q,
 }
 EXPORT_SYMBOL(vb2_verify_memory_type);
 
+static void set_queue_consistency(struct vb2_queue *q, bool consistent_mem)
+{
+	if (!q->allow_cache_hints)
+		return;
+
+	if (consistent_mem)
+		q->dma_attrs &= ~DMA_ATTR_NON_CONSISTENT;
+	else
+		q->dma_attrs |= DMA_ATTR_NON_CONSISTENT;
+}
+
 int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
-		unsigned int *count)
+		bool consistent_mem, unsigned int *count)
 {
 	unsigned int num_buffers, allocated_buffers, num_planes = 0;
 	unsigned plane_sizes[VB2_MAX_PLANES] = { };
@@ -720,6 +731,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	num_buffers = min_t(unsigned int, num_buffers, VB2_MAX_FRAME);
 	memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
 	q->memory = memory;
+	set_queue_consistency(q, consistent_mem);
 
 	/*
 	 * Ask the driver how many buffers and planes per buffer it requires.
@@ -803,9 +815,21 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 }
 EXPORT_SYMBOL_GPL(vb2_core_reqbufs);
 
+static bool verify_consistency_attr(struct vb2_queue *q, bool consistent_mem)
+{
+	bool queue_attr = q->dma_attrs & DMA_ATTR_NON_CONSISTENT;
+
+	if (consistent_mem != queue_attr) {
+		dprintk(1, "memory consistency model mismatch\n");
+		return false;
+	}
+	return true;
+}
+
 int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
-		unsigned int *count, unsigned requested_planes,
-		const unsigned requested_sizes[])
+			 bool consistent_mem, unsigned int *count,
+			 unsigned requested_planes,
+			 const unsigned requested_sizes[])
 {
 	unsigned int num_planes = 0, num_buffers, allocated_buffers;
 	unsigned plane_sizes[VB2_MAX_PLANES] = { };
@@ -823,10 +847,15 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 		}
 		memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
 		q->memory = memory;
+		set_queue_consistency(q, consistent_mem);
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
@@ -2498,7 +2527,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 	fileio->memory = VB2_MEMORY_MMAP;
 	fileio->type = q->type;
 	q->fileio = fileio;
-	ret = vb2_core_reqbufs(q, fileio->memory, &fileio->count);
+	ret = vb2_core_reqbufs(q, fileio->memory, true, &fileio->count);
 	if (ret)
 		goto err_kfree;
 
@@ -2555,7 +2584,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 
 err_reqbufs:
 	fileio->count = 0;
-	vb2_core_reqbufs(q, fileio->memory, &fileio->count);
+	vb2_core_reqbufs(q, fileio->memory, true, &fileio->count);
 
 err_kfree:
 	q->fileio = NULL;
@@ -2575,7 +2604,7 @@ static int __vb2_cleanup_fileio(struct vb2_queue *q)
 		vb2_core_streamoff(q, q->type);
 		q->fileio = NULL;
 		fileio->count = 0;
-		vb2_core_reqbufs(q, fileio->memory, &fileio->count);
+		vb2_core_reqbufs(q, fileio->memory, true, &fileio->count);
 		kfree(fileio);
 		dprintk(3, "file io emulator closed\n");
 	}
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 2da06a2ad6c4..7cdfcd1baf82 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -709,7 +709,7 @@ int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
 	int ret = vb2_verify_memory_type(q, req->memory, req->type);
 
 	fill_buf_caps(q, &req->capabilities);
-	return ret ? ret : vb2_core_reqbufs(q, req->memory, &req->count);
+	return ret ? ret : vb2_core_reqbufs(q, req->memory, true, &req->count);
 }
 EXPORT_SYMBOL_GPL(vb2_reqbufs);
 
@@ -783,7 +783,7 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 	for (i = 0; i < requested_planes; i++)
 		if (requested_sizes[i] == 0)
 			return -EINVAL;
-	return ret ? ret : vb2_core_create_bufs(q, create->memory,
+	return ret ? ret : vb2_core_create_bufs(q, create->memory, true,
 		&create->count, requested_planes, requested_sizes);
 }
 EXPORT_SYMBOL_GPL(vb2_create_bufs);
@@ -959,7 +959,7 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
 		return res;
 	if (vb2_queue_is_busy(vdev, file))
 		return -EBUSY;
-	res = vb2_core_reqbufs(vdev->queue, p->memory, &p->count);
+	res = vb2_core_reqbufs(vdev->queue, p->memory, true, &p->count);
 	/* If count == 0, then the owner has released all buffers and he
 	   is no longer owner of the queue. Otherwise we have a new owner. */
 	if (res == 0)
diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
index 6974f1731529..e60063652164 100644
--- a/drivers/media/dvb-core/dvb_vb2.c
+++ b/drivers/media/dvb-core/dvb_vb2.c
@@ -342,7 +342,7 @@ int dvb_vb2_reqbufs(struct dvb_vb2_ctx *ctx, struct dmx_requestbuffers *req)
 
 	ctx->buf_siz = req->size;
 	ctx->buf_cnt = req->count;
-	ret = vb2_core_reqbufs(&ctx->vb_q, VB2_MEMORY_MMAP, &req->count);
+	ret = vb2_core_reqbufs(&ctx->vb_q, VB2_MEMORY_MMAP, true, &req->count);
 	if (ret) {
 		ctx->state = DVB_VB2_STATE_NONE;
 		dprintk(1, "[%s] count=%d size=%d errno=%d\n", ctx->name,
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 026004180440..5e5450bdabbd 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -726,6 +726,7 @@ void vb2_core_querybuf(struct vb2_queue *q, unsigned int index, void *pb);
  * vb2_core_reqbufs() - Initiate streaming.
  * @q:		pointer to &struct vb2_queue with videobuf2 queue.
  * @memory:	memory type, as defined by &enum vb2_memory.
+ * @consistent_mem:	memory consistency model.
  * @count:	requested buffer count.
  *
  * Videobuf2 core helper to implement VIDIOC_REQBUF() operation. It is called
@@ -750,12 +751,13 @@ void vb2_core_querybuf(struct vb2_queue *q, unsigned int index, void *pb);
  * Return: returns zero on success; an error code otherwise.
  */
 int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
-		unsigned int *count);
+		bool consistent_mem, unsigned int *count);
 
 /**
  * vb2_core_create_bufs() - Allocate buffers and any required auxiliary structs
  * @q: pointer to &struct vb2_queue with videobuf2 queue.
  * @memory: memory type, as defined by &enum vb2_memory.
+ * @consistent_mem: memory consistency model.
  * @count: requested buffer count.
  * @requested_planes: number of planes requested.
  * @requested_sizes: array with the size of the planes.
@@ -773,7 +775,8 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
  * Return: returns zero on success; an error code otherwise.
  */
 int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
-			 unsigned int *count, unsigned int requested_planes,
+			 bool consistent_mem, unsigned int *count,
+			 unsigned int requested_planes,
 			 const unsigned int requested_sizes[]);
 
 /**
-- 
2.25.0.341.g760bfbb309-goog

