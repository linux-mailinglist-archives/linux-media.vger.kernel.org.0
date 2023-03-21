Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 913E26C2F05
	for <lists+linux-media@lfdr.de>; Tue, 21 Mar 2023 11:32:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbjCUKcZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Mar 2023 06:32:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjCUKcY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Mar 2023 06:32:24 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6073446144
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 03:31:35 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:f5ef:1040:e3c1:3d00])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id F1DE466030D5;
        Tue, 21 Mar 2023 10:31:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679394662;
        bh=EYzno04HiAu8lzT1rUMW9PC5YUU+LpqI9l44Nt+thAw=;
        h=From:To:Cc:Subject:Date:From;
        b=hqXM3fOqk8iMqaV12hCWxYAf0gV4VHxR/7+F+y97/HIDq0WbMgUcRayk64+smtVJN
         PMsc0qa8R6Dmrh1Ha7BS3Sf28wrThFph5HdtvFa6LjznpU3U1AicbYY+jE5ErATk6P
         08TNC9WmKxJh/hqA9deK8JFqhD5EmVJTnLrBG+RfDrBGFS9CvbwvEldfgKy+KI8JKv
         q6PrCEDlLdAbGsOekHhaGhUC/Qg4cj/5m6ACW5TqlK3hkAPEhiNafC1UmYcWWgh5db
         LHIqRVvp1kpORX6+/1OxCNs492Mj69uC3H5hJAAhKt2Gr7SeXqIH1RqCQST5xiYHLz
         iHvlcKVG1ktUA==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, jerbel@kernel.org
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] v4l2-compliance: Add a test for DELETE_BUF ioctl
Date:   Tue, 21 Mar 2023 11:30:59 +0100
Message-Id: <20230321103059.349337-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new test for DELETE_BUF ioctl.
It create a buffer and check if it could be remove from queue.
It also check that removing non existing buffer or a queued
buffer failed.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 include/linux/videodev2.h                   |   1 +
 utils/common/cv4l-helpers.h                 |   4 +
 utils/common/v4l-helpers.h                  |  13 ++
 utils/v4l2-compliance/v4l2-compliance.cpp   |   1 +
 utils/v4l2-compliance/v4l2-compliance.h     |   1 +
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 129 ++++++++++++++++++++
 6 files changed, 149 insertions(+)

diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index 69f8ac85..5d68a84b 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -2623,6 +2623,7 @@ struct v4l2_create_buffers {
 #define VIDIOC_QUERY_DV_TIMINGS  _IOR('V', 99, struct v4l2_dv_timings)
 #define VIDIOC_DV_TIMINGS_CAP   _IOWR('V', 100, struct v4l2_dv_timings_cap)
 #define VIDIOC_ENUM_FREQ_BANDS	_IOWR('V', 101, struct v4l2_frequency_band)
+#define VIDIOC_DELETE_BUF	_IOWR('V', 102, struct v4l2_buffer)
 
 /*
  * Experimental, meant for debugging, testing and internal use.
diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index 3cee372b..d2a5ab28 100644
--- a/utils/common/cv4l-helpers.h
+++ b/utils/common/cv4l-helpers.h
@@ -758,6 +758,10 @@ public:
 	{
 		return v4l_queue_reqbufs(fd->g_v4l_fd(), this, count, flags);
 	}
+	int delete_buf(cv4l_fd *fd, unsigned index = 0)
+	{
+		return v4l_queue_delete_buf(fd->g_v4l_fd(), this, index);
+	}
 	bool has_create_bufs(cv4l_fd *fd) const
 	{
 		return v4l_queue_has_create_bufs(fd->g_v4l_fd(), this);
diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
index c09cd987..0936fddc 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -1388,6 +1388,11 @@ static inline int v4l_buffer_prepare_buf(struct v4l_fd *f, struct v4l_buffer *bu
 	return v4l_ioctl(f, VIDIOC_PREPARE_BUF, &buf->buf);
 }
 
+static inline int v4l_buffer_delete_buf(struct v4l_fd *f, struct v4l_buffer *buf)
+{
+	return v4l_ioctl(f, VIDIOC_DELETE_BUF, &buf->buf);
+}
+
 static inline int v4l_buffer_qbuf(struct v4l_fd *f, struct v4l_buffer *buf)
 {
 	return v4l_ioctl(f, VIDIOC_QBUF, &buf->buf);
@@ -1490,6 +1495,14 @@ static inline void *v4l_queue_g_dataptr(const struct v4l_queue *q, unsigned inde
 	return v4l_queue_g_mmapping(q, index, plane);
 }
 
+static inline int v4l_queue_delete_buf(struct v4l_fd *f, struct v4l_queue *q, unsigned index)
+{
+	struct v4l_buffer buf;
+
+	v4l_buffer_init(&buf, v4l_queue_g_type(q), v4l_queue_g_memory(q), index);
+	return v4l_ioctl(f, VIDIOC_DELETE_BUF, &buf.buf);
+}
+
 static inline int v4l_queue_querybufs(struct v4l_fd *f, struct v4l_queue *q, unsigned from)
 {
 	unsigned b, p;
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 8aebae2e..ba7d00b6 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1357,6 +1357,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 
 		printf("Buffer ioctls%s:\n", suffix);
 		printf("\ttest VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: %s\n", ok(testReqBufs(&node)));
+		printf("\ttest VIDIOC_DELETE_BUF: %s\n", ok(testDeleteBuf(&node)));
 		// Reopen after each streaming test to reset the streaming state
 		// in case of any errors in the preceeding test.
 		node.reopen();
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 020e56a9..d93f4a76 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -377,6 +377,7 @@ int testReqBufs(struct node *node);
 int testReadWrite(struct node *node);
 int testExpBuf(struct node *node);
 int testBlockingWait(struct node *node);
+int testDeleteBuf(struct node *node);
 
 // 32-bit architecture, 32/64-bit time_t tests
 int testTime32_64(struct node *node);
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index a097a0ff..3c669e15 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -529,6 +529,135 @@ static int testCanSetSameTimings(struct node *node)
 	return 0;
 }
 
+int testDeleteBuf(struct node *node)
+{
+	bool can_stream = node->g_caps() & V4L2_CAP_STREAMING;
+	bool mmap_valid;
+	bool userptr_valid;
+	bool dmabuf_valid;
+	int ret;
+	unsigned i;
+
+	node->reopen();
+
+	cv4l_queue q(0, 0);
+
+	ret = q.reqbufs(node, 0);
+	if (ret == ENOTTY) {
+		warn("request buf not supported ret %d\n", ret);
+		fail_on_test(can_stream);
+		return ret;
+	}
+
+	ret = q.delete_buf(node, 0);
+	if (ret == ENOTTY) {
+		warn("VIDIOC_DELETE_BUF not supported ret %d\n", ret);
+		return ret;
+	}
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
+		q.init(0, 0);
+		fail_on_test(q.reqbufs(node, i) != EINVAL);
+		q.init(i, V4L2_MEMORY_MMAP);
+		ret = q.reqbufs(node, 0);
+		fail_on_test_val(ret && ret != EINVAL, ret);
+		mmap_valid = !ret;
+
+		q.init(i, V4L2_MEMORY_USERPTR);
+		ret = q.reqbufs(node, 0);
+		fail_on_test_val(ret && ret != EINVAL, ret);
+		userptr_valid = !ret;
+		fail_on_test(!mmap_valid && userptr_valid);
+
+		q.init(i, V4L2_MEMORY_DMABUF);
+		ret = q.reqbufs(node, 0);
+		fail_on_test_val(ret && ret != EINVAL, ret);
+		dmabuf_valid = !ret;
+		fail_on_test(!mmap_valid && dmabuf_valid);
+
+		if (mmap_valid) {
+			q.init(i, V4L2_MEMORY_MMAP);
+			fail_on_test(q.reqbufs(node, 1));
+			fail_on_test(q.g_buffers() == 0);
+			fail_on_test(q.delete_buf(node, 1) != EINVAL);
+			fail_on_test(q.delete_buf(node, 0));
+			fail_on_test(q.delete_buf(node, 0) != EINVAL);
+			fail_on_test(q.reqbufs(node, 3));
+			fail_on_test(q.delete_buf(node, 2));
+			fail_on_test(q.delete_buf(node, 0));
+			fail_on_test(q.delete_buf(node, 1));
+			fail_on_test(q.delete_buf(node, 0) != EINVAL);
+			fail_on_test(q.reqbufs(node, 2));
+			for (unsigned j = 0; j < q.g_buffers(); j++) {
+				buffer buf(q);
+
+				fail_on_test(buf.querybuf(node, j));
+				ret = buf.qbuf(node);
+				if (!ret)
+					fail_on_test(q.delete_buf(node, j) != EINVAL);
+			}
+		}
+
+		if (userptr_valid) {
+			q.init(i, V4L2_MEMORY_USERPTR);
+			fail_on_test(q.reqbufs(node, 1));
+			fail_on_test(q.g_buffers() == 0);
+			fail_on_test(q.delete_buf(node, 1) != EINVAL);
+			fail_on_test(q.delete_buf(node, 0));
+			fail_on_test(q.delete_buf(node, 0) != EINVAL);
+			fail_on_test(q.reqbufs(node, 3));
+			fail_on_test(q.delete_buf(node, 2));
+			fail_on_test(q.delete_buf(node, 0));
+			fail_on_test(q.delete_buf(node, 1));
+			fail_on_test(q.delete_buf(node, 0) != EINVAL);
+			fail_on_test(q.reqbufs(node, 2));
+			for (unsigned j = 0; j < q.g_buffers(); j++) {
+				buffer buf(q);
+
+				fail_on_test(buf.querybuf(node, j));
+				ret = buf.qbuf(node);
+				if (!ret)
+					fail_on_test(q.delete_buf(node, j) != EINVAL);
+			}
+		}
+
+		if (dmabuf_valid) {
+			q.init(i, V4L2_MEMORY_DMABUF);
+			fail_on_test(q.reqbufs(node, 1));
+			fail_on_test(q.g_buffers() == 0);
+			fail_on_test(q.delete_buf(node, 1) != EINVAL);
+			fail_on_test(q.delete_buf(node, 0));
+			fail_on_test(q.delete_buf(node, 0) != EINVAL);
+			fail_on_test(q.reqbufs(node, 3));
+			fail_on_test(q.delete_buf(node, 2));
+			fail_on_test(q.delete_buf(node, 0));
+			fail_on_test(q.delete_buf(node, 1));
+			fail_on_test(q.delete_buf(node, 0) != EINVAL);
+			fail_on_test(q.reqbufs(node, 2));
+			for (unsigned j = 0; j < q.g_buffers(); j++) {
+				buffer buf(q);
+
+				fail_on_test(buf.querybuf(node, j));
+				ret = buf.qbuf(node);
+				if (!ret)
+					fail_on_test(q.delete_buf(node, j) != EINVAL);
+			}
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
2.34.1

