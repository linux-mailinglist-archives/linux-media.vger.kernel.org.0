Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3AA59C24B
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 17:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235885AbiHVPLh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 11:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235936AbiHVPJW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 11:09:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAC303ECC8
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 08:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661180802;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Hsmk9X3mLcZno8I8QsM3DPVwz8zvjWpqceijAAXc7WI=;
        b=egyizYpbpjPH5SkiObWV4lctNTZjMpjra1xOGqleUWJ1Rky8XIORwwT8MkoySk6E4eUI/a
        Fg3LfgarnUfXV6L8qz6ZOFrX+UTODDyiLXwerfvO1MS1f2wLKnO0iBLBYFbvGDBoyE/jQm
        bqp6kZO3/1YbFSO2SfIa6ANevnGgdv0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-mrEdYqd7MYK3HgLWrZ0Z5g-1; Mon, 22 Aug 2022 11:06:38 -0400
X-MC-Unique: mrEdYqd7MYK3HgLWrZ0Z5g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25F4638164CE;
        Mon, 22 Aug 2022 15:06:38 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8B25340CFD0A;
        Mon, 22 Aug 2022 15:06:36 +0000 (UTC)
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
Subject: [PATCH v2 11/13] media: atomisp: hmm_bo: Rewrite free_private_pages() using pages_array helper funcs
Date:   Mon, 22 Aug 2022 17:06:08 +0200
Message-Id: <20220822150610.45186-11-hdegoede@redhat.com>
In-Reply-To: <20220822150610.45186-1-hdegoede@redhat.com>
References: <20220822150610.45186-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rewrite free_private_pages() using pages_array helper funcs.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 26 +++----------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 40b1137dcc31..d7f42a4ce40a 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -623,28 +623,10 @@ static void free_pages_bulk_array(unsigned long nr_pages, struct page **page_arr
 		__free_pages(page_array[i], 0);
 }
 
-static void free_private_bo_pages(struct hmm_buffer_object *bo,
-				  int free_pgnr)
+static void free_private_bo_pages(struct hmm_buffer_object *bo)
 {
-	int i, ret;
-
-	for (i = 0; i < free_pgnr; i++) {
-		ret = set_pages_wb(bo->pages[i], 1);
-		if (ret)
-			dev_err(atomisp_dev,
-				"set page to WB err ...ret = %d\n",
-				ret);
-		/*
-		W/A: set_pages_wb seldom return value = -EFAULT
-		indicate that address of page is not in valid
-		range(0xffff880000000000~0xffffc7ffffffffff)
-		then, _free_pages would panic; Do not know why page
-		address be valid,it maybe memory corruption by lowmemory
-		*/
-		if (!ret) {
-			__free_pages(bo->pages[i], 0);
-		}
-	}
+	set_pages_array_wb(bo->pages, bo->pgnr);
+	free_pages_bulk_array(bo->pgnr, bo->pages);
 }
 
 /*Allocate pages which will be used only by ISP*/
@@ -822,7 +804,7 @@ void hmm_bo_free_pages(struct hmm_buffer_object *bo)
 	bo->status &= (~HMM_BO_PAGE_ALLOCED);
 
 	if (bo->type == HMM_BO_PRIVATE)
-		free_private_bo_pages(bo, bo->pgnr);
+		free_private_bo_pages(bo);
 	else if (bo->type == HMM_BO_USER)
 		free_user_pages(bo, bo->pgnr);
 	else
-- 
2.36.1

