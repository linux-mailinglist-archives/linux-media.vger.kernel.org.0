Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91EBD1E8E91
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728886AbgE3G4I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:56:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:44920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728797AbgE3G4F (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:05 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B81C2145D;
        Sat, 30 May 2020 06:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821763;
        bh=ag9KBWaJ+mNe3F0Ez0MK4BJoetM0kZTjmXPO9TUCM8o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NmA5COQbqCJqI1j0OUiQwOl9rBPpsPc7HvpdbV6lSiK5E/eQXqGQTtrCEu3tWRg5f
         NGtmKBxll/FApKVhStwHnj8Vpzl1NgTaYAxEGM/i144X2CKK43hMkpkh7Emdq7D7CW
         whdqYZXOQrCYC/4CdG7/VDzcMCv6p3QrpSY7Cuvg=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPV-001hp9-3Q; Sat, 30 May 2020 08:56:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/41] media: atomisp: use pin_user_pages() for memory allocation
Date:   Sat, 30 May 2020 08:55:31 +0200
Message-Id: <2ff6f038d661da0f0e3b75ce1749b8612ac578f3.1590821410.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590821410.git.mchehab+huawei@kernel.org>
References: <cover.1590821410.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of using a hacked version of an old copy of
get_user_pages(), use pin_user_pages().

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/atomisp/include/hmm/hmm_bo.h        |   2 +
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 145 +++---------------
 2 files changed, 24 insertions(+), 123 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index 7fcb93b6c0f5..39aea0cb2d33 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -130,6 +130,8 @@ struct hmm_buffer_object {
 	struct list_head	list;
 	struct kref	kref;
 
+	struct page **pages;
+
 	/* mutex protecting this BO */
 	struct mutex		mutex;
 	enum hmm_bo_type	type;
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index b6dcd246d7af..64bf6b8fc7cc 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -854,109 +854,20 @@ static void free_private_pages(struct hmm_buffer_object *bo,
 	kfree(bo->page_obj);
 }
 
-/*
- * Hacked from kernel function __get_user_pages in mm/memory.c
- *
- * Handle buffers allocated by other kernel space driver and mmaped into user
- * space, function Ignore the VM_PFNMAP and VM_IO flag in VMA structure
- *
- * Get physical pages from user space virtual address and update into page list
- */
-static int __get_pfnmap_pages(struct task_struct *tsk, struct mm_struct *mm,
-			      unsigned long start, int nr_pages,
-			      unsigned int gup_flags, struct page **pages,
-			      struct vm_area_struct **vmas)
+static void free_user_pages(struct hmm_buffer_object *bo)
 {
-	int i, ret;
-	unsigned long vm_flags;
-
-	if (nr_pages <= 0)
-		return 0;
-
-	VM_BUG_ON(!!pages != !!(gup_flags & FOLL_GET));
-
-	/*
-	 * Require read or write permissions.
-	 * If FOLL_FORCE is set, we only require the "MAY" flags.
-	 */
-	vm_flags  = (gup_flags & FOLL_WRITE) ?
-		    (VM_WRITE | VM_MAYWRITE) : (VM_READ | VM_MAYREAD);
-	vm_flags &= (gup_flags & FOLL_FORCE) ?
-		    (VM_MAYREAD | VM_MAYWRITE) : (VM_READ | VM_WRITE);
-	i = 0;
-
-	do {
-		struct vm_area_struct *vma;
-
-		vma = find_vma(mm, start);
-		if (!vma) {
-			dev_err(atomisp_dev, "find_vma failed\n");
-			return i ? : -EFAULT;
-		}
-
-		if (is_vm_hugetlb_page(vma)) {
-			/*
-			i = follow_hugetlb_page(mm, vma, pages, vmas,
-					&start, &nr_pages, i, gup_flags);
-			*/
-			continue;
-		}
-
-		do {
-			struct page *page;
-			unsigned long pfn;
-
-			/*
-			 * If we have a pending SIGKILL, don't keep faulting
-			 * pages and potentially allocating memory.
-			 */
-			if (unlikely(fatal_signal_pending(current))) {
-				dev_err(atomisp_dev,
-					"fatal_signal_pending in %s\n",
-					__func__);
-				return i ? i : -ERESTARTSYS;
-			}
-
-			ret = follow_pfn(vma, start, &pfn);
-			if (ret) {
-				dev_err(atomisp_dev, "follow_pfn() failed\n");
-				return i ? : -EFAULT;
-			}
-
-			page = pfn_to_page(pfn);
-			if (IS_ERR(page))
-				return i ? i : PTR_ERR(page);
-			if (pages) {
-				pages[i] = page;
-				get_page(page);
-				flush_anon_page(vma, page, start);
-				flush_dcache_page(page);
-			}
-			if (vmas)
-				vmas[i] = vma;
-			i++;
-			start += PAGE_SIZE;
-			nr_pages--;
-		} while (nr_pages && start < vma->vm_end);
-	} while (nr_pages);
-
-	return i;
-}
-
-static int get_pfnmap_pages(struct task_struct *tsk, struct mm_struct *mm,
-			    unsigned long start, int nr_pages, int write, int force,
-			    struct page **pages, struct vm_area_struct **vmas)
-{
-	int flags = FOLL_TOUCH;
-
-	if (pages)
-		flags |= FOLL_GET;
-	if (write)
-		flags |= FOLL_WRITE;
-	if (force)
-		flags |= FOLL_FORCE;
-
-	return __get_pfnmap_pages(tsk, mm, start, nr_pages, flags, pages, vmas);
+	int i;
+
+	hmm_mem_stat.usr_size -= bo->pgnr;
+
+	if (bo->mem_type == HMM_BO_MEM_TYPE_PFN) {
+		unpin_user_pages(bo->pages, bo->pgnr);
+	} else {
+		for (i = 0; i < bo->pgnr; i++)
+			put_page(bo->pages[i]);
+	}
+	kfree(bo->pages);
+	kfree(bo->page_obj);
 }
 
 /*
@@ -1000,11 +911,12 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
 
 	userptr = untagged_addr(userptr);
 
+	bo->pages = pages;
+
 	if (vma->vm_flags & (VM_IO | VM_PFNMAP)) {
-		page_nr = get_pfnmap_pages(current, current->mm,
-					   (unsigned long)userptr,
-					   (int)(bo->pgnr), 1, 0,
-					   pages, NULL);
+		page_nr = pin_user_pages((unsigned long)userptr, bo->pgnr,
+					 FOLL_LONGTERM | FOLL_WRITE,
+					 pages, NULL);
 		bo->mem_type = HMM_BO_MEM_TYPE_PFN;
 	} else {
 		/*Handle frame buffer allocated in user space*/
@@ -1020,6 +932,8 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
 		bo->pgnr,
 		bo->mem_type == HMM_BO_MEM_TYPE_USER ? "user" : "pfn", page_nr);
 
+	hmm_mem_stat.usr_size += bo->pgnr;
+
 	/* can be written by caller, not forced */
 	if (page_nr != bo->pgnr) {
 		dev_err(atomisp_dev,
@@ -1032,31 +946,16 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
 		bo->page_obj[i].page = pages[i];
 		bo->page_obj[i].type = HMM_PAGE_TYPE_GENERAL;
 	}
-	hmm_mem_stat.usr_size += bo->pgnr;
-	kfree(pages);
 
 	return 0;
 
 out_of_mem:
-	for (i = 0; i < page_nr; i++)
-		put_page(pages[i]);
-	kfree(pages);
-	kfree(bo->page_obj);
+
+	free_user_pages(bo);
 
 	return -ENOMEM;
 }
 
-static void free_user_pages(struct hmm_buffer_object *bo)
-{
-	int i;
-
-	for (i = 0; i < bo->pgnr; i++)
-		put_page(bo->page_obj[i].page);
-	hmm_mem_stat.usr_size -= bo->pgnr;
-
-	kfree(bo->page_obj);
-}
-
 /*
  * allocate/free physical pages for the bo.
  *
-- 
2.26.2

