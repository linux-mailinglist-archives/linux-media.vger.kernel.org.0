Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3369A32DDCB
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 00:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233096AbhCDXUX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 18:20:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233040AbhCDXUV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 18:20:21 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9A7C061574
        for <linux-media@vger.kernel.org>; Thu,  4 Mar 2021 15:20:21 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d8so220053plg.10
        for <linux-media@vger.kernel.org>; Thu, 04 Mar 2021 15:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ii5pLXD2o0NGRI7J9va73Vq97pj3xACBVXZkTcA+ReU=;
        b=yQjXwBLc0O4odFqDIudXA0hwporccTe8AyopoQfYsvVJKuGq0mcsgQWYmabazWIQgG
         fP9zW5mFbccE6zRbj9xVs2DO5SqdaZ4tWxIihuCpm3T02yFIC6xtJsHWKU9qe1q0aNJy
         atfP525A+hA7ukkDjpvlx3MFGyYIPjd2UDjxR8drxMoxEiu4szP6fhvtbQZ4XXM/qWok
         nwKOVKMx6n6okVWrD8xOkcLwPFb7d4Kl9FMnqVBo+2ov44mVwftnF9HW0Bkbt8727Wod
         LqQcFwdx95lajJOBgJHUpi3CiDIvQ1BFWmKGvrElNBpnql8K/lucVrDh4Ad5mF9hgdp8
         fQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ii5pLXD2o0NGRI7J9va73Vq97pj3xACBVXZkTcA+ReU=;
        b=ik1jSBjlAnXQxDyYG+KwgznVW5alFZ2V24hTJLt4DRqa9p00AqjOKI5j7iUwsPJMKO
         xQuXvN89kdkEEHNskqJlMJOHrAJ8thJf3JqBlwgiVSSdaV0qZzeU0vCv6yw7cktuek7f
         6my0WreobLb6fXE2Hr2fg8wGxRTzVjp5UAtTbC0m5SxbdV+2mGfsfsfV0veWYkC4BMl3
         4AstVLaxZSTpvYJ/te7N6fpB4jqH0jrokCQycIRPzIfbv7GwtaLh4unlJbyxqvFCCAnx
         nQgYoXdYk1xOxOwaIbMkYIUzmwdzL0LWWdJVilItscdkBTYB9Igpo+9JKXe+o0yY3Byb
         hNNQ==
X-Gm-Message-State: AOAM531IDYGVbCQHAeW7ms8Svo3hrmn/nvAKLja8OfNnDj1eu+Chkb7X
        W1BR2Fj9aIj6e5n7Ch3134ZIoQ==
X-Google-Smtp-Source: ABdhPJzJwH4qXNcw/4c+SGoQp8DrK+YcikTPLI9do6sETSRiExO0Vk6pM5rfAx78p9/2e+ugdXohQw==
X-Received: by 2002:a17:902:124:b029:e3:fe16:fdf5 with SMTP id 33-20020a1709020124b02900e3fe16fdf5mr6361806plb.1.1614900021199;
        Thu, 04 Mar 2021 15:20:21 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id u66sm429290pfc.72.2021.03.04.15.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 15:20:20 -0800 (PST)
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
Subject: [PATCH v8 4/5] dma-buf: system_heap: Add drm pagepool support to system heap
Date:   Thu,  4 Mar 2021 23:20:10 +0000
Message-Id: <20210304232011.1479036-5-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210304232011.1479036-1-john.stultz@linaro.org>
References: <20210304232011.1479036-1-john.stultz@linaro.org>
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
---
 drivers/dma-buf/heaps/Kconfig       |  1 +
 drivers/dma-buf/heaps/system_heap.c | 27 ++++++++++++++++++++++++---
 2 files changed, 25 insertions(+), 3 deletions(-)

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
index 29e49ac17251..006271881d85 100644
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
+struct drm_page_pool pools[NUM_ORDERS];
 
 static struct sg_table *dup_sg_table(struct sg_table *table)
 {
@@ -281,18 +284,28 @@ static void system_heap_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
 	dma_buf_map_clear(map);
 }
 
+static unsigned long system_heap_free_pages(struct drm_page_pool *pool, struct page *p)
+{
+	__free_pages(p, pool->order);
+	return 1 << pool->order;
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
@@ -323,7 +336,9 @@ static struct page *alloc_largest_available(unsigned long size,
 		if (max_order < orders[i])
 			continue;
 
-		page = alloc_pages(order_flags[i], orders[i]);
+		page = drm_page_pool_remove(&pools[i]);
+		if (!page)
+			page = alloc_pages(order_flags[i], orders[i]);
 		if (!page)
 			continue;
 		return page;
@@ -423,6 +438,12 @@ static const struct dma_heap_ops system_heap_ops = {
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

