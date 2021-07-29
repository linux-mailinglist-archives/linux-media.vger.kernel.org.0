Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 132DA3D9DF6
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 09:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234392AbhG2HDi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 03:03:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234360AbhG2HDh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 03:03:37 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0217C0613C1
        for <linux-media@vger.kernel.org>; Thu, 29 Jul 2021 00:03:34 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id l4-20020a05600c1d04b02902506f89ad2dso5122924wms.1
        for <linux-media@vger.kernel.org>; Thu, 29 Jul 2021 00:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=l4mC++UOwCyjedwbrWk0u3lUi/3ok9zcANSVj+xI+yg=;
        b=MZXJtp+NIZLco2AJO0BqskZDRpiG40EGbjG8FgfEwVje0dfLPT3SFYtNOgNiSp93r6
         f76T84uSPiHTaY/FiuAdyTkbmjN6lJjETHJttJ/cdxL8sfUKW8n0SxUToJV4Qh9Op4MM
         gBOUTpDTwEumosAS1d8bElYbwZMg7Lsso2yVNKo8/hMwDJWs4wC0/sqwhsuCHOTuBnDj
         QIPBfqnjQd/oBQbGSmARdixBeNmeXji/GpLPREah1od6YtF7lwN8J/vL8/yw8DRvV51C
         I5az/CrfWVoXZ4B0pDD+iFe6sZQgZ4kXPijVhnNYy6HUumD8f1CQBJdcX+m0IEPKfNpD
         DsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l4mC++UOwCyjedwbrWk0u3lUi/3ok9zcANSVj+xI+yg=;
        b=DCJY9CoVPUc/Whp0bDrXNf93tFSGKd7RO74W8ReeJbzdm7vYJ6t+krx2FQ8X0gkbhk
         8zaRS3sfylWe90CEn+1CPjl3w4ehIqpVgyrdogY9NVfQWZeen79mByQy5cEjsskpGnNt
         xs5HI84XbMV/dp38Nf2b8bYzdu2zalMe3B2E/ZxMYNns4iChKI1MxmfDkHLQ2dF8BKuF
         kfvPqHVNbX6CKX2YMZsJ7TynrxAuRGFJMPiuvK+gamXdWQsz2Lt6MnW6gvwiOjP9OZZd
         U7iJ1y3fAdbD+TcPg2TbjoHqGLYAuIozpttgIDqGSAo1NnZ72mZ//YukuF8v244yTx4g
         f2sg==
X-Gm-Message-State: AOAM530EcVmBUKqCj8WlmPPlmxUsBDmQfVQsYGE2/5jFJfLUcp98H6A3
        MdGsEq2EVjnCVYPImrqmo0IKI4g9gYE=
X-Google-Smtp-Source: ABdhPJydhFLoVxSYpZgw1q4In/GN3IgnB9zZ6TOkuc1zfLJMyys3No46zVvtO44rImQCQYVQnCVv7A==
X-Received: by 2002:a05:600c:4f48:: with SMTP id m8mr3203013wmq.22.1627542213190;
        Thu, 29 Jul 2021 00:03:33 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4e80:335d:252f:540b])
        by smtp.gmail.com with ESMTPSA id h14sm2177527wrp.55.2021.07.29.00.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 00:03:32 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, gustavo@padovan.org, daniel@ffwll.ch,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 3/3] dma-buf: nuke SW_SYNC debugfs files
Date:   Thu, 29 Jul 2021 09:03:30 +0200
Message-Id: <20210729070330.41443-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729070330.41443-1-christian.koenig@amd.com>
References: <20210729070330.41443-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As we now knew controlling dma_fence synchronization from userspace is
extremely dangerous and can not only deadlock drivers but trivially also the
whole kernel memory management.

Entirely remove this option. We now have in kernel unit tests to exercise the
dma_fence framework and it's containers.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/Kconfig      |  13 --
 drivers/dma-buf/Makefile     |   1 -
 drivers/dma-buf/sw_sync.c    | 412 -----------------------------------
 drivers/dma-buf/sync_debug.c | 190 ----------------
 drivers/dma-buf/sync_debug.h |  72 ------
 5 files changed, 688 deletions(-)
 delete mode 100644 drivers/dma-buf/sw_sync.c
 delete mode 100644 drivers/dma-buf/sync_debug.c
 delete mode 100644 drivers/dma-buf/sync_debug.h

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index 9561e3d2d428..26c53f45616a 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -17,19 +17,6 @@ config SYNC_FILE
 	  Files fds, to the DRM driver for example. More details at
 	  Documentation/driver-api/sync_file.rst.
 
-config SW_SYNC
-	bool "Sync File Validation Framework"
-	default n
-	depends on SYNC_FILE
-	depends on DEBUG_FS
-	help
-	  A sync object driver that uses a 32bit counter to coordinate
-	  synchronization.  Useful when there is no hardware primitive backing
-	  the synchronization.
-
-	  WARNING: improper use of this can result in deadlocking kernel
-	  drivers from userspace. Intended for test and debug only.
-
 config UDMABUF
 	bool "userspace dmabuf misc driver"
 	default n
diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index 1ef021273a06..fa3af0953f87 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -4,7 +4,6 @@ obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
 obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
 obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
 obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
-obj-$(CONFIG_SW_SYNC)		+= sw_sync.o sync_debug.o
 obj-$(CONFIG_UDMABUF)		+= udmabuf.o
 obj-$(CONFIG_DMABUF_SYSFS_STATS) += dma-buf-sysfs-stats.o
 
diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
deleted file mode 100644
index 348b3a9170fa..000000000000
--- a/drivers/dma-buf/sw_sync.c
+++ /dev/null
@@ -1,412 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Sync File validation framework
- *
- * Copyright (C) 2012 Google, Inc.
- */
-
-#include <linux/file.h>
-#include <linux/fs.h>
-#include <linux/uaccess.h>
-#include <linux/slab.h>
-#include <linux/sync_file.h>
-
-#include "sync_debug.h"
-
-#define CREATE_TRACE_POINTS
-#include "sync_trace.h"
-
-/*
- * SW SYNC validation framework
- *
- * A sync object driver that uses a 32bit counter to coordinate
- * synchronization.  Useful when there is no hardware primitive backing
- * the synchronization.
- *
- * To start the framework just open:
- *
- * <debugfs>/sync/sw_sync
- *
- * That will create a sync timeline, all fences created under this timeline
- * file descriptor will belong to the this timeline.
- *
- * The 'sw_sync' file can be opened many times as to create different
- * timelines.
- *
- * Fences can be created with SW_SYNC_IOC_CREATE_FENCE ioctl with struct
- * sw_sync_create_fence_data as parameter.
- *
- * To increment the timeline counter, SW_SYNC_IOC_INC ioctl should be used
- * with the increment as u32. This will update the last signaled value
- * from the timeline and signal any fence that has a seqno smaller or equal
- * to it.
- *
- * struct sw_sync_create_fence_data
- * @value:	the seqno to initialise the fence with
- * @name:	the name of the new sync point
- * @fence:	return the fd of the new sync_file with the created fence
- */
-struct sw_sync_create_fence_data {
-	__u32	value;
-	char	name[32];
-	__s32	fence; /* fd of new fence */
-};
-
-#define SW_SYNC_IOC_MAGIC	'W'
-
-#define SW_SYNC_IOC_CREATE_FENCE	_IOWR(SW_SYNC_IOC_MAGIC, 0,\
-		struct sw_sync_create_fence_data)
-
-#define SW_SYNC_IOC_INC			_IOW(SW_SYNC_IOC_MAGIC, 1, __u32)
-
-static const struct dma_fence_ops timeline_fence_ops;
-
-static inline struct sync_pt *dma_fence_to_sync_pt(struct dma_fence *fence)
-{
-	if (fence->ops != &timeline_fence_ops)
-		return NULL;
-	return container_of(fence, struct sync_pt, base);
-}
-
-/**
- * sync_timeline_create() - creates a sync object
- * @name:	sync_timeline name
- *
- * Creates a new sync_timeline. Returns the sync_timeline object or NULL in
- * case of error.
- */
-static struct sync_timeline *sync_timeline_create(const char *name)
-{
-	struct sync_timeline *obj;
-
-	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
-	if (!obj)
-		return NULL;
-
-	kref_init(&obj->kref);
-	obj->context = dma_fence_context_alloc(1);
-	strlcpy(obj->name, name, sizeof(obj->name));
-
-	obj->pt_tree = RB_ROOT;
-	INIT_LIST_HEAD(&obj->pt_list);
-	spin_lock_init(&obj->lock);
-
-	sync_timeline_debug_add(obj);
-
-	return obj;
-}
-
-static void sync_timeline_free(struct kref *kref)
-{
-	struct sync_timeline *obj =
-		container_of(kref, struct sync_timeline, kref);
-
-	sync_timeline_debug_remove(obj);
-
-	kfree(obj);
-}
-
-static void sync_timeline_get(struct sync_timeline *obj)
-{
-	kref_get(&obj->kref);
-}
-
-static void sync_timeline_put(struct sync_timeline *obj)
-{
-	kref_put(&obj->kref, sync_timeline_free);
-}
-
-static const char *timeline_fence_get_driver_name(struct dma_fence *fence)
-{
-	return "sw_sync";
-}
-
-static const char *timeline_fence_get_timeline_name(struct dma_fence *fence)
-{
-	struct sync_timeline *parent = dma_fence_parent(fence);
-
-	return parent->name;
-}
-
-static void timeline_fence_release(struct dma_fence *fence)
-{
-	struct sync_pt *pt = dma_fence_to_sync_pt(fence);
-	struct sync_timeline *parent = dma_fence_parent(fence);
-	unsigned long flags;
-
-	spin_lock_irqsave(fence->lock, flags);
-	if (!list_empty(&pt->link)) {
-		list_del(&pt->link);
-		rb_erase(&pt->node, &parent->pt_tree);
-	}
-	spin_unlock_irqrestore(fence->lock, flags);
-
-	sync_timeline_put(parent);
-	dma_fence_free(fence);
-}
-
-static bool timeline_fence_signaled(struct dma_fence *fence)
-{
-	struct sync_timeline *parent = dma_fence_parent(fence);
-
-	return !__dma_fence_is_later(fence->seqno, parent->value, fence->ops);
-}
-
-static bool timeline_fence_enable_signaling(struct dma_fence *fence)
-{
-	return true;
-}
-
-static void timeline_fence_value_str(struct dma_fence *fence,
-				    char *str, int size)
-{
-	snprintf(str, size, "%lld", fence->seqno);
-}
-
-static void timeline_fence_timeline_value_str(struct dma_fence *fence,
-					     char *str, int size)
-{
-	struct sync_timeline *parent = dma_fence_parent(fence);
-
-	snprintf(str, size, "%d", parent->value);
-}
-
-static const struct dma_fence_ops timeline_fence_ops = {
-	.get_driver_name = timeline_fence_get_driver_name,
-	.get_timeline_name = timeline_fence_get_timeline_name,
-	.enable_signaling = timeline_fence_enable_signaling,
-	.signaled = timeline_fence_signaled,
-	.release = timeline_fence_release,
-	.fence_value_str = timeline_fence_value_str,
-	.timeline_value_str = timeline_fence_timeline_value_str,
-};
-
-/**
- * sync_timeline_signal() - signal a status change on a sync_timeline
- * @obj:	sync_timeline to signal
- * @inc:	num to increment on timeline->value
- *
- * A sync implementation should call this any time one of it's fences
- * has signaled or has an error condition.
- */
-static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
-{
-	struct sync_pt *pt, *next;
-
-	trace_sync_timeline(obj);
-
-	spin_lock_irq(&obj->lock);
-
-	obj->value += inc;
-
-	list_for_each_entry_safe(pt, next, &obj->pt_list, link) {
-		if (!timeline_fence_signaled(&pt->base))
-			break;
-
-		list_del_init(&pt->link);
-		rb_erase(&pt->node, &obj->pt_tree);
-
-		/*
-		 * A signal callback may release the last reference to this
-		 * fence, causing it to be freed. That operation has to be
-		 * last to avoid a use after free inside this loop, and must
-		 * be after we remove the fence from the timeline in order to
-		 * prevent deadlocking on timeline->lock inside
-		 * timeline_fence_release().
-		 */
-		dma_fence_signal_locked(&pt->base);
-	}
-
-	spin_unlock_irq(&obj->lock);
-}
-
-/**
- * sync_pt_create() - creates a sync pt
- * @obj:	parent sync_timeline
- * @value:	value of the fence
- *
- * Creates a new sync_pt (fence) as a child of @parent.  @size bytes will be
- * allocated allowing for implementation specific data to be kept after
- * the generic sync_timeline struct. Returns the sync_pt object or
- * NULL in case of error.
- */
-static struct sync_pt *sync_pt_create(struct sync_timeline *obj,
-				      unsigned int value)
-{
-	struct sync_pt *pt;
-
-	pt = kzalloc(sizeof(*pt), GFP_KERNEL);
-	if (!pt)
-		return NULL;
-
-	sync_timeline_get(obj);
-	dma_fence_init(&pt->base, &timeline_fence_ops, &obj->lock,
-		       obj->context, value);
-	INIT_LIST_HEAD(&pt->link);
-
-	spin_lock_irq(&obj->lock);
-	if (!dma_fence_is_signaled_locked(&pt->base)) {
-		struct rb_node **p = &obj->pt_tree.rb_node;
-		struct rb_node *parent = NULL;
-
-		while (*p) {
-			struct sync_pt *other;
-			int cmp;
-
-			parent = *p;
-			other = rb_entry(parent, typeof(*pt), node);
-			cmp = value - other->base.seqno;
-			if (cmp > 0) {
-				p = &parent->rb_right;
-			} else if (cmp < 0) {
-				p = &parent->rb_left;
-			} else {
-				if (dma_fence_get_rcu(&other->base)) {
-					sync_timeline_put(obj);
-					kfree(pt);
-					pt = other;
-					goto unlock;
-				}
-				p = &parent->rb_left;
-			}
-		}
-		rb_link_node(&pt->node, parent, p);
-		rb_insert_color(&pt->node, &obj->pt_tree);
-
-		parent = rb_next(&pt->node);
-		list_add_tail(&pt->link,
-			      parent ? &rb_entry(parent, typeof(*pt), node)->link : &obj->pt_list);
-	}
-unlock:
-	spin_unlock_irq(&obj->lock);
-
-	return pt;
-}
-
-/*
- * *WARNING*
- *
- * improper use of this can result in deadlocking kernel drivers from userspace.
- */
-
-/* opening sw_sync create a new sync obj */
-static int sw_sync_debugfs_open(struct inode *inode, struct file *file)
-{
-	struct sync_timeline *obj;
-	char task_comm[TASK_COMM_LEN];
-
-	get_task_comm(task_comm, current);
-
-	obj = sync_timeline_create(task_comm);
-	if (!obj)
-		return -ENOMEM;
-
-	file->private_data = obj;
-
-	return 0;
-}
-
-static int sw_sync_debugfs_release(struct inode *inode, struct file *file)
-{
-	struct sync_timeline *obj = file->private_data;
-	struct sync_pt *pt, *next;
-
-	spin_lock_irq(&obj->lock);
-
-	list_for_each_entry_safe(pt, next, &obj->pt_list, link) {
-		dma_fence_set_error(&pt->base, -ENOENT);
-		dma_fence_signal_locked(&pt->base);
-	}
-
-	spin_unlock_irq(&obj->lock);
-
-	sync_timeline_put(obj);
-	return 0;
-}
-
-static long sw_sync_ioctl_create_fence(struct sync_timeline *obj,
-				       unsigned long arg)
-{
-	int fd = get_unused_fd_flags(O_CLOEXEC);
-	int err;
-	struct sync_pt *pt;
-	struct sync_file *sync_file;
-	struct sw_sync_create_fence_data data;
-
-	if (fd < 0)
-		return fd;
-
-	if (copy_from_user(&data, (void __user *)arg, sizeof(data))) {
-		err = -EFAULT;
-		goto err;
-	}
-
-	pt = sync_pt_create(obj, data.value);
-	if (!pt) {
-		err = -ENOMEM;
-		goto err;
-	}
-
-	sync_file = sync_file_create(&pt->base);
-	dma_fence_put(&pt->base);
-	if (!sync_file) {
-		err = -ENOMEM;
-		goto err;
-	}
-
-	data.fence = fd;
-	if (copy_to_user((void __user *)arg, &data, sizeof(data))) {
-		fput(sync_file->file);
-		err = -EFAULT;
-		goto err;
-	}
-
-	fd_install(fd, sync_file->file);
-
-	return 0;
-
-err:
-	put_unused_fd(fd);
-	return err;
-}
-
-static long sw_sync_ioctl_inc(struct sync_timeline *obj, unsigned long arg)
-{
-	u32 value;
-
-	if (copy_from_user(&value, (void __user *)arg, sizeof(value)))
-		return -EFAULT;
-
-	while (value > INT_MAX)  {
-		sync_timeline_signal(obj, INT_MAX);
-		value -= INT_MAX;
-	}
-
-	sync_timeline_signal(obj, value);
-
-	return 0;
-}
-
-static long sw_sync_ioctl(struct file *file, unsigned int cmd,
-			  unsigned long arg)
-{
-	struct sync_timeline *obj = file->private_data;
-
-	switch (cmd) {
-	case SW_SYNC_IOC_CREATE_FENCE:
-		return sw_sync_ioctl_create_fence(obj, arg);
-
-	case SW_SYNC_IOC_INC:
-		return sw_sync_ioctl_inc(obj, arg);
-
-	default:
-		return -ENOTTY;
-	}
-}
-
-const struct file_operations sw_sync_debugfs_fops = {
-	.open           = sw_sync_debugfs_open,
-	.release        = sw_sync_debugfs_release,
-	.unlocked_ioctl = sw_sync_ioctl,
-	.compat_ioctl	= compat_ptr_ioctl,
-};
diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
deleted file mode 100644
index 101394f16930..000000000000
--- a/drivers/dma-buf/sync_debug.c
+++ /dev/null
@@ -1,190 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Sync File validation framework and debug information
- *
- * Copyright (C) 2012 Google, Inc.
- */
-
-#include <linux/debugfs.h>
-#include "sync_debug.h"
-
-static struct dentry *dbgfs;
-
-static LIST_HEAD(sync_timeline_list_head);
-static DEFINE_SPINLOCK(sync_timeline_list_lock);
-static LIST_HEAD(sync_file_list_head);
-static DEFINE_SPINLOCK(sync_file_list_lock);
-
-void sync_timeline_debug_add(struct sync_timeline *obj)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&sync_timeline_list_lock, flags);
-	list_add_tail(&obj->sync_timeline_list, &sync_timeline_list_head);
-	spin_unlock_irqrestore(&sync_timeline_list_lock, flags);
-}
-
-void sync_timeline_debug_remove(struct sync_timeline *obj)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&sync_timeline_list_lock, flags);
-	list_del(&obj->sync_timeline_list);
-	spin_unlock_irqrestore(&sync_timeline_list_lock, flags);
-}
-
-void sync_file_debug_add(struct sync_file *sync_file)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&sync_file_list_lock, flags);
-	list_add_tail(&sync_file->sync_file_list, &sync_file_list_head);
-	spin_unlock_irqrestore(&sync_file_list_lock, flags);
-}
-
-void sync_file_debug_remove(struct sync_file *sync_file)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&sync_file_list_lock, flags);
-	list_del(&sync_file->sync_file_list);
-	spin_unlock_irqrestore(&sync_file_list_lock, flags);
-}
-
-static const char *sync_status_str(int status)
-{
-	if (status < 0)
-		return "error";
-
-	if (status > 0)
-		return "signaled";
-
-	return "active";
-}
-
-static void sync_print_fence(struct seq_file *s,
-			     struct dma_fence *fence, bool show)
-{
-	struct sync_timeline *parent = dma_fence_parent(fence);
-	int status;
-
-	status = dma_fence_get_status_locked(fence);
-
-	seq_printf(s, "  %s%sfence %s",
-		   show ? parent->name : "",
-		   show ? "_" : "",
-		   sync_status_str(status));
-
-	if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags)) {
-		struct timespec64 ts64 =
-			ktime_to_timespec64(fence->timestamp);
-
-		seq_printf(s, "@%lld.%09ld", (s64)ts64.tv_sec, ts64.tv_nsec);
-	}
-
-	if (fence->ops->timeline_value_str &&
-		fence->ops->fence_value_str) {
-		char value[64];
-		bool success;
-
-		fence->ops->fence_value_str(fence, value, sizeof(value));
-		success = strlen(value);
-
-		if (success) {
-			seq_printf(s, ": %s", value);
-
-			fence->ops->timeline_value_str(fence, value,
-						       sizeof(value));
-
-			if (strlen(value))
-				seq_printf(s, " / %s", value);
-		}
-	}
-
-	seq_putc(s, '\n');
-}
-
-static void sync_print_obj(struct seq_file *s, struct sync_timeline *obj)
-{
-	struct list_head *pos;
-
-	seq_printf(s, "%s: %d\n", obj->name, obj->value);
-
-	spin_lock_irq(&obj->lock);
-	list_for_each(pos, &obj->pt_list) {
-		struct sync_pt *pt = container_of(pos, struct sync_pt, link);
-		sync_print_fence(s, &pt->base, false);
-	}
-	spin_unlock_irq(&obj->lock);
-}
-
-static void sync_print_sync_file(struct seq_file *s,
-				  struct sync_file *sync_file)
-{
-	char buf[128];
-	int i;
-
-	seq_printf(s, "[%p] %s: %s\n", sync_file,
-		   sync_file_get_name(sync_file, buf, sizeof(buf)),
-		   sync_status_str(dma_fence_get_status(sync_file->fence)));
-
-	if (dma_fence_is_array(sync_file->fence)) {
-		struct dma_fence_array *array = to_dma_fence_array(sync_file->fence);
-
-		for (i = 0; i < array->num_fences; ++i)
-			sync_print_fence(s, array->fences[i], true);
-	} else {
-		sync_print_fence(s, sync_file->fence, true);
-	}
-}
-
-static int sync_info_debugfs_show(struct seq_file *s, void *unused)
-{
-	struct list_head *pos;
-
-	seq_puts(s, "objs:\n--------------\n");
-
-	spin_lock_irq(&sync_timeline_list_lock);
-	list_for_each(pos, &sync_timeline_list_head) {
-		struct sync_timeline *obj =
-			container_of(pos, struct sync_timeline,
-				     sync_timeline_list);
-
-		sync_print_obj(s, obj);
-		seq_putc(s, '\n');
-	}
-	spin_unlock_irq(&sync_timeline_list_lock);
-
-	seq_puts(s, "fences:\n--------------\n");
-
-	spin_lock_irq(&sync_file_list_lock);
-	list_for_each(pos, &sync_file_list_head) {
-		struct sync_file *sync_file =
-			container_of(pos, struct sync_file, sync_file_list);
-
-		sync_print_sync_file(s, sync_file);
-		seq_putc(s, '\n');
-	}
-	spin_unlock_irq(&sync_file_list_lock);
-	return 0;
-}
-
-DEFINE_SHOW_ATTRIBUTE(sync_info_debugfs);
-
-static __init int sync_debugfs_init(void)
-{
-	dbgfs = debugfs_create_dir("sync", NULL);
-
-	/*
-	 * The debugfs files won't ever get removed and thus, there is
-	 * no need to protect it against removal races. The use of
-	 * debugfs_create_file_unsafe() is actually safe here.
-	 */
-	debugfs_create_file_unsafe("info", 0444, dbgfs, NULL,
-				   &sync_info_debugfs_fops);
-	debugfs_create_file_unsafe("sw_sync", 0644, dbgfs, NULL,
-				   &sw_sync_debugfs_fops);
-
-	return 0;
-}
-late_initcall(sync_debugfs_init);
diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_debug.h
deleted file mode 100644
index 6176e52ba2d7..000000000000
--- a/drivers/dma-buf/sync_debug.h
+++ /dev/null
@@ -1,72 +0,0 @@
-/*
- * Sync File validation framework and debug infomation
- *
- * Copyright (C) 2012 Google, Inc.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- */
-
-#ifndef _LINUX_SYNC_H
-#define _LINUX_SYNC_H
-
-#include <linux/list.h>
-#include <linux/rbtree.h>
-#include <linux/spinlock.h>
-#include <linux/dma-fence.h>
-
-#include <linux/sync_file.h>
-#include <uapi/linux/sync_file.h>
-
-/**
- * struct sync_timeline - sync object
- * @kref:		reference count on fence.
- * @name:		name of the sync_timeline. Useful for debugging
- * @lock:		lock protecting @pt_list and @value
- * @pt_tree:		rbtree of active (unsignaled/errored) sync_pts
- * @pt_list:		list of active (unsignaled/errored) sync_pts
- * @sync_timeline_list:	membership in global sync_timeline_list
- */
-struct sync_timeline {
-	struct kref		kref;
-	char			name[32];
-
-	/* protected by lock */
-	u64			context;
-	int			value;
-
-	struct rb_root		pt_tree;
-	struct list_head	pt_list;
-	spinlock_t		lock;
-
-	struct list_head	sync_timeline_list;
-};
-
-static inline struct sync_timeline *dma_fence_parent(struct dma_fence *fence)
-{
-	return container_of(fence->lock, struct sync_timeline, lock);
-}
-
-/**
- * struct sync_pt - sync_pt object
- * @base: base fence object
- * @link: link on the sync timeline's list
- * @node: node in the sync timeline's tree
- */
-struct sync_pt {
-	struct dma_fence base;
-	struct list_head link;
-	struct rb_node node;
-};
-
-extern const struct file_operations sw_sync_debugfs_fops;
-
-void sync_timeline_debug_add(struct sync_timeline *obj);
-void sync_timeline_debug_remove(struct sync_timeline *obj);
-void sync_file_debug_add(struct sync_file *fence);
-void sync_file_debug_remove(struct sync_file *fence);
-
-#endif /* _LINUX_SYNC_H */
-- 
2.25.1

