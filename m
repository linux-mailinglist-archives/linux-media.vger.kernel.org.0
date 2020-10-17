Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10FDD290FE4
	for <lists+linux-media@lfdr.de>; Sat, 17 Oct 2020 08:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436991AbgJQGC0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Oct 2020 02:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436858AbgJQGBj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Oct 2020 02:01:39 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D992C0613BD
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 18:33:17 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id o9so2160972plx.10
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 18:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6oHXHsrLfgpTNXoI1E5O96yDTjCsZQKa/PUoP1mStQ0=;
        b=cUiPeL3FFnLfOGlkp+FRVgZGoW9QTOselzAKWpxe0hC2UMDNCugE7dcBYBPuq8r80A
         iXE2K4jr7y345HhFFjYSI5NVr8bW0iDtBqvVvsfwdWgwASNxNmxRXzMMHC5axuwAB9G9
         FYsFWP02nI5ns8rTbxaurL7mCxgAlR6fEBzS69L7h3Kvm70d8MVxRLZaL8wophkH21A1
         rUEbPBdOvilpjUCyxMXG4UbvMWmP1Z10tfq5yoOVngbdRnuPkuHJ0V0j2AeHHni7bvtb
         9VBhpHQqZOJCeC6q+b1M1Njkr3Zf78Xf0Z5R9jQeqxNdfGc6JxK5X9YHi8TVoAnZSi4r
         BfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6oHXHsrLfgpTNXoI1E5O96yDTjCsZQKa/PUoP1mStQ0=;
        b=oc8vFJcXM0R71BbZdsKxHmrF5od8t5urOTwlrFW6K9miTWnLxKGjGUx/f0gqgjllTt
         UZdLJI6XdVya0lMiaH0n4DV6NDUFsgZgXAgFFK870ddKLdFxfXtNUSbD0/KMPdidrVcC
         mqIFnQR9dhKJFB2xsA1pMbKBM6pyb0pCUsKwu0EPlmofy0pkxrBOQPVnasaru6R5swJK
         iY47akNdaOFBSfEsal+yq3dcjBmkisiemXaOHZIT2bQYk5G9IG24NwOnyMnR97nZnSDB
         N4flTNDfwg/8w8OeXs4GUi64fUfs+SbHAigUIvjOyfr8c9Sq6iWVhtwOMFK/yyLYnvt9
         X6GQ==
X-Gm-Message-State: AOAM530Lb4X1m2Az1JyxYAp+Y/fiBxWQUQ7stLqo+Dw6CnxTix1pAokV
        m6ukbGqDzlFUmIBeCgMxT2uz/A==
X-Google-Smtp-Source: ABdhPJwXUMDQW5DbNK8+xbjk7S3Noz5N4La1PstaIPJE8mBaqUIjrh3Ki4Q90tk0FCMQx44QPDa2QA==
X-Received: by 2002:a17:90a:d3d5:: with SMTP id d21mr6636885pjw.168.1602898397098;
        Fri, 16 Oct 2020 18:33:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id e186sm4222122pfh.60.2020.10.16.18.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 18:33:16 -0700 (PDT)
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
Subject: [PATCH v4 7/7] dma-buf: system_heap: Add a system-uncached heap re-using the system heap
Date:   Sat, 17 Oct 2020 01:32:55 +0000
Message-Id: <20201017013255.43568-8-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201017013255.43568-1-john.stultz@linaro.org>
References: <20201017013255.43568-1-john.stultz@linaro.org>
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
v4:
* Make sys_uncached_heap static, as
    Reported-by: kernel test robot <lkp@intel.com>
* Fix wrong return value, caught by smatch
    Reported-by: kernel test robot <lkp@intel.com>
    Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
* Ensure we call flush/invalidate_kernel_vmap_range() in the
  uncached cases to try to address feedback about VIVT caches
  from Christoph
* Reorder a few lines as suggested by BrianS
* Avoid holding the initial mapping for the lifetime of the buffer
  as suggested by BrianS
* Fix a unlikely race between allocate and updating the dma_mask
  that BrianS noticed.
---
 drivers/dma-buf/heaps/system_heap.c | 111 ++++++++++++++++++++++++----
 1 file changed, 95 insertions(+), 16 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index ef4b2c1032df..a328c76249d2 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -22,6 +22,7 @@
 #include <linux/vmalloc.h>
 
 static struct dma_heap *sys_heap;
+static struct dma_heap *sys_uncached_heap;
 
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
@@ -155,10 +167,12 @@ static int system_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 	if (buffer->vmap_cnt)
 		invalidate_kernel_vmap_range(buffer->vaddr, buffer->len);
 
-	list_for_each_entry(a, &buffer->attachments, list) {
-		if (!a->mapped)
-			continue;
-		dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
+	if (!buffer->uncached) {
+		list_for_each_entry(a, &buffer->attachments, list) {
+			if (!a->mapped)
+				continue;
+			dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
+		}
 	}
 	mutex_unlock(&buffer->lock);
 
@@ -176,10 +190,12 @@ static int system_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
 	if (buffer->vmap_cnt)
 		flush_kernel_vmap_range(buffer->vaddr, buffer->len);
 
-	list_for_each_entry(a, &buffer->attachments, list) {
-		if (!a->mapped)
-			continue;
-		dma_sync_sgtable_for_device(a->dev, a->table, direction);
+	if (!buffer->uncached) {
+		list_for_each_entry(a, &buffer->attachments, list) {
+			if (!a->mapped)
+				continue;
+			dma_sync_sgtable_for_device(a->dev, a->table, direction);
+		}
 	}
 	mutex_unlock(&buffer->lock);
 
@@ -194,6 +210,9 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
 	struct sg_page_iter piter;
 	int ret;
 
+	if (buffer->uncached)
+		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+
 	for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
 		struct page *page = sg_page_iter_page(&piter);
 
@@ -215,17 +234,21 @@ static void *system_heap_do_vmap(struct system_heap_buffer *buffer)
 	struct page **pages = vmalloc(sizeof(struct page *) * npages);
 	struct page **tmp = pages;
 	struct sg_page_iter piter;
+	pgprot_t pgprot = PAGE_KERNEL;
 	void *vaddr;
 
 	if (!pages)
 		return ERR_PTR(-ENOMEM);
 
+	if (buffer->uncached)
+		pgprot = pgprot_writecombine(PAGE_KERNEL);
+
 	for_each_sgtable_page(table, &piter, 0) {
 		WARN_ON(tmp - pages >= npages);
 		*tmp++ = sg_page_iter_page(&piter);
 	}
 
-	vaddr = vmap(pages, npages, VM_MAP, PAGE_KERNEL);
+	vaddr = vmap(pages, npages, VM_MAP, pgprot);
 	vfree(pages);
 
 	if (!vaddr)
@@ -320,10 +343,11 @@ static struct page *alloc_largest_available(unsigned long size,
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
@@ -344,6 +368,7 @@ static int system_heap_allocate(struct dma_heap *heap,
 	mutex_init(&buffer->lock);
 	buffer->heap = heap;
 	buffer->len = len;
+	buffer->uncached = uncached;
 
 	INIT_LIST_HEAD(&pages);
 	i = 0;
@@ -393,6 +418,18 @@ static int system_heap_allocate(struct dma_heap *heap,
 		/* just return, as put will call release and that will free */
 		return ret;
 	}
+
+	/*
+	 * For uncached buffers, we need to initially flush cpu cache, since
+	 * the __GFP_ZERO on the allocation means the zeroing was done by the
+	 * cpu and thus it is likely cached. Map (and implicitly flush) and
+	 * unmap it now so we don't get corruption later on.
+	 */
+	if (buffer->uncached) {
+		dma_map_sgtable(dma_heap_get_dev(heap), table, DMA_BIDIRECTIONAL, 0);
+		dma_unmap_sgtable(dma_heap_get_dev(heap), table, DMA_BIDIRECTIONAL, 0);
+	}
+
 	return ret;
 
 free_pages:
@@ -410,10 +447,40 @@ static int system_heap_allocate(struct dma_heap *heap,
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
+/* Dummy function to be used until we can call coerce_mask_and_coherent */
+static int system_uncached_heap_not_initialized(struct dma_heap *heap,
+						unsigned long len,
+						unsigned long fd_flags,
+						unsigned long heap_flags)
+{
+	return -EBUSY;
+}
+
+static struct dma_heap_ops system_uncached_heap_ops = {
+	/* After system_heap_create is complete, we will swap this */
+	.allocate = system_uncached_heap_not_initialized,
+};
+
 static int system_heap_create(void)
 {
 	struct dma_heap_export_info exp_info;
@@ -426,6 +493,18 @@ static int system_heap_create(void)
 	if (IS_ERR(sys_heap))
 		return PTR_ERR(sys_heap);
 
+	exp_info.name = "system-uncached";
+	exp_info.ops = &system_uncached_heap_ops;
+	exp_info.priv = NULL;
+
+	sys_uncached_heap = dma_heap_add(&exp_info);
+	if (IS_ERR(sys_uncached_heap))
+		return PTR_ERR(sys_uncached_heap);
+
+	dma_coerce_mask_and_coherent(dma_heap_get_dev(sys_uncached_heap), DMA_BIT_MASK(64));
+	mb(); /* make sure we only set allocate after dma_mask is set */
+	system_uncached_heap_ops.allocate = system_uncached_heap_allocate;
+
 	return 0;
 }
 module_init(system_heap_create);
-- 
2.17.1

