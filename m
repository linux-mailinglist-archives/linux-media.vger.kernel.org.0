Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAEAE4144A0
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 11:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234262AbhIVJMY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 05:12:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234200AbhIVJMV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 05:12:21 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16408C061574
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:10:52 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id g16so4726445wrb.3
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hde9qb7LPuwMqk7FJKwIRorynLZ1BAaIyhJS+nYdn8g=;
        b=NYBFhxhavvcUSBaaNZtK71cuCu7OJaTSkmE+DhCVEAQEQ2DBy+B3QySar47s8wsbQI
         fLTgzKQMcYuXhXMEgK0Oqr2S3e6BOCusYhfBVyVcQIwP4aZR0tuqFtKGCOE1ONxONm+/
         IBqGFFBJ4PdNbuYpm7C01b57JXinQylO7A+saf7D04Z63BjNCOAbhaCNPhOzxj32SHQI
         mBKOBBljnPcp2mP2u5RYXpaBstWKg+b7QkFc6pw+6h8TYSFhjKtOz1TMjG7BS5bR9xx4
         5X48sEDAnpsDzE0xSzkWDZjOVpiN+m14Q2AUdJuZ8w4FR/+nZYTSzCkIWfdYNrJxLb5z
         c1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hde9qb7LPuwMqk7FJKwIRorynLZ1BAaIyhJS+nYdn8g=;
        b=49bUYrACP0A/yV2a/3bPPg0H8AGLY5e9CLXkGPHE6RoO8ob7ZzZ/HYq+UsFfvr1Ue2
         bWKRKy1OOM52kbS2ljL2YzgWznOpPdZYLzxLQVSgD577itqmDs9KIgHLGpUXVRHYEKdo
         QKDppWmnlatSFSX5B5N0LJbwXF7R/d7u7jsiV542LJs+5Pbqf41TstQd6mV/61pED5OO
         FxAJxZvYTUrMNqgVXPYRhEcUOJ+JR/6vcb0j4DzKfuITyfKyOpnbTZ4G7IUZwcMgVjtx
         fr7C8pvbGryjLLkq86a6KpTPouQauqViVIEn9op0dkyTO6VFi2UlkJ3Xmlk4SA8d3c8W
         /eTQ==
X-Gm-Message-State: AOAM5302tJesjce/zJNyJ8zW0k9pfreWFl9bWKUQcOarOB8GvtMjP1I8
        ezvHhLoavW8/FiBidiPPF3M=
X-Google-Smtp-Source: ABdhPJzziU2HFBhTJLbMizrTQhHiAESYAz1BvaCuoJOW3+xi6551Sg1f3W1WC0lMd2V9NM7Md8NqZA==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr24027875wrz.29.1632301850679;
        Wed, 22 Sep 2021 02:10:50 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id r25sm1535515wra.76.2021.09.22.02.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 02:10:50 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 04/26] dma-buf: use new iterator in dma_resv_get_fences v2
Date:   Wed, 22 Sep 2021 11:10:22 +0200
Message-Id: <20210922091044.2612-5-christian.koenig@amd.com>
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

v2: use sizeof(void*) instead

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-resv.c | 108 +++++++++++++------------------------
 1 file changed, 36 insertions(+), 72 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 556d5afafe3f..cde97e4e547f 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -530,99 +530,63 @@ EXPORT_SYMBOL(dma_resv_copy_fences);
  * dma_resv_get_fences - Get an object's shared and exclusive
  * fences without update side lock held
  * @obj: the reservation object
- * @pfence_excl: the returned exclusive fence (or NULL)
- * @pshared_count: the number of shared fences returned
- * @pshared: the array of shared fence ptrs returned (array is krealloc'd to
+ * @fence_excl: the returned exclusive fence (or NULL)
+ * @shared_count: the number of shared fences returned
+ * @shared: the array of shared fence ptrs returned (array is krealloc'd to
  * the required size, and must be freed by caller)
  *
  * Retrieve all fences from the reservation object. If the pointer for the
  * exclusive fence is not specified the fence is put into the array of the
  * shared fences as well. Returns either zero or -ENOMEM.
  */
-int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
-			unsigned int *pshared_count,
-			struct dma_fence ***pshared)
+int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **fence_excl,
+			unsigned int *shared_count, struct dma_fence ***shared)
 {
-	struct dma_fence **shared = NULL;
-	struct dma_fence *fence_excl;
-	unsigned int shared_count;
-	int ret = 1;
-
-	do {
-		struct dma_resv_list *fobj;
-		unsigned int i, seq;
-		size_t sz = 0;
-
-		shared_count = i = 0;
-
-		rcu_read_lock();
-		seq = read_seqcount_begin(&obj->seq);
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 
-		fence_excl = dma_resv_excl_fence(obj);
-		if (fence_excl && !dma_fence_get_rcu(fence_excl))
-			goto unlock;
+	*shared_count = 0;
+	*shared = NULL;
 
-		fobj = dma_resv_shared_list(obj);
-		if (fobj)
-			sz += sizeof(*shared) * fobj->shared_max;
+	if (fence_excl)
+		*fence_excl = NULL;
 
-		if (!pfence_excl && fence_excl)
-			sz += sizeof(*shared);
+	dma_resv_iter_begin(&cursor, obj, true);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 
-		if (sz) {
-			struct dma_fence **nshared;
+		if (dma_resv_iter_is_restarted(&cursor)) {
+			unsigned int count;
 
-			nshared = krealloc(shared, sz,
-					   GFP_NOWAIT | __GFP_NOWARN);
-			if (!nshared) {
-				rcu_read_unlock();
+			while (*shared_count)
+				dma_fence_put((*shared)[--(*shared_count)]);
 
-				dma_fence_put(fence_excl);
-				fence_excl = NULL;
+			if (fence_excl)
+				dma_fence_put(*fence_excl);
 
-				nshared = krealloc(shared, sz, GFP_KERNEL);
-				if (nshared) {
-					shared = nshared;
-					continue;
-				}
+			count = cursor.fences ? cursor.fences->shared_count : 0;
+			count += fence_excl ? 0 : 1;
 
-				ret = -ENOMEM;
-				break;
-			}
-			shared = nshared;
-			shared_count = fobj ? fobj->shared_count : 0;
-			for (i = 0; i < shared_count; ++i) {
-				shared[i] = rcu_dereference(fobj->shared[i]);
-				if (!dma_fence_get_rcu(shared[i]))
-					break;
+			/* Eventually re-allocate the array */
+			*shared = krealloc_array(*shared, count,
+						 sizeof(void *),
+						 GFP_KERNEL);
+			if (count && !*shared) {
+				dma_resv_iter_end(&cursor);
+				return -ENOMEM;
 			}
 		}
 
-		if (i != shared_count || read_seqcount_retry(&obj->seq, seq)) {
-			while (i--)
-				dma_fence_put(shared[i]);
-			dma_fence_put(fence_excl);
-			goto unlock;
-		}
-
-		ret = 0;
-unlock:
-		rcu_read_unlock();
-	} while (ret);
-
-	if (pfence_excl)
-		*pfence_excl = fence_excl;
-	else if (fence_excl)
-		shared[shared_count++] = fence_excl;
+		if (dma_resv_iter_is_exclusive(&cursor) && fence_excl)
+			*fence_excl = fence;
+		else
+			(*shared)[(*shared_count)++] = fence;
 
-	if (!shared_count) {
-		kfree(shared);
-		shared = NULL;
+		/* Don't drop the reference */
+		fence = NULL;
 	}
+	dma_resv_iter_end(&cursor);
 
-	*pshared_count = shared_count;
-	*pshared = shared;
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(dma_resv_get_fences);
 
-- 
2.25.1

