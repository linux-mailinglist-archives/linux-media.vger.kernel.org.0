Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F514400510
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 20:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349459AbhICSpE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 14:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349906AbhICSpD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 14:45:03 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2882C061575;
        Fri,  3 Sep 2021 11:44:02 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id n18so71066plp.7;
        Fri, 03 Sep 2021 11:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PZdCcQ8tcqex0OLD2RIlUbOtwTacOGhblZ9bIPZWiKA=;
        b=liQZziVpS09I/Y7nKQPncOo/kNAL0/xeZUTUjD1s54CZDfEbTzHj7pwCzFeZUKFizf
         6/Qkw9Jf9hTRnrghuIvaLNWgvZN1/CYWs0dVX5npYK/V1r4/WVMnWlUVrwoJiwAObIGP
         xHOMxFuQEGvXxKV0pb8/oTgQ90bWS9eCdhsx80WAu+D7oYoCzrTGurYs/tdlfyyA5h7B
         pj+r2b2XHgonzl73U4Ev853xmLkvyVtpfgERjxSnCLoLkz3FFaY8BcGH64tzJNdaaYqS
         UfhwyWzviS/xR5bJmxpcTNBn9ruB3j6YzqyavcgIWQe504AWeZX1DYeGouvP+WAPc4n/
         7pQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PZdCcQ8tcqex0OLD2RIlUbOtwTacOGhblZ9bIPZWiKA=;
        b=BkSjYAKPekBrAsREUFHLWNV1loa5czaxVUM01cxU8CZrnQ9+HtajzZY7p9YY+iu/yH
         l+noJAjo0nW+khIqGp26An+EdlViVkOcUU1ayIlLFERiGuJjk0mHuH4DQtyU+wxBg8Ix
         YAsGbb2CVqgnXO++tjIbtizkW8BkaII2tjMazB19ypXw+EAI/ibX7cZDSYVDuMxcH19h
         GddW7Gs4gmJ32iuq99+hfbV8nD7n42fo18f0sn0xgEnhQz2vRUxuzTmz8Ziru4QztRZi
         +u0WFPShEbHn29Zvaw4XHo6BFFpkhHhjOoLmVLNMmAOZG6o1g63djxBy7txI5OfUZDx+
         +SAA==
X-Gm-Message-State: AOAM530c+hX6nohmU4rJTHXtEkfMqkLQmrD2/ZsTpyzs3DXabuYTZX98
        OPo/k0Nxpp0wDCbd8pwTTts=
X-Google-Smtp-Source: ABdhPJyqZa627QuEiIJsQlyGdv0n86CMJYOQxQvddGI6zVCpjyV+AqIaUyU9EoPvz1A1JWWcw7Dftg==
X-Received: by 2002:a17:90b:1246:: with SMTP id gx6mr292968pjb.94.1630694642383;
        Fri, 03 Sep 2021 11:44:02 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id z65sm39685pjj.43.2021.09.03.11.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 11:44:01 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        linux-media@vger.kernel.org (open list:SYNC FILE FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/9] dma-fence: Add deadline awareness
Date:   Fri,  3 Sep 2021 11:47:52 -0700
Message-Id: <20210903184806.1680887-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903184806.1680887-1-robdclark@gmail.com>
References: <20210903184806.1680887-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v2: Drop dma_fence::deadline and related logic to filter duplicate
    deadlines, to avoid increasing dma_fence size.  The fence-context
    implementation will need similar logic to track deadlines of all
    the fences on the same timeline.  [ckoenig]

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/dma-buf/dma-fence.c | 20 ++++++++++++++++++++
 include/linux/dma-fence.h   | 16 ++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index ce0f5eff575d..1f444863b94d 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -910,6 +910,26 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
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
+	if (fence->ops->set_deadline && !dma_fence_is_signaled(fence))
+		fence->ops->set_deadline(fence, deadline);
+}
+EXPORT_SYMBOL(dma_fence_set_deadline);
+
 /**
  * dma_fence_init - Initialize a custom fence.
  * @fence: the fence to initialize
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 6ffb4b2c6371..9c809f0d5d0a 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -99,6 +99,7 @@ enum dma_fence_flag_bits {
 	DMA_FENCE_FLAG_SIGNALED_BIT,
 	DMA_FENCE_FLAG_TIMESTAMP_BIT,
 	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
+	DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
 	DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
 };
 
@@ -261,6 +262,19 @@ struct dma_fence_ops {
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
@@ -586,6 +600,8 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
 	return ret < 0 ? ret : 0;
 }
 
+void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline);
+
 struct dma_fence *dma_fence_get_stub(void);
 struct dma_fence *dma_fence_allocate_private_stub(void);
 u64 dma_fence_context_alloc(unsigned num);
-- 
2.31.1

