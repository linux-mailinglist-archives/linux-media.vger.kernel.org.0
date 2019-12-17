Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2C512227E
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 04:21:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727393AbfLQDU7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 22:20:59 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40189 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727351AbfLQDU6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 22:20:58 -0500
Received: by mail-pf1-f194.google.com with SMTP id q8so6728174pfh.7
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2019 19:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FZaVeJ1PcpIK1+RAgv+t01ZSozUenljGrTod0GVW8cM=;
        b=UP/Ni4kCwtM4CJbIx5FkbMSeWzYLsbm1yhBu3gEXT7WHHlsPXSgA56HyxkEfh8qdjJ
         IDej9jhliSUBzQlQIJ43tGwEaL0dXZn3s7B+oSOzivKuVX5C3UIPhpmj9J3ZhS6lVeFW
         3MeMCMBEx3bAgTUK9xKU8tleckIZDR9Q8ITG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FZaVeJ1PcpIK1+RAgv+t01ZSozUenljGrTod0GVW8cM=;
        b=o/+pbTfiIsoXwudJSV1ZHTG6K3aCf/I5rnEutx06AC0GesQeSIlf6cMCt2Q4YjaP/L
         I0wvraS6uOQrmP937bn4pZP686jEHAaI26F685J7KzO/XPVzXvt6BdM48Mha4eIzEOnz
         yM4Zrha3hv2pEI016XVm9VCQqOvb+0Rri8sGba8s9BWDljlUU7de4NscimiAaUz1d8XV
         mT82SMmTmAe4IICIcfdDZCt1m85qGP1pT5dDnBe3RgM5kI35NZKDHWX7hAf+NTAI6DaF
         i3LaerTv9TNhMkSJUlbL/8sc4ZZEDJzYKIa9dGBkKniB7RL5+lrP5t2aj/zGfQ/VMQCP
         YgAw==
X-Gm-Message-State: APjAAAW/KEbZtZzEFK35qH4/P0RAlXFQZpZbVu7rsNu9dj/C859HrRv9
        mnRdSr9TNdfy+0LEjMnt8InHpg==
X-Google-Smtp-Source: APXvYqzWlMHyMZoG/nm6t6U32w0jijpNQVnnJZCAUGdgiXRK3mUZ6A/LrGPH/s4Aa5Q1o38IzWq1dA==
X-Received: by 2002:a62:f842:: with SMTP id c2mr20092420pfm.104.1576552857748;
        Mon, 16 Dec 2019 19:20:57 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
        by smtp.gmail.com with ESMTPSA id j3sm24387455pfi.8.2019.12.16.19.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 19:20:57 -0800 (PST)
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
Subject: [RFC][PATCH 04/15] videobuf2: add queue memory consistency parameter
Date:   Tue, 17 Dec 2019 12:20:23 +0900
Message-Id: <20191217032034.54897-5-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191217032034.54897-1-senozhatsky@chromium.org>
References: <20191217032034.54897-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Preparations for future V4L2_FLAG_MEMORY_NON_CONSISTENT support.

Extend vb2_core_reqbufs() with queue memory consistency flag.
API permits queue's consistency attribute adjustment only if
the queue has no allocated buffers, not busy, and does not have
buffers waiting to be de-queued.

If user-space attempts to allocate a buffer with consistency
requirements which don't match queue's consistency model such
allocation requests will be failed.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 17 +++++++++++++----
 drivers/media/common/videobuf2/videobuf2-v4l2.c |  4 ++--
 drivers/media/dvb-core/dvb_vb2.c                |  2 +-
 include/media/videobuf2-core.h                  |  3 ++-
 4 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 4489744fbbd9..668c56df13f6 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -664,8 +664,16 @@ int vb2_verify_memory_type(struct vb2_queue *q,
 }
 EXPORT_SYMBOL(vb2_verify_memory_type);
 
+static void __set_queue_consistency(struct vb2_queue *q, bool consistent_mem)
+{
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
@@ -720,6 +728,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	num_buffers = min_t(unsigned int, num_buffers, VB2_MAX_FRAME);
 	memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
 	q->memory = memory;
+	__set_queue_consistency(q, consistent_mem);
 
 	/*
 	 * Ask the driver how many buffers and planes per buffer it requires.
@@ -2498,7 +2507,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 	fileio->memory = VB2_MEMORY_MMAP;
 	fileio->type = q->type;
 	q->fileio = fileio;
-	ret = vb2_core_reqbufs(q, fileio->memory, &fileio->count);
+	ret = vb2_core_reqbufs(q, fileio->memory, true, &fileio->count);
 	if (ret)
 		goto err_kfree;
 
@@ -2555,7 +2564,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 
 err_reqbufs:
 	fileio->count = 0;
-	vb2_core_reqbufs(q, fileio->memory, &fileio->count);
+	vb2_core_reqbufs(q, fileio->memory, true, &fileio->count);
 
 err_kfree:
 	q->fileio = NULL;
@@ -2575,7 +2584,7 @@ static int __vb2_cleanup_fileio(struct vb2_queue *q)
 		vb2_core_streamoff(q, q->type);
 		q->fileio = NULL;
 		fileio->count = 0;
-		vb2_core_reqbufs(q, fileio->memory, &fileio->count);
+		vb2_core_reqbufs(q, fileio->memory, true, &fileio->count);
 		kfree(fileio);
 		dprintk(3, "file io emulator closed\n");
 	}
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 2fccfe2a57f8..f1e88c9398c7 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -695,7 +695,7 @@ int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
 	int ret = vb2_verify_memory_type(q, req->memory, req->type);
 
 	fill_buf_caps(q, &req->capabilities);
-	return ret ? ret : vb2_core_reqbufs(q, req->memory, &req->count);
+	return ret ? ret : vb2_core_reqbufs(q, req->memory, true, &req->count);
 }
 EXPORT_SYMBOL_GPL(vb2_reqbufs);
 
@@ -945,7 +945,7 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
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
index 026004180440..810af5cf5742 100644
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
@@ -750,7 +751,7 @@ void vb2_core_querybuf(struct vb2_queue *q, unsigned int index, void *pb);
  * Return: returns zero on success; an error code otherwise.
  */
 int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
-		unsigned int *count);
+		bool consistent_mem, unsigned int *count);
 
 /**
  * vb2_core_create_bufs() - Allocate buffers and any required auxiliary structs
-- 
2.24.1.735.g03f4e72817-goog

