Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D9493D6FE2
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 09:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235672AbhG0HFk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 03:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235659AbhG0HFj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 03:05:39 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC7FBC061760
        for <linux-media@vger.kernel.org>; Tue, 27 Jul 2021 00:05:38 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id g23-20020a17090a5797b02901765d605e14so3571528pji.5
        for <linux-media@vger.kernel.org>; Tue, 27 Jul 2021 00:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=07HE0VrNUfZkB89mAvFQ2KRKLGGcR+3ZU6LDKPfW7qc=;
        b=JwXZ5ZMdzFEzXJbloQT/Yo1S521km77y6TrM9rOoXfZ5Puvz2uN47ZiSP3Rq8mqgxb
         E52ygdIckLSUT6s+gY78kAfCBBFgCYtOyfvnU67TkvtYP25PpB5p6WiEccD2GUtfeOx/
         WwHEyDWn2o6iPuzMC8O/u4+UZcG6MCAyTP/+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=07HE0VrNUfZkB89mAvFQ2KRKLGGcR+3ZU6LDKPfW7qc=;
        b=P+lxhDNxrL01bo7sSkx+jAG81MxyFezTcLIXgjhiXEoB0KrrwR/q81tf5EC3IoC//W
         MCFYK7T4dyTs3PaYd9kt2G7k3FzpUDEUuSjFqoPdDbXrr4oE9aKB3Mp+2a8hzdmVsWS8
         oI+A3YWrHDCpKGHBW85iazm5Drn+KCI3XamXXX1T3DucsoEYHNTjV5x23VPAmFcbd9wH
         qURlvR3Y4j+TIHWKMWqTEmLD/qsftsI9G+RIEXTICo/ZLpmv4QoJWOTN4fj2Tgby/McQ
         GTA36EBFl9sXwogcyyrGpWIQ4ZKqM0Sqir6jM2D9DujtEAHu+w/n2CRiMfg1uWduqTMh
         6WaQ==
X-Gm-Message-State: AOAM533i9XNoubcj1xaF+C+GXkoVFrijWM+5b5O5TNKjc+fFs5/INsRC
        aQmgym9s452XcKp03DfLm5tzMQ==
X-Google-Smtp-Source: ABdhPJxIuvuOKmlzeNwxDX9r8KJ780IjkCO+RSUUzoH1g+EOWpzs0CJQLAyroU4A5WWamB5R5RKPdQ==
X-Received: by 2002:a63:5259:: with SMTP id s25mr22163301pgl.397.1627369538359;
        Tue, 27 Jul 2021 00:05:38 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:ba3e:509b:495:ec84])
        by smtp.gmail.com with ESMTPSA id 30sm2343447pgq.31.2021.07.27.00.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 00:05:37 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 2/8] videobuf2: inverse buffer cache_hints flags
Date:   Tue, 27 Jul 2021 16:05:11 +0900
Message-Id: <20210727070517.443167-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
In-Reply-To: <20210727070517.443167-1-senozhatsky@chromium.org>
References: <20210727070517.443167-1-senozhatsky@chromium.org>
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
2.32.0.432.gabb21c7263-goog

