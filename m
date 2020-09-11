Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7762B265742
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 05:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725798AbgIKDKA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 23:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgIKDJ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 23:09:59 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6927EC061573
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2020 20:09:59 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id f2so3556825pgd.3
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2020 20:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BeeEMInJ8QPxMTw6tscaigX58bQjxfR8Wxlr3TrNC30=;
        b=jzinIQ5G48/6SngChGOFz1wA2teCbAfN1PjIwBi4zHzkmPFoDd+uUbQuMC4XZmCxl3
         ZsnRLKIW6REvxR1IaFwQeNO8VQrrACCFil0seLknUa+nzTYv2Rzd9DuEcA7lyNRBy5AU
         XdbO46V8MvlRyNsSqfIRUrwOe/xAH8Xdwau41a5j1OlC6BZJbpUD/EXFTQBxXhmZl3IN
         JjW337EoClwwh26+PDVrqrCyBHGy6l8taiofTBa4V95yNUQF/L7/igaCCd1hkSLGpVNR
         +LZc91hLfx4ppOTFsV9a+2GyvKcPoeJCkLI7hQVnaHWw7RB2B/WyzJA0faj9rfwO4IZr
         LwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BeeEMInJ8QPxMTw6tscaigX58bQjxfR8Wxlr3TrNC30=;
        b=SpwIyhmuW695AHfXVQIfWx5p9ijZBXD53TUV7FRAVDqclTfIy0Mfea1Y6nL+zaDLEF
         FGOEpl5bDW4EahubgiEAkiwHGLQterXGp/kzRIB6uSt5StLErNhvkHkxDE5iTkB9k5a1
         6355f/lyExvyqwIwVS4iXboS9GFXR3D4y9aL1I8HsjUdLixA06PBWrKug2LhyoSBZKww
         GQeOr64/Kj/rBnFU5mowuS922fwSLU4FVtLU7tmO21AkMLIzXjN0EE1KZFT8mby5HVoz
         04YMS/s2DVV8FFR1K9K0d7iPF1Y8mI5tGz3aAqTDi1758UfkFDFrq2fnpHf0uu6qbqrK
         pwjQ==
X-Gm-Message-State: AOAM533vV86pss63/gAm5wvoqLkoj/CtbUwpDTCiMqhu0bPeS1EkkDZq
        5kv1LOZCaSuua9RA5jWFF7U=
X-Google-Smtp-Source: ABdhPJztxP2LbpvYUDru+pDfz0DyXtTVNn1H0bBYKRtXeF040Z6AXli3Ui7oBmKipl8AogImie8vRg==
X-Received: by 2002:a17:902:d88c:: with SMTP id b12mr8117249plz.96.1599793798887;
        Thu, 10 Sep 2020 20:09:58 -0700 (PDT)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id x3sm496031pfq.49.2020.09.10.20.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 20:09:57 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Tomasz Figa <tfiga@chromium.org>, Christoph Hellwig <hch@lst.de>,
        linux-media@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: [PATCH] v4l-compliance: remove NON_CONSISTENT hint test
Date:   Fri, 11 Sep 2020 12:09:52 +0900
Message-Id: <20200911030952.74468-1-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Kernel support for V4L2_FLAG_MEMORY_NON_CONSISTENT has been
reverted, so we need to to remove the memory consistency
(coherency) tests from the test-buffers code.

Note, the buffer cache management hints support is still there
and should be tested.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
---
 utils/common/cv4l-helpers.h                 |  8 ++---
 utils/common/v4l-helpers.h                  |  8 ++---
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 40 ++-------------------
 3 files changed, 9 insertions(+), 47 deletions(-)

diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index 3cee372b..712efde6 100644
--- a/utils/common/cv4l-helpers.h
+++ b/utils/common/cv4l-helpers.h
@@ -754,17 +754,17 @@ public:
 	int g_fd(unsigned index, unsigned plane) const { return v4l_queue_g_fd(this, index, plane); }
 	void s_fd(unsigned index, unsigned plane, int fd) { v4l_queue_s_fd(this, index, plane, fd); }
 
-	int reqbufs(cv4l_fd *fd, unsigned count = 0, unsigned int flags = 0)
+	int reqbufs(cv4l_fd *fd, unsigned count = 0)
 	{
-		return v4l_queue_reqbufs(fd->g_v4l_fd(), this, count, flags);
+		return v4l_queue_reqbufs(fd->g_v4l_fd(), this, count);
 	}
 	bool has_create_bufs(cv4l_fd *fd) const
 	{
 		return v4l_queue_has_create_bufs(fd->g_v4l_fd(), this);
 	}
-	int create_bufs(cv4l_fd *fd, unsigned count, const v4l2_format *fmt = NULL, unsigned int flags = 0)
+	int create_bufs(cv4l_fd *fd, unsigned count, const v4l2_format *fmt = NULL)
 	{
-		return v4l_queue_create_bufs(fd->g_v4l_fd(), this, count, fmt, flags);
+		return v4l_queue_create_bufs(fd->g_v4l_fd(), this, count, fmt);
 	}
 	int mmap_bufs(cv4l_fd *fd, unsigned from = 0)
 	{
diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
index c09cd987..f96b3c38 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -1515,7 +1515,7 @@ static inline int v4l_queue_querybufs(struct v4l_fd *f, struct v4l_queue *q, uns
 }
 
 static inline int v4l_queue_reqbufs(struct v4l_fd *f,
-		struct v4l_queue *q, unsigned count, unsigned int flags = 0)
+		struct v4l_queue *q, unsigned count)
 {
 	struct v4l2_requestbuffers reqbufs;
 	int ret;
@@ -1523,7 +1523,6 @@ static inline int v4l_queue_reqbufs(struct v4l_fd *f,
 	reqbufs.type = q->type;
 	reqbufs.memory = q->memory;
 	reqbufs.count = count;
-	reqbufs.flags = flags;
 	/*
 	 * Problem: if REQBUFS returns an error, did it free any old
 	 * buffers or not?
@@ -1548,7 +1547,7 @@ static inline bool v4l_queue_has_create_bufs(struct v4l_fd *f, const struct v4l_
 
 static inline int v4l_queue_create_bufs(struct v4l_fd *f,
 		struct v4l_queue *q, unsigned count,
-		const struct v4l2_format *fmt, unsigned int flags = 0)
+		const struct v4l2_format *fmt)
 {
 	struct v4l2_create_buffers createbufs;
 	int ret;
@@ -1556,7 +1555,6 @@ static inline int v4l_queue_create_bufs(struct v4l_fd *f,
 	createbufs.format.type = q->type;
 	createbufs.memory = q->memory;
 	createbufs.count = count;
-	createbufs.flags = flags;
 	if (fmt) {
 		createbufs.format = *fmt;
 	} else {
@@ -1735,7 +1733,7 @@ static inline void v4l_queue_free(struct v4l_fd *f, struct v4l_queue *q)
 	v4l_ioctl(f, VIDIOC_STREAMOFF, &q->type);
 	v4l_queue_release_bufs(f, q, 0);
 	v4l_queue_close_exported_fds(q);
-	v4l_queue_reqbufs(f, q, 0, 0);
+	v4l_queue_reqbufs(f, q, 0);
 }
 
 static inline void v4l_queue_buffer_update(const struct v4l_queue *q,
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index aca0eb68..1651e95c 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -653,10 +653,6 @@ int testReqBufs(struct node *node)
 		fail_on_test(q.reqbufs(node, 0));
 
 		for (m = V4L2_MEMORY_MMAP; m <= V4L2_MEMORY_DMABUF; m++) {
-			bool cache_hints_cap = false;
-			bool consistent;
-
-			cache_hints_cap = q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
 			if (!(node->valid_memorytype & (1 << m)))
 				continue;
 			cv4l_queue q2(i, m);
@@ -672,17 +668,8 @@ int testReqBufs(struct node *node)
 			reqbufs.count = 1;
 			reqbufs.type = i;
 			reqbufs.memory = m;
-			reqbufs.flags = V4L2_FLAG_MEMORY_NON_CONSISTENT;
 			fail_on_test(doioctl(node, VIDIOC_REQBUFS, &reqbufs));
-			consistent = reqbufs.flags & V4L2_FLAG_MEMORY_NON_CONSISTENT;
-			if (!cache_hints_cap) {
-				fail_on_test(consistent);
-			} else {
-				if (m == V4L2_MEMORY_MMAP)
-					fail_on_test(!consistent);
-				else
-					fail_on_test(consistent);
-			}
+			fail_on_test(check_0(reqbufs.reserved, sizeof(reqbufs.reserved)));
 			q.reqbufs(node);
 
 			ret = q.create_bufs(node, 0);
@@ -695,32 +682,9 @@ int testReqBufs(struct node *node)
 			node->g_fmt(crbufs.format, i);
 			crbufs.count = 1;
 			crbufs.memory = m;
-			crbufs.flags = V4L2_FLAG_MEMORY_NON_CONSISTENT;
 			fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs));
 			fail_on_test(check_0(crbufs.reserved, sizeof(crbufs.reserved)));
 			fail_on_test(crbufs.index != q.g_buffers());
-
-			consistent = crbufs.flags & V4L2_FLAG_MEMORY_NON_CONSISTENT;
-			if (!cache_hints_cap) {
-				fail_on_test(consistent);
-			} else {
-				if (m == V4L2_MEMORY_MMAP)
-					fail_on_test(!consistent);
-				else
-					fail_on_test(consistent);
-			}
-
-			if (cache_hints_cap) {
-				/*
-				 * Different memory consistency model. Should fail for MMAP
-				 * queues which support cache hints.
-				 */
-				crbufs.flags = 0;
-				if (m == V4L2_MEMORY_MMAP)
-					fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs) != EINVAL);
-				else
-					fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs));
-			}
 			q.reqbufs(node);
 
 			fail_on_test(q.create_bufs(node, 1));
@@ -1352,7 +1316,7 @@ int testMmap(struct node *node, struct node *node_m2m_cap, unsigned frame_count,
 			have_createbufs = false;
 		if (have_createbufs) {
 			q.reqbufs(node);
-			q.create_bufs(node, 2, &cur_fmt, V4L2_FLAG_MEMORY_NON_CONSISTENT);
+			q.create_bufs(node, 2, &cur_fmt);
 			fail_on_test(setupMmap(node, q));
 			q.munmap_bufs(node);
 			q.reqbufs(node, 2);
-- 
2.28.0

