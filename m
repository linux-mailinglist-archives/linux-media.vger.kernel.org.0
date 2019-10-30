Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24D42EA4C4
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2019 21:30:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbfJ3Ual (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Oct 2019 16:30:41 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:35440 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbfJ3Uak (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Oct 2019 16:30:40 -0400
Received: by mail-yw1-f65.google.com with SMTP id r134so1333778ywg.2
        for <linux-media@vger.kernel.org>; Wed, 30 Oct 2019 13:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0iBo/bpNtAVrnbwT8ORdTsmBQ3tCsfrYh7X/5nVkhVU=;
        b=daa0DwFs97qSaEVrqvIAVBntB/wqc3brv/BDyNmxKTkpHIGCpVMdqAHr2asWx3NyPJ
         cZdq6cnN//jB6T3we9XQlpKYaYswqDl3UbbIwZmPnk7NlFwyjVHJcj9MpbBDlsE3zAxC
         Ol6KtaXo7iH5iRv8yrShGd19KmwzsW4gb9ljexWdoeUqAv4bB+Wvlru0lSqW6IMRselG
         YRKAE8vka/eblp2XQ0514amxyygBdMkIR+StWBxHSxcxTA0ECuDoIfjlHDOBu8BOETvN
         0yhyHSAY8Kx0A4F50uf2L89nGedfK7EB+7fQSQLg7mJOBZWhfA+h9km9Do7uLz71NIGG
         qdkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0iBo/bpNtAVrnbwT8ORdTsmBQ3tCsfrYh7X/5nVkhVU=;
        b=Iu3Qr4GlnzdJuqj2cIiVqOFGAayG8xTPc8YNb1ffnS9oAQ10fjcYx33277hTNpXkF/
         t8BuLchLtZZJl3wrjWjYyMkh2UdU2AE1Mf5RtY/iFVhm+2oEb3A4zrnLMXw65tSP2XAY
         akWF8Sa0RU+Hv8CpR9D5qLpU77o8wYqEhxHTC4BbOz7+zAV6HzebnGIKSRO1PP+fh21C
         U/6DvTr3vEWeKeZlagWvWNxXoDroGseuVWMwgXD5V66wRTLHHQKB5P1zTBSKrMMGKF4D
         cYt+WI1EKmKinmlDXMEntPwQAnQ77mq4NNcT8IBor9j2xG3MAplSMnz9zyEtf14Y8sh2
         o8gg==
X-Gm-Message-State: APjAAAWocO70een+ar/9/AUmFtcXUQufQcCKqxOuC2paY0hNvr4U6WMB
        PgKvEK57bHpz/1fqrwkwUjprTw==
X-Google-Smtp-Source: APXvYqy7rZgsd+H15gO6kjJK6vT/+nsedm0Tz3xNmECn4AxRjr5B5buY0zEMWSyAeegESWU3bEsKpA==
X-Received: by 2002:a81:7145:: with SMTP id m66mr1156673ywc.464.1572467439849;
        Wed, 30 Oct 2019 13:30:39 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id h35sm416432ywk.63.2019.10.30.13.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 13:30:39 -0700 (PDT)
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
Subject: [PATCH 4/5] Revert "dma-buf: heaps: Add heap helpers"
Date:   Wed, 30 Oct 2019 16:29:53 -0400
Message-Id: <20191030203003.101156-5-sean@poorly.run>
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

This reverts commit 7b87ea704fd9606eaafa9150116536d72f5c4b1f.

This patchset doesn't meet the UAPI requirements set out in [1] for the DRM
subsystem. Once the userspace component is reviewed and ready for merge
we can try again.

[1]- https://01.org/linuxgraphics/gfx-docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements

Fixes: 7b87ea704fd9 ("dma-buf: heaps: Add heap helpers")
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
 drivers/dma-buf/Makefile             |   1 -
 drivers/dma-buf/heaps/Makefile       |   2 -
 drivers/dma-buf/heaps/heap-helpers.c | 268 ---------------------------
 drivers/dma-buf/heaps/heap-helpers.h |  55 ------
 4 files changed, 326 deletions(-)
 delete mode 100644 drivers/dma-buf/heaps/Makefile
 delete mode 100644 drivers/dma-buf/heaps/heap-helpers.c
 delete mode 100644 drivers/dma-buf/heaps/heap-helpers.h

diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index 9c190026bfab..caee5eb3d351 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -2,7 +2,6 @@
 obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
 	 dma-resv.o seqno-fence.o
 obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
-obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
 obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
 obj-$(CONFIG_SW_SYNC)		+= sw_sync.o sync_debug.o
 obj-$(CONFIG_UDMABUF)		+= udmabuf.o
diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
deleted file mode 100644
index de49898112db..000000000000
--- a/drivers/dma-buf/heaps/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-obj-y					+= heap-helpers.o
diff --git a/drivers/dma-buf/heaps/heap-helpers.c b/drivers/dma-buf/heaps/heap-helpers.c
deleted file mode 100644
index 750bef4e902d..000000000000
--- a/drivers/dma-buf/heaps/heap-helpers.c
+++ /dev/null
@@ -1,268 +0,0 @@
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
-		WARN("%s: buffer still mapped in the kernel\n", __func__);
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
index 911c931f7f06..000000000000
--- a/drivers/dma-buf/heaps/heap-helpers.h
+++ /dev/null
@@ -1,55 +0,0 @@
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
- * @flags:		buffer specific flags
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
-	unsigned long flags;
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
Sean Paul, Software Engineer, Google / Chromium OS

