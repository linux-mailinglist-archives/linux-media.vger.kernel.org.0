Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D62249799C
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 08:40:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241831AbiAXHku (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 02:40:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241806AbiAXHkt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 02:40:49 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60CD9C06173B
        for <linux-media@vger.kernel.org>; Sun, 23 Jan 2022 23:40:49 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id v13so11812728wrv.10
        for <linux-media@vger.kernel.org>; Sun, 23 Jan 2022 23:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nkHC8QZFOIHT45+bm5mbkRLb4msTxzU2f5F+QSxdoAg=;
        b=Qj2yBp4MqQ7KNASeGTANOuELaoriQPEus+Y5WG9R1BeNlKfWpoIpNdldl25Dp739sv
         Az06vMnMIfiC9jcFemaGJdxt4ksPV3D8IgfABi+dTcLwDcZqSLP7Vwff05NY1nIIgwB7
         FsEk327TEn7KK6LOlZL9hEkNA5+JAXfVE2iVj5qvBHsgqjzsdkq1s8DqvXnR3vmUCKbR
         sKpTRuGMUEw5CVwsUHzceA0paF3lWmzHi84RljO6OMZlo15XXlrylqjBucdtB8Vnvt92
         6nI85ykpmGtgGonR1HfNg8as0g/v75cbSo+t5WzkOHO4sdrYNuW8HTIb651QRaqtDXTq
         LYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nkHC8QZFOIHT45+bm5mbkRLb4msTxzU2f5F+QSxdoAg=;
        b=zEx0XxV5tGEoqOapuTtZ8wvPhViONm7agnDqLd+cWweHLfElGguN/n2KXyhtwGfaLu
         NktHkAFA5KkxoZ+mYMarfRBZkgVseEqcR5FxoDjVdw73Qqs99Edwcz5O1PjpabF1y8Zo
         mjuCFCzimnEC8oOfO3kXEQAY6zg5RJ4jWxgvDHMTex12TTpf/hl5kqCs9b6Igz1fgr3+
         JqT7YfJlYUDM0g/zj1LHeMmQfhTlldqKJFkbPT6csJlg0n8Haia8yvYtwDeI1LPdr2iz
         1N9LuJ161R1mmuz1yPo5UEk698LFuII5cy9a/RqwKipz1vAdi2OZ5Hs+fB6HYFUdTnJj
         gU6g==
X-Gm-Message-State: AOAM531djZIofnLRyqeA1nO4Q9AXx54AzbmKtuLMxL0k1OgacT4xCYJ1
        BaOQNFMKJgJAr28qq7sqn8E=
X-Google-Smtp-Source: ABdhPJzhRxuEYmrw3Ii07RY11RBs/o/Fq2cYVaEP6QMU32uHoHeBFsvH7w6OILGVbItZxRNvx2es8Q==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr6047282wrd.411.1643010047896;
        Sun, 23 Jan 2022 23:40:47 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id u15sm516370wrs.17.2022.01.23.23.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 23:40:47 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
        gustavo@padovan.org, daniel.vetter@ffwll.ch,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/9] dma-buf: consolidate dma_fence subclass checking
Date:   Mon, 24 Jan 2022 08:40:38 +0100
Message-Id: <20220124074046.4865-1-christian.koenig@amd.com>
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

