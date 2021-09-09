Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66DF0404938
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 13:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235610AbhIILZ4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 07:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235607AbhIILZx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Sep 2021 07:25:53 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0342C061575
        for <linux-media@vger.kernel.org>; Thu,  9 Sep 2021 04:24:44 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id m26so1500063pff.3
        for <linux-media@vger.kernel.org>; Thu, 09 Sep 2021 04:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=swwocjCHwnFhDv18CR9iA/cY9VhySGC5NfoAXdQgSF0=;
        b=I8Me92RYM8/W/ZtrBDZ9IiE82t7fBH+u3XzkZe/uYnbERfvUjkDmQ9tB8z8pOU3mqv
         2q1Oo7TTaMjt3ZfOFmx1iEXl2rzYSYp96/M7OIWPV5Hh1XpN5+4DE8aGo3krrldNFTk9
         dztPcZMbv689plhnx8PCCIIJqcKKkCOCU4gc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=swwocjCHwnFhDv18CR9iA/cY9VhySGC5NfoAXdQgSF0=;
        b=eulMtay9poK4LmX0zsqrd8Fw3UGxSUYU8Vxgvb9zX/Y6n6ZCb6h7qYYWUktT4am+oH
         cLiev5jUW8i4Uu9NfSNXiL433jr1yC5H340gdyAEkw1XjTg6W1/M2pdkeKr/4Yb4FaK4
         MFuZ20MekpyQuhQPGhLeRcUw2Jxa+SvXSXhAhNTeGR5mf2H2iTY6oAp9yxjFd1XSGyfb
         QFA/1PUC/P4rFPzn8yH6YFNpciLXrexEOU1o6LVesL+c6xnQvdmJbnvpYKuQqZ74nMJk
         YH9AzVOcEXqrko/yS47S1XytF8xSnpU8Zo8DwfGoQe26V3cTnx5EjWJA0yyIq5Rey5qb
         Lf7w==
X-Gm-Message-State: AOAM533BfwGroQA0KGMAn6bxUPpBBI6bptmsdzhrBtduducda1YgTiJd
        AtQzMkQshFusSYjVnOwRWpNx3A==
X-Google-Smtp-Source: ABdhPJzRB2sUjO1t7wJDhEzuCyQoiG8FGy1za7PQD/DCbSph/An5vJPqh4hmca5qiMgXVG5sC86rJA==
X-Received: by 2002:a63:f40b:: with SMTP id g11mr2198564pgi.401.1631186684131;
        Thu, 09 Sep 2021 04:24:44 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:166b:dcfc:dcf2:bbe2])
        by smtp.gmail.com with ESMTPSA id 141sm2046860pgg.16.2021.09.09.04.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 04:24:43 -0700 (PDT)
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
Subject: [PATCHv6 2/8] videobuf2: inverse buffer cache_hints flags
Date:   Thu,  9 Sep 2021 20:24:24 +0900
Message-Id: <20210909112430.61243-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
In-Reply-To: <20210909112430.61243-1-senozhatsky@chromium.org>
References: <20210909112430.61243-1-senozhatsky@chromium.org>
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
index c4ff356da600..9d57df348b5f 100644
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
2.33.0.153.gba50c8fa24-goog

