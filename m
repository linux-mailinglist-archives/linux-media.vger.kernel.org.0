Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28F692796DB
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 06:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730054AbgIZEZN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 00:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730033AbgIZEZE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 00:25:04 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E64ADC0613D4
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 21:25:03 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id e18so511273pgd.4
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 21:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2H1Yr1ZzRbTr0UE566f697qNBNIq6GZE63QK31mOArc=;
        b=QR3D70X+iURkNzPXl26udZXdU8x9honZnaMWw4JV2DKKAIvIFtkWhDmU8HykuxoRUj
         kQOi8jHCzczouvlfYRVDinDjm85nLQlg31by6GieWnYcJNKmVdwEjC7pR1DQH3aw0W6f
         r0QLTxE4f+JBnu+5C2o5u7ggaWg0rg3bF64Zc79ECONonPRowJwtIm96g3MFqkLw0SpX
         iG1F+HCHirx0wUURVjmDyERxSdZkEp9LjMNm8XM/f2fylGuUAUxdI/nnySnxYcwg4P/V
         eysFTGffdcMyz8llW4fqtlxdEldrvDb17KOJ37R3KCOs1Vz3NyLCW4T0XWt1rJKKtsuC
         kYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2H1Yr1ZzRbTr0UE566f697qNBNIq6GZE63QK31mOArc=;
        b=ikk4HfyKrJ0jFKKcVY9Xst9suen4rOnAJ/bnBU8q/qL0+SSB6QrMs5Sk7QbikIMTs5
         TsHWCh1kDh5r6ysexykBtvdgNtR6LhmoiTiY209Kuv43EBkHA8PiknQqfRahwmYf6gr9
         0WiEMmgiLCg2Lin6KFBtjaWVQ3472HudPzodZUP344+MVvOAQUUqOHc6w3zxPK8mD+aO
         Z09xFrGaaGDMsUFTFwaG2Mh84+oBzp4uc5o5NqvUpvsC9dMyKFBK8NaZP4GRrQn4bp4N
         PGg6ZQEc4i1NENoPB8hsstEVhT8ZcYDPCVfhrO/Laeyw9JC/IHpUEzLn0IdN666iiF04
         Insg==
X-Gm-Message-State: AOAM531QrwlchakFKPc6SljqKfUxGKcVNCOobg85e5Kn8YUqy6LDQq6B
        DWAxlL01/+NA7sbErtzLUgjvTQ==
X-Google-Smtp-Source: ABdhPJxVSgNpa8Val9ZcacJd85QmQO2OmijAvP06AHqBP8I1x0fgkNGF6yDx7vorPACjyRFjjzINHA==
X-Received: by 2002:a62:fb1a:0:b029:142:2501:39f9 with SMTP id x26-20020a62fb1a0000b0290142250139f9mr1542805pfm.72.1601094303392;
        Fri, 25 Sep 2020 21:25:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id a5sm3585886pgk.13.2020.09.25.21.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 21:25:02 -0700 (PDT)
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
Subject: [RFC][PATCH 4/6] dma-buf: system_heap: Allocate higher order pages if available
Date:   Sat, 26 Sep 2020 04:24:51 +0000
Message-Id: <20200926042453.67517-5-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200926042453.67517-1-john.stultz@linaro.org>
References: <20200926042453.67517-1-john.stultz@linaro.org>
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
index ddfa17dc48a8..882a632e9bb7 100644
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
@@ -259,8 +267,11 @@ static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
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
@@ -278,6 +289,26 @@ const struct dma_buf_ops system_heap_buf_ops = {
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
@@ -285,11 +316,13 @@ static int system_heap_allocate(struct dma_heap *heap,
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
@@ -301,25 +334,35 @@ static int system_heap_allocate(struct dma_heap *heap,
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
@@ -339,14 +382,18 @@ static int system_heap_allocate(struct dma_heap *heap,
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

