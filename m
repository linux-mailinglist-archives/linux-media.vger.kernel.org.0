Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B834660692D
	for <lists+linux-media@lfdr.de>; Thu, 20 Oct 2022 21:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbiJTTzv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Oct 2022 15:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbiJTTzt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Oct 2022 15:55:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39840F07DA
        for <linux-media@vger.kernel.org>; Thu, 20 Oct 2022 12:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666295747;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/4luUEan7kJYj4SgeWmlq0vs682vGqU9S7pG9/yzTSg=;
        b=enc2pgxw3rlpWdMegKW6yUylGu0qvnb2ljueEJ5ejyk9qIE+k/g83JE2+qQhWQgkqVt83d
        qn7KVTG2OenSWLJlt2oueBBb6elpQggmGqsspY88OslZ1cJBfH6XuX5wYc8uUvNTCiwFOh
        J8V0ix32S8UbPBlrORdRsIONN/Kp9OM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-dQS69_n6OriK60ffL72MPg-1; Thu, 20 Oct 2022 15:55:42 -0400
X-MC-Unique: dQS69_n6OriK60ffL72MPg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B6133C0F238;
        Thu, 20 Oct 2022 19:55:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.86])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DA99140C6EC2;
        Thu, 20 Oct 2022 19:55:40 +0000 (UTC)
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
Subject: [PATCH v2 01/17] media: atomisp: Add hmm_create_from_vmalloc_buf() function
Date:   Thu, 20 Oct 2022 21:55:17 +0200
Message-Id: <20221020195533.114049-2-hdegoede@redhat.com>
In-Reply-To: <20221020195533.114049-1-hdegoede@redhat.com>
References: <20221020195533.114049-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a new hmm creating function to create a vmm object from a vmalloc-ed
kernel buffer. This is a preparation patch for adding videobuf2 (and
working MMAP mode) support.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/include/hmm/hmm.h   |  2 ++
 .../media/atomisp/include/hmm/hmm_bo.h        |  4 ++-
 drivers/staging/media/atomisp/pci/hmm/hmm.c   | 15 ++++++---
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 32 +++++++++++++++----
 4 files changed, 42 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index c0384bb0a762..b81b8580d405 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -38,6 +38,8 @@ void hmm_cleanup(void);
 
 ia_css_ptr hmm_alloc(size_t bytes);
 ia_css_ptr hmm_create_from_userdata(size_t bytes, const void __user *userptr);
+ia_css_ptr hmm_create_from_vmalloc_buf(size_t bytes, void *vmalloc_addr);
+
 void hmm_free(ia_css_ptr ptr);
 int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes);
 int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes);
diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index c5cbae1d9cf9..a51d89f0b5cc 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -73,6 +73,7 @@
 
 enum hmm_bo_type {
 	HMM_BO_PRIVATE,
+	HMM_BO_VMALLOC,
 	HMM_BO_USER,
 	HMM_BO_LAST,
 };
@@ -207,7 +208,8 @@ int hmm_bo_allocated(struct hmm_buffer_object *bo);
  */
 int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
 		       enum hmm_bo_type type,
-		       const void __user *userptr);
+		       const void __user *userptr,
+		       void *vmalloc_addr);
 void hmm_bo_free_pages(struct hmm_buffer_object *bo);
 int hmm_bo_page_allocated(struct hmm_buffer_object *bo);
 
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index fc6cfe9f7744..207a834e37bf 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -168,7 +168,9 @@ void hmm_cleanup(void)
 	hmm_initialized = false;
 }
 
-static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm_bo_type type, const void __user *userptr)
+static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm_bo_type type,
+			      const void __user *userptr,
+			      void *vmalloc_addr)
 {
 	unsigned int pgnr;
 	struct hmm_buffer_object *bo;
@@ -192,7 +194,7 @@ static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm_bo_type type, const void __
 	}
 
 	/* Allocate pages for memory */
-	ret = hmm_bo_alloc_pages(bo, type, userptr);
+	ret = hmm_bo_alloc_pages(bo, type, userptr, vmalloc_addr);
 	if (ret) {
 		dev_err(atomisp_dev, "hmm_bo_alloc_pages failed.\n");
 		goto alloc_page_err;
@@ -221,12 +223,17 @@ static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm_bo_type type, const void __
 
 ia_css_ptr hmm_alloc(size_t bytes)
 {
-	return __hmm_alloc(bytes, HMM_BO_PRIVATE, NULL);
+	return __hmm_alloc(bytes, HMM_BO_PRIVATE, NULL, NULL);
+}
+
+ia_css_ptr hmm_create_from_vmalloc_buf(size_t bytes, void *vmalloc_addr)
+{
+	return __hmm_alloc(bytes, HMM_BO_VMALLOC, NULL, vmalloc_addr);
 }
 
 ia_css_ptr hmm_create_from_userdata(size_t bytes, const void __user *userptr)
 {
-	return __hmm_alloc(bytes, HMM_BO_USER, userptr);
+	return __hmm_alloc(bytes, HMM_BO_USER, userptr, NULL);
 }
 
 void hmm_free(ia_css_ptr virt)
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index a5fd6d38d3c4..465ba837f2ed 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -694,18 +694,38 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
 	return -ENOMEM;
 }
 
+static int alloc_vmalloc_pages(struct hmm_buffer_object *bo, void *vmalloc_addr)
+{
+	void *vaddr = vmalloc_addr;
+	int i;
+
+	for (i = 0; i < bo->pgnr; i++) {
+		bo->pages[i] = vmalloc_to_page(vaddr);
+		if (!bo->pages[i]) {
+			dev_err(atomisp_dev, "Error could not get page %d of vmalloc buf\n", i);
+			return -ENOMEM;
+		}
+		vaddr += PAGE_SIZE;
+	}
+
+	return 0;
+}
+
 /*
  * allocate/free physical pages for the bo.
  *
  * type indicate where are the pages from. currently we have 3 types
- * of memory: HMM_BO_PRIVATE, HMM_BO_USER.
+ * of memory: HMM_BO_PRIVATE, HMM_BO_VMALLOC, HMM_BO_USER.
+ *
+ * vmalloc_addr is only valid when type is HMM_BO_VMALLOC.
  *
  * userptr is only valid when type is HMM_BO_USER, it indicates
  * the start address from user space task.
  */
 int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
 		       enum hmm_bo_type type,
-		       const void __user *userptr)
+		       const void __user *userptr,
+		       void *vmalloc_addr)
 {
 	int ret = -EINVAL;
 
@@ -720,12 +740,10 @@ int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
 		goto alloc_err;
 	}
 
-	/*
-	 * TO DO:
-	 * add HMM_BO_USER type
-	 */
 	if (type == HMM_BO_PRIVATE) {
 		ret = alloc_private_pages(bo);
+	} else if (type == HMM_BO_VMALLOC) {
+		ret = alloc_vmalloc_pages(bo, vmalloc_addr);
 	} else if (type == HMM_BO_USER) {
 		ret = alloc_user_pages(bo, userptr);
 	} else {
@@ -771,6 +789,8 @@ void hmm_bo_free_pages(struct hmm_buffer_object *bo)
 
 	if (bo->type == HMM_BO_PRIVATE)
 		free_private_bo_pages(bo);
+	else if (bo->type == HMM_BO_VMALLOC)
+		; /* No-op, nothing to do */
 	else if (bo->type == HMM_BO_USER)
 		free_user_pages(bo, bo->pgnr);
 	else
-- 
2.37.3

