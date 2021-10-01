Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B84541EA58
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353355AbhJAKIE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353290AbhJAKIC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:08:02 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F2EC061775
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:06:18 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id m22so9153657wrb.0
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q1qIY7djP00ihPSVoWQA0SIOjmkVpQHX9FfVKyvwxz4=;
        b=mQVBB3YSod034fbpYGnsfEPIgxQOgKLtRNGVt2lW2ZbgOkrcO5ZsjWPYCJ4y/02GEa
         kdO0dBWYjw0w5QXU4T5Iz+zjQmU2d0g9FzrOE7Hf87YzwMFNKAMO4YNY0lcJWQ++VRWE
         cgC8kQHmSpiUoH1pud96q/mLQuyedWQE0iyqD+UCo7MGHW3YwDd+1urkKV6b6QpMKYti
         9t0JR7T+dljAICh8K8OVyL27gWSIj1WFx3hhXCFyVrkO7V0bpzd77Lo8fA6XiJlG7sO8
         qssq9WT/lH03bESs33J3TcX0ckTFkYovUisgXJV9wC+lLJbNBfqOyt4ACVQBxo2/YsgE
         gTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q1qIY7djP00ihPSVoWQA0SIOjmkVpQHX9FfVKyvwxz4=;
        b=P+1ckddO25rxLNyTDgBtzdkNHZbsWsPFZoDCB780ex+j8+6cKcxN6I7B6GnUwCtE01
         RE53ZBxMnXBasJgdQ8QSxj9tjR492vIYFLxjyz/vN1sWtE/A5C9S4YftEi53EH4wZNOB
         YdeY7lUmtRExUANzLLrOeLB7AzYMWxkV9BHu0A2mKFJNWCkw8P2xSWPN130pBtgRpPl7
         wx+sar1F7yz7TutDj8K1LtI7Nleh2A0eB7s9tOMmd7og9jigomRIJhjrHlllzzGtgF1r
         uT5iSSnS8fLJnUa40khVuaOeylwbVmMcjKTPNnSOyH5Gwz6rPFaIpLCsEFipPex5JQhv
         jCBg==
X-Gm-Message-State: AOAM530qRl1piOJR6eznnerxNJVptkKRjgViiYNILeWVeNTkEo/uZzVS
        Rgcwp8x+a6xY3CU2SgWr8lw=
X-Google-Smtp-Source: ABdhPJyqwaAqdUMdBcZACqFhSkKIuhcuAtbkCG8k2pKDV2/8jVkYYA7VIpWyeslTXeS4Hm5EYTzJ5Q==
X-Received: by 2002:adf:aade:: with SMTP id i30mr7433371wrc.384.1633082777188;
        Fri, 01 Oct 2021 03:06:17 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id v17sm5746069wro.34.2021.10.01.03.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 03:06:16 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 04/28] dma-buf: use new iterator in dma_resv_copy_fences
Date:   Fri,  1 Oct 2021 12:05:46 +0200
Message-Id: <20211001100610.2899-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes the function much simpler since the complex
retry logic is now handled else where.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-resv.c | 84 +++++++++++++++-----------------------
 1 file changed, 32 insertions(+), 52 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index a104197d12b5..064972c6bde2 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -478,74 +478,54 @@ EXPORT_SYMBOL_GPL(dma_resv_iter_next);
  */
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 {
-	struct dma_resv_list *src_list, *dst_list;
-	struct dma_fence *old, *new;
-	unsigned int i;
+	struct dma_resv_iter cursor;
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
+	dma_resv_iter_begin(&cursor, src, true);
+	dma_resv_for_each_fence_unlocked(&cursor, f) {
 
-		rcu_read_unlock();
+		if (dma_resv_iter_is_restarted(&cursor)) {
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
-
-		dst_list->shared_count = 0;
-		for (i = 0; i < src_list->shared_count; ++i) {
-			struct dma_fence __rcu **dst;
-			struct dma_fence *fence;
+				list = dma_resv_list_alloc(cnt);
+				if (!list) {
+					dma_resv_iter_end(&cursor);
+					return -ENOMEM;
+				}
 
-			fence = rcu_dereference(src_list->shared[i]);
-			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-				     &fence->flags))
-				continue;
+				list->shared_count = 0;
 
-			if (!dma_fence_get_rcu(fence)) {
-				dma_resv_list_free(dst_list);
-				src_list = dma_resv_shared_list(src);
-				goto retry;
+			} else {
+				list = NULL;
 			}
-
-			if (dma_fence_is_signaled(fence)) {
-				dma_fence_put(fence);
-				continue;
-			}
-
-			dst = &dst_list->shared[dst_list->shared_count++];
-			rcu_assign_pointer(*dst, fence);
+			excl = NULL;
 		}
-	} else {
-		dst_list = NULL;
-	}
 
-	new = dma_fence_get_rcu_safe(&src->fence_excl);
-	rcu_read_unlock();
-
-	src_list = dma_resv_shared_list(dst);
-	old = dma_resv_excl_fence(dst);
+		dma_fence_get(f);
+		if (dma_resv_iter_is_exclusive(&cursor))
+			excl = f;
+		else
+			RCU_INIT_POINTER(list->shared[list->shared_count++], f);
+	}
+	dma_resv_iter_end(&cursor);
 
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

