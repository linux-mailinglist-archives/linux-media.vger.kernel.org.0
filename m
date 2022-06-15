Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 968BD54D301
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347891AbiFOUvb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347869AbiFOUv3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:51:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9A86E54FB8
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326287;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IdYDnnYjKZwWpgB3PYvBiwWd/Kdb3MLjTfVgKgYm8C0=;
        b=TQgy/OfiZfQj2ybxZtE4KT9SvUT9v43eW7pW+oYJ3qTAVxIgBO/X2wNMfBv7ycGGHIFxgC
        94KK+l0ApDlBhAwJvysarOwfpu4DxcEDyh++81OQSNaB9H+gtQrSSKz3fVAg5nikNqur2L
        DKl2sTDocV1mSnF53bNnfFuz5L4Ebp8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-9ADWOdhiN8CvGXqlZWG4uA-1; Wed, 15 Jun 2022 16:51:26 -0400
X-MC-Unique: 9ADWOdhiN8CvGXqlZWG4uA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E89CF10115F4;
        Wed, 15 Jun 2022 20:51:25 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 555F31678F;
        Wed, 15 Jun 2022 20:51:24 +0000 (UTC)
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
Subject: [PATCH v2 25/40] media: atomisp: drop ATOMISP_MAP_FLAG_CLEARED
Date:   Wed, 15 Jun 2022 22:50:22 +0200
Message-Id: <20220615205037.16549-26-hdegoede@redhat.com>
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

This flag is only used by one hmm_alloc() caller, drop it and make
the caller call hmm_set(ptr, 0, size) itself to do the clearing.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/include/linux/atomisp.h      |  1 -
 drivers/staging/media/atomisp/pci/hmm/hmm.c    |  3 ---
 .../staging/media/atomisp/pci/sh_css_params.c  | 18 ++++++++++--------
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index 99348f677fa4..752c09e64a5d 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -827,7 +827,6 @@ struct atomisp_s_runmode {
 
 #define ATOMISP_MAP_FLAG_NOFLUSH	0x0001	/* Do not flush cache */
 #define ATOMISP_MAP_FLAG_CACHED		0x0002	/* Enable cache */
-#define ATOMISP_MAP_FLAG_CLEARED	0x0004
 
 struct atomisp_update_exposure {
 	unsigned int gain;
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 03e6d766381f..5fd29dbab9cd 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -208,9 +208,6 @@ ia_css_ptr hmm_alloc(size_t bytes, enum hmm_bo_type type,
 		goto bind_err;
 	}
 
-	if (attrs & ATOMISP_MAP_FLAG_CLEARED)
-		hmm_set(bo->start, 0, bytes);
-
 	dev_dbg(atomisp_dev,
 		"%s: pages: 0x%08x (%zu bytes), type: %d from highmem %d, user ptr %p, cached %d\n",
 		__func__, bo->start, bytes, type, from_highmem, userptr, cached);
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 84ee39830d76..f7aa5d589a86 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -2587,13 +2587,11 @@ sh_css_params_init(void)
 			xmem_sp_stage_ptrs[p][i] =
 			ia_css_refcount_increment(-1,
 						  hmm_alloc(sizeof(struct sh_css_sp_stage),
-							    HMM_BO_PRIVATE, 0, NULL,
-							    ATOMISP_MAP_FLAG_CLEARED));
+							    HMM_BO_PRIVATE, 0, NULL, 0));
 			xmem_isp_stage_ptrs[p][i] =
 			ia_css_refcount_increment(-1,
 						  hmm_alloc(sizeof(struct sh_css_sp_stage),
-							    HMM_BO_PRIVATE, 0, NULL,
-							    ATOMISP_MAP_FLAG_CLEARED));
+							    HMM_BO_PRIVATE, 0, NULL, 0));
 
 			if ((xmem_sp_stage_ptrs[p][i] == mmgr_NULL) ||
 			    (xmem_isp_stage_ptrs[p][i] == mmgr_NULL)) {
@@ -2601,6 +2599,9 @@ sh_css_params_init(void)
 				IA_CSS_LEAVE_ERR_PRIVATE(-ENOMEM);
 				return -ENOMEM;
 			}
+
+			hmm_set(xmem_sp_stage_ptrs[p][i], 0, sizeof(struct sh_css_sp_stage));
+			hmm_set(xmem_isp_stage_ptrs[p][i], 0, sizeof(struct sh_css_sp_stage));
 		}
 	}
 
@@ -2612,12 +2613,10 @@ sh_css_params_init(void)
 	sp_ddr_ptrs = ia_css_refcount_increment(-1,
 						hmm_alloc(CEIL_MUL(sizeof(struct sh_css_ddr_address_map),
 								   HIVE_ISP_DDR_WORD_BYTES),
-							  HMM_BO_PRIVATE, 0, NULL,
-							  ATOMISP_MAP_FLAG_CLEARED));
+							  HMM_BO_PRIVATE, 0, NULL, 0));
 	xmem_sp_group_ptrs = ia_css_refcount_increment(-1,
 						       hmm_alloc(sizeof(struct sh_css_sp_group),
-								 HMM_BO_PRIVATE, 0, NULL,
-								 ATOMISP_MAP_FLAG_CLEARED));
+								 HMM_BO_PRIVATE, 0, NULL, 0));
 
 	if ((sp_ddr_ptrs == mmgr_NULL) ||
 	    (xmem_sp_group_ptrs == mmgr_NULL)) {
@@ -2625,6 +2624,9 @@ sh_css_params_init(void)
 		IA_CSS_LEAVE_ERR_PRIVATE(-ENOMEM);
 		return -ENOMEM;
 	}
+	hmm_set(sp_ddr_ptrs, 0, CEIL_MUL(sizeof(struct sh_css_ddr_address_map),
+					 HIVE_ISP_DDR_WORD_BYTES));
+	hmm_set(xmem_sp_group_ptrs, 0, sizeof(struct sh_css_sp_group));
 	IA_CSS_LEAVE_ERR_PRIVATE(0);
 	return 0;
 }
-- 
2.36.0

