Return-Path: <linux-media+bounces-4219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 506F383D916
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 12:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDC081F2697D
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 11:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51ED14013;
	Fri, 26 Jan 2024 11:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="0tIB9e8t"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B335114015
	for <linux-media@vger.kernel.org>; Fri, 26 Jan 2024 11:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706267531; cv=none; b=CpHIYTCOOPYuujz9frKVYldetHtsEC4QM71QzhY2z7JH8aLWYljElRRuTjdejrqlsCk2Sn05NVFww2wf6lZJaBfkYLr53erslc1tP1JiHA+OrKra/+OPUsix/mp0QlAEdQeIML4ySo3F2teBrxRcUKaouVIK4SKx9d8jJQ34GQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706267531; c=relaxed/simple;
	bh=GLFVUrp6Wq88tPy0tvOQ6SmC0kl7pWsccGzKVMD111Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DEHEMAvnfcziOGl0elQ3V/D0zySehP0CaiHouVsp2K0L4zzSGXWEtDsLSkfjxD4ngNoueGMUYBXljcECVX3itDAwaCIs326l70+dkeLxy4fpDMZXxvNqbkQSsejtGq/LKlzcCUY/YFp3AYtJXem00ycbZ5y66ufY7Xb5yzvJjuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=0tIB9e8t; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706267528;
	bh=GLFVUrp6Wq88tPy0tvOQ6SmC0kl7pWsccGzKVMD111Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=0tIB9e8tKy2A+sJdFrCLlX7atf5njS61X+06jP58paAIVBLDdL0RwcRhNFyltoaH5
	 zu0My+zKsZd2jK1diQOxgl/xsZLi5vWoFEWtI/MyICMPE3K3tCYhNRvHb235IsjrNN
	 GRs7bOHDY/M7QkVh5nqfGtZRgNNvJ0mj1nmDqnZrdp0Xk4CIStA/cVR5bUTF/wT5ZV
	 vmdfqIugv2w4czlZTAySAnBlW78VuysXEf2h3UQVmpf/xetnmx5GQm4TmsN5E2Hf1a
	 LwwIFziT9l/t9iWxGGQxgNCXuQSvUD/TbMx1fRnOfWJK2XteREiFDWlK2BD8Z3qMvm
	 rTElw3lXfUzTg==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 029313782075;
	Fri, 26 Jan 2024 11:12:07 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v7 2/2] v4l2-compliance: Add a test for DELETE_BUFS ioctl
Date: Fri, 26 Jan 2024 12:12:05 +0100
Message-Id: <20240126111205.136630-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240126111205.136630-1-benjamin.gaignard@collabora.com>
References: <20240126111205.136630-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new test for DELETE_BUFS ioctl.
It create buffers and check if they could be removed from queue.
It also check that removing non existing buffer or a queued
buffer failed.
Since using DELETE_BUFS can create "holes" v4l_queue_querybufs()
function needs to be modify to do a range check between [from..from+count-1].

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
version 7:
- Remove V4L2_BUF_CAP_SUPPORTS_DELETE_BUFS to be aligned with
  the v18 of the kernel patches
- v4l_queue_querybufs() take care of a range of buffers.

 utils/common/cv4l-helpers.h                 |  4 +
 utils/common/v4l-helpers.h                  | 27 ++++--
 utils/v4l2-compliance/v4l2-compliance.cpp   |  1 +
 utils/v4l2-compliance/v4l2-compliance.h     |  1 +
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 99 +++++++++++++++++++++
 5 files changed, 127 insertions(+), 5 deletions(-)

diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index 77c6517a..43dd51a4 100644
--- a/utils/common/cv4l-helpers.h
+++ b/utils/common/cv4l-helpers.h
@@ -764,6 +764,10 @@ public:
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
index 7387b621..d3c5857b 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -1513,12 +1513,29 @@ static inline void *v4l_queue_g_dataptr(const struct v4l_queue *q, unsigned inde
 	return v4l_queue_g_mmapping(q, index, plane);
 }
 
-static inline int v4l_queue_querybufs(struct v4l_fd *f, struct v4l_queue *q, unsigned from)
+static inline int v4l_queue_delete_bufs(struct v4l_fd *f, struct v4l_queue *q, unsigned index, unsigned count)
 {
-	unsigned b, p;
+	struct v4l2_delete_buffers deletebufs;
 	int ret;
 
-	for (b = from; b < v4l_queue_g_buffers(q); b++) {
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
+static inline int v4l_queue_querybufs(struct v4l_fd *f, struct v4l_queue *q, unsigned from, unsigned count)
+{
+	unsigned b, p, max = from + count;
+	int ret;
+
+	for (b = from; b < max; b++) {
 		struct v4l_buffer buf;
 
 		v4l_buffer_init(&buf, v4l_queue_g_type(q), v4l_queue_g_memory(q), b);
@@ -1556,7 +1573,7 @@ static inline int v4l_queue_reqbufs(struct v4l_fd *f,
 		return ret;
 	q->buffers = reqbufs.count;
 	q->capabilities = reqbufs.capabilities;
-	return v4l_queue_querybufs(f, q, 0);
+	return v4l_queue_querybufs(f, q, 0, reqbufs.count);
 }
 
 static inline bool v4l_queue_has_create_bufs(struct v4l_fd *f, const struct v4l_queue *q)
@@ -1596,7 +1613,7 @@ static inline int v4l_queue_create_bufs(struct v4l_fd *f,
 	if (q->capabilities & V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS)
 		q->max_num_buffers = createbufs.max_num_buffers;
 	q->buffers += createbufs.count;
-	return v4l_queue_querybufs(f, q, q->buffers - createbufs.count);
+	return v4l_queue_querybufs(f, q, createbufs.index, createbufs.count);
 }
 
 static inline int v4l_queue_mmap_bufs(struct v4l_fd *f,
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 2f7a5058..4022e0b8 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1466,6 +1466,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 		printf("Buffer ioctls%s:\n", suffix);
 		printf("\ttest VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: %s\n", ok(testReqBufs(&node)));
 		printf("\ttest CREATE_BUFS maximum buffers: %s\n", ok(testCreateBufsMax(&node)));
+		printf("\ttest VIDIOC_DELETE_BUFS: %s\n", ok(testDeleteBufs(&node)));
 		// Reopen after each streaming test to reset the streaming state
 		// in case of any errors in the preceeding test.
 		node.reopen();
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 0cfc9a37..1a332070 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -385,6 +385,7 @@ int testReadWrite(struct node *node);
 int testExpBuf(struct node *node);
 int testBlockingWait(struct node *node);
 int testCreateBufsMax(struct node *node);
+int testDeleteBufs(struct node *node);
 
 // 32-bit architecture, 32/64-bit time_t tests
 int testTime32_64(struct node *node);
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 922b99b5..fbc729d0 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -529,6 +529,105 @@ static int testCanSetSameTimings(struct node *node)
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
+		ret = q.delete_bufs(node, 0, 0);
+		if (ret == ENOTTY) {
+			warn("VIDIOC_DELETE_BUFS not supported\n");
+			continue;
+		}
+
+		q.init(i, V4L2_MEMORY_MMAP);
+		ret = q.create_bufs(node, 0);
+		fail_on_test_val(ret && ret != EINVAL, ret);
+
+		memset(&delbufs, 0xff, sizeof(delbufs));
+		delbufs.index = 0;
+		delbufs.count = 0;
+		delbufs.type = q.g_type();
+		fail_on_test(doioctl(node, VIDIOC_DELETE_BUFS, &delbufs));
+		fail_on_test(check_0(delbufs.reserved, sizeof(delbufs.reserved)));
+
+		if (!ret) {
+			unsigned buffers;
+			buffer buf(i);
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
+			/* for the next test the queue needs to be able to allocate 7 buffers */
+			if (q.g_max_num_buffers() < 7)
+				continue;
+
+			/* Create 4 buffers indexes 0 to 3 */
+			fail_on_test(q.create_bufs(node, 4));
+			/* Delete buffers index 1 and 2 */
+			fail_on_test(q.delete_bufs(node, 1, 2));
+			/* Add 3 more buffers should be indexes 4 to 6 */
+			fail_on_test(q.create_bufs(node, 3));
+			/* Query buffers:
+			 * 1 and 2 have been deleted they must fail
+			 * 0 and 4 to 6 must exist*/
+			fail_on_test(buf.querybuf(node, 0));
+			fail_on_test(buf.querybuf(node, 1) != EINVAL);
+			fail_on_test(buf.querybuf(node, 2) != EINVAL);
+			fail_on_test(buf.querybuf(node, 4));
+			fail_on_test(buf.querybuf(node, 5));
+			fail_on_test(buf.querybuf(node, 6));
+			/* Delete existing buffer index 6 with bad type must fail */
+			memset(&delbufs, 0xff, sizeof(delbufs));
+			delbufs.index = 6;
+			delbufs.count = 1;
+			delbufs.type = 0;
+			fail_on_test(doioctl(node, VIDIOC_DELETE_BUFS, &delbufs) != EINVAL);
+
+			/* Delete crossing max allowed buffers boundary must fail */
+			fail_on_test(q.delete_bufs(node, q.g_max_num_buffers() - 2, 7) != EINVAL);
+
+			/* Delete overflow must fail */
+			fail_on_test(q.delete_bufs(node, 3, 0xfffffff) != EINVAL);
+
+			/* Create 2 buffers, that must fill the hole */
+			fail_on_test(q.create_bufs(node, 2));
+			/* Remove all buffers */
+			fail_on_test(q.delete_bufs(node, 0, 7));
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
2.40.1


