Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAFA049804F
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 14:03:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242873AbiAXNDh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 08:03:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242869AbiAXNDg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 08:03:36 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A70C06173B
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 05:03:36 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id i2so13460604wrb.12
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 05:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nkHC8QZFOIHT45+bm5mbkRLb4msTxzU2f5F+QSxdoAg=;
        b=T7+N3iUT/tvx0/HroBHPMeE8P01beuEHO5jLeP/wMjXxLkAUimfP4cVdk7IW3px50p
         cARlb7W/5m4Cjr+ptCbaxnuDHgSMk6Nqg6PXHkPvd1CGWLe9ks1SjkXxwP0u/EEfVu/h
         xzIinNMNARHC5HJvsROQaBsiiT41chqJoAsQhQw0P5t0PTyIq4qLyetolwOG8DATZjfc
         54+qV4wvlqhEtueI1eseV1Wc2GCJMle4GwcFNZF3kbLVrH8rT514mwYLs+W2IG7eKKqw
         DXbALz12EBFUNDvRrFQAGiE7ayS5A1ZRrzEL6wrbTgFOvn2e2Ayghj2ydqYyRQVbktQq
         Kuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nkHC8QZFOIHT45+bm5mbkRLb4msTxzU2f5F+QSxdoAg=;
        b=0hRuEFuHFVUUU3YtqPBfGKCGqjUFqq1M6VvAHKZEQVPUEnrS5h9h/t9n7ZX6gTQIUn
         JQ5EmKpS1Qi341wu8uykkhi3jtyEuJrZvquVxP0Ry1MpuME0GlHVWY3ljHB6+ZMxGWI+
         WzOfcfdCWmuoWr/iBMXeWJQQ33w00jEh5uie1gtlbnhJZza5d1QHJtusrGkgwWG4qsqq
         pel/jLQpsm7SBI/j3bvCbghxjswBnnEQzmntqULMzC0Tnv5J/Uypzdq/upgHVphl3LmM
         DB3y7sfjFh5FphFl7wFWqIcMyATakOKB4IwG+qrIeJwvIFAn6jCWW9b4RzkOiJ4ns/zR
         dhhg==
X-Gm-Message-State: AOAM532eaTqIbmfBDTdQA8Jqsl9boKFluU2K3GQ1fuxunFwZl+vdDN0j
        g44hQgYmTrkX8oqO8YPG5SI=
X-Google-Smtp-Source: ABdhPJwszP5PKy5lRXuewCh5csQKxLvCvH5uGeQwuqcGu00xvYDhD0SHw9IA7jKagtr48W1cDQ1sQQ==
X-Received: by 2002:a05:6000:2cc:: with SMTP id o12mr7195807wry.41.1643029414650;
        Mon, 24 Jan 2022 05:03:34 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id g4sm16543554wrd.12.2022.01.24.05.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 05:03:34 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
        gustavo@padovan.org, daniel.vetter@ffwll.ch, zackr@vmware.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org
Subject: [PATCH 03/11] dma-buf: consolidate dma_fence subclass checking
Date:   Mon, 24 Jan 2022 14:03:20 +0100
Message-Id: <20220124130328.2376-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124130328.2376-1-christian.koenig@amd.com>
References: <20220124130328.2376-1-christian.koenig@amd.com>
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

