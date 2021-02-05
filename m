Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECC9731065C
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 09:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231563AbhBEILv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 03:11:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231634AbhBEIHx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 03:07:53 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704E1C061797
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 00:06:31 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id f63so3799150pfa.13
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 00:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eppkc7cbhBhkKsBh0TVfEHFBhagPwlMZuH5kYXNg9Sk=;
        b=LvkxxuZDAt3g61EzURtwZNN7B+c9BI9CcoYDAacfHmWWZaJmA/Q8ueMntoQL87InPz
         x3cic234jsbfsSUbgOlH9EphjhLyv75y5ljVcj96lD8GWTzU94A237kWBn6zXhPaZSVv
         Qxl5gI8MIE7AZ+8ju558OSalzhBAC+kamKS43qb/4rZZJCsnWqBeGMaKqEO4z6XB3UBy
         NICgSOqMmB85OIVfSU/BHZ31T9K5ZA/WU4F1VuEGj27Tm0IsEqPG/qmh1F+9RQIJlF/+
         72ItAQdnjOo4oeXkb2xUerZye6TyguzkprgbaF9p5TRXlRe/6wuok2G0jnFH6JqwoP9I
         KBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eppkc7cbhBhkKsBh0TVfEHFBhagPwlMZuH5kYXNg9Sk=;
        b=INr+L7hTNlCk4PeloU/tid8/zumqoMAwLx618nNxKj66kFB9/N4ottZrgogJvC3igd
         C+IelYeqC8TFgb7VXazxlWRrvdFJHxTxnV1xO1UhDl0vaUvarIDVWNShTRUAIU7pYK4T
         diQoJno5oNvwOn+1K1LBOYofzEGpzqpvUEGXBikqH5yOT1gKyS+z3zc2Ohjc0ULFjttB
         UGhwW6Gma9qxwHvVO/79aLnyx0NMdMLuJMn8KHT6vSupKw2DP3Lk0Z7vrJTY/paGnTzy
         5gkPjzkbPSXC2ewyP2VfApFSEnFw3yzssrrvPpjRdoZKBU2do6Qo+ChudhFqEDO3tgNo
         DDpg==
X-Gm-Message-State: AOAM533Z2hwri+3xX6Jgh+Bk5HeqpIFWXIr37x1EqfU+08Tau8wt4IaK
        99PIWzyfac8ju/P2Peyut3XKmg==
X-Google-Smtp-Source: ABdhPJx48bhhs1D3gknefKfUqkMUbp2y+z4at6TszkoS7X+/fr9erWj+jlUYkxFBhUUgi39EnSaBGA==
X-Received: by 2002:aa7:946c:0:b029:1ce:3f04:3f67 with SMTP id t12-20020aa7946c0000b02901ce3f043f67mr3589630pfq.6.1612512390927;
        Fri, 05 Feb 2021 00:06:30 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id 32sm9520070pgq.80.2021.02.05.00.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 00:06:30 -0800 (PST)
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
Subject: [RFC][PATCH v6 3/7] drm: ttm_pool: Rework ttm_pool_free_page to allow us to use it as a function pointer
Date:   Fri,  5 Feb 2021 08:06:17 +0000
Message-Id: <20210205080621.3102035-4-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205080621.3102035-1-john.stultz@linaro.org>
References: <20210205080621.3102035-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This refactors ttm_pool_free_page(), and by adding extra entries
to ttm_pool_page_dat, we then use it for all allocations, which
allows us to simplify the arguments needed to be passed to
ttm_pool_free_page().

This is critical for allowing the free function to be called
by the sharable drm_page_pool logic.

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
 drivers/gpu/drm/ttm/ttm_pool.c | 60 ++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index c0274e256be3..eca36678f967 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -44,10 +44,14 @@
 /**
  * struct ttm_pool_page_dat - Helper object for coherent DMA mappings
  *
+ * @pool: ttm_pool pointer the page was allocated by
+ * @caching: the caching value the allocated page was configured for
  * @addr: original DMA address returned for the mapping
  * @vaddr: original vaddr return for the mapping and order in the lower bits
  */
 struct ttm_pool_page_dat {
+	struct ttm_pool *pool;
+	enum ttm_caching caching;
 	dma_addr_t addr;
 	unsigned long vaddr;
 };
@@ -71,13 +75,20 @@ static struct shrinker mm_shrinker;
 
 /* Allocate pages of size 1 << order with the given gfp_flags */
 static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
-					unsigned int order)
+					unsigned int order, enum ttm_caching caching)
 {
 	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
 	struct ttm_pool_page_dat *dat;
 	struct page *p;
 	void *vaddr;
 
+	dat = kmalloc(sizeof(*dat), GFP_KERNEL);
+	if (!dat)
+		return NULL;
+
+	dat->pool = pool;
+	dat->caching = caching;
+
 	/* Don't set the __GFP_COMP flag for higher order allocations.
 	 * Mapping pages directly into an userspace process and calling
 	 * put_page() on a TTM allocated page is illegal.
@@ -88,15 +99,13 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 
 	if (!pool->use_dma_alloc) {
 		p = alloc_pages(gfp_flags, order);
-		if (p)
-			p->private = order;
+		if (!p)
+			goto error_free;
+		dat->vaddr = order;
+		p->private = (unsigned long)dat;
 		return p;
 	}
 
-	dat = kmalloc(sizeof(*dat), GFP_KERNEL);
-	if (!dat)
-		return NULL;
-
 	if (order)
 		attr |= DMA_ATTR_NO_WARN;
 
@@ -123,34 +132,34 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 }
 
 /* Reset the caching and pages of size 1 << order */
-static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
-			       unsigned int order, struct page *p)
+static int ttm_pool_free_page(struct page *p, unsigned int order)
 {
 	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
-	struct ttm_pool_page_dat *dat;
+	struct ttm_pool_page_dat *dat = (void *)p->private;
 	void *vaddr;
 
 #ifdef CONFIG_X86
 	/* We don't care that set_pages_wb is inefficient here. This is only
 	 * used when we have to shrink and CPU overhead is irrelevant then.
 	 */
-	if (caching != ttm_cached && !PageHighMem(p))
+	if (dat->caching != ttm_cached && !PageHighMem(p))
 		set_pages_wb(p, 1 << order);
 #endif
 
-	if (!pool || !pool->use_dma_alloc) {
+	if (!dat->pool || !dat->pool->use_dma_alloc) {
 		__free_pages(p, order);
-		return;
+		goto out;
 	}
 
 	if (order)
 		attr |= DMA_ATTR_NO_WARN;
 
-	dat = (void *)p->private;
 	vaddr = (void *)(dat->vaddr & PAGE_MASK);
-	dma_free_attrs(pool->dev, (1UL << order) * PAGE_SIZE, vaddr, dat->addr,
+	dma_free_attrs(dat->pool->dev, (1UL << order) * PAGE_SIZE, vaddr, dat->addr,
 		       attr);
+out:
 	kfree(dat);
+	return 1 << order;
 }
 
 /* Apply a new caching to an array of pages */
@@ -264,7 +273,7 @@ static void ttm_pool_type_fini(struct ttm_pool_type *pt)
 	mutex_unlock(&shrinker_lock);
 
 	list_for_each_entry_safe(p, tmp, &pt->pages, lru)
-		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
+		ttm_pool_free_page(p, pt->order);
 }
 
 /* Return the pool_type to use for the given caching and order */
@@ -307,7 +316,7 @@ static unsigned int ttm_pool_shrink(void)
 
 	p = ttm_pool_type_take(pt);
 	if (p) {
-		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
+		ttm_pool_free_page(p, pt->order);
 		num_freed = 1 << pt->order;
 	} else {
 		num_freed = 0;
@@ -322,13 +331,9 @@ static unsigned int ttm_pool_shrink(void)
 /* Return the allocation order based for a page */
 static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
 {
-	if (pool->use_dma_alloc) {
-		struct ttm_pool_page_dat *dat = (void *)p->private;
-
-		return dat->vaddr & ~PAGE_MASK;
-	}
+	struct ttm_pool_page_dat *dat = (void *)p->private;
 
-	return p->private;
+	return dat->vaddr & ~PAGE_MASK;
 }
 
 /**
@@ -379,7 +384,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 		if (p) {
 			apply_caching = true;
 		} else {
-			p = ttm_pool_alloc_page(pool, gfp_flags, order);
+			p = ttm_pool_alloc_page(pool, gfp_flags, order, tt->caching);
 			if (p && PageHighMem(p))
 				apply_caching = true;
 		}
@@ -428,13 +433,13 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 	ttm_mem_global_free_page(&ttm_mem_glob, p, (1 << order) * PAGE_SIZE);
 
 error_free_page:
-	ttm_pool_free_page(pool, tt->caching, order, p);
+	ttm_pool_free_page(p, order);
 
 error_free_all:
 	num_pages = tt->num_pages - num_pages;
 	for (i = 0; i < num_pages; ) {
 		order = ttm_pool_page_order(pool, tt->pages[i]);
-		ttm_pool_free_page(pool, tt->caching, order, tt->pages[i]);
+		ttm_pool_free_page(tt->pages[i], order);
 		i += 1 << order;
 	}
 
@@ -470,8 +475,7 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
 		if (pt)
 			ttm_pool_type_give(pt, tt->pages[i]);
 		else
-			ttm_pool_free_page(pool, tt->caching, order,
-					   tt->pages[i]);
+			ttm_pool_free_page(tt->pages[i], order);
 
 		i += num_pages;
 	}
-- 
2.25.1

