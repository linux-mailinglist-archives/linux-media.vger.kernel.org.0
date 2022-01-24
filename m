Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7BF0498057
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 14:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242902AbiAXNDn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 08:03:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242893AbiAXNDl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 08:03:41 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9330C06173B
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 05:03:40 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id r14so13457599wrp.2
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 05:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Rx5rKIs1h4pkPPx07vOixo6aKMAm9lXxnCcc7E9V7dU=;
        b=agpo0aI20Xjlb5LL2//pD0GbV+U1CeY3sh3BKQ8aATtQn2oAMdUv28BOM2KR++ik34
         TgwfDY6ZmFaM7ug9NxfdaGD7jU05vaRSd5Z/clAXiwvoc43bEvnDnMqLh5QkBWo5ddn8
         N5sF4M32CcNMNCeEN/sr1aoAVSvleVnG1gzo3NOz6GdXrFUkt0Q2a7uxB+eZZl9Fkn8t
         GN1XaZlV22cL3YD9ieVsNIeKvCQ2yH6rWdhga+zPkxippFHbfW2r2raezl259Voy0IbW
         exs4HwTTtZjFZeq/6z1ZG/a+bqLGq1gaLFH1nYIR/DmkkdPy7Uzm5UpLsOe4k9jPxVpH
         Ihfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rx5rKIs1h4pkPPx07vOixo6aKMAm9lXxnCcc7E9V7dU=;
        b=BR4HC3g/hvth+ZSavGcSX3R2/rO4yqAxp9HyJoRyKm833matnPBzOyhCaSru7oaudO
         fXPt4Dx7MDcRY7qS/XUtODUuuhUWIfjIzZm2V4RAI6TU/fQ2mmITIu7k2ZVDRoxWJ4zm
         KVoM6dpbadyxxbJHnxjD6Zf+W0UG22NhlGOEUqE7xQrgWx7GoGyfuCGwUFGd4NF1xLny
         dBpOU/mE94AKZPvTCWAm+M/Uir9wI+Xb+w9b6B6R586Skvx+e68cGh/dFR4PUv8FJQEP
         5jgIt0bhKtWGjBeOhWeUZkbSf+xHlacEQ9dNUhzmGOGpFPo0xZiQBcTU9+ZO0QwgOg6P
         aGyw==
X-Gm-Message-State: AOAM531hM7c/wxLaBccnQACVv4sdCPeyhti//1ZIFqNiC5b+M6X7rubQ
        18qZbSsj3/fdPQFutCoeEoQ=
X-Google-Smtp-Source: ABdhPJyEtp/3osuhYgoMdqi3Ic7Zn2Xo+CaPn3nXwO9KCGcGih6tMBaEVYQDD3MIUtQRdLE2TfsAlg==
X-Received: by 2002:adf:bb52:: with SMTP id x18mr14451422wrg.319.1643029419531;
        Mon, 24 Jan 2022 05:03:39 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id g4sm16543554wrd.12.2022.01.24.05.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 05:03:39 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
        gustavo@padovan.org, daniel.vetter@ffwll.ch, zackr@vmware.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org
Subject: [PATCH 08/11] dma-buf: add dma_fence_chain_contained helper
Date:   Mon, 24 Jan 2022 14:03:25 +0100
Message-Id: <20220124130328.2376-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124130328.2376-1-christian.koenig@amd.com>
References: <20220124130328.2376-1-christian.koenig@amd.com>
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

