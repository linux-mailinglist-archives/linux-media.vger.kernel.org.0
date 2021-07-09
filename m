Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1C933C2164
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 11:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbhGIJXW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 05:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231896AbhGIJXW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 05:23:22 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B8E8C0613E6
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 02:20:39 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id d12so9338526pgd.9
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 02:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ugzgNN1ObwgKHH8psgL1JiMqVtKPGcngLVvkkhu9MxA=;
        b=FQFKAvQv4U3Qbun6d7wLCXZnYMxAOrbo4PRvhPTsb4NqtAbv//4EYsU2UW3lVdPtwf
         qV6Vts31DGtzjZEBEg7pwC4HlL+/Gf8/08wZg8ipEFfHCVkn5kclPzKfT56tpp25qljM
         AfK6WaU2eayoWyMS0XeQUUPLX2eYtDdl9J3ZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ugzgNN1ObwgKHH8psgL1JiMqVtKPGcngLVvkkhu9MxA=;
        b=JhpOu6Z7SlYitBw7F3qJDHOR4Y5RgYCw5zATCUOd4JB4onXmPlOUDJcXH+HPsnCo3O
         zI5nqjluLe/GvcSPKZMVg0G5sEVkE0UuRRC1/EPb1WiItD/mwiLWD6mATxYAg50VuSOj
         DXSfb0F5y7MH0C5WlkZ95u7/ib20REuEUBlYgepcDJroXGulY3Sy0PvNbMyWi9GotxMn
         +Y18QkaWf7yRQYsHeY9RHFpyreaI3lkQ2jEXoj2XHupQjOabKLBDSR64oZQzYUswxQK8
         1oUZoinsetiIsMITc7oxfpItMJx6jvaXsTCkvf96mfH96uelJyQo55TUQ9vL3xTQCSGj
         lZVw==
X-Gm-Message-State: AOAM530RAbgcExxgvCko/4gOoLCuQRgPrgyRjFUKcmepWI5yJTqugEw+
        9bYPh5mZ3rvHq96qFusgFfvVQA==
X-Google-Smtp-Source: ABdhPJzzRvA0LHXk8sPBJPm1l410V5VZpyl89Fu07yxD7pVsacArGYlWrYpzjR0UeDXch+hlz4X/lg==
X-Received: by 2002:a63:4201:: with SMTP id p1mr37265534pga.386.1625822438785;
        Fri, 09 Jul 2021 02:20:38 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:a30d:fc4:7834:ee08])
        by smtp.gmail.com with ESMTPSA id e24sm5496539pfn.127.2021.07.09.02.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 02:20:38 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 2/8] videobuf2: inverse buffer cache_hints flags
Date:   Fri,  9 Jul 2021 18:20:21 +0900
Message-Id: <20210709092027.1050834-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210709092027.1050834-1-senozhatsky@chromium.org>
References: <20210709092027.1050834-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It would be less error prone if the default cache hints value
(we kzalloc() structs, so it's zeroed out by default) would be
to "always sync/flush" caches. Inverse and rename cache hints
flags.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/common/videobuf2/videobuf2-core.c   | 31 ++++++-------------
 .../media/common/videobuf2/videobuf2-v4l2.c   | 17 +++-------
 include/media/videobuf2-core.h                | 12 +++----
 3 files changed, 21 insertions(+), 39 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 9a5cc3e63439..23e41fec9880 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -327,12 +327,12 @@ static void __vb2_buf_mem_prepare(struct vb2_buffer *vb)
 	if (vb->synced)
 		return;
 
-	if (vb->need_cache_sync_on_prepare) {
-		for (plane = 0; plane < vb->num_planes; ++plane)
-			call_void_memop(vb, prepare,
-					vb->planes[plane].mem_priv);
-	}
 	vb->synced = 1;
+	if (vb->skip_cache_sync_on_prepare)
+		return;
+
+	for (plane = 0; plane < vb->num_planes; ++plane)
+		call_void_memop(vb, prepare, vb->planes[plane].mem_priv);
 }
 
 /*
@@ -346,12 +346,12 @@ static void __vb2_buf_mem_finish(struct vb2_buffer *vb)
 	if (!vb->synced)
 		return;
 
-	if (vb->need_cache_sync_on_finish) {
-		for (plane = 0; plane < vb->num_planes; ++plane)
-			call_void_memop(vb, finish,
-					vb->planes[plane].mem_priv);
-	}
 	vb->synced = 0;
+	if (vb->skip_cache_sync_on_finish)
+		return;
+
+	for (plane = 0; plane < vb->num_planes; ++plane)
+		call_void_memop(vb, finish, vb->planes[plane].mem_priv);
 }
 
 /*
@@ -415,17 +415,6 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 		vb->index = q->num_buffers + buffer;
 		vb->type = q->type;
 		vb->memory = memory;
-		/*
-		 * We need to set these flags here so that the videobuf2 core
-		 * will call ->prepare()/->finish() cache sync/flush on vb2
-		 * buffers when appropriate. However, we can avoid explicit
-		 * ->prepare() and ->finish() cache sync for DMABUF buffers,
-		 * because DMA exporter takes care of it.
-		 */
-		if (q->memory != VB2_MEMORY_DMABUF) {
-			vb->need_cache_sync_on_prepare = 1;
-			vb->need_cache_sync_on_finish = 1;
-		}
 		for (plane = 0; plane < num_planes; ++plane) {
 			vb->planes[plane].length = plane_sizes[plane];
 			vb->planes[plane].min_length = plane_sizes[plane];
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 2988bb38ceb1..454d58268602 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -351,18 +351,11 @@ static void set_buffer_cache_hints(struct vb2_queue *q,
 	 * we always need ->prepare() or/and ->finish() cache sync.
 	 */
 	if (q->memory == VB2_MEMORY_DMABUF) {
-		vb->need_cache_sync_on_finish = 0;
-		vb->need_cache_sync_on_prepare = 0;
+		vb->skip_cache_sync_on_finish = 1;
+		vb->skip_cache_sync_on_prepare = 1;
 		return;
 	}
 
-	/*
-	 * Cache sync/invalidation flags are set by default in order to
-	 * preserve existing behaviour for old apps/drivers.
-	 */
-	vb->need_cache_sync_on_prepare = 1;
-	vb->need_cache_sync_on_finish = 1;
-
 	if (!vb2_queue_allows_cache_hints(q)) {
 		/*
 		 * Clear buffer cache flags if queue does not support user
@@ -379,13 +372,13 @@ static void set_buffer_cache_hints(struct vb2_queue *q,
 	 * TO_DEVICE.
 	 */
 	if (q->dma_dir == DMA_TO_DEVICE)
-		vb->need_cache_sync_on_finish = 0;
+		vb->skip_cache_sync_on_finish = 1;
 
 	if (b->flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE)
-		vb->need_cache_sync_on_finish = 0;
+		vb->skip_cache_sync_on_finish = 1;
 
 	if (b->flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN)
-		vb->need_cache_sync_on_prepare = 0;
+		vb->skip_cache_sync_on_prepare = 1;
 }
 
 static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 3b5986cee073..66e548268242 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -267,10 +267,10 @@ struct vb2_buffer {
 	 *			after the 'buf_finish' op is called.
 	 * copied_timestamp:	the timestamp of this capture buffer was copied
 	 *			from an output buffer.
-	 * need_cache_sync_on_prepare: when set buffer's ->prepare() function
-	 *			performs cache sync/invalidation.
-	 * need_cache_sync_on_finish: when set buffer's ->finish() function
-	 *			performs cache sync/invalidation.
+	 * skip_cache_sync_on_prepare: when set buffer's ->prepare() function
+	 *			skips cache sync/invalidation.
+	 * skip_cache_sync_on_finish: when set buffer's ->finish() function
+	 *			skips cache sync/invalidation.
 	 * queued_entry:	entry on the queued buffers list, which holds
 	 *			all buffers queued from userspace
 	 * done_entry:		entry on the list that stores all buffers ready
@@ -281,8 +281,8 @@ struct vb2_buffer {
 	unsigned int		synced:1;
 	unsigned int		prepared:1;
 	unsigned int		copied_timestamp:1;
-	unsigned int		need_cache_sync_on_prepare:1;
-	unsigned int		need_cache_sync_on_finish:1;
+	unsigned int		skip_cache_sync_on_prepare:1;
+	unsigned int		skip_cache_sync_on_finish:1;
 
 	struct vb2_plane	planes[VB2_MAX_PLANES];
 	struct list_head	queued_entry;
-- 
2.32.0.93.g670b81a890-goog

