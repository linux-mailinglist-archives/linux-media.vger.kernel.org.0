Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AFBE290FEC
	for <lists+linux-media@lfdr.de>; Sat, 17 Oct 2020 08:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437014AbgJQGCl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Oct 2020 02:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2411863AbgJQGBi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Oct 2020 02:01:38 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CBCCC0613B5
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 18:33:08 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id u3so2437460pjr.3
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 18:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/CAm5bWjnLRF5xW6wICKjDF43YTUJt4tBtw4MXOZQXs=;
        b=Pl3V0wHtX/10KV/MC3rXOcTw6WAZJSul3E1Vk7IuEM59gxNEYDoxSY17w1ahSsk8VP
         anxYRsYJVDLavlx5sIEHXSHrb0twXdtCPvYr7T2THa5a6IVQhB+WDTGCv6903vtyhRKP
         VBZFv/F55BO3wY4PBapsV2l/Ha1QxN8TMEwD4OYT5ffdUx9qpcpkS1Mro8OIdsEVNclT
         lT17FH8vJUfmvy7sNL8Gg5kX/1H0BRKo3/ft5ZN+9BpZO9jVQzNTzZlxtckH7KResr8w
         m2g0Nbjb/NBV4wIquE/IgI1SnkLPHIeMViI8JAC6AzIOGi0J43w3E/wgJhp1TDllBU/k
         /X9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/CAm5bWjnLRF5xW6wICKjDF43YTUJt4tBtw4MXOZQXs=;
        b=BDTJQQQc/BYI2/aY9RyJtn6ofuImD8sGjE50LBlGVNV0PRdy2K33hJlRE02GmuIz20
         wq5VHKZrNJxkEgXxfS44hW+BGkF1sz9fFdLoAwWMm7E0Vgl4usWD6Y8DUB3qmQkqEHbK
         1P8X/ZyTuwgeN4VlIU8z0Dp/nz7ngwo20+9lKvtoQqNfkuET8A6VmlPQGVilSiL9+Cxo
         yaV/0ao7HwPIx2qfTElin/UwF0dtYYMfXMORlKcZ4vGjuSLaXNiSU2qC/HMVtOL7vDqq
         V8+UJRJLz1FDKV4RMBravQs6XfvDqX3rXNxqmOXZC1PTPuEasnMjAz6WKT6YVhkd17Z2
         LxMg==
X-Gm-Message-State: AOAM5317a0Kyq5WHQMEskE1DgA9XEbag950yQoxJswDIIwtA/Uqsy/Dh
        LyDJ4axHISUUE536QeZ8lzmh9g==
X-Google-Smtp-Source: ABdhPJz3SuGIM0clMNOXoTmyj3ORLLv/LECGizCCGJ8mT+k1qLg3I7uOEvzF+34UeqgHPIX1hlL9eQ==
X-Received: by 2002:a17:90a:9ab:: with SMTP id 40mr6534541pjo.26.1602898387575;
        Fri, 16 Oct 2020 18:33:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id e186sm4222122pfh.60.2020.10.16.18.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 18:33:06 -0700 (PDT)
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
Subject: [PATCH v4 3/7] dma-buf: heaps: Remove heap-helpers code
Date:   Sat, 17 Oct 2020 01:32:51 +0000
Message-Id: <20201017013255.43568-4-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201017013255.43568-1-john.stultz@linaro.org>
References: <20201017013255.43568-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The heap-helpers code was not as generic as initially hoped
and it is now not being used, so remove it from the tree.

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
 drivers/dma-buf/heaps/Makefile       |   1 -
 drivers/dma-buf/heaps/heap-helpers.c | 270 ---------------------------
 drivers/dma-buf/heaps/heap-helpers.h |  53 ------
 3 files changed, 324 deletions(-)
 delete mode 100644 drivers/dma-buf/heaps/heap-helpers.c
 delete mode 100644 drivers/dma-buf/heaps/heap-helpers.h

diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
index 6e54cdec3da0..974467791032 100644
--- a/drivers/dma-buf/heaps/Makefile
+++ b/drivers/dma-buf/heaps/Makefile
@@ -1,4 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-y					+= heap-helpers.o
 obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
diff --git a/drivers/dma-buf/heaps/heap-helpers.c b/drivers/dma-buf/heaps/heap-helpers.c
deleted file mode 100644
index d0696cf937af..000000000000
--- a/drivers/dma-buf/heaps/heap-helpers.c
+++ /dev/null
@@ -1,270 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <linux/device.h>
-#include <linux/dma-buf.h>
-#include <linux/err.h>
-#include <linux/highmem.h>
-#include <linux/idr.h>
-#include <linux/list.h>
-#include <linux/slab.h>
-#include <linux/uaccess.h>
-#include <linux/vmalloc.h>
-#include <uapi/linux/dma-heap.h>
-
-#include "heap-helpers.h"
-
-void init_heap_helper_buffer(struct heap_helper_buffer *buffer,
-			     void (*free)(struct heap_helper_buffer *))
-{
-	buffer->priv_virt = NULL;
-	mutex_init(&buffer->lock);
-	buffer->vmap_cnt = 0;
-	buffer->vaddr = NULL;
-	buffer->pagecount = 0;
-	buffer->pages = NULL;
-	INIT_LIST_HEAD(&buffer->attachments);
-	buffer->free = free;
-}
-
-struct dma_buf *heap_helper_export_dmabuf(struct heap_helper_buffer *buffer,
-					  int fd_flags)
-{
-	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
-
-	exp_info.ops = &heap_helper_ops;
-	exp_info.size = buffer->size;
-	exp_info.flags = fd_flags;
-	exp_info.priv = buffer;
-
-	return dma_buf_export(&exp_info);
-}
-
-static void *dma_heap_map_kernel(struct heap_helper_buffer *buffer)
-{
-	void *vaddr;
-
-	vaddr = vmap(buffer->pages, buffer->pagecount, VM_MAP, PAGE_KERNEL);
-	if (!vaddr)
-		return ERR_PTR(-ENOMEM);
-
-	return vaddr;
-}
-
-static void dma_heap_buffer_destroy(struct heap_helper_buffer *buffer)
-{
-	if (buffer->vmap_cnt > 0) {
-		WARN(1, "%s: buffer still mapped in the kernel\n", __func__);
-		vunmap(buffer->vaddr);
-	}
-
-	buffer->free(buffer);
-}
-
-static void *dma_heap_buffer_vmap_get(struct heap_helper_buffer *buffer)
-{
-	void *vaddr;
-
-	if (buffer->vmap_cnt) {
-		buffer->vmap_cnt++;
-		return buffer->vaddr;
-	}
-	vaddr = dma_heap_map_kernel(buffer);
-	if (IS_ERR(vaddr))
-		return vaddr;
-	buffer->vaddr = vaddr;
-	buffer->vmap_cnt++;
-	return vaddr;
-}
-
-static void dma_heap_buffer_vmap_put(struct heap_helper_buffer *buffer)
-{
-	if (!--buffer->vmap_cnt) {
-		vunmap(buffer->vaddr);
-		buffer->vaddr = NULL;
-	}
-}
-
-struct dma_heaps_attachment {
-	struct device *dev;
-	struct sg_table table;
-	struct list_head list;
-};
-
-static int dma_heap_attach(struct dma_buf *dmabuf,
-			   struct dma_buf_attachment *attachment)
-{
-	struct dma_heaps_attachment *a;
-	struct heap_helper_buffer *buffer = dmabuf->priv;
-	int ret;
-
-	a = kzalloc(sizeof(*a), GFP_KERNEL);
-	if (!a)
-		return -ENOMEM;
-
-	ret = sg_alloc_table_from_pages(&a->table, buffer->pages,
-					buffer->pagecount, 0,
-					buffer->pagecount << PAGE_SHIFT,
-					GFP_KERNEL);
-	if (ret) {
-		kfree(a);
-		return ret;
-	}
-
-	a->dev = attachment->dev;
-	INIT_LIST_HEAD(&a->list);
-
-	attachment->priv = a;
-
-	mutex_lock(&buffer->lock);
-	list_add(&a->list, &buffer->attachments);
-	mutex_unlock(&buffer->lock);
-
-	return 0;
-}
-
-static void dma_heap_detach(struct dma_buf *dmabuf,
-			    struct dma_buf_attachment *attachment)
-{
-	struct dma_heaps_attachment *a = attachment->priv;
-	struct heap_helper_buffer *buffer = dmabuf->priv;
-
-	mutex_lock(&buffer->lock);
-	list_del(&a->list);
-	mutex_unlock(&buffer->lock);
-
-	sg_free_table(&a->table);
-	kfree(a);
-}
-
-static
-struct sg_table *dma_heap_map_dma_buf(struct dma_buf_attachment *attachment,
-				      enum dma_data_direction direction)
-{
-	struct dma_heaps_attachment *a = attachment->priv;
-	struct sg_table *table = &a->table;
-	int ret;
-
-	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
-	if (ret)
-		table = ERR_PTR(ret);
-	return table;
-}
-
-static void dma_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
-				   struct sg_table *table,
-				   enum dma_data_direction direction)
-{
-	dma_unmap_sgtable(attachment->dev, table, direction, 0);
-}
-
-static vm_fault_t dma_heap_vm_fault(struct vm_fault *vmf)
-{
-	struct vm_area_struct *vma = vmf->vma;
-	struct heap_helper_buffer *buffer = vma->vm_private_data;
-
-	if (vmf->pgoff > buffer->pagecount)
-		return VM_FAULT_SIGBUS;
-
-	vmf->page = buffer->pages[vmf->pgoff];
-	get_page(vmf->page);
-
-	return 0;
-}
-
-static const struct vm_operations_struct dma_heap_vm_ops = {
-	.fault = dma_heap_vm_fault,
-};
-
-static int dma_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
-{
-	struct heap_helper_buffer *buffer = dmabuf->priv;
-
-	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
-		return -EINVAL;
-
-	vma->vm_ops = &dma_heap_vm_ops;
-	vma->vm_private_data = buffer;
-
-	return 0;
-}
-
-static void dma_heap_dma_buf_release(struct dma_buf *dmabuf)
-{
-	struct heap_helper_buffer *buffer = dmabuf->priv;
-
-	dma_heap_buffer_destroy(buffer);
-}
-
-static int dma_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
-					     enum dma_data_direction direction)
-{
-	struct heap_helper_buffer *buffer = dmabuf->priv;
-	struct dma_heaps_attachment *a;
-	int ret = 0;
-
-	mutex_lock(&buffer->lock);
-
-	if (buffer->vmap_cnt)
-		invalidate_kernel_vmap_range(buffer->vaddr, buffer->size);
-
-	list_for_each_entry(a, &buffer->attachments, list) {
-		dma_sync_sg_for_cpu(a->dev, a->table.sgl, a->table.nents,
-				    direction);
-	}
-	mutex_unlock(&buffer->lock);
-
-	return ret;
-}
-
-static int dma_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
-					   enum dma_data_direction direction)
-{
-	struct heap_helper_buffer *buffer = dmabuf->priv;
-	struct dma_heaps_attachment *a;
-
-	mutex_lock(&buffer->lock);
-
-	if (buffer->vmap_cnt)
-		flush_kernel_vmap_range(buffer->vaddr, buffer->size);
-
-	list_for_each_entry(a, &buffer->attachments, list) {
-		dma_sync_sg_for_device(a->dev, a->table.sgl, a->table.nents,
-				       direction);
-	}
-	mutex_unlock(&buffer->lock);
-
-	return 0;
-}
-
-static void *dma_heap_dma_buf_vmap(struct dma_buf *dmabuf)
-{
-	struct heap_helper_buffer *buffer = dmabuf->priv;
-	void *vaddr;
-
-	mutex_lock(&buffer->lock);
-	vaddr = dma_heap_buffer_vmap_get(buffer);
-	mutex_unlock(&buffer->lock);
-
-	return vaddr;
-}
-
-static void dma_heap_dma_buf_vunmap(struct dma_buf *dmabuf, void *vaddr)
-{
-	struct heap_helper_buffer *buffer = dmabuf->priv;
-
-	mutex_lock(&buffer->lock);
-	dma_heap_buffer_vmap_put(buffer);
-	mutex_unlock(&buffer->lock);
-}
-
-const struct dma_buf_ops heap_helper_ops = {
-	.map_dma_buf = dma_heap_map_dma_buf,
-	.unmap_dma_buf = dma_heap_unmap_dma_buf,
-	.mmap = dma_heap_mmap,
-	.release = dma_heap_dma_buf_release,
-	.attach = dma_heap_attach,
-	.detach = dma_heap_detach,
-	.begin_cpu_access = dma_heap_dma_buf_begin_cpu_access,
-	.end_cpu_access = dma_heap_dma_buf_end_cpu_access,
-	.vmap = dma_heap_dma_buf_vmap,
-	.vunmap = dma_heap_dma_buf_vunmap,
-};
diff --git a/drivers/dma-buf/heaps/heap-helpers.h b/drivers/dma-buf/heaps/heap-helpers.h
deleted file mode 100644
index 805d2df88024..000000000000
--- a/drivers/dma-buf/heaps/heap-helpers.h
+++ /dev/null
@@ -1,53 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * DMABUF Heaps helper code
- *
- * Copyright (C) 2011 Google, Inc.
- * Copyright (C) 2019 Linaro Ltd.
- */
-
-#ifndef _HEAP_HELPERS_H
-#define _HEAP_HELPERS_H
-
-#include <linux/dma-heap.h>
-#include <linux/list.h>
-
-/**
- * struct heap_helper_buffer - helper buffer metadata
- * @heap:		back pointer to the heap the buffer came from
- * @dmabuf:		backing dma-buf for this buffer
- * @size:		size of the buffer
- * @priv_virt		pointer to heap specific private value
- * @lock		mutext to protect the data in this structure
- * @vmap_cnt		count of vmap references on the buffer
- * @vaddr		vmap'ed virtual address
- * @pagecount		number of pages in the buffer
- * @pages		list of page pointers
- * @attachments		list of device attachments
- *
- * @free		heap callback to free the buffer
- */
-struct heap_helper_buffer {
-	struct dma_heap *heap;
-	struct dma_buf *dmabuf;
-	size_t size;
-
-	void *priv_virt;
-	struct mutex lock;
-	int vmap_cnt;
-	void *vaddr;
-	pgoff_t pagecount;
-	struct page **pages;
-	struct list_head attachments;
-
-	void (*free)(struct heap_helper_buffer *buffer);
-};
-
-void init_heap_helper_buffer(struct heap_helper_buffer *buffer,
-			     void (*free)(struct heap_helper_buffer *));
-
-struct dma_buf *heap_helper_export_dmabuf(struct heap_helper_buffer *buffer,
-					  int fd_flags);
-
-extern const struct dma_buf_ops heap_helper_ops;
-#endif /* _HEAP_HELPERS_H */
-- 
2.17.1

