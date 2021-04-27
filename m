Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70CBC36C6ED
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 15:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237219AbhD0NV3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 09:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237037AbhD0NV2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 09:21:28 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19E54C061574
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 06:20:44 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id p2so26858444pgh.4
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 06:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dmEBQ9oze+vOSPoWZulPOLfwDtwyiDRjoXQtAhbhzZM=;
        b=gJ43ksPA339RyLa6R7LHIrATd44OVBNHwDCPLKQxC9OPKpgY+lyDcA+DwNH5X5w16v
         0o/7wrEPE5XtbSlpzioXwMDWokIGffdJYmU2i6JnNuybjcdDK0KlpYbl1PBP12IynglQ
         ibX21f3LfRufTHc8glvzV2T7P8NDOwkW/XnL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dmEBQ9oze+vOSPoWZulPOLfwDtwyiDRjoXQtAhbhzZM=;
        b=C1b2dZqZ5+hMm4rBd4m6uVxHrLf5oaBf9we5J2MbCLDr8sHXu5xW3mQmM/mixlWa4b
         WIq0AEmZfhKt0OsR13PU8a4WDEqs1U5gtznZN5JZodH2L5GANZNv+daezB1lIxs1rR+X
         raHxLrkJ7UxxdITvZuOt7HN+TiBwxhDCg/Dbn2Pz/BnN+rWNsFl3ZY6fvb+dVZOtzWgT
         5kxqzdf8/vZWFXOJuFAG+k8mtqdvi3hidCHEiSffMWX9nbfqEmyM2YFl9hrt2VbjgB0T
         J4Y3S33pCKvU5iMS6vfeE4V7NcocHFdDqJwWOnOyxWrdIuJfIJEeX8VsbUI2xmqek2vv
         rMXA==
X-Gm-Message-State: AOAM531X6D6C54uOuoaE6OZZLVvRIMEppVD7RwxF3I6aq1hl4bE8n5zs
        00FmSQ3CJIv9+ySwfpaEEKJ94Q==
X-Google-Smtp-Source: ABdhPJwOFOk2BGipGd9ycdNFlDTB5f1HjsEY06YxEgBMhGjd6ZoaViFVHicLTzCRooNupZepUFo/fw==
X-Received: by 2002:a63:f908:: with SMTP id h8mr15521603pgi.153.1619529643611;
        Tue, 27 Apr 2021 06:20:43 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:8192:3566:9cd4:8ed7])
        by smtp.gmail.com with ESMTPSA id v21sm2475804pjg.9.2021.04.27.06.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 06:20:42 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] v4l-compliance: re-introduce NON_COHERENT and cache hints tests
Date:   Tue, 27 Apr 2021 22:20:37 +0900
Message-Id: <20210427132037.140750-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This returns back non-coherent (previously known as NON_COHERENT)
memory flag and buffer cache management hints testing (for VB2_MEMORY_MMAP
buffers).

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 utils/common/cv4l-helpers.h                 |  8 +--
 utils/common/v4l-helpers.h                  |  8 ++-
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 65 ++++++++++++++++++---
 3 files changed, 66 insertions(+), 15 deletions(-)

diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index 712efde6..3cee372b 100644
--- a/utils/common/cv4l-helpers.h
+++ b/utils/common/cv4l-helpers.h
@@ -754,17 +754,17 @@ public:
 	int g_fd(unsigned index, unsigned plane) const { return v4l_queue_g_fd(this, index, plane); }
 	void s_fd(unsigned index, unsigned plane, int fd) { v4l_queue_s_fd(this, index, plane, fd); }
 
-	int reqbufs(cv4l_fd *fd, unsigned count = 0)
+	int reqbufs(cv4l_fd *fd, unsigned count = 0, unsigned int flags = 0)
 	{
-		return v4l_queue_reqbufs(fd->g_v4l_fd(), this, count);
+		return v4l_queue_reqbufs(fd->g_v4l_fd(), this, count, flags);
 	}
 	bool has_create_bufs(cv4l_fd *fd) const
 	{
 		return v4l_queue_has_create_bufs(fd->g_v4l_fd(), this);
 	}
-	int create_bufs(cv4l_fd *fd, unsigned count, const v4l2_format *fmt = NULL)
+	int create_bufs(cv4l_fd *fd, unsigned count, const v4l2_format *fmt = NULL, unsigned int flags = 0)
 	{
-		return v4l_queue_create_bufs(fd->g_v4l_fd(), this, count, fmt);
+		return v4l_queue_create_bufs(fd->g_v4l_fd(), this, count, fmt, flags);
 	}
 	int mmap_bufs(cv4l_fd *fd, unsigned from = 0)
 	{
diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
index f96b3c38..c09cd987 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -1515,7 +1515,7 @@ static inline int v4l_queue_querybufs(struct v4l_fd *f, struct v4l_queue *q, uns
 }
 
 static inline int v4l_queue_reqbufs(struct v4l_fd *f,
-		struct v4l_queue *q, unsigned count)
+		struct v4l_queue *q, unsigned count, unsigned int flags = 0)
 {
 	struct v4l2_requestbuffers reqbufs;
 	int ret;
@@ -1523,6 +1523,7 @@ static inline int v4l_queue_reqbufs(struct v4l_fd *f,
 	reqbufs.type = q->type;
 	reqbufs.memory = q->memory;
 	reqbufs.count = count;
+	reqbufs.flags = flags;
 	/*
 	 * Problem: if REQBUFS returns an error, did it free any old
 	 * buffers or not?
@@ -1547,7 +1548,7 @@ static inline bool v4l_queue_has_create_bufs(struct v4l_fd *f, const struct v4l_
 
 static inline int v4l_queue_create_bufs(struct v4l_fd *f,
 		struct v4l_queue *q, unsigned count,
-		const struct v4l2_format *fmt)
+		const struct v4l2_format *fmt, unsigned int flags = 0)
 {
 	struct v4l2_create_buffers createbufs;
 	int ret;
@@ -1555,6 +1556,7 @@ static inline int v4l_queue_create_bufs(struct v4l_fd *f,
 	createbufs.format.type = q->type;
 	createbufs.memory = q->memory;
 	createbufs.count = count;
+	createbufs.flags = flags;
 	if (fmt) {
 		createbufs.format = *fmt;
 	} else {
@@ -1733,7 +1735,7 @@ static inline void v4l_queue_free(struct v4l_fd *f, struct v4l_queue *q)
 	v4l_ioctl(f, VIDIOC_STREAMOFF, &q->type);
 	v4l_queue_release_bufs(f, q, 0);
 	v4l_queue_close_exported_fds(q);
-	v4l_queue_reqbufs(f, q, 0);
+	v4l_queue_reqbufs(f, q, 0, 0);
 }
 
 static inline void v4l_queue_buffer_update(const struct v4l_queue *q,
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index e40461bd..6997f40b 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -663,6 +663,10 @@ int testReqBufs(struct node *node)
 		fail_on_test(q.reqbufs(node, 0));
 
 		for (m = V4L2_MEMORY_MMAP; m <= V4L2_MEMORY_DMABUF; m++) {
+			bool cache_hints_cap = false;
+			bool consistent;
+
+			cache_hints_cap = q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
 			if (!(node->valid_memorytype & (1 << m)))
 				continue;
 			cv4l_queue q2(i, m);
@@ -678,8 +682,17 @@ int testReqBufs(struct node *node)
 			reqbufs.count = 1;
 			reqbufs.type = i;
 			reqbufs.memory = m;
+			reqbufs.flags = V4L2_MEMORY_FLAG_NON_COHERENT;
 			fail_on_test(doioctl(node, VIDIOC_REQBUFS, &reqbufs));
-			fail_on_test(check_0(reqbufs.reserved, sizeof(reqbufs.reserved)));
+			consistent = reqbufs.flags & V4L2_MEMORY_FLAG_NON_COHERENT;
+			if (!cache_hints_cap) {
+				fail_on_test(consistent);
+			} else {
+				if (m == V4L2_MEMORY_MMAP)
+					fail_on_test(!consistent);
+				else
+					fail_on_test(consistent);
+			}
 			q.reqbufs(node);
 
 			ret = q.create_bufs(node, 0);
@@ -692,9 +705,32 @@ int testReqBufs(struct node *node)
 			node->g_fmt(crbufs.format, i);
 			crbufs.count = 1;
 			crbufs.memory = m;
+			crbufs.flags = V4L2_MEMORY_FLAG_NON_COHERENT;
 			fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs));
 			fail_on_test(check_0(crbufs.reserved, sizeof(crbufs.reserved)));
 			fail_on_test(crbufs.index != q.g_buffers());
+
+			consistent = crbufs.flags & V4L2_MEMORY_FLAG_NON_COHERENT;
+			if (!cache_hints_cap) {
+				fail_on_test(consistent);
+			} else {
+				if (m == V4L2_MEMORY_MMAP)
+					fail_on_test(!consistent);
+				else
+					fail_on_test(consistent);
+			}
+
+			if (cache_hints_cap) {
+				/*
+				 * Different memory consistency model. Should fail for MMAP
+				 * queues which support cache hints.
+				 */
+				crbufs.flags = 0;
+				if (m == V4L2_MEMORY_MMAP)
+					fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs) != EINVAL);
+				else
+					fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs));
+			}
 			q.reqbufs(node);
 
 			fail_on_test(q.create_bufs(node, 1));
@@ -1207,10 +1243,16 @@ static int setupMmap(struct node *node, cv4l_queue &q)
 		fail_on_test(buf.querybuf(node, i));
 		fail_on_test(buf.check(q, Unqueued, i));
 
-		flags = buf.g_flags();
-		flags |= V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
-		flags |= V4L2_BUF_FLAG_NO_CACHE_CLEAN;
-		buf.s_flags(flags);
+		/*
+		 * Do not set cache hints for all the buffers, but only on
+		 * some of them, so that we can test more cases.
+		 */
+		if (i == 0) {
+			flags = buf.g_flags();
+			flags |= V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
+			flags |= V4L2_BUF_FLAG_NO_CACHE_CLEAN;
+			buf.s_flags(flags);
+		}
 
 		for (unsigned p = 0; p < buf.g_num_planes(); p++) {
 			// Try a random offset
@@ -1250,8 +1292,15 @@ static int setupMmap(struct node *node, cv4l_queue &q)
 		}
 		flags = buf.g_flags();
 		if (cache_hints) {
-			fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE));
-			fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN));
+			if (i == 0) {
+				/* We do expect cache hints on this buffer */
+				fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE));
+				fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN));
+			} else {
+				/* We expect no cache hints on this buffer */
+				fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE);
+				fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN);
+			}
 		} else if (node->might_support_cache_hints) {
 			fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE);
 			fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN);
@@ -1341,7 +1390,7 @@ int testMmap(struct node *node, struct node *node_m2m_cap, unsigned frame_count,
 			have_createbufs = false;
 		if (have_createbufs) {
 			q.reqbufs(node);
-			q.create_bufs(node, 2, &cur_fmt);
+			q.create_bufs(node, 2, &cur_fmt, V4L2_MEMORY_FLAG_NON_COHERENT);
 			fail_on_test(setupMmap(node, q));
 			q.munmap_bufs(node);
 			q.reqbufs(node, 2);
-- 
2.27.0

