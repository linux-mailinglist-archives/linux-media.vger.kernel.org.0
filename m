Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 960D21B710E
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 11:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726787AbgDXJhT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 05:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726774AbgDXJhS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 05:37:18 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57EF5C09B045;
        Fri, 24 Apr 2020 02:37:18 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id mq3so3693701pjb.1;
        Fri, 24 Apr 2020 02:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rQRt850loFy2K9Mv2/2PkLvs7gcZ9pajqSB14vuunls=;
        b=t7Z9WsJFCJ5IcdjM97Her8rVj9o55O/L5//QgMLLiESEtj/lD1CianuarVpWUpXPij
         ptMRps06QQQIc9Y9+XeeGV1AF0ucfPd4wq3Y36JWLybskEz3XI7kx7IpHz6566fe2NH3
         dFG19JvPQ6LmyTdGx1rVXjYXvyRfWVBDyE28oCVV8hJNP4Q6FCIspnGKEr/C2Pvf/FrX
         Shq8wEruChQsu6H8R+Ylo2rj4Gq7xETqB5uCA//L3mDOlgKaut1mV0DYHhaMIcj2etqm
         A45hcePVzjjjtzZj/AFp6oiZ5IJV6VBITAa13NhR06nt3a0XbheVj0BTsLhp5pK/BZ7z
         jAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rQRt850loFy2K9Mv2/2PkLvs7gcZ9pajqSB14vuunls=;
        b=Jf4FRp1b8I/oyaHVyyHSMcPhfNqhGXIvEQM2NYfBYlTY7gMTO6P1OqpDMmRSw9nLbJ
         UfbsMJDhdgxmNXal8io6gPIRmaoRsY0H9wq6tR5OACrh5yrfFoJI8G0pUyQTv4fbZsru
         m/YKQium4PgxIZatTEJbmFJdM0ijOoWgUp1Ppvv6ZWrszUvJuOTUHh9t7zKWNGC5fzo8
         NZVP2cSkvj0LALAY8TQiw/JkUFjpZFFWlY0tECeOApMxUI5yeDtKq938C4HLr4Mwax/l
         cZoQehSbJDi4avPl3Bbgj3C1V8afhp/c9EDLh8HfrIdaZwQyQ2pEnULIUQ76GMLawUso
         Q2EA==
X-Gm-Message-State: AGi0Pub27wx7NSsXhbGpdYhB0y7ye4Xd4UXCMhDnAuMeSSSPcW9eStUW
        OumwPn+zE88OT9FFzes2Zx4=
X-Google-Smtp-Source: APiQypKXC+LULEclqOqk9htqfecuBhR0M2mDrUEpqyujQiDPXq/JpNlJbY52dzbd/1JzItb6VQQpGA==
X-Received: by 2002:a17:90a:3781:: with SMTP id v1mr5017458pjb.83.1587721037541;
        Fri, 24 Apr 2020 02:37:17 -0700 (PDT)
Received: from localhost.localdomain (146.85.30.125.dy.iij4u.or.jp. [125.30.85.146])
        by smtp.gmail.com with ESMTPSA id f76sm5080466pfa.167.2020.04.24.02.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 02:37:16 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: [RFC][PATCH] v4l2-utils: test cache_hints for MMAP queues
Date:   Fri, 24 Apr 2020 18:37:01 +0900
Message-Id: <20200424093701.5109-1-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

	RFC version

The patch adds V4L2_FLAG_MEMORY_NON_CONSISTENT consistency
attr test to VIDIOC_REQBUFS and VIDIOC_CREATE_BUFS ioctl-s,
and V4L2_BUF_FLAG_NO_CACHE_INVALIDATE/V4L2_BUF_FLAG_NO_CACHE_CLEAN
buffer cache management hints for MMAP queues.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
---
 utils/common/cv4l-helpers.h                 |   8 +-
 utils/common/v4l-helpers.h                  |  10 +-
 utils/common/v4l2-info.cpp                  |   1 +
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 118 +++++++++++++++++++-
 4 files changed, 124 insertions(+), 13 deletions(-)

diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index 9505e334..9de0cdf0 100644
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
index b794ff88..53f7bec9 100644
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
index 0aac8504..bca42bb4 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -206,6 +206,7 @@ static const flag_def bufcap_def[] = {
 	{ V4L2_BUF_CAP_SUPPORTS_REQUESTS, "requests" },
 	{ V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS, "orphaned-bufs" },
 	{ V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF, "m2m-hold-capture-buf" },
+	{ V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS, "cache-hints" },
 	{ 0, NULL }
 };
 
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 93df7034..c8be8024 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -381,8 +381,6 @@ int buffer::check(unsigned type, unsigned memory, unsigned index,
 	if (g_flags() & V4L2_BUF_FLAG_BFRAME)
 		frame_types++;
 	fail_on_test(frame_types > 1);
-	fail_on_test(g_flags() & (V4L2_BUF_FLAG_NO_CACHE_INVALIDATE |
-				  V4L2_BUF_FLAG_NO_CACHE_CLEAN));
 	if (g_flags() & V4L2_BUF_FLAG_QUEUED)
 		buf_states++;
 	if (g_flags() & V4L2_BUF_FLAG_DONE)
@@ -534,6 +532,80 @@ static int testCanSetSameTimings(struct node *node)
 	return 0;
 }
 
+static int setupMmap(struct node *node, cv4l_queue &q);
+
+static int testCacheHints(struct node *node, int m)
+{
+	struct v4l2_create_buffers crbufs = { };
+	struct v4l2_requestbuffers reqbufs = { };
+	bool cache_hints_cap = false;
+	cv4l_queue q;
+	cv4l_fmt fmt;
+	int ret;
+
+	q.init(node->g_type(), m);
+	/*
+	 * This will call driver's ->queue_setup() so then v4l can report
+	 * proper cache_hints capabilitues.
+	 */
+	ret = q.reqbufs(node, 2);
+	if (ret)
+		return ret;
+
+	/*
+	 * Cache hints cap is set for queues that support VB2_MMAP io_mode,
+	 * but that does not mean that those queues are initialized as
+	 * V4L2_MEMORY_MMAP queues. Thus even if we see cache_hints cap
+	 * queue can still ignore and clear V4L2_FLAG_MEMORY_NON_CONSISTENT.
+	 */
+	cache_hints_cap = q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS;
+
+	reqbufs.count = 2;
+	reqbufs.type = q.g_type();
+	reqbufs.memory = q.g_memory();
+	reqbufs.flags = V4L2_FLAG_MEMORY_NON_CONSISTENT;
+	fail_on_test(doioctl(node, VIDIOC_REQBUFS, &reqbufs));
+	if (cache_hints_cap)
+		fail_on_test(!(reqbufs.flags & V4L2_FLAG_MEMORY_NON_CONSISTENT));
+	else
+		fail_on_test(reqbufs.flags & V4L2_FLAG_MEMORY_NON_CONSISTENT);
+	q.reqbufs(node);
+
+	node->g_fmt(crbufs.format, q.g_type());
+	crbufs.count = 2;
+	crbufs.memory = q.g_memory();
+	crbufs.flags = V4L2_FLAG_MEMORY_NON_CONSISTENT;
+	fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs));
+	if (cache_hints_cap)
+		fail_on_test(!(crbufs.flags & V4L2_FLAG_MEMORY_NON_CONSISTENT));
+	else
+		fail_on_test(crbufs.flags & V4L2_FLAG_MEMORY_NON_CONSISTENT);
+
+	if (cache_hints_cap) {
+		/* Different memory consistency model, should fail */
+		crbufs.count = 2;
+		crbufs.memory = q.g_memory();
+		crbufs.flags = 0;
+		fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs) != EINVAL);
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
@@ -676,8 +748,8 @@ int testReqBufs(struct node *node)
 			reqbufs.count = 0;
 			reqbufs.type = i;
 			reqbufs.memory = m;
+			reqbufs.flags = 0;
 			fail_on_test(doioctl(node, VIDIOC_REQBUFS, &reqbufs));
-			fail_on_test(check_0(reqbufs.reserved, sizeof(reqbufs.reserved)));
 			q.reqbufs(node);
 
 			ret = q.create_bufs(node, 1);
@@ -698,6 +770,7 @@ int testReqBufs(struct node *node)
 			node->g_fmt(crbufs.format, i);
 			crbufs.count = 0;
 			crbufs.memory = m;
+			crbufs.flags = 0;
 			fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs));
 			fail_on_test(check_0(crbufs.reserved, sizeof(crbufs.reserved)));
 			fail_on_test(crbufs.index != q.g_buffers());
@@ -721,6 +794,8 @@ int testReqBufs(struct node *node)
 					fmt.s_sizeimage(fmt.g_sizeimage(p) * 2, p);
 				fail_on_test(q.create_bufs(node, 1, &fmt));
 			}
+
+			printf("\ttest V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS: %s\n", ok(testCacheHints(node, m)));
 		}
 		fail_on_test(q.reqbufs(node));
 	}
@@ -1176,14 +1251,22 @@ static int bufferOutputErrorTest(struct node *node, const buffer &orig_buf)
 
 static int setupMmap(struct node *node, cv4l_queue &q)
 {
+	bool cache_hints = q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS;
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
@@ -1220,6 +1303,14 @@ static int setupMmap(struct node *node, cv4l_queue &q)
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
@@ -1475,11 +1566,17 @@ static int setupUserPtr(struct node *node, cv4l_queue &q)
 {
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
@@ -1537,7 +1634,10 @@ static int setupUserPtr(struct node *node, cv4l_queue &q)
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
@@ -1732,12 +1832,17 @@ static int setupDmaBuf(struct node *expbuf_node, struct node *node,
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
@@ -1757,7 +1862,10 @@ static int setupDmaBuf(struct node *expbuf_node, struct node *node,
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

