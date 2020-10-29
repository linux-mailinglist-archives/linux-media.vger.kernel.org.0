Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D193F29DBEA
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 01:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390999AbgJ2ASB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Oct 2020 20:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390713AbgJ2AQh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Oct 2020 20:16:37 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAACDC0613CF
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2020 17:16:36 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id g12so877522pgm.8
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2020 17:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rVjH5kAWpZ89/EmydrKRHj8zSjZ6vFxUYPy5820x7gY=;
        b=P+jjwLWrqBCCbLNR4qb6EqqJJTe5pzAlv9ANeDfjOTyASyInu/EbNZ4mClcZDxglf6
         xOWGsPZTE1eeDCKhjHs+Llb7ueRM9gWtdQpGxyKHKq6jdoFFcYU/EP3Guo1YPhqx6mIT
         VfDuRi11MWRB+tqf2hnSdBaHGCPPzz+8Hkkf5JUTq9g33JUGfRiEag2IkzAE8WQdQznY
         2RS1oOZpcwp+i3X6uCT9UMGjHUuxLrHCPFScwouuHVI5zbSaxOHGj8+saxznlO7pRccD
         Egn7Up7+heaUm70vppZHTmm9EVk/gyr01uKpMmc7pRF+zQPzBv+Gf4ItA72yETtWJNS6
         i/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rVjH5kAWpZ89/EmydrKRHj8zSjZ6vFxUYPy5820x7gY=;
        b=ejSlsuHMmt7KDxDnEpZY57ZpdV4dKBcn3t6jrI+3aXelXZUeo0lRSe+ccEYOzuMp2P
         68zWp5xfgXwIISwEuWBylc6701DHEoD0Jj+/ORAUTOuRXi3N8Y5xNpLLcJ8LQ3R1cTV7
         uCU6w4b/TWel7dDDOSz+CpzJwk0qL56hqBE2nfaQ5VNPiZ40VUOWyatru3P1xuXFeyF1
         5kEaIh2tOnkWk+dmDahvfF2PEePxR4S7XZHyjntRLu7abwVdXmVEXVgLwTZVw1Jpd9zZ
         J1WNMoYe+XWmKrjUXqX6tVKPhAticnoWdjgrPH6iqi2ekB1GxGIRc0MPs6OVPnpoZUFE
         ZH1w==
X-Gm-Message-State: AOAM5322XQ4WyJvW3jfAWG0wzZWF2Ol/lOpXdTB5yF/0YPgGJmFzzs3H
        bLJD2gtgH+k+LFHkMKEzppYzkA==
X-Google-Smtp-Source: ABdhPJyfLfvvtsd4sG4p5+VWzJBypi7Up03gLJMcUMLE5Cs3xkgCRKYR2kmDcLX8ori0m3oLSqZqqQ==
X-Received: by 2002:a17:90a:8c:: with SMTP id a12mr1394656pja.155.1603930596489;
        Wed, 28 Oct 2020 17:16:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id u13sm727407pfl.162.2020.10.28.17.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 17:16:35 -0700 (PDT)
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
        Daniel Mentz <danielmentz@google.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v4 5/7] dma-buf: system_heap: Allocate higher order pages if available
Date:   Thu, 29 Oct 2020 00:16:22 +0000
Message-Id: <20201029001624.17513-6-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201029001624.17513-1-john.stultz@linaro.org>
References: <20201029001624.17513-1-john.stultz@linaro.org>
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
Cc: Daniel Mentz <danielmentz@google.com>
Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Brian Starkey <brian.starkey@arm.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v3:
* Use page_size() rather then opencoding it
---
 drivers/dma-buf/heaps/system_heap.c | 83 ++++++++++++++++++++++-------
 1 file changed, 65 insertions(+), 18 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 15b36bc862b1..ef4b2c1032df 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -40,6 +40,14 @@ struct dma_heap_attachment {
 	bool mapped;
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
@@ -270,8 +278,11 @@ static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
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
@@ -289,6 +300,26 @@ static const struct dma_buf_ops system_heap_buf_ops = {
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
@@ -296,11 +327,13 @@ static int system_heap_allocate(struct dma_heap *heap,
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
@@ -312,25 +345,35 @@ static int system_heap_allocate(struct dma_heap *heap,
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
+			goto free_buffer;
+
+		list_add_tail(&page->lru, &pages);
+		size_remaining -= page_size(page);
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
 		sg_set_page(sg, page, page_size(page), 0);
 		sg = sg_next(sg);
+		list_del(&page->lru);
 	}
 
 	/* create the dmabuf */
@@ -350,14 +393,18 @@ static int system_heap_allocate(struct dma_heap *heap,
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

