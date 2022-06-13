Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9D0549FC7
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 22:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242581AbiFMUpj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jun 2022 16:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241675AbiFMUoa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jun 2022 16:44:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 221F765F5
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 12:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655149935;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yYGBrmsEJUUpUNbrWNnqYw/ljeF1Y0Mh+kfLONclQY0=;
        b=KKN/WG6sIKLJUe1oAM378kHQfB4F8L7bqoTjeOC9MvNAr1MK22OQVO78/YYdhrPWxb5Ntp
        lcIG2CxFuTocppW/FwrWB8fpnJWP+OGY2bxn1YBmfhzerEpKq7nnCrQaX5ZHK5ffnJ1N9J
        4eoRaEkDfVaXqOrdo6q4R/a+i4rFqb4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-ojusWLgHMzigVaTua4HuaQ-1; Mon, 13 Jun 2022 15:52:09 -0400
X-MC-Unique: ojusWLgHMzigVaTua4HuaQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F459811E76;
        Mon, 13 Jun 2022 19:52:08 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BB2AD2166B26;
        Mon, 13 Jun 2022 19:52:06 +0000 (UTC)
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
Subject: [PATCH 16/40] media: atomisp: removed unused hmm_bo_get_page_info() function
Date:   Mon, 13 Jun 2022 21:51:13 +0200
Message-Id: <20220613195137.8117-17-hdegoede@redhat.com>
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

hmm_bo_get_page_info() is not used anywhere, remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/include/hmm/hmm_bo.h        |  6 -----
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 26 -------------------
 2 files changed, 32 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index 1e9ccfd64c00..eba1ddcb7e64 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -232,12 +232,6 @@ int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
 void hmm_bo_free_pages(struct hmm_buffer_object *bo);
 int hmm_bo_page_allocated(struct hmm_buffer_object *bo);
 
-/*
- * get physical page info of the bo.
- */
-int hmm_bo_get_page_info(struct hmm_buffer_object *bo,
-			 struct hmm_page_object **page_obj, int *pgnr);
-
 /*
  * bind/unbind the physical pages to a virtual address space.
  */
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 1f0e62182fa3..72124a38c756 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -975,32 +975,6 @@ int hmm_bo_page_allocated(struct hmm_buffer_object *bo)
 	return bo->status & HMM_BO_PAGE_ALLOCED;
 }
 
-/*
- * get physical page info of the bo.
- */
-int hmm_bo_get_page_info(struct hmm_buffer_object *bo,
-			 struct hmm_page_object **page_obj, int *pgnr)
-{
-	check_bo_null_return(bo, -EINVAL);
-
-	mutex_lock(&bo->mutex);
-
-	check_bo_status_yes_goto(bo, HMM_BO_PAGE_ALLOCED, status_err);
-
-	*page_obj = bo->page_obj;
-	*pgnr = bo->pgnr;
-
-	mutex_unlock(&bo->mutex);
-
-	return 0;
-
-status_err:
-	dev_err(atomisp_dev,
-		"buffer object not page allocated yet.\n");
-	mutex_unlock(&bo->mutex);
-	return -EINVAL;
-}
-
 /*
  * bind the physical pages to a virtual address space.
  */
-- 
2.36.0

