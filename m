Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAC96306D96
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 07:24:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbhA1GWz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 01:22:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbhA1GWf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 01:22:35 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DA3FC06174A
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 22:21:55 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id g15so3674512pjd.2
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 22:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u7Mc2AcSMkO8KsWlbyrx1biPcgp0/MBcOs2WeW9V+WI=;
        b=gEMQWtO2dMpl7gYxozGAZLrFzHWF4dmRszffEzdmwgkIyrfc937HPeF7qNBPMxaIk7
         yGnhV9WJxLWgOp9h4a+5QiESo0Gjo+GwQPRHQAd0UO5DtJJsX+2tCJUFx4IJfvNiDr1+
         MgrHQhn24HuI6BaRviK4FQID/KvC5u6DAHS7U3/20eqpf004dIHNhm6hQpYX3Dw6gSxX
         W+RorPYi4ZxAmVEbHVOeOXtNSM+UtH6AlPs0zaM1A3dSMbEwcEk8o77Xh5a7Bz9B8fU4
         17daeParsqPHAwWAuWbWqe7nOS7N7ucXL71BHcT72BvWDnpaS9p7Cac5JmlfkiS52kx4
         lMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u7Mc2AcSMkO8KsWlbyrx1biPcgp0/MBcOs2WeW9V+WI=;
        b=X0TJ3VFE2FLBk1v+MOypJMxVweag+t3UrrPJbLQW3VhTE4HohJKiVBX4vg9/zwyOrP
         io9+berhx8d6/tnEbpSEAcnza7p9KUJbkMqokNfjEbnLNlUeSwQZaXnVT5Mb5bdV5r2X
         OwSIj8L5/r3at2B7v6y+qgl4D0jw0Kn1IHrouHsCbPT5nI+u8r+wmNfV0zMGU4yUJaxo
         92d6b2oOp2ijbvMWKCSMQYWmeRCYEnk4AtfaBdkvk01sK/t3pIJ+ld22Jsx1ghZiWggB
         MTCgAH/sfYXWBmC+SQagyhI8HaLyPcrMj0v0Ayln5RG7LXpfmYCFfthczFS7ONv2rC9Q
         x4lA==
X-Gm-Message-State: AOAM531SJJvNUgwwum4D7y00zESCtApGtxavz4h+d5+vz6zt+6rx76Tj
        6PqsHOGxuExgJPqlQbJ2uZk1yA==
X-Google-Smtp-Source: ABdhPJyCUOJAMg0cEsgY53LWI9S3uPsfdsmQkdDNmdLOsw+6mmQcGedVMCVf4Bhod4gGNEamUm2EmQ==
X-Received: by 2002:a17:90b:4c8c:: with SMTP id my12mr9412112pjb.29.1611814914648;
        Wed, 27 Jan 2021 22:21:54 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id s9sm4477765pfd.38.2021.01.27.22.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 22:21:53 -0800 (PST)
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
Subject: [PATCH v3 2/3] dma-buf: system_heap: Add pagepool support to system heap
Date:   Thu, 28 Jan 2021 06:21:46 +0000
Message-Id: <20210128062147.438413-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128062147.438413-1-john.stultz@linaro.org>
References: <20210128062147.438413-1-john.stultz@linaro.org>
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
v3:
* Simplify the page zeroing logic a bit by using kmap_atomic
  instead of vmap as suggested by Daniel Mentz
---
 drivers/dma-buf/heaps/Kconfig       |  2 ++
 drivers/dma-buf/heaps/system_heap.c | 52 ++++++++++++++++++++++++++---
 2 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index f7aef8bc7119..45c7d277448b 100644
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
index 17e0e9a68baf..2addb6d832e0 100644
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
@@ -281,18 +283,43 @@ static void system_heap_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
 	dma_buf_map_clear(map);
 }
 
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
+		page_pool_put_full_page(pools[j], page, false);
 	}
 	sg_free_table(table);
 	kfree(buffer);
@@ -322,8 +349,7 @@ static struct page *alloc_largest_available(unsigned long size,
 			continue;
 		if (max_order < orders[i])
 			continue;
-
-		page = alloc_pages(order_flags[i], orders[i]);
+		page = page_pool_alloc_pages(pools[i], order_flags[i]);
 		if (!page)
 			continue;
 		return page;
@@ -428,6 +454,24 @@ static const struct dma_heap_ops system_heap_ops = {
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
2.25.1

