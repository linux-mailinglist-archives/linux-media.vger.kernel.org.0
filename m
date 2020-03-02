Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8E417527E
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 05:12:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbgCBEMj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Mar 2020 23:12:39 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:53257 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbgCBEMg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Mar 2020 23:12:36 -0500
Received: by mail-pj1-f66.google.com with SMTP id cx7so664155pjb.3
        for <linux-media@vger.kernel.org>; Sun, 01 Mar 2020 20:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v6z/dbpsAJ3nyjiLy5ZTWHYE+yf0r+oxWKfI3Of1Dd4=;
        b=cMCH26pCmXb3Ya2wfhiu8tj4o9hBtdJTJvGiu/xRjRKtuOF90yWeozt5trOBt/q2Uh
         oJ/Yr5KSJIkgOBWJVex2mw3e9nakc8rJFN4iqFW+ZZwfgBAdxs6ubuCYhs1vG4eypZBQ
         UP/sm6YJo8UaB2p71u2a6c/QskLzlYYJHAH38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v6z/dbpsAJ3nyjiLy5ZTWHYE+yf0r+oxWKfI3Of1Dd4=;
        b=Af9OF62bq5EC/7p256J1liniwLBSrnFCDsXQtu35+K5cKsYTL5kzZbYj4FmxV1Vo5S
         nVGXo38NSGopMX4MZHzQWquBNL1GCw4lzUwJ5U8yRue3KAIRgu+rqxTYF1KNLBjRKpdy
         smLLP5hP6rDSLnIPWxLai14NsDnBt3JS17QOFjpmEcxs0+aX4hX79X2SbvLl8pZYsz+9
         5yol4MvQlbqwkf9VXu52UJNePx0fhu6jsXThGf99lqkodJbsUifvepUI7IKgjtZhQQrP
         5yhHSYTHe4TcGGGyTLFtLvD4XFvHu7QBVKjeiskzk22fpPVQpXdzR227eDUBRcMX/7Xy
         yiVA==
X-Gm-Message-State: APjAAAV8d/bG8dsCjcQBesSDs5f+/WrATPW+0RjoK0odGzdjbEZhBJwY
        ttnQc6d9WHmxc/qkHyiSLuz6CQ==
X-Google-Smtp-Source: APXvYqwtEuZtuxBPXd8Au6k+ScE/CbCrd3xcRWfZ+WvodYsbeu4koyiICkTyQCwIBXocLulDsiOH7w==
X-Received: by 2002:a17:902:8f91:: with SMTP id z17mr16134724plo.234.1583122355107;
        Sun, 01 Mar 2020 20:12:35 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id d82sm1698114pfd.187.2020.03.01.20.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2020 20:12:34 -0800 (PST)
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
Subject: [PATCHv4 02/11] videobuf2: handle V4L2 buffer cache flags
Date:   Mon,  2 Mar 2020 13:12:04 +0900
Message-Id: <20200302041213.27662-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200302041213.27662-1-senozhatsky@chromium.org>
References: <20200302041213.27662-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set video buffer cache management flags corresponding to V4L2 cache
flags.

Both ->prepare() and ->finish() cache management hints should be
passed during this stage (buffer preparation), because there is
no other way for user-space to tell V4L2 to avoid ->finish() cache
flush.

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
index 4a19170672ac..731fd9fbd506 100644
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
+	return q->allow_cache_hints && q->memory == VB2_MEMORY_MMAP;
+}
+
 /**
  * vb2_plane_vaddr() - Return a kernel virtual address of a given plane.
  * @vb:		pointer to &struct vb2_buffer to which the plane in
-- 
2.25.0.265.gbab2e86ba0-goog

