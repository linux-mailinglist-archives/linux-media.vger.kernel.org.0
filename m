Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57F632FDD06
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 00:40:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388016AbhATWOX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 17:14:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732871AbhATVKu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 16:10:50 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E706C061794
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 13:09:46 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id z21so16070862pgj.4
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 13:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H4+X0xWeooH24gYhSYvXX9x75t8RTwKg5FJ1Ffw/87E=;
        b=b+9dZxp4AirxgnJJSr4dySxi/WJW1ARIEAf6hNM3BR6rRHmNRJ1MZpwJ/OBt4UYMY8
         74ECTrUU5Uil9qGJ7UZJT3o60mz3sfiRSorXPkmty6sTDdyuLqvgUxyWgmcTJe2Tc/3Y
         hQDyLsBwYERkBEox9qzKb0srA+DM7+gD+ck9f2hcZZ4VifojYxJWZu5+h066eQNlqQkW
         WTNIByqh6IaEZEa2iqKZhuBmlIop5JUJslwRi0p3MgdJXLIuLzfzP0BoKR/uEb8aby56
         kW8NUHY2+Uvckz0UPPxHeKrgMis65PYRLsvnRES7q738rjV7tRJep+hw+/Iqm6OfsekA
         0riw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H4+X0xWeooH24gYhSYvXX9x75t8RTwKg5FJ1Ffw/87E=;
        b=lSNf96y0IY6/bj4vGxfjprKJ08AuNmICL2S+Z9bWL3ucvz4AG04DNcLhiFRAWVlXzj
         ajSh3CEXO2lxfffb2EKXh09BqJmjlj1lNnTeusvrsPzhS7ijH4hAb9xulTHAthuiAi9z
         K6FT3uwS5cU2RTHcdaCw1O6sx4DC2bch31dfRlebtvhRLygW9eJgjs7rBdq14kyKGek8
         oalv4NhovJlQ12GEBwSXPeej0iYHKQq1NiMsirx/3M/qBN8AgKPOKkpKwlb/bWtBWaTD
         sqINWIqusblpPX4wMAauLFesjmQI2P46HH/G/4mtt8gQtySMWcrR36bxaHdm9puReXCk
         goEA==
X-Gm-Message-State: AOAM530UuX6enzyRq8otVwaE5Ev3p3TJ7dJB2yqL6ID4c6u12/WOQgO8
        U+mKalyiRfTv/yriL010i7xUJw==
X-Google-Smtp-Source: ABdhPJyv4JjWfOCxuhxS+jF+NOmU+TvHCVz4VkCmpOfeGTszmzT23aBKlf3HPpm7AJDat28vcTMDGA==
X-Received: by 2002:a62:8fca:0:b029:1a9:39bc:ed37 with SMTP id n193-20020a628fca0000b02901a939bced37mr10984394pfd.61.1611176985973;
        Wed, 20 Jan 2021 13:09:45 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id f15sm3265629pja.24.2021.01.20.13.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 13:09:45 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     Bing Song <bing.song@nxp.com>, Daniel Vetter <daniel@ffwll.ch>,
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
        dri-devel@lists.freedesktop.org,
        John Stultz <john.stultz@linaro.org>
Subject: [PATCH 3/3] dma-buf: cma_heap: Add a cma-uncached heap re-using the cma heap
Date:   Wed, 20 Jan 2021 21:09:37 +0000
Message-Id: <20210120210937.15069-4-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210120210937.15069-1-john.stultz@linaro.org>
References: <20210120210937.15069-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bing Song <bing.song@nxp.com>

This adds a heap that allocates CMA buffers that are
marked as writecombined, so they are not cached by the CPU.

Cc: Daniel Vetter <daniel@ffwll.ch>
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
Signed-off-by: Bing Song <bing.song@nxp.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/dma-buf/heaps/cma_heap.c | 119 +++++++++++++++++++++++++++----
 1 file changed, 107 insertions(+), 12 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 364fc2f3e499..1b8c6eb0a8ea 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -38,6 +38,7 @@ struct cma_heap_buffer {
 	pgoff_t pagecount;
 	int vmap_cnt;
 	void *vaddr;
+	bool uncached;
 };
 
 struct dma_heap_attachment {
@@ -45,6 +46,7 @@ struct dma_heap_attachment {
 	struct sg_table table;
 	struct list_head list;
 	bool mapped;
+	bool uncached;
 };
 
 static int cma_heap_attach(struct dma_buf *dmabuf,
@@ -70,6 +72,7 @@ static int cma_heap_attach(struct dma_buf *dmabuf,
 	a->dev = attachment->dev;
 	INIT_LIST_HEAD(&a->list);
 	a->mapped = false;
+	a->uncached = buffer->uncached;
 
 	attachment->priv = a;
 
@@ -99,8 +102,12 @@ static struct sg_table *cma_heap_map_dma_buf(struct dma_buf_attachment *attachme
 {
 	struct dma_heap_attachment *a = attachment->priv;
 	struct sg_table *table = &a->table;
+	int attr = 0;
 	int ret;
 
+	if (a->uncached)
+		attr = DMA_ATTR_SKIP_CPU_SYNC;
+
 	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
 	if (ret)
 		return ERR_PTR(-ENOMEM);
@@ -113,7 +120,10 @@ static void cma_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
 				   enum dma_data_direction direction)
 {
 	struct dma_heap_attachment *a = attachment->priv;
+	int attr = 0;
 
+	if (a->uncached)
+		attr = DMA_ATTR_SKIP_CPU_SYNC;
 	a->mapped = false;
 	dma_unmap_sgtable(attachment->dev, table, direction, 0);
 }
@@ -128,10 +138,12 @@ static int cma_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 		invalidate_kernel_vmap_range(buffer->vaddr, buffer->len);
 
 	mutex_lock(&buffer->lock);
-	list_for_each_entry(a, &buffer->attachments, list) {
-		if (!a->mapped)
-			continue;
-		dma_sync_sgtable_for_cpu(a->dev, &a->table, direction);
+	if (!buffer->uncached) {
+		list_for_each_entry(a, &buffer->attachments, list) {
+			if (!a->mapped)
+				continue;
+			dma_sync_sgtable_for_cpu(a->dev, &a->table, direction);
+		}
 	}
 	mutex_unlock(&buffer->lock);
 
@@ -148,10 +160,12 @@ static int cma_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
 		flush_kernel_vmap_range(buffer->vaddr, buffer->len);
 
 	mutex_lock(&buffer->lock);
-	list_for_each_entry(a, &buffer->attachments, list) {
-		if (!a->mapped)
-			continue;
-		dma_sync_sgtable_for_device(a->dev, &a->table, direction);
+	if (!buffer->uncached) {
+		list_for_each_entry(a, &buffer->attachments, list) {
+			if (!a->mapped)
+				continue;
+			dma_sync_sgtable_for_device(a->dev, &a->table, direction);
+		}
 	}
 	mutex_unlock(&buffer->lock);
 
@@ -183,6 +197,9 @@ static int cma_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
 	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
 		return -EINVAL;
 
+	if (buffer->uncached)
+		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+
 	vma->vm_ops = &dma_heap_vm_ops;
 	vma->vm_private_data = buffer;
 
@@ -191,9 +208,13 @@ static int cma_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
 
 static void *cma_heap_do_vmap(struct cma_heap_buffer *buffer)
 {
+	pgprot_t pgprot = PAGE_KERNEL;
 	void *vaddr;
 
-	vaddr = vmap(buffer->pages, buffer->pagecount, VM_MAP, PAGE_KERNEL);
+	if (buffer->uncached)
+		pgprot = pgprot_writecombine(PAGE_KERNEL);
+
+	vaddr = vmap(buffer->pages, buffer->pagecount, VM_MAP, pgprot);
 	if (!vaddr)
 		return ERR_PTR(-ENOMEM);
 
@@ -271,10 +292,11 @@ static const struct dma_buf_ops cma_heap_buf_ops = {
 	.release = cma_heap_dma_buf_release,
 };
 
-static int cma_heap_allocate(struct dma_heap *heap,
+static int cma_heap_do_allocate(struct dma_heap *heap,
 				  unsigned long len,
 				  unsigned long fd_flags,
-				  unsigned long heap_flags)
+				  unsigned long heap_flags,
+				  bool uncached)
 {
 	struct cma_heap *cma_heap = dma_heap_get_drvdata(heap);
 	struct cma_heap_buffer *buffer;
@@ -283,8 +305,9 @@ static int cma_heap_allocate(struct dma_heap *heap,
 	pgoff_t pagecount = size >> PAGE_SHIFT;
 	unsigned long align = get_order(size);
 	struct page *cma_pages;
+	struct sg_table table;
 	struct dma_buf *dmabuf;
-	int ret = -ENOMEM;
+	int ret = -ENOMEM, ret_sg_table;
 	pgoff_t pg;
 
 	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
@@ -294,6 +317,7 @@ static int cma_heap_allocate(struct dma_heap *heap,
 	INIT_LIST_HEAD(&buffer->attachments);
 	mutex_init(&buffer->lock);
 	buffer->len = size;
+	buffer->uncached = uncached;
 
 	if (align > CONFIG_CMA_ALIGNMENT)
 		align = CONFIG_CMA_ALIGNMENT;
@@ -356,6 +380,18 @@ static int cma_heap_allocate(struct dma_heap *heap,
 		return ret;
 	}
 
+	if (buffer->uncached) {
+		ret_sg_table = sg_alloc_table(&table, 1, GFP_KERNEL);
+		if (ret_sg_table)
+			return ret_sg_table;
+
+		sg_set_page(table.sgl, cma_pages, size, 0);
+
+		dma_map_sgtable(dma_heap_get_dev(heap), &table, DMA_BIDIRECTIONAL, 0);
+		dma_unmap_sgtable(dma_heap_get_dev(heap), &table, DMA_BIDIRECTIONAL, 0);
+		sg_free_table(&table);
+	}
+
 	return ret;
 
 free_pages:
@@ -368,14 +404,45 @@ static int cma_heap_allocate(struct dma_heap *heap,
 	return ret;
 }
 
+static int cma_heap_allocate(struct dma_heap *heap,
+				  unsigned long len,
+				  unsigned long fd_flags,
+				  unsigned long heap_flags)
+{
+	return cma_heap_do_allocate(heap, len, fd_flags, heap_flags, false);
+}
+
+static int cma_uncached_heap_allocate(struct dma_heap *heap,
+				  unsigned long len,
+				  unsigned long fd_flags,
+				  unsigned long heap_flags)
+{
+	return cma_heap_do_allocate(heap, len, fd_flags, heap_flags, true);
+}
+
+/* Dummy function to be used until we can call coerce_mask_and_coherent */
+static int cma_uncached_heap_not_initialized(struct dma_heap *heap,
+						unsigned long len,
+						unsigned long fd_flags,
+						unsigned long heap_flags)
+{
+	return -EBUSY;
+}
+
 static const struct dma_heap_ops cma_heap_ops = {
 	.allocate = cma_heap_allocate,
 };
 
+static struct dma_heap_ops cma_uncached_heap_ops = {
+	.allocate = cma_uncached_heap_not_initialized,
+};
+
 static int __add_cma_heap(struct cma *cma, void *data)
 {
 	struct cma_heap *cma_heap;
 	struct dma_heap_export_info exp_info;
+	const char *postfixed = "-uncached";
+	char *cma_name;
 
 	cma_heap = kzalloc(sizeof(*cma_heap), GFP_KERNEL);
 	if (!cma_heap)
@@ -394,6 +461,34 @@ static int __add_cma_heap(struct cma *cma, void *data)
 		return ret;
 	}
 
+	cma_heap = kzalloc(sizeof(*cma_heap), GFP_KERNEL);
+	if (!cma_heap)
+		return -ENOMEM;
+	cma_heap->cma = cma;
+
+	cma_name = kzalloc(strlen(cma_get_name(cma)) + strlen(postfixed) + 1, GFP_KERNEL);
+	if (!cma_name) {
+		kfree(cma_heap);
+		return -ENOMEM;
+	}
+
+	exp_info.name = strcat(strcpy(cma_name, cma_get_name(cma)), postfixed);
+	exp_info.ops = &cma_uncached_heap_ops;
+	exp_info.priv = cma_heap;
+
+	cma_heap->heap = dma_heap_add(&exp_info);
+	if (IS_ERR(cma_heap->heap)) {
+		int ret = PTR_ERR(cma_heap->heap);
+
+		kfree(cma_heap);
+		kfree(cma_name);
+		return ret;
+	}
+
+	dma_coerce_mask_and_coherent(dma_heap_get_dev(cma_heap->heap), DMA_BIT_MASK(64));
+	mb(); /* make sure we only set allocate after dma_mask is set */
+	cma_uncached_heap_ops.allocate = cma_uncached_heap_allocate;
+
 	return 0;
 }
 
-- 
2.17.1

