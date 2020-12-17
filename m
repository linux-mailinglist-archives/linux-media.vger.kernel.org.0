Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 826C22DDBC1
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 00:08:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731489AbgLQXG6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 18:06:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729402AbgLQXG6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 18:06:58 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F044C061794
        for <linux-media@vger.kernel.org>; Thu, 17 Dec 2020 15:06:18 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id n16so142820pgm.0
        for <linux-media@vger.kernel.org>; Thu, 17 Dec 2020 15:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HLdfcjdPBfqUHXsLl2/ctpr8oIlwE7TAUWyEcwHrLdo=;
        b=I/k40Wchhcm6MZuqEHbwdbTHc/ZYCFhdu3W1pzS+58BhviIvTCTacXeuwFNTqHBCD2
         uGrSudanYZYtLKhIKSHVOICqH5rzlWjRg44ftUkEShN1QCpGkKMWyeu+Foo4dYGCDRwq
         9zqnN7tYT6PBgf6iNWmpuzmgSdOYJcWsvhO7GMcyJloFyUVwW1TBMsVrrI5KbjNC5UFP
         ELNhywtVge3Fy6aEdovPNCbO0rTHf8gOm4fRcS6PY8Oj/Atyfj0Gy5ywwpgVJCGlv3rj
         IdXYkuqc+j2+3UDIc+OiaTjS6yi4cmMJ0rtAtogWyXYPy7BAKEK7L2HizyC1MUiZlfGK
         mxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HLdfcjdPBfqUHXsLl2/ctpr8oIlwE7TAUWyEcwHrLdo=;
        b=OuCRKL0vRqM/mjm17ju6GYffHlEklMk5QEL3yiEk38RwNiWFQ3oA+DJ0drBTik8AYw
         RBRLpa3mhIqiHSW9vsH2gV/9kp4qUdsxnS5/jXa7osuOTASokPq8462uUNFQuofBL2Fj
         GDAiGHPV6fUq/iFupLAEqjGCXKmYVYP+jos3lNZg05Sq+eGJZmg5elgx+0E1gd+NCmlx
         4NXdA11RsMxDC+Z0Z2sHB8zn/YOV/p2MQS46206owEx3B2KVt6KJZSF4hzULLkKJU6PB
         BZJguXCVCDnwkT+sI8h6HoqEbE5jLfe6sDf5+Q8i0xB1k8uP1XgCZ+moAD4HZoc0eudY
         tLoA==
X-Gm-Message-State: AOAM533kZlEYiBGe6p+g6S+bY7/4xHdDpHz4bN3O6Xkns+LS/PqXz7pN
        1UIGDhlzOxSt9pPWoN6v+FyZZA==
X-Google-Smtp-Source: ABdhPJxlOSq8edo4ebrfmzOkKDhWUI4iNXReB/PECcycuNq3WkAnJfowi52bwLCAHeWjpe+6PDYaZQ==
X-Received: by 2002:a63:7407:: with SMTP id p7mr1500682pgc.48.1608246377608;
        Thu, 17 Dec 2020 15:06:17 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id q9sm7074036pgb.82.2020.12.17.15.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 15:06:16 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
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
Subject: [RFC][PATCH 1/3] dma-buf: heaps: Add deferred-free-helper library code
Date:   Thu, 17 Dec 2020 23:06:10 +0000
Message-Id: <20201217230612.32397-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
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
 drivers/dma-buf/heaps/Kconfig                |   3 +
 drivers/dma-buf/heaps/Makefile               |   1 +
 drivers/dma-buf/heaps/deferred-free-helper.c | 136 +++++++++++++++++++
 drivers/dma-buf/heaps/deferred-free-helper.h |  15 ++
 4 files changed, 155 insertions(+)
 create mode 100644 drivers/dma-buf/heaps/deferred-free-helper.c
 create mode 100644 drivers/dma-buf/heaps/deferred-free-helper.h

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c4226..ecf65204f714 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -1,3 +1,6 @@
+config DMABUF_HEAPS_DEFERRED_FREE
+	bool
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
index 000000000000..b8f54860454f
--- /dev/null
+++ b/drivers/dma-buf/heaps/deferred-free-helper.c
@@ -0,0 +1,136 @@
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
+static size_t list_size;
+wait_queue_head_t freelist_waitqueue;
+struct task_struct *freelist_task;
+static DEFINE_MUTEX(free_list_lock);
+
+enum {
+	USE_POOL = 0,
+	SKIP_POOL = 1,
+};
+
+void deferred_free(struct deferred_freelist_item *item,
+		   void (*free)(struct deferred_freelist_item*, bool),
+		   size_t size)
+{
+	INIT_LIST_HEAD(&item->list);
+	item->size = size;
+	item->free = free;
+
+	mutex_lock(&free_list_lock);
+	list_add(&item->list, &free_list);
+	list_size += size;
+	mutex_unlock(&free_list_lock);
+	wake_up(&freelist_waitqueue);
+}
+
+static size_t free_one_item(bool nopool)
+{
+	size_t size = 0;
+	struct deferred_freelist_item *item;
+
+	mutex_lock(&free_list_lock);
+	if (list_empty(&free_list)) {
+		mutex_unlock(&free_list_lock);
+		return 0;
+	}
+	item = list_first_entry(&free_list, struct deferred_freelist_item, list);
+	list_del(&item->list);
+	size = item->size;
+	list_size -= size;
+	mutex_unlock(&free_list_lock);
+
+	item->free(item, nopool);
+	return size;
+}
+
+static unsigned long get_freelist_size(void)
+{
+	unsigned long size;
+
+	mutex_lock(&free_list_lock);
+	size = list_size;
+	mutex_unlock(&free_list_lock);
+	return size;
+}
+
+static unsigned long freelist_shrink_count(struct shrinker *shrinker,
+					   struct shrink_control *sc)
+{
+	return get_freelist_size();
+}
+
+static unsigned long freelist_shrink_scan(struct shrinker *shrinker,
+					  struct shrink_control *sc)
+{
+	int total_freed = 0;
+
+	if (sc->nr_to_scan == 0)
+		return 0;
+
+	while (total_freed < sc->nr_to_scan) {
+		int freed = free_one_item(SKIP_POOL);
+
+		if (!freed)
+			break;
+
+		total_freed += freed;
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
+				     get_freelist_size() > 0);
+
+		free_one_item(USE_POOL);
+	}
+
+	return 0;
+}
+
+static int deferred_freelist_init(void)
+{
+	list_size = 0;
+
+	init_waitqueue_head(&freelist_waitqueue);
+	freelist_task = kthread_run(deferred_free_thread, NULL,
+				    "%s", "dmabuf-deferred-free-worker");
+	if (IS_ERR(freelist_task)) {
+		pr_err("%s: creating thread for deferred free failed\n",
+		       __func__);
+		return -1;
+	}
+	sched_set_normal(freelist_task, 19);
+
+	return register_shrinker(&freelist_shrinker);
+}
+device_initcall(deferred_freelist_init);
diff --git a/drivers/dma-buf/heaps/deferred-free-helper.h b/drivers/dma-buf/heaps/deferred-free-helper.h
new file mode 100644
index 000000000000..09a2274a897c
--- /dev/null
+++ b/drivers/dma-buf/heaps/deferred-free-helper.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef DEFERRED_FREE_HELPER_H
+#define DEFERRED_FREE_HELPER_H
+
+struct deferred_freelist_item {
+	size_t size;
+	void (*free)(struct deferred_freelist_item *i, bool no_pool);
+	struct list_head list;
+};
+
+void deferred_free(struct deferred_freelist_item *item,
+		   void (*free)(struct deferred_freelist_item *i, bool no_pool),
+		   size_t size);
+#endif
-- 
2.17.1

