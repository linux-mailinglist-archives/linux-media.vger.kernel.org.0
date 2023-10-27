Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A39797D928F
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 10:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345558AbjJ0Irs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 04:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345406AbjJ0Irp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 04:47:45 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACD6E1BE
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 01:47:42 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:dbc0:3460:d466:3213])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 45B9E6607335;
        Fri, 27 Oct 2023 09:47:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1698396461;
        bh=JUI6Pwf+nusN9d5H1K+f90YSRzjfogTpTJOW1hqNQi8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bk2v0H0HmMauPBo7JfXUjNaiNffwuBCm1j0MtK8nAQii08HHJzVHKqIDLyQEQIU6z
         bSGZliqNVo7/DINA7ceQ5VnWKF9bkrv4lnTTWZW6sd9Of7SpGIFs5fwWQO6WD7PjlV
         4VJmj6LsB5Z1nP+afDuWO+3Pe3vlCt8eP5Sx+iNIQeoBwZyT3xqWAlVI6mWpbOJbYP
         BfG6INW+4PXlENZSv9MHzc2Rf3DbwQZ3hAeuovz1kTsiE4hZU3gPvLY2E+eO1byOm4
         0q2KF6dZrOka2OHF8ENS5OWvzZ/4aMcUbdbFGenSNUvS4p9KCWQMZyCZbTP3IzV09m
         diMPV4WNFPQ6Q==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v4 4/4] v4l2-compliance: Add a test for DELETE_BUFS ioctl
Date:   Fri, 27 Oct 2023 10:47:32 +0200
Message-Id: <20231027084732.17528-5-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231027084732.17528-1-benjamin.gaignard@collabora.com>
References: <20231027084732.17528-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
 utils/common/cv4l-helpers.h                 |  4 +
 utils/common/v4l-helpers.h                  | 17 ++++
 utils/v4l2-compliance/v4l2-compliance.cpp   |  1 +
 utils/v4l2-compliance/v4l2-compliance.h     |  1 +
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 91 +++++++++++++++++++++
 5 files changed, 114 insertions(+)

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
index 550ec377..81857b29 100644
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
index a165ef5a..c1e519ea 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1454,6 +1454,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 		printf("Buffer ioctls%s:\n", suffix);
 		printf("\ttest VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: %s\n", ok(testReqBufs(&node)));
 		printf("\ttest CREATE_BUFS maximum buffers: %s\n", ok(testCreateBufsMax(&node)));
+		printf("\ttest VIDIOC_DELETE_BUFS: %s\n", ok(testDeleteBufs(&node)));
 		// Reopen after each streaming test to reset the streaming state
 		// in case of any errors in the preceeding test.
 		node.reopen();
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 4f9aa17e..9ec07494 100644
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
index 02ea498f..54fb66d9 100644
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

