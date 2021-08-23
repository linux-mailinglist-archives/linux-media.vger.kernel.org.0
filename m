Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85FC03F4A89
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 14:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237050AbhHWMXp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 08:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237093AbhHWMXm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 08:23:42 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F8E6C0613C1
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 05:22:59 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id u11-20020a17090adb4b00b00181668a56d6so5756571pjx.5
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 05:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DtltGjnVw2BOfSdx+fdYkNHpVo2roVdy5bzqiia+99g=;
        b=LUqMEdEHPyBZBFN/him7oaw3ncdVafGpLIdqCOKRqRzXa7YzH1iuND50tB2lKpcRWS
         g6Gy3wppFIlflzBbAp02NizCruWPgFS4M051h6L+4Ga7ayxCc9mKxoUwmZyvw+Pf2Doh
         rZrgCRU3aiaBptWv62dKRCgwj6TqrAjTZJD5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DtltGjnVw2BOfSdx+fdYkNHpVo2roVdy5bzqiia+99g=;
        b=ZYkfGsX96UjfpKcVbfKsEfVnaKeD/4IAqbHIHgxwM6HFwoGATYwKG4a7aJv741wdXN
         hJDJ5yLRCwoHw4nmzpgxdfgddvWVibNPxS3Ne02It63aCV0GzFQrkxsp8OOyzmdCRBVM
         0kpeBmRLxIU8GviRxOh2x4GAjXVWGFajo91V2MxpHwGCu3Ue3tTW6mVfaYdTTPcXXVXI
         wBNmfhQbbJov6m1mTix1BeM9DcMPjCgYWRiJvCfFR+4nvV7/EnhGmUEzl5+JQVfHYURm
         WUVAPKwXM/HFz2h7tZ7M9PCvCQJmUOPd0ALGP35dBYlMX6PVprUP1udWfUDIzve4qEJ1
         cgnw==
X-Gm-Message-State: AOAM533I3FIAym5H3kq19OHWGLxDOFJy2leTEWYUWB6giqxssIw8kyxc
        C1+FW9yG8yYNVQOOrCU0wB/YHA==
X-Google-Smtp-Source: ABdhPJyz6I8OAiEyVm91sbs1KkCbdHQG+h0GlHKsBEWKDOkvAd8SDcrKfPEAHPaWtKRsa39cvc3gUg==
X-Received: by 2002:a17:90b:3e81:: with SMTP id rj1mr19976603pjb.99.1629721379221;
        Mon, 23 Aug 2021 05:22:59 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:8821:8b2f:2912:f9e4])
        by smtp.gmail.com with ESMTPSA id a15sm9035576pfn.219.2021.08.23.05.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 05:22:58 -0700 (PDT)
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
Subject: [PATCHv5 3/8] videobuf2: split buffer cache_hints initialisation
Date:   Mon, 23 Aug 2021 21:22:30 +0900
Message-Id: <20210823122235.116189-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
In-Reply-To: <20210823122235.116189-1-senozhatsky@chromium.org>
References: <20210823122235.116189-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2 is not the perfect place to manage vb2 buffer cache hints.
It works for V4L2 users, but there are backends that use vb2 core
and don't use V4L2. Factor out buffer cache hints initialisation
and call it when we allocate vb2 buffer.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/common/videobuf2/videobuf2-core.c   | 22 +++++++++++++++++++
 .../media/common/videobuf2/videobuf2-v4l2.c   | 18 ---------------
 2 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 9d57df348b5f..59bd781c9a34 100644
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
2.33.0.rc2.250.ged5fa647cd-goog

