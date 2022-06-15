Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D044654D2F5
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346894AbiFOUvE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346771AbiFOUvD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:51:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D439055220
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326260;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v/KHcJiSNDMwcTgPq3/h5DxHYYxIvtlvD+tscnIkafg=;
        b=ONda1cUUsBCaCTekP8IuwlhE7RiYZDTAd86kx/2KdHr83+vuiH4AYoVX1B6IVOMzzfr9EH
        n8X++kfPf+kUz8og4xaSLQPVvIKEFIlXa9O3Dps+9nsTroulUIbFok3zubbCK3LUfW8Ptv
        9OcC9npjRp5Oc+ca4hbTtDYMPZqSk7k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-dyml-3e8PTyMjIRSErIPVQ-1; Wed, 15 Jun 2022 16:50:58 -0400
X-MC-Unique: dyml-3e8PTyMjIRSErIPVQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 426F13C10228;
        Wed, 15 Jun 2022 20:50:58 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A02AF18EA9;
        Wed, 15 Jun 2022 20:50:56 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 10/40] media: atomisp: remove dynamic and reserved pool code
Date:   Wed, 15 Jun 2022 22:50:07 +0200
Message-Id: <20220615205037.16549-11-hdegoede@redhat.com>
In-Reply-To: <20220615205037.16549-1-hdegoede@redhat.com>
References: <20220615205037.16549-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are no callers of this code atm; and looking at the atomisp
memory-management code if anything we want to make it simpler and
not re-introduce use of these pools, so remove the pool code.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/Makefile        |   2 -
 .../media/atomisp/pci/hmm/hmm_dynamic_pool.c  | 234 ----------------
 .../media/atomisp/pci/hmm/hmm_reserved_pool.c | 253 ------------------
 3 files changed, 489 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/hmm/hmm_dynamic_pool.c
 delete mode 100644 drivers/staging/media/atomisp/pci/hmm/hmm_reserved_pool.c

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index 2485d7b3fee2..dd4c2c0317ae 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -45,9 +45,7 @@ atomisp-objs += \
 	pci/camera/pipe/src/pipe_util.o \
 	pci/camera/util/src/util.o \
 	pci/hmm/hmm_bo.o \
-	pci/hmm/hmm_dynamic_pool.o \
 	pci/hmm/hmm.o \
-	pci/hmm/hmm_reserved_pool.o \
 	pci/ia_css_device_access.o \
 	pci/ia_css_isp_configs.o \
 	pci/ia_css_isp_states.o \
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_dynamic_pool.c b/drivers/staging/media/atomisp/pci/hmm/hmm_dynamic_pool.c
deleted file mode 100644
index eaf97e5f3b68..000000000000
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_dynamic_pool.c
+++ /dev/null
@@ -1,234 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Support for Medifield PNW Camera Imaging ISP subsystem.
- *
- * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
- *
- * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
- */
-/*
- * This file contains functions for dynamic memory pool management
- */
-#include <linux/kernel.h>
-#include <linux/types.h>
-#include <linux/mm.h>
-
-#include <asm/set_memory.h>
-
-#include "atomisp_internal.h"
-
-#include "hmm/hmm_pool.h"
-
-/*
- * dynamic memory pool ops.
- */
-static unsigned int get_pages_from_dynamic_pool(void *pool,
-	struct hmm_page_object *page_obj,
-	unsigned int size, bool cached)
-{
-	struct hmm_page *hmm_page;
-	unsigned long flags;
-	unsigned int i = 0;
-	struct hmm_dynamic_pool_info *dypool_info = pool;
-
-	if (!dypool_info)
-		return 0;
-
-	spin_lock_irqsave(&dypool_info->list_lock, flags);
-	if (dypool_info->initialized) {
-		while (!list_empty(&dypool_info->pages_list)) {
-			hmm_page = list_entry(dypool_info->pages_list.next,
-					      struct hmm_page, list);
-
-			list_del(&hmm_page->list);
-			dypool_info->pgnr--;
-			spin_unlock_irqrestore(&dypool_info->list_lock, flags);
-
-			page_obj[i].page = hmm_page->page;
-			page_obj[i++].type = HMM_PAGE_TYPE_DYNAMIC;
-			kmem_cache_free(dypool_info->pgptr_cache, hmm_page);
-
-			if (i == size)
-				return i;
-
-			spin_lock_irqsave(&dypool_info->list_lock, flags);
-		}
-	}
-	spin_unlock_irqrestore(&dypool_info->list_lock, flags);
-
-	return i;
-}
-
-static void free_pages_to_dynamic_pool(void *pool,
-				       struct hmm_page_object *page_obj)
-{
-	struct hmm_page *hmm_page;
-	unsigned long flags;
-	int ret;
-	struct hmm_dynamic_pool_info *dypool_info = pool;
-
-	if (!dypool_info)
-		return;
-
-	spin_lock_irqsave(&dypool_info->list_lock, flags);
-	if (!dypool_info->initialized) {
-		spin_unlock_irqrestore(&dypool_info->list_lock, flags);
-		return;
-	}
-	spin_unlock_irqrestore(&dypool_info->list_lock, flags);
-
-	if (page_obj->type == HMM_PAGE_TYPE_RESERVED)
-		return;
-
-	if (dypool_info->pgnr >= dypool_info->pool_size) {
-		/* free page directly back to system */
-		ret = set_pages_wb(page_obj->page, 1);
-		if (ret)
-			dev_err(atomisp_dev,
-				"set page to WB err ...ret=%d\n", ret);
-		/*
-		W/A: set_pages_wb seldom return value = -EFAULT
-		indicate that address of page is not in valid
-		range(0xffff880000000000~0xffffc7ffffffffff)
-		then, _free_pages would panic; Do not know why page
-		address be valid, it maybe memory corruption by lowmemory
-		*/
-		if (!ret) {
-			__free_pages(page_obj->page, 0);
-			hmm_mem_stat.sys_size--;
-		}
-		return;
-	}
-	hmm_page = kmem_cache_zalloc(dypool_info->pgptr_cache,
-				     GFP_KERNEL);
-	if (!hmm_page) {
-		/* free page directly */
-		ret = set_pages_wb(page_obj->page, 1);
-		if (ret)
-			dev_err(atomisp_dev,
-				"set page to WB err ...ret=%d\n", ret);
-		if (!ret) {
-			__free_pages(page_obj->page, 0);
-			hmm_mem_stat.sys_size--;
-		}
-		return;
-	}
-
-	hmm_page->page = page_obj->page;
-
-	/*
-	 * add to pages_list of pages_pool
-	 */
-	spin_lock_irqsave(&dypool_info->list_lock, flags);
-	list_add_tail(&hmm_page->list, &dypool_info->pages_list);
-	dypool_info->pgnr++;
-	spin_unlock_irqrestore(&dypool_info->list_lock, flags);
-	hmm_mem_stat.dyc_size++;
-}
-
-static int hmm_dynamic_pool_init(void **pool, unsigned int pool_size)
-{
-	struct hmm_dynamic_pool_info *dypool_info;
-
-	if (pool_size == 0)
-		return 0;
-
-	dypool_info = kmalloc(sizeof(struct hmm_dynamic_pool_info),
-			      GFP_KERNEL);
-	if (unlikely(!dypool_info))
-		return -ENOMEM;
-
-	dypool_info->pgptr_cache = kmem_cache_create("pgptr_cache",
-				   sizeof(struct hmm_page), 0,
-				   SLAB_HWCACHE_ALIGN, NULL);
-	if (!dypool_info->pgptr_cache) {
-		kfree(dypool_info);
-		return -ENOMEM;
-	}
-
-	INIT_LIST_HEAD(&dypool_info->pages_list);
-	spin_lock_init(&dypool_info->list_lock);
-	dypool_info->initialized = true;
-	dypool_info->pool_size = pool_size;
-	dypool_info->pgnr = 0;
-
-	*pool = dypool_info;
-
-	return 0;
-}
-
-static void hmm_dynamic_pool_exit(void **pool)
-{
-	struct hmm_dynamic_pool_info *dypool_info = *pool;
-	struct hmm_page *hmm_page;
-	unsigned long flags;
-	int ret;
-
-	if (!dypool_info)
-		return;
-
-	spin_lock_irqsave(&dypool_info->list_lock, flags);
-	if (!dypool_info->initialized) {
-		spin_unlock_irqrestore(&dypool_info->list_lock, flags);
-		return;
-	}
-	dypool_info->initialized = false;
-
-	while (!list_empty(&dypool_info->pages_list)) {
-		hmm_page = list_entry(dypool_info->pages_list.next,
-				      struct hmm_page, list);
-
-		list_del(&hmm_page->list);
-		spin_unlock_irqrestore(&dypool_info->list_lock, flags);
-
-		/* can cause thread sleep, so cannot be put into spin_lock */
-		ret = set_pages_wb(hmm_page->page, 1);
-		if (ret)
-			dev_err(atomisp_dev,
-				"set page to WB err...ret=%d\n", ret);
-		if (!ret) {
-			__free_pages(hmm_page->page, 0);
-			hmm_mem_stat.dyc_size--;
-			hmm_mem_stat.sys_size--;
-		}
-		kmem_cache_free(dypool_info->pgptr_cache, hmm_page);
-		spin_lock_irqsave(&dypool_info->list_lock, flags);
-	}
-
-	spin_unlock_irqrestore(&dypool_info->list_lock, flags);
-
-	kmem_cache_destroy(dypool_info->pgptr_cache);
-
-	kfree(dypool_info);
-
-	*pool = NULL;
-}
-
-static int hmm_dynamic_pool_inited(void *pool)
-{
-	struct hmm_dynamic_pool_info *dypool_info = pool;
-
-	if (!dypool_info)
-		return 0;
-
-	return dypool_info->initialized;
-}
-
-struct hmm_pool_ops dynamic_pops = {
-	.pool_init		= hmm_dynamic_pool_init,
-	.pool_exit		= hmm_dynamic_pool_exit,
-	.pool_alloc_pages	= get_pages_from_dynamic_pool,
-	.pool_free_pages	= free_pages_to_dynamic_pool,
-	.pool_inited		= hmm_dynamic_pool_inited,
-};
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_reserved_pool.c b/drivers/staging/media/atomisp/pci/hmm/hmm_reserved_pool.c
deleted file mode 100644
index 57525fece921..000000000000
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_reserved_pool.c
+++ /dev/null
@@ -1,253 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Support for Medifield PNW Camera Imaging ISP subsystem.
- *
- * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
- *
- * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
- */
-/*
- * This file contains functions for reserved memory pool management
- */
-#include <linux/kernel.h>
-#include <linux/types.h>
-#include <linux/mm.h>
-
-#include <asm/set_memory.h>
-
-#include "atomisp_internal.h"
-#include "hmm/hmm_pool.h"
-
-/*
- * reserved memory pool ops.
- */
-static unsigned int get_pages_from_reserved_pool(void *pool,
-	struct hmm_page_object *page_obj,
-	unsigned int size, bool cached)
-{
-	unsigned long flags;
-	unsigned int i = 0;
-	unsigned int repool_pgnr;
-	int j;
-	struct hmm_reserved_pool_info *repool_info = pool;
-
-	if (!repool_info)
-		return 0;
-
-	spin_lock_irqsave(&repool_info->list_lock, flags);
-	if (repool_info->initialized) {
-		repool_pgnr = repool_info->index;
-
-		for (j = repool_pgnr - 1; j >= 0; j--) {
-			page_obj[i].page = repool_info->pages[j];
-			page_obj[i].type = HMM_PAGE_TYPE_RESERVED;
-			i++;
-			repool_info->index--;
-			if (i == size)
-				break;
-		}
-	}
-	spin_unlock_irqrestore(&repool_info->list_lock, flags);
-	return i;
-}
-
-static void free_pages_to_reserved_pool(void *pool,
-					struct hmm_page_object *page_obj)
-{
-	unsigned long flags;
-	struct hmm_reserved_pool_info *repool_info = pool;
-
-	if (!repool_info)
-		return;
-
-	spin_lock_irqsave(&repool_info->list_lock, flags);
-
-	if (repool_info->initialized &&
-	    repool_info->index < repool_info->pgnr &&
-	    page_obj->type == HMM_PAGE_TYPE_RESERVED) {
-		repool_info->pages[repool_info->index++] = page_obj->page;
-	}
-
-	spin_unlock_irqrestore(&repool_info->list_lock, flags);
-}
-
-static int hmm_reserved_pool_setup(struct hmm_reserved_pool_info **repool_info,
-				   unsigned int pool_size)
-{
-	struct hmm_reserved_pool_info *pool_info;
-
-	pool_info = kmalloc(sizeof(struct hmm_reserved_pool_info),
-			    GFP_KERNEL);
-	if (unlikely(!pool_info))
-		return -ENOMEM;
-
-	pool_info->pages = kmalloc(sizeof(struct page *) * pool_size,
-				   GFP_KERNEL);
-	if (unlikely(!pool_info->pages)) {
-		kfree(pool_info);
-		return -ENOMEM;
-	}
-
-	pool_info->index = 0;
-	pool_info->pgnr = 0;
-	spin_lock_init(&pool_info->list_lock);
-	pool_info->initialized = true;
-
-	*repool_info = pool_info;
-
-	return 0;
-}
-
-static int hmm_reserved_pool_init(void **pool, unsigned int pool_size)
-{
-	int ret;
-	unsigned int blk_pgnr;
-	unsigned int pgnr = pool_size;
-	unsigned int order = 0;
-	unsigned int i = 0;
-	int fail_number = 0;
-	struct page *pages;
-	int j;
-	struct hmm_reserved_pool_info *repool_info;
-
-	if (pool_size == 0)
-		return 0;
-
-	ret = hmm_reserved_pool_setup(&repool_info, pool_size);
-	if (ret) {
-		dev_err(atomisp_dev, "hmm_reserved_pool_setup failed.\n");
-		return ret;
-	}
-
-	pgnr = pool_size;
-
-	i = 0;
-	order = MAX_ORDER;
-
-	while (pgnr) {
-		blk_pgnr = 1U << order;
-		while (blk_pgnr > pgnr) {
-			order--;
-			blk_pgnr >>= 1U;
-		}
-		BUG_ON(order > MAX_ORDER);
-
-		pages = alloc_pages(GFP_KERNEL | __GFP_NOWARN, order);
-		if (unlikely(!pages)) {
-			if (order == 0) {
-				fail_number++;
-				dev_err(atomisp_dev, "%s: alloc_pages failed: %d\n",
-					__func__, fail_number);
-				/* if fail five times, will goto end */
-
-				/* FIXME: whether is the mechanism is ok? */
-				if (fail_number == ALLOC_PAGE_FAIL_NUM)
-					goto end;
-			} else {
-				order--;
-			}
-		} else {
-			blk_pgnr = 1U << order;
-
-			ret = set_pages_uc(pages, blk_pgnr);
-			if (ret) {
-				dev_err(atomisp_dev,
-					"set pages uncached failed\n");
-				__free_pages(pages, order);
-				goto end;
-			}
-
-			for (j = 0; j < blk_pgnr; j++)
-				repool_info->pages[i++] = pages + j;
-
-			repool_info->index += blk_pgnr;
-			repool_info->pgnr += blk_pgnr;
-
-			pgnr -= blk_pgnr;
-
-			fail_number = 0;
-		}
-	}
-
-end:
-	repool_info->initialized = true;
-
-	*pool = repool_info;
-
-	dev_info(atomisp_dev,
-		 "hmm_reserved_pool init successfully,hmm_reserved_pool is with %d pages.\n",
-		 repool_info->pgnr);
-	return 0;
-}
-
-static void hmm_reserved_pool_exit(void **pool)
-{
-	unsigned long flags;
-	int i, ret;
-	unsigned int pgnr;
-	struct hmm_reserved_pool_info *repool_info = *pool;
-
-	if (!repool_info)
-		return;
-
-	spin_lock_irqsave(&repool_info->list_lock, flags);
-	if (!repool_info->initialized) {
-		spin_unlock_irqrestore(&repool_info->list_lock, flags);
-		return;
-	}
-	pgnr = repool_info->pgnr;
-	repool_info->index = 0;
-	repool_info->pgnr = 0;
-	repool_info->initialized = false;
-	spin_unlock_irqrestore(&repool_info->list_lock, flags);
-
-	for (i = 0; i < pgnr; i++) {
-		ret = set_pages_wb(repool_info->pages[i], 1);
-		if (ret)
-			dev_err(atomisp_dev,
-				"set page to WB err...ret=%d\n", ret);
-		/*
-		W/A: set_pages_wb seldom return value = -EFAULT
-		indicate that address of page is not in valid
-		range(0xffff880000000000~0xffffc7ffffffffff)
-		then, _free_pages would panic; Do not know why
-		page address be valid, it maybe memory corruption by lowmemory
-		*/
-		if (!ret)
-			__free_pages(repool_info->pages[i], 0);
-	}
-
-	kfree(repool_info->pages);
-	kfree(repool_info);
-
-	*pool = NULL;
-}
-
-static int hmm_reserved_pool_inited(void *pool)
-{
-	struct hmm_reserved_pool_info *repool_info = pool;
-
-	if (!repool_info)
-		return 0;
-
-	return repool_info->initialized;
-}
-
-struct hmm_pool_ops reserved_pops = {
-	.pool_init		= hmm_reserved_pool_init,
-	.pool_exit		= hmm_reserved_pool_exit,
-	.pool_alloc_pages	= get_pages_from_reserved_pool,
-	.pool_free_pages	= free_pages_to_reserved_pool,
-	.pool_inited		= hmm_reserved_pool_inited,
-};
-- 
2.36.0

