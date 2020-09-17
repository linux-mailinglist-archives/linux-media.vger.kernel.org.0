Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E23DE26E7B5
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 23:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgIQVxO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 17:53:14 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:9438 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725858AbgIQVxO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 17:53:14 -0400
X-Greylist: delayed 363 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 17:53:13 EDT
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 17 Sep 2020 14:47:09 -0700
Received: from veeras-linux.qualcomm.com ([10.134.68.137])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP; 17 Sep 2020 14:47:09 -0700
Received: by veeras-linux.qualcomm.com (Postfix, from userid 330320)
        id A560D218D9; Thu, 17 Sep 2020 14:47:09 -0700 (PDT)
From:   Veera Sundaram Sankaran <veeras@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org
Cc:     Veera Sundaram Sankaran <veeras@codeaurora.org>,
        robdclark@gmail.com, pdhaval@codeaurora.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org
Subject: [PATCH] dma-fence: add get_signaled_timestamp to fence ops
Date:   Thu, 17 Sep 2020 14:45:38 -0700
Message-Id: <1600379138-12774-1-git-send-email-veeras@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add an optional fence ops to allow drivers to be able to set the
timestamp for a fence. Some drivers have hardware capability to get
the precise timestamp of certain events based on which the fences
are triggered. This allows it to set accurate timestamp factoring
out any software and IRQ latencies. The get_signaled_timestamp ops,
if defined by the driver would be used during fence signaling to set
the timestamp, before setting the flag DMA_FENCE_FLAG_TIMESTAMP_BIT.
If the callback is not defined, ktime_get is used to set the fence
timestamp.

Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
---
 drivers/dma-buf/dma-fence.c |  6 +++++-
 include/linux/dma-fence.h   | 13 +++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 43624b4..95c6ab0 100644
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
@@ -340,7 +341,10 @@ int dma_fence_signal_locked(struct dma_fence *fence)
 	/* Stash the cb_list before replacing it with the timestamp */
 	list_replace(&fence->cb_list, &cb_list);
 
-	fence->timestamp = ktime_get();
+	if (fence->ops->get_signaled_timestamp)
+		fence->timestamp = fence->ops->get_signaled_timestamp(fence);
+	else
+		fence->timestamp = ktime_get();
 	set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
 	trace_dma_fence_signaled(fence);
 
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 09e23ad..ce73aba 100644
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
@@ -261,6 +262,18 @@ struct dma_fence_ops {
 	 */
 	void (*timeline_value_str)(struct dma_fence *fence,
 				   char *str, int size);
+
+	/**
+	 * @get_signaled_timestamp:
+	 *
+	 * Allows the driver to fill in precise timestamp for a fence.
+	 * This ops would be used during fence signalling to set the timestamp,
+	 * before setting the flag DMA_FENCE_FLAG_TIMESTAMP_BIT.
+	 *
+	 * This callback is optional. If this callback is not present,
+	 * ktime_get is used to fill in the timestamp.
+	 */
+	ktime_t (*get_signaled_timestamp)(struct dma_fence *fence);
 };
 
 void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
-- 
2.7.4

