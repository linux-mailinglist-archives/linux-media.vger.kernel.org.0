Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EFA42796A5
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 06:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730003AbgIZEY7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 00:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727495AbgIZEY7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 00:24:59 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E09CBC0613CE
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 21:24:58 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id kk9so488835pjb.2
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 21:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NEH7dSpxqauBk78qE1pmPtBx4lDfCsXkpGiAZ8uIYoU=;
        b=qYnAL5+5YevrqN1Msnjai60b/eeSbfx4+aAdG1jq+kWoKGB5iX+IJHR2gapx9udbGB
         oyJwv7pmiTIzpMSE/mDQoYU9AqpaGzogty93KtTaw++bljZMr3NrVaL90mW4ww5Sd3D0
         K01vIfSy/CNgnkUuLHgiKenT1urK4e6V7qwo5IjqEAymLlaqgZ6u7ZFfK0oRiytkTsbI
         iXSA/LCin6mqBpDfNlr9VY/mKWmschenAgLKR4bcVjgyJmbOAuShUl+B5Unj4uIqHVF1
         8anJbl4ObNCpffkq1qEinuche4DSddCl1cPtq3ayZuokY33zv38QrK2d0F1X/BVW20Qf
         K6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NEH7dSpxqauBk78qE1pmPtBx4lDfCsXkpGiAZ8uIYoU=;
        b=Y6PzdBA47MyMXceXQKaEoJbkW6Zvd/jXTMdCnDZ2DBeCZOtpYeMGweSqXNkpXo8ehs
         FGcog8yeDZM73AZL26IMT/CTTjkeO/bfyQ7MiTa7m48DWkD2duTj8hsNWGJCMfaUxTKh
         9PabznaBCGlxmvyJbcvk3ijIAc0jKjop0rcO5fDU8xBZmcULgdEq8zucBMoyknkw+JT0
         Nq6sMxkoaGtdsYBQMVQpQ8wZ9TaTAsOPCjNOCnyNpzlOdyh4KaD1/D7Pu/odQEdU/+RG
         fwKVJelZe/c72LV/Z5nkxyQ7dsVZq1HLEzAZjikKiKKpTg28f5N7m3c1DjAUPqYUgIjQ
         Wyaw==
X-Gm-Message-State: AOAM531UU8d5ynDoUlTQ8gRIbmiWKHdDKWsOgdm9rKOgES0YtoS13UJ5
        wKlkFs9vptKVZWWL0SvFEx53MA==
X-Google-Smtp-Source: ABdhPJwetII4Mw9P6pPBXOCqMXrXkdH0dbYKAMabb15GOX4+ef7pGIUAr10E9lRSd+VVywrZzwLRLA==
X-Received: by 2002:a17:90a:f407:: with SMTP id ch7mr694079pjb.142.1601094298340;
        Fri, 25 Sep 2020 21:24:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id a5sm3585886pgk.13.2020.09.25.21.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 21:24:57 -0700 (PDT)
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
Subject: [RFC][PATCH 1/6] dma-buf: system_heap: Rework system heap to use sgtables instead of pagelists
Date:   Sat, 26 Sep 2020 04:24:48 +0000
Message-Id: <20200926042453.67517-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200926042453.67517-1-john.stultz@linaro.org>
References: <20200926042453.67517-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In preparation for some patches to optmize the system
heap code, rework the dmabuf exporter to utilize sgtables rather
then pageslists for tracking the associated pages.

This will allow for large order page allocations, as well as
more efficient page pooling.

In doing so, the system heap stops using the heap-helpers logic
which sadly is not quite as generic as I was hoping it to be, so
this patch adds heap specific implementations of the dma_buf_ops
function handlers.

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
 drivers/dma-buf/heaps/system_heap.c | 343 ++++++++++++++++++++++++----
 1 file changed, 297 insertions(+), 46 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 0bf688e3c023..ddfa17dc48a8 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -3,7 +3,11 @@
  * DMABUF System heap exporter
  *
  * Copyright (C) 2011 Google, Inc.
- * Copyright (C) 2019 Linaro Ltd.
+ * Copyright (C) 2019, 2020 Linaro Ltd.
+ *
+ * Portions based off of Andrew Davis' SRAM heap:
+ * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ *	Andrew F. Davis <afd@ti.com>
  */
 
 #include <linux/dma-buf.h>
@@ -15,72 +19,320 @@
 #include <linux/module.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
-#include <linux/sched/signal.h>
-#include <asm/page.h>
-
-#include "heap-helpers.h"
+#include <linux/vmalloc.h>
 
 struct dma_heap *sys_heap;
 
-static void system_heap_free(struct heap_helper_buffer *buffer)
+struct system_heap_buffer {
+	struct dma_heap *heap;
+	struct list_head attachments;
+	struct mutex lock;
+	unsigned long len;
+	struct sg_table sg_table;
+	int vmap_cnt;
+	void *vaddr;
+};
+
+struct dma_heap_attachment {
+	struct device *dev;
+	struct sg_table *table;
+	struct list_head list;
+};
+
+static struct sg_table *dup_sg_table(struct sg_table *table)
 {
-	pgoff_t pg;
+	struct sg_table *new_table;
+	int ret, i;
+	struct scatterlist *sg, *new_sg;
+
+	new_table = kzalloc(sizeof(*new_table), GFP_KERNEL);
+	if (!new_table)
+		return ERR_PTR(-ENOMEM);
+
+	ret = sg_alloc_table(new_table, table->nents, GFP_KERNEL);
+	if (ret) {
+		kfree(new_table);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	new_sg = new_table->sgl;
+	for_each_sgtable_sg(table, sg, i) {
+		sg_set_page(new_sg, sg_page(sg), sg->length, sg->offset);
+		new_sg = sg_next(new_sg);
+	}
+
+	return new_table;
+}
+
+static int system_heap_attach(struct dma_buf *dmabuf,
+			      struct dma_buf_attachment *attachment)
+{
+	struct system_heap_buffer *buffer = dmabuf->priv;
+	struct dma_heap_attachment *a;
+	struct sg_table *table;
+
+	a = kzalloc(sizeof(*a), GFP_KERNEL);
+	if (!a)
+		return -ENOMEM;
+
+	table = dup_sg_table(&buffer->sg_table);
+	if (IS_ERR(table)) {
+		kfree(a);
+		return -ENOMEM;
+	}
+
+	a->table = table;
+	a->dev = attachment->dev;
+	INIT_LIST_HEAD(&a->list);
+
+	attachment->priv = a;
+
+	mutex_lock(&buffer->lock);
+	list_add(&a->list, &buffer->attachments);
+	mutex_unlock(&buffer->lock);
+
+	return 0;
+}
+
+static void system_heap_detatch(struct dma_buf *dmabuf,
+				struct dma_buf_attachment *attachment)
+{
+	struct system_heap_buffer *buffer = dmabuf->priv;
+	struct dma_heap_attachment *a = attachment->priv;
+
+	mutex_lock(&buffer->lock);
+	list_del(&a->list);
+	mutex_unlock(&buffer->lock);
+
+	sg_free_table(a->table);
+	kfree(a->table);
+	kfree(a);
+}
+
+static struct sg_table *system_heap_map_dma_buf(struct dma_buf_attachment *attachment,
+						enum dma_data_direction direction)
+{
+	struct dma_heap_attachment *a = attachment->priv;
+	struct sg_table *table = a->table;
+
+	if (!dma_map_sg(attachment->dev, table->sgl, table->nents, direction))
+		return ERR_PTR(-ENOMEM);
+
+	return table;
+}
+
+static void system_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
+				      struct sg_table *table,
+				      enum dma_data_direction direction)
+{
+	dma_unmap_sg(attachment->dev, table->sgl, table->nents, direction);
+}
+
+static int system_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
+						enum dma_data_direction direction)
+{
+	struct system_heap_buffer *buffer = dmabuf->priv;
+	struct dma_heap_attachment *a;
+	int ret = 0;
+
+	mutex_lock(&buffer->lock);
+
+	if (buffer->vmap_cnt)
+		invalidate_kernel_vmap_range(buffer->vaddr, buffer->len);
+
+	list_for_each_entry(a, &buffer->attachments, list) {
+		dma_sync_sg_for_cpu(a->dev, a->table->sgl, a->table->nents,
+				    direction);
+	}
+	mutex_unlock(&buffer->lock);
+
+	return ret;
+}
+
+static int system_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
+					      enum dma_data_direction direction)
+{
+	struct system_heap_buffer *buffer = dmabuf->priv;
+	struct dma_heap_attachment *a;
+
+	mutex_lock(&buffer->lock);
+
+	if (buffer->vmap_cnt)
+		flush_kernel_vmap_range(buffer->vaddr, buffer->len);
+
+	list_for_each_entry(a, &buffer->attachments, list) {
+		dma_sync_sg_for_device(a->dev, a->table->sgl, a->table->nents,
+				       direction);
+	}
+	mutex_unlock(&buffer->lock);
+
+	return 0;
+}
+
+static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	struct system_heap_buffer *buffer = dmabuf->priv;
+	struct sg_table *table = &buffer->sg_table;
+	unsigned long addr = vma->vm_start;
+	struct sg_page_iter piter;
+	int ret;
+
+	for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
+		struct page *page = sg_page_iter_page(&piter);
+
+		ret = remap_pfn_range(vma, addr, page_to_pfn(page), PAGE_SIZE,
+				      vma->vm_page_prot);
+		if (ret)
+			return ret;
+		addr += PAGE_SIZE;
+		if (addr >= vma->vm_end)
+			return 0;
+	}
+	return 0;
+}
+
+static void *system_heap_do_vmap(struct system_heap_buffer *buffer)
+{
+	struct sg_table *table = &buffer->sg_table;
+	int npages = PAGE_ALIGN(buffer->len) / PAGE_SIZE;
+	struct page **pages = vmalloc(sizeof(struct page *) * npages);
+	struct page **tmp = pages;
+	struct sg_page_iter piter;
+	void *vaddr;
+
+	if (!pages)
+		return ERR_PTR(-ENOMEM);
+
+	for_each_sgtable_page(table, &piter, 0) {
+		WARN_ON(tmp - pages >= npages);
+		*tmp++ = sg_page_iter_page(&piter);
+	}
+
+	vaddr = vmap(pages, npages, VM_MAP, PAGE_KERNEL);
+	vfree(pages);
+
+	if (!vaddr)
+		return ERR_PTR(-ENOMEM);
+
+	return vaddr;
+}
 
-	for (pg = 0; pg < buffer->pagecount; pg++)
-		__free_page(buffer->pages[pg]);
-	kfree(buffer->pages);
+static void *system_heap_vmap(struct dma_buf *dmabuf)
+{
+	struct system_heap_buffer *buffer = dmabuf->priv;
+	void *vaddr;
+
+	mutex_lock(&buffer->lock);
+	if (buffer->vmap_cnt) {
+		buffer->vmap_cnt++;
+		return buffer->vaddr;
+	}
+
+	vaddr = system_heap_do_vmap(buffer);
+	if (IS_ERR(vaddr))
+		return vaddr;
+
+	buffer->vaddr = vaddr;
+	buffer->vmap_cnt++;
+	mutex_unlock(&buffer->lock);
+
+	return vaddr;
+}
+
+static void system_heap_vunmap(struct dma_buf *dmabuf, void *vaddr)
+{
+	struct system_heap_buffer *buffer = dmabuf->priv;
+
+	mutex_lock(&buffer->lock);
+	if (!--buffer->vmap_cnt) {
+		vunmap(buffer->vaddr);
+		buffer->vaddr = NULL;
+	}
+	mutex_unlock(&buffer->lock);
+}
+
+static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
+{
+	struct system_heap_buffer *buffer = dmabuf->priv;
+	struct sg_table *table;
+	struct scatterlist *sg;
+	int i;
+
+	table = &buffer->sg_table;
+	for_each_sgtable_sg(table, sg, i)
+		__free_page(sg_page(sg));
+	sg_free_table(table);
 	kfree(buffer);
 }
 
+const struct dma_buf_ops system_heap_buf_ops = {
+	.attach = system_heap_attach,
+	.detach = system_heap_detatch,
+	.map_dma_buf = system_heap_map_dma_buf,
+	.unmap_dma_buf = system_heap_unmap_dma_buf,
+	.begin_cpu_access = system_heap_dma_buf_begin_cpu_access,
+	.end_cpu_access = system_heap_dma_buf_end_cpu_access,
+	.mmap = system_heap_mmap,
+	.vmap = system_heap_vmap,
+	.vunmap = system_heap_vunmap,
+	.release = system_heap_dma_buf_release,
+};
+
 static int system_heap_allocate(struct dma_heap *heap,
 				unsigned long len,
 				unsigned long fd_flags,
 				unsigned long heap_flags)
 {
-	struct heap_helper_buffer *helper_buffer;
+	struct system_heap_buffer *buffer;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	struct dma_buf *dmabuf;
-	int ret = -ENOMEM;
+	struct sg_table *table;
+	struct scatterlist *sg;
+	pgoff_t pagecount;
 	pgoff_t pg;
+	int i, ret = -ENOMEM;
 
-	helper_buffer = kzalloc(sizeof(*helper_buffer), GFP_KERNEL);
-	if (!helper_buffer)
+	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
+	if (!buffer)
 		return -ENOMEM;
 
-	init_heap_helper_buffer(helper_buffer, system_heap_free);
-	helper_buffer->heap = heap;
-	helper_buffer->size = len;
-
-	helper_buffer->pagecount = len / PAGE_SIZE;
-	helper_buffer->pages = kmalloc_array(helper_buffer->pagecount,
-					     sizeof(*helper_buffer->pages),
-					     GFP_KERNEL);
-	if (!helper_buffer->pages) {
-		ret = -ENOMEM;
-		goto err0;
-	}
+	INIT_LIST_HEAD(&buffer->attachments);
+	mutex_init(&buffer->lock);
+	buffer->heap = heap;
+	buffer->len = len;
 
-	for (pg = 0; pg < helper_buffer->pagecount; pg++) {
+	table = &buffer->sg_table;
+	pagecount = len / PAGE_SIZE;
+	if (sg_alloc_table(table, pagecount, GFP_KERNEL))
+		goto free_buffer;
+
+	sg = table->sgl;
+	for (pg = 0; pg < pagecount; pg++) {
+		struct page *page;
 		/*
 		 * Avoid trying to allocate memory if the process
-		 * has been killed by by SIGKILL
+		 * has been killed by SIGKILL
 		 */
 		if (fatal_signal_pending(current))
-			goto err1;
-
-		helper_buffer->pages[pg] = alloc_page(GFP_KERNEL | __GFP_ZERO);
-		if (!helper_buffer->pages[pg])
-			goto err1;
+			goto free_pages;
+		page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+		if (!page)
+			goto free_pages;
+		sg_set_page(sg, page, page_size(page), 0);
+		sg = sg_next(sg);
 	}
 
 	/* create the dmabuf */
-	dmabuf = heap_helper_export_dmabuf(helper_buffer, fd_flags);
+	exp_info.ops = &system_heap_buf_ops;
+	exp_info.size = buffer->len;
+	exp_info.flags = fd_flags;
+	exp_info.priv = buffer;
+	dmabuf = dma_buf_export(&exp_info);
 	if (IS_ERR(dmabuf)) {
 		ret = PTR_ERR(dmabuf);
-		goto err1;
+		goto free_pages;
 	}
 
-	helper_buffer->dmabuf = dmabuf;
-
 	ret = dma_buf_fd(dmabuf, fd_flags);
 	if (ret < 0) {
 		dma_buf_put(dmabuf);
@@ -90,12 +342,12 @@ static int system_heap_allocate(struct dma_heap *heap,
 
 	return ret;
 
-err1:
-	while (pg > 0)
-		__free_page(helper_buffer->pages[--pg]);
-	kfree(helper_buffer->pages);
-err0:
-	kfree(helper_buffer);
+free_pages:
+	for_each_sgtable_sg(table, sg, i)
+		__free_page(sg_page(sg));
+	sg_free_table(table);
+free_buffer:
+	kfree(buffer);
 
 	return ret;
 }
@@ -107,7 +359,6 @@ static const struct dma_heap_ops system_heap_ops = {
 static int system_heap_create(void)
 {
 	struct dma_heap_export_info exp_info;
-	int ret = 0;
 
 	exp_info.name = "system";
 	exp_info.ops = &system_heap_ops;
@@ -115,9 +366,9 @@ static int system_heap_create(void)
 
 	sys_heap = dma_heap_add(&exp_info);
 	if (IS_ERR(sys_heap))
-		ret = PTR_ERR(sys_heap);
+		return PTR_ERR(sys_heap);
 
-	return ret;
+	return 0;
 }
 module_init(system_heap_create);
 MODULE_LICENSE("GPL v2");
-- 
2.17.1

