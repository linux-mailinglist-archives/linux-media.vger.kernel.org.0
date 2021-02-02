Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11BD330B8D8
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 08:44:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbhBBHnc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 02:43:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232285AbhBBHmz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 02:42:55 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB053C061573
        for <linux-media@vger.kernel.org>; Mon,  1 Feb 2021 23:41:55 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id m6so13783027pfk.1
        for <linux-media@vger.kernel.org>; Mon, 01 Feb 2021 23:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oQykFoC4igzaAGN1smzA1eOO+ArdBSIk2jifTuAEeJw=;
        b=tmm5Bw1jGh2jTml0072qcFXEYMfN3AjX6VDSh0KZG4d2CMkzMAfAvs9VJNLN4O88am
         1gGYne0IOTvMyVOHnsP0HJpX1YdBb3WSC6YZJ6Yard8Yg3yqt3yHt1UXcbQtji/rzEWd
         oUedGHboNdNxCvIHIJbINhP6tKVNzYI/jTdxkev2bPkmOompHWoj/SxMeP9itIN3iJH+
         4p9Aa6QCKaEwHSM50gVdMJrFV1JD2Lu5X+aBpWsfrxKyKQACjOKusuQUbhpWhdc0dLQp
         3v961aMXeV0W0Bv5K+1K4wIS26adYr3Eg/L+ew9T0jZS1HQTf37XyAmM6tb4RgXK4t2S
         qtlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oQykFoC4igzaAGN1smzA1eOO+ArdBSIk2jifTuAEeJw=;
        b=KbDLcIJgiNZG6vhiGOVkU0RhOEhYfANOQeACGe37evM18Mvduf76yoQdSNypBphRAl
         vUV2hgX3opyfeo7cHQhJkiMnbtkOtkWMJohjbny4qUcBoruAcQYSGpkZkRW7Gscxi541
         qVeDqb4DAiXInnuxpeiwQu/sMNVuq/e7VKW8fW+yy4Wuph/JO3kM7daE8V7DNzH9Zt7N
         wJWuX+XEjC37ErsgyD7Y07yrDc4oPWrMQjltrL/W8OZk9Xah/+rJHIB9XCeLsI2naMCf
         Ya78QDa6ZCy9OCfHFpbtQS/M8S6wZ8FxeyqqYmT6gg89+MSmdh0Mcpsu3KdoCpURWsif
         c/DQ==
X-Gm-Message-State: AOAM533+vmAOn0HBbPRniQ7a0W5b6rMK6yhVEWQrKIOpHbiXr3ouzCK6
        UBj005480YJWOv0AU26NIT6FXQ==
X-Google-Smtp-Source: ABdhPJzDgJOLWf+tVIAedqm6oCCLfpNPjJ4lQXYga18A04NkAioq9UoO9JJUUMlo4PR6/2fsiYMHqQ==
X-Received: by 2002:a63:700f:: with SMTP id l15mr20368287pgc.214.1612251715334;
        Mon, 01 Feb 2021 23:41:55 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id k9sm9410666pgh.94.2021.02.01.23.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 23:41:54 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/3] dma-buf: heaps: Add deferred-free-helper library code
Date:   Tue,  2 Feb 2021 07:41:49 +0000
Message-Id: <20210202074151.3146795-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch provides infrastructure for deferring buffer frees.

This is a feature ION provided which when used with some form
of a page pool, provides a nice performance boost in an
allocation microbenchmark. The reason it helps is it allows the
page-zeroing to be done out of the normal allocation/free path,
and pushed off to a kthread.

As not all heaps will find this useful, its implemented as
a optional helper library that heaps can utilize.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Daniel Mentz <danielmentz@google.com>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v2:
* Fix sleep in atomic issue from using a mutex, by switching
  to a spinlock as Reported-by: kernel test robot <oliver.sang@intel.com>
* Cleanup API to use a reason enum for clarity and add some documentation
  comments as suggested by Suren Baghdasaryan.

v3:
* Minor tweaks so it can be built as a module
* A few small fixups suggested by Daniel Mentz

v4:
* Tweak from Daniel Mentz to make sure the shrinker
  count/freed values are tracked in pages not bytes
---
 drivers/dma-buf/heaps/Kconfig                |   3 +
 drivers/dma-buf/heaps/Makefile               |   1 +
 drivers/dma-buf/heaps/deferred-free-helper.c | 138 +++++++++++++++++++
 drivers/dma-buf/heaps/deferred-free-helper.h |  55 ++++++++
 4 files changed, 197 insertions(+)
 create mode 100644 drivers/dma-buf/heaps/deferred-free-helper.c
 create mode 100644 drivers/dma-buf/heaps/deferred-free-helper.h

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c4226..f7aef8bc7119 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -1,3 +1,6 @@
+config DMABUF_HEAPS_DEFERRED_FREE
+	tristate
+
 config DMABUF_HEAPS_SYSTEM
 	bool "DMA-BUF System Heap"
 	depends on DMABUF_HEAPS
diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
index 974467791032..4e7839875615 100644
--- a/drivers/dma-buf/heaps/Makefile
+++ b/drivers/dma-buf/heaps/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_DMABUF_HEAPS_DEFERRED_FREE) += deferred-free-helper.o
 obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
diff --git a/drivers/dma-buf/heaps/deferred-free-helper.c b/drivers/dma-buf/heaps/deferred-free-helper.c
new file mode 100644
index 000000000000..0ba02de9dc1c
--- /dev/null
+++ b/drivers/dma-buf/heaps/deferred-free-helper.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Deferred dmabuf freeing helper
+ *
+ * Copyright (C) 2020 Linaro, Ltd.
+ *
+ * Based on the ION page pool code
+ * Copyright (C) 2011 Google, Inc.
+ */
+
+#include <linux/freezer.h>
+#include <linux/list.h>
+#include <linux/slab.h>
+#include <linux/swap.h>
+#include <linux/sched/signal.h>
+
+#include "deferred-free-helper.h"
+
+static LIST_HEAD(free_list);
+static size_t list_size_pages;
+wait_queue_head_t freelist_waitqueue;
+struct task_struct *freelist_task;
+static DEFINE_SPINLOCK(free_list_lock);
+
+void deferred_free(struct deferred_freelist_item *item,
+		   void (*free)(struct deferred_freelist_item*,
+				enum df_reason),
+		   size_t size)
+{
+	unsigned long flags;
+
+	INIT_LIST_HEAD(&item->list);
+	item->size = size;
+	item->free = free;
+
+	spin_lock_irqsave(&free_list_lock, flags);
+	list_add(&item->list, &free_list);
+	list_size_pages += size >> PAGE_SHIFT;
+	spin_unlock_irqrestore(&free_list_lock, flags);
+	wake_up(&freelist_waitqueue);
+}
+EXPORT_SYMBOL_GPL(deferred_free);
+
+static size_t free_one_item(enum df_reason reason)
+{
+	unsigned long flags;
+	size_t size = 0;
+	struct deferred_freelist_item *item;
+
+	spin_lock_irqsave(&free_list_lock, flags);
+	if (list_empty(&free_list)) {
+		spin_unlock_irqrestore(&free_list_lock, flags);
+		return 0;
+	}
+	item = list_first_entry(&free_list, struct deferred_freelist_item, list);
+	list_del(&item->list);
+	size = item->size;
+	list_size_pages -= size >> PAGE_SHIFT;
+	spin_unlock_irqrestore(&free_list_lock, flags);
+
+	item->free(item, reason);
+	return size >> PAGE_SHIFT;
+}
+
+static unsigned long get_freelist_size_pages(void)
+{
+	unsigned long size;
+	unsigned long flags;
+
+	spin_lock_irqsave(&free_list_lock, flags);
+	size = list_size_pages;
+	spin_unlock_irqrestore(&free_list_lock, flags);
+	return size;
+}
+
+static unsigned long freelist_shrink_count(struct shrinker *shrinker,
+					   struct shrink_control *sc)
+{
+	return get_freelist_size_pages();
+}
+
+static unsigned long freelist_shrink_scan(struct shrinker *shrinker,
+					  struct shrink_control *sc)
+{
+	unsigned long total_freed = 0;
+
+	if (sc->nr_to_scan == 0)
+		return 0;
+
+	while (total_freed < sc->nr_to_scan) {
+		size_t pages_freed = free_one_item(DF_UNDER_PRESSURE);
+
+		if (!pages_freed)
+			break;
+
+		total_freed += pages_freed;
+	}
+
+	return total_freed;
+}
+
+static struct shrinker freelist_shrinker = {
+	.count_objects = freelist_shrink_count,
+	.scan_objects = freelist_shrink_scan,
+	.seeks = DEFAULT_SEEKS,
+	.batch = 0,
+};
+
+static int deferred_free_thread(void *data)
+{
+	while (true) {
+		wait_event_freezable(freelist_waitqueue,
+				     get_freelist_size_pages() > 0);
+
+		free_one_item(DF_NORMAL);
+	}
+
+	return 0;
+}
+
+static int deferred_freelist_init(void)
+{
+	list_size_pages = 0;
+
+	init_waitqueue_head(&freelist_waitqueue);
+	freelist_task = kthread_run(deferred_free_thread, NULL,
+				    "%s", "dmabuf-deferred-free-worker");
+	if (IS_ERR(freelist_task)) {
+		pr_err("Creating thread for deferred free failed\n");
+		return -1;
+	}
+	sched_set_normal(freelist_task, 19);
+
+	return register_shrinker(&freelist_shrinker);
+}
+module_init(deferred_freelist_init);
+MODULE_LICENSE("GPL v2");
+
diff --git a/drivers/dma-buf/heaps/deferred-free-helper.h b/drivers/dma-buf/heaps/deferred-free-helper.h
new file mode 100644
index 000000000000..18b44ac86ef6
--- /dev/null
+++ b/drivers/dma-buf/heaps/deferred-free-helper.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef DEFERRED_FREE_HELPER_H
+#define DEFERRED_FREE_HELPER_H
+
+/**
+ * df_reason - enum for reason why item was freed
+ *
+ * This provides a reason for why the free function was called
+ * on the item. This is useful when deferred_free is used in
+ * combination with a pagepool, so under pressure the page can
+ * be immediately freed.
+ *
+ * DF_NORMAL:         Normal deferred free
+ *
+ * DF_UNDER_PRESSURE: Free was called because the system
+ *                    is under memory pressure. Usually
+ *                    from a shrinker. Avoid allocating
+ *                    memory in the free call, as it may
+ *                    fail.
+ */
+enum df_reason {
+	DF_NORMAL,
+	DF_UNDER_PRESSURE,
+};
+
+/**
+ * deferred_freelist_item - item structure for deferred freelist
+ *
+ * This is to be added to the structure for whatever you want to
+ * defer freeing on.
+ *
+ * @size: size of the item to be freed
+ * @free: function pointer to be called when freeing the item
+ * @list: list entry for the deferred list
+ */
+struct deferred_freelist_item {
+	size_t size;
+	void (*free)(struct deferred_freelist_item *i,
+		     enum df_reason reason);
+	struct list_head list;
+};
+
+/**
+ * deferred_free - call to add item to the deferred free list
+ *
+ * @item: Pointer to deferred_freelist_item field of a structure
+ * @free: Function pointer to the free call
+ * @size: Size of the item to be freed
+ */
+void deferred_free(struct deferred_freelist_item *item,
+		   void (*free)(struct deferred_freelist_item *i,
+				enum df_reason reason),
+		   size_t size);
+#endif
-- 
2.25.1

