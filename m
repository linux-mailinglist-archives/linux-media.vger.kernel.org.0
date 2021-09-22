Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8952F4144A3
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 11:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234267AbhIVJMZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 05:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234190AbhIVJMX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 05:12:23 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF61CC061574
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:10:53 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id t8so4780234wri.1
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e1xaTsfCXeko5njaG8B2RhED43a0eg4BazdMvUEhM6I=;
        b=d5lVyioqicgfH7dBoTAc2AyX5B2BNkItSGkUb6UHGPyeis0H+rh+V7alozTyOghTm5
         7lUslSzgbvUFUFyHV9yTn03p6LrmdYDfppea6pmeXXMK/7ulfLg2mHR8lK0PY8BCHTP9
         nJdNhYkwuYqKwNSZPlAwW17yW4IDnbF9abKVWqSyQ5h90YScjjn38NO+QPZHOTTJv0i2
         2FVsJ0xUAsEQ84loEDC7SXzcxqm+I3iK6NHGhgldX893mXhqIFKDCGSLDok965LXKrgU
         qaGsbQuAfmmlsIZuizCcB49yjrbQj7wiHmsK9LAAEilWQDyfuSSNcUrZ9GAijbrnUKd/
         vRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e1xaTsfCXeko5njaG8B2RhED43a0eg4BazdMvUEhM6I=;
        b=ujG2T8pq+kLgYk9uBzxzr7Bgj1ipkN/bS8mZkRLD2ZaC8nljEhm4c4nsAkaQ8VH3ht
         NWfYZJgHwYj9/9zcokT38zWowisMzFCtjArBFSNP6/ZBPctUA8uw2K2X2V14LtdDi9cZ
         8Vk2C4yV1HI4ffWY9FrfEqTSuon8bLcQ6/prcFFLhrh5UuNf8jBU3LuTjj/l/azVz3a+
         8gWqcyj2VoO2tm6bFBxG6dj0nl2zPovgY3PpWv/v3Hf5JLsKh+nPvCoV1I1XY9E3Rh3o
         e4zn+bYlzwMIHO8k2ex4eBdMHixNpoKlj4XIY/H8fg47iC6izJOcztEQRVBRuVY1VyYY
         J0/g==
X-Gm-Message-State: AOAM533nwJqmutqUv1bKE2TEzCPlOsS29dYGjJ69jMcvgGK51Kwb1jD1
        po+cs2JdKpQFh0dGtwLxIM1EBbdWRPg=
X-Google-Smtp-Source: ABdhPJyDDVl/axkhxSQIjqYzAnv9hwypnbX5PzpHFdIDeRD4GHXk++EOyggL7EQUkQCauPDLF70nPw==
X-Received: by 2002:a05:600c:4eca:: with SMTP id g10mr8871144wmq.16.1632301852531;
        Wed, 22 Sep 2021 02:10:52 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id r25sm1535515wra.76.2021.09.22.02.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 02:10:52 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 06/26] dma-buf: use new iterator in dma_resv_test_signaled
Date:   Wed, 22 Sep 2021 11:10:24 +0200
Message-Id: <20210922091044.2612-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes the function much simpler since the complex
retry logic is now handled elsewhere.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-resv.c | 57 +++++---------------------------------
 1 file changed, 7 insertions(+), 50 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index d0e26cd13ecd..fe9b84b308a3 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -627,22 +627,6 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
 
 
-static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
-{
-	struct dma_fence *fence, *lfence = passed_fence;
-	int ret = 1;
-
-	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &lfence->flags)) {
-		fence = dma_fence_get_rcu(lfence);
-		if (!fence)
-			return -1;
-
-		ret = !!dma_fence_is_signaled(fence);
-		dma_fence_put(fence);
-	}
-	return ret;
-}
-
 /**
  * dma_resv_test_signaled - Test if a reservation object's fences have been
  * signaled.
@@ -659,43 +643,16 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
  */
 bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
 {
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	unsigned int seq;
-	int ret;
-
-	rcu_read_lock();
-retry:
-	ret = true;
-	seq = read_seqcount_begin(&obj->seq);
-
-	if (test_all) {
-		struct dma_resv_list *fobj = dma_resv_shared_list(obj);
-		unsigned int i, shared_count;
-
-		shared_count = fobj ? fobj->shared_count : 0;
-		for (i = 0; i < shared_count; ++i) {
-			fence = rcu_dereference(fobj->shared[i]);
-			ret = dma_resv_test_signaled_single(fence);
-			if (ret < 0)
-				goto retry;
-			else if (!ret)
-				break;
-		}
-	}
-
-	fence = dma_resv_excl_fence(obj);
-	if (ret && fence) {
-		ret = dma_resv_test_signaled_single(fence);
-		if (ret < 0)
-			goto retry;
 
+	dma_resv_iter_begin(&cursor, obj, test_all);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		dma_resv_iter_end(&cursor);
+		return false;
 	}
-
-	if (read_seqcount_retry(&obj->seq, seq))
-		goto retry;
-
-	rcu_read_unlock();
-	return ret;
+	dma_resv_iter_end(&cursor);
+	return true;
 }
 EXPORT_SYMBOL_GPL(dma_resv_test_signaled);
 
-- 
2.25.1

