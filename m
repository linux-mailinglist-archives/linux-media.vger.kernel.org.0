Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED82E54D30B
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347689AbiFOUvR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347483AbiFOUvK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:51:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C69D454FB9
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326267;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fNKCHXxh0ApgUWy6T4ai9o5kaksCWp7cawZyNl8Sbck=;
        b=bN9NprkUGd8WjI77F4wD9hN/UD5KH8yIuf5R39uRP3gLENJJ3o+iHWgYwtUnCdfNncXhN8
        NYTqWfAqph0PGXdrt0HTujdLbH2yPeqgr6yZltbSaOr8aNb7WnrtpvCBrBzuF8OMLEp6kp
        Gv/zYw+a4UbaYByxJg+y4vDQsxJDaQE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-yJf2rahfMHue54kerB9Avw-1; Wed, 15 Jun 2022 16:51:02 -0400
X-MC-Unique: yJf2rahfMHue54kerB9Avw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA633811E76;
        Wed, 15 Jun 2022 20:51:01 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4A58C18EA9;
        Wed, 15 Jun 2022 20:51:00 +0000 (UTC)
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
Subject: [PATCH v2 12/40] media: atomisp: remove hmm_mem_stats
Date:   Wed, 15 Jun 2022 22:50:09 +0200
Message-Id: <20220615205037.16549-13-hdegoede@redhat.com>
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

Without pool support the (optional) debug logging done by these is
not really meaningful, drop it all.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/include/hmm/hmm.h   |  8 -----
 .../media/atomisp/include/hmm/hmm_common.h    | 26 --------------
 .../staging/media/atomisp/pci/atomisp_drvfs.c |  7 +---
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  1 -
 drivers/staging/media/atomisp/pci/hmm/hmm.c   | 36 -------------------
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    |  6 ----
 6 files changed, 1 insertion(+), 83 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index 90d442fef4e8..5d72e2baa1f2 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -87,14 +87,6 @@ ia_css_ptr hmm_host_vaddr_to_hrt_vaddr(const void *ptr);
  */
 int hmm_mmap(struct vm_area_struct *vma, ia_css_ptr virt);
 
-/* show memory statistic
- */
-void hmm_show_mem_stat(const char *func, const int line);
-
-/* init memory statistic
- */
-void hmm_init_mem_stat(int res_pgnr, int dyc_en, int dyc_pgnr);
-
 extern bool dypool_enable;
 extern unsigned int dypool_pgnr;
 extern struct hmm_bo_device bo_device;
diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_common.h b/drivers/staging/media/atomisp/include/hmm/hmm_common.h
index 7152e9b52ba4..d8610b135de0 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_common.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_common.h
@@ -68,30 +68,4 @@
 #define	check_null_return_void(ptr, fmt, arg ...)	\
 		var_equal_return_void(ptr, NULL, fmt, ## arg)
 
-/* hmm_mem_stat is used to trace the hmm mem used by ISP pipe. The unit is page
- * number.
- *
- * res_size:  reserved mem pool size, being allocated from system at system boot time.
- *		res_size >= res_cnt.
- * sys_size:  system mem pool size, being allocated from system at camera running time.
- *		dyc_size:  dynamic mem pool size.
- *		dyc_thr:   dynamic mem pool high watermark.
- *		dyc_size <= dyc_thr.
- * usr_size:  user ptr mem size.
- *
- * res_cnt:   track the mem allocated from reserved pool at camera running time.
- * tol_cnt:   track the total mem used by ISP pipe at camera running time.
- */
-struct _hmm_mem_stat {
-	int res_size;
-	int sys_size;
-	int dyc_size;
-	int dyc_thr;
-	int usr_size;
-	int res_cnt;
-	int tol_cnt;
-};
-
-extern struct _hmm_mem_stat hmm_mem_stat;
-
 #endif
diff --git a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
index dcb571f515a7..3ddc935ec01d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
@@ -45,10 +45,8 @@ struct _iunit_debug {
 
 #define OPTION_BIN_LIST			BIT(0)
 #define OPTION_BIN_RUN			BIT(1)
-#define OPTION_MEM_STAT			BIT(2)
 #define OPTION_VALID			(OPTION_BIN_LIST \
-					| OPTION_BIN_RUN \
-					| OPTION_MEM_STAT)
+					| OPTION_BIN_RUN)
 
 static struct _iunit_debug iunit_debug = {
 	.dbglvl = 0,
@@ -81,9 +79,6 @@ static inline int iunit_dump_dbgopt(struct atomisp_device *isp,
 				goto opt_err;
 			}
 		}
-
-		if (opt & OPTION_MEM_STAT)
-			hmm_show_mem_stat(__func__, __LINE__);
 	} else {
 		ret = -EINVAL;
 		dev_err(isp->dev, "%s dump nothing[ret=%d]\n", __func__, ret);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 3fd0c526193f..0ec3f5b98ae1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1770,7 +1770,6 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_allow(&pdev->dev);
 
-	hmm_init_mem_stat(repool_pgnr, dypool_enable, dypool_pgnr);
 	/* Init ISP memory management */
 	hmm_init();
 
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index c623ab6952de..03e6d766381f 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -38,7 +38,6 @@
 struct hmm_bo_device bo_device;
 static ia_css_ptr dummy_ptr = mmgr_EXCEPTION;
 static bool hmm_initialized;
-struct _hmm_mem_stat hmm_mem_stat;
 
 /*
  * p: private
@@ -209,8 +208,6 @@ ia_css_ptr hmm_alloc(size_t bytes, enum hmm_bo_type type,
 		goto bind_err;
 	}
 
-	hmm_mem_stat.tol_cnt += pgnr;
-
 	if (attrs & ATOMISP_MAP_FLAG_CLEARED)
 		hmm_set(bo->start, 0, bytes);
 
@@ -246,8 +243,6 @@ void hmm_free(ia_css_ptr virt)
 		return;
 	}
 
-	hmm_mem_stat.tol_cnt -= bo->pgnr;
-
 	hmm_bo_unbind(bo);
 	hmm_bo_free_pages(bo);
 	hmm_bo_unref(bo);
@@ -627,34 +622,3 @@ ia_css_ptr hmm_host_vaddr_to_hrt_vaddr(const void *ptr)
 		ptr);
 	return 0;
 }
-
-void hmm_show_mem_stat(const char *func, const int line)
-{
-	pr_info("tol_cnt=%d usr_size=%d res_size=%d res_cnt=%d sys_size=%d  dyc_thr=%d dyc_size=%d.\n",
-		hmm_mem_stat.tol_cnt,
-		hmm_mem_stat.usr_size, hmm_mem_stat.res_size,
-		hmm_mem_stat.res_cnt, hmm_mem_stat.sys_size,
-		hmm_mem_stat.dyc_thr, hmm_mem_stat.dyc_size);
-}
-
-void hmm_init_mem_stat(int res_pgnr, int dyc_en, int dyc_pgnr)
-{
-	hmm_mem_stat.res_size = res_pgnr;
-	/* If reserved mem pool is not enabled, set its "mem stat" values as -1. */
-	if (hmm_mem_stat.res_size == 0) {
-		hmm_mem_stat.res_size = -1;
-		hmm_mem_stat.res_cnt = -1;
-	}
-
-	/* If dynamic memory pool is not enabled, set its "mem stat" values as -1. */
-	if (!dyc_en) {
-		hmm_mem_stat.dyc_size = -1;
-		hmm_mem_stat.dyc_thr = -1;
-	} else {
-		hmm_mem_stat.dyc_size = 0;
-		hmm_mem_stat.dyc_thr = dyc_pgnr;
-	}
-	hmm_mem_stat.usr_size = 0;
-	hmm_mem_stat.sys_size = 0;
-	hmm_mem_stat.tol_cnt = 0;
-}
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index d44117c0f5e7..0118c0b5acc8 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -651,7 +651,6 @@ static void free_private_bo_pages(struct hmm_buffer_object *bo,
 			*/
 			if (!ret) {
 				__free_pages(bo->page_obj[i].page, 0);
-				hmm_mem_stat.sys_size--;
 			}
 			break;
 		}
@@ -762,7 +761,6 @@ static int alloc_private_pages(struct hmm_buffer_object *bo,
 			}
 
 			pgnr -= blk_pgnr;
-			hmm_mem_stat.sys_size += blk_pgnr;
 
 			/*
 			 * if order is not reduced this time, clear
@@ -796,8 +794,6 @@ static void free_user_pages(struct hmm_buffer_object *bo,
 {
 	int i;
 
-	hmm_mem_stat.usr_size -= bo->pgnr;
-
 	if (bo->mem_type == HMM_BO_MEM_TYPE_PFN) {
 		unpin_user_pages(bo->pages, page_nr);
 	} else {
@@ -870,8 +866,6 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
 		bo->pgnr,
 		bo->mem_type == HMM_BO_MEM_TYPE_USER ? "user" : "pfn", page_nr);
 
-	hmm_mem_stat.usr_size += bo->pgnr;
-
 	/* can be written by caller, not forced */
 	if (page_nr != bo->pgnr) {
 		dev_err(atomisp_dev,
-- 
2.36.0

