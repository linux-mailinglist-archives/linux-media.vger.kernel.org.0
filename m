Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79D9742251F
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234401AbhJELjn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:39:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234318AbhJELjl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 07:39:41 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4AE6C061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 04:37:50 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id s15so8593539wrv.11
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 04:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ADVhS57c+/GkE4bftpulTNsBWIzwdND+k45HTika4Iw=;
        b=K+VIzMzniJZU/owwllo1bAVsHAUC0XtwomGJQ+mOTouhl4P8Pn+DjdPtHodHX9hkW/
         znbHgCjXWB+XXChVFseAanjm8CmZJih3X2H7D1Nd7POvqvuSAkzIPECorZ2OW6su1+v6
         dJMPkVxjJwYw9W0a8sD36D30ykvvFWAGiB478FaiTb/uIbLB2tncSfUpnuDYFJf64WMk
         sF5MrnKpmonM2dLrc9a8xJqOKg2lCsChJo23ho8cBNuRb3VNdr7lv2z4hnbs04xT0lOS
         moMF6THwCOvomqJnZksbIXhjfy0SbrtaPW7goox3soXlfhHvz9TTEA0/zvmjwvdhzeZa
         f6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ADVhS57c+/GkE4bftpulTNsBWIzwdND+k45HTika4Iw=;
        b=LyGQkHcgtrw8O0wbY3FH8uXkZHmWY8WtE8nB8fazQoTtFndRXBbYH1BpiSHU5Hf2mu
         eYxEODESGtGKwDmXKOv3wPX9dOW9MhWKOkNYwqU1JkRbd1RUjSwXNQikgct0a4x3ekg0
         jS2GZzQVO+LaY45Uhl7t7tx80rP2J78GPKvzib8MlNtSFveW7nDj8mfNSpm5cenTgnC6
         JXM6yIAPSpJqifTAI/YCzD+qApeVSC2YokLWItoh+PS6d1hmYwgB6v3jXEptSgKcJb9D
         x36upafhtEABdOna957RiuZ4JF73Lhc/FrEJZBJ4oOXUpEjTb6Dvf7PSoVecV3075+BC
         zc9Q==
X-Gm-Message-State: AOAM530ZkU4yustBS5W2EAqhImH0lmhg+5QmWob1jZu3nxU42sRElkcG
        Fynom3ag8A9/j05AEwK2GwM=
X-Google-Smtp-Source: ABdhPJyOFhtBorgkT5NlHM3GxBe5ssDhT8cLzxAhKrt5iOfLQPL34ZYFB073VRI3a9wBp2lQeXevXw==
X-Received: by 2002:adf:cd02:: with SMTP id w2mr8333593wrm.358.1633433869507;
        Tue, 05 Oct 2021 04:37:49 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c5sm1739912wml.9.2021.10.05.04.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 04:37:49 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 05/28] dma-buf: use new iterator in dma_resv_get_fences v3
Date:   Tue,  5 Oct 2021 13:37:19 +0200
Message-Id: <20211005113742.1101-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes the function much simpler since the complex
retry logic is now handled elsewhere.

v2: use sizeof(void*) instead
v3: fix rebase bug

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-resv.c | 108 ++++++++++++-------------------------
 1 file changed, 35 insertions(+), 73 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index e5ea42df0c6b..1a43bef03af3 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -538,99 +538,61 @@ EXPORT_SYMBOL(dma_resv_copy_fences);
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
+			/* Eventually re-allocate the array */
+			*shared = krealloc_array(*shared, count,
+						 sizeof(void *),
+						 GFP_KERNEL);
+			if (count && !*shared) {
+				dma_resv_iter_end(&cursor);
+				return -ENOMEM;
 			}
-			shared = nshared;
-			shared_count = fobj ? fobj->shared_count : 0;
-			for (i = 0; i < shared_count; ++i) {
-				shared[i] = rcu_dereference(fobj->shared[i]);
-				if (!dma_fence_get_rcu(shared[i]))
-					break;
-			}
-		}
-
-		if (i != shared_count || read_seqcount_retry(&obj->seq, seq)) {
-			while (i--)
-				dma_fence_put(shared[i]);
-			dma_fence_put(fence_excl);
-			goto unlock;
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
-
-	if (!shared_count) {
-		kfree(shared);
-		shared = NULL;
+		dma_fence_get(fence);
+		if (dma_resv_iter_is_exclusive(&cursor) && fence_excl)
+			*fence_excl = fence;
+		else
+			(*shared)[(*shared_count)++] = fence;
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

