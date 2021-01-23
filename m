Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9FE3012DD
	for <lists+linux-media@lfdr.de>; Sat, 23 Jan 2021 04:50:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbhAWDso (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 22:48:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbhAWDrl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 22:47:41 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34FD1C061786
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 19:47:01 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id 31so4370438plb.10
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 19:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h/R7WJXx2yBQ6X+1N6Z+Yf8F4SerrZkQy0BygNc6vpE=;
        b=vpEYOxpR8Y/Oem4gX5RpQq2v98GT324JwoxUNrJx9PtgK5ZucfAWkMZnaQUNRs/nEb
         mASnX4KvGuLesOhAG8dpOYFBgOr9KQ/xjMf7kUcZ7fF0TA6wK//9QTuiz9hamom6PdUF
         XN7p5JIw/Lqu1/VMI0A59PKOPwwiie6hPblFjrvqywR0z5cK3RWjKiSWsX+b29qXAZFx
         V5f6FBI3QT1RSsQ8U++DxRDXVhYYANiWDaIAr897fVTJv+3gMPdGNda2LOloEtQsbPN9
         UdezgFSS3kaGQ/dbMPcC2ey+RnczdgFRYreLve2gbDOshI9Mu7XQ80RqByQLcXUm0ZCv
         v1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h/R7WJXx2yBQ6X+1N6Z+Yf8F4SerrZkQy0BygNc6vpE=;
        b=WbU6RSe9BHxhKAJukzQ+tOTCN3clZIOI/BxZfi1EQaiVG154lCuo5+I1g6EQzb35W9
         yJoBSSiJ8OWA2PXDtzJlJYoFcPXS/HJ8CGrrheqRdvZLPpwTkEo/TJtoBQbQHJyjYnbi
         jj8sFvIP1zJk7WJSACj2uA8Yr5f8Jqv3H/VpLvf/NNgirjnZUXlruyLrn6w00NnyvcUw
         RAFE62deBCKYYy5gdA3MMFEai8SphpyVLOckeEjcYzI4Gadsyvo1ubA0YHRSL8F3Tqhb
         Mn6YvGArQ7AOyYCGk0+/wiR/7AgzkQWzXySUBGFxkLRAga5iXsTUuowBD+tm5yGuAfif
         5ybg==
X-Gm-Message-State: AOAM530P4F2R3W/jDzGvKciWwZxpZefpbUwoxnC87HoY9FKcPF2SUwmB
        PDpXYkJK2mPnYpG+olLtCcQBoQ==
X-Google-Smtp-Source: ABdhPJzar9M76uw2JJgl51y1Mh8wsVNOiW/hoHOoNIN+8H5SVsn0OMu+AFzEWQB+IfdwIgvmGNPFvA==
X-Received: by 2002:a17:902:9b90:b029:de:76e8:ee4b with SMTP id y16-20020a1709029b90b02900de76e8ee4bmr7862362plp.20.1611373620760;
        Fri, 22 Jan 2021 19:47:00 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id q24sm10316702pfs.72.2021.01.22.19.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 19:46:59 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
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
Subject: [PATCH v2 2/3] dma-buf: system_heap: Add pagepool support to system heap
Date:   Sat, 23 Jan 2021 03:46:54 +0000
Message-Id: <20210123034655.102813-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210123034655.102813-1-john.stultz@linaro.org>
References: <20210123034655.102813-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reuse/abuse the pagepool code from the network code to speed
up allocation performance.

This is similar to the ION pagepool usage, but tries to
utilize generic code instead of a custom implementation.

Cc: Daniel Vetter <daniel@ffwll.ch>
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
---
 drivers/dma-buf/heaps/Kconfig       |  2 +
 drivers/dma-buf/heaps/system_heap.c | 68 +++++++++++++++++++++++++++--
 2 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index ecf65204f714..748e840e6edd 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -4,6 +4,8 @@ config DMABUF_HEAPS_DEFERRED_FREE
 config DMABUF_HEAPS_SYSTEM
 	bool "DMA-BUF System Heap"
 	depends on DMABUF_HEAPS
+	select NET
+	select PAGE_POOL
 	help
 	  Choose this option to enable the system dmabuf heap. The system heap
 	  is backed by pages from the buddy allocator. If in doubt, say Y.
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 17e0e9a68baf..885e30894b77 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -20,6 +20,7 @@
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
+#include <net/page_pool.h>
 
 static struct dma_heap *sys_heap;
 
@@ -53,6 +54,7 @@ static gfp_t order_flags[] = {HIGH_ORDER_GFP, LOW_ORDER_GFP, LOW_ORDER_GFP};
  */
 static const unsigned int orders[] = {8, 4, 0};
 #define NUM_ORDERS ARRAY_SIZE(orders)
+struct page_pool *pools[NUM_ORDERS];
 
 static struct sg_table *dup_sg_table(struct sg_table *table)
 {
@@ -281,18 +283,59 @@ static void system_heap_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
 	dma_buf_map_clear(map);
 }
 
+static int system_heap_clear_pages(struct page **pages, int num, pgprot_t pgprot)
+{
+	void *addr = vmap(pages, num, VM_MAP, pgprot);
+
+	if (!addr)
+		return -ENOMEM;
+	memset(addr, 0, PAGE_SIZE * num);
+	vunmap(addr);
+	return 0;
+}
+
+static int system_heap_zero_buffer(struct system_heap_buffer *buffer)
+{
+	struct sg_table *sgt = &buffer->sg_table;
+	struct sg_page_iter piter;
+	struct page *pages[32];
+	int p = 0;
+	int ret = 0;
+
+	for_each_sgtable_page(sgt, &piter, 0) {
+		pages[p++] = sg_page_iter_page(&piter);
+		if (p == ARRAY_SIZE(pages)) {
+			ret = system_heap_clear_pages(pages, p, PAGE_KERNEL);
+			if (ret)
+				return ret;
+			p = 0;
+		}
+	}
+	if (p)
+		ret = system_heap_clear_pages(pages, p, PAGE_KERNEL);
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
+		page_pool_put_full_page(pools[j], page, false);
 	}
 	sg_free_table(table);
 	kfree(buffer);
@@ -322,8 +365,7 @@ static struct page *alloc_largest_available(unsigned long size,
 			continue;
 		if (max_order < orders[i])
 			continue;
-
-		page = alloc_pages(order_flags[i], orders[i]);
+		page = page_pool_alloc_pages(pools[i], order_flags[i]);
 		if (!page)
 			continue;
 		return page;
@@ -428,6 +470,24 @@ static const struct dma_heap_ops system_heap_ops = {
 static int system_heap_create(void)
 {
 	struct dma_heap_export_info exp_info;
+	int i;
+
+	for (i = 0; i < NUM_ORDERS; i++) {
+		struct page_pool_params pp;
+
+		memset(&pp, 0, sizeof(pp));
+		pp.order = orders[i];
+		pools[i] = page_pool_create(&pp);
+
+		if (IS_ERR(pools[i])) {
+			int j;
+
+			pr_err("%s: page pool creation failed!\n", __func__);
+			for (j = 0; j < i; j++)
+				page_pool_destroy(pools[j]);
+			return PTR_ERR(pools[i]);
+		}
+	}
 
 	exp_info.name = "system";
 	exp_info.ops = &system_heap_ops;
-- 
2.17.1

