Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0442A59B680
	for <lists+linux-media@lfdr.de>; Sun, 21 Aug 2022 23:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbiHUVuu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Aug 2022 17:50:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231737AbiHUVut (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Aug 2022 17:50:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E1BE205E2
        for <linux-media@vger.kernel.org>; Sun, 21 Aug 2022 14:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661118647;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+ebszTMHouWJ33cs6L5d5+Z3gNNawATUddRdEvbZIMI=;
        b=TE6jvej/CXNCL/CO/Lcv4FUbx7efh//dcxvaG75K3X5uI40D+Kw9Lx3flo5BHeZpNk1art
        lVxnxyV61YTzbjfbhbqdlWZOwISh4kOFTt+3MlQnVt38yo66HrVoH5ktxe3mn/XY49k1K5
        yKCrLd1IDx4LzXEBbhToqe8JRu2PwxU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-s660rw9EOF-a8FBscHAm_w-1; Sun, 21 Aug 2022 17:50:42 -0400
X-MC-Unique: s660rw9EOF-a8FBscHAm_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72EDD804184;
        Sun, 21 Aug 2022 21:50:41 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.47])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 00947404C6F2;
        Sun, 21 Aug 2022 21:50:39 +0000 (UTC)
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
Subject: [PATCH 08/13] media: atomisp: hmm_bo: Simplify alloc_private_pages()
Date:   Sun, 21 Aug 2022 23:50:22 +0200
Message-Id: <20220821215027.461344-8-hdegoede@redhat.com>
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

Since lack_mem starts initialized to true, alloc_private_pages() will
always set order to HMM_MIN_ORDER aka 0 / will always alloc 1 page at
a time.

So all the magic to decrease order if allocs fail is not necessary
and can be removed.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/include/hmm/hmm_bo.h        |  3 -
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 83 +++----------------
 2 files changed, 10 insertions(+), 76 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index 385e22fc4a46..901dc37c80bc 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -65,9 +65,6 @@
 #define	check_bo_null_return_void(bo)	\
 	check_null_return_void(bo, "NULL hmm buffer object.\n")
 
-#define	HMM_MAX_ORDER		3
-#define	HMM_MIN_ORDER		0
-
 #define	ISP_VM_START	0x0
 #define	ISP_VM_SIZE	(0x7FFFFFFF)	/* 2G address space */
 #define	ISP_PTR_NULL	NULL
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index f50494123f03..275314241263 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -44,16 +44,6 @@
 #include "hmm/hmm_common.h"
 #include "hmm/hmm_bo.h"
 
-static unsigned int order_to_nr(unsigned int order)
-{
-	return 1U << order;
-}
-
-static unsigned int nr_to_order_bottom(unsigned int nr)
-{
-	return fls(nr) - 1;
-}
-
 static int __bo_init(struct hmm_bo_device *bdev, struct hmm_buffer_object *bo,
 		     unsigned int pgnr)
 {
@@ -653,13 +643,10 @@ static void free_private_bo_pages(struct hmm_buffer_object *bo,
 static int alloc_private_pages(struct hmm_buffer_object *bo)
 {
 	int ret;
-	unsigned int pgnr, order, blk_pgnr, alloc_pgnr;
+	unsigned int pgnr, blk_pgnr, alloc_pgnr;
 	struct page *pages;
 	gfp_t gfp = GFP_NOWAIT | __GFP_NOWARN; /* REVISIT: need __GFP_FS too? */
 	int i, j;
-	int failure_number = 0;
-	bool reduce_order = false;
-	bool lack_mem = true;
 
 	pgnr = bo->pgnr;
 
@@ -667,58 +654,17 @@ static int alloc_private_pages(struct hmm_buffer_object *bo)
 	alloc_pgnr = 0;
 
 	while (pgnr) {
-		order = nr_to_order_bottom(pgnr);
-		/*
-		 * if be short of memory, we will set order to 0
-		 * everytime.
-		 */
-		if (lack_mem)
-			order = HMM_MIN_ORDER;
-		else if (order > HMM_MAX_ORDER)
-			order = HMM_MAX_ORDER;
-retry:
-		/*
-		 * When order > HMM_MIN_ORDER, for performance reasons we don't
-		 * want alloc_pages() to sleep. In case it fails and fallbacks
-		 * to HMM_MIN_ORDER or in case the requested order is originally
-		 * the minimum value, we can allow alloc_pages() to sleep for
-		 * robustness purpose.
-		 *
-		 * REVISIT: why __GFP_FS is necessary?
-		 */
-		if (order == HMM_MIN_ORDER) {
-			gfp &= ~GFP_NOWAIT;
-			gfp |= __GFP_RECLAIM | __GFP_FS;
-		}
+		gfp &= ~GFP_NOWAIT;
+		gfp |= __GFP_RECLAIM | __GFP_FS;
 
-		pages = alloc_pages(gfp, order);
+		pages = alloc_pages(gfp, 0); // alloc 1 page
 		if (unlikely(!pages)) {
-			/*
-			 * in low memory case, if allocation page fails,
-			 * we turn to try if order=0 allocation could
-			 * succeed. if order=0 fails too, that means there is
-			 * no memory left.
-			 */
-			if (order == HMM_MIN_ORDER) {
-				dev_err(atomisp_dev,
-					"%s: cannot allocate pages\n",
-					__func__);
-				goto cleanup;
-			}
-			order = HMM_MIN_ORDER;
-			failure_number++;
-			reduce_order = true;
-			/*
-			 * if fail two times continuously, we think be short
-			 * of memory now.
-			 */
-			if (failure_number == 2) {
-				lack_mem = true;
-				failure_number = 0;
-			}
-			goto retry;
+			dev_err(atomisp_dev,
+				"%s: cannot allocate pages\n",
+				__func__);
+			goto cleanup;
 		} else {
-			blk_pgnr = order_to_nr(order);
+			blk_pgnr = 1;
 
 			/*
 			 * set memory to uncacheable -- UC_MINUS
@@ -728,7 +674,7 @@ static int alloc_private_pages(struct hmm_buffer_object *bo)
 				dev_err(atomisp_dev,
 					"set page uncacheablefailed.\n");
 
-				__free_pages(pages, order);
+				__free_pages(pages, 0);
 
 				goto cleanup;
 			}
@@ -738,15 +684,6 @@ static int alloc_private_pages(struct hmm_buffer_object *bo)
 			}
 
 			pgnr -= blk_pgnr;
-
-			/*
-			 * if order is not reduced this time, clear
-			 * failure_number.
-			 */
-			if (reduce_order)
-				reduce_order = false;
-			else
-				failure_number = 0;
 		}
 	}
 
-- 
2.37.2

