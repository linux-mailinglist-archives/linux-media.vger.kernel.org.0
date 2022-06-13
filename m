Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7FB1549FBF
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 22:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233429AbiFMUpW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jun 2022 16:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239745AbiFMUo2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jun 2022 16:44:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5CD3114021
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 12:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655149922;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hGeMYPjTW2mDc/jA8t+q0i07RZLVjJ7azCLF2yifmFk=;
        b=F+3aozgjJ48+J9W4mlCA99vnHEJyC4CQwd+aOLQc0++pKXC3kz2ASFx2zrQT0mMlQvxrIs
        ZQ9FeP2ZWWduLiWz/bmFWQQA2kVv14xdsmgH+d8n9o6jD6kEPD3ew4Ts6yfVR5Pl6GDYEU
        jJQEQo8FrMkdizGG7He7aJTsB0bnpOs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-v7ODaEe9P7WTzhbZsY_f9Q-1; Mon, 13 Jun 2022 15:51:59 -0400
X-MC-Unique: v7ODaEe9P7WTzhbZsY_f9Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 974371C0513A;
        Mon, 13 Jun 2022 19:51:58 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1CD832166B26;
        Mon, 13 Jun 2022 19:51:57 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 11/40] media: atomisp: remove hmm pool code
Date:   Mon, 13 Jun 2022 21:51:08 +0200
Message-Id: <20220613195137.8117-12-hdegoede@redhat.com>
In-Reply-To: <20220613195137.8117-1-hdegoede@redhat.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since we never register any pools, this is all dead code,
remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/include/hmm/hmm.h   |   3 +-
 .../media/atomisp/include/hmm/hmm_bo.h        |   3 -
 .../media/atomisp/include/hmm/hmm_pool.h      | 116 ------------------
 drivers/staging/media/atomisp/pci/hmm/hmm.c   |  52 --------
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    |  79 +-----------
 5 files changed, 8 insertions(+), 245 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/include/hmm/hmm_pool.h

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index 067e0310d02b..90d442fef4e8 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -26,7 +26,8 @@
 #include <linux/slab.h>
 #include <linux/mm.h>
 
-#include "hmm/hmm_pool.h"
+#include "hmm_common.h"
+#include "hmm/hmm_bo.h"
 #include "ia_css_types.h"
 
 #define mmgr_NULL              ((ia_css_ptr)0)
diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index 8c78a5d87b65..b9bae51e3814 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -280,9 +280,6 @@ void hmm_bo_vunmap(struct hmm_buffer_object *bo);
 int hmm_bo_mmap(struct vm_area_struct *vma,
 		struct hmm_buffer_object *bo);
 
-extern struct hmm_pool	dynamic_pool;
-extern struct hmm_pool	reserved_pool;
-
 /*
  * find the buffer object by its virtual address vaddr.
  * return NULL if no such buffer object found.
diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_pool.h b/drivers/staging/media/atomisp/include/hmm/hmm_pool.h
deleted file mode 100644
index 3fef57de973c..000000000000
--- a/drivers/staging/media/atomisp/include/hmm/hmm_pool.h
+++ /dev/null
@@ -1,116 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
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
-#ifndef __HMM_POOL_H__
-#define __HMM_POOL_H__
-
-#include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/list.h>
-#include <linux/spinlock.h>
-#include <linux/mutex.h>
-#include <linux/kref.h>
-#include "hmm_common.h"
-#include "hmm/hmm_bo.h"
-
-#define ALLOC_PAGE_FAIL_NUM		5
-
-enum hmm_pool_type {
-	HMM_POOL_TYPE_RESERVED,
-	HMM_POOL_TYPE_DYNAMIC,
-};
-
-/**
- * struct hmm_pool_ops  -  memory pool callbacks.
- *
- * @pool_init:		   initialize the memory pool.
- * @pool_exit:		   uninitialize the memory pool.
- * @pool_alloc_pages:	   allocate pages from memory pool.
- * @pool_free_pages:	   free pages to memory pool.
- * @pool_inited:	   check whether memory pool is initialized.
- */
-struct hmm_pool_ops {
-	int (*pool_init)(void **pool, unsigned int pool_size);
-	void (*pool_exit)(void **pool);
-	unsigned int (*pool_alloc_pages)(void *pool,
-					 struct hmm_page_object *page_obj,
-					 unsigned int size, bool cached);
-	void (*pool_free_pages)(void *pool,
-				struct hmm_page_object *page_obj);
-	int (*pool_inited)(void *pool);
-};
-
-struct hmm_pool {
-	struct hmm_pool_ops	*pops;
-
-	void			*pool_info;
-};
-
-/**
- * struct hmm_reserved_pool_info  - represents reserved pool private data.
- * @pages:			    a array that store physical pages.
- *				    The array is as reserved memory pool.
- * @index:			    to indicate the first blank page number
- *				    in reserved memory pool(pages array).
- * @pgnr:			    the valid page amount in reserved memory
- *				    pool.
- * @list_lock:			    list lock is used to protect the operation
- *				    to reserved memory pool.
- * @flag:			    reserved memory pool state flag.
- */
-struct hmm_reserved_pool_info {
-	struct page		**pages;
-
-	unsigned int		index;
-	unsigned int		pgnr;
-	spinlock_t		list_lock;
-	bool			initialized;
-};
-
-/**
- * struct hmm_dynamic_pool_info  -  represents dynamic pool private data.
- * @pages_list:			    a list that store physical pages.
- *				    The pages list is as dynamic memory pool.
- * @list_lock:			    list lock is used to protect the operation
- *				    to dynamic memory pool.
- * @flag:			    dynamic memory pool state flag.
- * @pgptr_cache:		    struct kmem_cache, manages a cache.
- */
-struct hmm_dynamic_pool_info {
-	struct list_head	pages_list;
-
-	/* list lock is used to protect the free pages block lists */
-	spinlock_t		list_lock;
-
-	struct kmem_cache	*pgptr_cache;
-	bool			initialized;
-
-	unsigned int		pool_size;
-	unsigned int		pgnr;
-};
-
-struct hmm_page {
-	struct page		*page;
-	struct list_head	list;
-};
-
-extern struct hmm_pool_ops	reserved_pops;
-extern struct hmm_pool_ops	dynamic_pops;
-
-#endif
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index f609e154d788..c623ab6952de 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -28,7 +28,6 @@
 #include <linux/sysfs.h>
 
 #include "hmm/hmm.h"
-#include "hmm/hmm_pool.h"
 #include "hmm/hmm_bo.h"
 
 #include "atomisp_internal.h"
@@ -37,8 +36,6 @@
 #include "mmu/sh_mmu_mrfld.h"
 
 struct hmm_bo_device bo_device;
-struct hmm_pool	dynamic_pool;
-struct hmm_pool	reserved_pool;
 static ia_css_ptr dummy_ptr = mmgr_EXCEPTION;
 static bool hmm_initialized;
 struct _hmm_mem_stat hmm_mem_stat;
@@ -113,62 +110,13 @@ static ssize_t free_bo_show(struct device *dev, struct device_attribute *attr,
 	return bo_show(dev, attr, buf, &bo_device.entire_bo_list, false);
 }
 
-static ssize_t reserved_pool_show(struct device *dev,
-				  struct device_attribute *attr,
-				  char *buf)
-{
-	ssize_t ret = 0;
-
-	struct hmm_reserved_pool_info *pinfo = reserved_pool.pool_info;
-	unsigned long flags;
-
-	if (!pinfo || !pinfo->initialized)
-		return 0;
-
-	spin_lock_irqsave(&pinfo->list_lock, flags);
-	ret = scnprintf(buf, PAGE_SIZE, "%d out of %d pages available\n",
-			pinfo->index, pinfo->pgnr);
-	spin_unlock_irqrestore(&pinfo->list_lock, flags);
-
-	if (ret > 0)
-		ret++; /* Add trailing zero, not included by scnprintf */
-
-	return ret;
-};
-
-static ssize_t dynamic_pool_show(struct device *dev,
-				 struct device_attribute *attr,
-				 char *buf)
-{
-	ssize_t ret = 0;
-
-	struct hmm_dynamic_pool_info *pinfo = dynamic_pool.pool_info;
-	unsigned long flags;
-
-	if (!pinfo || !pinfo->initialized)
-		return 0;
-
-	spin_lock_irqsave(&pinfo->list_lock, flags);
-	ret = scnprintf(buf, PAGE_SIZE, "%d (max %d) pages available\n",
-			pinfo->pgnr, pinfo->pool_size);
-	spin_unlock_irqrestore(&pinfo->list_lock, flags);
-
-	if (ret > 0)
-		ret++; /* Add trailing zero, not included by scnprintf */
-
-	return ret;
-};
 
 static DEVICE_ATTR_RO(active_bo);
 static DEVICE_ATTR_RO(free_bo);
-static DEVICE_ATTR_RO(reserved_pool);
-static DEVICE_ATTR_RO(dynamic_pool);
 
 static struct attribute *sysfs_attrs_ctrl[] = {
 	&dev_attr_active_bo.attr,
 	&dev_attr_free_bo.attr,
-	&dev_attr_reserved_pool.attr,
-	&dev_attr_dynamic_pool.attr,
 	NULL
 };
 
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 0168f9839c90..d44117c0f5e7 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -42,7 +42,6 @@
 
 #include "atomisp_internal.h"
 #include "hmm/hmm_common.h"
-#include "hmm/hmm_pool.h"
 #include "hmm/hmm_bo.h"
 
 static unsigned int order_to_nr(unsigned int order)
@@ -627,8 +626,6 @@ struct hmm_buffer_object *hmm_bo_device_search_vmap_start(
 }
 
 static void free_private_bo_pages(struct hmm_buffer_object *bo,
-				  struct hmm_pool *dypool,
-				  struct hmm_pool *repool,
 				  int free_pgnr)
 {
 	int i, ret;
@@ -636,36 +633,9 @@ static void free_private_bo_pages(struct hmm_buffer_object *bo,
 	for (i = 0; i < free_pgnr; i++) {
 		switch (bo->page_obj[i].type) {
 		case HMM_PAGE_TYPE_RESERVED:
-			if (repool->pops
-			    && repool->pops->pool_free_pages) {
-				repool->pops->pool_free_pages(repool->pool_info,
-							      &bo->page_obj[i]);
-				hmm_mem_stat.res_cnt--;
-			}
 			break;
-		/*
-		 * HMM_PAGE_TYPE_GENERAL indicates that pages are from system
-		 * memory, so when free them, they should be put into dynamic
-		 * pool.
-		 */
 		case HMM_PAGE_TYPE_DYNAMIC:
 		case HMM_PAGE_TYPE_GENERAL:
-			if (dypool->pops
-			    && dypool->pops->pool_inited
-			    && dypool->pops->pool_inited(dypool->pool_info)) {
-				if (dypool->pops->pool_free_pages)
-					dypool->pops->pool_free_pages(
-					    dypool->pool_info,
-					    &bo->page_obj[i]);
-				break;
-			}
-
-			fallthrough;
-
-		/*
-		 * if dynamic memory pool doesn't exist, need to free
-		 * pages to system directly.
-		 */
 		default:
 			ret = set_pages_wb(bo->page_obj[i].page, 1);
 			if (ret)
@@ -693,9 +663,7 @@ static void free_private_bo_pages(struct hmm_buffer_object *bo,
 /*Allocate pages which will be used only by ISP*/
 static int alloc_private_pages(struct hmm_buffer_object *bo,
 			       int from_highmem,
-			       bool cached,
-			       struct hmm_pool *dypool,
-			       struct hmm_pool *repool)
+			       bool cached)
 {
 	int ret;
 	unsigned int pgnr, order, blk_pgnr, alloc_pgnr;
@@ -719,37 +687,6 @@ static int alloc_private_pages(struct hmm_buffer_object *bo,
 	i = 0;
 	alloc_pgnr = 0;
 
-	/*
-	 * get physical pages from dynamic pages pool.
-	 */
-	if (dypool->pops && dypool->pops->pool_alloc_pages) {
-		alloc_pgnr = dypool->pops->pool_alloc_pages(dypool->pool_info,
-			     bo->page_obj, pgnr,
-			     cached);
-		hmm_mem_stat.dyc_size -= alloc_pgnr;
-
-		if (alloc_pgnr == pgnr)
-			return 0;
-	}
-
-	pgnr -= alloc_pgnr;
-	i += alloc_pgnr;
-
-	/*
-	 * get physical pages from reserved pages pool for atomisp.
-	 */
-	if (repool->pops && repool->pops->pool_alloc_pages) {
-		alloc_pgnr = repool->pops->pool_alloc_pages(repool->pool_info,
-			     &bo->page_obj[i], pgnr,
-			     cached);
-		hmm_mem_stat.res_cnt += alloc_pgnr;
-		if (alloc_pgnr == pgnr)
-			return 0;
-	}
-
-	pgnr -= alloc_pgnr;
-	i += alloc_pgnr;
-
 	while (pgnr) {
 		order = nr_to_order_bottom(pgnr);
 		/*
@@ -841,19 +778,16 @@ static int alloc_private_pages(struct hmm_buffer_object *bo,
 	return 0;
 cleanup:
 	alloc_pgnr = i;
-	free_private_bo_pages(bo, dypool, repool, alloc_pgnr);
+	free_private_bo_pages(bo, alloc_pgnr);
 
 	kfree(bo->page_obj);
 
 	return -ENOMEM;
 }
 
-static void free_private_pages(struct hmm_buffer_object *bo,
-			       struct hmm_pool *dypool,
-			       struct hmm_pool *repool)
+static void free_private_pages(struct hmm_buffer_object *bo)
 {
-	free_private_bo_pages(bo, dypool, repool, bo->pgnr);
-
+	free_private_bo_pages(bo, bo->pgnr);
 	kfree(bo->page_obj);
 }
 
@@ -993,8 +927,7 @@ int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
 	 * add HMM_BO_USER type
 	 */
 	if (type == HMM_BO_PRIVATE) {
-		ret = alloc_private_pages(bo, from_highmem,
-					  cached, &dynamic_pool, &reserved_pool);
+		ret = alloc_private_pages(bo, from_highmem, cached);
 	} else if (type == HMM_BO_USER) {
 		ret = alloc_user_pages(bo, userptr, cached);
 	} else {
@@ -1038,7 +971,7 @@ void hmm_bo_free_pages(struct hmm_buffer_object *bo)
 	bo->status &= (~HMM_BO_PAGE_ALLOCED);
 
 	if (bo->type == HMM_BO_PRIVATE)
-		free_private_pages(bo, &dynamic_pool, &reserved_pool);
+		free_private_pages(bo);
 	else if (bo->type == HMM_BO_USER)
 		free_user_pages(bo, bo->pgnr);
 	else
-- 
2.36.0

