Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E73202ACC0C
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 04:49:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731612AbgKJDtt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 22:49:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731341AbgKJDts (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 22:49:48 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75F6CC0613CF
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 19:49:48 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id i26so8997098pgl.5
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 19:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dg+HWiattbb0YUCixG+Sovx8a/O69Dm3KomejO6pPhc=;
        b=GXOQC/bGP2utp1lXw96zPu6QCZnqJ8frrwBLVTFaNXz+KRxUtFxCqsiiJ67RfkloJx
         iDDWwwqQmTvDSrb/fW7lYfKkdx50Xpibi99alFHlapg6dh3Jlne3jl3yrBndukKEcENG
         vNu6bi9kMGmUSvNGyDGdU/uUsfLUockjoeNNXWb988htABXF4aKqPKyOG2ppvrZ0c4vg
         SgrMAV31Xara/14LkJ408CkzxrXPpLsqZZQSuvFbAQVkSlwj+dCwFMHl1uY2ge1hpiVn
         aNQZH/rUTHBa1bi7q6niUHGCOMktv8Bx7aJS/3Pb7RJ+Fp4BrBum5OUCGuMzIsFxHekQ
         P/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dg+HWiattbb0YUCixG+Sovx8a/O69Dm3KomejO6pPhc=;
        b=LQyxr/RQjoNAlqEKAVvJDpZ73lB/aWCna/t5bO8XylRGRidpnHWrIaUsl37ufMsexV
         g8Zy+kwu4LqGWmoPCUZWB13AgMjHjr4YIRf5EqD3KbPOOMKeXBqOtspoJoE329eVXpv4
         BoiLB6dqL1GtCKqMPzX/MADwrjaMaWEaChIBeuHTBc4lX5/XxwDNg8WPw4NJfXKohd03
         33e4mfNFjqyFvd33s8bl0UwH7hnijElpwUnFEVpfBvoIYJ5W5kR5cdzuofVQtWeDnsFL
         g9vavSWhX113jpwLDKg08gVmA0ycImZjGoK3yurpZFgdKstf5Ukk6osBQ3cAPCiTunc3
         9Ndg==
X-Gm-Message-State: AOAM533bSqk5OMf5akpXxizlefungtOnNEKdXz/OchmSQKal2180rcvl
        BoMUU1cfLXN1wa8XAw6zFZDEaQ==
X-Google-Smtp-Source: ABdhPJzfl1SE5LpW7JFvdGVZ0+BnnjHoLcBA4CttW0wiaba+tHDmDKOXhcA8yifyORzec/jxtkK1cw==
X-Received: by 2002:a17:90a:d201:: with SMTP id o1mr2775325pju.46.1604980188022;
        Mon, 09 Nov 2020 19:49:48 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id b4sm12380693pfi.208.2020.11.09.19.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 19:49:47 -0800 (PST)
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
Subject: [PATCH v5 7/7] dma-buf: system_heap: Add a system-uncached heap re-using the system heap
Date:   Tue, 10 Nov 2020 03:49:34 +0000
Message-Id: <20201110034934.70898-8-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201110034934.70898-1-john.stultz@linaro.org>
References: <20201110034934.70898-1-john.stultz@linaro.org>
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
index 55367266a47b..1fc5b38cbc59 100644
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
@@ -100,7 +105,7 @@ static int system_heap_attach(struct dma_buf *dmabuf,
 	a->dev = attachment->dev;
 	INIT_LIST_HEAD(&a->list);
 	a->mapped = false;
-
+	a->uncached = buffer->uncached;
 	attachment->priv = a;
 
 	mutex_lock(&buffer->lock);
@@ -130,9 +135,13 @@ static struct sg_table *system_heap_map_dma_buf(struct dma_buf_attachment *attac
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
 
@@ -145,9 +154,12 @@ static void system_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
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
@@ -161,10 +173,12 @@ static int system_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
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
 
@@ -182,10 +196,12 @@ static int system_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
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
 
@@ -200,6 +216,9 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
 	struct sg_page_iter piter;
 	int ret;
 
+	if (buffer->uncached)
+		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+
 	for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
 		struct page *page = sg_page_iter_page(&piter);
 
@@ -221,17 +240,21 @@ static void *system_heap_do_vmap(struct system_heap_buffer *buffer)
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
@@ -326,10 +349,11 @@ static struct page *alloc_largest_available(unsigned long size,
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
@@ -350,6 +374,7 @@ static int system_heap_allocate(struct dma_heap *heap,
 	mutex_init(&buffer->lock);
 	buffer->heap = heap;
 	buffer->len = len;
+	buffer->uncached = uncached;
 
 	INIT_LIST_HEAD(&pages);
 	i = 0;
@@ -399,6 +424,18 @@ static int system_heap_allocate(struct dma_heap *heap,
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
@@ -416,10 +453,40 @@ static int system_heap_allocate(struct dma_heap *heap,
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
@@ -432,6 +499,18 @@ static int system_heap_create(void)
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

