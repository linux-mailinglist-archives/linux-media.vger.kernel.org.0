Return-Path: <linux-media+bounces-7092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD67087C068
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 16:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 925E92823A5
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 15:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5177440F;
	Thu, 14 Mar 2024 15:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="guSegRo5"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B730F71B3D
	for <linux-media@vger.kernel.org>; Thu, 14 Mar 2024 15:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710430462; cv=none; b=kLf41MlmBCV61FAyZSvM1ABnO6AdIY5Xb+uw8greBpcY8erYexuk450Bwt4CqMbmjZ6b5f6GjOSI7OnS2M+Ri36KNXuzT8NLnEajIlPFWRV6Zqb78tHo/ibTjETo9bijCwFZA9GXmEmf/hXUNfKOnHth1FQxk8XZ2lSlOi5GD2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710430462; c=relaxed/simple;
	bh=USfKTmREM6Q4+g/6bDEDrhpcf7Q/Th7A0a/gaZLvFoM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DfuTXdg+PvmZdrEbxW9mbKkJx7Vf33QIIjQp8AzhPOqT1WK5QTZScEg24CTb5+zTCzie5CC1/F5PnZr24fvRnMj63NvS15Fmc1bECax/D1SYpz80j/73M4nod1lt1tv9Vrr9EGXqH2XUdDT1/ncFr7K9lA0rRvcMfgFg3+++/F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=guSegRo5; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710430459;
	bh=USfKTmREM6Q4+g/6bDEDrhpcf7Q/Th7A0a/gaZLvFoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=guSegRo5lR/PeFGHKNFF0m3vPPdB/dCd9ac3zLv/h9T6qMiOASmrlXsyXzY+Dr+1K
	 A1Om1BBg+nj1Ps/OUzW2RzS/hkShEs+vBXuJ4MNLPFOBM7NI/uNTUIHFGGp17Xhq6F
	 1wV+CVj6jWJzh2sCtaWrKcFvhNxZpt6ezjNMMKQMrfi6ntPsb10eLt+yHafDvGPtkZ
	 ImRylpuxd0LJsfZOYKW3kABpF97X1F3gHTVn3gclL2aQdwAk8EuVf0CHMjugSuCyZZ
	 xQnldJqFc2WVQF/zrSHBsTq0Cc4h8kUji8/Cn/udS4rcGgHZFiGMs+LcT3MCXVK2Uf
	 SBxvxzDDBgiHw==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EF4C637820F7;
	Thu, 14 Mar 2024 15:34:18 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v9 2/2] v4l2-compliance: Add a test for REMOVE_BUFS ioctl
Date: Thu, 14 Mar 2024 16:34:15 +0100
Message-Id: <20240314153415.197534-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240314153415.197534-1-benjamin.gaignard@collabora.com>
References: <20240314153415.197534-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new test for REMOVE_BUFS ioctl.
It create buffers and check if they could be removed from queue.
It also check that removing non existing buffer or a queued
buffer failed.
Since using REMOVE_BUFS can create "holes" v4l_queue_querybufs()
function needs to be modify to do a range check between [from..from+count-1].

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
version 9:
- Add tests to check return values when count = 0.
- Add tests to check return values when attempt to remove
  again buffers.
- Call fail_on_test(q.reqbufs(node, 0)) at the end of the test.
- Do not print WARN if REMOVE_BUFS ioctl isn't supported
- Stop testing if CREATE_BUFS is supported.

 utils/common/cv4l-helpers.h                 |   4 +
 utils/common/v4l-helpers.h                  |  27 ++++-
 utils/v4l2-compliance/v4l2-compliance.cpp   |   1 +
 utils/v4l2-compliance/v4l2-compliance.h     |   1 +
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 118 ++++++++++++++++++++
 5 files changed, 146 insertions(+), 5 deletions(-)

diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index 7299d2fa..ec33da78 100644
--- a/utils/common/cv4l-helpers.h
+++ b/utils/common/cv4l-helpers.h
@@ -765,6 +765,10 @@ public:
 	{
 		return v4l_queue_reqbufs(fd->g_v4l_fd(), this, count, flags);
 	}
+	int remove_bufs(cv4l_fd *fd, unsigned index = 0, unsigned count = 0)
+	{
+		return v4l_queue_remove_bufs(fd->g_v4l_fd(), this, index, count);
+	}
 	bool has_create_bufs(cv4l_fd *fd) const
 	{
 		return v4l_queue_has_create_bufs(fd->g_v4l_fd(), this);
diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
index 5ce3dabc..437a6844 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -1547,12 +1547,29 @@ static inline void *v4l_queue_g_dataptr(const struct v4l_queue *q, unsigned inde
 	return v4l_queue_g_mmapping(q, index, plane);
 }
 
-static inline int v4l_queue_querybufs(struct v4l_fd *f, struct v4l_queue *q, unsigned from)
+static inline int v4l_queue_remove_bufs(struct v4l_fd *f, struct v4l_queue *q, unsigned index, unsigned count)
 {
-	unsigned b, p;
+	struct v4l2_remove_buffers removebufs;
 	int ret;
 
-	for (b = from; b < v4l_queue_g_buffers(q); b++) {
+	memset(&removebufs, 0, sizeof(removebufs));
+	removebufs.type = q->type;
+	removebufs.index = index;
+	removebufs.count = count;
+
+	ret = v4l_ioctl(f, VIDIOC_REMOVE_BUFS, &removebufs);
+	if (!ret)
+		q->buffers -= removebufs.count;
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
@@ -1605,7 +1622,7 @@ static inline int v4l_queue_reqbufs(struct v4l_fd *f,
 			}
 		}
 	}
-	return v4l_queue_querybufs(f, q, 0);
+	return v4l_queue_querybufs(f, q, 0, reqbufs.count);
 }
 
 static inline bool v4l_queue_has_create_bufs(struct v4l_fd *f, const struct v4l_queue *q)
@@ -1649,7 +1666,7 @@ static inline int v4l_queue_create_bufs(struct v4l_fd *f,
 		}
 	}
 	q->buffers += createbufs.count;
-	return v4l_queue_querybufs(f, q, q->buffers - createbufs.count);
+	return v4l_queue_querybufs(f, q, createbufs.index, createbufs.count);
 }
 
 static inline int v4l_queue_mmap_bufs(struct v4l_fd *f,
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 2f7a5058..c6a685eb 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1466,6 +1466,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 		printf("Buffer ioctls%s:\n", suffix);
 		printf("\ttest VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: %s\n", ok(testReqBufs(&node)));
 		printf("\ttest CREATE_BUFS maximum buffers: %s\n", ok(testCreateBufsMax(&node)));
+		printf("\ttest VIDIOC_REMOVE_BUFS: %s\n", ok(testRemoveBufs(&node)));
 		// Reopen after each streaming test to reset the streaming state
 		// in case of any errors in the preceeding test.
 		node.reopen();
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 0cfc9a37..b6e342f3 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -385,6 +385,7 @@ int testReadWrite(struct node *node);
 int testExpBuf(struct node *node);
 int testBlockingWait(struct node *node);
 int testCreateBufsMax(struct node *node);
+int testRemoveBufs(struct node *node);
 
 // 32-bit architecture, 32/64-bit time_t tests
 int testTime32_64(struct node *node);
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 922b99b5..1d39bd63 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -529,6 +529,124 @@ static int testCanSetSameTimings(struct node *node)
 	return 0;
 }
 
+int testRemoveBufs(struct node *node)
+{
+	int ret;
+	unsigned i;
+
+	node->reopen();
+
+	for (i = 1; i <= V4L2_BUF_TYPE_LAST; i++) {
+		struct v4l2_remove_buffers removebufs = { };
+		unsigned buffers;
+
+		if (!(node->valid_buftypes & (1 << i)))
+			continue;
+
+		cv4l_queue q(i, V4L2_MEMORY_MMAP);
+
+		if (testSetupVbi(node, i))
+			continue;
+		ret = q.remove_bufs(node, 0, 0);
+		if (ret == ENOTTY)
+			continue;
+
+		q.init(i, V4L2_MEMORY_MMAP);
+		ret = q.create_bufs(node, 0);
+
+		memset(&removebufs, 0xff, sizeof(removebufs));
+		removebufs.index = 0;
+		removebufs.count = 0;
+		removebufs.type = q.g_type();
+		fail_on_test(doioctl(node, VIDIOC_REMOVE_BUFS, &removebufs));
+		fail_on_test(check_0(removebufs.reserved, sizeof(removebufs.reserved)));
+
+		buffer buf(i);
+
+		/* Create only 1 buffer */
+		fail_on_test(q.create_bufs(node, 1));
+		buffers = q.g_buffers();
+		fail_on_test(buffers != 1);
+		/* Removing buffer index 1 must fail */
+		fail_on_test(q.remove_bufs(node, 1, buffers) != EINVAL);
+		/* Removing buffer index 0 is valid */
+		fail_on_test(q.remove_bufs(node, 0, buffers));
+		/* Removing buffer index 0 again must fail */
+		fail_on_test(q.remove_bufs(node, 0, 1) != EINVAL);
+		/* Create 3 buffers indexes 0 to 2 */
+		fail_on_test(q.create_bufs(node, 3));
+		/* Remove them one by one */
+		fail_on_test(q.remove_bufs(node, 2, 1));
+		fail_on_test(q.remove_bufs(node, 0, 1));
+		fail_on_test(q.remove_bufs(node, 1, 1));
+		/* Removing buffer index 0 again must fail */
+		fail_on_test(q.remove_bufs(node, 0, 1) != EINVAL);
+
+		/* Create 4 buffers indexes 0 to 3 */
+		fail_on_test(q.create_bufs(node, 4));
+		/* Remove buffers index 1 and 2 */
+		fail_on_test(q.remove_bufs(node, 1, 2));
+		/* Add 3 more buffers should be indexes 4 to 6 */
+		fail_on_test(q.create_bufs(node, 3));
+		/* Query buffers:
+		 * 1 and 2 have been removed they must fail
+		 * 0 and 3 to 6 must exist*/
+		fail_on_test(buf.querybuf(node, 0));
+		fail_on_test(buf.querybuf(node, 1) != EINVAL);
+		fail_on_test(buf.querybuf(node, 2) != EINVAL);
+		fail_on_test(buf.querybuf(node, 3));
+		fail_on_test(buf.querybuf(node, 4));
+		fail_on_test(buf.querybuf(node, 5));
+		fail_on_test(buf.querybuf(node, 6));
+
+		/* Remove existing buffer index 6 with bad type must fail */
+		memset(&removebufs, 0xff, sizeof(removebufs));
+		removebufs.index = 6;
+		removebufs.count = 1;
+		removebufs.type = 0;
+		fail_on_test(doioctl(node, VIDIOC_REMOVE_BUFS, &removebufs) != EINVAL);
+
+		/* Remove existing buffer index 6 with bad type and count == 0
+		 * must fail */
+		memset(&removebufs, 0xff, sizeof(removebufs));
+		removebufs.index = 6;
+		removebufs.count = 0;
+		removebufs.type = 0;
+		fail_on_test(doioctl(node, VIDIOC_REMOVE_BUFS, &removebufs) != EINVAL);
+
+		/* Remove with count == 0 must always return 0 */
+		fail_on_test(q.remove_bufs(node, 0, 0));
+		fail_on_test(q.remove_bufs(node, 1, 0));
+		fail_on_test(q.remove_bufs(node, 6, 0));
+		fail_on_test(q.remove_bufs(node, 7, 0));
+		fail_on_test(q.remove_bufs(node, 0xffffffff, 0));
+		
+		/* Remove crossing max allowed buffers boundary must fail */
+		fail_on_test(q.remove_bufs(node, q.g_max_num_buffers() - 2, 7) != EINVAL);
+
+		/* Remove overflow must fail */
+		fail_on_test(q.remove_bufs(node, 3, 0xfffffff) != EINVAL);
+
+		/* Remove 2 buffers on index 2 when index 2 is free must fail */
+		fail_on_test(q.remove_bufs(node, 2, 2) != EINVAL);
+
+		/* Remove 2 buffers on index 0 when index 1 is free must fail */
+		fail_on_test(q.remove_bufs(node, 0, 2) != EINVAL);
+
+		/* Remove 2 buffers on index 1 when index 1 and 2 are free must fail */
+		fail_on_test(q.remove_bufs(node, 1, 2) != EINVAL);
+
+		/* Create 2 buffers, that must fill the hole */
+		fail_on_test(q.create_bufs(node, 2));
+		/* Remove all buffers */
+		fail_on_test(q.remove_bufs(node, 0, 7));
+
+		fail_on_test(q.reqbufs(node, 0));
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


