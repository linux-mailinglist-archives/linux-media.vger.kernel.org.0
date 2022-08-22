Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D95D59C240
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 17:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236112AbiHVPJp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 11:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236111AbiHVPJQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 11:09:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9EA73E76B
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 08:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661180800;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bT3RjR6398OUx/hu3Mq6bp5ZvvtanEGPJBnrbmPxr5o=;
        b=DuspbTmijZD8G/7L6f0xDC/S4gDimNk4I4CVv9f8M86KmKMLAz0IWao8D0L7S86aImZiJJ
        gFyIdptD+IXschpR14KV9Ne/96Gl6qqWsVaNf0ZdICSfey1WzleYQ/6Js1NMVMtb8aL1vS
        KMvXjROnYPL+u78fBtDKP1zjj9Jp1Dg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-IQEqyB5NM5eP7jTHMoDFYQ-1; Mon, 22 Aug 2022 11:06:34 -0400
X-MC-Unique: IQEqyB5NM5eP7jTHMoDFYQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B11AC299E75E;
        Mon, 22 Aug 2022 15:06:33 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6D9EF40CF8E8;
        Mon, 22 Aug 2022 15:06:31 +0000 (UTC)
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
Subject: [PATCH v2 09/13] media: atomisp: hmm_bo: Further simplify alloc_private_pages()
Date:   Mon, 22 Aug 2022 17:06:06 +0200
Message-Id: <20220822150610.45186-9-hdegoede@redhat.com>
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

Further simplify alloc_private_pages().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 29 ++++---------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 275314241263..bb52171a9d87 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -642,21 +642,11 @@ static void free_private_bo_pages(struct hmm_buffer_object *bo,
 /*Allocate pages which will be used only by ISP*/
 static int alloc_private_pages(struct hmm_buffer_object *bo)
 {
-	int ret;
-	unsigned int pgnr, blk_pgnr, alloc_pgnr;
+	const gfp_t gfp = __GFP_NOWARN | __GFP_RECLAIM | __GFP_FS;
 	struct page *pages;
-	gfp_t gfp = GFP_NOWAIT | __GFP_NOWARN; /* REVISIT: need __GFP_FS too? */
-	int i, j;
-
-	pgnr = bo->pgnr;
-
-	i = 0;
-	alloc_pgnr = 0;
-
-	while (pgnr) {
-		gfp &= ~GFP_NOWAIT;
-		gfp |= __GFP_RECLAIM | __GFP_FS;
+	int i, ret;
 
+	for (i = 0; i < bo->pgnr; i++) {
 		pages = alloc_pages(gfp, 0); // alloc 1 page
 		if (unlikely(!pages)) {
 			dev_err(atomisp_dev,
@@ -664,12 +654,10 @@ static int alloc_private_pages(struct hmm_buffer_object *bo)
 				__func__);
 			goto cleanup;
 		} else {
-			blk_pgnr = 1;
-
 			/*
 			 * set memory to uncacheable -- UC_MINUS
 			 */
-			ret = set_pages_uc(pages, blk_pgnr);
+			ret = set_pages_uc(pages, 1);
 			if (ret) {
 				dev_err(atomisp_dev,
 					"set page uncacheablefailed.\n");
@@ -679,18 +667,13 @@ static int alloc_private_pages(struct hmm_buffer_object *bo)
 				goto cleanup;
 			}
 
-			for (j = 0; j < blk_pgnr; j++, i++) {
-				bo->pages[i] = pages + j;
-			}
-
-			pgnr -= blk_pgnr;
+			bo->pages[i] = pages;
 		}
 	}
 
 	return 0;
 cleanup:
-	alloc_pgnr = i;
-	free_private_bo_pages(bo, alloc_pgnr);
+	free_private_bo_pages(bo, i);
 	return -ENOMEM;
 }
 
-- 
2.36.1

