Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06574310650
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 09:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231681AbhBEIIZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 03:08:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231645AbhBEIHy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 03:07:54 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04FB6C06121C
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 00:06:38 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id a16so3160492plh.8
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 00:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0h7G7Mj4IDj8rnVWNvWrWgFawKxEQo6DQAh97xBXxA8=;
        b=P4T3dsp/zg51lMl4zVUf/FfHVV74HZD0vbohhptRcrdr0GN+iZ8l7eE+Lh0lnG36oT
         +ff+ITPYx4UU/QAaW/aRUrQgtrd/SUj3jzRJRe+66kwapWq268jPw/MJ5Wivjs5d4WP+
         64CdRi6IhGvJrhthmEfquhDnx/BK83ex+AKJq2529nm44TPxgZpzVArlsZh8Cvj9FxyW
         v/ha42GRHLrv1AOqdfnf872X+O/4k8oQ56mDhZvKsLMVUovAwYIHnFozqYRqrSA3R1Q/
         c19J3l2jnK7WsyUKR26mT71wU+FLRMTRkYPcgS8Or2OPtfLmbimHg7ESI1H160PH00jX
         8jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0h7G7Mj4IDj8rnVWNvWrWgFawKxEQo6DQAh97xBXxA8=;
        b=RWV1XpALZtvJmegoyT8sXF1fWw+2wNORpjvLIFrJ0oJfliU1LOqO1KHtarfdks0fso
         PwIb3RgSBhq2PxU+O/FEr0c7N0XgyqSulBoeQnQE3HcTovn5CuGRg9NMLaPtJEwqjp0o
         dJDvC0txBKuUcHq9/FC28ELY0XByvGVAHKMDxkqvkMqLOaIfjGBkDopgNy5V5WRohs7w
         SgySRryJhI2z3kFsEEt9Wh1Bmr1tNowyyhN1WSd7MlnIL5PE7WJ2kXaAGxahIRcoxlCa
         PKCfikMQl+/07f60JruH4EwdNh+Y0wC5bVW4Te47xQt8PTTXK+QWtn0vyrwml1HB/s9p
         d3rA==
X-Gm-Message-State: AOAM533cWrAML25kc0NE/IxIfif+9+H//OBE94AG4XOZEMxoFl7Hqyks
        kDyocnYIoSL6ObkX8OgRj87T3A==
X-Google-Smtp-Source: ABdhPJwmeSiEy8q5ju3zjwrXliGZIHlzYK+gBb189/+0rR+aqgg3u0rJgcGBcFQZL55Ljr3xsdHWqg==
X-Received: by 2002:a17:902:e844:b029:de:5abb:7df1 with SMTP id t4-20020a170902e844b02900de5abb7df1mr3247903plg.55.1612512397486;
        Fri, 05 Feb 2021 00:06:37 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id 32sm9520070pgq.80.2021.02.05.00.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 00:06:36 -0800 (PST)
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
Subject: [RFC][PATCH v6 6/7] dma-buf: system_heap: Add drm pagepool support to system heap
Date:   Fri,  5 Feb 2021 08:06:20 +0000
Message-Id: <20210205080621.3102035-7-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205080621.3102035-1-john.stultz@linaro.org>
References: <20210205080621.3102035-1-john.stultz@linaro.org>
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
---
 drivers/dma-buf/heaps/Kconfig       |  1 +
 drivers/dma-buf/heaps/system_heap.c | 56 +++++++++++++++++++++++++++--
 2 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index f7aef8bc7119..7e28934e0def 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -4,6 +4,7 @@ config DMABUF_HEAPS_DEFERRED_FREE
 config DMABUF_HEAPS_SYSTEM
 	bool "DMA-BUF System Heap"
 	depends on DMABUF_HEAPS
+	select DRM_PAGE_POOL
 	help
 	  Choose this option to enable the system dmabuf heap. The system heap
 	  is backed by pages from the buddy allocator. If in doubt, say Y.
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 17e0e9a68baf..6d39e9f32e36 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -21,6 +21,8 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
+#include <drm/page_pool.h>
+
 static struct dma_heap *sys_heap;
 
 struct system_heap_buffer {
@@ -53,6 +55,7 @@ static gfp_t order_flags[] = {HIGH_ORDER_GFP, LOW_ORDER_GFP, LOW_ORDER_GFP};
  */
 static const unsigned int orders[] = {8, 4, 0};
 #define NUM_ORDERS ARRAY_SIZE(orders)
+struct drm_page_pool *pools[NUM_ORDERS];
 
 static struct sg_table *dup_sg_table(struct sg_table *table)
 {
@@ -281,18 +284,49 @@ static void system_heap_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
 	dma_buf_map_clear(map);
 }
 
+static int system_heap_free_pages(struct page *p, unsigned int order)
+{
+	__free_pages(p, order);
+	return 1 << order;
+}
+
+static int system_heap_zero_buffer(struct system_heap_buffer *buffer)
+{
+	struct sg_table *sgt = &buffer->sg_table;
+	struct sg_page_iter piter;
+	struct page *p;
+	void *vaddr;
+	int ret = 0;
+
+	for_each_sgtable_page(sgt, &piter, 0) {
+		p = sg_page_iter_page(&piter);
+		vaddr = kmap_atomic(p);
+		memset(vaddr, 0, PAGE_SIZE);
+		kunmap_atomic(vaddr);
+	}
+
+	return ret;
+}
+
 static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
 {
 	struct system_heap_buffer *buffer = dmabuf->priv;
 	struct sg_table *table;
 	struct scatterlist *sg;
-	int i;
+	int i, j;
+
+	/* Zero the buffer pages before adding back to the pool */
+	system_heap_zero_buffer(buffer);
 
 	table = &buffer->sg_table;
 	for_each_sg(table->sgl, sg, table->nents, i) {
 		struct page *page = sg_page(sg);
 
-		__free_pages(page, compound_order(page));
+		for (j = 0; j < NUM_ORDERS; j++) {
+			if (compound_order(page) == orders[j])
+				break;
+		}
+		drm_page_pool_add(pools[j], page);
 	}
 	sg_free_table(table);
 	kfree(buffer);
@@ -323,7 +357,9 @@ static struct page *alloc_largest_available(unsigned long size,
 		if (max_order < orders[i])
 			continue;
 
-		page = alloc_pages(order_flags[i], orders[i]);
+		page = drm_page_pool_fetch(pools[i]);
+		if (!page)
+			page = alloc_pages(order_flags[i], orders[i]);
 		if (!page)
 			continue;
 		return page;
@@ -428,6 +464,20 @@ static const struct dma_heap_ops system_heap_ops = {
 static int system_heap_create(void)
 {
 	struct dma_heap_export_info exp_info;
+	int i;
+
+	for (i = 0; i < NUM_ORDERS; i++) {
+		pools[i] = drm_page_pool_create(orders[i],
+						system_heap_free_pages);
+		if (IS_ERR(pools[i])) {
+			int j;
+
+			pr_err("%s: page pool creation failed!\n", __func__);
+			for (j = 0; j < i; j++)
+				drm_page_pool_destroy(pools[j]);
+			return PTR_ERR(pools[i]);
+		}
+	}
 
 	exp_info.name = "system";
 	exp_info.ops = &system_heap_ops;
-- 
2.25.1

