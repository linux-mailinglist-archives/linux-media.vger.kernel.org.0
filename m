Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E00462796E1
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 06:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730045AbgIZEZM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 00:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730019AbgIZEZF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 00:25:05 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F32C0613D6
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 21:25:05 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id x16so3362885pgj.3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 21:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/z1sF9p3q5wnfzY3ZTbxrN10Skwo2Y6Rq8ZU166mru4=;
        b=WSXp6wb5oEQXway9MAE25SNgkcoGB3A0OZEvTUWHbhaQcCbSV5Ny+E7VBwg8KmOOcq
         yf+GkI6TgmXX+FInkLEgtXDSfKYP0BgE4pNpZqhGEVrBISYNSgmypbgffcboNFj9ieaA
         FIYzHMmYEOWJ8Biy3uom7ZyaqCxD04BMyJpW+4kle1dvosbg3dumOY966Amx0qBSu95P
         A40DSecXHKYkGNqCZ7pz9lmoijccn18mYFX85cE+7mNzeUxoRhgHySufYs1zncvsY/nA
         wWlPAlUNiGL1Rg5aiqJ4bQPEzuSXFeIMxIrcJEacxBI2b7/pyGyToijcWcIl7O9/Jl8K
         VrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/z1sF9p3q5wnfzY3ZTbxrN10Skwo2Y6Rq8ZU166mru4=;
        b=d26CYv0b5AzIEoNi3Bn23GcvZd6QRLZAQDq0bkTpaie489q3nVHLerbjGBI0Y2XtBX
         bSlXwNA2npBwpSVZoigf0nEcsdEt/Y/JDDOVcZGWRmTMY2/CrYOy+VSSFsG/zUbTAXu4
         JrUsuXhgOX2RkNeeHBXdUkneig5FH956ej0Vs8LMn8ic0T1YdLBPT5aC0THoGYdFlFiY
         94LMUzOrAiQuuu6vdLNIaCF1ri+LB2S+wtCFfq8F1USYp61tfdYaKjfuSXriw6o+z2Pa
         N00sjHz7hmHvjT00rwLYOuXgG2m7vfwIzLcR/bARGM2fTfQ4S2Z+K5dOkZGoNOb6W/Iu
         Y9+Q==
X-Gm-Message-State: AOAM531kn4IA04tYo4W7s0hraGEA/miL9L7ByRHCWlsVQW4dLDR9msPV
        +Qp2VmzS1FBWnruliIuHy3qF9w==
X-Google-Smtp-Source: ABdhPJxJdPim2jtqq6MvkC+z6P836ZUm0PKEAEj8ymE6++fwkRtRu6msPB2Sd2NBFczvSf2ry5Vv2g==
X-Received: by 2002:a63:5401:: with SMTP id i1mr1540855pgb.398.1601094304699;
        Fri, 25 Sep 2020 21:25:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id a5sm3585886pgk.13.2020.09.25.21.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 21:25:04 -0700 (PDT)
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
Subject: [RFC][PATCH 5/6] dma-buf: system_heap: Add pagepool support to system heap
Date:   Sat, 26 Sep 2020 04:24:52 +0000
Message-Id: <20200926042453.67517-6-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200926042453.67517-1-john.stultz@linaro.org>
References: <20200926042453.67517-1-john.stultz@linaro.org>
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
 drivers/dma-buf/heaps/Kconfig       |  1 +
 drivers/dma-buf/heaps/system_heap.c | 32 +++++++++++++++++++++++++----
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c4226..f13cde4321b1 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -1,6 +1,7 @@
 config DMABUF_HEAPS_SYSTEM
 	bool "DMA-BUF System Heap"
 	depends on DMABUF_HEAPS
+	select PAGE_POOL
 	help
 	  Choose this option to enable the system dmabuf heap. The system heap
 	  is backed by pages from the buddy allocator. If in doubt, say Y.
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 882a632e9bb7..9f57b4c8ae69 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -20,6 +20,7 @@
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
+#include <net/page_pool.h>
 
 struct dma_heap *sys_heap;
 
@@ -46,6 +47,7 @@ struct dma_heap_attachment {
 static gfp_t order_flags[] = {HIGH_ORDER_GFP, LOW_ORDER_GFP, LOW_ORDER_GFP};
 static const unsigned int orders[] = {8, 4, 0};
 #define NUM_ORDERS ARRAY_SIZE(orders)
+struct page_pool *pools[NUM_ORDERS];
 
 static struct sg_table *dup_sg_table(struct sg_table *table)
 {
@@ -264,13 +266,17 @@ static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
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
+		page_pool_put_full_page(pools[j], page, false);
 	}
 	sg_free_table(table);
 	kfree(buffer);
@@ -300,8 +306,7 @@ static struct page *alloc_largest_available(unsigned long size,
 			continue;
 		if (max_order < orders[i])
 			continue;
-
-		page = alloc_pages(order_flags[i], orders[i]);
+		page = page_pool_alloc_pages(pools[i], order_flags[i]);
 		if (!page)
 			continue;
 		return page;
@@ -406,6 +411,25 @@ static const struct dma_heap_ops system_heap_ops = {
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
+		pp.dma_dir = DMA_BIDIRECTIONAL;
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

