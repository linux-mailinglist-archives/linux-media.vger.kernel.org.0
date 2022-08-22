Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6023E59C25E
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 17:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236020AbiHVPLj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 11:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236005AbiHVPJZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 11:09:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67CC83ECDE
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 08:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661180804;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aEKRdzsRi0RcSQFLjxTphMUukqeTh3iGEqwoOM2P+sA=;
        b=aQajjwndiQgRSCoxlVK4Y3JYDIfb75acnz4x8dmGzkGuqpdn7NtRxvXrlpYtDCV87nf8KB
        78oILH394fO+Qqegg107YTyrIHdK0FBjKIkGGGHESUd0/lXes4WeKafxhk0gjx49r0Lzrm
        8WpN8G8h/mnSPbj/9wK/TkQ+2R2Usbo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-svAEhcfPPAaKVbRApN183g-1; Mon, 22 Aug 2022 11:06:41 -0400
X-MC-Unique: svAEhcfPPAaKVbRApN183g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF303802D2C;
        Mon, 22 Aug 2022 15:06:40 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7DF3040466A7;
        Mon, 22 Aug 2022 15:06:38 +0000 (UTC)
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
Subject: [PATCH v2 12/13] media: atomisp: hmm_bo: Drop PFN code path from alloc_user_pages()
Date:   Mon, 22 Aug 2022 17:06:09 +0200
Message-Id: <20220822150610.45186-12-hdegoede@redhat.com>
In-Reply-To: <20220822150610.45186-1-hdegoede@redhat.com>
References: <20220822150610.45186-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

alloc_user_pages() is only ever called on qbuf for USERPTR buffers which
always hits the get_user_pages_fast() path, so the pin_user_pages() path
can be removed.

Getting the vma then also is no longer necessary since that is only
done to determine which path to use.

And this also removes the only users of the mem_type struct hmm_bo member,
so remove that as well.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Various small style fixes suggested by Andy
- Drop useless dev_dbg call while at it
---
 .../media/atomisp/include/hmm/hmm_bo.h        |  3 --
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 46 +++----------------
 2 files changed, 6 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index 901dc37c80bc..c5cbae1d9cf9 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -86,8 +86,6 @@ enum hmm_bo_type {
 #define	HMM_BO_VMAPED		0x10
 #define	HMM_BO_VMAPED_CACHED	0x20
 #define	HMM_BO_ACTIVE		0x1000
-#define	HMM_BO_MEM_TYPE_USER     0x1
-#define	HMM_BO_MEM_TYPE_PFN      0x2
 
 struct hmm_bo_device {
 	struct isp_mmu		mmu;
@@ -123,7 +121,6 @@ struct hmm_buffer_object {
 	enum hmm_bo_type	type;
 	int		mmap_count;
 	int		status;
-	int		mem_type;
 	void		*vmap_addr; /* kernel virtual address by vmap */
 
 	struct rb_node	node;
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index d7f42a4ce40a..a5fd6d38d3c4 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -656,12 +656,8 @@ static void free_user_pages(struct hmm_buffer_object *bo,
 {
 	int i;
 
-	if (bo->mem_type == HMM_BO_MEM_TYPE_PFN) {
-		unpin_user_pages(bo->pages, page_nr);
-	} else {
-		for (i = 0; i < page_nr; i++)
-			put_page(bo->pages[i]);
-	}
+	for (i = 0; i < page_nr; i++)
+		put_page(bo->pages[i]);
 }
 
 /*
@@ -671,43 +667,13 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
 			    const void __user *userptr)
 {
 	int page_nr;
-	struct vm_area_struct *vma;
-
-	mutex_unlock(&bo->mutex);
-	mmap_read_lock(current->mm);
-	vma = find_vma(current->mm, (unsigned long)userptr);
-	mmap_read_unlock(current->mm);
-	if (!vma) {
-		dev_err(atomisp_dev, "find_vma failed\n");
-		mutex_lock(&bo->mutex);
-		return -EFAULT;
-	}
-	mutex_lock(&bo->mutex);
-	/*
-	 * Handle frame buffer allocated in other kerenl space driver
-	 * and map to user space
-	 */
 
 	userptr = untagged_addr(userptr);
 
-	if (vma->vm_flags & (VM_IO | VM_PFNMAP)) {
-		page_nr = pin_user_pages((unsigned long)userptr, bo->pgnr,
-					 FOLL_LONGTERM | FOLL_WRITE,
-					 bo->pages, NULL);
-		bo->mem_type = HMM_BO_MEM_TYPE_PFN;
-	} else {
-		/*Handle frame buffer allocated in user space*/
-		mutex_unlock(&bo->mutex);
-		page_nr = get_user_pages_fast((unsigned long)userptr,
-					      (int)(bo->pgnr), 1, bo->pages);
-		mutex_lock(&bo->mutex);
-		bo->mem_type = HMM_BO_MEM_TYPE_USER;
-	}
-
-	dev_dbg(atomisp_dev, "%s: %d %s pages were allocated as 0x%08x\n",
-		__func__,
-		bo->pgnr,
-		bo->mem_type == HMM_BO_MEM_TYPE_USER ? "user" : "pfn", page_nr);
+	/* Handle frame buffer allocated in user space */
+	mutex_unlock(&bo->mutex);
+	page_nr = get_user_pages_fast((unsigned long)userptr, bo->pgnr, 1, bo->pages);
+	mutex_lock(&bo->mutex);
 
 	/* can be written by caller, not forced */
 	if (page_nr != bo->pgnr) {
-- 
2.36.1

