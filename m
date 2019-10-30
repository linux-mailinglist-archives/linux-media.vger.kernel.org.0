Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2E6EEA4C0
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2019 21:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfJ3Uaf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Oct 2019 16:30:35 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:43967 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbfJ3Uaf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Oct 2019 16:30:35 -0400
Received: by mail-yw1-f66.google.com with SMTP id g77so1313485ywb.10
        for <linux-media@vger.kernel.org>; Wed, 30 Oct 2019 13:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B6FpqH14hFft7pUWCQ+8hRUCMFY4DUkbPtttlr/k7RM=;
        b=c/zVOMBC7jXLlWCXXTHISUru8FH/BOffylDZJmm0E7TPw9r8GsXiVQp18gniOkbYBp
         9wQQEIMB0xuHF2YhqNEBcvXhsUrW5aoG9dHz1B0geXTShvJaYmjM2Xs784NZoS7M0RSo
         TftqEsT8UtiRwMy6q3x0BLbbbRzk0O+CX8eXQ+idhREI/DfQAFGEpgePPfRSfnqBAIUo
         3dXAu5FF8E1docOp/4GWgMJsBr8KiMTRxdQhAdtr5mMskiBasI60DsQKljdEsSgeKhze
         C3XW7L1rXTIURbemEq11LZc30LkIacHPBlCPyHvNwkzFOVcHf+ZpiFExRgBM5935s9wq
         pt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B6FpqH14hFft7pUWCQ+8hRUCMFY4DUkbPtttlr/k7RM=;
        b=NZ8uUCDf1GmdGMJkNMzY8K1n6bx/6gJfLwYOAVsm4jaBVGjM6lmrCzzDwP34VhV+tJ
         WBvsz3wDtGpUsMBF8BCIxJVg+AyqB34HUqV4JvFQ+5b5umEXJa2okkaSOwGpNngfCbgy
         zj1Ssx9uEeRirBWUtaSgqGbGGfHNR8voWJdO3DqRLAe1Npk30KP5qYE+SHgGtd/Mwg63
         D6QlG4JInY9ktOIzj8v/G0V9yBGbxk9zKfhLWnUisx4FszGoPV0sirRDcJ81OHgcESpd
         UiwrkJ+tzqtwq0ZZMOy/vooHYqgjIZuiR3R3UNmgOfXCioIrdFaFT/aZ1LWmExj/Zog6
         O6Ug==
X-Gm-Message-State: APjAAAVEilgzMf1NM7qXuk6YmOMFcZVvFDWuZLYu5VrhQVz2fUPV44ml
        QoCvAObhHsnRi9gsAygjZSUeLA==
X-Google-Smtp-Source: APXvYqxVmw7MSEY0/hT9ZuOQEeutP/O+A9xovHgU06e0lgM12WV0zQ7f9zSKsH2a4mRdS7LHJiD1mw==
X-Received: by 2002:a81:7ac2:: with SMTP id v185mr1184192ywc.458.1572467434346;
        Wed, 30 Oct 2019 13:30:34 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id h35sm416432ywk.63.2019.10.30.13.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 13:30:33 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Laura Abbott <labbott@redhat.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Pratik Patel <pratikp@codeaurora.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Vincent Donnefort <Vincent.Donnefort@arm.com>,
        Sudipto Paul <Sudipto.Paul@arm.com>,
        "Andrew F . Davis" <afd@ti.com>,
        Christoph Hellwig <hch@infradead.org>,
        Chenbo Feng <fengc@google.com>,
        Alistair Strachan <astrachan@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        Hillf Danton <hdanton@sina.com>,
        Brian Starkey <brian.starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Sean Paul <sean@poorly.run>
Subject: [PATCH 2/5] Revert "dma-buf: heaps: Add CMA heap to dmabuf heaps"
Date:   Wed, 30 Oct 2019 16:29:51 -0400
Message-Id: <20191030203003.101156-3-sean@poorly.run>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
In-Reply-To: <20191030203003.101156-1-sean@poorly.run>
References: <20191030203003.101156-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

This reverts commit 43d7238fb9ac897b29912368b3359e72bae469c4.

This patchset doesn't meet the UAPI requirements set out in [1] for the DRM
subsystem. Once the userspace component is reviewed and ready for merge
we can try again.

[1]- https://01.org/linuxgraphics/gfx-docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements

Fixes: 43d7238fb9ac ("dma-buf: heaps: Add CMA heap to dmabuf heaps")
Cc: Laura Abbott <labbott@redhat.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Pratik Patel <pratikp@codeaurora.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Vincent Donnefort <Vincent.Donnefort@arm.com>
Cc: Sudipto Paul <Sudipto.Paul@arm.com>
Cc: Andrew F. Davis <afd@ti.com>
Cc: Christoph Hellwig <hch@infradead.org>
Cc: Chenbo Feng <fengc@google.com>
Cc: Alistair Strachan <astrachan@google.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Hillf Danton <hdanton@sina.com>
Cc: dri-devel@lists.freedesktop.org
Cc: Brian Starkey <brian.starkey@arm.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: "Andrew F. Davis" <afd@ti.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Sean Paul <sean@poorly.run>
---
 drivers/dma-buf/heaps/Kconfig    |   8 --
 drivers/dma-buf/heaps/Makefile   |   1 -
 drivers/dma-buf/heaps/cma_heap.c | 178 -------------------------------
 3 files changed, 187 deletions(-)
 delete mode 100644 drivers/dma-buf/heaps/cma_heap.c

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c4226..205052744169 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -4,11 +4,3 @@ config DMABUF_HEAPS_SYSTEM
 	help
 	  Choose this option to enable the system dmabuf heap. The system heap
 	  is backed by pages from the buddy allocator. If in doubt, say Y.
-
-config DMABUF_HEAPS_CMA
-	bool "DMA-BUF CMA Heap"
-	depends on DMABUF_HEAPS && DMA_CMA
-	help
-	  Choose this option to enable dma-buf CMA heap. This heap is backed
-	  by the Contiguous Memory Allocator (CMA). If your system has these
-	  regions, you should say Y here.
diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
index 6e54cdec3da0..d1808eca2581 100644
--- a/drivers/dma-buf/heaps/Makefile
+++ b/drivers/dma-buf/heaps/Makefile
@@ -1,4 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y					+= heap-helpers.o
 obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
-obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
deleted file mode 100644
index 064926b5d735..000000000000
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ /dev/null
@@ -1,178 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * DMABUF CMA heap exporter
- *
- * Copyright (C) 2012, 2019 Linaro Ltd.
- * Author: <benjamin.gaignard@linaro.org> for ST-Ericsson.
- */
-
-#include <linux/cma.h>
-#include <linux/device.h>
-#include <linux/dma-buf.h>
-#include <linux/dma-heap.h>
-#include <linux/dma-contiguous.h>
-#include <linux/err.h>
-#include <linux/errno.h>
-#include <linux/highmem.h>
-#include <linux/module.h>
-#include <linux/slab.h>
-#include <linux/scatterlist.h>
-#include <linux/sched/signal.h>
-
-#include "heap-helpers.h"
-
-struct cma_heap {
-	struct dma_heap *heap;
-	struct cma *cma;
-};
-
-static void cma_heap_free(struct heap_helper_buffer *buffer)
-{
-	struct cma_heap *cma_heap = dma_heap_get_drvdata(buffer->heap);
-	unsigned long nr_pages = buffer->pagecount;
-	struct page *cma_pages = buffer->priv_virt;
-
-	/* free page list */
-	kfree(buffer->pages);
-	/* release memory */
-	cma_release(cma_heap->cma, cma_pages, nr_pages);
-	kfree(buffer);
-}
-
-/* dmabuf heap CMA operations functions */
-static int cma_heap_allocate(struct dma_heap *heap,
-			     unsigned long len,
-			     unsigned long fd_flags,
-			     unsigned long heap_flags)
-{
-	struct cma_heap *cma_heap = dma_heap_get_drvdata(heap);
-	struct heap_helper_buffer *helper_buffer;
-	struct page *cma_pages;
-	size_t size = PAGE_ALIGN(len);
-	unsigned long nr_pages = size >> PAGE_SHIFT;
-	unsigned long align = get_order(size);
-	struct dma_buf *dmabuf;
-	int ret = -ENOMEM;
-	pgoff_t pg;
-
-	if (align > CONFIG_CMA_ALIGNMENT)
-		align = CONFIG_CMA_ALIGNMENT;
-
-	helper_buffer = kzalloc(sizeof(*helper_buffer), GFP_KERNEL);
-	if (!helper_buffer)
-		return -ENOMEM;
-
-	init_heap_helper_buffer(helper_buffer, cma_heap_free);
-	helper_buffer->flags = heap_flags;
-	helper_buffer->heap = heap;
-	helper_buffer->size = len;
-
-	cma_pages = cma_alloc(cma_heap->cma, nr_pages, align, false);
-	if (!cma_pages)
-		goto free_buf;
-
-	if (PageHighMem(cma_pages)) {
-		unsigned long nr_clear_pages = nr_pages;
-		struct page *page = cma_pages;
-
-		while (nr_clear_pages > 0) {
-			void *vaddr = kmap_atomic(page);
-
-			memset(vaddr, 0, PAGE_SIZE);
-			kunmap_atomic(vaddr);
-			/*
-			 * Avoid wasting time zeroing memory if the process
-			 * has been killed by by SIGKILL
-			 */
-			if (fatal_signal_pending(current))
-				goto free_cma;
-
-			page++;
-			nr_clear_pages--;
-		}
-	} else {
-		memset(page_address(cma_pages), 0, size);
-	}
-
-	helper_buffer->pagecount = nr_pages;
-	helper_buffer->pages = kmalloc_array(helper_buffer->pagecount,
-					     sizeof(*helper_buffer->pages),
-					     GFP_KERNEL);
-	if (!helper_buffer->pages) {
-		ret = -ENOMEM;
-		goto free_cma;
-	}
-
-	for (pg = 0; pg < helper_buffer->pagecount; pg++)
-		helper_buffer->pages[pg] = &cma_pages[pg];
-
-	/* create the dmabuf */
-	dmabuf = heap_helper_export_dmabuf(helper_buffer, fd_flags);
-	if (IS_ERR(dmabuf)) {
-		ret = PTR_ERR(dmabuf);
-		goto free_pages;
-	}
-
-	helper_buffer->dmabuf = dmabuf;
-	helper_buffer->priv_virt = cma_pages;
-
-	ret = dma_buf_fd(dmabuf, fd_flags);
-	if (ret < 0) {
-		dma_buf_put(dmabuf);
-		/* just return, as put will call release and that will free */
-		return ret;
-	}
-
-	return ret;
-
-free_pages:
-	kfree(helper_buffer->pages);
-free_cma:
-	cma_release(cma_heap->cma, cma_pages, nr_pages);
-free_buf:
-	kfree(helper_buffer);
-	return ret;
-}
-
-static const struct dma_heap_ops cma_heap_ops = {
-	.allocate = cma_heap_allocate,
-};
-
-static int __add_cma_heap(struct cma *cma, void *data)
-{
-	struct cma_heap *cma_heap;
-	struct dma_heap_export_info exp_info;
-
-	cma_heap = kzalloc(sizeof(*cma_heap), GFP_KERNEL);
-	if (!cma_heap)
-		return -ENOMEM;
-	cma_heap->cma = cma;
-
-	exp_info.name = cma_get_name(cma);
-	exp_info.ops = &cma_heap_ops;
-	exp_info.priv = cma_heap;
-
-	cma_heap->heap = dma_heap_add(&exp_info);
-	if (IS_ERR(cma_heap->heap)) {
-		int ret = PTR_ERR(cma_heap->heap);
-
-		kfree(cma_heap);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int add_default_cma_heap(void)
-{
-	struct cma *default_cma = dev_get_cma_area(NULL);
-	int ret = 0;
-
-	if (default_cma)
-		ret = __add_cma_heap(default_cma, NULL);
-
-	return ret;
-}
-module_init(add_default_cma_heap);
-MODULE_DESCRIPTION("DMA-BUF CMA Heap");
-MODULE_LICENSE("GPL v2");
-- 
Sean Paul, Software Engineer, Google / Chromium OS

