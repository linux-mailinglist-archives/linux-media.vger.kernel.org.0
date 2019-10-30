Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D478BEA4C5
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2019 21:30:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbfJ3Uao (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Oct 2019 16:30:44 -0400
Received: from mail-yb1-f196.google.com ([209.85.219.196]:41972 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbfJ3Uao (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Oct 2019 16:30:44 -0400
Received: by mail-yb1-f196.google.com with SMTP id b2so1452303ybr.8
        for <linux-media@vger.kernel.org>; Wed, 30 Oct 2019 13:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+uwJGC9QQEeJXBgFaFTGM7r2UURRovHT/Gyepm7ZHvI=;
        b=dwJqaG4xdX2kdAnbDeH5xFaOrS0EaJmi7axZE4CKGAMS513nhJP9xtzHsjsHyFBYAZ
         JA5ljn5y7Dpd8kYEMDK50JNFWHnMyEMfFSlDhMAIe5K7dqqpVKs/kNolhi42Z2d7s6nw
         NQG+9mWAxBgJFolR3UjrXPf+ZbXp8EkIOloBh5FxAk5hYk5z/TUcuTYQvQgQ6Fjvu2YN
         uj91vWGvFpaMj5ZLO+Wqu9ac1nIBVqvzp4xplp4XZmNzYEb0GHOXOsCvJjkKPMfTgPcs
         9DWGq8H5TnSvMduTcgNT46LHqQ+FIAxuH8LKqtkFTeoBmiqt30zxP7ADcxQFbrLUDyRk
         tNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+uwJGC9QQEeJXBgFaFTGM7r2UURRovHT/Gyepm7ZHvI=;
        b=NqDoFP2bNiT99FeAM5IHHPWTPS0Fcaprs9qMAYxCJhogN/g99VA9Y76M+Ud+c2VLIH
         H2CNEgUaSy5DUKw9i0opxARQCHul4fY9ho7Cgj2IZFZnRE0FY/6OX/jRKNflQWYPeQ+x
         VVRYobnqUp91CIzr3nc3fvjhqni+kti6JyIbWrs9sab3QYxiSKf4tI8oR3nirOmURCsb
         1xdhBhf1QV8NPA8tcmeBXdAunuLIy+s9zWCIk2/yvTMgmmt0itfbt2A1ehuHM4uZ+MoV
         EzQcPSF7tlmfRDLeGsrxTprVSzWwfRbl+opGcadXKtyvxRaem3swWYJVgWWlohJFqvOb
         e27Q==
X-Gm-Message-State: APjAAAWm5LeCH7x6eXo+IQC0W+diRLnUpvLE3ZMS9p0rCUCofo7cYWJY
        vHmuB2VJt2XAz4qOfsfJgp2/lQ==
X-Google-Smtp-Source: APXvYqwmE0DZ1aONPSeryTzS1u6CE2PPggyA3mpL12wbCqn2IrErn4ut1ch9D1EPBVaL6XvXFbGkaQ==
X-Received: by 2002:a25:5f4f:: with SMTP id h15mr1089692ybm.0.1572467442852;
        Wed, 30 Oct 2019 13:30:42 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id h35sm416432ywk.63.2019.10.30.13.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 13:30:42 -0700 (PDT)
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
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Sean Paul <sean@poorly.run>
Subject: [PATCH 5/5] Revert "dma-buf: Add dma-buf heaps framework"
Date:   Wed, 30 Oct 2019 16:29:54 -0400
Message-Id: <20191030203003.101156-6-sean@poorly.run>
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

This reverts commit a69b0e855d3fd278ff6f09a23e1edf929538e304.

This patchset doesn't meet the UAPI requirements set out in [1] for the DRM
subsystem. Once the userspace component is reviewed and ready for merge
we can try again.

[1]- https://01.org/linuxgraphics/gfx-docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements

Fixes: a69b0e855d3f ("dma-buf: Add dma-buf heaps framework")
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
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: "Andrew F. Davis" <afd@ti.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Sean Paul <sean@poorly.run>
---
 MAINTAINERS                   |  18 ---
 drivers/dma-buf/Kconfig       |   9 --
 drivers/dma-buf/Makefile      |   1 -
 drivers/dma-buf/dma-heap.c    | 269 ----------------------------------
 include/linux/dma-heap.h      |  59 --------
 include/uapi/linux/dma-heap.h |  55 -------
 6 files changed, 411 deletions(-)
 delete mode 100644 drivers/dma-buf/dma-heap.c
 delete mode 100644 include/linux/dma-heap.h
 delete mode 100644 include/uapi/linux/dma-heap.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 5f39067caa7c..b63c291ad029 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4942,24 +4942,6 @@ F:	include/linux/*fence.h
 F:	Documentation/driver-api/dma-buf.rst
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 
-DMA-BUF HEAPS FRAMEWORK
-M:	Sumit Semwal <sumit.semwal@linaro.org>
-R:	Andrew F. Davis <afd@ti.com>
-R:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
-R:	Liam Mark <lmark@codeaurora.org>
-R:	Laura Abbott <labbott@redhat.com>
-R:	Brian Starkey <Brian.Starkey@arm.com>
-R:	John Stultz <john.stultz@linaro.org>
-S:	Maintained
-L:	linux-media@vger.kernel.org
-L:	dri-devel@lists.freedesktop.org
-L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
-F:	include/uapi/linux/dma-heap.h
-F:	include/linux/dma-heap.h
-F:	drivers/dma-buf/dma-heap.c
-F:	drivers/dma-buf/heaps/*
-T:	git git://anongit.freedesktop.org/drm/drm-misc
-
 DMA GENERIC OFFLOAD ENGINE SUBSYSTEM
 M:	Vinod Koul <vkoul@kernel.org>
 L:	dmaengine@vger.kernel.org
diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index bffa58fc3e6e..a23b6752d11a 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -44,13 +44,4 @@ config DMABUF_SELFTESTS
 	default n
 	depends on DMA_SHARED_BUFFER
 
-menuconfig DMABUF_HEAPS
-	bool "DMA-BUF Userland Memory Heaps"
-	select DMA_SHARED_BUFFER
-	help
-	  Choose this option to enable the DMA-BUF userland memory heaps.
-	  This options creates per heap chardevs in /dev/dma_heap/ which
-	  allows userspace to allocate dma-bufs that can be shared
-	  between drivers.
-
 endmenu
diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index caee5eb3d351..03479da06422 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
 	 dma-resv.o seqno-fence.o
-obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
 obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
 obj-$(CONFIG_SW_SYNC)		+= sw_sync.o sync_debug.o
 obj-$(CONFIG_UDMABUF)		+= udmabuf.o
diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
deleted file mode 100644
index 9a41b73e54b4..000000000000
--- a/drivers/dma-buf/dma-heap.c
+++ /dev/null
@@ -1,269 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Framework for userspace DMA-BUF allocations
- *
- * Copyright (C) 2011 Google, Inc.
- * Copyright (C) 2019 Linaro Ltd.
- */
-
-#include <linux/cdev.h>
-#include <linux/debugfs.h>
-#include <linux/device.h>
-#include <linux/dma-buf.h>
-#include <linux/err.h>
-#include <linux/xarray.h>
-#include <linux/list.h>
-#include <linux/slab.h>
-#include <linux/uaccess.h>
-#include <linux/syscalls.h>
-#include <linux/dma-heap.h>
-#include <uapi/linux/dma-heap.h>
-
-#define DEVNAME "dma_heap"
-
-#define NUM_HEAP_MINORS 128
-
-/**
- * struct dma_heap - represents a dmabuf heap in the system
- * @name:		used for debugging/device-node name
- * @ops:		ops struct for this heap
- * @minor		minor number of this heap device
- * @heap_devt		heap device node
- * @heap_cdev		heap char device
- *
- * Represents a heap of memory from which buffers can be made.
- */
-struct dma_heap {
-	const char *name;
-	const struct dma_heap_ops *ops;
-	void *priv;
-	unsigned int minor;
-	dev_t heap_devt;
-	struct list_head list;
-	struct cdev heap_cdev;
-};
-
-static LIST_HEAD(heap_list);
-static DEFINE_MUTEX(heap_list_lock);
-static dev_t dma_heap_devt;
-static struct class *dma_heap_class;
-static DEFINE_XARRAY_ALLOC(dma_heap_minors);
-
-static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
-				 unsigned int fd_flags,
-				 unsigned int heap_flags)
-{
-	/*
-	 * Allocations from all heaps have to begin
-	 * and end on page boundaries.
-	 */
-	len = PAGE_ALIGN(len);
-	if (!len)
-		return -EINVAL;
-
-	return heap->ops->allocate(heap, len, fd_flags, heap_flags);
-}
-
-static int dma_heap_open(struct inode *inode, struct file *file)
-{
-	struct dma_heap *heap;
-
-	heap = xa_load(&dma_heap_minors, iminor(inode));
-	if (!heap) {
-		pr_err("dma_heap: minor %d unknown.\n", iminor(inode));
-		return -ENODEV;
-	}
-
-	/* instance data as context */
-	file->private_data = heap;
-	nonseekable_open(inode, file);
-
-	return 0;
-}
-
-static long dma_heap_ioctl_allocate(struct file *file, unsigned long arg)
-{
-	struct dma_heap_allocation_data heap_allocation;
-	struct dma_heap *heap = file->private_data;
-	int fd;
-
-	if (copy_from_user(&heap_allocation, (void __user *)arg,
-			   sizeof(heap_allocation)))
-		return -EFAULT;
-
-	if (heap_allocation.fd ||
-	    heap_allocation.reserved0 ||
-	    heap_allocation.reserved1) {
-		pr_warn_once("dma_heap: ioctl data not valid\n");
-		return -EINVAL;
-	}
-
-	if (heap_allocation.fd_flags & ~DMA_HEAP_VALID_FD_FLAGS) {
-		pr_warn_once("dma_heap: fd_flags has invalid or unsupported flags set\n");
-		return -EINVAL;
-	}
-
-	if (heap_allocation.heap_flags & ~DMA_HEAP_VALID_HEAP_FLAGS) {
-		pr_warn_once("dma_heap: heap flags has invalid or unsupported flags set\n");
-		return -EINVAL;
-	}
-
-	fd = dma_heap_buffer_alloc(heap, heap_allocation.len,
-				   heap_allocation.fd_flags,
-				   heap_allocation.heap_flags);
-	if (fd < 0)
-		return fd;
-
-	heap_allocation.fd = fd;
-
-	if (copy_to_user((void __user *)arg, &heap_allocation,
-			 sizeof(heap_allocation))) {
-		ksys_close(fd);
-		return -EFAULT;
-	}
-
-	return 0;
-}
-
-static long dma_heap_ioctl(struct file *file, unsigned int cmd,
-			   unsigned long arg)
-{
-	int ret = 0;
-
-	switch (cmd) {
-	case DMA_HEAP_IOC_ALLOC:
-		ret = dma_heap_ioctl_allocate(file, arg);
-		break;
-	default:
-		return -ENOTTY;
-	}
-
-	return ret;
-}
-
-static const struct file_operations dma_heap_fops = {
-	.owner          = THIS_MODULE,
-	.open		= dma_heap_open,
-	.unlocked_ioctl = dma_heap_ioctl,
-#ifdef CONFIG_COMPAT
-	.compat_ioctl	= dma_heap_ioctl,
-#endif
-};
-
-/**
- * dma_heap_get_drvdata() - get per-subdriver data for the heap
- * @heap: DMA-Heap to retrieve private data for
- *
- * Returns:
- * The per-subdriver data for the heap.
- */
-void *dma_heap_get_drvdata(struct dma_heap *heap)
-{
-	return heap->priv;
-}
-
-struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
-{
-	struct dma_heap *heap, *h, *err_ret;
-	struct device *dev_ret;
-	int ret;
-
-	if (!exp_info->name || !strcmp(exp_info->name, "")) {
-		pr_err("dma_heap: Cannot add heap without a name\n");
-		return ERR_PTR(-EINVAL);
-	}
-
-	if (!exp_info->ops || !exp_info->ops->allocate) {
-		pr_err("dma_heap: Cannot add heap with invalid ops struct\n");
-		return ERR_PTR(-EINVAL);
-	}
-
-	/* check the name is unique */
-	mutex_lock(&heap_list_lock);
-	list_for_each_entry(h, &heap_list, list) {
-		if (!strcmp(h->name, exp_info->name)) {
-			mutex_unlock(&heap_list_lock);
-			pr_err("dma_heap: Already registered heap named %s\n",
-			       exp_info->name);
-			return ERR_PTR(-EINVAL);
-		}
-	}
-	mutex_unlock(&heap_list_lock);
-
-	heap = kzalloc(sizeof(*heap), GFP_KERNEL);
-	if (!heap)
-		return ERR_PTR(-ENOMEM);
-
-	heap->name = exp_info->name;
-	heap->ops = exp_info->ops;
-	heap->priv = exp_info->priv;
-
-	/* Find unused minor number */
-	ret = xa_alloc(&dma_heap_minors, &heap->minor, heap,
-		       XA_LIMIT(0, NUM_HEAP_MINORS - 1), GFP_KERNEL);
-	if (ret < 0) {
-		pr_err("dma_heap: Unable to get minor number for heap\n");
-		err_ret = ERR_PTR(ret);
-		goto err0;
-	}
-
-	/* Create device */
-	heap->heap_devt = MKDEV(MAJOR(dma_heap_devt), heap->minor);
-
-	cdev_init(&heap->heap_cdev, &dma_heap_fops);
-	ret = cdev_add(&heap->heap_cdev, heap->heap_devt, 1);
-	if (ret < 0) {
-		pr_err("dma_heap: Unable to add char device\n");
-		err_ret = ERR_PTR(ret);
-		goto err1;
-	}
-
-	dev_ret = device_create(dma_heap_class,
-				NULL,
-				heap->heap_devt,
-				NULL,
-				heap->name);
-	if (IS_ERR(dev_ret)) {
-		pr_err("dma_heap: Unable to create device\n");
-		err_ret = ERR_CAST(dev_ret);
-		goto err2;
-	}
-	/* Add heap to the list */
-	mutex_lock(&heap_list_lock);
-	list_add(&heap->list, &heap_list);
-	mutex_unlock(&heap_list_lock);
-
-	return heap;
-
-err2:
-	cdev_del(&heap->heap_cdev);
-err1:
-	xa_erase(&dma_heap_minors, heap->minor);
-err0:
-	kfree(heap);
-	return err_ret;
-}
-
-static char *dma_heap_devnode(struct device *dev, umode_t *mode)
-{
-	return kasprintf(GFP_KERNEL, "dma_heap/%s", dev_name(dev));
-}
-
-static int dma_heap_init(void)
-{
-	int ret;
-
-	ret = alloc_chrdev_region(&dma_heap_devt, 0, NUM_HEAP_MINORS, DEVNAME);
-	if (ret)
-		return ret;
-
-	dma_heap_class = class_create(THIS_MODULE, DEVNAME);
-	if (IS_ERR(dma_heap_class)) {
-		unregister_chrdev_region(dma_heap_devt, NUM_HEAP_MINORS);
-		return PTR_ERR(dma_heap_class);
-	}
-	dma_heap_class->devnode = dma_heap_devnode;
-
-	return 0;
-}
-subsys_initcall(dma_heap_init);
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
deleted file mode 100644
index 454e354d1ffb..000000000000
--- a/include/linux/dma-heap.h
+++ /dev/null
@@ -1,59 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * DMABUF Heaps Allocation Infrastructure
- *
- * Copyright (C) 2011 Google, Inc.
- * Copyright (C) 2019 Linaro Ltd.
- */
-
-#ifndef _DMA_HEAPS_H
-#define _DMA_HEAPS_H
-
-#include <linux/cdev.h>
-#include <linux/types.h>
-
-struct dma_heap;
-
-/**
- * struct dma_heap_ops - ops to operate on a given heap
- * @allocate:		allocate dmabuf and return fd
- *
- * allocate returns dmabuf fd  on success, -errno on error.
- */
-struct dma_heap_ops {
-	int (*allocate)(struct dma_heap *heap,
-			unsigned long len,
-			unsigned long fd_flags,
-			unsigned long heap_flags);
-};
-
-/**
- * struct dma_heap_export_info - information needed to export a new dmabuf heap
- * @name:	used for debugging/device-node name
- * @ops:	ops struct for this heap
- * @priv:	heap exporter private data
- *
- * Information needed to export a new dmabuf heap.
- */
-struct dma_heap_export_info {
-	const char *name;
-	const struct dma_heap_ops *ops;
-	void *priv;
-};
-
-/**
- * dma_heap_get_drvdata() - get per-heap driver data
- * @heap: DMA-Heap to retrieve private data for
- *
- * Returns:
- * The per-heap data for the heap.
- */
-void *dma_heap_get_drvdata(struct dma_heap *heap);
-
-/**
- * dma_heap_add - adds a heap to dmabuf heaps
- * @exp_info:		information needed to register this heap
- */
-struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
-
-#endif /* _DMA_HEAPS_H */
diff --git a/include/uapi/linux/dma-heap.h b/include/uapi/linux/dma-heap.h
deleted file mode 100644
index 6ce5cc68d238..000000000000
--- a/include/uapi/linux/dma-heap.h
+++ /dev/null
@@ -1,55 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- * DMABUF Heaps Userspace API
- *
- * Copyright (C) 2011 Google, Inc.
- * Copyright (C) 2019 Linaro Ltd.
- */
-#ifndef _UAPI_LINUX_DMABUF_POOL_H
-#define _UAPI_LINUX_DMABUF_POOL_H
-
-#include <linux/ioctl.h>
-#include <linux/types.h>
-
-/**
- * DOC: DMABUF Heaps Userspace API
- */
-
-/* Valid FD_FLAGS are O_CLOEXEC, O_RDONLY, O_WRONLY, O_RDWR */
-#define DMA_HEAP_VALID_FD_FLAGS (O_CLOEXEC | O_ACCMODE)
-
-/* Currently no heap flags */
-#define DMA_HEAP_VALID_HEAP_FLAGS (0)
-
-/**
- * struct dma_heap_allocation_data - metadata passed from userspace for
- *                                      allocations
- * @len:		size of the allocation
- * @fd:			will be populated with a fd which provdes the
- *			handle to the allocated dma-buf
- * @fd_flags:		file descriptor flags used when allocating
- * @heap_flags:		flags passed to heap
- *
- * Provided by userspace as an argument to the ioctl
- */
-struct dma_heap_allocation_data {
-	__u64 len;
-	__u32 fd;
-	__u32 fd_flags;
-	__u64 heap_flags;
-	__u32 reserved0;
-	__u32 reserved1;
-};
-
-#define DMA_HEAP_IOC_MAGIC		'H'
-
-/**
- * DOC: DMA_HEAP_IOC_ALLOC - allocate memory from pool
- *
- * Takes an dma_heap_allocation_data struct and returns it with the fd field
- * populated with the dmabuf handle of the allocation.
- */
-#define DMA_HEAP_IOC_ALLOC	_IOWR(DMA_HEAP_IOC_MAGIC, 0, \
-				      struct dma_heap_allocation_data)
-
-#endif /* _UAPI_LINUX_DMABUF_POOL_H */
-- 
Sean Paul, Software Engineer, Google / Chromium OS

