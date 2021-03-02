Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E82332A846
	for <lists+linux-media@lfdr.de>; Tue,  2 Mar 2021 18:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380312AbhCBR1W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Mar 2021 12:27:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377600AbhCBAr6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 19:47:58 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85404C061793
        for <linux-media@vger.kernel.org>; Mon,  1 Mar 2021 16:46:45 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id h4so12691224pgf.13
        for <linux-media@vger.kernel.org>; Mon, 01 Mar 2021 16:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ASE6m06vrvMETYvg+NIMZc+pY1fItncWUFh4W1GAivg=;
        b=V2IHXOPvC9q0RU/CgjnsWAQ5lqfBWQ3/EfhqPQpwGn91QTR6PH4haf4ms3gnxCDeRQ
         h012anP+SBWwC9DxkQTfcxpwzXOs+b0NFc4Af12tlD/DoOqf5pywmjxilN+HNPxDbOwm
         dWDIFcf5C9KACFuNTvhiODFb72juyBBfeKuiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ASE6m06vrvMETYvg+NIMZc+pY1fItncWUFh4W1GAivg=;
        b=YTjSyohljHY+L1ytxQTT1chggOoq1NBByd0Jw8kGEcy4jskgBn318bYq9UnlmM9mDm
         5PY4jRNNZefpig7PSOO8anPbRf/abXC1J7DzLfGsO7ruyiS5K/d+FhK/CUtWfpaFz0Hc
         KcfwwXJwP075fC9qn6rIEM8QrTkGnuKSry7ktdejL3PtNiTkog52IVPslGcG3IfotiQ/
         zLagi1p6LiMEgW5vwxj+wEm8iisJULeUWoqTAdQsStBtrStpAm+yXuEvTWd5P2vOGVTq
         e7o2VxXekKKOcTFBMLTjy5XBQxAD+B+G0GuXC2TLovpoF5Gbi5jgpHaQVsMP360btxtq
         WAnA==
X-Gm-Message-State: AOAM532rNfPcS756cX6VoPmarduk7XTORrEdSX+RPUYwBAPGy+7W29Nr
        dHDpRFiKe2b92jgw5yNFKajZLg==
X-Google-Smtp-Source: ABdhPJyC5cnDJ7ETq/DVui6HYbqvD4xAFUyy1yQXn0y0u2i6c8pEaD8Tm2L332C//pJ9vS8zYHvpeA==
X-Received: by 2002:a63:5464:: with SMTP id e36mr13066308pgm.223.1614646004919;
        Mon, 01 Mar 2021 16:46:44 -0800 (PST)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:d5d7:1a61:2cdf:273c])
        by smtp.gmail.com with ESMTPSA id b14sm678881pji.14.2021.03.01.16.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 16:46:44 -0800 (PST)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 2/8] videobuf2: inverse buffer cache_hints flags
Date:   Tue,  2 Mar 2021 09:46:18 +0900
Message-Id: <20210302004624.31294-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210302004624.31294-1-senozhatsky@chromium.org>
References: <20210302004624.31294-1-senozhatsky@chromium.org>
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
index 7e96f67c60ba..db93678860bd 100644
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
index d0d85be4809b..48f57a54ddb1 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -265,10 +265,10 @@ struct vb2_buffer {
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
@@ -279,8 +279,8 @@ struct vb2_buffer {
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
2.30.1.766.gb4fecdf3b7-goog

