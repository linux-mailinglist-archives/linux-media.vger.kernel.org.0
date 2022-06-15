Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 416D154D30C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348190AbiFOUvr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348097AbiFOUvo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:51:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6428F54FB9
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326302;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BkBZqB6BsHyjp9SV0CFXA92cQVOgl44WIo2Zm55zUeU=;
        b=Lh6qXSGKctsQqygLBzdiocoCS5LuTDFLQ+sJqt3DGY99UVi4ACvqA9USaAOFxlEl+DliDP
        VKK1D7GopxkAVJx0qDi4eOg+Ot8f8xYqZz98iS2UaBf3uRgiabD2Euuuqu0OGr47h4BmmV
        Ju65Q3ApgiPPsSCk1N3tEl57WsTuOEQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-DX3SrP8IPLm7oENe7PR5xA-1; Wed, 15 Jun 2022 16:51:39 -0400
X-MC-Unique: DX3SrP8IPLm7oENe7PR5xA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB9C385A580;
        Wed, 15 Jun 2022 20:51:38 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1444D1131D;
        Wed, 15 Jun 2022 20:51:36 +0000 (UTC)
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
Subject: [PATCH v2 32/40] media: atomisp: remove hmm_page_object
Date:   Wed, 15 Jun 2022 22:50:29 +0200
Message-Id: <20220615205037.16549-33-hdegoede@redhat.com>
In-Reply-To: <20220615205037.16549-1-hdegoede@redhat.com>
References: <20220615205037.16549-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hmm_page_object only stores a struct page pointer, so we can just use
the hmm_bo.pages page pointer array everywhere.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/include/hmm/hmm_bo.h        |  5 --
 drivers/staging/media/atomisp/pci/hmm/hmm.c   |  8 +-
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 79 +++++--------------
 3 files changed, 22 insertions(+), 70 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index a4b193c35127..385e22fc4a46 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -114,10 +114,6 @@ struct hmm_bo_device {
 	struct kmem_cache *bo_cache;
 };
 
-struct hmm_page_object {
-	struct page		*page;
-};
-
 struct hmm_buffer_object {
 	struct hmm_bo_device	*bdev;
 	struct list_head	list;
@@ -128,7 +124,6 @@ struct hmm_buffer_object {
 	/* mutex protecting this BO */
 	struct mutex		mutex;
 	enum hmm_bo_type	type;
-	struct hmm_page_object	*page_obj;	/* physical pages */
 	int		mmap_count;
 	int		status;
 	int		mem_type;
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 11c79ee3089a..fc6cfe9f7744 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -295,7 +295,7 @@ static int load_and_flush_by_kmap(ia_css_ptr virt, void *data,
 		idx = (virt - bo->start) >> PAGE_SHIFT;
 		offset = (virt - bo->start) - (idx << PAGE_SHIFT);
 
-		src = (char *)kmap_local_page(bo->page_obj[idx].page) + offset;
+		src = (char *)kmap_local_page(bo->pages[idx]) + offset;
 
 		if ((bytes + offset) >= PAGE_SIZE) {
 			len = PAGE_SIZE - offset;
@@ -427,7 +427,7 @@ int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes)
 		idx = (virt - bo->start) >> PAGE_SHIFT;
 		offset = (virt - bo->start) - (idx << PAGE_SHIFT);
 
-		des = (char *)kmap_local_page(bo->page_obj[idx].page);
+		des = (char *)kmap_local_page(bo->pages[idx]);
 
 		if (!des) {
 			dev_err(atomisp_dev,
@@ -498,7 +498,7 @@ int hmm_set(ia_css_ptr virt, int c, unsigned int bytes)
 		idx = (virt - bo->start) >> PAGE_SHIFT;
 		offset = (virt - bo->start) - (idx << PAGE_SHIFT);
 
-		des = (char *)kmap_local_page(bo->page_obj[idx].page) + offset;
+		des = (char *)kmap_local_page(bo->pages[idx]) + offset;
 
 		if ((bytes + offset) >= PAGE_SIZE) {
 			len = PAGE_SIZE - offset;
@@ -537,7 +537,7 @@ phys_addr_t hmm_virt_to_phys(ia_css_ptr virt)
 	idx = (virt - bo->start) >> PAGE_SHIFT;
 	offset = (virt - bo->start) - (idx << PAGE_SHIFT);
 
-	return page_to_phys(bo->page_obj[idx].page) + offset;
+	return page_to_phys(bo->pages[idx]) + offset;
 }
 
 int hmm_mmap(struct vm_area_struct *vma, ia_css_ptr virt)
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index e5796ab7dbcf..f50494123f03 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -631,7 +631,7 @@ static void free_private_bo_pages(struct hmm_buffer_object *bo,
 	int i, ret;
 
 	for (i = 0; i < free_pgnr; i++) {
-		ret = set_pages_wb(bo->page_obj[i].page, 1);
+		ret = set_pages_wb(bo->pages[i], 1);
 		if (ret)
 			dev_err(atomisp_dev,
 				"set page to WB err ...ret = %d\n",
@@ -644,7 +644,7 @@ static void free_private_bo_pages(struct hmm_buffer_object *bo,
 		address be valid,it maybe memory corruption by lowmemory
 		*/
 		if (!ret) {
-			__free_pages(bo->page_obj[i].page, 0);
+			__free_pages(bo->pages[i], 0);
 		}
 	}
 }
@@ -663,11 +663,6 @@ static int alloc_private_pages(struct hmm_buffer_object *bo)
 
 	pgnr = bo->pgnr;
 
-	bo->page_obj = kmalloc_array(pgnr, sizeof(struct hmm_page_object),
-				     GFP_KERNEL);
-	if (unlikely(!bo->page_obj))
-		return -ENOMEM;
-
 	i = 0;
 	alloc_pgnr = 0;
 
@@ -739,7 +734,7 @@ static int alloc_private_pages(struct hmm_buffer_object *bo)
 			}
 
 			for (j = 0; j < blk_pgnr; j++, i++) {
-				bo->page_obj[i].page = pages + j;
+				bo->pages[i] = pages + j;
 			}
 
 			pgnr -= blk_pgnr;
@@ -759,18 +754,9 @@ static int alloc_private_pages(struct hmm_buffer_object *bo)
 cleanup:
 	alloc_pgnr = i;
 	free_private_bo_pages(bo, alloc_pgnr);
-
-	kfree(bo->page_obj);
-
 	return -ENOMEM;
 }
 
-static void free_private_pages(struct hmm_buffer_object *bo)
-{
-	free_private_bo_pages(bo, bo->pgnr);
-	kfree(bo->page_obj);
-}
-
 static void free_user_pages(struct hmm_buffer_object *bo,
 			    unsigned int page_nr)
 {
@@ -782,8 +768,6 @@ static void free_user_pages(struct hmm_buffer_object *bo,
 		for (i = 0; i < page_nr; i++)
 			put_page(bo->pages[i]);
 	}
-	kfree(bo->pages);
-	kfree(bo->page_obj);
 }
 
 /*
@@ -793,20 +777,7 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
 			    const void __user *userptr)
 {
 	int page_nr;
-	int i;
 	struct vm_area_struct *vma;
-	struct page **pages;
-
-	pages = kmalloc_array(bo->pgnr, sizeof(struct page *), GFP_KERNEL);
-	if (unlikely(!pages))
-		return -ENOMEM;
-
-	bo->page_obj = kmalloc_array(bo->pgnr, sizeof(struct hmm_page_object),
-				     GFP_KERNEL);
-	if (unlikely(!bo->page_obj)) {
-		kfree(pages);
-		return -ENOMEM;
-	}
 
 	mutex_unlock(&bo->mutex);
 	mmap_read_lock(current->mm);
@@ -814,8 +785,6 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
 	mmap_read_unlock(current->mm);
 	if (!vma) {
 		dev_err(atomisp_dev, "find_vma failed\n");
-		kfree(bo->page_obj);
-		kfree(pages);
 		mutex_lock(&bo->mutex);
 		return -EFAULT;
 	}
@@ -827,18 +796,16 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
 
 	userptr = untagged_addr(userptr);
 
-	bo->pages = pages;
-
 	if (vma->vm_flags & (VM_IO | VM_PFNMAP)) {
 		page_nr = pin_user_pages((unsigned long)userptr, bo->pgnr,
 					 FOLL_LONGTERM | FOLL_WRITE,
-					 pages, NULL);
+					 bo->pages, NULL);
 		bo->mem_type = HMM_BO_MEM_TYPE_PFN;
 	} else {
 		/*Handle frame buffer allocated in user space*/
 		mutex_unlock(&bo->mutex);
 		page_nr = get_user_pages_fast((unsigned long)userptr,
-					      (int)(bo->pgnr), 1, pages);
+					      (int)(bo->pgnr), 1, bo->pages);
 		mutex_lock(&bo->mutex);
 		bo->mem_type = HMM_BO_MEM_TYPE_USER;
 	}
@@ -858,10 +825,6 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
 		goto out_of_mem;
 	}
 
-	for (i = 0; i < bo->pgnr; i++) {
-		bo->page_obj[i].page = pages[i];
-	}
-
 	return 0;
 
 out_of_mem:
@@ -891,6 +854,12 @@ int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
 	mutex_lock(&bo->mutex);
 	check_bo_status_no_goto(bo, HMM_BO_PAGE_ALLOCED, status_err);
 
+	bo->pages = kmalloc_array(bo->pgnr, sizeof(struct page *), GFP_KERNEL);
+	if (unlikely(!bo->pages)) {
+		ret = -ENOMEM;
+		goto alloc_err;
+	}
+
 	/*
 	 * TO DO:
 	 * add HMM_BO_USER type
@@ -915,6 +884,7 @@ int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
 	return 0;
 
 alloc_err:
+	kfree(bo->pages);
 	mutex_unlock(&bo->mutex);
 	dev_err(atomisp_dev, "alloc pages err...\n");
 	return ret;
@@ -940,11 +910,13 @@ void hmm_bo_free_pages(struct hmm_buffer_object *bo)
 	bo->status &= (~HMM_BO_PAGE_ALLOCED);
 
 	if (bo->type == HMM_BO_PRIVATE)
-		free_private_pages(bo);
+		free_private_bo_pages(bo, bo->pgnr);
 	else if (bo->type == HMM_BO_USER)
 		free_user_pages(bo, bo->pgnr);
 	else
 		dev_err(atomisp_dev, "invalid buffer type.\n");
+
+	kfree(bo->pages);
 	mutex_unlock(&bo->mutex);
 
 	return;
@@ -989,7 +961,7 @@ int hmm_bo_bind(struct hmm_buffer_object *bo)
 	for (i = 0; i < bo->pgnr; i++) {
 		ret =
 		    isp_mmu_map(&bdev->mmu, virt,
-				page_to_phys(bo->page_obj[i].page), 1);
+				page_to_phys(bo->pages[i]), 1);
 		if (ret)
 			goto map_err;
 		virt += (1 << PAGE_SHIFT);
@@ -1103,9 +1075,6 @@ int hmm_bo_binded(struct hmm_buffer_object *bo)
 
 void *hmm_bo_vmap(struct hmm_buffer_object *bo, bool cached)
 {
-	struct page **pages;
-	int i;
-
 	check_bo_null_return(bo, NULL);
 
 	mutex_lock(&bo->mutex);
@@ -1122,27 +1091,15 @@ void *hmm_bo_vmap(struct hmm_buffer_object *bo, bool cached)
 		bo->status &= ~(HMM_BO_VMAPED | HMM_BO_VMAPED_CACHED);
 	}
 
-	pages = kmalloc_array(bo->pgnr, sizeof(*pages), GFP_KERNEL);
-	if (unlikely(!pages)) {
-		mutex_unlock(&bo->mutex);
-		return NULL;
-	}
-
-	for (i = 0; i < bo->pgnr; i++)
-		pages[i] = bo->page_obj[i].page;
-
-	bo->vmap_addr = vmap(pages, bo->pgnr, VM_MAP,
+	bo->vmap_addr = vmap(bo->pages, bo->pgnr, VM_MAP,
 			     cached ? PAGE_KERNEL : PAGE_KERNEL_NOCACHE);
 	if (unlikely(!bo->vmap_addr)) {
-		kfree(pages);
 		mutex_unlock(&bo->mutex);
 		dev_err(atomisp_dev, "vmap failed...\n");
 		return NULL;
 	}
 	bo->status |= (cached ? HMM_BO_VMAPED_CACHED : HMM_BO_VMAPED);
 
-	kfree(pages);
-
 	mutex_unlock(&bo->mutex);
 	return bo->vmap_addr;
 }
@@ -1272,7 +1229,7 @@ int hmm_bo_mmap(struct vm_area_struct *vma, struct hmm_buffer_object *bo)
 
 	virt = vma->vm_start;
 	for (i = 0; i < pgnr; i++) {
-		pfn = page_to_pfn(bo->page_obj[i].page);
+		pfn = page_to_pfn(bo->pages[i]);
 		if (remap_pfn_range(vma, virt, pfn, PAGE_SIZE, PAGE_SHARED)) {
 			dev_warn(atomisp_dev,
 				 "remap_pfn_range failed: virt = 0x%x, pfn = 0x%x, mapped_pgnr = %d\n",
-- 
2.36.0

