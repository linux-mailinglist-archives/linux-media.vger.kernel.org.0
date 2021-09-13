Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7885B4082DC
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 04:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236907AbhIMChK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Sep 2021 22:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235364AbhIMChK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Sep 2021 22:37:10 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37E56C061574
        for <linux-media@vger.kernel.org>; Sun, 12 Sep 2021 19:35:55 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id 5so4834983plo.5
        for <linux-media@vger.kernel.org>; Sun, 12 Sep 2021 19:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OtQUeP+o3CZW2weqcZePhHfKLt4asHmv8AfySmT8iew=;
        b=JZvQGGMmMJGmx3FEWXDgOTWqXcpuq8/ENrxSgvwG4FK4X/b6zLiJNiHBezeWX6ZckH
         R8Ywm9bfXKS8uJ5+ejYGUa2hMh86EMn3t+Hogcqfq7RarDeWlOiOPua+DI+gBOMkU9YO
         txtlOS6mi/9G2Z5wq+REnVDWbxuA4hHG/Zl1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OtQUeP+o3CZW2weqcZePhHfKLt4asHmv8AfySmT8iew=;
        b=DmucDv4rqMu+Dwj7ZIgo/oZBpWsP50p9SS6IyEY31wXuYPrf6sdxAYfmG1272QE0BM
         Z6Ft4lmI7MdWAn5LsETHbIKh3WUYrBqzNRkLtFqHs3iJjgnujGJOO08+zoTIaj1kZQAv
         m+mAsOr8EsKNXWdMo3t681DinL1ihOkvlHIEf5iYGvmmpLAGGrFLU5qEOtRYnhB6xgPM
         WOLy+KkLJrfmhInbWhjlis4ps55EijT14/GVhW9USUkDZmCrmpaXZz/gFAn8kNcimQKK
         9wsHUNzTfXMgnRitZGQytiCXx8BgmmuIRSTHEdaQJIHjC3gQ6fvf9m6Vwzjo4tg/tNt3
         wE2w==
X-Gm-Message-State: AOAM530K/sz506TjK61ABG7yPdYCTuwik7GMmVQ0svZD2WZRc6Ixn3Jc
        cILAqpbUUZn3azDT8i/hiwUfgg==
X-Google-Smtp-Source: ABdhPJzcg7gGZrhwnMFD3bUAgbZx5btE420ecSSFp/5XRcU4n0XRlCrAsBwXyLug5MRSZwhnqcdyUg==
X-Received: by 2002:a17:902:a503:b029:12b:2429:385e with SMTP id s3-20020a170902a503b029012b2429385emr8482313plq.64.1631500554523;
        Sun, 12 Sep 2021 19:35:54 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:b474:1bec:2c41:a4ff])
        by smtp.gmail.com with ESMTPSA id b5sm4770564pjq.2.2021.09.12.19.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 19:35:53 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv2] v4l-compliance: re-introduce NON_COHERENT and cache hints tests
Date:   Mon, 13 Sep 2021 11:35:46 +0900
Message-Id: <20210913023546.905914-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
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

- Fixed the setupDmaBuf() test. It was wrong before - kernel should have
  always cleared passed cache maangement hints, becuase DMABUF does not
  support ones.

 utils/common/cv4l-helpers.h                 |  8 +--
 utils/common/v4l-helpers.h                  |  8 ++-
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 72 +++++++++++++++++----
 3 files changed, 70 insertions(+), 18 deletions(-)

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
index 48718656..5435943b 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -656,6 +656,10 @@ int testReqBufs(struct node *node)
 		fail_on_test(q.reqbufs(node, 0));
 
 		for (m = V4L2_MEMORY_MMAP; m <= V4L2_MEMORY_DMABUF; m++) {
+			bool cache_hints_cap = false;
+			bool coherent;
+
+			cache_hints_cap = q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
 			if (!(node->valid_memorytype & (1 << m)))
 				continue;
 			cv4l_queue q2(i, m);
@@ -671,8 +675,17 @@ int testReqBufs(struct node *node)
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
@@ -685,9 +698,32 @@ int testReqBufs(struct node *node)
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
@@ -1200,10 +1236,16 @@ static int setupMmap(struct node *node, cv4l_queue &q)
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
@@ -1243,8 +1285,15 @@ static int setupMmap(struct node *node, cv4l_queue &q)
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
@@ -1334,7 +1383,7 @@ int testMmap(struct node *node, struct node *node_m2m_cap, unsigned frame_count,
 			have_createbufs = false;
 		if (have_createbufs) {
 			q.reqbufs(node);
-			q.create_bufs(node, 2, &cur_fmt);
+			q.create_bufs(node, 2, &cur_fmt, V4L2_MEMORY_FLAG_NON_COHERENT);
 			fail_on_test(setupMmap(node, q));
 			q.munmap_bufs(node);
 			q.reqbufs(node, 2);
@@ -1816,9 +1865,10 @@ static int setupDmaBuf(struct node *expbuf_node, struct node *node,
 				fail_on_test(!buf.g_bytesused(p));
 		}
 		flags = buf.g_flags();
-		/* We always skip cache sync/flush for DMABUF memory type */
-		fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE));
-		fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN));
+
+		/* Make sure that flags are cleared */
+		fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE);
+		fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN);
 		fail_on_test(flags & V4L2_BUF_FLAG_DONE);
 		fail_on_test(buf.querybuf(node, i));
 		fail_on_test(buf.check(q, Queued, i));
-- 
2.27.0

