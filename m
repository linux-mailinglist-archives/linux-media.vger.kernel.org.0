Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB13C2796DF
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 06:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730050AbgIZEZN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 00:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730020AbgIZEZC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 00:25:02 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E4AFC0613CE
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 21:25:02 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id q4so488179pjh.5
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 21:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=06XEeGHHOGK/ICro7P5tlQH3HvkQIwMvcU78rykFbzY=;
        b=zvgDh4o5Ge79q49paWYi3m66nq39k6wE7QrzuzFKjgrLCt8H6LTyl4Xw3VTyN+n9lY
         rky20HuPWlBlj+KWAX4O2GSLc8Q5OdlMwGIpopsrMZZVxaeOBONzNdNKIXPGsPKDWlwW
         5xWD+b3YsxF3/Ld8pR2QpunLtPqhxmZAbGkAepYz9x2gwNkc2yNwvU6723eJIZ6E8fLA
         hPV1S9ltYjCPplxqTslDhPUnjJOt02AAgpJvKtwqlYNuwnb8jFmPfHvU7RycoOAt/JWQ
         dC9V7Mcf9aJ6DwzrM1Hbtajy0ROoW+thxsif1+wjUq+KfX54sUSUBQoh/WCqDfF0bkpE
         73aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=06XEeGHHOGK/ICro7P5tlQH3HvkQIwMvcU78rykFbzY=;
        b=AeHYoNMHQnngPFERstIvCNU5IbdHWQ+gdoEbPQXIMU+cbFNmxJhfCwVV41y3tl2eQ2
         5mHP+VcKQkEdmdKeYXDoxoP63RHFnskWfwVEgi2LfDJGdbBlN5UAbk8J6X7iLjV2M5oa
         lPdstTHG8d20j6ETFCCSeCYQ94lxwPdnJzkWu2bdLS5VFfcriRD8Bzg01p3FcldSSb38
         AdE4efgBKn7mJ9Bj0DJ239l9Pp+/zISeD/Ic4lDvBCi4SDXtZGbXM4KzcwCNG8XuGCnV
         YlWqy4SQ1D9Cv6lOaRbXvDL+1DJfwFMDOwADtxkxcwKty1BtT0BIcUoC1QqCTCpuwHOo
         +Glw==
X-Gm-Message-State: AOAM533m5yIEUn+JpDNTvOiYKeZrYGfjmIeR4/A3PctZI+0cj3X0r8tk
        pq6+1LyNxRQR7V6jLqhV1QWBeQ==
X-Google-Smtp-Source: ABdhPJwGMjuNMK0u01WspM91aYEUZeR21jjDkWdw78qV4eHRAn/Uu873Er9oNPryyHIHXILdP7eGZQ==
X-Received: by 2002:a17:90a:aa94:: with SMTP id l20mr668572pjq.95.1601094301975;
        Fri, 25 Sep 2020 21:25:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id a5sm3585886pgk.13.2020.09.25.21.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 21:25:01 -0700 (PDT)
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
Subject: [RFC][PATCH 3/6] dma-buf: heaps: Remove heap-helpers code
Date:   Sat, 26 Sep 2020 04:24:50 +0000
Message-Id: <20200926042453.67517-4-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200926042453.67517-1-john.stultz@linaro.org>
References: <20200926042453.67517-1-john.stultz@linaro.org>
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
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/dma-buf/heaps/Makefile       |   1 -
 drivers/dma-buf/heaps/heap-helpers.c | 271 ---------------------------
 drivers/dma-buf/heaps/heap-helpers.h |  53 ------
 3 files changed, 325 deletions(-)
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
index 9f964ca3f59c..000000000000
--- a/drivers/dma-buf/heaps/heap-helpers.c
+++ /dev/null
@@ -1,271 +0,0 @@
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
-	struct sg_table *table;
-
-	table = &a->table;
-
-	if (!dma_map_sg(attachment->dev, table->sgl, table->nents,
-			direction))
-		table = ERR_PTR(-ENOMEM);
-	return table;
-}
-
-static void dma_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
-				   struct sg_table *table,
-				   enum dma_data_direction direction)
-{
-	dma_unmap_sg(attachment->dev, table->sgl, table->nents, direction);
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

