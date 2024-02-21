Return-Path: <linux-media+bounces-5584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEAC85E233
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 16:58:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F0E91F25721
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 15:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B4E81735;
	Wed, 21 Feb 2024 15:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="A9IAAv75"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B955E80C03
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 15:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708530957; cv=none; b=jVq+yASNoZKVieTFepoklc0zQrf/hw5a8tYx5M49Q8Rs9g4wDsgfMDfUqArdo9b6GbmNEtrbJ06CYI3gq93g3o9NohKD+Td9r4MLJ+xGy6gbtl8wTpNehY6cw34h1RJhFjRq30OviLJipXqMwyrqRQK8C1nvOvmiu6xEsWxVBrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708530957; c=relaxed/simple;
	bh=BnnFAkf/Va0lsgcV9rr6+8lSB5KDcemRIbPw6F4gDTg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RQv3+rzZMrNYtmdziirS0uMbwdux+/6WA5mgBzrGSipGp7SeweuQRYYbE0hqRhctsHkoxCxP8K0NRwka9pih+6fguDdXxUev4KViqptF4WFxbALzHJHSuncrkBL8HmZxT3nQrJb5QDJhAUx2LV8Q5xwlFv52sG7E0dldeJ3fRvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=A9IAAv75; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708530954;
	bh=BnnFAkf/Va0lsgcV9rr6+8lSB5KDcemRIbPw6F4gDTg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A9IAAv75X7gV9H4ACYrExZD8fI8s0eyuyQcri+A4U2/tpq9hjcAIYWSKvBFb7ZGmw
	 2gDUXWzMOMdMWpvZgQ9kHmrk9FpBXHC4+gZ5iLLWyOnq87CkrbSgKo7PwIny+cw19z
	 S/fXHq6+Ti2krUUL7B342IlgxmY/Mr+XtjLS8tMP+Fp2q3LWjCdy8eg4NjXv41BAnA
	 RGO0w5QbMeZhnqi0UUk/7s1gS6B+kaCOMiuQC3WmHNbsPOJBDp4XPcTMTN449Uwl/l
	 VVHO64mHIit2ibkonIrIIBvakY4U91pXGkF69/X3at88WzXjf5ZcairDFJ7o9mpnV2
	 RFGE3sS2Z/rWg==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EB2523781116;
	Wed, 21 Feb 2024 15:55:53 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v8 2/2] v4l2-compliance: Add a test for REMOVE_BUFS ioctl
Date: Wed, 21 Feb 2024 16:55:51 +0100
Message-Id: <20240221155551.100156-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240221155551.100156-1-benjamin.gaignard@collabora.com>
References: <20240221155551.100156-1-benjamin.gaignard@collabora.com>
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
 utils/common/cv4l-helpers.h                 |  4 +
 utils/common/v4l-helpers.h                  | 27 ++++--
 utils/v4l2-compliance/v4l2-compliance.cpp   |  1 +
 utils/v4l2-compliance/v4l2-compliance.h     |  1 +
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 99 +++++++++++++++++++++
 5 files changed, 127 insertions(+), 5 deletions(-)

diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index 77c6517a..afe8d469 100644
--- a/utils/common/cv4l-helpers.h
+++ b/utils/common/cv4l-helpers.h
@@ -764,6 +764,10 @@ public:
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
index 7387b621..1240c23f 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -1513,12 +1513,29 @@ static inline void *v4l_queue_g_dataptr(const struct v4l_queue *q, unsigned inde
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
index 922b99b5..f71a3c0e 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -529,6 +529,105 @@ static int testCanSetSameTimings(struct node *node)
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
+
+		if (!(node->valid_buftypes & (1 << i)))
+			continue;
+
+		cv4l_queue q(i, V4L2_MEMORY_MMAP);
+
+		if (testSetupVbi(node, i))
+			continue;
+		ret = q.remove_bufs(node, 0, 0);
+		if (ret == ENOTTY) {
+			warn("VIDIOC_REMOVE_BUFS not supported\n");
+			continue;
+		}
+
+		q.init(i, V4L2_MEMORY_MMAP);
+		ret = q.create_bufs(node, 0);
+		fail_on_test_val(ret && ret != EINVAL, ret);
+
+		memset(&removebufs, 0xff, sizeof(removebufs));
+		removebufs.index = 0;
+		removebufs.count = 0;
+		removebufs.type = q.g_type();
+		fail_on_test(doioctl(node, VIDIOC_REMOVE_BUFS, &removebufs));
+		fail_on_test(check_0(removebufs.reserved, sizeof(removebufs.reserved)));
+
+		if (!ret) {
+			unsigned buffers;
+			buffer buf(i);
+
+			/* Create only 1 buffer */
+			fail_on_test(q.create_bufs(node, 1));
+			buffers = q.g_buffers();
+			fail_on_test(buffers == 0);
+			/* Removing buffer index 1 must fail */
+			fail_on_test(q.remove_bufs(node, 1, buffers) != EINVAL);
+			/* Removing buffer index 0 is valid */
+			fail_on_test(q.remove_bufs(node, 0, buffers));
+			/* Removing buffer index 0 again must fail */
+			fail_on_test(q.remove_bufs(node, 0, 1) != EINVAL);
+			/* Create 3 buffers indexes 0 to 2 */
+			fail_on_test(q.create_bufs(node, 3));
+			/* Remove them one by one */
+			fail_on_test(q.remove_bufs(node, 2, 1));
+			fail_on_test(q.remove_bufs(node, 0, 1));
+			fail_on_test(q.remove_bufs(node, 1, 1));
+			/* Removing buffer index 0 again must fail */
+			fail_on_test(q.remove_bufs(node, 0, 1) != EINVAL);
+
+			/* for the next test the queue needs to be able to allocate 7 buffers */
+			if (q.g_max_num_buffers() < 7)
+				continue;
+
+			/* Create 4 buffers indexes 0 to 3 */
+			fail_on_test(q.create_bufs(node, 4));
+			/* Remove buffers index 1 and 2 */
+			fail_on_test(q.remove_bufs(node, 1, 2));
+			/* Add 3 more buffers should be indexes 4 to 6 */
+			fail_on_test(q.create_bufs(node, 3));
+			/* Query buffers:
+			 * 1 and 2 have been removed they must fail
+			 * 0 and 4 to 6 must exist*/
+			fail_on_test(buf.querybuf(node, 0));
+			fail_on_test(buf.querybuf(node, 1) != EINVAL);
+			fail_on_test(buf.querybuf(node, 2) != EINVAL);
+			fail_on_test(buf.querybuf(node, 4));
+			fail_on_test(buf.querybuf(node, 5));
+			fail_on_test(buf.querybuf(node, 6));
+			/* Remove existing buffer index 6 with bad type must fail */
+			memset(&removebufs, 0xff, sizeof(removebufs));
+			removebufs.index = 6;
+			removebufs.count = 1;
+			removebufs.type = 0;
+			fail_on_test(doioctl(node, VIDIOC_REMOVE_BUFS, &removebufs) != EINVAL);
+
+			/* Remove crossing max allowed buffers boundary must fail */
+			fail_on_test(q.remove_bufs(node, q.g_max_num_buffers() - 2, 7) != EINVAL);
+
+			/* Remove overflow must fail */
+			fail_on_test(q.remove_bufs(node, 3, 0xfffffff) != EINVAL);
+
+			/* Create 2 buffers, that must fill the hole */
+			fail_on_test(q.create_bufs(node, 2));
+			/* Remove all buffers */
+			fail_on_test(q.remove_bufs(node, 0, 7));
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


