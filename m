Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3793C2177
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 11:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231811AbhGIJZR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 05:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231772AbhGIJZQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 05:25:16 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C80D5C0613E5
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 02:22:32 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id v7so9377239pgl.2
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 02:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RlfCcmnaKjWMgGf+C5ZyjROOblJXlKUZxKhwFdlX48g=;
        b=CnWTLC4bogv5Y7mzmfByF6quAwALIuZSTIvaOW83dBVRdcfaALVYOFVi1A/TDZD7ls
         Fp+qdejH+M+gle+5gOEKVrPYHGKleNmJLn2uBTwzO3BaVINq2PCRCySVqpjx3YbfzJB2
         LWQfZrRGWV35+jGtc54wuWJNRFN0niL7QnqAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RlfCcmnaKjWMgGf+C5ZyjROOblJXlKUZxKhwFdlX48g=;
        b=sRyKBFXKmciq5clYPqEj4e3Tcze3E1IfFqQBenkAuskYjgDHgv4OBSLYwcebFQPmxx
         keo+AxnPM4j4U4uYfENidMDPgfTFevstV0OJx3P1lyUuWaOKN+N7v0ya1044Rvngi95G
         s2KW/3Kd55Chzpp4n4/HkGVpZstMR54cTAWUPLN15vBoOWb9vr5DxHG5SsgqkrP1/alB
         H0wc+oufebLCM0GVGPC0bQ/D3Xy4Bb+c8RB5GWIC2k5AYC3SFuD0Z3a9xn0oHjHTQgOZ
         v43203IHpoj/juXu+8QyfQDNf/8mDJiCtOq2GIXojmA8jzlKp0Cs/qqG7o4w6C7qLyzn
         xBmA==
X-Gm-Message-State: AOAM532tHEKPt2EKw6h0UWuBHP+HERazWFqb2cUqt/yH+Z0lsT83q64U
        /fyTidwvgzK22+JTcdf+f19DyA==
X-Google-Smtp-Source: ABdhPJwqj9MiHt6DYZiEJ2d/D4RKw62VV8Ta6btyeDPx0NISIHpwyDaibpJc2AK6094gkv5mHgjYEg==
X-Received: by 2002:a63:1215:: with SMTP id h21mr36491635pgl.173.1625822552412;
        Fri, 09 Jul 2021 02:22:32 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:a30d:fc4:7834:ee08])
        by smtp.gmail.com with ESMTPSA id 11sm6577640pge.7.2021.07.09.02.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 02:22:32 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] v4l-compliance: re-introduce NON_COHERENT and cache hints tests
Date:   Fri,  9 Jul 2021 18:22:27 +0900
Message-Id: <20210709092227.1051346-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
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
+			bool coherent;
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
+			coherent = reqbufs.flags & V4L2_MEMORY_FLAG_NON_COHERENT;
+			if (!cache_hints_cap) {
+				fail_on_test(coherent);
+			} else {
+				if (m == V4L2_MEMORY_MMAP)
+					fail_on_test(!coherent);
+				else
+					fail_on_test(coherent);
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
+			coherent = crbufs.flags & V4L2_MEMORY_FLAG_NON_COHERENT;
+			if (!cache_hints_cap) {
+				fail_on_test(coherent);
+			} else {
+				if (m == V4L2_MEMORY_MMAP)
+					fail_on_test(!coherent);
+				else
+					fail_on_test(coherent);
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

