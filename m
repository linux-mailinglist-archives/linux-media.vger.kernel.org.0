Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B13359B681
	for <lists+linux-media@lfdr.de>; Sun, 21 Aug 2022 23:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbiHUVux (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Aug 2022 17:50:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231769AbiHUVuv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Aug 2022 17:50:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9380205E3
        for <linux-media@vger.kernel.org>; Sun, 21 Aug 2022 14:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661118648;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=O9nV/6V+4IbB8aPmr7eb0+dIIaVt1IAWKqVhGEIqebY=;
        b=FtjF8s6T80WZVQZ89jeyyoCYLEYuGcT82/1x9lB2zGXD+9OYA/43aWQ4pMuF0c2sxZjqCX
        38sDdsHENJU7NCHUfEDiI4QgKRmgGflCjywoJKgLEHlhkxbmE8BkIDQQda04vNnpRLiVOf
        jQXDA0QgdO01CathpBGzAmbOUMKrdyM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-coNvKXJnPCyDIrfpxwsTFw-1; Sun, 21 Aug 2022 17:50:45 -0400
X-MC-Unique: coNvKXJnPCyDIrfpxwsTFw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDAD48037AA;
        Sun, 21 Aug 2022 21:50:44 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.47])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5C61C40CFD0A;
        Sun, 21 Aug 2022 21:50:43 +0000 (UTC)
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
Subject: [PATCH 10/13] media: atomisp: hmm_bo: Rewrite alloc_private_pages() using pages_array helper funcs
Date:   Sun, 21 Aug 2022 23:50:24 +0200
Message-Id: <20220821215027.461344-10-hdegoede@redhat.com>
In-Reply-To: <20220821215027.461344-1-hdegoede@redhat.com>
References: <20220821215027.461344-1-hdegoede@redhat.com>
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

Rewrite alloc_private_pages() using pages_array helper funcs.

Note alloc_pages_bulk_array() skips non NULL pages, so switch
the allocating of the pages pointer array to kcalloc to ensure
the pages are initially all set to NULL.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 48 ++++++++-----------
 1 file changed, 20 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index bb52171a9d87..40b1137dcc31 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -615,6 +615,14 @@ struct hmm_buffer_object *hmm_bo_device_search_vmap_start(
 	return bo;
 }
 
+static void free_pages_bulk_array(unsigned long nr_pages, struct page **page_array)
+{
+	unsigned long i;
+
+	for (i = 0; i < nr_pages; i++)
+		__free_pages(page_array[i], 0);
+}
+
 static void free_private_bo_pages(struct hmm_buffer_object *bo,
 				  int free_pgnr)
 {
@@ -643,38 +651,22 @@ static void free_private_bo_pages(struct hmm_buffer_object *bo,
 static int alloc_private_pages(struct hmm_buffer_object *bo)
 {
 	const gfp_t gfp = __GFP_NOWARN | __GFP_RECLAIM | __GFP_FS;
-	struct page *pages;
-	int i, ret;
-
-	for (i = 0; i < bo->pgnr; i++) {
-		pages = alloc_pages(gfp, 0); // alloc 1 page
-		if (unlikely(!pages)) {
-			dev_err(atomisp_dev,
-				"%s: cannot allocate pages\n",
-				__func__);
-			goto cleanup;
-		} else {
-			/*
-			 * set memory to uncacheable -- UC_MINUS
-			 */
-			ret = set_pages_uc(pages, 1);
-			if (ret) {
-				dev_err(atomisp_dev,
-					"set page uncacheablefailed.\n");
-
-				__free_pages(pages, 0);
+	int ret;
 
-				goto cleanup;
-			}
+	ret = alloc_pages_bulk_array(gfp, bo->pgnr, bo->pages);
+	if (ret != bo->pgnr) {
+		free_pages_bulk_array(ret, bo->pages);
+		return -ENOMEM;
+	}
 
-			bo->pages[i] = pages;
-		}
+	ret = set_pages_array_uc(bo->pages, bo->pgnr);
+	if (ret) {
+		dev_err(atomisp_dev, "set pages uncacheable failed.\n");
+		free_pages_bulk_array(bo->pgnr, bo->pages);
+		return ret;
 	}
 
 	return 0;
-cleanup:
-	free_private_bo_pages(bo, i);
-	return -ENOMEM;
 }
 
 static void free_user_pages(struct hmm_buffer_object *bo,
@@ -774,7 +766,7 @@ int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
 	mutex_lock(&bo->mutex);
 	check_bo_status_no_goto(bo, HMM_BO_PAGE_ALLOCED, status_err);
 
-	bo->pages = kmalloc_array(bo->pgnr, sizeof(struct page *), GFP_KERNEL);
+	bo->pages = kcalloc(bo->pgnr, sizeof(struct page *), GFP_KERNEL);
 	if (unlikely(!bo->pages)) {
 		ret = -ENOMEM;
 		goto alloc_err;
-- 
2.37.2

