Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96F503C2166
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 11:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbhGIJX1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 05:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231935AbhGIJX0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 05:23:26 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFCFDC0613E5
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 02:20:42 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id a2so9349985pgi.6
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 02:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=moBvBeYnotnphw3fj9Fi8ctf7rzEs+cvlQJFS96YTEY=;
        b=eI5wUTbsVd+e6AjKu0WH2w4ckdINTz7bf0fwZGBu7bYUHbf0CleasC6o1JiPBgN+Nc
         cyN1o6m8DkpqjDOuTT8O+NPq8ArMbzdit8n5pKBBb2qEs1bKyHc0I1MfTvndOwqseUAH
         xDSZx3OvTYHRki3bQFd+t0lVlVoGYH3Sy56mY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=moBvBeYnotnphw3fj9Fi8ctf7rzEs+cvlQJFS96YTEY=;
        b=eXzPPbCUMKxzGPJTBhDEXH6NY5PEpqyaSh1IwSfI7FhAV6HNTo7VfxHb+hElD9EkCU
         wl+sag1fVwl/gJ0LkTw3I5xXA7aZxUEfs4HnGNjU0u5PqCZFyPwwIZgjaX/EMOSAsaDW
         KJgoYwlyc8AJ/wXia4RFtzIP3it32tcPlvQmYMpcY6zexoH8Vz4mPWyd78HuLE/clVfg
         lz+t29xpBbyvkLOmQa5iB+JsG042rLl42dM4TcnSPLY7ePGeie+VyNpMtdUAJiUJM+He
         khLUf9l+vdpX+JUB+nF60IAj3ZRCixVsLkhgkKvqMH9A3PMA9NvInvf7fxOrBJ28RPeU
         wxbQ==
X-Gm-Message-State: AOAM532pDqvld6YHDMmvdADHzBfUyVUMcdJmcanXmffqk3vWFwziGXgL
        vui6Q/SVSLxmIWUhq1b8YFHDRA==
X-Google-Smtp-Source: ABdhPJx+Jyyi7AbpwkYyrW5QT4XZKMipfBN9Jz/OYAv0nVE7PZ8VVxyG9EdtfIfC+CQi2eAR8M4LiQ==
X-Received: by 2002:a63:2d02:: with SMTP id t2mr21449676pgt.114.1625822441294;
        Fri, 09 Jul 2021 02:20:41 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:a30d:fc4:7834:ee08])
        by smtp.gmail.com with ESMTPSA id e24sm5496539pfn.127.2021.07.09.02.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 02:20:40 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 3/8] videobuf2: split buffer cache_hints initialisation
Date:   Fri,  9 Jul 2021 18:20:22 +0900
Message-Id: <20210709092027.1050834-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210709092027.1050834-1-senozhatsky@chromium.org>
References: <20210709092027.1050834-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2 is not the perfect place to manage vb2 buffer cache hints.
It works for V4L2 users, but there are backends that use vb2 core
and don't use V4L2. Factor buffer cache hints init and call it
when we allocate vb2 buffer.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/common/videobuf2/videobuf2-core.c   | 22 +++++++++++++++++++
 .../media/common/videobuf2/videobuf2-v4l2.c   | 18 ---------------
 2 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 23e41fec9880..76210c006958 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -382,6 +382,27 @@ static void __setup_offsets(struct vb2_buffer *vb)
 	}
 }
 
+static void init_buffer_cache_hints(struct vb2_queue *q, struct vb2_buffer *vb)
+{
+	/*
+	 * DMA exporter should take care of cache syncs, so we can avoid
+	 * explicit ->prepare()/->finish() syncs. For other ->memory types
+	 * we always need ->prepare() or/and ->finish() cache sync.
+	 */
+	if (q->memory == VB2_MEMORY_DMABUF) {
+		vb->skip_cache_sync_on_finish = 1;
+		vb->skip_cache_sync_on_prepare = 1;
+		return;
+	}
+
+	/*
+	 * ->finish() cache sync can be avoided when queue direction is
+	 * TO_DEVICE.
+	 */
+	if (q->dma_dir == DMA_TO_DEVICE)
+		vb->skip_cache_sync_on_finish = 1;
+}
+
 /*
  * __vb2_queue_alloc() - allocate videobuf buffer structures and (for MMAP type)
  * video buffer memory for all buffers/planes on the queue and initializes the
@@ -415,6 +436,7 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 		vb->index = q->num_buffers + buffer;
 		vb->type = q->type;
 		vb->memory = memory;
+		init_buffer_cache_hints(q, vb);
 		for (plane = 0; plane < num_planes; ++plane) {
 			vb->planes[plane].length = plane_sizes[plane];
 			vb->planes[plane].min_length = plane_sizes[plane];
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 454d58268602..2fbae9bd7b52 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -345,17 +345,6 @@ static void set_buffer_cache_hints(struct vb2_queue *q,
 				   struct vb2_buffer *vb,
 				   struct v4l2_buffer *b)
 {
-	/*
-	 * DMA exporter should take care of cache syncs, so we can avoid
-	 * explicit ->prepare()/->finish() syncs. For other ->memory types
-	 * we always need ->prepare() or/and ->finish() cache sync.
-	 */
-	if (q->memory == VB2_MEMORY_DMABUF) {
-		vb->skip_cache_sync_on_finish = 1;
-		vb->skip_cache_sync_on_prepare = 1;
-		return;
-	}
-
 	if (!vb2_queue_allows_cache_hints(q)) {
 		/*
 		 * Clear buffer cache flags if queue does not support user
@@ -367,13 +356,6 @@ static void set_buffer_cache_hints(struct vb2_queue *q,
 		return;
 	}
 
-	/*
-	 * ->finish() cache sync can be avoided when queue direction is
-	 * TO_DEVICE.
-	 */
-	if (q->dma_dir == DMA_TO_DEVICE)
-		vb->skip_cache_sync_on_finish = 1;
-
 	if (b->flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE)
 		vb->skip_cache_sync_on_finish = 1;
 
-- 
2.32.0.93.g670b81a890-goog

