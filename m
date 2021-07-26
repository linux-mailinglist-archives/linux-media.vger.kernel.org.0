Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52F663D6A3E
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 01:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233965AbhGZWyV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 18:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233380AbhGZWyU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 18:54:20 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F18C061757;
        Mon, 26 Jul 2021 16:34:47 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id f13so3114624plj.2;
        Mon, 26 Jul 2021 16:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hr8TbT0NY8bhwRPFfOulQoFlLUKAkASJhK+Ly3YzODY=;
        b=j8LlgSPw1RFIs8exl6aXPn3feuweS/2CJIHKyHEB7xVGXTNTC85mtEg/Uq+42kAlt2
         3QjXHcRqxRY2YLBc/jRGnCj71ESXb3kYFw4vm/zBJUYQ8kIHhxPNUw8U5SBxXsPeo0++
         +0KYr1u29WW/FfVUqJJhz1n67eMRUY2pPWVlZ2NKZJ4YtMbcgkyjTi++nbRozr3VyCpB
         /Def4VylyfYnxhrjrlupA1NQ22I3TDfVPJqR6eoJLDGBYyvFR7ANRtd5Gu4fX47qDI8U
         T6fC5hASr8PoHrvYYtUpfai0fxI/yp8YrtOmOrPcSJnWieo53lWJRaIQyIskGWwapfcy
         PvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hr8TbT0NY8bhwRPFfOulQoFlLUKAkASJhK+Ly3YzODY=;
        b=Z/IHy8zzhnJnBdy4VhEziJVDv9xP90yM0H/JyltnXy/5XNgNi+4AyJqKW5YzRtfUYY
         /7dlX5SYkV4QgxfwYEhdkV9ZHFJ+hGsjEaPiAlokwREv5UZspghDwNSONQatYMpYtil4
         gFB+QJG6zsQdKiUNMMDcYqzJ1Cu8prrDUtK6tyL2ZF3/T9A9DS98D7OhyeHNH5ppgAZ6
         zaNxhSe1sHFIOvZqmQyOoFbjl5Pp8XLNy77weHoBtccJ0PJyDrR+HhM9njFfRtHuOi4g
         vD22o6f0GXwH9FbGnSH3236rRd8ol0Dicy/1sKEg1ARwOxklHyeikBB9PoUkQIGE00Bc
         tzyQ==
X-Gm-Message-State: AOAM530Ua/axOy6z8fNbYcuUI1z8YK3hY+WOh7d75cYtO4h9dnn3zKgL
        RV3GAmZ4e7KiLq6680cm0ro=
X-Google-Smtp-Source: ABdhPJzCJR1KRrhEUmpZNBEL+HoO6bZ9tT6NUdNFHH+pky+Hz4zM8T717wtK0Zidl77XkVjEvdhVFw==
X-Received: by 2002:a17:90a:940e:: with SMTP id r14mr1342648pjo.41.1627342487091;
        Mon, 26 Jul 2021 16:34:47 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id u190sm1212457pfb.95.2021.07.26.16.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 16:34:46 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Matthew Brost <matthew.brost@intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org (open list:SYNC FILE FRAMEWORK),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK), linux-kernel@vger.kernel.org (open list)
Subject: [RFC 1/4] dma-fence: Add deadline awareness
Date:   Mon, 26 Jul 2021 16:38:48 -0700
Message-Id: <20210726233854.2453899-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726233854.2453899-1-robdclark@gmail.com>
References: <20210726233854.2453899-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Add a way to hint to the fence signaler of an upcoming deadline, such as
vblank, which the fence waiter would prefer not to miss.  This is to aid
the fence signaler in making power management decisions, like boosting
frequency as the deadline approaches and awareness of missing deadlines
so that can be factored in to the frequency scaling.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/dma-buf/dma-fence.c | 39 +++++++++++++++++++++++++++++++++++++
 include/linux/dma-fence.h   | 17 ++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index ce0f5eff575d..2e0d25ab457e 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -910,6 +910,45 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
 }
 EXPORT_SYMBOL(dma_fence_wait_any_timeout);
 
+
+/**
+ * dma_fence_set_deadline - set desired fence-wait deadline
+ * @fence:    the fence that is to be waited on
+ * @deadline: the time by which the waiter hopes for the fence to be
+ *            signaled
+ *
+ * Inform the fence signaler of an upcoming deadline, such as vblank, by
+ * which point the waiter would prefer the fence to be signaled by.  This
+ * is intended to give feedback to the fence signaler to aid in power
+ * management decisions, such as boosting GPU frequency if a periodic
+ * vblank deadline is approaching.
+ */
+void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
+{
+	unsigned long flags;
+
+	if (dma_fence_is_signaled(fence))
+		return;
+
+	spin_lock_irqsave(fence->lock, flags);
+
+	/* If we already have an earlier deadline, keep it: */
+	if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags) &&
+	    ktime_before(fence->deadline, deadline)) {
+		spin_unlock_irqrestore(fence->lock, flags);
+		return;
+	}
+
+	fence->deadline = deadline;
+	set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags);
+
+	spin_unlock_irqrestore(fence->lock, flags);
+
+	if (fence->ops->set_deadline)
+		fence->ops->set_deadline(fence, deadline);
+}
+EXPORT_SYMBOL(dma_fence_set_deadline);
+
 /**
  * dma_fence_init - Initialize a custom fence.
  * @fence: the fence to initialize
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 6ffb4b2c6371..4e6cfe4e6fbc 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -88,6 +88,7 @@ struct dma_fence {
 		/* @timestamp replaced by @rcu on dma_fence_release() */
 		struct rcu_head rcu;
 	};
+	ktime_t deadline;
 	u64 context;
 	u64 seqno;
 	unsigned long flags;
@@ -99,6 +100,7 @@ enum dma_fence_flag_bits {
 	DMA_FENCE_FLAG_SIGNALED_BIT,
 	DMA_FENCE_FLAG_TIMESTAMP_BIT,
 	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
+	DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
 	DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
 };
 
@@ -261,6 +263,19 @@ struct dma_fence_ops {
 	 */
 	void (*timeline_value_str)(struct dma_fence *fence,
 				   char *str, int size);
+
+	/**
+	 * @set_deadline:
+	 *
+	 * Callback to allow a fence waiter to inform the fence signaler of an
+	 * upcoming deadline, such as vblank, by which point the waiter would
+	 * prefer the fence to be signaled by.  This is intended to give feedback
+	 * to the fence signaler to aid in power management decisions, such as
+	 * boosting GPU frequency.
+	 *
+	 * This callback is optional.
+	 */
+	void (*set_deadline)(struct dma_fence *fence, ktime_t deadline);
 };
 
 void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
@@ -586,6 +601,8 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
 	return ret < 0 ? ret : 0;
 }
 
+void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline);
+
 struct dma_fence *dma_fence_get_stub(void);
 struct dma_fence *dma_fence_allocate_private_stub(void);
 u64 dma_fence_context_alloc(unsigned num);
-- 
2.31.1

