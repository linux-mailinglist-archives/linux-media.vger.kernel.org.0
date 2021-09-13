Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BFEE408C8A
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 15:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240292AbhIMNUX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 09:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238967AbhIMNTs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 09:19:48 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0AB1C0613E0
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:17 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id w29so13883213wra.8
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L5dIDlEb7TduptKFQf5pK4qlvzDeGzLljRLEJA4EwpM=;
        b=pQ5E9nor8DD0+Te1GJVc8/RLM0vudN8sPW+vSHZTJlSAN75M8oPYyYlReH9DfP+HN7
         OPETbwoBgi9lNVMfe3uWkvWE90wm8z9wePHdOOy0P8UkVS7u97K04O9m9zQor7HodNNK
         3WUSjHdQODAz5kj6yr3I4Ggl23wAYe9ivr2JBo/KIkWrvGgi8J0PEDcSXyA/JdQGo4DO
         hv0H5V5NXPMyWggV3yrmBXLrmDfVjEn7eVO4ery2nQXZzVKe+Kv+TpE6aGedJmIN6Cqa
         DJEHk1EgZH7Ubprw4XSrWO/REWryRsuGErChJMlhwJ+LBRP7y9VdZ81Vr1VG8VuzOgyg
         wdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L5dIDlEb7TduptKFQf5pK4qlvzDeGzLljRLEJA4EwpM=;
        b=ZW0dZ7N0V/jMLpciTpob7ziWJn6r6XKFZWVlbRk6EI8YZUJlroxCxWUQBJcCsImlSJ
         pfBDmFJoB8+SC5pHJ0/GycYf8CNkwxHEgUNEBu+DDSe4ax1Z0GxghC6UyB0VIEF6GwVc
         DGq/umBoWFqMvk5Awke5XqgtmnrZZHFDInVnUNRyCQtYE54FwqfQcPtm2bNSJ5lX0fZ3
         hwZnHAE7ZElFgODjaHScANIclBcmsPtuHSHyDXzFK4/9yXfarGLsGtTipPoFZ5bCAJbF
         BqpwkQY34rKVUeSXw9uOJYw5ui04WBfWzCWsUOpAwG8rfjvNYcW2Jc/wo5ecXhBAN/FV
         YrGA==
X-Gm-Message-State: AOAM530qZCWDwRM2JNUwEI2a1zgeB6sj61Z0X8cK8XAL3xwm1wktMjxf
        m9WUWsiKiIkbQU/Dn7CByY0=
X-Google-Smtp-Source: ABdhPJzaQH4KOpbf6GO61yMwP3QETmhZ195CUNktfgLR14D4NqrmOo2KHf2dEVyeFWTRvDbf7nfY/w==
X-Received: by 2002:adf:e745:: with SMTP id c5mr12442991wrn.321.1631539036264;
        Mon, 13 Sep 2021 06:17:16 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id h18sm7602834wrb.33.2021.09.13.06.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:17:15 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
Subject: [PATCH 03/26] dma-buf: use new iterator in dma_resv_copy_fences
Date:   Mon, 13 Sep 2021 15:16:44 +0200
Message-Id: <20210913131707.45639-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes the function much simpler since the complex
retry logic is now handled else where.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 81 +++++++++++++++-----------------------
 1 file changed, 32 insertions(+), 49 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 8cbccaae169d..9a9c0bba772b 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -433,74 +433,57 @@ EXPORT_SYMBOL_GPL(dma_resv_walk_unlocked);
  */
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 {
-	struct dma_resv_list *src_list, *dst_list;
-	struct dma_fence *old, *new;
-	unsigned int i;
+	struct dma_resv_cursor cursor;
+	struct dma_resv_list *list;
+	struct dma_fence *f, *excl;
 
 	dma_resv_assert_held(dst);
 
-	rcu_read_lock();
-	src_list = dma_resv_shared_list(src);
+	list = NULL;
+	excl = NULL;
 
-retry:
-	if (src_list) {
-		unsigned int shared_count = src_list->shared_count;
+	rcu_read_lock();
+	dma_resv_for_each_fence_unlocked(dst, &cursor, true, f) {
 
-		rcu_read_unlock();
+		if (cursor.is_first) {
+			dma_resv_list_free(list);
+			dma_fence_put(excl);
 
-		dst_list = dma_resv_list_alloc(shared_count);
-		if (!dst_list)
-			return -ENOMEM;
+			if (cursor.fences) {
+				unsigned int cnt = cursor.fences->shared_count;
 
-		rcu_read_lock();
-		src_list = dma_resv_shared_list(src);
-		if (!src_list || src_list->shared_count > shared_count) {
-			kfree(dst_list);
-			goto retry;
-		}
+				rcu_read_unlock();
+				list = dma_resv_list_alloc(cnt);
+				if (!list)
+					return -ENOMEM;
 
-		dst_list->shared_count = 0;
-		for (i = 0; i < src_list->shared_count; ++i) {
-			struct dma_fence __rcu **dst;
-			struct dma_fence *fence;
+				list->shared_count = 0;
+				rcu_read_lock();
 
-			fence = rcu_dereference(src_list->shared[i]);
-			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-				     &fence->flags))
-				continue;
-
-			if (!dma_fence_get_rcu(fence)) {
-				dma_resv_list_free(dst_list);
-				src_list = dma_resv_shared_list(src);
-				goto retry;
+			} else {
+				list = NULL;
 			}
+			excl = NULL;
+		}
 
-			if (dma_fence_is_signaled(fence)) {
-				dma_fence_put(fence);
-				continue;
-			}
+		if (cursor.is_exclusive)
+			excl = f;
+		else
+			RCU_INIT_POINTER(list->shared[list->shared_count++], f);
 
-			dst = &dst_list->shared[dst_list->shared_count++];
-			rcu_assign_pointer(*dst, fence);
-		}
-	} else {
-		dst_list = NULL;
+		/* Don't drop the reference */
+		f = NULL;
 	}
 
-	new = dma_fence_get_rcu_safe(&src->fence_excl);
 	rcu_read_unlock();
 
-	src_list = dma_resv_shared_list(dst);
-	old = dma_resv_excl_fence(dst);
-
 	write_seqcount_begin(&dst->seq);
-	/* write_seqcount_begin provides the necessary memory barrier */
-	RCU_INIT_POINTER(dst->fence_excl, new);
-	RCU_INIT_POINTER(dst->fence, dst_list);
+	excl = rcu_replace_pointer(dst->fence_excl, excl, dma_resv_held(dst));
+	list = rcu_replace_pointer(dst->fence, list, dma_resv_held(dst));
 	write_seqcount_end(&dst->seq);
 
-	dma_resv_list_free(src_list);
-	dma_fence_put(old);
+	dma_resv_list_free(list);
+	dma_fence_put(excl);
 
 	return 0;
 }
-- 
2.25.1

