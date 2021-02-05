Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58138310657
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 09:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbhBEIKw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 03:10:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231642AbhBEIHy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 03:07:54 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A14DC0617AB
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 00:06:35 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id j12so3804929pfj.12
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 00:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yMZdJ0QWB5DNKnFHigbppJEmTH0pjOtMvlOhSROm3JY=;
        b=nfLDuNHQ7ZcZflve1/8UmLWBj8jyZiNGQlPhmo+1M1jX2NTBI5msB5R/I8HxVPvfEI
         WKRNzypQ5JSVIarCR0s4fQN/IatdOed8ouHCkOv5gnJM7RYP9W8B47g7dv5V4KZg+kWu
         rvjx1QjHKBK6rKaqoDNT0MIqxOA2I2egeRQ6X1Um7QegAUGtC599EjWM8q2plzF+nc0X
         gIs1aKuT1Oov7b+3Gs5c+egn5SRmRYjkoygmqGB0FQf6MWRb1piXXBO1+X8LuBjehmw/
         fJY7hqdHEsT4ATXu44P8446oCj5ppp3yvb4LVoLe/6MU3tjtB6oe6XCYkUA7kD91vnMl
         dsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yMZdJ0QWB5DNKnFHigbppJEmTH0pjOtMvlOhSROm3JY=;
        b=MfrHDHGVLeODIB446oiWk43VZKD3DScd0pzYm60qOmV7nk2HEkA8vGewnnG8coCLt/
         NnhedjGwrYyC/x+BLq6l9qlyGtRb/WEPiyckiSzx9BtsN02f+ANvzBLohjCXrZ7JQsR+
         zZf4QAZAi5s8Q5WKnwckOCcR3nn8WG4zBET1RByCZKgWxYs1GeFaFeZHnFlWMpUXccBd
         1DK6L6Gv2mzI8fWeCWDJg/eh5mxK4EJzN+ifAuAFCKjEsIybUE04o8MWh8alO4FO6MFq
         lgQQq0lTbagIUfbA6tIsW+8JorVslEOCtt+wSQ5BRoMPp0CTtg/Qhk0sjzEmTKbXnhj8
         uv1A==
X-Gm-Message-State: AOAM532GmuaYvHuimM0KjmQ6sao+rnuaCS9Cubo14uzhQb7dXrRIwPFg
        lBlb1HfVp9KPc8+2u368cKMLTw==
X-Google-Smtp-Source: ABdhPJy1ZrVvZuAN8XXMihWVOe0E6t1BYjetV+cMvLtvHpEEF+0vQTnbj3TeYmWqXnNUyDsbUz3aMg==
X-Received: by 2002:a62:7b90:0:b029:1be:9e89:1db5 with SMTP id w138-20020a627b900000b02901be9e891db5mr3367319pfc.35.1612512395009;
        Fri, 05 Feb 2021 00:06:35 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id 32sm9520070pgq.80.2021.02.05.00.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 00:06:34 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Christian Koenig <christian.koenig@amd.com>,
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
Subject: [RFC][PATCH v6 5/7] dma-buf: heaps: Add deferred-free-helper library code
Date:   Fri,  5 Feb 2021 08:06:19 +0000
Message-Id: <20210205080621.3102035-6-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205080621.3102035-1-john.stultz@linaro.org>
References: <20210205080621.3102035-1-john.stultz@linaro.org>
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
Cc: Christian Koenig <christian.koenig@amd.com>
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
v5:
* Fix up page count tracking as suggested by Suren Baghdasaryan
---
 drivers/dma-buf/heaps/Kconfig                |   3 +
 drivers/dma-buf/heaps/Makefile               |   1 +
 drivers/dma-buf/heaps/deferred-free-helper.c | 145 +++++++++++++++++++
 drivers/dma-buf/heaps/deferred-free-helper.h |  55 +++++++
 4 files changed, 204 insertions(+)
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
index 000000000000..672c3d5872e9
--- /dev/null
+++ b/drivers/dma-buf/heaps/deferred-free-helper.c
@@ -0,0 +1,145 @@
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
+static inline size_t size_to_pages(size_t size)
+{
+	if (!size)
+		return 0;
+	return ((size - 1) >> PAGE_SHIFT) + 1;
+}
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
+	list_size_pages += size_to_pages(size);
+	spin_unlock_irqrestore(&free_list_lock, flags);
+	wake_up(&freelist_waitqueue);
+}
+EXPORT_SYMBOL_GPL(deferred_free);
+
+static size_t free_one_item(enum df_reason reason)
+{
+	unsigned long flags;
+	size_t nr_pages;
+	struct deferred_freelist_item *item;
+
+	spin_lock_irqsave(&free_list_lock, flags);
+	if (list_empty(&free_list)) {
+		spin_unlock_irqrestore(&free_list_lock, flags);
+		return 0;
+	}
+	item = list_first_entry(&free_list, struct deferred_freelist_item, list);
+	list_del(&item->list);
+	nr_pages = size_to_pages(item->size);
+	list_size_pages -= nr_pages;
+	spin_unlock_irqrestore(&free_list_lock, flags);
+
+	item->free(item, reason);
+	return nr_pages;
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

