Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F00B54D317
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347606AbiFOUvU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347795AbiFOUvR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:51:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4A09655214
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326273;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ApxeItTV/pUcoSPpJRQ+3smPLlej3mH0XRizPdTvcCs=;
        b=YjQFXIOGZwReJElTyH5zLDHdrFsVl5QSJ6iRupJ3RMWm7LssAxN9tiGLDGWdrH+uTusuMN
        egCXFNPCFO+IPJEKNggKK+MK13y1VrTGCKHUWwjSHHjzmf3+urn8UtjMrYyen8Y81+m6J8
        LlsWloC0uNqbZxGsEqR55V5VRp/oI8w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-tb9EkIITNIq6t0u0-gGdTg-1; Wed, 15 Jun 2022 16:51:10 -0400
X-MC-Unique: tb9EkIITNIq6t0u0-gGdTg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 719A1382ECC1;
        Wed, 15 Jun 2022 20:51:09 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D1D0618EA9;
        Wed, 15 Jun 2022 20:51:07 +0000 (UTC)
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
Subject: [PATCH v2 16/40] media: atomisp: removed unused hmm_bo_get_page_info() function
Date:   Wed, 15 Jun 2022 22:50:13 +0200
Message-Id: <20220615205037.16549-17-hdegoede@redhat.com>
In-Reply-To: <20220615205037.16549-1-hdegoede@redhat.com>
References: <20220615205037.16549-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
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

