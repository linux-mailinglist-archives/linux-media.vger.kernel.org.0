Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C873C44D57D
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 12:03:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233030AbhKKLFr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 06:05:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232815AbhKKLFq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 06:05:46 -0500
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAE9FC061767
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 03:02:57 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id l7r2mrtnDfwDFl7r6mHuvk; Thu, 11 Nov 2021 12:02:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1636628576; bh=gsr+I+39m9YvnjBQGVjb0UnR0Hde0pbzIeZQiESfpEQ=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=DIYtVz9vzmHaPPxEoE1Y4ie8ZsGAstrcjyYz2gXJy6YQxShGv17keKt/qU18aaDal
         EMjGWTyixlPaNP/tphNoFuHNTtyHglv7mYIcTPcJCf10Cp2/x1dID1bUXIB7JagXPD
         h/PG4xLA3cYcf3qTdrlo3EKbsPIISXIvbBP6NPAd+tp44eLQsBkdqdzossRUxNDszA
         RR65gARsep4Pb5GqPeEebFS1dSXKr+5U+/5ExRD5FIAG0ipmvHoBKA25nsXLsQQFh9
         EKhqz9rH47yC61yiXHX16c8cDH6equhdd++9zypsUaxizoXo838YSTUN8/GeJOB0gp
         cizAvboMfMEoA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] vb2: warn for or disable the CMA + USERPTR combination
Message-ID: <a8932f2c-5342-2cd8-9b98-1db0de756190@xs4all.nl>
Date:   Thu, 11 Nov 2021 12:02:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfD8WCTBaa7ox9LWrkk2Hn53OOCuHeINeXnXr6dWjIKmK5fYiAVj1h51/FR9KJ1xFFgMaw3s6OFxDb4228w0L33BItMzlWcceT3XdaM7/cGI8pRsmqxy8
 NICwXaHJZ+xYuSCE7Da+9ZQnjK1CXxRNRPt/ca1PsdFTcwbmfJra639LLqxD4TFi8Zam06KWsFXVZImGIBo4RSsDcdR1oLmtCf/3Kt6UJJZo83g1hP0TzKK0
 eBsNSkajLLwVrEm19SSBEsAYxIgfOnL6VLUH82oFimk+1N3/HZflrc0rnwppFPhqCbpA+ac+WY8R4Yi24fWehw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If one or more pages of the user-allocated buffer memory were
allocated in CMA memory, then when the buffer is prepared any
attempt to pin such pages will fail since user-allocated pages
in CMA memory are supposed to be moveable, and pinning them in
place would defeat the purpose of CMA.

CONFIG_CMA is typically only used with embedded systems, and
in that case the use of DMABUF is preferred.

So warn for this combination, and also add a new config option
to disable USERPTR support altogether if CONFIG_CMA is set.

I've chosen to put this under a config option since disabling
it unconditionally might cause userspace breakage.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Should USERPTR just be disabled unconditionally if CONFIG_CMA is set?
Feedback would be welcome.

I noticed this issue when testing on a VM instance which had CMA
set and had 4 GB memory allocated to it. The test-media regression
test started failing because of this issue. Increasing the memory
to 16 GB 'solved' it, but that's just papering over the real problem.
Hence this patch.
---
 drivers/media/common/videobuf2/Kconfig         | 11 +++++++++++
 .../media/common/videobuf2/videobuf2-core.c    | 18 ++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/media/common/videobuf2/Kconfig b/drivers/media/common/videobuf2/Kconfig
index d2223a12c95f..d89042cbb5cf 100644
--- a/drivers/media/common/videobuf2/Kconfig
+++ b/drivers/media/common/videobuf2/Kconfig
@@ -7,6 +7,17 @@ config VIDEOBUF2_CORE
 config VIDEOBUF2_V4L2
 	tristate

+config VIDEOBUF2_DISABLE_USERPTR_AND_CMA
+	bool "Disable use of V4L2 USERPTR streaming if CMA is enabled"
+	depends on CMA
+	depends on VIDEOBUF2_V4L2
+	help
+	  Say Y here to disable V4L2 USERPTR streaming mode if CMA is enabled.
+	  If some of the pages of the buffer memory were allocated in CMA memory,
+	  then attempting to pin those pages in place will fail with an error.
+
+	  When in doubt, say N.
+
 config VIDEOBUF2_MEMOPS
 	tristate

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 2266bbd239ab..17166d4212d0 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -662,6 +662,20 @@ static int __verify_userptr_ops(struct vb2_queue *q)
 	    !q->mem_ops->put_userptr)
 		return -EINVAL;

+#ifdef CONFIG_CMA
+	/*
+	 * If one or more pages of the user-allocated buffer memory were
+	 * allocated in CMA memory, then when the buffer is prepared any
+	 * attempt to pin such pages will fail since user-allocated pages
+	 * in CMA memory are supposed to be moveable, and pinning them in
+	 * place would defeat the purpose of CMA.
+	 *
+	 * CONFIG_CMA is typically only used with embedded systems, and
+	 * in that case the use of DMABUF is preferred.
+	 */
+	pr_warn_once("The USERPTR I/O streaming mode is unreliable if CMA is enabled.\n");
+	pr_warn_once("Use the DMABUF I/O streaming mode instead.\n");
+#endif
 	return 0;
 }

@@ -2399,6 +2413,10 @@ int vb2_core_queue_init(struct vb2_queue *q)
 	if (WARN_ON(q->supports_requests && q->min_buffers_needed))
 		return -EINVAL;

+#ifdef CONFIG_VIDEOBUF2_DISABLE_USERPTR_AND_CMA
+	q->io_modes &= ~VB2_USERPTR;
+#endif
+
 	INIT_LIST_HEAD(&q->queued_list);
 	INIT_LIST_HEAD(&q->done_list);
 	spin_lock_init(&q->done_lock);
-- 
2.33.0

