Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B43F493B4B
	for <lists+linux-media@lfdr.de>; Wed, 19 Jan 2022 14:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354866AbiASNns (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jan 2022 08:43:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349633AbiASNno (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jan 2022 08:43:44 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 652C3C061574
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 05:43:43 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id cx27so11921007edb.1
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 05:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nkHC8QZFOIHT45+bm5mbkRLb4msTxzU2f5F+QSxdoAg=;
        b=kA3OW1OUw0qGIgFgEr0kKZ2UdSFvZdnvjoM0lTM/D9X+mBtKQeC7rRw78LXmBVALy4
         oS4/NuhD6B5fWe2IrNEF47yE1nam6z2V4bp6bIOzsGlGZ716RbQdTK36ZNr+UOUmNKTb
         4ELPG1rofWbczCwKL3Cjw01+z31KKByuJHCwaFxVHr2HTpjT07jE9xg1BxTIr7T8Id5L
         0G0e64OTarRwhrL7Vt8ky183Y85WxlAoL0oHmNkVtLOitqgFzRc9xLgNP2gzKQoVsJoI
         8GWd/dRRlM/TV4K/R8/RvmmiWH/dmi6rGQfytV/U7OHRAwzKgvOaj/Hz0TzNfRu0KCiY
         QMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nkHC8QZFOIHT45+bm5mbkRLb4msTxzU2f5F+QSxdoAg=;
        b=DD8gO7isaU1e+6DI8Ica2xjYlsmgS1mMG6gM4kC3nKju3/NWLqFIr23f4hYKZnUYfo
         nDxcjU4mQEDR6IKphFcszuOE2MjLueQNfoqzK1bI/jcyMcHLtopseyL/B6iAWNkNZuse
         xEdo6yldkPYwI3jsV8DL/mc7lQLHf3xtBaVDTrVUfZJk7/w+r84zD8BrNpGdjQQYsv4d
         Vb2DhFI2aZjUChrAg8QwUtSQHJbh2yXTTa3j/rB0djv4vqX11xh2zw3ETCQREAcbJZ1l
         R3IeNdCY+p526AV9gqybSwqZ6OgN8CLxrKVog6n/v8q3LA6eoFXgaA6SmkWb7yyFMF9E
         InHw==
X-Gm-Message-State: AOAM531rkNOZiR2poDPDP395KbSYNEoVe91zcQa8nHABE8Kin0iK+kWp
        iC4mqHW902q4mUAOa0i8ptBj77gmyKs=
X-Google-Smtp-Source: ABdhPJysfjK85HqXAmx0IVGsIhpy+iuwL6GzcPwoaLzs0OSgqk7DiaxMXm6z6DRv3u7tB0iykp3olA==
X-Received: by 2002:a5d:634e:: with SMTP id b14mr30171587wrw.105.1642599821614;
        Wed, 19 Jan 2022 05:43:41 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id g15sm19733583wrm.2.2022.01.19.05.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 05:43:40 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/4] dma-buf: consolidate dma_fence subclass checking
Date:   Wed, 19 Jan 2022 14:43:36 +0100
Message-Id: <20220119134339.3102-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Consolidate the wrapper functions to check for dma_fence
subclasses in the dma_fence header.

This makes it easier to document and also check the different
requirements for fence containers in the subclasses.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/linux/dma-fence-array.h | 15 +------------
 include/linux/dma-fence-chain.h |  3 +--
 include/linux/dma-fence.h       | 38 +++++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 16 deletions(-)

diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 303dd712220f..fec374f69e12 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -45,19 +45,6 @@ struct dma_fence_array {
 	struct irq_work work;
 };
 
-extern const struct dma_fence_ops dma_fence_array_ops;
-
-/**
- * dma_fence_is_array - check if a fence is from the array subsclass
- * @fence: fence to test
- *
- * Return true if it is a dma_fence_array and false otherwise.
- */
-static inline bool dma_fence_is_array(struct dma_fence *fence)
-{
-	return fence->ops == &dma_fence_array_ops;
-}
-
 /**
  * to_dma_fence_array - cast a fence to a dma_fence_array
  * @fence: fence to cast to a dma_fence_array
@@ -68,7 +55,7 @@ static inline bool dma_fence_is_array(struct dma_fence *fence)
 static inline struct dma_fence_array *
 to_dma_fence_array(struct dma_fence *fence)
 {
-	if (fence->ops != &dma_fence_array_ops)
+	if (!fence || !dma_fence_is_array(fence))
 		return NULL;
 
 	return container_of(fence, struct dma_fence_array, base);
diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
index 54fe3443fd2c..ee906b659694 100644
--- a/include/linux/dma-fence-chain.h
+++ b/include/linux/dma-fence-chain.h
@@ -49,7 +49,6 @@ struct dma_fence_chain {
 	spinlock_t lock;
 };
 
-extern const struct dma_fence_ops dma_fence_chain_ops;
 
 /**
  * to_dma_fence_chain - cast a fence to a dma_fence_chain
@@ -61,7 +60,7 @@ extern const struct dma_fence_ops dma_fence_chain_ops;
 static inline struct dma_fence_chain *
 to_dma_fence_chain(struct dma_fence *fence)
 {
-	if (!fence || fence->ops != &dma_fence_chain_ops)
+	if (!fence || !dma_fence_is_chain(fence))
 		return NULL;
 
 	return container_of(fence, struct dma_fence_chain, base);
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 1ea691753bd3..775cdc0b4f24 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -587,4 +587,42 @@ struct dma_fence *dma_fence_get_stub(void);
 struct dma_fence *dma_fence_allocate_private_stub(void);
 u64 dma_fence_context_alloc(unsigned num);
 
+extern const struct dma_fence_ops dma_fence_array_ops;
+extern const struct dma_fence_ops dma_fence_chain_ops;
+
+/**
+ * dma_fence_is_array - check if a fence is from the array subclass
+ * @fence: the fence to test
+ *
+ * Return true if it is a dma_fence_array and false otherwise.
+ */
+static inline bool dma_fence_is_array(struct dma_fence *fence)
+{
+	return fence->ops == &dma_fence_array_ops;
+}
+
+/**
+ * dma_fence_is_chain - check if a fence is from the chain subclass
+ * @fence: the fence to test
+ *
+ * Return true if it is a dma_fence_chain and false otherwise.
+ */
+static inline bool dma_fence_is_chain(struct dma_fence *fence)
+{
+	return fence->ops == &dma_fence_chain_ops;
+}
+
+/**
+ * dma_fence_is_container - check if a fence is a container for other fences
+ * @fence: the fence to test
+ *
+ * Return true if this fence is a container for other fences, false otherwise.
+ * This is important since we can't build up large fence structure or otherwise
+ * we run into recursion during operation on those fences.
+ */
+static inline bool dma_fence_is_container(struct dma_fence *fence)
+{
+	return dma_fence_is_array(fence) || dma_fence_is_chain(fence);
+}
+
 #endif /* __LINUX_DMA_FENCE_H */
-- 
2.25.1

