Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32C452F8A00
	for <lists+linux-media@lfdr.de>; Sat, 16 Jan 2021 01:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbhAPAjy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 19:39:54 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:9718 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725815AbhAPAjy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 19:39:54 -0500
X-Greylist: delayed 445 seconds by postgrey-1.27 at vger.kernel.org; Fri, 15 Jan 2021 19:39:54 EST
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Jan 2021 16:31:49 -0800
X-QCInternal: smtphost
Received: from veeras-linux.qualcomm.com ([10.134.68.137])
  by ironmsg05-sd.qualcomm.com with ESMTP; 15 Jan 2021 16:31:48 -0800
Received: by veeras-linux.qualcomm.com (Postfix, from userid 330320)
        id AA12421B72; Fri, 15 Jan 2021 16:31:48 -0800 (PST)
From:   Veera Sundaram Sankaran <veeras@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org, gustavo@padovan.org, airlied@linux.ie,
        daniel@ffwll.ch, john.stultz@linaro.org
Cc:     Veera Sundaram Sankaran <veeras@codeaurora.org>,
        robdclark@gmail.com, sean@poorly.run, pdhaval@codeaurora.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org
Subject: [PATCH v4 1/2] dma-fence: allow signaling drivers to set fence timestamp
Date:   Fri, 15 Jan 2021 16:31:46 -0800
Message-Id: <1610757107-11892-1-git-send-email-veeras@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some drivers have hardware capability to get the precise HW timestamp
of certain events based on which the fences are triggered. The delta
between the event HW timestamp & current HW reference timestamp can
be used to calculate the timestamp in kernel's CLOCK_MONOTONIC time
domain. This allows it to set accurate timestamp factoring out any
software and IRQ latencies. Add a timestamp variant of fence signal
function, dma_fence_signal_timestamp to allow drivers to update the
precise timestamp for fences.

Changes in v2:
- Add a new fence signal variant instead of modifying fence struct

Changes in v3:
- Add timestamp domain information to commit-text and
dma_fence_signal_timestamp documentation

Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
---
 drivers/dma-buf/dma-fence.c | 70 ++++++++++++++++++++++++++++++++++++++++-----
 include/linux/dma-fence.h   |  3 ++
 2 files changed, 66 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 7475e09..b83e9fa 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -312,22 +312,25 @@ void __dma_fence_might_wait(void)
 
 
 /**
- * dma_fence_signal_locked - signal completion of a fence
+ * dma_fence_signal_timestamp_locked - signal completion of a fence
  * @fence: the fence to signal
+ * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC time domain
  *
  * Signal completion for software callbacks on a fence, this will unblock
  * dma_fence_wait() calls and run all the callbacks added with
  * dma_fence_add_callback(). Can be called multiple times, but since a fence
  * can only go from the unsignaled to the signaled state and not back, it will
- * only be effective the first time.
+ * only be effective the first time. Set the timestamp provided as the fence
+ * signal timestamp.
  *
- * Unlike dma_fence_signal(), this function must be called with &dma_fence.lock
- * held.
+ * Unlike dma_fence_signal_timestamp(), this function must be called with
+ * &dma_fence.lock held.
  *
  * Returns 0 on success and a negative error value when @fence has been
  * signalled already.
  */
-int dma_fence_signal_locked(struct dma_fence *fence)
+int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
+			ktime_t timestamp)
 {
 	struct dma_fence_cb *cur, *tmp;
 	struct list_head cb_list;
@@ -341,7 +344,7 @@ int dma_fence_signal_locked(struct dma_fence *fence)
 	/* Stash the cb_list before replacing it with the timestamp */
 	list_replace(&fence->cb_list, &cb_list);
 
-	fence->timestamp = ktime_get();
+	fence->timestamp = timestamp;
 	set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
 	trace_dma_fence_signaled(fence);
 
@@ -352,6 +355,59 @@ int dma_fence_signal_locked(struct dma_fence *fence)
 
 	return 0;
 }
+EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
+
+/**
+ * dma_fence_signal_timestamp - signal completion of a fence
+ * @fence: the fence to signal
+ * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC time domain
+ *
+ * Signal completion for software callbacks on a fence, this will unblock
+ * dma_fence_wait() calls and run all the callbacks added with
+ * dma_fence_add_callback(). Can be called multiple times, but since a fence
+ * can only go from the unsignaled to the signaled state and not back, it will
+ * only be effective the first time. Set the timestamp provided as the fence
+ * signal timestamp.
+ *
+ * Returns 0 on success and a negative error value when @fence has been
+ * signalled already.
+ */
+int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp)
+{
+	unsigned long flags;
+	int ret;
+
+	if (!fence)
+		return -EINVAL;
+
+	spin_lock_irqsave(fence->lock, flags);
+	ret = dma_fence_signal_timestamp_locked(fence, timestamp);
+	spin_unlock_irqrestore(fence->lock, flags);
+
+	return ret;
+}
+EXPORT_SYMBOL(dma_fence_signal_timestamp);
+
+/**
+ * dma_fence_signal_locked - signal completion of a fence
+ * @fence: the fence to signal
+ *
+ * Signal completion for software callbacks on a fence, this will unblock
+ * dma_fence_wait() calls and run all the callbacks added with
+ * dma_fence_add_callback(). Can be called multiple times, but since a fence
+ * can only go from the unsignaled to the signaled state and not back, it will
+ * only be effective the first time.
+ *
+ * Unlike dma_fence_signal(), this function must be called with &dma_fence.lock
+ * held.
+ *
+ * Returns 0 on success and a negative error value when @fence has been
+ * signalled already.
+ */
+int dma_fence_signal_locked(struct dma_fence *fence)
+{
+	return dma_fence_signal_timestamp_locked(fence, ktime_get());
+}
 EXPORT_SYMBOL(dma_fence_signal_locked);
 
 /**
@@ -379,7 +435,7 @@ int dma_fence_signal(struct dma_fence *fence)
 	tmp = dma_fence_begin_signalling();
 
 	spin_lock_irqsave(fence->lock, flags);
-	ret = dma_fence_signal_locked(fence);
+	ret = dma_fence_signal_timestamp_locked(fence, ktime_get());
 	spin_unlock_irqrestore(fence->lock, flags);
 
 	dma_fence_end_signalling(tmp);
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 09e23ad..9f12efa 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -372,6 +372,9 @@ static inline void __dma_fence_might_wait(void) {}
 
 int dma_fence_signal(struct dma_fence *fence);
 int dma_fence_signal_locked(struct dma_fence *fence);
+int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
+int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
+				      ktime_t timestamp);
 signed long dma_fence_default_wait(struct dma_fence *fence,
 				   bool intr, signed long timeout);
 int dma_fence_add_callback(struct dma_fence *fence,
-- 
2.7.4

