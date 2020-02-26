Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F7B416FD1B
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 12:16:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728214AbgBZLQC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 06:16:02 -0500
Received: from mail-pf1-f181.google.com ([209.85.210.181]:42274 "EHLO
        mail-pf1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728194AbgBZLQA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 06:16:00 -0500
Received: by mail-pf1-f181.google.com with SMTP id 4so1292174pfz.9
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2020 03:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1b4BHY4Of9J2wXt5wOHz3QidKmwZ0F/AozbgxSE3cO8=;
        b=SAZOfwtK6SSVQoymLsa5PAHPUJIPybhx/Gej0uJL9fQ/kheu+rsXHdueZiDi/dGu/t
         KgBIhBO8uooNALnzkBzgVMZcNhdhHaQ7iRvyz9rISGBn5pN915cpQxn3O0U5/NtoY9Vf
         0d4zoIb6+rwFQfyB2IEiIlve4DLTY6+RPAyms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1b4BHY4Of9J2wXt5wOHz3QidKmwZ0F/AozbgxSE3cO8=;
        b=k6nxRuhghnKKIxJx7RQjYTOIlHO54sR0ycbMVlmH29OByAptBA1J/uLo6ZuoiVtumu
         r4l1Rm60Dh5Hxtohm+29MBKEkwJjl5eNvEnONccjQJIJVknG8XZJIVwcM2wJpxYvwgZX
         WUFRfjGPc726syKzPX06KE4yt24zQhbRnJgzndDJU1LCvLuTtiUld1EgY080Uuo8ZO1E
         MSCnwNggv2m3imXvU3+MXeMK6CtsEo5GMikH8nhQvL4D2vOMlqgmwZPUjxHGhFEzf3pV
         BZ34zjnxYBDIaQFs77Rh8N5NhKe0S/KvSvNZG9pZ30tfKyBQmnX+vsyMckPTt7kwUyNL
         4s1g==
X-Gm-Message-State: APjAAAUFcyIqCa+gt+Zz8K4LDGnVWTw+sHoUtXd40Pu0i4nbKkBUT1fy
        apx/XVC2L2sVeYJAlhdqy0Ulew==
X-Google-Smtp-Source: APXvYqy7REmbeSoGabrHJosEy+e9RIQwVJI6151RJ0mudVDjtZ0j1zOMaWSoaqNNZbRhk5uoQyCWIQ==
X-Received: by 2002:a63:da49:: with SMTP id l9mr3394339pgj.125.1582715758282;
        Wed, 26 Feb 2020 03:15:58 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id o22sm2429993pgj.58.2020.02.26.03.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 03:15:57 -0800 (PST)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 04/11] videobuf2: add queue memory consistency parameter
Date:   Wed, 26 Feb 2020 20:15:22 +0900
Message-Id: <20200226111529.180197-5-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200226111529.180197-1-senozhatsky@chromium.org>
References: <20200226111529.180197-1-senozhatsky@chromium.org>
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

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/common/videobuf2/videobuf2-core.c   | 47 +++++++++++++++----
 .../media/common/videobuf2/videobuf2-v4l2.c   |  6 +--
 drivers/media/dvb-core/dvb_vb2.c              |  2 +-
 include/media/videobuf2-core.h                |  7 ++-
 4 files changed, 47 insertions(+), 15 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 4489744fbbd9..3ca0545db7ee 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -664,8 +664,19 @@ int vb2_verify_memory_type(struct vb2_queue *q,
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
index f91cba37e223..cc31629c06dc 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -724,7 +724,7 @@ int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
 	int ret = vb2_verify_memory_type(q, req->memory, req->type);
 
 	fill_buf_caps(q, &req->capabilities);
-	return ret ? ret : vb2_core_reqbufs(q, req->memory, &req->count);
+	return ret ? ret : vb2_core_reqbufs(q, req->memory, true, &req->count);
 }
 EXPORT_SYMBOL_GPL(vb2_reqbufs);
 
@@ -798,7 +798,7 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 	for (i = 0; i < requested_planes; i++)
 		if (requested_sizes[i] == 0)
 			return -EINVAL;
-	return ret ? ret : vb2_core_create_bufs(q, create->memory,
+	return ret ? ret : vb2_core_create_bufs(q, create->memory, true,
 		&create->count, requested_planes, requested_sizes);
 }
 EXPORT_SYMBOL_GPL(vb2_create_bufs);
@@ -974,7 +974,7 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
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
index d307869bfb15..d7fbf2ae9979 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -737,6 +737,7 @@ void vb2_core_querybuf(struct vb2_queue *q, unsigned int index, void *pb);
  * vb2_core_reqbufs() - Initiate streaming.
  * @q:		pointer to &struct vb2_queue with videobuf2 queue.
  * @memory:	memory type, as defined by &enum vb2_memory.
+ * @consistent_mem:	memory consistency model.
  * @count:	requested buffer count.
  *
  * Videobuf2 core helper to implement VIDIOC_REQBUF() operation. It is called
@@ -761,12 +762,13 @@ void vb2_core_querybuf(struct vb2_queue *q, unsigned int index, void *pb);
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
@@ -784,7 +786,8 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
  * Return: returns zero on success; an error code otherwise.
  */
 int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
-			 unsigned int *count, unsigned int requested_planes,
+			 bool consistent_mem, unsigned int *count,
+			 unsigned int requested_planes,
 			 const unsigned int requested_sizes[]);
 
 /**
-- 
2.25.0.265.gbab2e86ba0-goog

