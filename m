Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A2A0310659
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 09:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbhBEIK7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 03:10:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbhBEIHy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 03:07:54 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18C31C0617A9
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 00:06:33 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id g15so3983851pgu.9
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 00:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p+kRePWB5W5trhue+IG8eMT/JEK8NosX0hZykvGBiDc=;
        b=lX9KDrFOyf4mmKHoTR9pFnv7VxYUXhGbaO7HhCnhN0vp0Wy7JNRAq2lhCPA0I0plyl
         oG2LLiKjbJzE8kwWpuR0LD/wsJPKlxioHcbeZk/j9agRSkccHUUgkfBFWoruy4XouWIK
         otHDtW/6Qq5P9KYmk+aHJ59x0iWTOwqNaBHfRDvHYkDxqhPs1s92ReMvamLYlL3U07z5
         CzV95v/X2y7uvQpRf4t0lAiy1oqgNnnS1smzYz8JK8zLp5fEJypZXPnbNDW+hX+aMqKj
         ENzM+umRBm2zpBwkBXKxAi3fRhCxqCaA32t6AU/bvQ+XXN+5nJQspxeaSWtBb3ZFOXLc
         g0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p+kRePWB5W5trhue+IG8eMT/JEK8NosX0hZykvGBiDc=;
        b=jGIYGPF/qhOZgM6RmsKQoq0oT4xf9dc3OlQ+LaFCDYAyq+iMwb7lORXeG0KAQ88oT5
         CQZZKrGHdC5G0ATBA5KjrS+oP6xpbomPnzfiGmoEJAIuHsbQhrd7dV/5AuF4tcmDYBx5
         yPNigNJ44JJ02pukG+SLOc6wLzKuQgWG5NsDL55am2TnQ7NSBBDR4jbXtjKsLgRHkpNW
         XscsTwYLlgVbV3V9yBn3o5KpnjypqSbVrKQNAmIAfWS+4mcPjEp69tOvGBJurwX8w7fq
         ZekmUwr8jF62c32QPw12T5QUc0KUcLxb8mN0KFDa38rLWNbJRSdfB4r76+VHoLoZKsAr
         cuSg==
X-Gm-Message-State: AOAM533rnmPZoJwxfGOyVCu79hNH5lZ8czCFla+MFNx1VpFQcmDkp9eu
        mLerO6ihEw7zX/hhG/LrbRZhhg==
X-Google-Smtp-Source: ABdhPJz6EdUhticEW2ZVaijZbkearTjvVyxpZU18tPWPNOV5zZTvDaAg2fub0hYD8CmJA7ggEkdcxA==
X-Received: by 2002:aa7:9981:0:b029:1d4:2f7b:e0d with SMTP id k1-20020aa799810000b02901d42f7b0e0dmr3344895pfh.10.1612512392648;
        Fri, 05 Feb 2021 00:06:32 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id 32sm9520070pgq.80.2021.02.05.00.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 00:06:31 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Christian Koenig <christian.koenig@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [RFC][PATCH v6 4/7] drm: ttm_pool: Rework ttm_pool to use drm_page_pool
Date:   Fri,  5 Feb 2021 08:06:18 +0000
Message-Id: <20210205080621.3102035-5-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205080621.3102035-1-john.stultz@linaro.org>
References: <20210205080621.3102035-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch reworks the ttm_pool logic to utilize the recently
added drm_page_pool code.

Basically all the ttm_pool_type structures are replaced with
drm_page_pool pointers, and since the drm_page_pool logic has
its own shrinker, we can remove all of the ttm_pool shrinker
logic.

NOTE: There is one mismatch in the interfaces I'm not totally
happy with. The ttm_pool tracks all of its pooled pages across
a number of different pools, and tries to keep this size under
the specified page_pool_size value. With the drm_page_pool,
there may other users, however there is still one global
shrinker list of pools. So we can't easily reduce the ttm
pool under the ttm specified size without potentially doing
a lot of shrinking to other non-ttm pools. So either we can:
  1) Try to split it so each user of drm_page_pools manages its
     own pool shrinking.
  2) Push the max value into the drm_page_pool, and have it
     manage shrinking to fit under that global max. Then share
     those size/max values out so the ttm_pool debug output
     can have more context.

I've taken the second path in this patch set, but wanted to call
it out so folks could look closely.

Thoughts would be greatly appreciated here!

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Daniel Mentz <danielmentz@google.com>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/gpu/drm/Kconfig        |   1 +
 drivers/gpu/drm/ttm/ttm_pool.c | 199 +++++++--------------------------
 include/drm/ttm/ttm_pool.h     |  23 +---
 3 files changed, 41 insertions(+), 182 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index d16bf340ed2e..d427abefabfb 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -181,6 +181,7 @@ config DRM_PAGE_POOL
 config DRM_TTM
 	tristate
 	depends on DRM && MMU
+	select DRM_PAGE_POOL
 	help
 	  GPU memory management subsystem for devices with multiple
 	  GPU memory types. Will be enabled automatically if a device driver
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index eca36678f967..dbbaf55ca5df 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -37,6 +37,7 @@
 #ifdef CONFIG_X86
 #include <asm/set_memory.h>
 #endif
+#include <drm/page_pool.h>
 #include <drm/ttm/ttm_pool.h>
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_tt.h>
@@ -63,15 +64,13 @@ module_param(page_pool_size, ulong, 0644);
 
 static atomic_long_t allocated_pages;
 
-static struct ttm_pool_type global_write_combined[MAX_ORDER];
-static struct ttm_pool_type global_uncached[MAX_ORDER];
+static struct drm_page_pool *global_write_combined[MAX_ORDER];
+static struct drm_page_pool *global_uncached[MAX_ORDER];
 
-static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
-static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
+static struct drm_page_pool *global_dma32_write_combined[MAX_ORDER];
+static struct drm_page_pool *global_dma32_uncached[MAX_ORDER];
 
 static struct mutex shrinker_lock;
-static struct list_head shrinker_list;
-static struct shrinker mm_shrinker;
 
 /* Allocate pages of size 1 << order with the given gfp_flags */
 static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
@@ -223,79 +222,26 @@ static void ttm_pool_unmap(struct ttm_pool *pool, dma_addr_t dma_addr,
 		       DMA_BIDIRECTIONAL);
 }
 
-/* Give pages into a specific pool_type */
-static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
-{
-	spin_lock(&pt->lock);
-	list_add(&p->lru, &pt->pages);
-	spin_unlock(&pt->lock);
-	atomic_long_add(1 << pt->order, &allocated_pages);
-}
-
-/* Take pages from a specific pool_type, return NULL when nothing available */
-static struct page *ttm_pool_type_take(struct ttm_pool_type *pt)
-{
-	struct page *p;
-
-	spin_lock(&pt->lock);
-	p = list_first_entry_or_null(&pt->pages, typeof(*p), lru);
-	if (p) {
-		atomic_long_sub(1 << pt->order, &allocated_pages);
-		list_del(&p->lru);
-	}
-	spin_unlock(&pt->lock);
-
-	return p;
-}
-
-/* Initialize and add a pool type to the global shrinker list */
-static void ttm_pool_type_init(struct ttm_pool_type *pt, struct ttm_pool *pool,
-			       enum ttm_caching caching, unsigned int order)
-{
-	pt->pool = pool;
-	pt->caching = caching;
-	pt->order = order;
-	spin_lock_init(&pt->lock);
-	INIT_LIST_HEAD(&pt->pages);
-
-	mutex_lock(&shrinker_lock);
-	list_add_tail(&pt->shrinker_list, &shrinker_list);
-	mutex_unlock(&shrinker_lock);
-}
-
-/* Remove a pool_type from the global shrinker list and free all pages */
-static void ttm_pool_type_fini(struct ttm_pool_type *pt)
-{
-	struct page *p, *tmp;
-
-	mutex_lock(&shrinker_lock);
-	list_del(&pt->shrinker_list);
-	mutex_unlock(&shrinker_lock);
-
-	list_for_each_entry_safe(p, tmp, &pt->pages, lru)
-		ttm_pool_free_page(p, pt->order);
-}
-
 /* Return the pool_type to use for the given caching and order */
-static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
+static struct drm_page_pool *ttm_pool_select_type(struct ttm_pool *pool,
 						  enum ttm_caching caching,
 						  unsigned int order)
 {
 	if (pool->use_dma_alloc)
-		return &pool->caching[caching].orders[order];
+		return pool->caching[caching].orders[order];
 
 #ifdef CONFIG_X86
 	switch (caching) {
 	case ttm_write_combined:
 		if (pool->use_dma32)
-			return &global_dma32_write_combined[order];
+			return global_dma32_write_combined[order];
 
-		return &global_write_combined[order];
+		return global_write_combined[order];
 	case ttm_uncached:
 		if (pool->use_dma32)
-			return &global_dma32_uncached[order];
+			return global_dma32_uncached[order];
 
-		return &global_uncached[order];
+		return global_uncached[order];
 	default:
 		break;
 	}
@@ -304,30 +250,6 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
 	return NULL;
 }
 
-/* Free pages using the global shrinker list */
-static unsigned int ttm_pool_shrink(void)
-{
-	struct ttm_pool_type *pt;
-	unsigned int num_freed;
-	struct page *p;
-
-	mutex_lock(&shrinker_lock);
-	pt = list_first_entry(&shrinker_list, typeof(*pt), shrinker_list);
-
-	p = ttm_pool_type_take(pt);
-	if (p) {
-		ttm_pool_free_page(p, pt->order);
-		num_freed = 1 << pt->order;
-	} else {
-		num_freed = 0;
-	}
-
-	list_move_tail(&pt->shrinker_list, &shrinker_list);
-	mutex_unlock(&shrinker_lock);
-
-	return num_freed;
-}
-
 /* Return the allocation order based for a page */
 static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
 {
@@ -377,10 +299,10 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 	for (order = min(MAX_ORDER - 1UL, __fls(num_pages)); num_pages;
 	     order = min_t(unsigned int, order, __fls(num_pages))) {
 		bool apply_caching = false;
-		struct ttm_pool_type *pt;
+		struct drm_page_pool *pt;
 
 		pt = ttm_pool_select_type(pool, tt->caching, order);
-		p = pt ? ttm_pool_type_take(pt) : NULL;
+		p = pt ? drm_page_pool_fetch(pt) : NULL;
 		if (p) {
 			apply_caching = true;
 		} else {
@@ -462,7 +384,7 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
 	for (i = 0; i < tt->num_pages; ) {
 		struct page *p = tt->pages[i];
 		unsigned int order, num_pages;
-		struct ttm_pool_type *pt;
+		struct drm_page_pool *pt;
 
 		order = ttm_pool_page_order(pool, p);
 		num_pages = 1ULL << order;
@@ -473,15 +395,12 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
 
 		pt = ttm_pool_select_type(pool, tt->caching, order);
 		if (pt)
-			ttm_pool_type_give(pt, tt->pages[i]);
+			drm_page_pool_add(pt, tt->pages[i]);
 		else
 			ttm_pool_free_page(tt->pages[i], order);
 
 		i += num_pages;
 	}
-
-	while (atomic_long_read(&allocated_pages) > page_pool_size)
-		ttm_pool_shrink();
 }
 EXPORT_SYMBOL(ttm_pool_free);
 
@@ -508,8 +427,8 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
 
 	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
 		for (j = 0; j < MAX_ORDER; ++j)
-			ttm_pool_type_init(&pool->caching[i].orders[j],
-					   pool, i, j);
+			pool->caching[i].orders[j] = drm_page_pool_create(j,
+							ttm_pool_free_page);
 }
 
 /**
@@ -526,33 +445,18 @@ void ttm_pool_fini(struct ttm_pool *pool)
 
 	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
 		for (j = 0; j < MAX_ORDER; ++j)
-			ttm_pool_type_fini(&pool->caching[i].orders[j]);
+			drm_page_pool_destroy(pool->caching[i].orders[j]);
 }
 
 #ifdef CONFIG_DEBUG_FS
-/* Count the number of pages available in a pool_type */
-static unsigned int ttm_pool_type_count(struct ttm_pool_type *pt)
-{
-	unsigned int count = 0;
-	struct page *p;
-
-	spin_lock(&pt->lock);
-	/* Only used for debugfs, the overhead doesn't matter */
-	list_for_each_entry(p, &pt->pages, lru)
-		++count;
-	spin_unlock(&pt->lock);
-
-	return count;
-}
-
 /* Dump information about the different pool types */
-static void ttm_pool_debugfs_orders(struct ttm_pool_type *pt,
+static void ttm_pool_debugfs_orders(struct drm_page_pool **pt,
 				    struct seq_file *m)
 {
 	unsigned int i;
 
 	for (i = 0; i < MAX_ORDER; ++i)
-		seq_printf(m, " %8u", ttm_pool_type_count(&pt[i]));
+		seq_printf(m, " %8u", drm_page_pool_get_size(pt[i]));
 	seq_puts(m, "\n");
 }
 
@@ -602,7 +506,10 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
 	}
 
 	seq_printf(m, "\ntotal\t: %8lu of %8lu\n",
-		   atomic_long_read(&allocated_pages), page_pool_size);
+		   atomic_long_read(&allocated_pages),
+		   drm_page_pool_get_max());
+	seq_printf(m, "(%8lu in non-ttm pools)\n", drm_page_pool_get_total() -
+					atomic_long_read(&allocated_pages));
 
 	mutex_unlock(&shrinker_lock);
 
@@ -612,28 +519,6 @@ EXPORT_SYMBOL(ttm_pool_debugfs);
 
 #endif
 
-/* As long as pages are available make sure to release at least one */
-static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
-					    struct shrink_control *sc)
-{
-	unsigned long num_freed = 0;
-
-	do
-		num_freed += ttm_pool_shrink();
-	while (!num_freed && atomic_long_read(&allocated_pages));
-
-	return num_freed;
-}
-
-/* Return the number of pages available or SHRINK_EMPTY if we have none */
-static unsigned long ttm_pool_shrinker_count(struct shrinker *shrink,
-					     struct shrink_control *sc)
-{
-	unsigned long num_pages = atomic_long_read(&allocated_pages);
-
-	return num_pages ? num_pages : SHRINK_EMPTY;
-}
-
 /**
  * ttm_pool_mgr_init - Initialize globals
  *
@@ -648,24 +533,21 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 	if (!page_pool_size)
 		page_pool_size = num_pages;
 
+	drm_page_pool_set_max(page_pool_size);
+
 	mutex_init(&shrinker_lock);
-	INIT_LIST_HEAD(&shrinker_list);
 
 	for (i = 0; i < MAX_ORDER; ++i) {
-		ttm_pool_type_init(&global_write_combined[i], NULL,
-				   ttm_write_combined, i);
-		ttm_pool_type_init(&global_uncached[i], NULL, ttm_uncached, i);
-
-		ttm_pool_type_init(&global_dma32_write_combined[i], NULL,
-				   ttm_write_combined, i);
-		ttm_pool_type_init(&global_dma32_uncached[i], NULL,
-				   ttm_uncached, i);
+		global_write_combined[i] = drm_page_pool_create(i,
+							ttm_pool_free_page);
+		global_uncached[i] = drm_page_pool_create(i,
+							ttm_pool_free_page);
+		global_dma32_write_combined[i] = drm_page_pool_create(i,
+							ttm_pool_free_page);
+		global_dma32_uncached[i] = drm_page_pool_create(i,
+							ttm_pool_free_page);
 	}
-
-	mm_shrinker.count_objects = ttm_pool_shrinker_count;
-	mm_shrinker.scan_objects = ttm_pool_shrinker_scan;
-	mm_shrinker.seeks = 1;
-	return register_shrinker(&mm_shrinker);
+	return 0;
 }
 
 /**
@@ -678,13 +560,10 @@ void ttm_pool_mgr_fini(void)
 	unsigned int i;
 
 	for (i = 0; i < MAX_ORDER; ++i) {
-		ttm_pool_type_fini(&global_write_combined[i]);
-		ttm_pool_type_fini(&global_uncached[i]);
+		drm_page_pool_destroy(global_write_combined[i]);
+		drm_page_pool_destroy(global_uncached[i]);
 
-		ttm_pool_type_fini(&global_dma32_write_combined[i]);
-		ttm_pool_type_fini(&global_dma32_uncached[i]);
+		drm_page_pool_destroy(global_dma32_write_combined[i]);
+		drm_page_pool_destroy(global_dma32_uncached[i]);
 	}
-
-	unregister_shrinker(&mm_shrinker);
-	WARN_ON(!list_empty(&shrinker_list));
 }
diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
index 4321728bdd11..460ab232fd22 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -36,27 +36,6 @@ struct ttm_tt;
 struct ttm_pool;
 struct ttm_operation_ctx;
 
-/**
- * ttm_pool_type - Pool for a certain memory type
- *
- * @pool: the pool we belong to, might be NULL for the global ones
- * @order: the allocation order our pages have
- * @caching: the caching type our pages have
- * @shrinker_list: our place on the global shrinker list
- * @lock: protection of the page list
- * @pages: the list of pages in the pool
- */
-struct ttm_pool_type {
-	struct ttm_pool *pool;
-	unsigned int order;
-	enum ttm_caching caching;
-
-	struct list_head shrinker_list;
-
-	spinlock_t lock;
-	struct list_head pages;
-};
-
 /**
  * ttm_pool - Pool for all caching and orders
  *
@@ -71,7 +50,7 @@ struct ttm_pool {
 	bool use_dma32;
 
 	struct {
-		struct ttm_pool_type orders[MAX_ORDER];
+		struct drm_page_pool *orders[MAX_ORDER];
 	} caching[TTM_NUM_CACHING_TYPES];
 };
 
-- 
2.25.1

