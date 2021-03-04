Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3FC32DDBF
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 00:20:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232979AbhCDXUR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 18:20:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233000AbhCDXUQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 18:20:16 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D458C061574
        for <linux-media@vger.kernel.org>; Thu,  4 Mar 2021 15:20:16 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id fu20so378642pjb.2
        for <linux-media@vger.kernel.org>; Thu, 04 Mar 2021 15:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fqm2n/WLZ4eT9r+Omo3xPTCh/D9fjyEDFpTAnWdfMxc=;
        b=F2XR2R9XnG6Pl2ygAmc7iKRvSRVWJp1v3xUfsM+HsXSJJnvSvA5KzoLoUBj+OcGM74
         lvNhdnut/cgMAmLI6drQIqgMB0mwCmNAQpKRepM+Dg/i13va+NkjlGilhzigUw4SH5Z5
         HgCwZxMi3+A7OOHOQvkNxxgIwZnHZBgFXgzqmFIp47vE8gW5tRHP6XObrk/LXZrwtO5t
         1jrbCcShLjWUcXdU+6wN+HJt64p7TjmGmO0BeZ8cKvEvtwePgaKCpe8oVR1dU3Ik0cQP
         WNQuDFFmNyaqsObiDmYCfOrErqmT5mP+svooLmVV4hjROFRY1fEhdkW9Xy/DrMWprhvb
         +3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fqm2n/WLZ4eT9r+Omo3xPTCh/D9fjyEDFpTAnWdfMxc=;
        b=BqgBVV0bW37NxywYh0hHd2HuT6u+0HHN3ljhkHe4jVda698JkyMl8V6Ybb1Y3Z4fs7
         nC3a/YR/5ecKiBfTjw0jJWhnUdaft+UpAdtjCL/rqTg/wosWId6VKs+Wkmv+gxynqfun
         E3et5jpHMJl2jWIzt3oAbiOiSquBqR8puvDGJaUmWafURoa4a26VngY/xusEAProZsvv
         SNyd+96+Yxxs/xY17wx2Hwi1aioEgy073SEGnfLa6SdlLsKv49xepHhHjR0vA3XdQysh
         +4yTgkxk0PFNO86mDBWaCY4haWreVqoflFvpnLrou0VQVMf4jvwBDk0PhiFalOepwz0x
         YJrA==
X-Gm-Message-State: AOAM531MTPolm7W+5qywDbgAHpYsYXScZDN0bam8AKW7SE05AJi0RWMF
        3qpZ7f1nPRusdq0LnnkzEa4pfw==
X-Google-Smtp-Source: ABdhPJxP9czYFnGyxuCxK65IM0dMb7+TMQaJSX4C16Yezzu0bg5hD2R1LO24UOGgxEkMNX80XnkdVg==
X-Received: by 2002:a17:90a:488f:: with SMTP id b15mr7010573pjh.53.1614900016079;
        Thu, 04 Mar 2021 15:20:16 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id u66sm429290pfc.72.2021.03.04.15.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 15:20:15 -0800 (PST)
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
Subject: [PATCH v8 1/5] drm: Add a sharable drm page-pool implementation
Date:   Thu,  4 Mar 2021 23:20:07 +0000
Message-Id: <20210304232011.1479036-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210304232011.1479036-1-john.stultz@linaro.org>
References: <20210304232011.1479036-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds a shrinker controlled page pool, extracted
out of the ttm_pool logic, and abstracted out a bit
so it can be used by other non-ttm drivers.

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
v8:
* Completely rewritten from scratch, using only the
  ttm_pool logic so it can be dual licensed.
---
 drivers/gpu/drm/Kconfig     |   4 +
 drivers/gpu/drm/Makefile    |   2 +
 drivers/gpu/drm/page_pool.c | 214 ++++++++++++++++++++++++++++++++++++
 include/drm/page_pool.h     |  65 +++++++++++
 4 files changed, 285 insertions(+)
 create mode 100644 drivers/gpu/drm/page_pool.c
 create mode 100644 include/drm/page_pool.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index e392a90ca687..7cbcecb8f7df 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -177,6 +177,10 @@ config DRM_DP_CEC
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
index 926adef289db..2dc7b2fe3fe5 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -39,6 +39,8 @@ obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
 drm_ttm_helper-y := drm_gem_ttm_helper.o
 obj-$(CONFIG_DRM_TTM_HELPER) += drm_ttm_helper.o
 
+drm-$(CONFIG_DRM_PAGE_POOL) += page_pool.o
+
 drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o drm_dp_helper.o \
 		drm_dsc.o drm_probe_helper.o \
 		drm_plane_helper.o drm_dp_mst_topology.o drm_atomic_helper.o \
diff --git a/drivers/gpu/drm/page_pool.c b/drivers/gpu/drm/page_pool.c
new file mode 100644
index 000000000000..a60b954cfe0f
--- /dev/null
+++ b/drivers/gpu/drm/page_pool.c
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Sharable page pool implementation
+ *
+ * Extracted from drivers/gpu/drm/ttm/ttm_pool.c
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ * Copyright 2021 Linaro Ltd.
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
+ * Authors: Christian König, John Stultz
+ */
+
+#include <linux/module.h>
+#include <linux/highmem.h>
+#include <linux/shrinker.h>
+#include <drm/page_pool.h>
+
+static unsigned long page_pool_size;
+
+MODULE_PARM_DESC(page_pool_size, "Number of pages in the WC/UC/DMA pool");
+module_param(page_pool_size, ulong, 0644);
+
+static atomic_long_t allocated_pages;
+
+static struct mutex shrinker_lock;
+static struct list_head shrinker_list;
+static struct shrinker mm_shrinker;
+
+void drm_page_pool_set_max(unsigned long max)
+{
+	if (!page_pool_size)
+		page_pool_size = max;
+}
+
+unsigned long drm_page_pool_get_max(void)
+{
+	return page_pool_size;
+}
+
+unsigned long drm_page_pool_get_total(void)
+{
+	return atomic_long_read(&allocated_pages);
+}
+
+unsigned long drm_page_pool_get_size(struct drm_page_pool *pool)
+{
+	unsigned long size;
+
+	spin_lock(&pool->lock);
+	size = pool->page_count;
+	spin_unlock(&pool->lock);
+	return size;
+}
+
+/* Give pages into a specific pool */
+void drm_page_pool_add(struct drm_page_pool *pool, struct page *p)
+{
+	unsigned int i, num_pages = 1 << pool->order;
+
+	for (i = 0; i < num_pages; ++i) {
+		if (PageHighMem(p))
+			clear_highpage(p + i);
+		else
+			clear_page(page_address(p + i));
+	}
+
+	spin_lock(&pool->lock);
+	list_add(&p->lru, &pool->pages);
+	pool->page_count += 1 << pool->order;
+	spin_unlock(&pool->lock);
+	atomic_long_add(1 << pool->order, &allocated_pages);
+}
+
+/* Take pages from a specific pool, return NULL when nothing available */
+struct page *drm_page_pool_remove(struct drm_page_pool *pool)
+{
+	struct page *p;
+
+	spin_lock(&pool->lock);
+	p = list_first_entry_or_null(&pool->pages, typeof(*p), lru);
+	if (p) {
+		atomic_long_sub(1 << pool->order, &allocated_pages);
+		pool->page_count -= 1 << pool->order;
+		list_del(&p->lru);
+	}
+	spin_unlock(&pool->lock);
+
+	return p;
+}
+
+/* Initialize and add a pool type to the global shrinker list */
+void drm_page_pool_init(struct drm_page_pool *pool, unsigned int order,
+			unsigned long (*free_page)(struct drm_page_pool *pool, struct page *p))
+{
+	pool->order = order;
+	spin_lock_init(&pool->lock);
+	INIT_LIST_HEAD(&pool->pages);
+	pool->free = free_page;
+	pool->page_count = 0;
+
+	mutex_lock(&shrinker_lock);
+	list_add_tail(&pool->shrinker_list, &shrinker_list);
+	mutex_unlock(&shrinker_lock);
+}
+
+/* Remove a pool_type from the global shrinker list and free all pages */
+void drm_page_pool_fini(struct drm_page_pool *pool)
+{
+	struct page *p, *tmp;
+
+	mutex_lock(&shrinker_lock);
+	list_del(&pool->shrinker_list);
+	mutex_unlock(&shrinker_lock);
+
+	list_for_each_entry_safe(p, tmp, &pool->pages, lru)
+		pool->free(pool, p);
+}
+
+/* Free pages using the global shrinker list */
+static unsigned int drm_page_pool_shrink(void)
+{
+	struct drm_page_pool *pool;
+	unsigned int num_freed;
+	struct page *p;
+
+	mutex_lock(&shrinker_lock);
+	pool = list_first_entry(&shrinker_list, typeof(*pool), shrinker_list);
+
+	p = drm_page_pool_remove(pool);
+
+	list_move_tail(&pool->shrinker_list, &shrinker_list);
+	mutex_unlock(&shrinker_lock);
+
+	if (p) {
+		pool->free(pool, p);
+		num_freed = 1 << pool->order;
+	} else {
+		num_freed = 0;
+	}
+
+	return num_freed;
+}
+
+/* As long as pages are available make sure to release at least one */
+static unsigned long drm_page_pool_shrinker_scan(struct shrinker *shrink,
+						 struct shrink_control *sc)
+{
+	unsigned long num_freed = 0;
+
+	do
+		num_freed += drm_page_pool_shrink();
+	while (!num_freed && atomic_long_read(&allocated_pages));
+
+	return num_freed;
+}
+
+/* Return the number of pages available or SHRINK_EMPTY if we have none */
+static unsigned long drm_page_pool_shrinker_count(struct shrinker *shrink,
+						  struct shrink_control *sc)
+{
+	unsigned long num_pages = atomic_long_read(&allocated_pages);
+
+	return num_pages ? num_pages : SHRINK_EMPTY;
+}
+
+/**
+ * drm_page_pool_shrinker_setup - Initialize globals
+ *
+ * @num_pages: default number of pages
+ *
+ * Initialize the global locks and lists for the shrinker.
+ */
+int drm_page_pool_shrinker_setup(void)
+{
+	mutex_init(&shrinker_lock);
+	INIT_LIST_HEAD(&shrinker_list);
+
+	mm_shrinker.count_objects = drm_page_pool_shrinker_count;
+	mm_shrinker.scan_objects = drm_page_pool_shrinker_scan;
+	mm_shrinker.seeks = 1;
+	return register_shrinker(&mm_shrinker);
+}
+
+/**
+ * drm_page_pool_shrinker_teardown - Finalize globals
+ *
+ * Unregister the shrinker.
+ */
+void drm_page_pool_shrinker_teardown(void)
+{
+	unregister_shrinker(&mm_shrinker);
+	WARN_ON(!list_empty(&shrinker_list));
+}
+
+module_init(drm_page_pool_shrinker_setup);
+module_exit(drm_page_pool_shrinker_teardown);
+MODULE_LICENSE("Dual MIT/GPL");
diff --git a/include/drm/page_pool.h b/include/drm/page_pool.h
new file mode 100644
index 000000000000..d8b8a8415629
--- /dev/null
+++ b/include/drm/page_pool.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Extracted from include/drm/ttm/ttm_pool.h
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ * Copyright 2021 Linaro Ltd
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
+ * Authors: Christian König, John Stultz
+ */
+
+#ifndef _DRM_PAGE_POOL_H_
+#define _DRM_PAGE_POOL_H_
+
+#include <linux/mmzone.h>
+#include <linux/llist.h>
+#include <linux/spinlock.h>
+
+/**
+ * drm_page_pool - Page Pool for a certain memory type
+ *
+ * @order: the allocation order our pages have
+ * @pages: the list of pages in the pool
+ * @shrinker_list: our place on the global shrinker list
+ * @lock: protection of the page list
+ * @page_count: number of pages currently in the pool
+ * @free: Function pointer to free the page
+ */
+struct drm_page_pool {
+	unsigned int order;
+	struct list_head pages;
+	struct list_head shrinker_list;
+	spinlock_t lock;
+
+	unsigned long page_count;
+	unsigned long (*free)(struct drm_page_pool *pool, struct page *p);
+};
+
+void drm_page_pool_set_max(unsigned long max);
+unsigned long drm_page_pool_get_max(void);
+unsigned long drm_page_pool_get_total(void);
+unsigned long drm_page_pool_get_size(struct drm_page_pool *pool);
+void drm_page_pool_add(struct drm_page_pool *pool, struct page *p);
+struct page *drm_page_pool_remove(struct drm_page_pool *pool);
+void drm_page_pool_init(struct drm_page_pool *pool, unsigned int order,
+			unsigned long (*free_page)(struct drm_page_pool *pool, struct page *p));
+void drm_page_pool_fini(struct drm_page_pool *pool);
+
+#endif
-- 
2.25.1

