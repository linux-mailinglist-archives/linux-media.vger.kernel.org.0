Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A79DA1F3448
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 08:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbgFIGrT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jun 2020 02:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbgFIGrS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jun 2020 02:47:18 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC49C03E969
        for <linux-media@vger.kernel.org>; Mon,  8 Jun 2020 23:47:18 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id ga6so978706pjb.1
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2020 23:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BzARZk83jYqMDtTbogXSgA8iOeTdaXha4/NdFW9AGks=;
        b=Bktu3IbXUI4yY6dupLFRxSy3T3sr0xjuAc+9SBhhURDHkfJEqYWI63HkJgMce2VmUI
         Ztd/YFiyKsfPz8LbYxCUhx440HuXOgqIqFpgW61Qi4NVUbHjDJparp3QlHHMv9oI5xvy
         oMKPICi0wzs1DWzBUNPoXNJ+8g4gjk02ZvN+VaRAELe0h3uHJCtHTO11OSjBb0FISXOx
         8wbtsabGBpCro5MjtZ6AXRbWdbUkQtra0lo1wigOFaSII1GrgnqHDjGk/sZkXVlBk5Rr
         9NDmDPGSVqWzJ/9vXsO5Ix8GBWXlmAD/u0x8yqb2EolJnrfBQkjkwbv3loMvOJ924QyR
         /n3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BzARZk83jYqMDtTbogXSgA8iOeTdaXha4/NdFW9AGks=;
        b=SHtw5tnbsb/ZxOlPWEj079JoZMxMSC13tzTsWuY/8l7qko3EtnzxVzfgvImvbziVDZ
         DqiT3q2MSblhooIf4X22uXIThYIjSOg0LtFjSe6FfnTBKJLK8bxW0AgkJuXgH5gQyleb
         xdvT90Cs8aV9NdG95kV5vO8Y10oNvJBNk2ESpUGeD3uxYampUrXEe19ZhiP6RItXVc9H
         9cRZJaYPHFk9SPJLIPnpO/LnSeJllLgz9PGeYxDyu6btET95zfkB5Pwm07IW8yF+opNS
         b9pgAKi1saaBbyT6xBlYVP6AVn/GsztgyIwr0idsT/oDGdqPkljZV8NzlL0JwpQPBh/N
         pJEw==
X-Gm-Message-State: AOAM532wTrYuuzpussydAx8ktMXKWQMyZNUiKcVgZCLI30+1FoxO+wko
        eHP+qc3PKfdub009cCncSKo=
X-Google-Smtp-Source: ABdhPJw+Du2tO9PWvewHif/zWD6xK3o2BvbedyPfHU46qR2qDpBbHwev+7JVJmATl7dnZvVcN1pCOw==
X-Received: by 2002:a17:90b:143:: with SMTP id em3mr3266414pjb.92.1591685237672;
        Mon, 08 Jun 2020 23:47:17 -0700 (PDT)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id h7sm7660124pgn.60.2020.06.08.23.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 23:47:16 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     linux-media@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: [PATCHv3] v4l2-utils: test cache_hints for MMAP queues
Date:   Tue,  9 Jun 2020 15:47:11 +0900
Message-Id: <20200609064711.39074-1-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The patch adds V4L2_FLAG_MEMORY_NON_CONSISTENT consistency
attr test to VIDIOC_REQBUFS and VIDIOC_CREATE_BUFS ioctl-s,
and V4L2_BUF_FLAG_NO_CACHE_INVALIDATE/V4L2_BUF_FLAG_NO_CACHE_CLEAN
buffer cache management hints test for MMAP queues.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
---

v3: intergated cache-hints test into testReqBufs (Hans)

 utils/common/cv4l-helpers.h                 |   8 +-
 utils/common/v4l-helpers.h                  |  10 +-
 utils/common/v4l2-info.cpp                  |   1 +
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 105 +++++++++++++++++---
 4 files changed, 102 insertions(+), 22 deletions(-)

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
index 0aac8504..a69569a6 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -206,6 +206,7 @@ static const flag_def bufcap_def[] = {
 	{ V4L2_BUF_CAP_SUPPORTS_REQUESTS, "requests" },
 	{ V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS, "orphaned-bufs" },
 	{ V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF, "m2m-hold-capture-buf" },
+	{ V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS, "mmap-cache-hints" },
 	{ 0, NULL }
 };
 
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index fc49fff6..d1224438 100644
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
@@ -661,6 +659,10 @@ int testReqBufs(struct node *node)
 		fail_on_test(q.reqbufs(node, 0));
 
 		for (m = V4L2_MEMORY_MMAP; m <= V4L2_MEMORY_DMABUF; m++) {
+			bool cache_hints_cap = false;
+			bool consistent;
+
+			cache_hints_cap = q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
 			if (!(node->valid_memorytype & (1 << m)))
 				continue;
 			cv4l_queue q2(i, m);
@@ -673,11 +675,52 @@ int testReqBufs(struct node *node)
 				fail_on_test(q2.reqbufs(node->node2));
 			}
 			memset(&reqbufs, 0xff, sizeof(reqbufs));
-			reqbufs.count = 0;
+			reqbufs.count = 1;
 			reqbufs.type = i;
 			reqbufs.memory = m;
+			reqbufs.flags = V4L2_FLAG_MEMORY_NON_CONSISTENT;
 			fail_on_test(doioctl(node, VIDIOC_REQBUFS, &reqbufs));
-			fail_on_test(check_0(reqbufs.reserved, sizeof(reqbufs.reserved)));
+			consistent = reqbufs.flags & V4L2_FLAG_MEMORY_NON_CONSISTENT;
+			if (!cache_hints_cap) {
+				fail_on_test(consistent);
+			} else {
+				if (m == V4L2_MEMORY_MMAP)
+					fail_on_test(!consistent);
+				else
+					fail_on_test(consistent);
+			}
+			q.reqbufs(node);
+
+			memset(&crbufs, 0xff, sizeof(crbufs));
+			node->g_fmt(crbufs.format, i);
+			crbufs.count = 1;
+			crbufs.memory = m;
+			crbufs.flags = V4L2_FLAG_MEMORY_NON_CONSISTENT;
+			fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs));
+			fail_on_test(check_0(crbufs.reserved, sizeof(crbufs.reserved)));
+			fail_on_test(crbufs.index != q.g_buffers());
+
+			consistent = crbufs.flags & V4L2_FLAG_MEMORY_NON_CONSISTENT;
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
 
 			ret = q.create_bufs(node, 1);
@@ -693,14 +736,7 @@ int testReqBufs(struct node *node)
 			fail_on_test(testQueryBuf(node, i, q.g_buffers()));
 			if (!node->is_m2m)
 				fail_on_test(q2.create_bufs(node->node2, 1) != EBUSY);
-
-			memset(&crbufs, 0xff, sizeof(crbufs));
-			node->g_fmt(crbufs.format, i);
-			crbufs.count = 0;
-			crbufs.memory = m;
-			fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs));
-			fail_on_test(check_0(crbufs.reserved, sizeof(crbufs.reserved)));
-			fail_on_test(crbufs.index != q.g_buffers());
+			q.reqbufs(node);
 
 			if (node->is_video) {
 				cv4l_fmt fmt;
@@ -1176,14 +1212,22 @@ static int bufferOutputErrorTest(struct node *node, const buffer &orig_buf)
 
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
@@ -1220,6 +1264,14 @@ static int setupMmap(struct node *node, cv4l_queue &q)
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
@@ -1240,6 +1292,8 @@ int testMmap(struct node *node, struct node *node_m2m_cap, unsigned frame_count,
 
 	buffer_info.clear();
 	for (type = 0; type <= V4L2_BUF_TYPE_LAST; type++) {
+		cv4l_fmt fmt;
+
 		if (!(node->valid_buftypes & (1 << type)))
 			continue;
 		if (v4l_type_is_overlay(type))
@@ -1297,6 +1351,11 @@ int testMmap(struct node *node, struct node *node_m2m_cap, unsigned frame_count,
 		fail_on_test(q.reqbufs(node, q.g_buffers()));
 		fail_on_test(node->g_fmt(cur_fmt, q.g_type()));
 
+		q.reqbufs(node);
+		q.create_bufs(node, 2, &cur_fmt, V4L2_FLAG_MEMORY_NON_CONSISTENT);
+		fail_on_test(setupMmap(node, q));
+		q.reqbufs(node);
+
 		ret = q.create_bufs(node, 0);
 		fail_on_test(ret != ENOTTY && ret != 0);
 		if (ret == ENOTTY)
@@ -1475,11 +1534,17 @@ static int setupUserPtr(struct node *node, cv4l_queue &q)
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
@@ -1537,7 +1602,10 @@ static int setupUserPtr(struct node *node, cv4l_queue &q)
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
@@ -1732,12 +1800,17 @@ static int setupDmaBuf(struct node *expbuf_node, struct node *node,
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
@@ -1757,7 +1830,11 @@ static int setupDmaBuf(struct node *expbuf_node, struct node *node,
 			if (v4l_type_is_output(q.g_type()))
 				fail_on_test(!buf.g_bytesused(p));
 		}
-		fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_DONE);
+		flags = buf.g_flags();
+		/* We always skip cache sync/flush for DMABUF memory type */
+		fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE));
+		fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN));
+		fail_on_test(flags & V4L2_BUF_FLAG_DONE);
 		fail_on_test(buf.querybuf(node, i));
 		fail_on_test(buf.check(q, Queued, i));
 	}
-- 
2.27.0

