Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4652820F4
	for <lists+linux-media@lfdr.de>; Sat,  3 Oct 2020 06:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbgJCEDV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Oct 2020 00:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJCEDU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Oct 2020 00:03:20 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AD58C0613E8
        for <linux-media@vger.kernel.org>; Fri,  2 Oct 2020 21:03:18 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id i3so2131646pjz.4
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2020 21:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tpTaD+pd4ck4bVP3jdYyxJbjW42E08ISZPU7AHa+XuI=;
        b=iCtAp16i2PFqCuAtAc95pctbZClTzNcfeELmUCYBbz+JDgZFdJjc0ge+UW+FHMbNfh
         UrI0haS/vXZV+aUY9NLhpLM8R1G9G10iO44wZ5pKo1Ojd2xDJqr+TaMTIu2j1nU3hN3+
         L6cXOWui/1+aw3xCcYDN4c9ohitsWYOwJkOUXSWRf0mjoGhfuqIAg/i94L09LkwUxsP5
         I7gYH7jrY6i3VFNxRuwHqfW97kkF3mF3eGO550s63rK3LzEGo1fu/DIAVXsLAHd997bd
         WH30VF3FZrXEq4+mV31Yt9rgnaJ3ivCqg1/j3J6vmLZO2pIqYUP7v1SnRqJ975C38mN4
         cvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tpTaD+pd4ck4bVP3jdYyxJbjW42E08ISZPU7AHa+XuI=;
        b=Ifu3nhl0uSBVuQNygH5uierrwZWjTwxGo1BhLhvtmBuQePbUhvIjEhUXVUK0MmHiUc
         rME7Nl3UgyzPhaPaKiAUksJQxlsJpoN4mNiSNIKdxV6DAIRK8FGuiI9/j0hlXKCA+B0z
         CJqNIF2f4bsMQzdhM0wqAXv9+CFN7Sn1DX7NlXnaOeQ4dSCf9wJLO38NYz7E8ULbW9Fn
         4mudCW8FElkAfjVaDy18QLJu0UoSwwBW3cONplSolJ8We/YGOmAWQbzLifoiwAzZLLUj
         UF/1AMFtvGtRCpYUbkIQwNNywFtNsHeMVRKKpkJ0vHKqwNGP70u/C+fuaFmSuH/eb+GB
         EsRA==
X-Gm-Message-State: AOAM531gmSNJ9fdm6mNwo016mDdRTocklvnQFLF/Fvx50paQar6/pasw
        zsT0P9mVA/OwpoCX0/5wXvgrig==
X-Google-Smtp-Source: ABdhPJxtWqhtvVCWUchRdru+/v7VgHdom2HPrTSSjkwt5rvTB7sDHJfAy64XBhzTdVSAJlo5uf1IMA==
X-Received: by 2002:a17:90a:da06:: with SMTP id e6mr5906398pjv.8.1601697797650;
        Fri, 02 Oct 2020 21:03:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id 190sm3909290pfy.22.2020.10.02.21.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 21:03:16 -0700 (PDT)
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
Subject: [PATCH v3 7/7] dma-buf: system_heap: Add a system-uncached heap re-using the system heap
Date:   Sat,  3 Oct 2020 04:02:57 +0000
Message-Id: <20201003040257.62768-8-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201003040257.62768-1-john.stultz@linaro.org>
References: <20201003040257.62768-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds a heap that allocates non-contiguous buffers that are
marked as writecombined, so they are not cached by the CPU.

This is useful, as most graphics buffers are usually not touched
by the CPU or only written into once by the CPU. So when mapping
the buffer over and over between devices, we can skip the CPU
syncing, which saves a lot of cache management overhead, greatly
improving performance.

For folk using ION, there was a ION_FLAG_CACHED flag, which
signaled if the returned buffer should be CPU cacheable or not.
With DMA-BUF heaps, we do not yet have such a flag, and by default
the current heaps (system and cma) produce CPU cachable buffers.
So for folks transitioning from ION to DMA-BUF Heaps, this fills
in some of that missing functionality.

There has been a suggestion to make this functionality a flag
(DMAHEAP_FLAG_UNCACHED?) on the system heap, similar to how
ION used the ION_FLAG_CACHED. But I want to make sure an
_UNCACHED flag would truely be a generic attribute across all
heaps. So far that has been unclear, so having it as a separate
heap seemes better for now. (But I'm open to discussion on this
point!)

This is a rework of earlier efforts to add a uncached system heap,
done utilizing the exisitng system heap, adding just a bit of
logic to handle the uncached case.

Feedback would be very welcome!

Many thanks to Liam Mark for his help to get this working.

Pending opensource users of this code include:
* AOSP HiKey960 gralloc:
  - https://android-review.googlesource.com/c/device/linaro/hikey/+/1399519
  - Visibly improves performance over the system heap
* AOSP Codec2 (possibly, needs more review):
  - https://android-review.googlesource.com/c/platform/frameworks/av/+/1360640/17/media/codec2/vndk/C2DmaBufAllocator.cpp#325

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
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/dma-buf/heaps/system_heap.c | 87 ++++++++++++++++++++++++++---
 1 file changed, 79 insertions(+), 8 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 2b8d4b6abacb..952f1fd9dacf 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -22,6 +22,7 @@
 #include <linux/vmalloc.h>
 
 struct dma_heap *sys_heap;
+struct dma_heap *sys_uncached_heap;
 
 struct system_heap_buffer {
 	struct dma_heap *heap;
@@ -31,6 +32,8 @@ struct system_heap_buffer {
 	struct sg_table sg_table;
 	int vmap_cnt;
 	void *vaddr;
+
+	bool uncached;
 };
 
 struct dma_heap_attachment {
@@ -38,6 +41,8 @@ struct dma_heap_attachment {
 	struct sg_table *table;
 	struct list_head list;
 	bool mapped;
+
+	bool uncached;
 };
 
 #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
@@ -94,7 +99,7 @@ static int system_heap_attach(struct dma_buf *dmabuf,
 	a->dev = attachment->dev;
 	INIT_LIST_HEAD(&a->list);
 	a->mapped = false;
-
+	a->uncached = buffer->uncached;
 	attachment->priv = a;
 
 	mutex_lock(&buffer->lock);
@@ -124,9 +129,13 @@ static struct sg_table *system_heap_map_dma_buf(struct dma_buf_attachment *attac
 {
 	struct dma_heap_attachment *a = attachment->priv;
 	struct sg_table *table = a->table;
+	int attr = 0;
 	int ret;
 
-	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
+	if (a->uncached)
+		attr = DMA_ATTR_SKIP_CPU_SYNC;
+
+	ret = dma_map_sgtable(attachment->dev, table, direction, attr);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -139,9 +148,12 @@ static void system_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
 				      enum dma_data_direction direction)
 {
 	struct dma_heap_attachment *a = attachment->priv;
+	int attr = 0;
 
+	if (a->uncached)
+		attr = DMA_ATTR_SKIP_CPU_SYNC;
 	a->mapped = false;
-	dma_unmap_sgtable(attachment->dev, table, direction, 0);
+	dma_unmap_sgtable(attachment->dev, table, direction, attr);
 }
 
 static int system_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
@@ -150,6 +162,9 @@ static int system_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 	struct system_heap_buffer *buffer = dmabuf->priv;
 	struct dma_heap_attachment *a;
 
+	if (buffer->uncached)
+		return 0;
+
 	mutex_lock(&buffer->lock);
 
 	if (buffer->vmap_cnt)
@@ -171,6 +186,9 @@ static int system_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
 	struct system_heap_buffer *buffer = dmabuf->priv;
 	struct dma_heap_attachment *a;
 
+	if (buffer->uncached)
+		return 0;
+
 	mutex_lock(&buffer->lock);
 
 	if (buffer->vmap_cnt)
@@ -194,6 +212,9 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
 	struct sg_page_iter piter;
 	int ret;
 
+	if (buffer->uncached)
+		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+
 	for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
 		struct page *page = sg_page_iter_page(&piter);
 
@@ -215,8 +236,12 @@ static void *system_heap_do_vmap(struct system_heap_buffer *buffer)
 	struct page **pages = vmalloc(sizeof(struct page *) * npages);
 	struct page **tmp = pages;
 	struct sg_page_iter piter;
+	pgprot_t pgprot = PAGE_KERNEL;
 	void *vaddr;
 
+	if (buffer->uncached)
+		pgprot = pgprot_writecombine(PAGE_KERNEL);
+
 	if (!pages)
 		return ERR_PTR(-ENOMEM);
 
@@ -225,7 +250,7 @@ static void *system_heap_do_vmap(struct system_heap_buffer *buffer)
 		*tmp++ = sg_page_iter_page(&piter);
 	}
 
-	vaddr = vmap(pages, npages, VM_MAP, PAGE_KERNEL);
+	vaddr = vmap(pages, npages, VM_MAP, pgprot);
 	vfree(pages);
 
 	if (!vaddr)
@@ -278,6 +303,10 @@ static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
 	int i;
 
 	table = &buffer->sg_table;
+	/* Unmap the uncached buffers from the heap device (pairs with the map on allocate) */
+	if (buffer->uncached)
+		dma_unmap_sgtable(dma_heap_get_dev(buffer->heap), table, DMA_BIDIRECTIONAL, 0);
+
 	for_each_sg(table->sgl, sg, table->nents, i) {
 		struct page *page = sg_page(sg);
 
@@ -320,10 +349,11 @@ static struct page *alloc_largest_available(unsigned long size,
 	return NULL;
 }
 
-static int system_heap_allocate(struct dma_heap *heap,
-				unsigned long len,
-				unsigned long fd_flags,
-				unsigned long heap_flags)
+static int system_heap_do_allocate(struct dma_heap *heap,
+				   unsigned long len,
+				   unsigned long fd_flags,
+				   unsigned long heap_flags,
+				   bool uncached)
 {
 	struct system_heap_buffer *buffer;
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
@@ -344,6 +374,7 @@ static int system_heap_allocate(struct dma_heap *heap,
 	mutex_init(&buffer->lock);
 	buffer->heap = heap;
 	buffer->len = len;
+	buffer->uncached = uncached;
 
 	INIT_LIST_HEAD(&pages);
 	i = 0;
@@ -393,6 +424,16 @@ static int system_heap_allocate(struct dma_heap *heap,
 		/* just return, as put will call release and that will free */
 		return ret;
 	}
+
+	/*
+	 * For uncached buffers, we need to initially flush cpu cache, since
+	 * the __GFP_ZERO on the allocation means the zeroing was done by the
+	 * cpu and thus it is likely cached. Map (and implicitly flush) it out
+	 * now so we don't get corruption later on.
+	 */
+	if (buffer->uncached)
+		dma_map_sgtable(dma_heap_get_dev(heap), table, DMA_BIDIRECTIONAL, 0);
+
 	return ret;
 
 free_pages:
@@ -410,10 +451,30 @@ static int system_heap_allocate(struct dma_heap *heap,
 	return ret;
 }
 
+static int system_heap_allocate(struct dma_heap *heap,
+				unsigned long len,
+				unsigned long fd_flags,
+				unsigned long heap_flags)
+{
+	return system_heap_do_allocate(heap, len, fd_flags, heap_flags, false);
+}
+
 static const struct dma_heap_ops system_heap_ops = {
 	.allocate = system_heap_allocate,
 };
 
+static int system_uncached_heap_allocate(struct dma_heap *heap,
+					 unsigned long len,
+					 unsigned long fd_flags,
+					 unsigned long heap_flags)
+{
+	return system_heap_do_allocate(heap, len, fd_flags, heap_flags, true);
+}
+
+static const struct dma_heap_ops system_uncached_heap_ops = {
+	.allocate = system_uncached_heap_allocate,
+};
+
 static int system_heap_create(void)
 {
 	struct dma_heap_export_info exp_info;
@@ -426,6 +487,16 @@ static int system_heap_create(void)
 	if (IS_ERR(sys_heap))
 		return PTR_ERR(sys_heap);
 
+	exp_info.name = "system-uncached";
+	exp_info.ops = &system_uncached_heap_ops;
+	exp_info.priv = NULL;
+
+	sys_uncached_heap = dma_heap_add(&exp_info);
+	if (IS_ERR(sys_uncached_heap))
+		return PTR_ERR(sys_heap);
+
+	dma_coerce_mask_and_coherent(dma_heap_get_dev(sys_uncached_heap), DMA_BIT_MASK(64));
+
 	return 0;
 }
 module_init(system_heap_create);
-- 
2.17.1

