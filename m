Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B777D31065F
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 09:12:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231591AbhBEIMZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 03:12:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231576AbhBEIHH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 03:07:07 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B44B7C06178B
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 00:06:27 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id f63so3799059pfa.13
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 00:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vyfEY4onehbYsafXLmYmoPdU8uLUNcWKOMLwNwKoKkY=;
        b=kfBKmBc2V0gCtxWa0NO7oYwzFwIGrntrUmxp3VWtIk9vVbZiIidKiPuJA8fq913qm6
         y/TLIbZegnoQtgZWXnoY0F50XKk+gmOZBOwtXXODAsfVg6j2csvgf5rnxg3kvcEij+Ww
         iA5FM3Ee09ZD6RBVdpGH/37PXPYY7mc9loOttqO8p5Kpw0YabwufzJtMCqY7VcFk+oAq
         YvAiZsgXhttv4oltgliHjQ1eb+C68HNj8UhmQEkTcS00U71i/PuTJSsaCPgh+0YnQ3Ya
         Y10M/IVlNiVkfY9tmMF4EnfFLAG+Ffi0ChQ48uNWk5lSk1S2yOklIIh9QB1yixCp6BMu
         8Evg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vyfEY4onehbYsafXLmYmoPdU8uLUNcWKOMLwNwKoKkY=;
        b=WJUnWDm26lmDmzPFPnb6QYe4oXSabpOg3rlq+Ac9IkjdbDWle8KciFO655BSm/Muhk
         Sn/wSszA1hRBSqzqEOJWuq/V8a8J1sTr3e0iVjDuZ8MvFnwjeHBWCTXAjaaIkav7wHP6
         2qG9n+KCtCIM1Y1KVA2ejGoKj4PTf8rQhcR653H0yW8cg23ATJeeQiydd04WIOcqmbGA
         EumiTcAV/p0UaLG2SqN6lCuPiCoJtpHSwSorbrQBM2Zq+/3+dOJdh/96UbzzkNx1yeWf
         TCRz2CEj0BBNSpunV2XliCqPw1gaJFwTYJMLP0LdyLJHF/dLIQpffHTXTCP7XqD39ciT
         Wc7w==
X-Gm-Message-State: AOAM530jFFyE5J/olOmYRf9NG6I6f3rhlIEooq7hNgOfnlSiqrkEFoHV
        fS1cPC90+5QmlInaXhpWpfRVTg==
X-Google-Smtp-Source: ABdhPJxFjQUH9qw9ZOiSQdFgimdjCJe9nf79dM7toVaJnYzL9q5QJkTgttrX+W6LBLzy/l57Ue2JIA==
X-Received: by 2002:a63:f19:: with SMTP id e25mr3205563pgl.220.1612512387276;
        Fri, 05 Feb 2021 00:06:27 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id 32sm9520070pgq.80.2021.02.05.00.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 00:06:26 -0800 (PST)
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
Subject: [RFC][PATCH v6 1/7] drm: Add a sharable drm page-pool implementation
Date:   Fri,  5 Feb 2021 08:06:15 +0000
Message-Id: <20210205080621.3102035-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205080621.3102035-1-john.stultz@linaro.org>
References: <20210205080621.3102035-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds a shrinker controlled page pool, closely
following the ttm_pool logic, which is abstracted out
a bit so it can be used by other non-ttm drivers.

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
 drivers/gpu/drm/Kconfig     |   4 +
 drivers/gpu/drm/Makefile    |   1 +
 drivers/gpu/drm/page_pool.c | 220 ++++++++++++++++++++++++++++++++++++
 include/drm/page_pool.h     |  54 +++++++++
 4 files changed, 279 insertions(+)
 create mode 100644 drivers/gpu/drm/page_pool.c
 create mode 100644 include/drm/page_pool.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 0973f408d75f..d16bf340ed2e 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -174,6 +174,10 @@ config DRM_DP_CEC
 	  Note: not all adapters support this feature, and even for those
 	  that do support this they often do not hook up the CEC pin.
 
+config DRM_PAGE_POOL
+	bool
+	depends on DRM
+
 config DRM_TTM
 	tristate
 	depends on DRM && MMU
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index fefaff4c832d..877e0111ed34 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -32,6 +32,7 @@ drm-$(CONFIG_AGP) += drm_agpsupport.o
 drm-$(CONFIG_PCI) += drm_pci.o
 drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
 drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
+drm-$(CONFIG_DRM_PAGE_POOL) += page_pool.o
 
 drm_vram_helper-y := drm_gem_vram_helper.o
 obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
diff --git a/drivers/gpu/drm/page_pool.c b/drivers/gpu/drm/page_pool.c
new file mode 100644
index 000000000000..2139f86e6ca7
--- /dev/null
+++ b/drivers/gpu/drm/page_pool.c
@@ -0,0 +1,220 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DRM page pool system
+ *
+ * Copyright (C) 2020 Linaro Ltd.
+ *
+ * Based on the ION page pool code
+ * Copyright (C) 2011 Google, Inc.
+ * As well as the ttm_pool code
+ * Copyright (C) 2020 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/freezer.h>
+#include <linux/list.h>
+#include <linux/slab.h>
+#include <linux/swap.h>
+#include <linux/sched/signal.h>
+#include <drm/page_pool.h>
+
+static LIST_HEAD(pool_list);
+static DEFINE_MUTEX(pool_list_lock);
+static atomic_long_t total_pages;
+static unsigned long page_pool_max;
+MODULE_PARM_DESC(page_pool_max, "Number of pages in the WC/UC/DMA pool");
+module_param(page_pool_max, ulong, 0644);
+
+void drm_page_pool_set_max(unsigned long max)
+{
+	/* only write once */
+	if (!page_pool_max)
+		page_pool_max = max;
+}
+
+unsigned long drm_page_pool_get_max(void)
+{
+	return page_pool_max;
+}
+
+unsigned long drm_page_pool_get_total(void)
+{
+	return atomic_long_read(&total_pages);
+}
+
+int drm_page_pool_get_size(struct drm_page_pool *pool)
+{
+	int ret;
+
+	spin_lock(&pool->lock);
+	ret = pool->count;
+	spin_unlock(&pool->lock);
+	return ret;
+}
+
+static inline unsigned int drm_page_pool_free_pages(struct drm_page_pool *pool,
+						    struct page *page)
+{
+	return pool->free(page, pool->order);
+}
+
+static int drm_page_pool_shrink_one(void);
+
+void drm_page_pool_add(struct drm_page_pool *pool, struct page *page)
+{
+	spin_lock(&pool->lock);
+	list_add_tail(&page->lru, &pool->items);
+	pool->count++;
+	atomic_long_add(1 << pool->order, &total_pages);
+	spin_unlock(&pool->lock);
+
+	mod_node_page_state(page_pgdat(page), NR_KERNEL_MISC_RECLAIMABLE,
+			    1 << pool->order);
+
+	/* make sure we don't grow too large */
+	while (page_pool_max && atomic_long_read(&total_pages) > page_pool_max)
+		drm_page_pool_shrink_one();
+}
+EXPORT_SYMBOL_GPL(drm_page_pool_add);
+
+static struct page *drm_page_pool_remove(struct drm_page_pool *pool)
+{
+	struct page *page;
+
+	if (!pool->count)
+		return NULL;
+
+	page = list_first_entry(&pool->items, struct page, lru);
+	pool->count--;
+	atomic_long_sub(1 << pool->order, &total_pages);
+
+	list_del(&page->lru);
+	mod_node_page_state(page_pgdat(page), NR_KERNEL_MISC_RECLAIMABLE,
+			    -(1 << pool->order));
+	return page;
+}
+
+struct page *drm_page_pool_fetch(struct drm_page_pool *pool)
+{
+	struct page *page = NULL;
+
+	if (!pool) {
+		WARN_ON(!pool);
+		return NULL;
+	}
+
+	spin_lock(&pool->lock);
+	page = drm_page_pool_remove(pool);
+	spin_unlock(&pool->lock);
+
+	return page;
+}
+EXPORT_SYMBOL_GPL(drm_page_pool_fetch);
+
+struct drm_page_pool *drm_page_pool_create(unsigned int order,
+					   int (*free_page)(struct page *p, unsigned int order))
+{
+	struct drm_page_pool *pool = kmalloc(sizeof(*pool), GFP_KERNEL);
+
+	if (!pool)
+		return NULL;
+
+	pool->count = 0;
+	INIT_LIST_HEAD(&pool->items);
+	pool->order = order;
+	pool->free = free_page;
+	spin_lock_init(&pool->lock);
+	INIT_LIST_HEAD(&pool->list);
+
+	mutex_lock(&pool_list_lock);
+	list_add(&pool->list, &pool_list);
+	mutex_unlock(&pool_list_lock);
+
+	return pool;
+}
+EXPORT_SYMBOL_GPL(drm_page_pool_create);
+
+void drm_page_pool_destroy(struct drm_page_pool *pool)
+{
+	struct page *page;
+
+	/* Remove us from the pool list */
+	mutex_lock(&pool_list_lock);
+	list_del(&pool->list);
+	mutex_unlock(&pool_list_lock);
+
+	/* Free any remaining pages in the pool */
+	spin_lock(&pool->lock);
+	while (pool->count) {
+		page = drm_page_pool_remove(pool);
+		spin_unlock(&pool->lock);
+		drm_page_pool_free_pages(pool, page);
+		spin_lock(&pool->lock);
+	}
+	spin_unlock(&pool->lock);
+
+	kfree(pool);
+}
+EXPORT_SYMBOL_GPL(drm_page_pool_destroy);
+
+static int drm_page_pool_shrink_one(void)
+{
+	struct drm_page_pool *pool;
+	struct page *page;
+	int nr_freed = 0;
+
+	mutex_lock(&pool_list_lock);
+	pool = list_first_entry(&pool_list, typeof(*pool), list);
+
+	spin_lock(&pool->lock);
+	page = drm_page_pool_remove(pool);
+	spin_unlock(&pool->lock);
+
+	if (page)
+		nr_freed = drm_page_pool_free_pages(pool, page);
+
+	list_move_tail(&pool->list, &pool_list);
+	mutex_unlock(&pool_list_lock);
+
+	return nr_freed;
+}
+
+static unsigned long drm_page_pool_shrink_count(struct shrinker *shrinker,
+						struct shrink_control *sc)
+{
+	unsigned long count =  atomic_long_read(&total_pages);
+
+	return count ? count : SHRINK_EMPTY;
+}
+
+static unsigned long drm_page_pool_shrink_scan(struct shrinker *shrinker,
+					       struct shrink_control *sc)
+{
+	int to_scan = sc->nr_to_scan;
+	int nr_total = 0;
+
+	if (to_scan == 0)
+		return 0;
+
+	do {
+		int nr_freed = drm_page_pool_shrink_one();
+
+		to_scan -= nr_freed;
+		nr_total += nr_freed;
+	} while (to_scan >= 0 && atomic_long_read(&total_pages));
+
+	return nr_total;
+}
+
+static struct shrinker pool_shrinker = {
+	.count_objects = drm_page_pool_shrink_count,
+	.scan_objects = drm_page_pool_shrink_scan,
+	.seeks = 1,
+	.batch = 0,
+};
+
+int drm_page_pool_init_shrinker(void)
+{
+	return register_shrinker(&pool_shrinker);
+}
+module_init(drm_page_pool_init_shrinker);
+MODULE_LICENSE("GPL v2");
diff --git a/include/drm/page_pool.h b/include/drm/page_pool.h
new file mode 100644
index 000000000000..47e240b2bc69
--- /dev/null
+++ b/include/drm/page_pool.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: Christian König
+ */
+
+#ifndef _DRM_PAGE_POOL_H_
+#define _DRM_PAGE_POOL_H_
+
+#include <linux/mmzone.h>
+#include <linux/llist.h>
+#include <linux/spinlock.h>
+
+struct drm_page_pool {
+	int count;
+	struct list_head items;
+
+	int order;
+	int (*free)(struct page *p, unsigned int order);
+
+	spinlock_t lock;
+	struct list_head list;
+};
+
+void drm_page_pool_set_max(unsigned long max);
+unsigned long drm_page_pool_get_max(void);
+unsigned long drm_page_pool_get_total(void);
+int drm_page_pool_get_size(struct drm_page_pool *pool);
+struct page *drm_page_pool_fetch(struct drm_page_pool *pool);
+void drm_page_pool_add(struct drm_page_pool *pool, struct page *page);
+struct drm_page_pool *drm_page_pool_create(unsigned int order,
+					   int (*free_page)(struct page *p, unsigned int order));
+void drm_page_pool_destroy(struct drm_page_pool *pool);
+
+#endif
-- 
2.25.1

