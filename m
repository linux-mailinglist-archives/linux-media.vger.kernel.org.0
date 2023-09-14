Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 437797A063B
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 15:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239074AbjINNj0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 09:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239469AbjINNjO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 09:39:14 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66C7030F9
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 06:36:20 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 19FD9660734F;
        Thu, 14 Sep 2023 14:36:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1694698579;
        bh=zBubbgWTO/FDS6eaHEKNRSkJU1Om0Wq2yf/5dVmybd0=;
        h=From:To:Cc:Subject:Date:From;
        b=eG9jNvpxyB0k/so4fcc51nP1vzrNbaZSIqbNIKSa6ByKwG7ScFlrqd2wV+vfFNSCN
         4aGt/BVFszRcNelTJx9HtSYtqx4/WXa2VPdBer81xr+iyfYcH6g6zcdpc+aZ5mo9l/
         JZv6fxNTctLKjONKfybA/GhZpVZ/hV/w3uv2Sk3opEarqcJ+Jn3LVVgbNlxMs11C2C
         7Rl1vyuTgeQqv3+rJAvqdztCdE31RXSKbM1RWj2gYkqKpIkPfwOkkpYp4i7HULdnyV
         Qht19CsbGFUmZVkmJ3jzevTph7UPfX90QxcaiLavIHzxPRI/a17hazQHFmtig0W4th
         uMC4aQHGXnKuw==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
        nicolas.dufresne@collabora.com
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] v4l2-compliance: Add a test for DELETE_BUF ioctl
Date:   Thu, 14 Sep 2023 15:36:15 +0200
Message-Id: <20230914133615.199122-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new test for DELETE_BUFS ioctl.
It create buffers and check if they could be removed from queue.
It also check that removing non existing buffer or a queued
buffer failed.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 include/linux/videodev2.h                   | 16 ++++
 utils/common/cv4l-helpers.h                 |  4 +
 utils/common/v4l-helpers.h                  | 17 ++++
 utils/v4l2-compliance/v4l2-compliance.cpp   |  1 +
 utils/v4l2-compliance/v4l2-compliance.h     |  1 +
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 92 +++++++++++++++++++++
 6 files changed, 131 insertions(+)

diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index c19441a1..9cea9900 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -2543,6 +2543,21 @@ struct v4l2_create_buffers {
 	__u32			reserved[6];
 };
 
+/**
+ * struct v4l2_delete_buffers - VIDIOC_DELETE_BUFS argument
+ * @index:	the first buffer to be deleted
+ * @count:	number of buffers to delete
+ * @type:	enum v4l2_buf_type; buffer type (type == *_MPLANE for
+ *		multiplanar buffers);
+ * @reserved:	futur extensions
+ */
+struct v4l2_delete_buffers {
+	__u32			index;
+	__u32			count;
+	__u32			type;
+	__u32			reserved[13];
+};
+
 /*
  *	I O C T L   C O D E S   F O R   V I D E O   D E V I C E S
  *
@@ -2642,6 +2657,7 @@ struct v4l2_create_buffers {
 #define VIDIOC_DBG_G_CHIP_INFO  _IOWR('V', 102, struct v4l2_dbg_chip_info)
 
 #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_ext_ctrl)
+#define VIDIOC_DELETE_BUFS	_IOWR('V', 104, struct v4l2_delete_buffers)
 
 /* Reminder: when adding new ioctls please add support for them to
    drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index 91a04146..c15c6658 100644
--- a/utils/common/cv4l-helpers.h
+++ b/utils/common/cv4l-helpers.h
@@ -759,6 +759,10 @@ public:
 	{
 		return v4l_queue_reqbufs(fd->g_v4l_fd(), this, count, flags);
 	}
+	int delete_bufs(cv4l_fd *fd, unsigned index = 0, unsigned count = 0)
+	{
+		return v4l_queue_delete_bufs(fd->g_v4l_fd(), this, index, count);
+	}
 	bool has_create_bufs(cv4l_fd *fd) const
 	{
 		return v4l_queue_has_create_bufs(fd->g_v4l_fd(), this);
diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
index f8e96d58..dcb2a58a 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -1508,6 +1508,23 @@ static inline void *v4l_queue_g_dataptr(const struct v4l_queue *q, unsigned inde
 	return v4l_queue_g_mmapping(q, index, plane);
 }
 
+static inline int v4l_queue_delete_bufs(struct v4l_fd *f, struct v4l_queue *q, unsigned index, unsigned count)
+{
+	struct v4l2_delete_buffers deletebufs;
+	int ret;
+
+	memset(&deletebufs, 0, sizeof(deletebufs));
+	deletebufs.type = q->type;
+	deletebufs.index = index;
+	deletebufs.count = count;
+
+	ret = v4l_ioctl(f, VIDIOC_DELETE_BUFS, &deletebufs);
+	if (!ret)
+		q->buffers -= deletebufs.count;
+
+	return ret;
+}
+
 static inline int v4l_queue_querybufs(struct v4l_fd *f, struct v4l_queue *q, unsigned from)
 {
 	unsigned b, p;
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index f62016e5..1abd16b5 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1448,6 +1448,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 
 		printf("Buffer ioctls%s:\n", suffix);
 		printf("\ttest VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: %s\n", ok(testReqBufs(&node)));
+		printf("\ttest VIDIOC_DELETE_BUFS: %s\n", ok(testDeleteBufs(&node)));
 		// Reopen after each streaming test to reset the streaming state
 		// in case of any errors in the preceeding test.
 		node.reopen();
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 7caf254b..99553d94 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -383,6 +383,7 @@ int testReqBufs(struct node *node);
 int testReadWrite(struct node *node);
 int testExpBuf(struct node *node);
 int testBlockingWait(struct node *node);
+int testDeleteBufs(struct node *node);
 
 // 32-bit architecture, 32/64-bit time_t tests
 int testTime32_64(struct node *node);
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 6d592c9b..d66e090d 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -529,6 +529,98 @@ static int testCanSetSameTimings(struct node *node)
 	return 0;
 }
 
+int testDeleteBufs(struct node *node)
+{
+	bool can_stream = node->g_caps() & V4L2_CAP_STREAMING;
+	int ret;
+	unsigned i;
+
+	node->reopen();
+
+	cv4l_queue q(0, 0);
+
+	ret = q.reqbufs(node, 0);
+	if (ret == ENOTTY) {
+		fail_on_test(can_stream);
+		return ret;
+	}
+
+	ret = q.delete_bufs(node, 0, 0);
+	if (ret == ENOTTY)
+		return ret;
+
+	for (i = 1; i <= V4L2_BUF_TYPE_LAST; i++) {
+		if (!(node->valid_buftypes & (1 << i)))
+			continue;
+
+		if (testSetupVbi(node, i))
+			continue;
+
+		info("test buftype %s\n", buftype2s(i).c_str());
+		if (node->valid_buftype == 0)
+			node->valid_buftype = i;
+
+		q.init(i, V4L2_MEMORY_MMAP);
+		ret = q.create_bufs(node, 0);
+		fail_on_test_val(ret && ret != EINVAL, ret);
+		if (!ret) {
+			unsigned buffers;
+			fail_on_test(q.create_bufs(node, 1));
+			buffers = q.g_buffers();
+			fail_on_test(buffers == 0);
+			fail_on_test(q.g_type() != i);
+			fail_on_test(q.delete_bufs(node, 1, buffers) != EINVAL);
+			fail_on_test(q.delete_bufs(node, 0, buffers));
+			fail_on_test(q.delete_bufs(node, 0, 1) != EINVAL);
+			fail_on_test(q.create_bufs(node, 3));
+			fail_on_test(q.delete_bufs(node, 2, 1));
+			fail_on_test(q.delete_bufs(node, 0, 1));
+			fail_on_test(q.delete_bufs(node, 1, 1));
+			fail_on_test(q.delete_bufs(node, 0, 1) != EINVAL);
+		}
+
+		q.init(i, V4L2_MEMORY_USERPTR);
+		ret = q.reqbufs(node, 0);
+		fail_on_test_val(ret && ret != EINVAL, ret);
+		if (!ret) {
+			unsigned buffers;
+			fail_on_test(q.create_bufs(node, 1));
+			buffers = q.g_buffers();
+			fail_on_test(buffers == 0);
+			fail_on_test(q.g_type() != i);
+			fail_on_test(q.delete_bufs(node, 1, buffers) != EINVAL);
+			fail_on_test(q.delete_bufs(node, 0, buffers));
+			fail_on_test(q.delete_bufs(node, 0, 1) != EINVAL);
+			fail_on_test(q.create_bufs(node, 3));
+			fail_on_test(q.delete_bufs(node, 2, 1));
+			fail_on_test(q.delete_bufs(node, 0, 1));
+			fail_on_test(q.delete_bufs(node, 1, 1));
+			fail_on_test(q.delete_bufs(node, 0, 1) != EINVAL);
+		}
+
+		q.init(i, V4L2_MEMORY_DMABUF);
+		ret = q.reqbufs(node, 0);
+		fail_on_test_val(ret && ret != EINVAL, ret);
+		if (!ret) {
+			unsigned buffers;
+			fail_on_test(q.create_bufs(node, 1));
+			buffers = q.g_buffers();
+			fail_on_test(buffers == 0);
+			fail_on_test(q.g_type() != i);
+			fail_on_test(q.delete_bufs(node, 1, buffers) != EINVAL);
+			fail_on_test(q.delete_bufs(node, 0, buffers));
+			fail_on_test(q.delete_bufs(node, 0, 1) != EINVAL);
+			fail_on_test(q.create_bufs(node, 3));
+			fail_on_test(q.delete_bufs(node, 2, 1));
+			fail_on_test(q.delete_bufs(node, 0, 1));
+			fail_on_test(q.delete_bufs(node, 1, 1));
+			fail_on_test(q.delete_bufs(node, 0, 1) != EINVAL);
+		}
+	}
+
+	return 0;
+}
+
 int testReqBufs(struct node *node)
 {
 	struct v4l2_create_buffers crbufs = { };
-- 
2.39.2

