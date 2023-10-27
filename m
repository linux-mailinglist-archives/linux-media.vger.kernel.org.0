Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 317327D928D
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 10:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345553AbjJ0Irq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 04:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345518AbjJ0Iro (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 04:47:44 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2BFDC4
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 01:47:41 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:dbc0:3460:d466:3213])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id A9020660732A;
        Fri, 27 Oct 2023 09:47:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1698396460;
        bh=EE3BYsg52PRCivh6VHXIAzqf0SUul9JArpZgJ6HqtVU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z3OhOGNZycfo0LnRcyZ3WAQ0Wn2NnOPDMa5E8K/PRthPlK5ZiZwzPyh5CprtSBOAv
         Tgx8cak+1ZfYuL8KJf3OY4WRT7KSKWQQJ8ex3OiJlZ4+1CzWhHp0tVWw44Pffv6a3G
         w0DfWfzdYeLAxdbSVK+Om1fWb8VVQAKoxceZRP2VVwUaXuj3yaqe64ziXgWe6lxhl5
         /ltmvpvnEAtN9Qfu/oY5+9eYEYit4uJBMkGzTMX/xsW897ldhQjpLwlle92xUv+DMe
         xvQQYK80MpY1crpQ8fG7TQ6yRaVTbQsKsV+QYtL6oDOxGqIN8tk6Ls0ojFBib4jc6P
         uakt1WAcTo66Q==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v4 2/4] v4l2-compliance: Test queue maximum buffers allocation
Date:   Fri, 27 Oct 2023 10:47:30 +0200
Message-Id: <20231027084732.17528-3-benjamin.gaignard@collabora.com>
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

If  V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS is set v4l2_create_buffers
'max_num_buffers' field reports the maximum number of buffers supported
by the queue.
Add a test to allocate this maximum value and make sure that one
more allocation is failing.
Display the flag in v4l2-ctl.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 utils/common/cv4l-helpers.h                 |  1 +
 utils/common/v4l-helpers.h                  |  5 +++
 utils/common/v4l2-info.cpp                  |  1 +
 utils/v4l2-compliance/v4l2-compliance.cpp   |  1 +
 utils/v4l2-compliance/v4l2-compliance.h     |  1 +
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 42 ++++++++++++++++++++-
 6 files changed, 50 insertions(+), 1 deletion(-)

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
index f8e96d58..550ec377 100644
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
+	if (q->capabilities & V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS)
+		q->max_buffers = createbufs.max_num_buffers;
 	q->buffers += createbufs.count;
 	return v4l_queue_querybufs(f, q, q->buffers - createbufs.count);
 }
diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index 4f8c2aa7..b11f2b77 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -206,6 +206,7 @@ static constexpr flag_def bufcap_def[] = {
 	{ V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS, "orphaned-bufs" },
 	{ V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF, "m2m-hold-capture-buf" },
 	{ V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS, "mmap-cache-hints" },
+	{ V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS, "set-max-num-bufs" },
 	{ 0, nullptr }
 };
 
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index ac6a8f80..a165ef5a 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1453,6 +1453,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 
 		printf("Buffer ioctls%s:\n", suffix);
 		printf("\ttest VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: %s\n", ok(testReqBufs(&node)));
+		printf("\ttest CREATE_BUFS maximum buffers: %s\n", ok(testCreateBufsMax(&node)));
 		// Reopen after each streaming test to reset the streaming state
 		// in case of any errors in the preceeding test.
 		node.reopen();
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 7e3860c8..4f9aa17e 100644
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
index 6d592c9b..02ea498f 100644
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
@@ -761,6 +760,47 @@ int testReqBufs(struct node *node)
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
+		if (!ret && (q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS)) {
+			fail_on_test(q.create_bufs(node, q.g_max_buffers() - q.g_buffers()));
+			ret = q.create_bufs(node, 1);
+			fail_on_test(ret != ENOBUFS && (q.g_max_buffers() == q.g_buffers()));
+		}
+
+		q.init(i, V4L2_MEMORY_MMAP);
+		ret = q.create_bufs(node, 1);
+		if (!ret && (q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS)) {
+			fail_on_test(q.create_bufs(node, q.g_max_buffers() - q.g_buffers()));
+			ret = q.create_bufs(node, 1);
+			fail_on_test(ret != ENOBUFS && (q.g_max_buffers() == q.g_buffers()));
+		}
+
+		q.init(i, V4L2_MEMORY_DMABUF);
+		ret = q.create_bufs(node, 1);
+		if (!ret && (q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS)) {
+			fail_on_test(q.create_bufs(node, q.g_max_buffers() - q.g_buffers()));
+			ret = q.create_bufs(node, 1);
+			fail_on_test(ret != ENOBUFS && (q.g_max_buffers() == q.g_buffers()));
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

