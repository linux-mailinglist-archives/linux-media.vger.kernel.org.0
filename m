Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2128516FD15
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 12:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728160AbgBZLPu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 06:15:50 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:51196 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728114AbgBZLPu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 06:15:50 -0500
Received: by mail-pj1-f66.google.com with SMTP id r67so1133237pjb.0
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2020 03:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=651wZiCcSmbV7EdnlDBC6r7lVVXMfelvMaONtYmH5Sc=;
        b=dGSlZTIvJALW0Ay/Q86Z+WoPDnCql0ogphNSdFSY0lvUlYtbF0wdZ7Iyzq/TppcNoL
         uKuSqWf8vPkr+vKBufWZCjHUVP5ZItQZ8qn8d4gVsDRIou9z5n2//ZWMJOqWpX0lzgHh
         pMqZxOqkD/6BQymfCQRu1LTuTfEvYRCi4/rCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=651wZiCcSmbV7EdnlDBC6r7lVVXMfelvMaONtYmH5Sc=;
        b=B8vacu/DmPcekBYdNOUSRNvv3hndb6Xa59rVMe7gC4EBVT6YoY2gnSjqW65gkxWxPB
         YG5TJj4JEHlKtyIivT+cRxcvlrXI1a7RWHxYTfgfhfYzxIe0+O9DdX9InoGzhYVxPvnO
         s+v6QqjqIkDiCfdjpouT3mbUKksILnURC5vt4T7ycBnnypsWF3CN0QVWO+MI424yfs8a
         IXsWnxFxKuxMwrzpro+DYsD6orOiFt1gLx14R8+dBuKsaG8SklQwpP1dSwXGfYAQea0/
         fStL5NMVeu1Mny0JMmeHvKpCbYX/w8bw/CVHfbNSicRiVhlz9FnAH8UTCf6o8USZjiqF
         Kt7w==
X-Gm-Message-State: APjAAAVUzMDQ078tstvH7Dvb9fuB/VaxBbUNlprkW5Sj68QqggnyoQVF
        Yo3iYbxAr0se0aErwXJX5/zOvQ==
X-Google-Smtp-Source: APXvYqxdKX8sN7quJ9bA+4Kv9yTzyPFicnaAjFDpvgexcvC8WL7uuTb2IwlO7oaD1C1sN5+79VQUwg==
X-Received: by 2002:a17:90a:f17:: with SMTP id 23mr4414995pjy.84.1582715749377;
        Wed, 26 Feb 2020 03:15:49 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id o22sm2429993pgj.58.2020.02.26.03.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 03:15:48 -0800 (PST)
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
Subject: [PATCHv3 02/11] videobuf2: handle V4L2 buffer cache flags
Date:   Wed, 26 Feb 2020 20:15:20 +0900
Message-Id: <20200226111529.180197-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200226111529.180197-1-senozhatsky@chromium.org>
References: <20200226111529.180197-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set video buffer cache management flags corresponding to V4L2 cache
flags.

Both ->prepare() and ->finish() cache management hints should be
passed during this stage (buffer preparation), because there is no
other way for user-space to skip ->finish() cache flush.

There are two possible alternative approaches:
- The first one is to move cache sync from ->finish() to dqbuf().
  But this breaks some drivers, that need to fix-up buffers before
  dequeueing them.

- The second one is to move ->finish() call from ->done() to dqbuf.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/common/videobuf2/videobuf2-v4l2.c   | 49 +++++++++++++++++++
 include/media/videobuf2-core.h                | 11 +++++
 2 files changed, 60 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index eb5d5db96552..2a604bd7793a 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -199,6 +199,15 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
 	vbuf->request_fd = -1;
 	vbuf->is_held = false;
 
+	/*
+	 * Clear buffer cache flags if queue does not support user space hints.
+	 * That's to indicate to userspace that these flags won't work.
+	 */
+	if (!vb2_queue_allows_cache_hints(q)) {
+		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
+		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_CLEAN;
+	}
+
 	if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
 		switch (b->memory) {
 		case VB2_MEMORY_USERPTR:
@@ -337,6 +346,45 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
 	return 0;
 }
 
+static void set_buffer_cache_hints(struct vb2_queue *q,
+				   struct vb2_buffer *vb,
+				   struct v4l2_buffer *b)
+{
+	/*
+	 * DMA exporter should take care of cache syncs, so we can avoid
+	 * explicit ->prepare()/->finish() syncs. For other ->memory types
+	 * we always need ->prepare() or/and ->finish() cache sync.
+	 */
+	if (q->memory == VB2_MEMORY_DMABUF) {
+		vb->need_cache_sync_on_finish = 0;
+		vb->need_cache_sync_on_prepare = 0;
+		return;
+	}
+
+	/*
+	 * Cache sync/invalidation flags are set by default in order to
+	 * preserve existing behaviour for old apps/drivers.
+	 */
+	vb->need_cache_sync_on_prepare = 1;
+	vb->need_cache_sync_on_finish = 1;
+
+	if (!vb2_queue_allows_cache_hints(q))
+		return;
+
+	/*
+	 * ->finish() cache sync can be avoided when queue direction is
+	 * TO_DEVICE.
+	 */
+	if (q->dma_dir == DMA_TO_DEVICE)
+		vb->need_cache_sync_on_finish = 0;
+
+	if (b->flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE)
+		vb->need_cache_sync_on_finish = 0;
+
+	if (b->flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN)
+		vb->need_cache_sync_on_prepare = 0;
+}
+
 static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
 				    struct v4l2_buffer *b, bool is_prepare,
 				    struct media_request **p_req)
@@ -381,6 +429,7 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
 	}
 
 	if (!vb->prepared) {
+		set_buffer_cache_hints(q, vb, b);
 		/* Copy relevant information provided by the userspace */
 		memset(vbuf->planes, 0,
 		       sizeof(vbuf->planes[0]) * vb->num_planes);
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 4a19170672ac..d307869bfb15 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -632,6 +632,17 @@ struct vb2_queue {
 #endif
 };
 
+/**
+ * vb2_queue_allows_cache_hints() - Return true if the queue allows cache
+ * and memory consistency hints.
+ *
+ * @q:		pointer to &struct vb2_queue with videobuf2 queue
+ */
+static inline bool vb2_queue_allows_cache_hints(struct vb2_queue *q)
+{
+	return (q->allow_cache_hints != 0) && (q->memory == VB2_MEMORY_MMAP);
+}
+
 /**
  * vb2_plane_vaddr() - Return a kernel virtual address of a given plane.
  * @vb:		pointer to &struct vb2_buffer to which the plane in
-- 
2.25.0.265.gbab2e86ba0-goog

