Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFAEA3AB228
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 13:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232450AbhFQLSO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 07:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231661AbhFQLSN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 07:18:13 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78AAAC06175F
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:05 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id i13so3441511edb.9
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lLXrCyq505g6km4qhQf/vGJa05DrxTvpnpKRUMRAvpc=;
        b=XGtZK5xYCuwAprrbgPE1Fy0sborX5AJhSD4DchxUWFwhJ2SAeD/FZQoFzhGUF5EK4c
         AHx/pGcgYZDIuU2x/XELWJRJSvL6UfLPFb6/CttNQmPy1attYnpa1nd/1NXXMdc4ETLt
         3eaCjQ3DslfJSxMD5Wsvydzbx9BZc19E2FSHHhBd8xCN2GRK2UjExVpXJdVI2IKz4XCQ
         NKxkEUXQwc2ZgKXJZOYZrjz+vBfnhXKsjnIXmOtEyI4HbE5uRp9Y4AjFc4uum94ZlniV
         oY9zmjkhtqenbBFr30dnUsLa2Gc+D7fd5uwxOF46u1U9+Quzu1LRiNg+/hHpNjp1M1W9
         bPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lLXrCyq505g6km4qhQf/vGJa05DrxTvpnpKRUMRAvpc=;
        b=J/v10XAHnWHdQwEbMSnjsPGTT8YSVNzknHjOE0BNZUXroTLKZqGO2D2JEB+7kAG2e9
         9pvvRonmxBtlQVZ2NWSL6MG8RsyBC4lGb4g5q2Gf/jcqg44xVJwSLQhIyJkP8yAuWmAs
         XPgK89JjuCWUtc6Yb/a7HTBBQNIKd0Li/P9lUmFQSDpcHpmo/v2YcQtfW/2rvUCBi1pJ
         z69zvcyVlNQ2GszCWYbb9aSntc4l0UwhQBhIBfzyjZ9y6v6eQOYFad22nXagzY244EM5
         L+sIBmWvFEtnZlQbW6ZGYSUVUmHcBG1KEHmHht1bi+TbjwC0XzHhvbFmTitqxn6a2m1G
         G60Q==
X-Gm-Message-State: AOAM532JMgfzgYcPU3+8W+bCwr1fox8nbxI4qRCQrx6fVGtHcY/XcwXS
        Kv8PJ0vDRUnbhe//LA1X1d+62oH7TK8=
X-Google-Smtp-Source: ABdhPJyVkHEfyieNGPqpKK4GumqUK2OI/OWpE8p33ZvKU144WvZIK9enpZidGXxO6/KnBkmIUQGnJQ==
X-Received: by 2002:a50:eb8f:: with SMTP id y15mr5733269edr.285.1623928564138;
        Thu, 17 Jun 2021 04:16:04 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8534:5e76:1ee5:f3ad])
        by smtp.gmail.com with ESMTPSA id y10sm3531353ejm.76.2021.06.17.04.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 04:16:03 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, sumit.semwal@linaro.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Subject: [PATCH 04/16] dma-buf: use new iterator in dma_resv_get_fences
Date:   Thu, 17 Jun 2021 13:15:46 +0200
Message-Id: <20210617111558.28486-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617111558.28486-1-christian.koenig@amd.com>
References: <20210617111558.28486-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes the function much simpler since the complex
retry logic is now handled elsewhere.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 110 +++++++++++++------------------------
 1 file changed, 37 insertions(+), 73 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index a5d78bf401b5..b77bf46c0f48 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -486,99 +486,63 @@ EXPORT_SYMBOL(dma_resv_copy_fences);
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
-
-		fence_excl = dma_resv_excl_fence(obj);
-		if (fence_excl && !dma_fence_get_rcu(fence_excl))
-			goto unlock;
+	struct dma_resv_cursor cursor;
+	struct dma_fence *fence;
 
-		fobj = dma_resv_shared_list(obj);
-		if (fobj)
-			sz += sizeof(*shared) * fobj->shared_max;
+	*shared_count = 0;
+	*shared = NULL;
 
-		if (!pfence_excl && fence_excl)
-			sz += sizeof(*shared);
+	if (fence_excl)
+		*fence_excl = NULL;
 
-		if (sz) {
-			struct dma_fence **nshared;
+	rcu_read_lock();
+	dma_resv_for_each_fence_unlocked(obj, &cursor, true, fence) {
 
-			nshared = krealloc(shared, sz,
-					   GFP_NOWAIT | __GFP_NOWARN);
-			if (!nshared) {
-				rcu_read_unlock();
+		if (cursor.is_first) {
+			unsigned int count;
 
-				dma_fence_put(fence_excl);
-				fence_excl = NULL;
+			while (*shared_count)
+				dma_fence_put((*shared)[--(*shared_count)]);
 
-				nshared = krealloc(shared, sz, GFP_KERNEL);
-				if (nshared) {
-					shared = nshared;
-					continue;
-				}
+			if (fence_excl)
+				dma_fence_put(*fence_excl);
 
-				ret = -ENOMEM;
-				break;
-			}
-			shared = nshared;
-			shared_count = fobj ? fobj->shared_count : 0;
-			for (i = 0; i < shared_count; ++i) {
-				shared[i] = rcu_dereference(fobj->shared[i]);
-				if (!dma_fence_get_rcu(shared[i]))
-					break;
-			}
-		}
+			count = cursor.fences ? cursor.fences->shared_count : 0;
+			count += fence_excl ? 0 : 1;
+			rcu_read_unlock();
 
-		if (i != shared_count || read_seqcount_retry(&obj->seq, seq)) {
-			while (i--)
-				dma_fence_put(shared[i]);
-			dma_fence_put(fence_excl);
-			goto unlock;
+			/* Eventually re-allocate the array */
+			*shared = krealloc_array(*shared, count,
+						 sizeof(*shared),
+						 GFP_KERNEL);
+			if (count && !*shared)
+				return -ENOMEM;
+			rcu_read_lock();
 		}
 
-		ret = 0;
-unlock:
-		rcu_read_unlock();
-	} while (ret);
-
-	if (pfence_excl)
-		*pfence_excl = fence_excl;
-	else if (fence_excl)
-		shared[shared_count++] = fence_excl;
+		if (cursor.is_exclusive && fence_excl)
+			*fence_excl = fence;
+		else
+			(*shared)[(*shared_count)++] = fence;
 
-	if (!shared_count) {
-		kfree(shared);
-		shared = NULL;
+		/* Don't drop the reference */
+		fence = NULL;
 	}
+	rcu_read_unlock();
 
-	*pshared_count = shared_count;
-	*pshared = shared;
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(dma_resv_get_fences);
 
-- 
2.25.1

