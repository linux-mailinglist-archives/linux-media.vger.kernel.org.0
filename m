Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 959D34979A2
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 08:40:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241902AbiAXHky (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 02:40:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235988AbiAXHkx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 02:40:53 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DD73C06173B
        for <linux-media@vger.kernel.org>; Sun, 23 Jan 2022 23:40:53 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id r22so4193736wra.8
        for <linux-media@vger.kernel.org>; Sun, 23 Jan 2022 23:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Rx5rKIs1h4pkPPx07vOixo6aKMAm9lXxnCcc7E9V7dU=;
        b=dH5sM5ldW3QMoO003IFYaAB598warM4tFOgMpkiy7HjUkEiLWT661aYTZvtyjFvlIC
         p2tArPmx5Ku4JKfUH15rUgXfqFJJdviqXadBtxmEZXL5WABRHkGmZpWA/sPYG8USXPDK
         ahuVcKfjH122XozbZodfY9LBAEVak5BlTNvw7aWIG4WRH5WPx0AI6PqeC41KuBChN1Cy
         tMOs/9Vx1vVBR/xXanhtVaSWvHaBH8s/qbFFC8FhnzfjuG36j0Vw0GFYLt2KqsT1Xf9u
         emO9f+DHsWSaCK7cvOc77OVcweaX+2VUaAymv5LDat8bf9t/6v6jEIHneYIs01tpGDn+
         nbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rx5rKIs1h4pkPPx07vOixo6aKMAm9lXxnCcc7E9V7dU=;
        b=nfQO/yhWBXkEQNEisSY0doxfxgK168/QBmvc0awpxm9VTRoJjDUnbRPUEkd5SECGvm
         cqtIQzCAegPO6UoDvLD2xw0ywYqWGEmCw8pbrdyV3cHKsgE4Ya7PgpAuSbYoIaxq49+i
         sH5qLajAjLzxmV+pGgW/96jVVy7dcqfnfc0vqwiCfgwltsWo0uf6yoNPyijlO1RK8Fql
         sZxk3r/Use3QZFe5WuiG5pq2ABIFW4IMfDc59l/b5aeV8M/sgXc2+xVZ558fchcxkKgY
         0rciNdw882vBW/wgIlgsY/RRPu6j6CdD6SnT3K3PzgwY9oARopz5LUnHA2ioId1e7HkX
         6aow==
X-Gm-Message-State: AOAM531M5LrusrpW3WdbufgTmk7ENS/OBsTjxPdBL7bQw/PaWb5LQcUg
        0uINfVdX7sBZiZKFlVeq4/0=
X-Google-Smtp-Source: ABdhPJzUXuu+U7lDxd6QtCBjJhL/Nn1issoTdOPgnREM6UtyKIt6NhHGaoe1OvEjjHrM5pUcUipgkA==
X-Received: by 2002:adf:f5c2:: with SMTP id k2mr13012175wrp.669.1643010051987;
        Sun, 23 Jan 2022 23:40:51 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id u15sm516370wrs.17.2022.01.23.23.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 23:40:51 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
        gustavo@padovan.org, daniel.vetter@ffwll.ch,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 6/9] dma-buf: add dma_fence_chain_contained helper
Date:   Mon, 24 Jan 2022 08:40:43 +0100
Message-Id: <20220124074046.4865-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124074046.4865-1-christian.koenig@amd.com>
References: <20220124074046.4865-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's a reoccurring pattern that we need to extract the fence
from a dma_fence_chain object. Add a helper for this.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-chain.c |  6 ++----
 include/linux/dma-fence-chain.h   | 15 +++++++++++++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 084c6927b735..06f8ef97c6e8 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -148,8 +148,7 @@ static bool dma_fence_chain_enable_signaling(struct dma_fence *fence)
 
 	dma_fence_get(&head->base);
 	dma_fence_chain_for_each(fence, &head->base) {
-		struct dma_fence_chain *chain = to_dma_fence_chain(fence);
-		struct dma_fence *f = chain ? chain->fence : fence;
+		struct dma_fence *f = dma_fence_chain_contained(fence);
 
 		dma_fence_get(f);
 		if (!dma_fence_add_callback(f, &head->cb, dma_fence_chain_cb)) {
@@ -165,8 +164,7 @@ static bool dma_fence_chain_enable_signaling(struct dma_fence *fence)
 static bool dma_fence_chain_signaled(struct dma_fence *fence)
 {
 	dma_fence_chain_for_each(fence, fence) {
-		struct dma_fence_chain *chain = to_dma_fence_chain(fence);
-		struct dma_fence *f = chain ? chain->fence : fence;
+		struct dma_fence *f = dma_fence_chain_contained(fence);
 
 		if (!dma_fence_is_signaled(f)) {
 			dma_fence_put(fence);
diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
index ee906b659694..10d51bcdf7b7 100644
--- a/include/linux/dma-fence-chain.h
+++ b/include/linux/dma-fence-chain.h
@@ -66,6 +66,21 @@ to_dma_fence_chain(struct dma_fence *fence)
 	return container_of(fence, struct dma_fence_chain, base);
 }
 
+/**
+ * dma_fence_chain_contained - return the contained fence
+ * @fence: the fence to test
+ *
+ * If the fence is a dma_fence_chain the function returns the fence contained
+ * inside the chain object, otherwise it returns the fence itself.
+ */
+static inline struct dma_fence *
+dma_fence_chain_contained(struct dma_fence *fence)
+{
+	struct dma_fence_chain *chain = to_dma_fence_chain(fence);
+
+	return chain ? chain->fence : fence;
+}
+
 /**
  * dma_fence_chain_alloc
  *
-- 
2.25.1

