Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43C6E36C6CA
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 15:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237105AbhD0NOs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 09:14:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236593AbhD0NOp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 09:14:45 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A960FC061756
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 06:14:02 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id s14so24019042pjl.5
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 06:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c5/po+B8c1GoYAkKY/VY6UA+XRAvVW591EJFR98jM4Q=;
        b=UbsMJDlPXp/g4dk5fvOnBm2Ok6P0gqjgToV3Py/7gMl1lUDESRcaNFd2lLGZUORBLl
         nd6OCoUio+UBxHHbX8fKAJ9ZiNU2qRFKuuD1Z9tuA8xMUmEK1er4m8wU2nEs0ND2cm64
         EsmWSS6oImUYdFi1tomo+0X5tG/qcsEyBKdA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c5/po+B8c1GoYAkKY/VY6UA+XRAvVW591EJFR98jM4Q=;
        b=RqtYawBwPnDTZPzmXIf6p+WaIRtNLIA8g5iL8VFkVICkeHHxm8FGxiLW6mNk0R7inz
         YZ0Yy512rAT5GS/4CQDiWUoXGk1TybaEMAAIhfeZrMgL4jTPSg5CUhwkEAO24rlzFzaG
         8OLnpLm3MfpTWF4FHcIIwGAEL8L1AW/oYHHg+Av5vJM2JbHoG0pod01h0oEzVJLI1GCO
         HSerOSlAVjwrXoL8y33IpTKyszmKgNvwjLIQX57YYBRf9BOgzBaA3E4b6ToxBPxKI0Gy
         uvM4awUn5BdTB3Pgt9MdWS1vEYH3SnybMdJNXDwfIIcSBkqkLgImcUKsOP0BLI74s16k
         2buA==
X-Gm-Message-State: AOAM532PA/CVqAb0YG3YKaxeAlYAwJYm7BmomoAicRP9OcWj0yFkUGbF
        VFyfx4J2hb20t44iyXUCtCy92A==
X-Google-Smtp-Source: ABdhPJzk+xKl2/2P4MACks3QoKehSo09/X8BsLdtLRbm7Myq9lw96K2sTfGKQcVNALFIgOYIhJ3nQg==
X-Received: by 2002:a17:90b:e0d:: with SMTP id ge13mr26685951pjb.189.1619529242297;
        Tue, 27 Apr 2021 06:14:02 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:8192:3566:9cd4:8ed7])
        by smtp.gmail.com with ESMTPSA id c8sm2755313pfp.160.2021.04.27.06.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 06:14:01 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv2 3/8] videobuf2: split buffer cache_hints initialisation
Date:   Tue, 27 Apr 2021 22:13:38 +0900
Message-Id: <20210427131344.139443-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427131344.139443-1-senozhatsky@chromium.org>
References: <20210427131344.139443-1-senozhatsky@chromium.org>
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
index db93678860bd..a02f365bbe60 100644
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
2.31.1.498.g6c1eba8ee3d-goog

