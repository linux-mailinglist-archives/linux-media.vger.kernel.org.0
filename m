Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B09D7B0981
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 18:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232196AbjI0QCZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 12:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbjI0QCV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 12:02:21 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FF5D19AF
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 08:39:18 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:672:46bd:3ec7:6cdf])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 74BA86607033;
        Wed, 27 Sep 2023 16:39:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1695829151;
        bh=Y2gbG+boVVeeKfICziMDXKerkrooR8u3fnUjSelh5ps=;
        h=From:To:Cc:Subject:Date:From;
        b=HTLRqfIdn2ys3ZUrq525oQ1uQ/oeui/ivJybg7vJzGNA+ZO2N1YRIZ5ngR/v4qllO
         g7ksZWLlXCi9qnfHSkXB0sIXxVqLflkz0X1UjWlzKvjg9XJKe21kwLBHWohny0Q87y
         6bvB8mLqOxTH96O4qltjSrdI5WVVKc1MUwnExs7v92YR/ChXPEtTE36ZtmHrVIB6Gy
         fFr8EGM3YlT/3r9wUPXPbvbTNd6aezVKlLamrgFHXDqQx/tAn4v5vDPWCvjVZDeiko
         7sPliROJB8qqzsM3aNAxivmmk3463R3Asz3qV5fWW47IsN5S5tsz/9IXHEkdAIde4v
         92XKBfg3jwp4A==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
        nicolas.dufresne@collabora.com
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 1/2] v4l2-compliance: Test queue maximum buffers allocation
Date:   Wed, 27 Sep 2023 17:39:06 +0200
Message-Id: <20230927153907.159496-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If V4L2_BUF_CAP_SUPPORTS_SET_MAX_BUFS is set v4l2_create_buffers
max_buffers field reports the maximum number of buffers supported
by the queue.
Add a test to allocate this maximum value and make sure that one
more allocation is failing.
Display the flag in v4l2-ctl.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 include/linux/videodev2.h                   |  7 +++-
 utils/common/cv4l-helpers.h                 |  1 +
 utils/common/v4l-helpers.h                  |  5 +++
 utils/common/v4l2-info.cpp                  |  1 +
 utils/v4l2-compliance/v4l2-compliance.cpp   |  1 +
 utils/v4l2-compliance/v4l2-compliance.h     |  1 +
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 39 ++++++++++++++++++++-
 7 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index c19441a1..ac5d2980 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -986,6 +986,7 @@ struct v4l2_requestbuffers {
 #define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS		(1 << 4)
 #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
 #define V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS		(1 << 6)
+#define V4L2_BUF_CAP_SUPPORTS_SET_MAX_BUFS		(1 << 7)
 
 /**
  * struct v4l2_plane - plane info for multi-planar buffers
@@ -2531,6 +2532,9 @@ struct v4l2_dbg_chip_info {
  * @flags:	additional buffer management attributes (ignored unless the
  *		queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability
  *		and configured for MMAP streaming I/O).
+ * @max_buffers: if V4L2_BUF_CAP_SUPPORTS_SET_MAX_BUFS capability flag is set
+ *		 this field indicate the maximum possible number of buffers
+ *		 for this queue.
  * @reserved:	future extensions
  */
 struct v4l2_create_buffers {
@@ -2540,7 +2544,8 @@ struct v4l2_create_buffers {
 	struct v4l2_format	format;
 	__u32			capabilities;
 	__u32			flags;
-	__u32			reserved[6];
+	__u32			max_buffers;
+	__u32			reserved[5];
 };
 
 /*
diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index 91a04146..5a515a13 100644
--- a/utils/common/cv4l-helpers.h
+++ b/utils/common/cv4l-helpers.h
@@ -743,6 +743,7 @@ public:
 	unsigned g_type() const { return v4l_queue_g_type(this); }
 	unsigned g_memory() const { return v4l_queue_g_memory(this); }
 	unsigned g_buffers() const { return v4l_queue_g_buffers(this); }
+	unsigned g_max_buffers() const { return v4l_queue_g_max_buffers(this); }
 	unsigned g_num_planes() const { return v4l_queue_g_num_planes(this); }
 	unsigned g_capabilities() const { return v4l_queue_g_capabilities(this); }
 	unsigned g_length(unsigned plane) const { return v4l_queue_g_length(this, plane); }
diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
index f8e96d58..5853f753 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -1429,6 +1429,7 @@ struct v4l_queue {
 	unsigned mappings;
 	unsigned num_planes;
 	unsigned capabilities;
+	unsigned max_buffers;
 
 	__u32 lengths[VIDEO_MAX_PLANES];
 	__u32 mem_offsets[VIDEO_MAX_FRAME][VIDEO_MAX_PLANES];
@@ -1453,6 +1454,7 @@ static inline void v4l_queue_init(struct v4l_queue *q,
 static inline unsigned v4l_queue_g_type(const struct v4l_queue *q) { return q->type; }
 static inline unsigned v4l_queue_g_memory(const struct v4l_queue *q) { return q->memory; }
 static inline unsigned v4l_queue_g_buffers(const struct v4l_queue *q) { return q->buffers; }
+static inline unsigned v4l_queue_g_max_buffers(const struct v4l_queue *q) { return q->max_buffers; }
 static inline unsigned v4l_queue_g_mappings(const struct v4l_queue *q) { return q->mappings; }
 static inline unsigned v4l_queue_g_num_planes(const struct v4l_queue *q) { return q->num_planes; }
 static inline unsigned v4l_queue_g_capabilities(const struct v4l_queue *q) { return q->capabilities; }
@@ -1587,6 +1589,9 @@ static inline int v4l_queue_create_bufs(struct v4l_fd *f,
 	if (ret)
 		return ret;
 	q->capabilities = createbufs.capabilities;
+	q->max_buffers = 32;
+	if (q->capabilities & V4L2_BUF_CAP_SUPPORTS_SET_MAX_BUFS)
+		q->max_buffers = createbufs.max_buffers;
 	q->buffers += createbufs.count;
 	return v4l_queue_querybufs(f, q, q->buffers - createbufs.count);
 }
diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index 4f8c2aa7..7adfedfc 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -206,6 +206,7 @@ static constexpr flag_def bufcap_def[] = {
 	{ V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS, "orphaned-bufs" },
 	{ V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF, "m2m-hold-capture-buf" },
 	{ V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS, "mmap-cache-hints" },
+	{ V4L2_BUF_CAP_SUPPORTS_SET_MAX_BUFS, "set-max-bufs" },
 	{ 0, nullptr }
 };
 
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index f62016e5..56190448 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1448,6 +1448,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 
 		printf("Buffer ioctls%s:\n", suffix);
 		printf("\ttest VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: %s\n", ok(testReqBufs(&node)));
+		printf("\ttest CREATE_BUFS maximum buffers: %s\n", ok(testCreateBufsMax(&node)));
 		// Reopen after each streaming test to reset the streaming state
 		// in case of any errors in the preceeding test.
 		node.reopen();
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 7caf254b..4886e4c8 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -383,6 +383,7 @@ int testReqBufs(struct node *node);
 int testReadWrite(struct node *node);
 int testExpBuf(struct node *node);
 int testBlockingWait(struct node *node);
+int testCreateBufsMax(struct node *node);
 
 // 32-bit architecture, 32/64-bit time_t tests
 int testTime32_64(struct node *node);
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 6d592c9b..b595d1d1 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -634,7 +634,6 @@ int testReqBufs(struct node *node)
 			fail_on_test(testQueryBuf(node, i, q.g_buffers()));
 			node->valid_memorytype |= 1 << V4L2_MEMORY_DMABUF;
 		}
-
 		/*
 		 * It should be possible to set the same std, timings or
 		 * native size even after reqbufs was called.
@@ -761,6 +760,44 @@ int testReqBufs(struct node *node)
 	return 0;
 }
 
+int testCreateBufsMax(struct node *node)
+{
+	unsigned int i;
+	int ret;
+
+	node->reopen();
+
+	cv4l_queue q(0, 0);
+
+	for (i = 1; i <= V4L2_BUF_TYPE_LAST; i++) {
+		if (!(node->valid_buftypes & (1 << i)))
+			continue;
+
+		q.init(i, V4L2_MEMORY_USERPTR);
+		ret = q.create_bufs(node, 1);
+		if (!ret && (q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_SET_MAX_BUFS)) {
+			fail_on_test(q.create_bufs(node, q.g_max_buffers() - q.g_buffers()));
+			fail_on_test(q.create_bufs(node, 1) != ENOBUFS);
+		}
+
+		q.init(i, V4L2_MEMORY_MMAP);
+		ret = q.create_bufs(node, 1);
+		if (!ret && (q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_SET_MAX_BUFS)) {
+			fail_on_test(q.create_bufs(node, q.g_max_buffers() - q.g_buffers()));
+			fail_on_test(q.create_bufs(node, 1) != ENOBUFS);
+		}
+
+		q.init(i, V4L2_MEMORY_DMABUF);
+		ret = q.create_bufs(node, 1);
+		if (!ret && (q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_SET_MAX_BUFS)) {
+			fail_on_test(q.create_bufs(node, q.g_max_buffers() - q.g_buffers()));
+			fail_on_test(q.create_bufs(node, 1) != ENOBUFS);
+		}
+	}
+
+	return 0;
+}
+
 int testExpBuf(struct node *node)
 {
 	bool have_expbuf = false;
-- 
2.39.2

