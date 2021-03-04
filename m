Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDEA032DDCD
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 00:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233112AbhCDXUa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 18:20:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233131AbhCDXU2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 18:20:28 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B4CFC061574
        for <linux-media@vger.kernel.org>; Thu,  4 Mar 2021 15:20:23 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id w18so361343pfu.9
        for <linux-media@vger.kernel.org>; Thu, 04 Mar 2021 15:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1viYL6LhK+5nIQ13ju++XlarHcY6osyk1cCjbOPG1F0=;
        b=KcWKRMcTqPHZF1q05Ce0JCzTme39nwPKHDDiT/YIqKCsscOzC9PyUbaxoEvglXFwrK
         1w32NYPCKD9OTcIgZBeCWhzZDLKez5Sl3ufwPZjZCA9VnxgZhu0jIuSF7RZQwDPMX1lw
         Z5a47mYCKuV+OVShTvu9KWHrGgTAPKj4pQIvMwsZNm24ziWIXPihJMDYtexedzbB1N5u
         nyE1nYLI9TW/aaWhK7GA7d3xngcaHhqA/h6acr3mB5GPKA7G2GqQUQQXj+4luvgel37m
         P4UBL+C8Ll6L9gUFrsn3ZL/qjxkKcuBQ2s/cwt2cj3mDi8uyuMqv3qGrJM83UhMY0Tty
         Fa4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1viYL6LhK+5nIQ13ju++XlarHcY6osyk1cCjbOPG1F0=;
        b=bw+lOzgzOtYe/xIX4xuIxntWAgIGh4HCorrQW4u8H1l8E5wf9BdZsLwyWg7bLJrskq
         ZKPwA0U3PZSe6DqM4VOMqPNeKRVQQsvGiKxFMaYba3gy0iBTApLMj/8ty3LnT4su0w1+
         KvHrhkcB9dkAdcv3BKT1/VdYwA3pAPkArNFLVVclgHfho7f8R2+CU667MUdpUoSgYqiM
         mMBK3xLP+z+idPQNIGMOcsriZ+GYuxIT8I/vL0ZmVGzFrL5N2PTPg7E+KLVsUdaYjXwQ
         GnwLZrO9sqa+DspjcJT4BiTL02JzqwsdA0XNWrfQ2opqJqwNqcW/ZBW9PgaIFGS8+fh+
         QxLw==
X-Gm-Message-State: AOAM532w01TNzFEDZU3aknmeV3FP3nbwBz6UwfmM62ejDsXjFb6k0VCy
        j7FuFTs5HfRAQH7LpoxpP7rQsA==
X-Google-Smtp-Source: ABdhPJw2jFY8Rq+iS4tDrmeKtrXjB9IUAoh4ZkSvegh37qen93VKtQdaq2WlbCBS2hJuKS1jzQ4vsA==
X-Received: by 2002:aa7:8d05:0:b029:1ec:b460:f21d with SMTP id j5-20020aa78d050000b02901ecb460f21dmr6027582pfe.29.1614900023086;
        Thu, 04 Mar 2021 15:20:23 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id u66sm429290pfc.72.2021.03.04.15.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 15:20:22 -0800 (PST)
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
Subject: [PATCH v8 5/5] dma-buf: system_heap: Add deferred freeing to the system heap
Date:   Thu,  4 Mar 2021 23:20:11 +0000
Message-Id: <20210304232011.1479036-6-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210304232011.1479036-1-john.stultz@linaro.org>
References: <20210304232011.1479036-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Utilize the deferred free helper library in the system heap.

This provides a nice performance bump and puts the
system heap performance on par with ION.

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
* Rework deferred-free api to use reason enum as suggested by
  Suren Baghdasaryan
* Rework for deferred-free api change to use nr_pages rather
  than size as suggsted by Suren Baghdasaryan
v8:
* Reworked to drop buffer zeroing logic, as the drm_page_pool now
  handles that.
---
 drivers/dma-buf/heaps/Kconfig       |  1 +
 drivers/dma-buf/heaps/system_heap.c | 28 ++++++++++++++++++++++------
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index 7e28934e0def..10632ccfb4a5 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -5,6 +5,7 @@ config DMABUF_HEAPS_SYSTEM
 	bool "DMA-BUF System Heap"
 	depends on DMABUF_HEAPS
 	select DRM_PAGE_POOL
+	select DMABUF_HEAPS_DEFERRED_FREE
 	help
 	  Choose this option to enable the system dmabuf heap. The system heap
 	  is backed by pages from the buddy allocator. If in doubt, say Y.
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 006271881d85..c753c82fd9f1 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -22,6 +22,7 @@
 #include <linux/vmalloc.h>
 
 #include <drm/page_pool.h>
+#include "deferred-free-helper.h"
 
 static struct dma_heap *sys_heap;
 
@@ -33,6 +34,7 @@ struct system_heap_buffer {
 	struct sg_table sg_table;
 	int vmap_cnt;
 	void *vaddr;
+	struct deferred_freelist_item deferred_free;
 };
 
 struct dma_heap_attachment {
@@ -290,27 +292,41 @@ static unsigned long system_heap_free_pages(struct drm_page_pool *pool, struct p
 	return 1 << pool->order;
 }
 
-static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
+static void system_heap_buf_free(struct deferred_freelist_item *item,
+				 enum df_reason reason)
 {
-	struct system_heap_buffer *buffer = dmabuf->priv;
+	struct system_heap_buffer *buffer;
 	struct sg_table *table;
 	struct scatterlist *sg;
 	int i, j;
 
+	buffer = container_of(item, struct system_heap_buffer, deferred_free);
 	table = &buffer->sg_table;
 	for_each_sg(table->sgl, sg, table->nents, i) {
 		struct page *page = sg_page(sg);
 
-		for (j = 0; j < NUM_ORDERS; j++) {
-			if (compound_order(page) == orders[j])
-				break;
+		if (reason == DF_UNDER_PRESSURE) {
+			__free_pages(page, compound_order(page));
+		} else {
+			for (j = 0; j < NUM_ORDERS; j++) {
+				if (compound_order(page) == orders[j])
+					break;
+			}
+			drm_page_pool_add(&pools[j], page);
 		}
-		drm_page_pool_add(&pools[j], page);
 	}
 	sg_free_table(table);
 	kfree(buffer);
 }
 
+static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
+{
+	struct system_heap_buffer *buffer = dmabuf->priv;
+	int npages = PAGE_ALIGN(buffer->len) / PAGE_SIZE;
+
+	deferred_free(&buffer->deferred_free, system_heap_buf_free, npages);
+}
+
 static const struct dma_buf_ops system_heap_buf_ops = {
 	.attach = system_heap_attach,
 	.detach = system_heap_detach,
-- 
2.25.1

