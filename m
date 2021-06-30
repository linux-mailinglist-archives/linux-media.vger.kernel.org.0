Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FAFB3B7B4D
	for <lists+linux-media@lfdr.de>; Wed, 30 Jun 2021 03:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbhF3BhG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Jun 2021 21:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232042AbhF3BhD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Jun 2021 21:37:03 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD8CC061760
        for <linux-media@vger.kernel.org>; Tue, 29 Jun 2021 18:34:34 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id b1so559637pls.5
        for <linux-media@vger.kernel.org>; Tue, 29 Jun 2021 18:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7lwmLoDhSeUynyw9WpwUoeXd78SHIQUhC9+ggRtjsFY=;
        b=HBlk9uLZFBTPmMPZXa1DY3yBqmvzmoLq9Ga/hS6DV3Y3+0uu6Cm9LR/zISXJR6fOeZ
         2MV8mIa2ielnvbs7nQz61soPcBst2ko+p169WKQAV9uGEe4EwPZ9oOpXACSwlTTk3NFQ
         O1vj4a+RurTq2Ka/FeTf/1mYe+EKjH3Jq+4//h3Wy3gMamx6gpGvk/jWd3dTZ/Ike12A
         bGHPqmy85MbuzF4v5xM+psqE8xDBcv0VTT2gs6X/Y23lHNgsX92PZV+dt3XuZmZXFP/i
         HqZ1uMOuBPYk+T8NWnglX/M0CeHZjgJEsocYYOa1vY6Fjat5gILcJ0r0gUdVM9GrsFB1
         3ODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7lwmLoDhSeUynyw9WpwUoeXd78SHIQUhC9+ggRtjsFY=;
        b=skhQNEd6mosLknzXs47QkqQqtWx25nWqT6OJX3cmEoluii6Mgii4OkpTw4mHYVIjJj
         57Ea4toeyzDWJIQEQvZaZB/ByjdYpce3EJenb7i4verUXMgmOx3wEEKVwOId385crnii
         XJGMdwWWIjM3d9YSLbuQmSkNizCYINg4lx5OhsdG+ETOgf307O9AdpP9CMTlM69a6+z5
         PSG3WOcoOusZb39TptN9yfOEQcAAf5NN2YD3m0zfxXmUiiDYqYwdSoUb5gAcHYlbg6Ae
         y1agIVGeYDgE+PQkIc5o+/CbLTDMZQet2sjl27zl0dnnGkFgnfksfw0b6cXzPfEAGrGP
         9cQg==
X-Gm-Message-State: AOAM530ToQQpJw15f2L1M/ThjlHZBrCDcNh4C4oyaO0GLdJPSrWoTxKB
        bZkWX5D3Bm0tN1xJ2wWaMcEQIA==
X-Google-Smtp-Source: ABdhPJxMWCmXP/0OjhKqFlMasVLKq7rLdoTzTd5HNImYqVgNkNOOmmOdq+gMPC9r1CKc6CFEJnq2fQ==
X-Received: by 2002:a17:90a:5889:: with SMTP id j9mr36864843pji.234.1625016874317;
        Tue, 29 Jun 2021 18:34:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id g8sm20252901pja.14.2021.06.29.18.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 18:34:33 -0700 (PDT)
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
Subject: [PATCH v9 3/5] dma-buf: system_heap: Add drm pagepool support to system heap
Date:   Wed, 30 Jun 2021 01:34:19 +0000
Message-Id: <20210630013421.735092-4-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630013421.735092-1-john.stultz@linaro.org>
References: <20210630013421.735092-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Utilize the drm pagepool code to speed up allocation
performance.

This is similar to the ION pagepool usage, but tries to
utilize generic code instead of a custom implementation.

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
v2:
* Fix build issue caused by selecting PAGE_POOL w/o NET
  as Reported-by: kernel test robot <lkp@intel.com>
v3:
* Simplify the page zeroing logic a bit by using kmap_atomic
  instead of vmap as suggested by Daniel Mentz
v5:
* Shift away from networking page pool completely to
  dmabuf page pool implementation
v6:
* Switch again to using the drm_page_pool code shared w/
  ttm_pool
v7:
* Slight rework for drm_page_pool changes
v8:
* Rework to use the rewritten drm_page_pool logic
* Drop explicit buffer zeroing, as the drm_page_pool handles that
v9:
* Fix compiler warning Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/dma-buf/heaps/Kconfig       |  1 +
 drivers/dma-buf/heaps/system_heap.c | 26 +++++++++++++++++++++++---
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c4226..f19bf1f82bc2 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -1,6 +1,7 @@
 config DMABUF_HEAPS_SYSTEM
 	bool "DMA-BUF System Heap"
 	depends on DMABUF_HEAPS
+	select DRM_PAGE_POOL
 	help
 	  Choose this option to enable the system dmabuf heap. The system heap
 	  is backed by pages from the buddy allocator. If in doubt, say Y.
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index f57a39ddd063..85ceca2ed61d 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -21,6 +21,8 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
+#include <drm/page_pool.h>
+
 static struct dma_heap *sys_heap;
 
 struct system_heap_buffer {
@@ -54,6 +56,7 @@ static gfp_t order_flags[] = {HIGH_ORDER_GFP, MID_ORDER_GFP, LOW_ORDER_GFP};
  */
 static const unsigned int orders[] = {8, 4, 0};
 #define NUM_ORDERS ARRAY_SIZE(orders)
+struct drm_page_pool pools[NUM_ORDERS];
 
 static struct sg_table *dup_sg_table(struct sg_table *table)
 {
@@ -282,18 +285,27 @@ static void system_heap_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
 	dma_buf_map_clear(map);
 }
 
+static void system_heap_free_pages(struct drm_page_pool *pool, struct page *p)
+{
+	__free_pages(p, pool->order);
+}
+
 static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
 {
 	struct system_heap_buffer *buffer = dmabuf->priv;
 	struct sg_table *table;
 	struct scatterlist *sg;
-	int i;
+	int i, j;
 
 	table = &buffer->sg_table;
 	for_each_sg(table->sgl, sg, table->nents, i) {
 		struct page *page = sg_page(sg);
 
-		__free_pages(page, compound_order(page));
+		for (j = 0; j < NUM_ORDERS; j++) {
+			if (compound_order(page) == orders[j])
+				break;
+		}
+		drm_page_pool_add(&pools[j], page);
 	}
 	sg_free_table(table);
 	kfree(buffer);
@@ -324,7 +336,9 @@ static struct page *alloc_largest_available(unsigned long size,
 		if (max_order < orders[i])
 			continue;
 
-		page = alloc_pages(order_flags[i], orders[i]);
+		page = drm_page_pool_remove(&pools[i]);
+		if (!page)
+			page = alloc_pages(order_flags[i], orders[i]);
 		if (!page)
 			continue;
 		return page;
@@ -425,6 +439,12 @@ static const struct dma_heap_ops system_heap_ops = {
 static int system_heap_create(void)
 {
 	struct dma_heap_export_info exp_info;
+	int i;
+
+	for (i = 0; i < NUM_ORDERS; i++) {
+		drm_page_pool_init(&pools[i], orders[i],
+				   system_heap_free_pages);
+	}
 
 	exp_info.name = "system";
 	exp_info.ops = &system_heap_ops;
-- 
2.25.1

