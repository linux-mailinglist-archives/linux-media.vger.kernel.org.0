Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCEC727F736
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 03:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730705AbgJABWC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 21:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730624AbgJABWC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 21:22:02 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED8EAC061755
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:22:01 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id k8so2842818pfk.2
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1vBTIiPWzM/IlhEEYSWgJfaQ6H5IRqB1EzAsJMQfGDQ=;
        b=QIHtowFHywcb2OA2JmyEG738gATOnYSXSQWXrzJBOgk78EntjJM/HEjEuj6obwBc2W
         qqlDCHm6CMMkd6JoL+/QVLamZnFiJnYRQqFQIS5cHm9v6n7lv+tQI7YDizxp79dCkiU7
         H5PBDkbuGBWM4qF78HWRZITwwodwN6kL0l0sZjrXvtQhvm+e6fzeAuQ/KKAbWH0VTz+M
         lhwWcq+rtXVA0YTXKvUeVIoUs4xBYTMulAP6BMB7EU4NFoF+4br5eIqRwWiw9XOvk6Ax
         nktcGv9OsUyY9xZoA7nq6a6uLRItdRQ7NSwUSmBvYezxvmZz6QnL9L64LOw8U8zBhouW
         8nJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1vBTIiPWzM/IlhEEYSWgJfaQ6H5IRqB1EzAsJMQfGDQ=;
        b=X9Kw3+IC4rgPnH3lBRhIsKWjZ2NqMkeAelEUkNMhktmPoPO67ZeFV/UzuYKQBU6da/
         RjShd+t5wUQJ+LjaSkCTQnKybjfBw1wHSnl1xgZHz2pqgvaE7HNLI0YSbMcgJoqcQ205
         LzFo2QP0x26eqcqs0bFrX5b+0eeWb4MDHVJqfosdoitvbvr85X6PL7AN9EjVnMEFNR2r
         0SP4fSZ81uOL60u/OZ6PZoLIurh+oUJ8/qzSffccFbqgwdOP1InnTcEaqC39MchcIWBu
         fyiL3qiNgwx496FvrNWbAliGhN0tKDnmkK9b5W2lpLWq3W237oIYFxCsq/dhvyWKRcKb
         9e8A==
X-Gm-Message-State: AOAM532hLoo0l8mR7nVU2I9JEwvoWgA3jKcTwmx1zN91K93y8JE7ANlz
        iYM9jzPoOu9tpyH5zKpyyHeynw==
X-Google-Smtp-Source: ABdhPJzBHe24b6jfAfo/83c6MDDYvzPWmon/XBZ5L2YBcnRaT9JAl84oGmaEWx3EDUJgl6GJdhmsmg==
X-Received: by 2002:a63:4959:: with SMTP id y25mr4275782pgk.206.1601515321478;
        Wed, 30 Sep 2020 18:22:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id s187sm4229372pfc.134.2020.09.30.18.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 18:22:00 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/6] dma-buf: system_heap: Allocate higher order pages if available
Date:   Thu,  1 Oct 2020 01:21:49 +0000
Message-Id: <20201001012151.21149-5-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201001012151.21149-1-john.stultz@linaro.org>
References: <20201001012151.21149-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While the system heap can return non-contiguous pages,
try to allocate larger order pages if possible.

This will allow slight performance gains and make implementing
page pooling easier.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/dma-buf/heaps/system_heap.c | 85 ++++++++++++++++++++++-------
 1 file changed, 66 insertions(+), 19 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 7ec58f4e2bd3..d18937fa5b18 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -39,6 +39,14 @@ struct dma_heap_attachment {
 	struct list_head list;
 };
 
+#define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
+				| __GFP_NORETRY) & ~__GFP_RECLAIM) \
+				| __GFP_COMP)
+#define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO | __GFP_COMP)
+static gfp_t order_flags[] = {HIGH_ORDER_GFP, LOW_ORDER_GFP, LOW_ORDER_GFP};
+static const unsigned int orders[] = {8, 4, 0};
+#define NUM_ORDERS ARRAY_SIZE(orders)
+
 static struct sg_table *dup_sg_table(struct sg_table *table)
 {
 	struct sg_table *new_table;
@@ -260,8 +268,11 @@ static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
 	int i;
 
 	table = &buffer->sg_table;
-	for_each_sgtable_sg(table, sg, i)
-		__free_page(sg_page(sg));
+	for_each_sg(table->sgl, sg, table->nents, i) {
+		struct page *page = sg_page(sg);
+
+		__free_pages(page, compound_order(page));
+	}
 	sg_free_table(table);
 	kfree(buffer);
 }
@@ -279,6 +290,26 @@ static const struct dma_buf_ops system_heap_buf_ops = {
 	.release = system_heap_dma_buf_release,
 };
 
+static struct page *alloc_largest_available(unsigned long size,
+					    unsigned int max_order)
+{
+	struct page *page;
+	int i;
+
+	for (i = 0; i < NUM_ORDERS; i++) {
+		if (size <  (PAGE_SIZE << orders[i]))
+			continue;
+		if (max_order < orders[i])
+			continue;
+
+		page = alloc_pages(order_flags[i], orders[i]);
+		if (!page)
+			continue;
+		return page;
+	}
+	return NULL;
+}
+
 static int system_heap_allocate(struct dma_heap *heap,
 				unsigned long len,
 				unsigned long fd_flags,
@@ -286,11 +317,13 @@ static int system_heap_allocate(struct dma_heap *heap,
 {
 	struct system_heap_buffer *buffer;
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	unsigned long size_remaining = len;
+	unsigned int max_order = orders[0];
 	struct dma_buf *dmabuf;
 	struct sg_table *table;
 	struct scatterlist *sg;
-	pgoff_t pagecount;
-	pgoff_t pg;
+	struct list_head pages;
+	struct page *page, *tmp_page;
 	int i, ret = -ENOMEM;
 
 	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
@@ -302,25 +335,35 @@ static int system_heap_allocate(struct dma_heap *heap,
 	buffer->heap = heap;
 	buffer->len = len;
 
-	table = &buffer->sg_table;
-	pagecount = len / PAGE_SIZE;
-	if (sg_alloc_table(table, pagecount, GFP_KERNEL))
-		goto free_buffer;
-
-	sg = table->sgl;
-	for (pg = 0; pg < pagecount; pg++) {
-		struct page *page;
+	INIT_LIST_HEAD(&pages);
+	i = 0;
+	while (size_remaining > 0) {
 		/*
 		 * Avoid trying to allocate memory if the process
 		 * has been killed by SIGKILL
 		 */
 		if (fatal_signal_pending(current))
-			goto free_pages;
-		page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+			goto free_buffer;
+
+		page = alloc_largest_available(size_remaining, max_order);
 		if (!page)
-			goto free_pages;
-		sg_set_page(sg, page, page_size(page), 0);
+			goto free_buffer;
+
+		list_add_tail(&page->lru, &pages);
+		size_remaining -= PAGE_SIZE << compound_order(page);
+		max_order = compound_order(page);
+		i++;
+	}
+
+	table = &buffer->sg_table;
+	if (sg_alloc_table(table, i, GFP_KERNEL))
+		goto free_buffer;
+
+	sg = table->sgl;
+	list_for_each_entry_safe(page, tmp_page, &pages, lru) {
+		sg_set_page(sg, page, PAGE_SIZE << compound_order(page), 0);
 		sg = sg_next(sg);
+		list_del(&page->lru);
 	}
 
 	/* create the dmabuf */
@@ -340,14 +383,18 @@ static int system_heap_allocate(struct dma_heap *heap,
 		/* just return, as put will call release and that will free */
 		return ret;
 	}
-
 	return ret;
 
 free_pages:
-	for_each_sgtable_sg(table, sg, i)
-		__free_page(sg_page(sg));
+	for_each_sgtable_sg(table, sg, i) {
+		struct page *p = sg_page(sg);
+
+		__free_pages(p, compound_order(p));
+	}
 	sg_free_table(table);
 free_buffer:
+	list_for_each_entry_safe(page, tmp_page, &pages, lru)
+		__free_pages(page, compound_order(page));
 	kfree(buffer);
 
 	return ret;
-- 
2.17.1

