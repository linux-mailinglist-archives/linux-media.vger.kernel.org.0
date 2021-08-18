Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A81F3F05E8
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 16:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238967AbhHROMn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 10:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238837AbhHROMi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 10:12:38 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB28DC0613CF
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:12:03 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id q2so2366962pgt.6
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZkAv+LNcgqEWbHi97vf+inNGakakaEVsjwU+OFCbnq8=;
        b=GAD8LEzGyz983y8E7dXINBKMPDns6g/qzC/Ss+2x/3upwq2NvmiJCQPvFzFHgMDVyh
         sM92CgTFsdc57sFvzbS52PG3AA4ef2+Uf1XfraOoGpVrpujJF9agd9yJZZC7bwvZKYPB
         RhqrZYjtKvbkxYCZ4nzLvpUs86gQZMwmJSt0jx5HGiitNbD5m91K+xB5V2RnNWsEogE0
         WD3CJ8NSg1Hvg/6OiAKZodvhpwaSvCdXOsZFL9HecNUYmfIWPdo7jxmGPiSepkPg7ywv
         tCySvnJIrHKRaAcsUykNFmf02/iCsZ76b5GmaSym27fSmYoFscW73sKasKb8nMp49Ftq
         Nu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=ZkAv+LNcgqEWbHi97vf+inNGakakaEVsjwU+OFCbnq8=;
        b=TF/GO8TKXQrTW4byeKjWFbDZzHVx9R3Cn+MmgLQNm0zBpXlx83ogUjFBhneURSUqxF
         4R5Bt1F98sHZuJuOYf1NFRpUyAWJeD8r88v1wlagp5szUCQFPTaJtNbWK3Ro0El+VJKS
         tGI29ROS95dN7/E5B1Rdu82QGtrCbmzf0/dBOkIZzuA3VXABoCnJpVGujmgtqOmrFXhD
         lPPAJPRHWUQimhStXYr6QJF+kak/8vHXzldCQbOAatUrWZ2zut7HLFyQUgK/V1TOewu1
         xEMq3lM587Ic1fof5POPaJqs2G+R3WNJSHLauMOAXWRKyQl8J5GwN+1XWaffB5DjH6xn
         4THg==
MIME-Version: 1.0
X-Gm-Message-State: AOAM5322R3xn+RWMJuGS3zp4JEIs4f3FA7J4yk/z0ic0WW2AVry0sg0X
        WuXEXpZmXqcCJJHteolnjDjE07WlenUWiYbWt0yx4pTHEVlxU0DIot/Y8ctqR/U0Su4qKl2I22k
        pYM8dV+l12F0IEnMg
X-Google-Smtp-Source: ABdhPJzksuUC9d2KnjMTM5DerFtkXqQbabjMTaftKnu8h50CW4Q5JyBgvbjdAFe2HOwPsiZIvbrEMw==
X-Received: by 2002:a05:6a00:1583:b0:3e2:2ae3:2ba8 with SMTP id u3-20020a056a00158300b003e22ae32ba8mr9527304pfk.58.1629295922893;
        Wed, 18 Aug 2021 07:12:02 -0700 (PDT)
Received: from localhost.localdomain ([49.207.214.181])
        by smtp.gmail.com with ESMTPSA id e8sm8084343pgg.31.2021.08.18.07.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:12:02 -0700 (PDT)
From:   sidraya.bj@pathpartnertech.com
To:     gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     prashanth.ka@pathpartnertech.com, praneeth@ti.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        praveen.ap@pathpartnertech.com,
        Sidraya <sidraya.bj@pathpartnertech.com>
Subject: [PATCH 03/30] v4l: vxd-dec: Create vxd_dec Mem Manager helper library
Date:   Wed, 18 Aug 2021 19:40:10 +0530
Message-Id: <20210818141037.19990-4-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
Content-Type: text/plain; charset="US-ASCII"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sidraya <sidraya.bj@pathpartnertech.com>

The memory manager helper library provides functions for managing
the memory context of a decode stream. Each stream will have it's
own memory context with associated mmu context and heap
allocations. The memory manager tracks the allocations and mappings
per context, as well as providing a wrapper around the MMU library.
It also provides functions for the driver to query information about
the page table directory for a particular memory context.

In addition, the memory manager provides the ability to plug in

different heaps (unified, carveout, dmabuf, etc.) that the caller
can use when doing memory allocations.

By default, the "unified" heap functionality is supported. No other
types of heaps are supported at this time, though the framework is
present to add more heap types in the future, if needed. This
heap is used only for allocating internal buffers used for communication
with the hardware, and for loading the firmware.

Functions are provided for creating/destroying a memory context,
creating/destroying an MMU context, mapping and unmapping buffers in
the device MMU, allocating and freeing buffers from specified available
heaps, and retrieving information about those allocations.

Signed-off-by: Buddy Liong <buddy.liong@ti.com>
Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
---
 MAINTAINERS                                   |    3 +
 .../staging/media/vxd/common/img_mem_man.c    | 1124 +++++++++++++++++
 .../staging/media/vxd/common/img_mem_man.h    |  231 ++++
 .../media/vxd/common/img_mem_unified.c        |  276 ++++
 4 files changed, 1634 insertions(+)
 create mode 100644 drivers/staging/media/vxd/common/img_mem_man.c
 create mode 100644 drivers/staging/media/vxd/common/img_mem_man.h
 create mode 100644 drivers/staging/media/vxd/common/img_mem_unified.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 2e921650a14c..150272927839 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19537,6 +19537,9 @@ M:	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/img,d5520-vxd.yaml
+F:	drivers/staging/media/vxd/common/img_mem_man.c
+F:	drivers/staging/media/vxd/common/img_mem_man.h
+F:	drivers/staging/media/vxd/common/img_mem_unified.c
 F:	drivers/staging/media/vxd/common/imgmmu.c
 F:	drivers/staging/media/vxd/common/imgmmu.h
 
diff --git a/drivers/staging/media/vxd/common/img_mem_man.c b/drivers/staging/media/vxd/common/img_mem_man.c
new file mode 100644
index 000000000000..cf9792d9a1a9
--- /dev/null
+++ b/drivers/staging/media/vxd/common/img_mem_man.c
@@ -0,0 +1,1124 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * IMG DEC Memory Manager
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Angela Stegmaier <angelabaker@ti.com>
+ *
+ * Re-written for upstreamimg
+ *	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ */
+
+#include <linux/idr.h>
+#include <linux/slab.h>
+#include <linux/dma-mapping.h>
+#include <linux/printk.h>
+#include <linux/mutex.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-mem2mem.h>
+
+#include "imgmmu.h"
+#include "img_mem_man.h"
+
+#define VXD_MMU_SHIFT 8 /* assume 40-bit MMU */
+/* heaps ids (global) */
+#define MIN_HEAP 1
+#define MAX_HEAP 16
+
+/*
+ * struct dev_mem_man - the device memory management
+ * @heaps: idr list of heap for the device memory manager
+ * @mem_ctxs: contains lists of mem_ctx
+ * @mutex: mutex for this device
+ */
+struct mem_man {
+	void *dev;
+	struct idr *heaps;
+	struct list_head mem_ctxs;
+	struct mutex *mutex; /* mutex for this device */
+};
+
+static struct mem_man mem_man_data = {0};
+
+/**
+ * struct mmu_page - the mmu page information for the buffer
+ * @buffer: buffer pointer for the particular mmu_page
+ * @page_cfg: mmu page configuration of physical and virtual addr
+ * @addr_shift: address shifting information
+ */
+struct mmu_page {
+	struct buffer *buffer;
+	struct mmu_page_cfg page_cfg;
+	unsigned int addr_shift;
+};
+
+static void _img_mem_free(struct buffer *buffer);
+static void _img_mmu_unmap(struct mmu_ctx_mapping *mapping);
+static void _img_mmu_ctx_destroy(struct mmu_ctx *ctx);
+
+#if defined(DEBUG_DECODER_DRIVER)
+static unsigned char *get_heap_name(enum heap_type type)
+{
+	switch (type) {
+	case MEM_HEAP_TYPE_UNIFIED:
+		return "unified";
+	default:
+		return "unknown";
+	}
+}
+#endif
+
+int img_mem_add_heap(const struct heap_config *heap_cfg, int *heap_id)
+{
+	struct mem_man *mem_man = &mem_man_data;
+	struct heap *heap;
+	int (*init_fn)(const struct heap_config *heap_cfg, struct heap *heap);
+	int ret;
+
+	switch (heap_cfg->type) {
+	case MEM_HEAP_TYPE_UNIFIED:
+		init_fn = img_mem_unified_init;
+		break;
+	default:
+		dev_err(mem_man->dev, "%s: heap type %d unknown\n", __func__,
+			heap_cfg->type);
+		return -EINVAL;
+	}
+
+	heap = kmalloc(sizeof(*heap), GFP_KERNEL);
+	if (!heap)
+		return -ENOMEM;
+
+	ret = mutex_lock_interruptible_nested(mem_man->mutex, SUBCLASS_IMGMEM);
+	if (ret)
+		goto lock_failed;
+
+	ret = idr_alloc(mem_man->heaps, heap, MIN_HEAP, MAX_HEAP, GFP_KERNEL);
+	if (ret < 0) {
+		dev_err(mem_man->dev, "%s: idr_alloc failed\n", __func__);
+		goto alloc_id_failed;
+	}
+
+	heap->id = ret;
+	heap->type = heap_cfg->type;
+	heap->options = heap_cfg->options;
+	heap->to_dev_addr = heap_cfg->to_dev_addr;
+	heap->priv = NULL;
+
+	ret = init_fn(heap_cfg, heap);
+	if (ret) {
+		dev_err(mem_man->dev, "%s: heap init failed\n", __func__);
+		goto heap_init_failed;
+	}
+
+	*heap_id = heap->id;
+	mutex_unlock(mem_man->mutex);
+
+#ifdef DEBUG_DECODER_DRIVER
+	dev_info(mem_man->dev, "%s created heap %d type %d (%s)\n",
+		 __func__, *heap_id, heap_cfg->type, get_heap_name(heap->type));
+#endif
+	return 0;
+
+heap_init_failed:
+	idr_remove(mem_man->heaps, heap->id);
+alloc_id_failed:
+	mutex_unlock(mem_man->mutex);
+lock_failed:
+	kfree(heap);
+	return ret;
+}
+
+static void _img_mem_del_heap(struct heap *heap)
+{
+	struct mem_man *mem_man = &mem_man_data;
+
+	if (heap->ops->destroy)
+		heap->ops->destroy(heap);
+
+	idr_remove(mem_man->heaps, heap->id);
+}
+
+void img_mem_del_heap(int heap_id)
+{
+	struct mem_man *mem_man = &mem_man_data;
+	struct heap *heap;
+
+	mutex_lock_nested(mem_man->mutex, SUBCLASS_IMGMEM);
+
+	heap = idr_find(mem_man->heaps, heap_id);
+	if (!heap) {
+		dev_warn(mem_man->dev, "%s heap %d not found!\n", __func__,
+			 heap_id);
+		mutex_unlock(mem_man->mutex);
+		return;
+	}
+
+	_img_mem_del_heap(heap);
+
+	mutex_unlock(mem_man->mutex);
+
+	kfree(heap);
+}
+
+int img_mem_create_ctx(struct mem_ctx **new_ctx)
+{
+	struct mem_man *mem_man = &mem_man_data;
+	struct mem_ctx *ctx;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->buffers = kzalloc(sizeof(*ctx->buffers), GFP_KERNEL);
+	if (!ctx->buffers)
+		return -ENOMEM;
+	idr_init(ctx->buffers);
+
+	INIT_LIST_HEAD(&ctx->mmu_ctxs);
+
+	mutex_lock_nested(mem_man->mutex, SUBCLASS_IMGMEM);
+	list_add(&ctx->mem_man_entry, &mem_man->mem_ctxs);
+	mutex_unlock(mem_man->mutex);
+
+	*new_ctx = ctx;
+	return 0;
+}
+
+static void _img_mem_destroy_ctx(struct mem_ctx *ctx)
+{
+	struct mem_man *mem_man = &mem_man_data;
+	struct buffer *buffer;
+	int buff_id;
+
+	/* free derelict mmu contexts */
+	while (!list_empty(&ctx->mmu_ctxs)) {
+		struct mmu_ctx *mc;
+
+		mc = list_first_entry(&ctx->mmu_ctxs,
+				      struct mmu_ctx, mem_ctx_entry);
+		dev_warn(mem_man->dev, "%s: found derelict mmu context %p\n",
+			 __func__, mc);
+		_img_mmu_ctx_destroy(mc);
+		kfree(mc);
+	}
+
+	/* free derelict buffers */
+	buff_id = MEM_MAN_MIN_BUFFER;
+	buffer = idr_get_next(ctx->buffers, &buff_id);
+	while (buffer) {
+		dev_warn(mem_man->dev, "%s: found derelict buffer %d\n",
+			 __func__, buff_id);
+		if (buffer->heap)
+			_img_mem_free(buffer);
+		else
+			idr_remove(ctx->buffers, buffer->id);
+		kfree(buffer);
+		buff_id = MEM_MAN_MIN_BUFFER;
+		buffer = idr_get_next(ctx->buffers, &buff_id);
+	}
+
+	idr_destroy(ctx->buffers);
+	kfree(ctx->buffers);
+	__list_del_entry(&ctx->mem_man_entry);
+}
+
+void img_mem_destroy_ctx(struct mem_ctx *ctx)
+{
+	struct mem_man *mem_man = &mem_man_data;
+
+	mutex_lock_nested(mem_man->mutex, SUBCLASS_IMGMEM);
+	_img_mem_destroy_ctx(ctx);
+	mutex_unlock(mem_man->mutex);
+
+	kfree(ctx);
+}
+
+static int _img_mem_alloc(void *device, struct mem_ctx *ctx,
+			  struct heap *heap, unsigned long size,
+			  enum mem_attr attr, struct buffer **buffer_new)
+{
+	struct buffer *buffer;
+	int ret;
+
+	if (size == 0) {
+		dev_err(device, "%s: buffer size is zero\n", __func__);
+		return -EINVAL;
+	}
+
+	if (!heap->ops || !heap->ops->alloc) {
+		dev_err(device, "%s: no alloc function in heap %d!\n",
+			__func__, heap->id);
+		return -EINVAL;
+	}
+
+	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
+
+	ret = idr_alloc(ctx->buffers, buffer,
+			MEM_MAN_MIN_BUFFER, MEM_MAN_MAX_BUFFER, GFP_KERNEL);
+	if (ret < 0) {
+		dev_err(device, "%s: idr_alloc failed\n", __func__);
+		goto idr_alloc_failed;
+	}
+
+	buffer->id = ret;
+	buffer->request_size = size;
+	buffer->actual_size = ((size + PAGE_SIZE - 1) / PAGE_SIZE) * PAGE_SIZE;
+	buffer->device = device;
+	buffer->mem_ctx = ctx;
+	buffer->heap = heap;
+	INIT_LIST_HEAD(&buffer->mappings);
+	buffer->kptr = NULL;
+	buffer->priv = NULL;
+
+	ret = heap->ops->alloc(device, heap, buffer->actual_size, attr,
+		buffer);
+	if (ret) {
+		dev_err(device, "%s: heap %d alloc failed\n", __func__,
+			heap->id);
+		goto heap_alloc_failed;
+	}
+
+	*buffer_new = buffer;
+
+	dev_dbg(device, "%s heap %p ctx %p created buffer %d (%p) actual_size %zu\n",
+		__func__, heap, ctx, buffer->id, buffer, buffer->actual_size);
+	return 0;
+
+heap_alloc_failed:
+	idr_remove(ctx->buffers, buffer->id);
+idr_alloc_failed:
+	kfree(buffer);
+	return ret;
+}
+
+int img_mem_alloc(void *device, struct mem_ctx *ctx, int heap_id,
+		  unsigned long size, enum mem_attr attr, int *buf_id)
+{
+	struct mem_man *mem_man = &mem_man_data;
+	struct heap *heap;
+	struct buffer *buffer;
+	int ret;
+
+	dev_dbg(device, "%s heap %d ctx %p size %zu\n", __func__, heap_id,
+		ctx, size);
+
+	ret = mutex_lock_interruptible_nested(mem_man->mutex, SUBCLASS_IMGMEM);
+	if (ret)
+		return ret;
+
+	heap = idr_find(mem_man->heaps, heap_id);
+	if (!heap) {
+		dev_err(device, "%s: heap id %d not found\n", __func__,
+			heap_id);
+		mutex_unlock(mem_man->mutex);
+		return -EINVAL;
+	}
+
+	ret = _img_mem_alloc(device, ctx, heap, size, attr, &buffer);
+	if (ret) {
+		mutex_unlock(mem_man->mutex);
+		return ret;
+	}
+
+	*buf_id = buffer->id;
+	mutex_unlock(mem_man->mutex);
+
+	dev_dbg(device, "%s heap %d ctx %p created buffer %d (%p) size %zu\n",
+		__func__, heap_id, ctx, *buf_id, buffer, size);
+	return ret;
+}
+
+static int _img_mem_import(void *device, struct mem_ctx *ctx,
+			   unsigned long size, enum mem_attr attr, struct buffer **buffer_new)
+{
+	struct buffer *buffer;
+	int ret;
+
+	if (size == 0) {
+		dev_err(device, "%s: buffer size is zero\n", __func__);
+		return -EINVAL;
+	}
+
+	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
+
+	ret = idr_alloc(ctx->buffers, buffer,
+			MEM_MAN_MIN_BUFFER, MEM_MAN_MAX_BUFFER, GFP_KERNEL);
+	if (ret < 0) {
+		dev_err(device, "%s: idr_alloc failed\n", __func__);
+		goto idr_alloc_failed;
+	}
+
+	buffer->id = ret;
+	buffer->request_size = size;
+	buffer->actual_size = ((size + PAGE_SIZE - 1) / PAGE_SIZE) * PAGE_SIZE;
+	buffer->device = device;
+	buffer->mem_ctx = ctx;
+	buffer->heap = NULL;
+	INIT_LIST_HEAD(&buffer->mappings);
+	buffer->kptr = NULL;
+	buffer->priv = NULL;
+
+	*buffer_new = buffer;
+
+	dev_dbg(device, "%s ctx %p created buffer %d (%p) actual_size %zu\n",
+		__func__, ctx, buffer->id, buffer, buffer->actual_size);
+	return 0;
+
+idr_alloc_failed:
+	kfree(buffer);
+	return ret;
+}
+
+int img_mem_import(void *device, struct mem_ctx *ctx,
+		   unsigned long size, enum mem_attr attr, int *buf_id)
+{
+	struct mem_man *mem_man = &mem_man_data;
+	struct buffer *buffer;
+	int ret;
+
+	dev_dbg(device, "%s ctx %p size %zu\n", __func__, ctx, size);
+
+	ret = mutex_lock_interruptible_nested(mem_man->mutex, SUBCLASS_IMGMEM);
+	if (ret)
+		return ret;
+
+	ret = _img_mem_import(device, ctx, size, attr, &buffer);
+	if (ret) {
+		mutex_unlock(mem_man->mutex);
+		return ret;
+	}
+
+	*buf_id = buffer->id;
+	mutex_unlock(mem_man->mutex);
+
+	dev_dbg(device, "%s ctx %p created buffer %d (%p) size %zu\n",
+		__func__, ctx, *buf_id, buffer, size);
+	return ret;
+}
+
+static void _img_mem_free(struct buffer *buffer)
+{
+	void *dev = buffer->device;
+	struct heap *heap = buffer->heap;
+	struct mem_ctx *ctx = buffer->mem_ctx;
+
+	if (!heap->ops || !heap->ops->free) {
+		dev_err(dev, "%s: no free function in heap %d!\n",
+			__func__, heap->id);
+		return;
+	}
+
+	while (!list_empty(&buffer->mappings)) {
+		struct mmu_ctx_mapping *map;
+
+		map = list_first_entry(&buffer->mappings,
+				       struct mmu_ctx_mapping, buffer_entry);
+		dev_warn(dev, "%s: found mapping for buffer %d (size %zu)\n",
+			 __func__, map->buffer->id, map->buffer->actual_size);
+
+		_img_mmu_unmap(map);
+
+		kfree(map);
+	}
+
+	heap->ops->free(heap, buffer);
+
+	idr_remove(ctx->buffers, buffer->id);
+}
+
+void img_mem_free(struct mem_ctx *ctx, int buff_id)
+{
+	struct mem_man *mem_man = &mem_man_data;
+	struct buffer *buffer;
+
+	mutex_lock_nested(mem_man->mutex, SUBCLASS_IMGMEM);
+
+	buffer = idr_find(ctx->buffers, buff_id);
+	if (!buffer) {
+		dev_err(mem_man->dev, "%s: buffer id %d not found\n",
+			__func__, buff_id);
+		mutex_unlock(mem_man->mutex);
+		return;
+	}
+
+	_img_mem_free(buffer);
+
+	mutex_unlock(mem_man->mutex);
+
+	kfree(buffer);
+}
+
+void img_mem_free_bufid(struct mem_ctx *ctx, int buff_id)
+{
+	struct mem_man *mem_man = &mem_man_data;
+	struct buffer *buffer;
+
+	mutex_lock_nested(mem_man->mutex, SUBCLASS_IMGMEM);
+
+	buffer = idr_find(ctx->buffers, buff_id);
+	if (!buffer) {
+		dev_err(mem_man->dev, "%s: buffer id %d not found\n",
+			__func__, buff_id);
+		mutex_unlock(mem_man->mutex);
+		return;
+	}
+
+	idr_remove(ctx->buffers, buffer->id);
+
+	mutex_unlock(mem_man->mutex);
+
+	kfree(buffer);
+}
+
+static int _img_mem_map_km(struct buffer *buffer)
+{
+	void *dev = buffer->device;
+	struct heap *heap = buffer->heap;
+
+	if (!heap->ops || !heap->ops->map_km) {
+		dev_err(dev, "%s: no map_km in heap %d!\n", __func__, heap->id);
+		return -EINVAL;
+	}
+
+	return heap->ops->map_km(heap, buffer);
+}
+
+int img_mem_map_km(struct mem_ctx *ctx, int buff_id)
+{
+	struct mem_man *mem_man = &mem_man_data;
+	struct buffer *buffer;
+	int ret;
+
+	mutex_lock_nested(mem_man->mutex, SUBCLASS_IMGMEM);
+	buffer = idr_find(ctx->buffers, buff_id);
+	if (!buffer) {
+		dev_err(mem_man->dev, "%s: buffer id %d not found\n",
+			__func__, buff_id);
+		mutex_unlock(mem_man->mutex);
+		return -EINVAL;
+	}
+
+	ret = _img_mem_map_km(buffer);
+
+	mutex_unlock(mem_man->mutex);
+
+	return ret;
+}
+
+void *img_mem_get_kptr(struct mem_ctx *ctx, int buff_id)
+{
+	struct mem_man *mem_man = &mem_man_data;
+	struct buffer *buffer;
+	void *kptr;
+
+	mutex_lock_nested(mem_man->mutex, SUBCLASS_IMGMEM);
+	buffer = idr_find(ctx->buffers, buff_id);
+	if (!buffer) {
+		dev_err(mem_man->dev, "%s: buffer id %d not found\n", __func__,
+			buff_id);
+		mutex_unlock(mem_man->mutex);
+		return NULL;
+	}
+	kptr = buffer->kptr;
+	mutex_unlock(mem_man->mutex);
+	return kptr;
+}
+
+static void _img_mem_sync_cpu_to_device(struct buffer *buffer)
+{
+	struct heap *heap = buffer->heap;
+
+	if (heap->ops && heap->ops->sync_cpu_to_dev)
+		heap->ops->sync_cpu_to_dev(heap, buffer);
+
+	/* sync to device memory */
+	mb();
+}
+
+int img_mem_sync_cpu_to_device(struct mem_ctx *ctx, int buff_id)
+{
+	struct mem_man *mem_man = &mem_man_data;
+	struct buffer *buffer;
+
+	mutex_lock_nested(mem_man->mutex, SUBCLASS_IMGMEM);
+	buffer = idr_find(ctx->buffers, buff_id);
+	if (!buffer) {
+		dev_err(mem_man->dev, "%s: buffer id %d not found\n", __func__,
+			buff_id);
+		mutex_unlock(mem_man->mutex);
+		return -EINVAL;
+	}
+
+	_img_mem_sync_cpu_to_device(buffer);
+
+	mutex_unlock(mem_man->mutex);
+	return 0;
+}
+
+static void _img_mem_sync_device_to_cpu(struct buffer *buffer)
+{
+	struct heap *heap = buffer->heap;
+
+	if (heap->ops && heap->ops->sync_dev_to_cpu)
+		heap->ops->sync_dev_to_cpu(heap, buffer);
+}
+
+int img_mem_sync_device_to_cpu(struct mem_ctx *ctx, int buff_id)
+{
+	struct mem_man *mem_man = &mem_man_data;
+	struct buffer *buffer;
+
+	mutex_lock_nested(mem_man->mutex, SUBCLASS_IMGMEM);
+	buffer = idr_find(ctx->buffers, buff_id);
+	if (!buffer) {
+		dev_err(mem_man->dev, "%s: buffer id %d not found\n", __func__,
+			buff_id);
+		mutex_unlock(mem_man->mutex);
+		return -EINVAL;
+	}
+
+	_img_mem_sync_device_to_cpu(buffer);
+
+	mutex_unlock(mem_man->mutex);
+	return 0;
+}
+
+static struct mmu_page_cfg *mmu_page_alloc(void *arg)
+{
+	struct mem_man *mem_man = &mem_man_data;
+	struct mmu_ctx *mmu_ctx = arg;
+	struct mmu_page *page;
+	struct buffer *buffer;
+	struct heap *heap;
+	int ret;
+
+	dev_dbg(mmu_ctx->device, "%s:%d arg %p\n", __func__, __LINE__, arg);
+
+	WARN_ON(!mutex_is_locked(mem_man->mutex));
+
+	page = kzalloc(sizeof(*page), GFP_KERNEL);
+	if (!page)
+		return NULL;
+
+	ret = _img_mem_alloc(mmu_ctx->device, mmu_ctx->mem_ctx,
+			     mmu_ctx->heap, PAGE_SIZE, (enum mem_attr)0, &buffer);
+	if (ret) {
+		dev_err(mmu_ctx->device, "%s: img_mem_alloc failed (%d)\n",
+			__func__, ret);
+		goto free_page;
+	}
+
+	ret = _img_mem_map_km(buffer);
+	if (ret) {
+		dev_err(mmu_ctx->device, "%s: img_mem_map_km failed (%d)\n",
+			__func__, ret);
+		goto free_buffer;
+	}
+
+	page->addr_shift = mmu_ctx->mmu_config_addr_width - 32;
+	page->buffer = buffer;
+	page->page_cfg.cpu_virt_addr = (unsigned long)buffer->kptr;
+
+	heap = buffer->heap;
+	if (heap->ops && heap->ops->get_sg_table) {
+		void *sgt;
+
+		ret = heap->ops->get_sg_table(heap, buffer, &sgt);
+		if (ret) {
+			dev_err(mmu_ctx->device,
+				"%s: heap %d buffer %d no sg_table!\n",
+				__func__, heap->id, buffer->id);
+			ret = -EINVAL;
+			goto free_buffer;
+		}
+		page->page_cfg.phys_addr = sg_phys(img_mmu_get_sgl(sgt));
+	} else {
+		dev_err(mmu_ctx->device, "%s: heap %d buffer %d no get_sg!\n",
+			__func__, heap->id, buffer->id);
+		ret = -EINVAL;
+		goto free_buffer;
+	}
+
+	dev_dbg(mmu_ctx->device, "%s:%d virt addr %#lx\n", __func__, __LINE__,
+		page->page_cfg.cpu_virt_addr);
+	dev_dbg(mmu_ctx->device, "%s:%d phys addr %#llx\n", __func__, __LINE__,
+		page->page_cfg.phys_addr);
+	return &page->page_cfg;
+
+free_buffer:
+	_img_mem_free(buffer);
+	kfree(buffer);
+free_page:
+	kfree(page);
+	return NULL;
+}
+
+static void mmu_page_free(struct mmu_page_cfg *arg)
+{
+	struct mem_man *mem_man = &mem_man_data;
+	struct mmu_page *page;
+
+	page = container_of(arg, struct mmu_page, page_cfg);
+
+	WARN_ON(!mutex_is_locked(mem_man->mutex));
+
+	_img_mem_free(page->buffer);
+	kfree(page->buffer);
+	kfree(page);
+}
+
+static void mmu_page_write(struct mmu_page_cfg *page_cfg,
+			   unsigned int offset, unsigned long long addr,
+			   unsigned int flags)
+{
+	unsigned int *mem = (unsigned int *)page_cfg->cpu_virt_addr;
+	struct mmu_page *mmu_page;
+	struct heap *heap;
+
+	mmu_page = container_of(page_cfg, struct mmu_page, page_cfg);
+	heap = mmu_page->buffer->heap;
+
+	/* skip translation when flags are zero, assuming address is invalid */
+	if (flags && heap->to_dev_addr)
+		addr = heap->to_dev_addr(&heap->options, addr);
+	addr >>= mmu_page->addr_shift;
+
+	mem[offset] = addr | flags;
+}
+
+static void mmu_update_page(struct mmu_page_cfg *arg)
+{
+	struct mem_man *mem_man = &mem_man_data;
+	struct mmu_page *page;
+
+	page = container_of(arg, struct mmu_page, page_cfg);
+
+	WARN_ON(!mutex_is_locked(mem_man->mutex));
+
+	_img_mem_sync_cpu_to_device(page->buffer);
+}
+
+int img_mmu_ctx_create(void *device, unsigned int mmu_config_addr_width,
+		       struct mem_ctx *mem_ctx, int heap_id,
+		       void (*callback_fn)(enum mmu_callback_type type,
+					   int buff_id, void *data),
+		       void *callback_data, struct mmu_ctx **mmu_ctx)
+{
+	struct mem_man *mem_man = &mem_man_data;
+
+	static struct mmu_info mmu_functions = {
+		.pfn_page_alloc = mmu_page_alloc,
+		.pfn_page_free = mmu_page_free,
+		.pfn_page_write = mmu_page_write,
+		.pfn_page_update = mmu_update_page,
+	};
+	struct mmu_ctx *ctx;
+	int ret;
+
+	if (mmu_config_addr_width < 32) {
+		dev_err(device,
+			"%s: invalid addr_width (%d) must be >= 32 !\n",
+			__func__, mmu_config_addr_width);
+		return -EINVAL;
+	}
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->device = device;
+	ctx->mem_ctx = mem_ctx;
+	ctx->mmu_config_addr_width = mmu_config_addr_width;
+
+	mutex_lock_nested(mem_man->mutex, SUBCLASS_IMGMEM);
+
+	ctx->heap = idr_find(mem_man->heaps, heap_id);
+	if (!ctx->heap) {
+		dev_err(device, "%s: invalid heap_id (%d)!\n", __func__,
+			heap_id);
+		mutex_unlock(mem_man->mutex);
+		kfree(ctx);
+		return -EINVAL;
+	}
+
+	mmu_functions.alloc_ctx = ctx;
+	ctx->mmu_dir = mmu_create_directory(&mmu_functions);
+	if (IS_ERR_VALUE((unsigned long)ctx->mmu_dir)) {
+		ret = (long)(ctx->mmu_dir);
+		dev_err(device, "%s: directory create failed (%d)!\n", __func__,
+			ret);
+		ctx->mmu_dir = NULL;
+		mutex_unlock(mem_man->mutex);
+		kfree(ctx);
+		return ret;
+	}
+
+	list_add(&ctx->mem_ctx_entry, &mem_ctx->mmu_ctxs);
+	INIT_LIST_HEAD(&ctx->mappings);
+
+	ctx->callback_fn = callback_fn;
+	ctx->callback_data = callback_data;
+
+	*mmu_ctx = ctx;
+
+	mutex_unlock(mem_man->mutex);
+
+	return 0;
+}
+
+static void _img_mmu_ctx_destroy(struct mmu_ctx *ctx)
+{
+	struct mem_man *mem_man = &mem_man_data;
+	int ret;
+
+	while (!list_empty(&ctx->mappings)) {
+		struct mmu_ctx_mapping *map;
+
+		map = list_first_entry(&ctx->mappings,
+				       struct mmu_ctx_mapping, mmu_ctx_entry);
+#ifdef DEBUG_DECODER_DRIVER
+		dev_info(ctx->device,
+			 "%s: found mapped buffer %d (size %zu)\n",
+			 __func__, map->buffer->id, map->buffer->request_size);
+#endif
+
+		_img_mmu_unmap(map);
+
+		kfree(map);
+	}
+
+	ret = mmu_destroy_directory(ctx->mmu_dir);
+	if (ret)
+		dev_err(mem_man->dev, "mmu_destroy_directory failed (%d)!\n",
+			ret);
+	__list_del_entry(&ctx->mem_ctx_entry);
+}
+
+void img_mmu_ctx_destroy(struct mmu_ctx *ctx)
+{
+	struct mem_man *mem_man = &mem_man_data;
+
+	mutex_lock_nested(mem_man->mutex, SUBCLASS_IMGMEM);
+	_img_mmu_ctx_destroy(ctx);
+	mutex_unlock(mem_man->mutex);
+
+	kfree(ctx);
+}
+
+int img_mmu_map_sg(struct mmu_ctx *mmu_ctx, struct mem_ctx *mem_ctx,
+		   int buff_id, void *sgt, unsigned int virt_addr,
+		   unsigned int map_flags)
+{
+	struct mem_man *mem_man = &mem_man_data;
+	struct mmu_ctx_mapping *mapping;
+	struct mmu_heap_alloc heap_alloc;
+	struct buffer *buffer;
+	int ret = 0;
+
+	dev_dbg(mmu_ctx->device, "%s sgt %p virt_addr %#x\n", __func__,
+		sgt, virt_addr);
+
+	mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
+	if (!mapping)
+		return -ENOMEM;
+
+	mutex_lock_nested(mem_man->mutex, SUBCLASS_IMGMEM);
+	buffer = idr_find(mem_ctx->buffers, buff_id);
+	if (!buffer) {
+		dev_err(mmu_ctx->device, "%s: buffer id %d not found\n",
+			__func__, buff_id);
+		ret = -EINVAL;
+		goto error;
+	}
+	dev_dbg(mmu_ctx->device, "%s buffer %d 0x%p size %zu virt_addr %#x\n",
+		__func__, buff_id, buffer, buffer->request_size, virt_addr);
+
+	heap_alloc.virt_addr = virt_addr;
+	heap_alloc.alloc_size = buffer->actual_size;
+
+	mapping->mmu_ctx = mmu_ctx;
+	mapping->buffer = buffer;
+	mapping->virt_addr = virt_addr;
+
+	if (sgt) {
+		struct sg_table *sgt_new = sgt;
+
+		mapping->map = mmu_directory_map_sg(mmu_ctx->mmu_dir, sgt_new->sgl,
+						    &heap_alloc, map_flags);
+		if (IS_ERR_VALUE((unsigned long)mapping->map)) {
+			ret = (long)(mapping->map);
+			mapping->map = NULL;
+		}
+	} else {
+		dev_err(mmu_ctx->device, "%s: buffer %d no get_sg!\n",
+			__func__, buffer->id);
+		ret = -EINVAL;
+		goto error;
+	}
+	if (ret) {
+		dev_err(mmu_ctx->device, "mmu_directory_map_sg failed (%d)!\n",
+			ret);
+		goto error;
+	}
+
+	list_add(&mapping->mmu_ctx_entry, &mmu_ctx->mappings);
+	list_add(&mapping->buffer_entry, &mapping->buffer->mappings);
+
+	if (mmu_ctx->callback_fn)
+		mmu_ctx->callback_fn(MMU_CALLBACK_MAP, buffer->id,
+				     mmu_ctx->callback_data);
+
+	mutex_unlock(mem_man->mutex);
+	return 0;
+
+error:
+	mutex_unlock(mem_man->mutex);
+	kfree(mapping);
+	return ret;
+}
+
+int img_mmu_map(struct mmu_ctx *mmu_ctx, struct mem_ctx *mem_ctx,
+		int buff_id, unsigned int virt_addr, unsigned int map_flags)
+{
+	struct mem_man *mem_man = &mem_man_data;
+	struct mmu_ctx_mapping *mapping;
+	struct mmu_heap_alloc heap_alloc;
+	struct buffer *buffer;
+	struct heap *heap;
+	int ret;
+
+	dev_dbg(mmu_ctx->device, "%s buffer %d virt_addr %#x\n", __func__,
+		buff_id, virt_addr);
+
+	mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
+	if (!mapping)
+		return -ENOMEM;
+
+	mutex_lock_nested(mem_man->mutex, SUBCLASS_IMGMEM);
+	buffer = idr_find(mem_ctx->buffers, buff_id);
+	if (!buffer) {
+		dev_err(mmu_ctx->device, "%s: buffer id %d not found\n",
+			__func__, buff_id);
+		ret = -EINVAL;
+		goto error;
+	}
+	dev_dbg(mmu_ctx->device, "%s buffer %d 0x%p size %zu virt_addr %#x\n",
+		__func__, buff_id, buffer, buffer->request_size, virt_addr);
+
+	heap_alloc.virt_addr = virt_addr;
+	heap_alloc.alloc_size = buffer->actual_size;
+
+	mapping->mmu_ctx = mmu_ctx;
+	mapping->buffer = buffer;
+	mapping->virt_addr = virt_addr;
+
+	heap = buffer->heap;
+	if (heap->ops && heap->ops->get_sg_table) {
+		void *sgt;
+
+		ret = heap->ops->get_sg_table(heap, buffer, &sgt);
+		if (ret) {
+			dev_err(mmu_ctx->device,
+				"%s: heap %d buffer %d no sg_table!\n",
+				__func__, heap->id, buffer->id);
+			goto error;
+		}
+
+		mapping->map = mmu_directory_map_sg(mmu_ctx->mmu_dir, img_mmu_get_sgl(sgt),
+						    &heap_alloc, map_flags);
+		if (IS_ERR_VALUE((unsigned long)mapping->map)) {
+			ret = (long)(mapping->map);
+			mapping->map = NULL;
+		}
+	} else {
+		dev_err(mmu_ctx->device, "%s: heap %d buffer %d no get_sg!\n",
+			__func__, heap->id, buffer->id);
+		ret = -EINVAL;
+		goto error;
+	}
+	if (ret) {
+		dev_err(mmu_ctx->device, "mmu_directory_map failed (%d)!\n",
+			ret);
+		goto error;
+	}
+
+	list_add(&mapping->mmu_ctx_entry, &mmu_ctx->mappings);
+	list_add(&mapping->buffer_entry, &mapping->buffer->mappings);
+
+	if (mmu_ctx->callback_fn)
+		mmu_ctx->callback_fn(MMU_CALLBACK_MAP, buffer->id,
+				     mmu_ctx->callback_data);
+
+	mutex_unlock(mem_man->mutex);
+	return 0;
+
+error:
+	mutex_unlock(mem_man->mutex);
+	kfree(mapping);
+	return ret;
+}
+
+static void _img_mmu_unmap(struct mmu_ctx_mapping *mapping)
+{
+	struct mmu_ctx *ctx = mapping->mmu_ctx;
+	int res;
+
+	dev_dbg(ctx->device, "%s:%d mapping %p buffer %d\n", __func__,
+		__LINE__, mapping, mapping->buffer->id);
+
+	res = mmu_directory_unmap(mapping->map);
+	if (res)
+		dev_warn(ctx->device, "mmu_directory_unmap failed (%d)!\n",
+			 res);
+
+	__list_del_entry(&mapping->mmu_ctx_entry);
+	__list_del_entry(&mapping->buffer_entry);
+
+	if (ctx->callback_fn)
+		ctx->callback_fn(MMU_CALLBACK_UNMAP, mapping->buffer->id,
+				 ctx->callback_data);
+}
+
+int img_mmu_unmap(struct mmu_ctx *mmu_ctx, struct mem_ctx *mem_ctx,
+		  int buff_id)
+{
+	struct mem_man *mem_man = &mem_man_data;
+	struct mmu_ctx_mapping *mapping;
+	struct list_head *lst;
+
+	dev_dbg(mmu_ctx->device, "%s:%d buffer %d\n", __func__, __LINE__,
+		buff_id);
+
+	mutex_lock_nested(mem_man->mutex, SUBCLASS_IMGMEM);
+
+	mapping = NULL;
+	list_for_each(lst, &mmu_ctx->mappings) {
+		struct mmu_ctx_mapping *m;
+
+		m = list_entry(lst, struct mmu_ctx_mapping, mmu_ctx_entry);
+		if (m->buffer->id == buff_id) {
+			mapping = m;
+			break;
+		}
+	}
+
+	if (!mapping) {
+		dev_err(mmu_ctx->device, "%s: buffer id %d not found\n",
+			__func__, buff_id);
+		mutex_unlock(mem_man->mutex);
+		return -EINVAL;
+	}
+
+	_img_mmu_unmap(mapping);
+
+	mutex_unlock(mem_man->mutex);
+	kfree(mapping);
+	return 0;
+}
+
+int img_mmu_get_ptd(const struct mmu_ctx *ctx, unsigned int *ptd)
+{
+	struct mem_man *mem_man = &mem_man_data;
+	struct mmu_page_cfg *page_cfg;
+	unsigned long long addr;
+
+	mutex_lock_nested(mem_man->mutex, SUBCLASS_IMGMEM);
+
+	page_cfg = mmu_directory_get_page(ctx->mmu_dir);
+	if (!page_cfg) {
+		mutex_unlock(mem_man->mutex);
+		return -EINVAL;
+	}
+
+	addr = page_cfg->phys_addr;
+	if (ctx->heap->to_dev_addr)
+		addr = ctx->heap->to_dev_addr(&ctx->heap->options, addr);
+
+	mutex_unlock(mem_man->mutex);
+
+	*ptd = (unsigned int)(addr >>= VXD_MMU_SHIFT);
+
+	dev_dbg(ctx->device, "%s: addr %#llx ptd %#x\n", __func__,
+		page_cfg->phys_addr, *ptd);
+	return 0;
+}
+
+int img_mmu_get_pagetable_entry(const struct mmu_ctx *ctx, unsigned long dev_virt_addr)
+{
+	if (!ctx)
+		return 0xFFFFFF;
+
+	return mmu_directory_get_pagetable_entry(ctx->mmu_dir, dev_virt_addr);
+}
+
+/*
+ * Initialisation
+ */
+int img_mem_init(void *dev)
+{
+	struct mem_man *mem_man = &mem_man_data;
+
+	mem_man->dev = dev;
+	mem_man->heaps = kzalloc(sizeof(*mem_man->heaps), GFP_KERNEL);
+	if (!mem_man->heaps)
+		return -ENOMEM;
+	idr_init(mem_man->heaps);
+	INIT_LIST_HEAD(&mem_man->mem_ctxs);
+	mem_man->mutex = kzalloc(sizeof(*mem_man->mutex), GFP_KERNEL);
+	if (!mem_man->mutex) {
+		pr_err("Memory allocation failed for mutex\n");
+		return -ENOMEM;
+	}
+	mutex_init(mem_man->mutex);
+
+	return 0;
+}
+
+void img_mem_exit(void)
+{
+	struct mem_man *mem_man = &mem_man_data;
+	struct heap *heap;
+	int heap_id;
+
+	/* keeps mutex checks (WARN_ON) happy, this will never actually wait */
+	mutex_lock_nested(mem_man->mutex, SUBCLASS_IMGMEM);
+
+	while (!list_empty(&mem_man->mem_ctxs)) {
+		struct mem_ctx *mc;
+
+		mc = list_first_entry(&mem_man->mem_ctxs,
+				      struct mem_ctx, mem_man_entry);
+		dev_warn(mem_man->dev, "%s derelict memory context %p!\n",
+			 __func__, mc);
+		_img_mem_destroy_ctx(mc);
+		kfree(mc);
+	}
+
+	heap_id = MIN_HEAP;
+	heap = idr_get_next(mem_man->heaps, &heap_id);
+	while (heap) {
+		dev_warn(mem_man->dev, "%s derelict heap %d!\n", __func__,
+			 heap_id);
+		_img_mem_del_heap(heap);
+		kfree(heap);
+		heap_id = MIN_HEAP;
+		heap = idr_get_next(mem_man->heaps, &heap_id);
+	}
+	idr_destroy(mem_man->heaps);
+	kfree(mem_man->heaps);
+
+	mutex_unlock(mem_man->mutex);
+
+	mutex_destroy(mem_man->mutex);
+	kfree(mem_man->mutex);
+	mem_man->mutex = NULL;
+}
diff --git a/drivers/staging/media/vxd/common/img_mem_man.h b/drivers/staging/media/vxd/common/img_mem_man.h
new file mode 100644
index 000000000000..1a10ad994d6e
--- /dev/null
+++ b/drivers/staging/media/vxd/common/img_mem_man.h
@@ -0,0 +1,231 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * IMG DEC Memory Manager header file
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Angela Stegmaier <angelabaker@ti.com>
+ *
+ * Re-written for upstreamimg
+ *	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ */
+
+#ifndef _IMG_DEC_MEM_MGR_H
+#define _IMG_DEC_MEM_MGR_H
+
+#include <linux/types.h>
+
+/* buffer ids (per memory context) */
+#define MEM_MAN_MIN_BUFFER 1
+#define MEM_MAN_MAX_BUFFER 16384
+
+enum mem_attr {
+	MEM_ATTR_CACHED        = 0x00000001,
+	MEM_ATTR_UNCACHED      = 0x00000002,
+	MEM_ATTR_WRITECOMBINE  = 0x00000004,
+	MEM_ATTR_SECURE        = 0x00000010,
+	MEM_ATTR_FORCE32BITS = 0x7FFFFFFFU
+};
+
+enum mmu_callback_type {
+	MMU_CALLBACK_MAP = 1,
+	MMU_CALLBACK_UNMAP,
+	MMU_CALLBACK_FORCE32BITS = 0x7FFFFFFFU
+};
+
+enum heap_type {
+	MEM_HEAP_TYPE_UNIFIED = 1,
+	MEM_HEAP_TYPE_FORCE32BITS = 0x7FFFFFFFU
+};
+
+union heap_options {
+	struct {
+		long long gfp_type; /* pool and flags for buffer allocations */
+	} unified;
+};
+
+/**
+ * struct heap_config - contains heap configuration structure
+ * @type: enumeration of heap_type
+ * @options: pool and flags for buffer allocations, eg GFP_KERNEL
+ * @to_dev_addr: function pointer for retrieving device addr
+ */
+struct heap_config {
+	enum heap_type type;
+	union heap_options options;
+	unsigned long long (*to_dev_addr)(union heap_options *opts, unsigned long long addr);
+};
+
+/*
+ * struct mmu_heap - typedef for mmu_heap
+ * @virt_addr_start: start of the device virtual address
+ * @alloc_atom: atom allocation in bytes
+ * @size: total size of the heap in bytes
+ */
+struct mmu_heap {
+	unsigned long	virt_addr_start;
+	unsigned long alloc_atom;
+	unsigned long size;
+};
+
+/*
+ * struct mem_ctx - the memory context
+ * @buffers: idr list of buffers
+ * @mmu_ctxs: contains linked lists of struct mmu_ctx
+ * @mem_man_entry: the entry list for dev_mem_main:mem_ctxs linked list
+ */
+struct mem_ctx {
+	struct idr *buffers;
+	struct list_head mmu_ctxs;
+	struct list_head mem_man_entry;
+};
+
+/*
+ * struct mmu_ctx_mapping - the mmu context mapping information
+ * @mmu_ctx: pointer to the mmu_ctx to which this mmu mapping information
+ *	     belongs
+ * @buffer: pointer to the buffer which this mmu_ctx_mapping is for
+ * @map: pointer to the mmu_map which this mmu_ctx_mapping belongs
+ * @virt_addr: Virtual address
+ * @mmu_ctx_entry: the entry list for mmu_ctx:mapping linked list.
+ * @buffer_entry: the entry list for buffer:mappings linked list.
+ */
+struct mmu_ctx_mapping {
+	struct mmu_ctx *mmu_ctx;
+	struct buffer *buffer;
+	struct mmu_map *map;
+	unsigned int virt_addr;
+	struct list_head mmu_ctx_entry;
+	struct list_head buffer_entry;
+};
+
+/*
+ * struct mmu_ctx - the mmu context information - one per stream
+ * @device: pointer to the device
+ * @mmu_config_addr_width: the address width for the mmu config
+ * @mem_ctx: pointer to mem_ctx where this mmu_ctx belongs to
+ * @heap: pointer to struct heap to where this mem_ctx belongs to
+ * @mmu_dir: pointer to the mmu_directory this mmu_ctx belongs to
+ * @mappings: contains linked list of struct mmu_ctx_mapping
+ * @mem_ctx_entry: the entry list for mem_ctx:mmu_ctxs
+ * @callback_fn: pointer to function callback
+ * @callback_data: pointer to the callback data
+ */
+struct mmu_ctx {
+	void *device;
+	unsigned int mmu_config_addr_width;
+	struct mem_ctx *mem_ctx;
+	struct heap *heap;
+	struct mmu_directory *mmu_dir;
+	struct list_head mappings;
+	struct list_head mem_ctx_entry;
+	void (*callback_fn)(enum mmu_callback_type type, int buff_id,
+			    void *data);
+	void *callback_data;
+};
+
+/*
+ * struct buffer - the mmu context information - one per stream
+ * @id: buffer identification
+ * @request_size: request size for the allocation
+ * @actual_size: size aligned with the PAGE_SIZE allocation
+ * @device: pointer to the device
+ * @mem_ctx: pointer to struct mem_ctx to where this buffer belongs to
+ * @heap: pointer to struct heap to where this buffer belongs to
+ * @mappings: contains linked lists of struct mmu_ctx_mapping
+ * @kptr: pointer to virtual mapping for the buffer object into kernel address
+ *	  space
+ * @priv: pointer to priv data used for scaterlist table info
+ */
+struct buffer {
+	int id; /* Generated in <mem_ctx:buffers> */
+	unsigned long request_size;
+	unsigned long actual_size;
+	void *device;
+	struct mem_ctx *mem_ctx;
+	struct heap *heap;
+	struct list_head mappings; /* contains <struct mmu_ctx_mapping> */
+	void *kptr;
+	void *priv;
+};
+
+struct heap_ops {
+	int (*alloc)(void *device, struct heap *heap,
+		     unsigned long size, enum mem_attr attr,
+		     struct buffer *buffer);
+	void (*free)(struct heap *heap, struct buffer *buffer);
+	int (*map_km)(struct heap *heap, struct buffer *buffer);
+	int (*get_sg_table)(struct heap *heap, struct buffer *buffer,
+			    void **sg_table);
+	void (*sync_cpu_to_dev)(struct heap *heap, struct buffer *buffer);
+	void (*sync_dev_to_cpu)(struct heap *heap, struct buffer *buffer);
+	void (*destroy)(struct heap *heap);
+};
+
+struct heap {
+	int id; /* Generated in <mem_man:heaps> */
+	enum heap_type type;
+	struct heap_ops *ops;
+	union heap_options options;
+	unsigned long long (*to_dev_addr)(union heap_options *opts, unsigned long long addr);
+	void *priv;
+};
+
+int img_mem_init(void *dev);
+void img_mem_exit(void);
+
+int img_mem_create_ctx(struct mem_ctx **new_ctx);
+void img_mem_destroy_ctx(struct mem_ctx *ctx);
+
+int img_mem_import(void *device, struct mem_ctx *ctx,
+		   unsigned long size, enum mem_attr attr, int *buf_id);
+
+int img_mem_alloc(void *device, struct mem_ctx *ctx, int heap_id,
+		  unsigned long size, enum mem_attr attributes, int *buf_id);
+void img_mem_free(struct mem_ctx *ctx, int buff_id);
+
+void img_mem_free_bufid(struct mem_ctx *ctx, int buf_id);
+
+int img_mem_map_km(struct mem_ctx *ctx, int buf_id);
+void *img_mem_get_kptr(struct mem_ctx *ctx, int buff_id);
+
+int img_mem_sync_cpu_to_device(struct mem_ctx *ctx, int buf_id);
+int img_mem_sync_device_to_cpu(struct mem_ctx *ctx, int buf_id);
+
+int img_mmu_ctx_create(void *device, unsigned int mmu_config_addr_width,
+		       struct mem_ctx *mem_ctx, int heap_id,
+		       void (*callback_fn)(enum mmu_callback_type type,
+					   int buff_id, void *data),
+		       void *callback_data, struct mmu_ctx **mmu_ctx);
+void img_mmu_ctx_destroy(struct mmu_ctx *ctx);
+
+int img_mmu_map(struct mmu_ctx *mmu_ctx, struct mem_ctx *mem_ctx,
+		int buff_id, unsigned int virt_addr, unsigned int map_flags);
+int img_mmu_map_sg(struct mmu_ctx *mmu_ctx, struct mem_ctx *mem_ctx,
+		   int buff_id, void *sgt, unsigned int virt_addr,
+		   unsigned int map_flags);
+int img_mmu_unmap(struct mmu_ctx *mmu_ctx, struct mem_ctx *mem_ctx,
+		  int buff_id);
+
+int img_mmu_get_ptd(const struct mmu_ctx *ctx, unsigned int *ptd);
+
+int img_mmu_get_pagetable_entry(const struct mmu_ctx *ctx, unsigned long dev_virt_addr);
+
+int img_mem_add_heap(const struct heap_config *heap_cfg, int *heap_id);
+void img_mem_del_heap(int heap_id);
+
+/* Heap operation related function */
+int img_mem_unified_init(const struct heap_config *config,
+			 struct heap *heap);
+
+/* page and sg list related functions */
+void img_mmu_get_pages(void **page_args, void *sgt_args);
+unsigned int img_mmu_get_orig_nents(void *sgt_args);
+void img_mmu_set_sgt_nents(void *sgt_args, int ret);
+void img_mmu_set_sg_table(void **sg_table_args, void *buffer);
+unsigned int img_mmu_get_sgl_length(void *sgl_args);
+void *img_mmu_get_sgl(void *sgt_args);
+
+#endif /* _IMG_DEC_MEM_MGR */
diff --git a/drivers/staging/media/vxd/common/img_mem_unified.c b/drivers/staging/media/vxd/common/img_mem_unified.c
new file mode 100644
index 000000000000..30108b25d8b0
--- /dev/null
+++ b/drivers/staging/media/vxd/common/img_mem_unified.c
@@ -0,0 +1,276 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * IMG DEC Memory Manager for unified memory
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Angela Stegmaier <angelabaker@ti.com>
+ *
+ * Re-written for upstreamimg
+ *	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ */
+
+#include <linux/dma-mapping.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-mem2mem.h>
+
+#include "img_mem_man.h"
+
+void img_mmu_get_pages(void **page_args, void *sgt_args)
+{
+	struct page **pages = (struct page **)page_args;
+	struct sg_table *sgt = sgt_args;
+	struct scatterlist *sgl = sgt->sgl;
+	int i;
+
+	i = 0;
+	while (sgl) {
+		pages[i++] = sg_page(sgl);
+		sgl = sg_next(sgl);
+	}
+}
+
+unsigned int img_mmu_get_orig_nents(void *sgt_args)
+{
+	struct sg_table *sgt = sgt_args;
+
+	return sgt->orig_nents;
+}
+
+void img_mmu_set_sgt_nents(void *sgt_args, int ret)
+{
+	struct sg_table *sgt = sgt_args;
+
+	sgt->nents = ret;
+}
+
+void img_mmu_set_sg_table(void **sg_table_args, void *buffer)
+{
+	struct sg_table **sg_table = (struct sg_table **)sg_table_args;
+
+	*sg_table = buffer;
+}
+
+unsigned int img_mmu_get_sgl_length(void *sgl_args)
+{
+	struct scatterlist *sgl = (struct scatterlist *)sgl_args;
+
+	return sgl->length;
+}
+
+void *img_mmu_get_sgl(void *sgt_args)
+{
+	struct sg_table *sgt = sgt_args;
+
+	return sgt->sgl;
+}
+
+static int unified_alloc(void *device, struct heap *heap,
+			 unsigned long size, enum mem_attr attr,
+			 struct buffer *buffer)
+{
+	struct sg_table *sgt;
+	void *sgl;
+	int pages;
+	int ret;
+
+	dev_dbg(device, "%s:%d buffer %d (0x%p)\n", __func__, __LINE__,
+		buffer->id, buffer);
+
+	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt)
+		return -ENOMEM;
+
+	pages = (size + PAGE_SIZE - 1) / PAGE_SIZE;
+
+	ret = sg_alloc_table(sgt, pages, GFP_KERNEL);
+	if (ret)
+		goto sg_alloc_table_failed;
+
+	sgl = img_mmu_get_sgl(sgt);
+	while (sgl) {
+		void *page;
+		unsigned long long dma_addr;
+
+		page = alloc_page(heap->options.unified.gfp_type);
+		if (!page) {
+			dev_err(device, "%s alloc_page failed!\n", __func__);
+			ret = -ENOMEM;
+			goto alloc_page_failed;
+		}
+
+		/*
+		 * dma_map_page() is probably going to fail if alloc flags are
+		 * GFP_HIGHMEM, since it is not mapped to CPU. Hopefully, this
+		 * will never happen because memory of this sort cannot be used
+		 * for DMA anyway. To check if this is the case, build with
+		 * debug, set trace_physical_pages=1 and check if page_address
+		 * printed above is NULL
+		 */
+		dma_addr = dma_map_page(device, page, 0, PAGE_SIZE, DMA_BIDIRECTIONAL);
+		if (dma_mapping_error(device, dma_addr)) {
+			__free_page(page);
+			dev_err(device, "%s dma_map_page failed!\n", __func__);
+			ret = -EIO;
+			goto alloc_page_failed;
+		}
+		dma_unmap_page(device, dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+
+		sg_set_page(sgl, page, PAGE_SIZE, 0);
+
+		sgl = sg_next(sgl);
+	}
+
+	buffer->priv = sgt;
+	return 0;
+
+alloc_page_failed:
+	sgl = img_mmu_get_sgl(sgt);
+	while (sgl) {
+		void *page = sg_page(sgl);
+
+		if (page)
+			__free_page(page);
+
+		sgl = sg_next(sgl);
+	}
+	sg_free_table(sgt);
+sg_alloc_table_failed:
+	kfree(sgt);
+	return ret;
+}
+
+static void unified_free(struct heap *heap, struct buffer *buffer)
+{
+	void *dev = buffer->device;
+	void *sgt = buffer->priv;
+	void *sgl;
+
+	dev_dbg(dev, "%s:%d buffer %d (0x%p)\n", __func__, __LINE__,
+		buffer->id, buffer);
+
+	if (buffer->kptr) {
+		dev_dbg(dev, "%s vunmap 0x%p\n", __func__, buffer->kptr);
+		dma_unmap_sg(dev, img_mmu_get_sgl(sgt), img_mmu_get_orig_nents(sgt),
+			     DMA_FROM_DEVICE);
+		vunmap(buffer->kptr);
+	}
+
+	sgl = img_mmu_get_sgl(sgt);
+	while (sgl) {
+		__free_page(sg_page(sgl));
+		sgl = sg_next(sgl);
+	}
+	sg_free_table(sgt);
+	kfree(sgt);
+}
+
+static int unified_map_km(struct heap *heap, struct buffer *buffer)
+{
+	void *dev = buffer->device;
+	void *sgt = buffer->priv;
+	void *sgl = img_mmu_get_sgl(sgt);
+	unsigned int num_pages = sg_nents(sgl);
+	unsigned int orig_nents = img_mmu_get_orig_nents(sgt);
+	void **pages;
+	int ret;
+	pgprot_t prot;
+
+	dev_dbg(dev, "%s:%d buffer %d (0x%p)\n", __func__, __LINE__, buffer->id, buffer);
+
+	if (buffer->kptr) {
+		dev_warn(dev, "%s called for already mapped buffer %d\n", __func__, buffer->id);
+		return 0;
+	}
+
+	pages = kmalloc_array(num_pages, sizeof(void *), GFP_KERNEL);
+	if (!pages)
+		return -ENOMEM;
+
+	img_mmu_get_pages(pages, sgt);
+
+	prot = PAGE_KERNEL;
+	prot = pgprot_writecombine(prot);
+	buffer->kptr = vmap((struct page **)pages, num_pages, VM_MAP, prot);
+	kfree(pages);
+	if (!buffer->kptr) {
+		dev_err(dev, "%s vmap failed!\n", __func__);
+		return -EFAULT;
+	}
+
+	ret = dma_map_sg(dev, sgl, orig_nents, DMA_FROM_DEVICE);
+
+	if (ret <= 0) {
+		dev_err(dev, "%s dma_map_sg failed!\n", __func__);
+		vunmap(buffer->kptr);
+		return -EFAULT;
+	}
+	dev_dbg(dev, "%s:%d buffer %d orig_nents %d nents %d\n", __func__,
+		__LINE__, buffer->id, orig_nents, ret);
+
+	img_mmu_set_sgt_nents(sgt, ret);
+
+	dev_dbg(dev, "%s:%d buffer %d vmap to 0x%p\n", __func__, __LINE__,
+		buffer->id, buffer->kptr);
+
+	return 0;
+}
+
+static int unified_get_sg_table(struct heap *heap, struct buffer *buffer, void **sg_table)
+{
+	img_mmu_set_sg_table(sg_table, buffer->priv);
+	return 0;
+}
+
+static void unified_sync_cpu_to_dev(struct heap *heap, struct buffer *buffer)
+{
+	void *dev = buffer->device;
+	void *sgt = buffer->priv;
+
+	if (!buffer->kptr)
+		return;
+
+	dev_dbg(dev, "%s:%d buffer %d (0x%p)\n", __func__, __LINE__, buffer->id, buffer);
+
+	dma_sync_sg_for_device(dev, img_mmu_get_sgl(sgt), img_mmu_get_orig_nents(sgt),
+			       DMA_TO_DEVICE);
+}
+
+static void unified_sync_dev_to_cpu(struct heap *heap, struct buffer *buffer)
+{
+	void *dev = buffer->device;
+	void *sgt = buffer->priv;
+
+	if (!buffer->kptr)
+		return;
+
+	dev_dbg(dev, "%s:%d buffer %d (0x%p)\n", __func__, __LINE__,
+		buffer->id, buffer);
+
+	dma_sync_sg_for_cpu(dev, img_mmu_get_sgl(sgt), img_mmu_get_orig_nents(sgt),
+			    DMA_FROM_DEVICE);
+}
+
+static void unified_heap_destroy(struct heap *heap)
+{
+}
+
+static struct heap_ops unified_heap_ops = {
+	.alloc = unified_alloc,
+	.free = unified_free,
+	.map_km = unified_map_km,
+	.get_sg_table = unified_get_sg_table,
+	.sync_cpu_to_dev = unified_sync_cpu_to_dev,
+	.sync_dev_to_cpu = unified_sync_dev_to_cpu,
+	.destroy = unified_heap_destroy,
+};
+
+int img_mem_unified_init(const struct heap_config *heap_cfg,
+			 struct heap *heap)
+{
+	heap->ops = &unified_heap_ops;
+	return 0;
+}
-- 
2.17.1


-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly
prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.
