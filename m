Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38BC31D35D8
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 18:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727991AbgENQC0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 12:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgENQCZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 12:02:25 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C8DC061A0C;
        Thu, 14 May 2020 09:02:25 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id q24so12632266pjd.1;
        Thu, 14 May 2020 09:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=41prVte/MxVN8rT+cmjF7KZHxVdpTKw2jaomXqXMCyU=;
        b=lRqw0d77o9muuAsv8JueEdBc6yKJguOWybb38kOfsH0nzbIvkE6P/9iWdqpiWdkXHx
         /rKosYlqF3qIHV6+Z0FNHQtOXLBlDiv1VfdT3hud+dcQ3alFJsx0I/kPv5vQMvy2+4J9
         4tS//m12+q8HT2XBLBGuncrubZenDjOnXtrUfaVc5CUvq8M8yC1BslVIzWF3heYlpwfv
         LJzHOGz/w1PV+dKesR0/J7M5/QNLyuoaHgtKhXcNGv/1RguQW9rTvGQPRmvG9EMBm/09
         hADfkWPivNa9W5lBpGVgVE2Sk1moQCNIXfuHMEC3cw6HDpeick/c88NH/hawN5vah8dt
         udcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=41prVte/MxVN8rT+cmjF7KZHxVdpTKw2jaomXqXMCyU=;
        b=LZU2ojZWldvcCoVD5HY2u5r80a5XHk8ErUmPiw523Ky98ZEHb6Xzo5jN84+nO8vzPN
         VT8eJd7XHNNzAW+p+32xEhzQZbLhhOfkv5YxRzwZtplASClSuyYoAsA7bR/1h21r869m
         cbr6LmvsMkWe8bwdFPhQQvv3ssAh4V9lGmzcaYML3fJADeFHIB5XhXkcANu5dFJKdQur
         hSQVINWvNgITF9oxpLVolU132V0B1HUF4KDveSEzTzkeWpNbhx1E5OzCh/RsyKjU8I6K
         /d6say8WXkKdz3jCgs0YCYMgECVuLBmp+Xzl8hfBQBjbgeNzpE62tm4tseQzNS0h/1jR
         aQww==
X-Gm-Message-State: AGi0PuagklUL+3xQ/Q32bf0Cyxx+YXv5H4EqbaNo36D9P5ilLRMCrpw8
        CkwkC+vA7ZOkbR1A+M+CtlU=
X-Google-Smtp-Source: APiQypJGgmTimL53ZkCV6wwX/kVYUC0a8lhrbE67Otd0R0B3TgxnPneBqMKTGLvkMCgRnw7hJaAvMg==
X-Received: by 2002:a17:90a:6283:: with SMTP id d3mr42602547pjj.18.1589472145175;
        Thu, 14 May 2020 09:02:25 -0700 (PDT)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id y6sm18178691pjw.15.2020.05.14.09.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 09:02:23 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v6 03/14] videobuf2: handle V4L2 buffer cache flags
Date:   Fri, 15 May 2020 01:01:42 +0900
Message-Id: <20200514160153.3646-4-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
References: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
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

