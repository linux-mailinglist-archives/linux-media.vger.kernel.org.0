Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42B7494EF2
	for <lists+linux-media@lfdr.de>; Thu, 20 Jan 2022 14:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235764AbiATN15 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jan 2022 08:27:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235686AbiATN14 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jan 2022 08:27:56 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1BABC061574
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 05:27:55 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id e9-20020a05600c4e4900b0034d23cae3f0so13749372wmq.2
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 05:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ghsh9/gm33rniIPEwr7l+FWRFmTMwqMlUglC1RcFNYM=;
        b=l9bMzzsltwI9qHdtR3h1sE2seoLlRX+iS78U8FCM5kfNIzk3VpvzRl8E0OmKV8tqDV
         NBiM7ZQVyCCglQ9+zO/JjqCw+y/n0WztmO0SmCejd/lcoALSAMZ1RJRo9B/xFZ/URSde
         J/8qLgvCjtjh9YEer9VMfIA4sx2vKgg77xBfCW6xf7tElFFsI4dkLced3Aj+pkGFDQA6
         Gv7ju3dVonZi/eXjUb0p/bghR1o0DDYX5B3AuwNppeGYjcuU0k9S+aW7KgS/AVZxHtxq
         orw0Z9T0ku9Rv1khXRgVMHEXjSwSJWl08exwEHLcnS36pLsKlUQXuEg20exeBOERpYFR
         Wq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ghsh9/gm33rniIPEwr7l+FWRFmTMwqMlUglC1RcFNYM=;
        b=AhWXyHpq5AWqhQW1JiUL1VPgq9XkHQtitIjtzvQL43M01ZDpyndO+Ib6N/nxONHm70
         iplaEUDgVLszYUnBfqeFjQHRIR9KiiJmELCcbs40vMyJICbUWypy+7d7z6TbyVd4V/d8
         7Vh2RAaeOpx1Z5YnpCyiSOU58Rg8Ym8X+GD8CUqHGzscIdZ8KEzwQqFx+B7J7THuTB6l
         DChXiSJKZ40wyCLVUwWPCf/fxcB2+nRRN/XmeAU+aG4fh73WrYkmko7ISgr2El34cxL0
         EeSVyhPNKSP7sPf/cWDMWWNhuiunN45xwvfer29eNzkPPWkF7bZ5OGmsMG0ezCxGMuqE
         ENig==
X-Gm-Message-State: AOAM5324JaeBkuOnfLJMQm1hoOVkUMTZE1PgDQpfgjrBP3Wol4fDubhz
        FUbTZ4mXU8vo3cPGwf7UWp4=
X-Google-Smtp-Source: ABdhPJwXUxckT/W7J0tLFbMv8MZBiii1SASzIMTUKx/rLqxRPLSuyHNljTcZjW00hHa7S/75UwnYcQ==
X-Received: by 2002:a1c:9ace:: with SMTP id c197mr8899037wme.163.1642685274323;
        Thu, 20 Jan 2022 05:27:54 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id a9sm2658454wmm.32.2022.01.20.05.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 05:27:53 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 6/9] dma-buf: add dma_fence_chain_contained helper
Date:   Thu, 20 Jan 2022 14:27:44 +0100
Message-Id: <20220120132747.2348-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120132747.2348-1-christian.koenig@amd.com>
References: <20220120132747.2348-1-christian.koenig@amd.com>
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
index fa33f6b7f77b..2f497ffb70d8 100644
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

