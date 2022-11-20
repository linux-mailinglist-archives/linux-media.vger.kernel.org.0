Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD5316316E9
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 23:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbiKTWnK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 17:43:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiKTWnJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 17:43:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA8F2409F
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668984093;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4TqMfHU2WtW9dP91YrXnJUNngz4nZrbVS91NAKAbt9I=;
        b=M1GPU5UawweO3BnWouzOdia2K9iht/SkYKAYdqOu+SdbhRG1/mOhAxsq550jD9MFXc0JTK
        8FYBcHAfGFUIIE8TmzbYwYHbCvhgKFmLJjorRK+83JprjkgsF4mOeHwlZTvi2VYcC6RUcE
        etE0/CWIPjFQxo3Jwt/GOkWcGGSs6MA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-OGlMGEMSOSih8mSLTBXznQ-1; Sun, 20 Nov 2022 17:41:28 -0500
X-MC-Unique: OGlMGEMSOSih8mSLTBXznQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B0AF833A06;
        Sun, 20 Nov 2022 22:41:28 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.70])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EC2EC47505E;
        Sun, 20 Nov 2022 22:41:26 +0000 (UTC)
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
Subject: [PATCH 10/20] media: atomisp: Drop userptr support from hmm
Date:   Sun, 20 Nov 2022 23:40:51 +0100
Message-Id: <20221120224101.746199-11-hdegoede@redhat.com>
In-Reply-To: <20221120224101.746199-1-hdegoede@redhat.com>
References: <20221120224101.746199-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After the conversion to videobuf2 userptr support is no longer needed,
drop it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/include/hmm/hmm.h   |  1 -
 .../media/atomisp/include/hmm/hmm_bo.h        |  2 -
 drivers/staging/media/atomisp/pci/hmm/hmm.c   | 19 +++----
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 53 +------------------
 4 files changed, 7 insertions(+), 68 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index b81b8580d405..2bc323b34f89 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -37,7 +37,6 @@ int hmm_init(void);
 void hmm_cleanup(void);
 
 ia_css_ptr hmm_alloc(size_t bytes);
-ia_css_ptr hmm_create_from_userdata(size_t bytes, const void __user *userptr);
 ia_css_ptr hmm_create_from_vmalloc_buf(size_t bytes, void *vmalloc_addr);
 
 void hmm_free(ia_css_ptr ptr);
diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index a51d89f0b5cc..b4c03e0ca9c0 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -74,7 +74,6 @@
 enum hmm_bo_type {
 	HMM_BO_PRIVATE,
 	HMM_BO_VMALLOC,
-	HMM_BO_USER,
 	HMM_BO_LAST,
 };
 
@@ -208,7 +207,6 @@ int hmm_bo_allocated(struct hmm_buffer_object *bo);
  */
 int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
 		       enum hmm_bo_type type,
-		       const void __user *userptr,
 		       void *vmalloc_addr);
 void hmm_bo_free_pages(struct hmm_buffer_object *bo);
 int hmm_bo_page_allocated(struct hmm_buffer_object *bo);
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index a262477104fc..e266628be332 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -42,9 +42,8 @@ static bool hmm_initialized;
 /*
  * p: private
  * v: vmalloc
- * u: user
  */
-static const char hmm_bo_type_string[] = "pvu";
+static const char hmm_bo_type_string[] = "pv";
 
 static ssize_t bo_show(struct device *dev, struct device_attribute *attr,
 		       char *buf, struct list_head *bo_list, bool active)
@@ -168,7 +167,6 @@ void hmm_cleanup(void)
 }
 
 static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm_bo_type type,
-			      const void __user *userptr,
 			      void *vmalloc_addr)
 {
 	unsigned int pgnr;
@@ -193,7 +191,7 @@ static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm_bo_type type,
 	}
 
 	/* Allocate pages for memory */
-	ret = hmm_bo_alloc_pages(bo, type, userptr, vmalloc_addr);
+	ret = hmm_bo_alloc_pages(bo, type, vmalloc_addr);
 	if (ret) {
 		dev_err(atomisp_dev, "hmm_bo_alloc_pages failed.\n");
 		goto alloc_page_err;
@@ -207,8 +205,8 @@ static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm_bo_type type,
 	}
 
 	dev_dbg(atomisp_dev,
-		"%s: pages: 0x%08x (%zu bytes), type: %d, user ptr %p\n",
-		__func__, bo->start, bytes, type, userptr);
+		"%s: pages: 0x%08x (%zu bytes), type: %d, vmalloc %p\n",
+		__func__, bo->start, bytes, type, vmalloc);
 
 	return bo->start;
 
@@ -222,17 +220,12 @@ static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm_bo_type type,
 
 ia_css_ptr hmm_alloc(size_t bytes)
 {
-	return __hmm_alloc(bytes, HMM_BO_PRIVATE, NULL, NULL);
+	return __hmm_alloc(bytes, HMM_BO_PRIVATE, NULL);
 }
 
 ia_css_ptr hmm_create_from_vmalloc_buf(size_t bytes, void *vmalloc_addr)
 {
-	return __hmm_alloc(bytes, HMM_BO_VMALLOC, NULL, vmalloc_addr);
-}
-
-ia_css_ptr hmm_create_from_userdata(size_t bytes, const void __user *userptr)
-{
-	return __hmm_alloc(bytes, HMM_BO_USER, userptr, NULL);
+	return __hmm_alloc(bytes, HMM_BO_VMALLOC, vmalloc_addr);
 }
 
 void hmm_free(ia_css_ptr virt)
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 3c150268db51..11c43e296de1 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -652,49 +652,6 @@ static int alloc_private_pages(struct hmm_buffer_object *bo)
 	return 0;
 }
 
-static void free_user_pages(struct hmm_buffer_object *bo,
-			    unsigned int page_nr)
-{
-	int i;
-
-	for (i = 0; i < page_nr; i++)
-		put_page(bo->pages[i]);
-}
-
-/*
- * Convert user space virtual address into pages list
- */
-static int alloc_user_pages(struct hmm_buffer_object *bo,
-			    const void __user *userptr)
-{
-	int page_nr;
-
-	userptr = untagged_addr(userptr);
-
-	/* Handle frame buffer allocated in user space */
-	mutex_unlock(&bo->mutex);
-	page_nr = get_user_pages_fast((unsigned long)userptr, bo->pgnr, 1, bo->pages);
-	mutex_lock(&bo->mutex);
-
-	/* can be written by caller, not forced */
-	if (page_nr != bo->pgnr) {
-		dev_err(atomisp_dev,
-			"get_user_pages err: bo->pgnr = %d, pgnr actually pinned = %d.\n",
-			bo->pgnr, page_nr);
-		if (page_nr < 0)
-			page_nr = 0;
-		goto out_of_mem;
-	}
-
-	return 0;
-
-out_of_mem:
-
-	free_user_pages(bo, page_nr);
-
-	return -ENOMEM;
-}
-
 static int alloc_vmalloc_pages(struct hmm_buffer_object *bo, void *vmalloc_addr)
 {
 	void *vaddr = vmalloc_addr;
@@ -716,16 +673,12 @@ static int alloc_vmalloc_pages(struct hmm_buffer_object *bo, void *vmalloc_addr)
  * allocate/free physical pages for the bo.
  *
  * type indicate where are the pages from. currently we have 3 types
- * of memory: HMM_BO_PRIVATE, HMM_BO_VMALLOC, HMM_BO_USER.
+ * of memory: HMM_BO_PRIVATE, HMM_BO_VMALLOC.
  *
  * vmalloc_addr is only valid when type is HMM_BO_VMALLOC.
- *
- * userptr is only valid when type is HMM_BO_USER, it indicates
- * the start address from user space task.
  */
 int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
 		       enum hmm_bo_type type,
-		       const void __user *userptr,
 		       void *vmalloc_addr)
 {
 	int ret = -EINVAL;
@@ -745,8 +698,6 @@ int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
 		ret = alloc_private_pages(bo);
 	} else if (type == HMM_BO_VMALLOC) {
 		ret = alloc_vmalloc_pages(bo, vmalloc_addr);
-	} else if (type == HMM_BO_USER) {
-		ret = alloc_user_pages(bo, userptr);
 	} else {
 		dev_err(atomisp_dev, "invalid buffer type.\n");
 		ret = -EINVAL;
@@ -792,8 +743,6 @@ void hmm_bo_free_pages(struct hmm_buffer_object *bo)
 		free_private_bo_pages(bo);
 	else if (bo->type == HMM_BO_VMALLOC)
 		; /* No-op, nothing to do */
-	else if (bo->type == HMM_BO_USER)
-		free_user_pages(bo, bo->pgnr);
 	else
 		dev_err(atomisp_dev, "invalid buffer type.\n");
 
-- 
2.38.1

