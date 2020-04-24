Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89BF01B70DE
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 11:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbgDXJaw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 05:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726523AbgDXJaw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 05:30:52 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18119C09B045;
        Fri, 24 Apr 2020 02:30:52 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o15so4389061pgi.1;
        Fri, 24 Apr 2020 02:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=41prVte/MxVN8rT+cmjF7KZHxVdpTKw2jaomXqXMCyU=;
        b=EwqLXlZwJ+cCoRK6cJZ9gMIiWoiv5nANq3T7n4A0Dp4PBDjB9xl8NutCDZiCWuMPnx
         AU2uod83uEjFBObvGTws8ymzhvSanj4dR1by6f4omlVTUsWhUADseUUlnObLQ8sFma8p
         +Hdf9gQ0ZRBkMLIyz1FZijOm8kvqAIJioBd6hhKGuo+YmYBbn5y2+KOsn4saHUewBTy1
         ODxDfu6stREZqDlvVIXFxITanQV1vD6m+jUePrcuA5vlnVVa6+zod30ZHpwC8XjXDuGK
         xieyCvxTgqs61nXbd7Xs0AHLkUezBBq5UB8yyBlGwQ54Lz6WdoYNnE19P9sxD3NTOaP4
         Mywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=41prVte/MxVN8rT+cmjF7KZHxVdpTKw2jaomXqXMCyU=;
        b=t6RM+VYlHJUIapJ9GwZY2WTHA16ILPNIaf+dHkDqgoE9f2esWNvesP1tZ0piuvrTIj
         paIB8YSY1yXDCcZOpGi1RBY/oPD+ydpmeG/zhSUTGESnbqoMKBgmORNneIVVlts8koL0
         /7b3T4/MNbqwRM/7+5qlh/E1a7h4JHFqVf0z3Qy8vFj3wbpeHz82Qti7EQcwMcKcnS2M
         Ch7+OS7p2LZi2HNmr0U/9Hjb2CGLAtw8wmWTNra6Whue8KVGljR1sAql9oDzAy5+yMzD
         udnFzjTwRsxEQ9Ww2r5PqVqMw3mTrp6p69F9Fd9pl2nJgpO685L8Q3eZsSoefiBepbu/
         Ra6A==
X-Gm-Message-State: AGi0PuYN30xirivk6yWOprmFeeRmpWHcTaSUSPU2ylR3lWRZzqoZzPlG
        iLChRFsFXylNNH8v12JDpC0=
X-Google-Smtp-Source: APiQypKjkmfsFU9zHxc2sJsKL/YOujcpzgmhfTVNZK+x4JRN0bv9h3ueUQ6EoXadQiBn8XLnF/eMfQ==
X-Received: by 2002:a62:1801:: with SMTP id 1mr8741392pfy.230.1587720651578;
        Fri, 24 Apr 2020 02:30:51 -0700 (PDT)
Received: from localhost.localdomain (146.85.30.125.dy.iij4u.or.jp. [125.30.85.146])
        by smtp.gmail.com with ESMTPSA id 185sm5541315pfv.9.2020.04.24.02.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 02:30:51 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv5 03/13] videobuf2: handle V4L2 buffer cache flags
Date:   Fri, 24 Apr 2020 18:29:10 +0900
Message-Id: <20200424092920.4801-4-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200424092920.4801-1-sergey.senozhatsky@gmail.com>
References: <20200424092920.4801-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sergey Senozhatsky <senozhatsky@chromium.org>

Set video buffer cache management flags corresponding to V4L2 cache
flags.

Both ->prepare() and ->finish() cache management hints should be
passed during this stage (buffer preparation), because there is
no other way for user-space to tell V4L2 to avoid ->finish() cache
flush.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/common/videobuf2/videobuf2-v4l2.c   | 48 +++++++++++++++++++
 include/media/videobuf2-core.h                | 11 +++++
 2 files changed, 59 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index eb5d5db96552..f13851212cc8 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -337,6 +337,53 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
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
+	if (!vb2_queue_allows_cache_hints(q)) {
+		/*
+		 * Clear buffer cache flags if queue does not support user
+		 * space hints. That's to indicate to userspace that these
+		 * flags won't work.
+		 */
+		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
+		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_CLEAN;
+		return;
+	}
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
@@ -381,6 +428,7 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
 	}
 
 	if (!vb->prepared) {
+		set_buffer_cache_hints(q, vb, b);
 		/* Copy relevant information provided by the userspace */
 		memset(vbuf->planes, 0,
 		       sizeof(vbuf->planes[0]) * vb->num_planes);
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 7f39d9fffc8c..ccc5c498d3e3 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -635,6 +635,17 @@ struct vb2_queue {
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
2.26.2

