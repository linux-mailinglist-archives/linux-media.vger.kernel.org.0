Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E336F54D315
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348059AbiFOUvm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348001AbiFOUvk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:51:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D9D1854FBE
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326299;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6c//9HwXrGhXbaZGUJ9H3w1f3juz4f0uYgzjj8q2VLI=;
        b=NrgQqC6EFjO8jDZhR9QIw5toe5NGO/hg+ySU7p9Dlmmpt+d2i1UJLEfy2JnG4OF7ht5Cg8
        w/7bvcwXf3ZEdJ41sZxDXyuWB+xpeUyu9R7IF7enEnV+pAVpjuT61MXptwxn+PsyUAAId9
        pTXBuWEYBBdhMLN/FFFggUqseWev248=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-o6Y6q8iCPOmeWpR5KxmJMA-1; Wed, 15 Jun 2022 16:51:35 -0400
X-MC-Unique: o6Y6q8iCPOmeWpR5KxmJMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B4F6802D1F;
        Wed, 15 Jun 2022 20:51:35 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6ECCE111F5;
        Wed, 15 Jun 2022 20:51:33 +0000 (UTC)
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
Subject: [PATCH v2 30/40] media: atomisp: drop highmem var/arg from the hmm code
Date:   Wed, 15 Jun 2022 22:50:27 +0200
Message-Id: <20220615205037.16549-31-hdegoede@redhat.com>
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

highmem is always false, drop it.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm_bo.h |  6 ++----
 drivers/staging/media/atomisp/pci/hmm/hmm.c        |  2 +-
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     | 13 +++----------
 3 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index 44eb4d3039f5..5ed83e1aaa79 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -130,7 +130,6 @@ struct hmm_buffer_object {
 	struct mutex		mutex;
 	enum hmm_bo_type	type;
 	struct hmm_page_object	*page_obj;	/* physical pages */
-	int		from_highmem;
 	int		mmap_count;
 	int		status;
 	int		mem_type;
@@ -214,13 +213,12 @@ void hmm_bo_unref(struct hmm_buffer_object *bo);
 int hmm_bo_allocated(struct hmm_buffer_object *bo);
 
 /*
- * allocate/free physical pages for the bo. will try to alloc mem
- * from highmem if from_highmem is set, and type indicate that the
+ * Allocate/Free physical pages for the bo. Type indicates if the
  * pages will be allocated by using video driver (for share buffer)
  * or by ISP driver itself.
  */
 int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
-		       enum hmm_bo_type type, int from_highmem,
+		       enum hmm_bo_type type,
 		       const void __user *userptr);
 void hmm_bo_free_pages(struct hmm_buffer_object *bo);
 int hmm_bo_page_allocated(struct hmm_buffer_object *bo);
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 7e56e8dbec5c..11c79ee3089a 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -192,7 +192,7 @@ static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm_bo_type type, const void __
 	}
 
 	/* Allocate pages for memory */
-	ret = hmm_bo_alloc_pages(bo, type, false, userptr);
+	ret = hmm_bo_alloc_pages(bo, type, userptr);
 	if (ret) {
 		dev_err(atomisp_dev, "hmm_bo_alloc_pages failed.\n");
 		goto alloc_page_err;
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 357f34fb7aef..a6b7f2b6247f 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -650,8 +650,7 @@ static void free_private_bo_pages(struct hmm_buffer_object *bo,
 }
 
 /*Allocate pages which will be used only by ISP*/
-static int alloc_private_pages(struct hmm_buffer_object *bo,
-			       int from_highmem)
+static int alloc_private_pages(struct hmm_buffer_object *bo)
 {
 	int ret;
 	unsigned int pgnr, order, blk_pgnr, alloc_pgnr;
@@ -662,9 +661,6 @@ static int alloc_private_pages(struct hmm_buffer_object *bo,
 	bool reduce_order = false;
 	bool lack_mem = true;
 
-	if (from_highmem)
-		gfp |= __GFP_HIGHMEM;
-
 	pgnr = bo->pgnr;
 
 	bo->page_obj = kmalloc_array(pgnr, sizeof(struct hmm_page_object),
@@ -881,9 +877,6 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
  * type indicate where are the pages from. currently we have 3 types
  * of memory: HMM_BO_PRIVATE, HMM_BO_USER, HMM_BO_SHARE.
  *
- * from_highmem is only valid when type is HMM_BO_PRIVATE, it will
- * try to alloc memory from highmem if from_highmem is set.
- *
  * userptr is only valid when type is HMM_BO_USER, it indicates
  * the start address from user space task.
  *
@@ -891,7 +884,7 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
  * HMM_BO_SHARE.
  */
 int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
-		       enum hmm_bo_type type, int from_highmem,
+		       enum hmm_bo_type type,
 		       const void __user *userptr)
 {
 	int ret = -EINVAL;
@@ -906,7 +899,7 @@ int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
 	 * add HMM_BO_USER type
 	 */
 	if (type == HMM_BO_PRIVATE) {
-		ret = alloc_private_pages(bo, from_highmem);
+		ret = alloc_private_pages(bo);
 	} else if (type == HMM_BO_USER) {
 		ret = alloc_user_pages(bo, userptr);
 	} else {
-- 
2.36.0

