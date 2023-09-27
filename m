Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B36A7B0955
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 17:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232634AbjI0PvL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 11:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232868AbjI0Puy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 11:50:54 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF045B9D
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 08:39:18 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:672:46bd:3ec7:6cdf])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id BFC55660730F;
        Wed, 27 Sep 2023 16:39:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1695829151;
        bh=CX/eU5f+mbxPJMgZg9RsorMEE1rtt98Wr5Z44+MNq6k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G5sF76kHIcwXSKifgYaJTnlC7Da46XmMGNVj9lx39NeQm+a3aC3E/ybwzz6Qrz4v7
         oHbLrp/WuXwIwDhIjhH4PypM1BUv5q+CJ0v5X94KbLIcye8jqqthgNWhNQwO7Bp9Gl
         Dmfa/SxxA/vAwWNlAOjrxZ1d6H2FU1s5qSotfGBhFMLSMR9Wryqh/5YhDLX4DBISW+
         1ooenGKR8ZHHfzwcoXPf64Kx4vQkYpryfBzBGEO8+ZwI6goPSUYB61NGaEXzEoRNev
         nnbLq1uw/6PzeOIdBXmfea975T2WtZxPqzb2ghWdGRURhfCgzfKnYr3GmLGH2sc2id
         iEgsEflFjacSw==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
        nicolas.dufresne@collabora.com
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 2/2] v4l2-compliance: Add a test for DELETE_BUF ioctl
Date:   Wed, 27 Sep 2023 17:39:07 +0200
Message-Id: <20230927153907.159496-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927153907.159496-1-benjamin.gaignard@collabora.com>
References: <20230927153907.159496-1-benjamin.gaignard@collabora.com>
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

Add new test for DELETE_BUFS ioctl.
It create buffers and check if they could be removed from queue.
It also check that removing non existing buffer or a queued
buffer failed.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
version 2:
- Rework test has suggested by Hans
- Use V4L2_BUF_CAP_SUPPORTS_DELETE_BUFS capability flag
- Only test MMAP buffer type.

 include/linux/videodev2.h                   | 17 ++++
 utils/common/cv4l-helpers.h                 |  4 +
 utils/common/v4l-helpers.h                  | 17 ++++
 utils/v4l2-compliance/v4l2-compliance.cpp   |  1 +
 utils/v4l2-compliance/v4l2-compliance.h     |  1 +
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 91 +++++++++++++++++++++
 6 files changed, 131 insertions(+)

diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index ac5d2980..910163b4 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -987,6 +987,7 @@ struct v4l2_requestbuffers {
 #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
 #define V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS		(1 << 6)
 #define V4L2_BUF_CAP_SUPPORTS_SET_MAX_BUFS		(1 << 7)
+#define V4L2_BUF_CAP_SUPPORTS_DELETE_BUFS		(1 << 8)
 
 /**
  * struct v4l2_plane - plane info for multi-planar buffers
@@ -2548,6 +2549,21 @@ struct v4l2_create_buffers {
 	__u32			reserved[5];
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
@@ -2647,6 +2663,7 @@ struct v4l2_create_buffers {
 #define VIDIOC_DBG_G_CHIP_INFO  _IOWR('V', 102, struct v4l2_dbg_chip_info)
 
 #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_ext_ctrl)
+#define VIDIOC_DELETE_BUFS	_IOWR('V', 104, struct v4l2_delete_buffers)
 
 /* Reminder: when adding new ioctls please add support for them to
    drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index 5a515a13..10800ed2 100644
--- a/utils/common/cv4l-helpers.h
+++ b/utils/common/cv4l-helpers.h
@@ -760,6 +760,10 @@ public:
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
index 5853f753..ccac7d2e 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -1510,6 +1510,23 @@ static inline void *v4l_queue_g_dataptr(const struct v4l_queue *q, unsigned inde
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
index 56190448..54142168 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1449,6 +1449,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 		printf("Buffer ioctls%s:\n", suffix);
 		printf("\ttest VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: %s\n", ok(testReqBufs(&node)));
 		printf("\ttest CREATE_BUFS maximum buffers: %s\n", ok(testCreateBufsMax(&node)));
+		printf("\ttest VIDIOC_DELETE_BUFS: %s\n", ok(testDeleteBufs(&node)));
 		// Reopen after each streaming test to reset the streaming state
 		// in case of any errors in the preceeding test.
 		node.reopen();
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 4886e4c8..e45c4548 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -384,6 +384,7 @@ int testReadWrite(struct node *node);
 int testExpBuf(struct node *node);
 int testBlockingWait(struct node *node);
 int testCreateBufsMax(struct node *node);
+int testDeleteBufs(struct node *node);
 
 // 32-bit architecture, 32/64-bit time_t tests
 int testTime32_64(struct node *node);
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index b595d1d1..969d84c2 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -529,6 +529,97 @@ static int testCanSetSameTimings(struct node *node)
 	return 0;
 }
 
+int testDeleteBufs(struct node *node)
+{
+	int ret;
+	unsigned i;
+
+	node->reopen();
+
+	for (i = 1; i <= V4L2_BUF_TYPE_LAST; i++) {
+		struct v4l2_delete_buffers delbufs = { };
+
+		if (!(node->valid_buftypes & (1 << i)))
+			continue;
+
+		cv4l_queue q(i, V4L2_MEMORY_MMAP);
+
+		if (testSetupVbi(node, i))
+			continue;
+
+		q.init(i, V4L2_MEMORY_MMAP);
+		ret = q.create_bufs(node, 0);
+		fail_on_test_val(ret && ret != EINVAL, ret);
+		if (!(q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_DELETE_BUFS))
+			continue;
+
+		memset(&delbufs, 0xff, sizeof(delbufs));
+		delbufs.index = 0;
+		delbufs.count = 0;
+		delbufs.type = q.g_type();
+		fail_on_test(doioctl(node, VIDIOC_DELETE_BUFS, &delbufs));
+        	fail_on_test(check_0(delbufs.reserved, sizeof(delbufs.reserved)));
+
+		if (!ret) {
+			unsigned buffers;
+			buffer buf(q);
+
+			/* Create only 1 buffer */
+			fail_on_test(q.create_bufs(node, 1));
+			buffers = q.g_buffers();
+			fail_on_test(buffers == 0);
+			/* Delete buffer index 1 must fail */
+			fail_on_test(q.delete_bufs(node, 1, buffers) != EINVAL);
+			/* Delete buffer index 0 is valid */
+			fail_on_test(q.delete_bufs(node, 0, buffers));
+			/* Delete buffer index 0 again must fail */
+			fail_on_test(q.delete_bufs(node, 0, 1) != EINVAL);
+			/* Create 3 buffers indexes 0 to 2 */
+			fail_on_test(q.create_bufs(node, 3));
+			/* Delete them one by one */
+			fail_on_test(q.delete_bufs(node, 2, 1));
+			fail_on_test(q.delete_bufs(node, 0, 1));
+			fail_on_test(q.delete_bufs(node, 1, 1));
+			/* Delete buffer index 0 again must fail */
+			fail_on_test(q.delete_bufs(node, 0, 1) != EINVAL);
+
+			/* Create 5 buffers indexes 0 to 4*/
+			fail_on_test(q.create_bufs(node, 5));
+			/* Delete buffers index 1 and 2 */
+			fail_on_test(q.delete_bufs(node, 1, 2));
+			/* Add 3 more buffers should be indexes 5 to 7*/
+			fail_on_test(q.create_bufs(node, 3));
+			/* Query buffers: 
+			 * 1 and 2 have been deleted they must fail 
+			 * 5 to 7 must exist*/
+			fail_on_test(buf.querybuf(node, 1) != EINVAL);
+			fail_on_test(buf.querybuf(node, 2) != EINVAL);
+			fail_on_test(buf.querybuf(node, 5));
+			fail_on_test(buf.querybuf(node, 6));
+			fail_on_test(buf.querybuf(node, 7));
+			/* Delete existing buffer index 7 with bad type must fail */
+			memset(&delbufs, 0xff, sizeof(delbufs));
+			delbufs.index = 7;
+			delbufs.count = 1;
+			delbufs.type = 0;
+			fail_on_test(doioctl(node, VIDIOC_DELETE_BUFS, &delbufs) != EINVAL);
+
+			/* Delete crossing max allowed buffers boundary must fail */
+			fail_on_test(q.delete_bufs(node, q.g_max_buffers() - 2, 8) != EINVAL);
+		
+			/* Delete overflow must fail */
+			fail_on_test(q.delete_bufs(node, 3, 0xfffffff) != EINVAL);
+
+			/* Create 2 buffers, that must fill the hole */
+			fail_on_test(q.create_bufs(node, 2));
+			/* Remove all buffers */
+			fail_on_test(q.delete_bufs(node, 0, 8));
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

