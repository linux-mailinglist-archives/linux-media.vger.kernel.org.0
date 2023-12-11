Return-Path: <linux-media+bounces-2097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B153080CB2F
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 14:38:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D096281E10
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 13:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C9A3F8EF;
	Mon, 11 Dec 2023 13:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="4si09pMV"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 957C5DF;
	Mon, 11 Dec 2023 05:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702301578;
	bh=b8ARRgUt6PP7I4tilli30JArn97cnUUvvFgpx2rQFxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=4si09pMVnmstkM3LDZtViwkwGTu7XQ7H2FOGTVCM8/pTZqClw4xQ2dxJ0ndcgP1tX
	 oHqHfHdxXbzmBP79I/2D/5Lpfqn37pa0YNkD5HFsRGZaLYqy28NtPBhJ+BdprZDJRq
	 yLMnHf7GrpIu3tBTClInLaW9wlo1O9IUtYfiIwE8WuBan5hmhfpnJ71Z3Vqxxwf654
	 8yUGIVvdRrTkudWdBxP5UMghg4XcN/uJIhsdtPIDLrer75Dqg8KPTYrWKQw4FYnxy/
	 PT62dPC83WywBONJVKnyGeOXNceEmg2DGve+C/+FZsteYMYSwmMYU5N+yrUbYbZ3+i
	 hNOFoCu8JL80w==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 69116378142D;
	Mon, 11 Dec 2023 13:32:58 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org,
	tfiga@chromium.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v5 2/3] videobuf2: Add min_reqbufs_allocation field to vb2_queue structure
Date: Mon, 11 Dec 2023 14:32:50 +0100
Message-Id: <20231211133251.150999-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231211133251.150999-1-benjamin.gaignard@collabora.com>
References: <20231211133251.150999-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add 'min_reqbufs_allocation' field in vb2_queue structure so drivers
can specificy the minimum number of buffers to allocate when calling
VIDIOC_REQBUFS.
If used this minimum should be higher than the minimum number of
queued buffers needed to start streaming.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
version 5:
- Add WARN_ON() vb2_core_queue_init()
- Check min_reqbufs_allocation value in vb2_core_queue_init()
  so it is at least equal to min_queued_buffers + 1.
- Rework min_reqbufs_allocation documentation.

 drivers/media/common/videobuf2/videobuf2-core.c | 10 ++++++++--
 include/media/videobuf2-core.h                  | 13 +++++++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 8912dff5bde3..a183edf11586 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -865,7 +865,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	/*
 	 * Make sure the requested values and current defaults are sane.
 	 */
-	num_buffers = max_t(unsigned int, *count, q->min_queued_buffers + 1);
+	num_buffers = max_t(unsigned int, *count, q->min_reqbufs_allocation);
 	num_buffers = min_t(unsigned int, num_buffers, q->max_num_buffers);
 	memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
 	/*
@@ -917,7 +917,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	 * There is no point in continuing if we can't allocate the minimum
 	 * number of buffers needed by this vb2_queue.
 	 */
-	if (allocated_buffers < q->min_queued_buffers)
+	if (allocated_buffers < q->min_reqbufs_allocation)
 		ret = -ENOMEM;
 
 	/*
@@ -2521,6 +2521,12 @@ int vb2_core_queue_init(struct vb2_queue *q)
 	if (WARN_ON(q->supports_requests && q->min_queued_buffers))
 		return -EINVAL;
 
+	q->min_reqbufs_allocation = max_t(unsigned int,
+					  q->min_reqbufs_allocation,
+					  q->min_queued_buffers + 1);
+	if (WARN_ON(q->min_reqbufs_allocation > q->max_num_buffers))
+		return -EINVAL;
+
 	INIT_LIST_HEAD(&q->queued_list);
 	INIT_LIST_HEAD(&q->done_list);
 	spin_lock_init(&q->done_lock);
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index f9a00b6c3c46..2ed57749a280 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -553,6 +553,18 @@ struct vb2_buf_ops {
  *		VIDIOC_REQBUFS will ensure at least @min_queued_buffers + 1
  *		buffers will be allocated. Note that VIDIOC_CREATE_BUFS will not
  *		modify the requested buffer count.
+ * @min_reqbufs_allocation: the minimum number of buffers to be allocated when
+ *		calling VIDIOC_REQBUFS. Drivers can set this if there has to
+ *		be a certain number of buffers available for the hardware to
+ *		work effectively. If set, then @min_reqbufs_allocation must be
+ *		larger than @min_queued_buffers + 1.
+ *		This field is only used by VIDIOC_REQBUFS. This allows calling
+ *		that ioctl with a buffer count of 1 and it will be automatically
+ *		adjusted to a workable buffer count. VIDIOC_CREATE_BUFS will not
+ *		modify the requested buffer count.
+ *		If this field is > 3, then it is highly recommended that the
+ *		driver implements the V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT
+ *		control.
  */
 /*
  * Private elements (won't appear at the uAPI book):
@@ -618,6 +630,7 @@ struct vb2_queue {
 	u32				timestamp_flags;
 	gfp_t				gfp_flags;
 	u32				min_queued_buffers;
+	u32				min_reqbufs_allocation;
 
 	struct device			*alloc_devs[VB2_MAX_PLANES];
 
-- 
2.40.1


