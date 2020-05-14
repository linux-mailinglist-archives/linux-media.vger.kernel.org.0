Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E061D3609
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 18:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgENQKT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 12:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbgENQKS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 12:10:18 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C901C061A0C
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 09:10:18 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id mq3so12740433pjb.1
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 09:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6aRcBz60qIzlsGReydw1+Tl+miaSqD9hCbUaxp5efPc=;
        b=FjMU2lw8VeqWLYzXLDMGAw905WixPkI/iteKy5Z+PIGMsbtS3EChsouxGz3bJt7i5M
         3xBmze3NwhSAXbQk2X1OGaGvywYPfZeUivdAoOFAAhYpphlkKCVEktrBqB9uNS5n0xEW
         4tbBed3KPglVBK6cEB4aEKvNuwPOOxj0+Y4Ft4+FTLmJ56gvfubH/z68rURJidHzkVMq
         6qTgSRNm0IsY7td/k7Py156MBrF0+YJl3pLMvxpqJBwWUUJcAb1CHKcfD6RlSwue98l0
         RSalCflKodGlfTDfqBwtTRP3vi7Xuhk8AEu6pgISr9+O4ogWeDCVIu/40cMx3eBf9zj2
         WAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6aRcBz60qIzlsGReydw1+Tl+miaSqD9hCbUaxp5efPc=;
        b=P2Px1um32MIg9m5WiQ9AMB0S+5QTNmTaD6+j74MpkwpYsP8WMoVEUyAp5ZRLzwGOv5
         znrFdd0ZgwYqpp539XqGqESOx2FWb2fEhnnRM7bnHL0IDRuxYyjPblx7mO6j4rTr2Ys5
         inpkkmK0Pbc66m65tMK+PxEeTNI1XDbdqsejSGDX9T6gRT2IlYJ0Ta/sCLWWLzmdwJZf
         nqIR6KbVRm2ZFU1wMao7eI41Y/MzoFPoHYNNH4qnomNTfHhBh4/A6ufp0LGtZvZz3qKL
         HVUFqFkQp29pk0uKCgKVo1X7SCM54FM/QXLelsKifyJs9R5nR+vdVBF3hHGPQ4h8GbAR
         adnA==
X-Gm-Message-State: AOAM532xlzBSN9/DVuEOo3J7G/5beEBkwOX+/7MjtzFbyU8/S7ZqLP/I
        GcaQc7zZSbHw7pPfAoFB33UankJr
X-Google-Smtp-Source: ABdhPJx3ikLDRWhMKPcuPpb5oRUBTLOs4M8En2LpRcbj3Wh1/fuypmNw1op0PbrSBCZKBDCRM2h0tg==
X-Received: by 2002:a17:902:ac97:: with SMTP id h23mr4673673plr.89.1589472617886;
        Thu, 14 May 2020 09:10:17 -0700 (PDT)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id z15sm18403430pjt.20.2020.05.14.09.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 09:10:16 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     linux-media@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: [PATCH 1/1] v4l2-utils: test cache_hints for MMAP queues
Date:   Fri, 15 May 2020 01:10:09 +0900
Message-Id: <20200514161009.6451-1-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

   RFC

A simple (and slightly messy) patch I used for cache-hints testing.

======

The patch adds V4L2_FLAG_MEMORY_NON_CONSISTENT consistency
attr test to VIDIOC_REQBUFS and VIDIOC_CREATE_BUFS ioctl-s,
and V4L2_BUF_FLAG_NO_CACHE_INVALIDATE/V4L2_BUF_FLAG_NO_CACHE_CLEAN
buffer cache management hints test for MMAP queues.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
---
 utils/common/cv4l-helpers.h                 |   8 +-
 utils/common/v4l-helpers.h                  |  10 +-
 utils/common/v4l2-info.cpp                  |   1 +
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 126 +++++++++++++++++++-
 4 files changed, 132 insertions(+), 13 deletions(-)

diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index a8089930..be1fa7b4 100644
--- a/utils/common/cv4l-helpers.h
+++ b/utils/common/cv4l-helpers.h
@@ -753,17 +753,17 @@ public:
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
index c37124e4..f5acb5bb 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -1513,7 +1513,7 @@ static inline int v4l_queue_querybufs(struct v4l_fd *f, struct v4l_queue *q, uns
 }
 
 static inline int v4l_queue_reqbufs(struct v4l_fd *f,
-		struct v4l_queue *q, unsigned count)
+		struct v4l_queue *q, unsigned count, unsigned int flags = 0)
 {
 	struct v4l2_requestbuffers reqbufs;
 	int ret;
@@ -1521,7 +1521,7 @@ static inline int v4l_queue_reqbufs(struct v4l_fd *f,
 	reqbufs.type = q->type;
 	reqbufs.memory = q->memory;
 	reqbufs.count = count;
-	memset(reqbufs.reserved, 0, sizeof(reqbufs.reserved));
+	reqbufs.flags = flags;
 	/*
 	 * Problem: if REQBUFS returns an error, did it free any old
 	 * buffers or not?
@@ -1545,7 +1545,8 @@ static inline bool v4l_queue_has_create_bufs(struct v4l_fd *f, const struct v4l_
 }
 
 static inline int v4l_queue_create_bufs(struct v4l_fd *f,
-		struct v4l_queue *q, unsigned count, const struct v4l2_format *fmt)
+		struct v4l_queue *q, unsigned count,
+		const struct v4l2_format *fmt, unsigned int flags = 0)
 {
 	struct v4l2_create_buffers createbufs;
 	int ret;
@@ -1553,6 +1554,7 @@ static inline int v4l_queue_create_bufs(struct v4l_fd *f,
 	createbufs.format.type = q->type;
 	createbufs.memory = q->memory;
 	createbufs.count = count;
+	createbufs.flags = flags;
 	if (fmt) {
 		createbufs.format = *fmt;
 	} else {
@@ -1731,7 +1733,7 @@ static inline void v4l_queue_free(struct v4l_fd *f, struct v4l_queue *q)
 	v4l_ioctl(f, VIDIOC_STREAMOFF, &q->type);
 	v4l_queue_release_bufs(f, q, 0);
 	v4l_queue_close_exported_fds(q);
-	v4l_queue_reqbufs(f, q, 0);
+	v4l_queue_reqbufs(f, q, 0, 0);
 }
 
 static inline void v4l_queue_buffer_update(const struct v4l_queue *q,
diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index 2f4f2e3c..303835b2 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -205,6 +205,7 @@ static const flag_def bufcap_def[] = {
 	{ V4L2_BUF_CAP_SUPPORTS_DMABUF, "dmabuf" },
 	{ V4L2_BUF_CAP_SUPPORTS_REQUESTS, "requests" },
 	{ V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS, "orphaned-bufs" },
+	{ V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS, "mmap-cache-hints" },
 	{ 0, NULL }
 };
 
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 029d0ed0..b43d922d 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -379,8 +379,6 @@ int buffer::check(unsigned type, unsigned memory, unsigned index,
 	if (g_flags() & V4L2_BUF_FLAG_BFRAME)
 		frame_types++;
 	fail_on_test(frame_types > 1);
-	fail_on_test(g_flags() & (V4L2_BUF_FLAG_NO_CACHE_INVALIDATE |
-				  V4L2_BUF_FLAG_NO_CACHE_CLEAN));
 	if (g_flags() & V4L2_BUF_FLAG_QUEUED)
 		buf_states++;
 	if (g_flags() & V4L2_BUF_FLAG_DONE)
@@ -532,6 +530,88 @@ static int testCanSetSameTimings(struct node *node)
 	return 0;
 }
 
+static int setupMmap(struct node *node, cv4l_queue &q);
+
+static int testCacheHints(struct node *node, int m)
+{
+	struct v4l2_create_buffers crbufs = { };
+	struct v4l2_requestbuffers reqbufs = { };
+	bool cache_hints_cap = false;
+	bool consistent;
+	cv4l_queue q;
+	cv4l_fmt fmt;
+	int ret;
+
+	q.init(node->g_type(), m);
+	ret = q.reqbufs(node);
+	if (ret)
+		return ret;
+
+	cache_hints_cap = q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
+
+	reqbufs.count = 2;
+	reqbufs.type = q.g_type();
+	reqbufs.memory = q.g_memory();
+	reqbufs.flags = V4L2_FLAG_MEMORY_NON_CONSISTENT;
+	fail_on_test(doioctl(node, VIDIOC_REQBUFS, &reqbufs));
+	consistent = reqbufs.flags & V4L2_FLAG_MEMORY_NON_CONSISTENT;
+	if (!cache_hints_cap) {
+		fail_on_test(consistent);
+	} else {
+		if (m == V4L2_MEMORY_MMAP)
+			fail_on_test(!consistent);
+		else
+			fail_on_test(consistent);
+	}
+
+	q.reqbufs(node);
+
+	node->g_fmt(crbufs.format, q.g_type());
+	crbufs.count = 2;
+	crbufs.memory = q.g_memory();
+	crbufs.flags = V4L2_FLAG_MEMORY_NON_CONSISTENT;
+	fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs));
+	consistent = crbufs.flags & V4L2_FLAG_MEMORY_NON_CONSISTENT;
+	if (!cache_hints_cap) {
+		fail_on_test(consistent);
+	} else {
+		if (m == V4L2_MEMORY_MMAP)
+			fail_on_test(!consistent);
+		else
+			fail_on_test(consistent);
+	}
+
+	if (cache_hints_cap) {
+		crbufs.count = 2;
+		crbufs.memory = q.g_memory();
+		/*
+		 * Different memory consistency model. Should fail for MMAP
+		 * queues which support cache hints.
+		 */
+		crbufs.flags = 0;
+		if (m == V4L2_MEMORY_MMAP)
+			fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs) != EINVAL);
+		else
+			fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs));
+	}
+	q.reqbufs(node);
+
+	/* For the time being only MMAP is tested */
+	if (m != V4L2_MEMORY_MMAP)
+		return 0;
+
+	node->g_fmt(fmt, q.g_type());
+	q.create_bufs(node, 2, &fmt, 0);
+	fail_on_test(setupMmap(node, q));
+
+	q.reqbufs(node);
+	q.create_bufs(node, 2, &fmt, V4L2_FLAG_MEMORY_NON_CONSISTENT);
+	fail_on_test(setupMmap(node, q));
+
+	q.reqbufs(node, 1);
+	return ret;
+}
+
 int testReqBufs(struct node *node)
 {
 	struct v4l2_create_buffers crbufs = { };
@@ -674,8 +754,8 @@ int testReqBufs(struct node *node)
 			reqbufs.count = 0;
 			reqbufs.type = i;
 			reqbufs.memory = m;
+			reqbufs.flags = 0;
 			fail_on_test(doioctl(node, VIDIOC_REQBUFS, &reqbufs));
-			fail_on_test(check_0(reqbufs.reserved, sizeof(reqbufs.reserved)));
 			q.reqbufs(node);
 
 			ret = q.create_bufs(node, 1);
@@ -696,6 +776,7 @@ int testReqBufs(struct node *node)
 			node->g_fmt(crbufs.format, i);
 			crbufs.count = 0;
 			crbufs.memory = m;
+			crbufs.flags = 0;
 			fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs));
 			fail_on_test(check_0(crbufs.reserved, sizeof(crbufs.reserved)));
 			fail_on_test(crbufs.index != q.g_buffers());
@@ -719,6 +800,8 @@ int testReqBufs(struct node *node)
 					fmt.s_sizeimage(fmt.g_sizeimage(p) * 2, p);
 				fail_on_test(q.create_bufs(node, 1, &fmt));
 			}
+
+			printf("\ttest V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS: %s\n", ok(testCacheHints(node, m)));
 		}
 		fail_on_test(q.reqbufs(node));
 	}
@@ -1159,14 +1242,22 @@ static int bufferOutputErrorTest(struct node *node, const buffer &orig_buf)
 
 static int setupMmap(struct node *node, cv4l_queue &q)
 {
+	bool cache_hints = q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
+
 	fail_on_test(q.mmap_bufs(node));
 	for (unsigned i = 0; i < q.g_buffers(); i++) {
 		buffer buf(q);
+		unsigned int flags;
 		int ret;
 
 		fail_on_test(buf.querybuf(node, i));
 		fail_on_test(buf.check(q, Unqueued, i));
 
+		flags = buf.g_flags();
+		flags |= V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
+		flags |= V4L2_BUF_FLAG_NO_CACHE_CLEAN;
+		buf.s_flags(flags);
+
 		for (unsigned p = 0; p < buf.g_num_planes(); p++) {
 			// Try a random offset
 			fail_on_test(node->mmap(buf.g_length(p),
@@ -1203,6 +1294,14 @@ static int setupMmap(struct node *node, cv4l_queue &q)
 			buf.s_index(buf.g_index() - VIDEO_MAX_FRAME);
 			fail_on_test(buf.g_index() != i);
 		}
+		flags = buf.g_flags();
+		if (cache_hints) {
+			fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE));
+			fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN));
+		} else {
+			fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE);
+			fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN);
+		}
 		fail_on_test(buf.querybuf(node, i));
 		fail_on_test(buf.check(q, Queued, i));
 		fail_on_test(!buf.dqbuf(node));
@@ -1460,11 +1559,17 @@ static int setupUserPtr(struct node *node, cv4l_queue &q)
 
 	for (unsigned i = 0; i < q.g_buffers(); i++) {
 		buffer buf(q);
+		unsigned int flags;
 		int ret;
 
 		fail_on_test(buf.querybuf(node, i));
 		fail_on_test(buf.check(q, Unqueued, i));
 
+		flags = buf.g_flags();
+		flags |= V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
+		flags |= V4L2_BUF_FLAG_NO_CACHE_CLEAN;
+		buf.s_flags(flags);
+
 		for (unsigned p = 0; p < buf.g_num_planes(); p++) {
 			// This should not work!
 			fail_on_test(node->mmap(buf.g_length(p), 0) != MAP_FAILED);
@@ -1522,7 +1627,10 @@ static int setupUserPtr(struct node *node, cv4l_queue &q)
 			if (v4l_type_is_output(q.g_type()))
 				fail_on_test(!buf.g_bytesused(p));
 		}
-		fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_DONE);
+		flags = buf.g_flags();
+		fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE);
+		fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN);
+		fail_on_test(flags & V4L2_BUF_FLAG_DONE);
 		fail_on_test(buf.querybuf(node, i));
 		fail_on_test(buf.check(q, Queued, i));
 	}
@@ -1640,12 +1748,17 @@ static int setupDmaBuf(struct node *expbuf_node, struct node *node,
 	fail_on_test(q.mmap_bufs(node));
 	for (unsigned i = 0; i < q.g_buffers(); i++) {
 		buffer buf(q);
+		unsigned int flags;
 		int ret;
 
 		buf.init(q, i);
 		fail_on_test(buf.querybuf(node, i));
 		for (unsigned p = 0; p < buf.g_num_planes(); p++)
 			buf.s_fd(q.g_fd(i, p), p);
+		flags = buf.g_flags();
+		flags |= V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
+		flags |= V4L2_BUF_FLAG_NO_CACHE_CLEAN;
+		buf.s_flags(flags);
 		ret = buf.prepare_buf(node, q);
 		if (ret != ENOTTY) {
 			fail_on_test(ret);
@@ -1665,7 +1778,10 @@ static int setupDmaBuf(struct node *expbuf_node, struct node *node,
 			if (v4l_type_is_output(q.g_type()))
 				fail_on_test(!buf.g_bytesused(p));
 		}
-		fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_DONE);
+		flags = buf.g_flags();
+		fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE);
+		fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN);
+		fail_on_test(flags & V4L2_BUF_FLAG_DONE);
 		fail_on_test(buf.querybuf(node, i));
 		fail_on_test(buf.check(q, Queued, i));
 	}
-- 
2.26.2

