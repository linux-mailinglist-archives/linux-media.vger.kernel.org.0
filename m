Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB03F2B0C9A
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 19:27:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgKLS1f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 13:27:35 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:45359 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726181AbgKLS1f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 13:27:35 -0500
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Nov 2020 10:27:33 -0800
X-QCInternal: smtphost
Received: from veeras-linux.qualcomm.com ([10.134.68.137])
  by ironmsg04-sd.qualcomm.com with ESMTP; 12 Nov 2020 10:27:33 -0800
Received: by veeras-linux.qualcomm.com (Postfix, from userid 330320)
        id 4688021A36; Thu, 12 Nov 2020 10:27:33 -0800 (PST)
From:   Veera Sundaram Sankaran <veeras@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org, gustavo@padovan.org, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     Veera Sundaram Sankaran <veeras@codeaurora.org>,
        robdclark@gmail.com, sean@poorly.run, pdhaval@codeaurora.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org
Subject: [PATCH RESEND 1/2] dma-fence: allow signaling drivers to set fence timestamp
Date:   Thu, 12 Nov 2020 10:27:22 -0800
Message-Id: <1605205643-12746-1-git-send-email-veeras@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some drivers have hardware capability to get the precise timestamp of
certain events based on which the fences are triggered. This allows it
to set accurate timestamp factoring out any software and IRQ latencies.
Move the timestamp parameter out of union in dma_fence struct to allow
signaling drivers to set it. If the parameter is not set, ktime_get is
used to set the current time to fence timestamp during dma_fence_signal.

Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
---
 drivers/dma-buf/dma-fence.c | 18 ++++++++++--------
 include/linux/dma-fence.h   | 15 +++------------
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 43624b4..7cef49a 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2012 Canonical Ltd
  * Copyright (C) 2012 Texas Instruments
+ * Copyright (c) 2020 The Linux Foundation. All rights reserved.
  *
  * Authors:
  * Rob Clark <robdclark@gmail.com>
@@ -329,7 +330,6 @@ void __dma_fence_might_wait(void)
 int dma_fence_signal_locked(struct dma_fence *fence)
 {
 	struct dma_fence_cb *cur, *tmp;
-	struct list_head cb_list;
 
 	lockdep_assert_held(fence->lock);
 
@@ -337,16 +337,18 @@ int dma_fence_signal_locked(struct dma_fence *fence)
 				      &fence->flags)))
 		return -EINVAL;
 
-	/* Stash the cb_list before replacing it with the timestamp */
-	list_replace(&fence->cb_list, &cb_list);
-
-	fence->timestamp = ktime_get();
+	/* set current time, if not set by signaling driver */
+	if (!fence->timestamp)
+		fence->timestamp = ktime_get();
 	set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
 	trace_dma_fence_signaled(fence);
 
-	list_for_each_entry_safe(cur, tmp, &cb_list, node) {
-		INIT_LIST_HEAD(&cur->node);
-		cur->func(fence, cur);
+	if (!list_empty(&fence->cb_list)) {
+		list_for_each_entry_safe(cur, tmp, &fence->cb_list, node) {
+			INIT_LIST_HEAD(&cur->node);
+			cur->func(fence, cur);
+		}
+		INIT_LIST_HEAD(&fence->cb_list);
 	}
 
 	return 0;
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 09e23ad..a9eebaf 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2012 Canonical Ltd
  * Copyright (C) 2012 Texas Instruments
+ * Copyright (c) 2020 The Linux Foundation. All rights reserved.
  *
  * Authors:
  * Rob Clark <robdclark@gmail.com>
@@ -70,26 +71,16 @@ struct dma_fence {
 	 * release the fence it is unused. No one should be adding to the
 	 * cb_list that they don't themselves hold a reference for.
 	 *
-	 * The lifetime of the timestamp is similarly tied to both the
-	 * rcu freelist and the cb_list. The timestamp is only set upon
-	 * signaling while simultaneously notifying the cb_list. Ergo, we
-	 * only use either the cb_list of timestamp. Upon destruction,
-	 * neither are accessible, and so we can use the rcu. This means
-	 * that the cb_list is *only* valid until the signal bit is set,
-	 * and to read either you *must* hold a reference to the fence,
-	 * and not just the rcu_read_lock.
-	 *
 	 * Listed in chronological order.
 	 */
 	union {
 		struct list_head cb_list;
-		/* @cb_list replaced by @timestamp on dma_fence_signal() */
-		ktime_t timestamp;
-		/* @timestamp replaced by @rcu on dma_fence_release() */
+		/* @cb_list replaced by @rcu on dma_fence_release() */
 		struct rcu_head rcu;
 	};
 	u64 context;
 	u64 seqno;
+	ktime_t timestamp;
 	unsigned long flags;
 	struct kref refcount;
 	int error;
-- 
2.7.4

