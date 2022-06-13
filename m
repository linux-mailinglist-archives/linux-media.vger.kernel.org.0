Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A95EE549FC1
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 22:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240533AbiFMUp1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jun 2022 16:45:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241626AbiFMUo3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jun 2022 16:44:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4649AD2
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 12:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655149932;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3FehfCE0FmStvB9RDJH63SZf+zvL5ZWVJ6jB+e7nj9o=;
        b=fMexOAJejbZuOws2GSw1y/4nI9x3/qnomuayCqwDoTSkB8aKrAey4FcpknZrb/NT7UD+G5
        6Tt/QSWFKDbu70x7Q6WCxZsPjfHzO7kCZb8iKahkewQkYEWCmXbuziAS9sHsG3eIBVOQTt
        j5ynqZfyrEP7DZa0RCorklK4pLva4fI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-1gnqeKWpP0umZA1qfxnc0A-1; Mon, 13 Jun 2022 15:52:07 -0400
X-MC-Unique: 1gnqeKWpP0umZA1qfxnc0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81033185A7B2;
        Mon, 13 Jun 2022 19:52:06 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 026482166B26;
        Mon, 13 Jun 2022 19:52:03 +0000 (UTC)
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
Subject: [PATCH 15/40] media: atomisp: drop hmm_page_type
Date:   Mon, 13 Jun 2022 21:51:12 +0200
Message-Id: <20220613195137.8117-16-hdegoede@redhat.com>
In-Reply-To: <20220613195137.8117-1-hdegoede@redhat.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since the hmm-pool code has been removed this now always gets set
to HMM_PAGE_TYPE_GENERAL, so just remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/include/hmm/hmm_bo.h        |  7 ----
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 42 +++++++------------
 2 files changed, 15 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index b9bae51e3814..1e9ccfd64c00 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -81,12 +81,6 @@ enum hmm_bo_type {
 	HMM_BO_LAST,
 };
 
-enum hmm_page_type {
-	HMM_PAGE_TYPE_RESERVED,
-	HMM_PAGE_TYPE_DYNAMIC,
-	HMM_PAGE_TYPE_GENERAL,
-};
-
 #define	HMM_BO_MASK		0x1
 #define	HMM_BO_FREE		0x0
 #define	HMM_BO_ALLOCED	0x1
@@ -123,7 +117,6 @@ struct hmm_bo_device {
 
 struct hmm_page_object {
 	struct page		*page;
-	enum hmm_page_type	type;
 };
 
 struct hmm_buffer_object {
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 0118c0b5acc8..1f0e62182fa3 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -631,32 +631,22 @@ static void free_private_bo_pages(struct hmm_buffer_object *bo,
 	int i, ret;
 
 	for (i = 0; i < free_pgnr; i++) {
-		switch (bo->page_obj[i].type) {
-		case HMM_PAGE_TYPE_RESERVED:
-			break;
-		case HMM_PAGE_TYPE_DYNAMIC:
-		case HMM_PAGE_TYPE_GENERAL:
-		default:
-			ret = set_pages_wb(bo->page_obj[i].page, 1);
-			if (ret)
-				dev_err(atomisp_dev,
-					"set page to WB err ...ret = %d\n",
-					ret);
-			/*
-			W/A: set_pages_wb seldom return value = -EFAULT
-			indicate that address of page is not in valid
-			range(0xffff880000000000~0xffffc7ffffffffff)
-			then, _free_pages would panic; Do not know why page
-			address be valid,it maybe memory corruption by lowmemory
-			*/
-			if (!ret) {
-				__free_pages(bo->page_obj[i].page, 0);
-			}
-			break;
+		ret = set_pages_wb(bo->page_obj[i].page, 1);
+		if (ret)
+			dev_err(atomisp_dev,
+				"set page to WB err ...ret = %d\n",
+				ret);
+		/*
+		W/A: set_pages_wb seldom return value = -EFAULT
+		indicate that address of page is not in valid
+		range(0xffff880000000000~0xffffc7ffffffffff)
+		then, _free_pages would panic; Do not know why page
+		address be valid,it maybe memory corruption by lowmemory
+		*/
+		if (!ret) {
+			__free_pages(bo->page_obj[i].page, 0);
 		}
 	}
-
-	return;
 }
 
 /*Allocate pages which will be used only by ISP*/
@@ -755,9 +745,8 @@ static int alloc_private_pages(struct hmm_buffer_object *bo,
 				}
 			}
 
-			for (j = 0; j < blk_pgnr; j++) {
+			for (j = 0; j < blk_pgnr; j++, i++) {
 				bo->page_obj[i].page = pages + j;
-				bo->page_obj[i++].type = HMM_PAGE_TYPE_GENERAL;
 			}
 
 			pgnr -= blk_pgnr;
@@ -878,7 +867,6 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
 
 	for (i = 0; i < bo->pgnr; i++) {
 		bo->page_obj[i].page = pages[i];
-		bo->page_obj[i].type = HMM_PAGE_TYPE_GENERAL;
 	}
 
 	return 0;
-- 
2.36.0

