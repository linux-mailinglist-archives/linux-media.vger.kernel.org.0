Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A47532DDC2
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 00:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233019AbhCDXUT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 18:20:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233032AbhCDXUS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 18:20:18 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61FFEC061574
        for <linux-media@vger.kernel.org>; Thu,  4 Mar 2021 15:20:18 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id i14so371711pjz.4
        for <linux-media@vger.kernel.org>; Thu, 04 Mar 2021 15:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FiKbNF6sIsDFllVX3gZjMXu3m0TjzXNAhqpgm5/+cRY=;
        b=vMzeNpoKj+AWkNj1Sl0naujTZGOZ/Kd7M8pxVCcQ/geVFWfX9PusFkmpilFBZjEbhf
         /CmiI/RwQdWjgC1kRvbSjGQ8EdH9S6OXx8JzMfOuHnv+OJsy4nTtWLm4oViJJtwV/ykJ
         b71l7eMzLaiaFg6t5ebIYh3mgZJxZaVhGeG1tP73aW5gpCGPNuHcLWf7q/s+RvU2IQda
         uNi8HJnZ7vcyhNapadVbMcduwumQJf/OZ5Mjf4BiTU7LiNbNh+ZgyDamqaiecnvHT33y
         Ir4CH5oYx8yIDwHIWeW1gMW++1Qf3akAz+kNzQjspA5l/eK+rgMy57iFcl+0eqRRaSD4
         BxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FiKbNF6sIsDFllVX3gZjMXu3m0TjzXNAhqpgm5/+cRY=;
        b=Ne4PiH7HsXdPRl9LEhaydFcy/FUqNOMBfhO4VRrjSfL3Y6rdhYELWy1cqpMifFEO5O
         /i3Cvo7B/UgGfg0i2OlUzAv6cBOyz48yjBGk6HsqkMBG1R0JU2OJfiJltEFN5Mbet7Pd
         J+r5z5zTwSj2BC5T5P7Dpe7lXHwagEBpBkMkUHB3/kMcSkaipSZypahNpUqjqWPygjHM
         yJXygHSUmAYH1TCsM1cmL5bWHJgW4BRVfxR5LOqIZ+cP7SYV4AhzBx/WZnvX84Up57VJ
         Ji7mYwaVmSdcvmDYdtMIMfbKfKE4xzBCLyTY0l9McNx+OTY8fLwgsNWpG9gbaf/Ihoya
         wiSQ==
X-Gm-Message-State: AOAM532xr9DWHo+3XTT5adHsKelaRj4MxR7fzLbwxvfVPGcSPuH7YqRn
        dsN+xSADt5YbC/nfz2kG3yyZ8g==
X-Google-Smtp-Source: ABdhPJzaPXe0BX4p/OHpQUy/ewFyfYq+is8O0jHSW93qyBaAZlEvtzKM4hvHDE9/7CV7ZKdlubEr/g==
X-Received: by 2002:a17:902:6b43:b029:df:fb48:aece with SMTP id g3-20020a1709026b43b02900dffb48aecemr5995966plt.59.1614900017933;
        Thu, 04 Mar 2021 15:20:17 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id u66sm429290pfc.72.2021.03.04.15.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 15:20:17 -0800 (PST)
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
Subject: [PATCH v8 2/5] drm: ttm_pool: Rework ttm_pool to use drm_page_pool
Date:   Thu,  4 Mar 2021 23:20:08 +0000
Message-Id: <20210304232011.1479036-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210304232011.1479036-1-john.stultz@linaro.org>
References: <20210304232011.1479036-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch reworks the ttm_pool logic to utilize the recently
added drm_page_pool code.

This adds drm_page_pool structures to the ttm_pool_type
structures, and then removes all the ttm_pool_type shrinker
logic (as its handled in the drm_page_pool shrinker).

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
v7:
* Major refactoring to use drm_page_pools inside the
  ttm_pool_type structure. This allows us to use container_of to
  get the needed context to free a page. This also means less
  code is changed overall.
v8:
* Reworked to use the new cleanly rewritten drm_page_pool logic
---
 drivers/gpu/drm/Kconfig        |   1 +
 drivers/gpu/drm/ttm/ttm_pool.c | 156 ++++++---------------------------
 include/drm/ttm/ttm_pool.h     |   6 +-
 3 files changed, 31 insertions(+), 132 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 7cbcecb8f7df..a6cbdb63f6c7 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -184,6 +184,7 @@ config DRM_PAGE_POOL
 config DRM_TTM
 	tristate
 	depends on DRM && MMU
+	select DRM_PAGE_POOL
 	help
 	  GPU memory management subsystem for devices with multiple
 	  GPU memory types. Will be enabled automatically if a device driver
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 6e27cb1bf48b..f74ea801d7ab 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -39,6 +39,7 @@
 #include <asm/set_memory.h>
 #endif
 
+#include <drm/page_pool.h>
 #include <drm/ttm/ttm_pool.h>
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_tt.h>
@@ -68,8 +69,6 @@ static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
 static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
 
 static struct mutex shrinker_lock;
-static struct list_head shrinker_list;
-static struct shrinker mm_shrinker;
 
 /* Allocate pages of size 1 << order with the given gfp_flags */
 static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
@@ -125,8 +124,9 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 }
 
 /* Reset the caching and pages of size 1 << order */
-static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
-			       unsigned int order, struct page *p)
+static unsigned long ttm_pool_free_page(struct ttm_pool *pool,
+					enum ttm_caching caching,
+					unsigned int order, struct page *p)
 {
 	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
 	struct ttm_pool_dma *dma;
@@ -142,7 +142,7 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
 
 	if (!pool || !pool->use_dma_alloc) {
 		__free_pages(p, order);
-		return;
+		return 1UL << order;
 	}
 
 	if (order)
@@ -153,6 +153,16 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
 	dma_free_attrs(pool->dev, (1UL << order) * PAGE_SIZE, vaddr, dma->addr,
 		       attr);
 	kfree(dma);
+	return 1UL << order;
+}
+
+static unsigned long ttm_subpool_free_page(struct drm_page_pool *subpool,
+					   struct page *p)
+{
+	struct ttm_pool_type *pt;
+
+	pt = container_of(subpool, struct ttm_pool_type, subpool);
+	return ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
 }
 
 /* Apply a new caching to an array of pages */
@@ -216,40 +226,6 @@ static void ttm_pool_unmap(struct ttm_pool *pool, dma_addr_t dma_addr,
 		       DMA_BIDIRECTIONAL);
 }
 
-/* Give pages into a specific pool_type */
-static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
-{
-	unsigned int i, num_pages = 1 << pt->order;
-
-	for (i = 0; i < num_pages; ++i) {
-		if (PageHighMem(p))
-			clear_highpage(p + i);
-		else
-			clear_page(page_address(p + i));
-	}
-
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
 /* Initialize and add a pool type to the global shrinker list */
 static void ttm_pool_type_init(struct ttm_pool_type *pt, struct ttm_pool *pool,
 			       enum ttm_caching caching, unsigned int order)
@@ -257,25 +233,14 @@ static void ttm_pool_type_init(struct ttm_pool_type *pt, struct ttm_pool *pool,
 	pt->pool = pool;
 	pt->caching = caching;
 	pt->order = order;
-	spin_lock_init(&pt->lock);
-	INIT_LIST_HEAD(&pt->pages);
 
-	mutex_lock(&shrinker_lock);
-	list_add_tail(&pt->shrinker_list, &shrinker_list);
-	mutex_unlock(&shrinker_lock);
+	drm_page_pool_init(&pt->subpool, order, ttm_subpool_free_page);
 }
 
 /* Remove a pool_type from the global shrinker list and free all pages */
 static void ttm_pool_type_fini(struct ttm_pool_type *pt)
 {
-	struct page *p, *tmp;
-
-	mutex_lock(&shrinker_lock);
-	list_del(&pt->shrinker_list);
-	mutex_unlock(&shrinker_lock);
-
-	list_for_each_entry_safe(p, tmp, &pt->pages, lru)
-		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
+	drm_page_pool_fini(&pt->subpool);
 }
 
 /* Return the pool_type to use for the given caching and order */
@@ -306,30 +271,6 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
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
-		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
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
@@ -386,7 +327,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 		struct ttm_pool_type *pt;
 
 		pt = ttm_pool_select_type(pool, tt->caching, order);
-		p = pt ? ttm_pool_type_take(pt) : NULL;
+		p = pt ? drm_page_pool_remove(&pt->subpool) : NULL;
 		if (p) {
 			apply_caching = true;
 		} else {
@@ -479,16 +420,13 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
 
 		pt = ttm_pool_select_type(pool, tt->caching, order);
 		if (pt)
-			ttm_pool_type_give(pt, tt->pages[i]);
+			drm_page_pool_add(&pt->subpool, tt->pages[i]);
 		else
 			ttm_pool_free_page(pool, tt->caching, order,
 					   tt->pages[i]);
 
 		i += num_pages;
 	}
-
-	while (atomic_long_read(&allocated_pages) > page_pool_size)
-		ttm_pool_shrink();
 }
 EXPORT_SYMBOL(ttm_pool_free);
 
@@ -537,21 +475,6 @@ void ttm_pool_fini(struct ttm_pool *pool)
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
 static void ttm_pool_debugfs_orders(struct ttm_pool_type *pt,
 				    struct seq_file *m)
@@ -559,7 +482,8 @@ static void ttm_pool_debugfs_orders(struct ttm_pool_type *pt,
 	unsigned int i;
 
 	for (i = 0; i < MAX_ORDER; ++i)
-		seq_printf(m, " %8u", ttm_pool_type_count(&pt[i]));
+		seq_printf(m, " %8lu",
+			   drm_page_pool_get_size(&pt[i].subpool));
 	seq_puts(m, "\n");
 }
 
@@ -609,7 +533,10 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
 	}
 
 	seq_printf(m, "\ntotal\t: %8lu of %8lu\n",
-		   atomic_long_read(&allocated_pages), page_pool_size);
+		   atomic_long_read(&allocated_pages),
+		   drm_page_pool_get_max());
+	seq_printf(m, "(%8lu in non-ttm pools)\n", drm_page_pool_get_total() -
+					atomic_long_read(&allocated_pages));
 
 	mutex_unlock(&shrinker_lock);
 
@@ -619,28 +546,6 @@ EXPORT_SYMBOL(ttm_pool_debugfs);
 
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
@@ -655,8 +560,9 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 	if (!page_pool_size)
 		page_pool_size = num_pages;
 
+	drm_page_pool_set_max(page_pool_size);
+
 	mutex_init(&shrinker_lock);
-	INIT_LIST_HEAD(&shrinker_list);
 
 	for (i = 0; i < MAX_ORDER; ++i) {
 		ttm_pool_type_init(&global_write_combined[i], NULL,
@@ -669,10 +575,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 				   ttm_uncached, i);
 	}
 
-	mm_shrinker.count_objects = ttm_pool_shrinker_count;
-	mm_shrinker.scan_objects = ttm_pool_shrinker_scan;
-	mm_shrinker.seeks = 1;
-	return register_shrinker(&mm_shrinker);
+	return 0;
 }
 
 /**
@@ -691,7 +594,4 @@ void ttm_pool_mgr_fini(void)
 		ttm_pool_type_fini(&global_dma32_write_combined[i]);
 		ttm_pool_type_fini(&global_dma32_uncached[i]);
 	}
-
-	unregister_shrinker(&mm_shrinker);
-	WARN_ON(!list_empty(&shrinker_list));
 }
diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
index 4321728bdd11..3d975888ce47 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -30,6 +30,7 @@
 #include <linux/llist.h>
 #include <linux/spinlock.h>
 #include <drm/ttm/ttm_caching.h>
+#include <drm/page_pool.h>
 
 struct device;
 struct ttm_tt;
@@ -51,10 +52,7 @@ struct ttm_pool_type {
 	unsigned int order;
 	enum ttm_caching caching;
 
-	struct list_head shrinker_list;
-
-	spinlock_t lock;
-	struct list_head pages;
+	struct drm_page_pool subpool;
 };
 
 /**
-- 
2.25.1

