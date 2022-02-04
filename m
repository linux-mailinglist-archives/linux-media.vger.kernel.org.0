Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A2184A9762
	for <lists+linux-media@lfdr.de>; Fri,  4 Feb 2022 11:04:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358101AbiBDKEk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Feb 2022 05:04:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351114AbiBDKEj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Feb 2022 05:04:39 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B11AC06173D
        for <linux-media@vger.kernel.org>; Fri,  4 Feb 2022 02:04:39 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id w20so8105686edc.1
        for <linux-media@vger.kernel.org>; Fri, 04 Feb 2022 02:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nkHC8QZFOIHT45+bm5mbkRLb4msTxzU2f5F+QSxdoAg=;
        b=aO5j1vpxduryKd+RGFIMJ30cU/mPsvp7GMzZS70owa2r9v428jzlHLLim5ZOiSaR4S
         1jxu3wimsgT80a917+7M7LK/PiksuSe8drUzAyHPuSbAfFb2oCBm5GbNfVV3WFg18ksj
         lOT2STj2CV6uTuxa4GUPytFqtmhrQN5vsHlTjBsvWBTnfOoom/kjURw+rdKXdKDWDqMj
         fV5MuBmnGAA1ktoRysUY8+HGWJCYKeX3z7Dx8/ZkB1esdCld2lrenLqTIaFVeCT14mwJ
         dtZQ5wCBf0fp2k1quk8MBMVj/eidysWQIPx9tQUsA+elnVn3R0Z2bWA+A/97b7mI12gK
         n5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nkHC8QZFOIHT45+bm5mbkRLb4msTxzU2f5F+QSxdoAg=;
        b=KsflVV/YqrDEhkk6WwTLgJ+9/ZuaWc1EhyJ/R4Dm33eIdoOD6LR3iU7vqU1kzi5GIS
         YHTpTfCUvWLHVovrZ/YFX6c8HxvI65qd06BzQQ/734iIItTzx42cI5HoEaMF4S7Yhfyl
         yapvQjbEinMq55u+o717i/YrUQTnlFVerWtYeAd9akukuGEQNmPcgYxKNQvb8a9j2KrR
         TFO4aiSlTt7qDrfYZM5iro1WccJGeBZXJa6M87G8tcn4xLY3vmxTNwv3Dh7U3thPImUD
         0kB6fRqLQAQepfjEbnmpnaMmkn/0cvlMbChFY6qX8rj4Cl7qx82SqxyghxlY6ZqccvYx
         0hHw==
X-Gm-Message-State: AOAM530z2/pDqKIoXweMr5I+Zsf0KF6JjIt48DR7lu8Nklz6m9S7LN+f
        tsLHGMaX2+5oN2x3MGNgF/8=
X-Google-Smtp-Source: ABdhPJxZcJbhLtg6luNVPToQ3qurqMzcy+Lv2Uyi2KzW6Ius5EGVvfWD4cLsYJJ9yMg4UmDiqQ81qQ==
X-Received: by 2002:aa7:db8f:: with SMTP id u15mr2316386edt.36.1643969077869;
        Fri, 04 Feb 2022 02:04:37 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id z10sm633943edl.54.2022.02.04.02.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 02:04:37 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, thomas.hellstrom@linux.intel.com,
        daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/6] dma-buf: consolidate dma_fence subclass checking
Date:   Fri,  4 Feb 2022 11:04:24 +0100
Message-Id: <20220204100429.2049-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204100429.2049-1-christian.koenig@amd.com>
References: <20220204100429.2049-1-christian.koenig@amd.com>
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

