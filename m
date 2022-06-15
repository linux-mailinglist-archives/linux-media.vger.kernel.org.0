Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4056154D2F3
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347017AbiFOUvF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346713AbiFOUvD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:51:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E9A7354FBA
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326262;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NhqcL20ATpkNnWN0t51j/5ixk5yZJtiAjUQlYSVOb6s=;
        b=IEbL6dErn1XJaSx/DKkdgw67GBtfW1oqVm8rgeaIJMIGboAzgp/TsZ7pUeeXnelqaY1MlD
        CjSvi42lRcl5HZ2jEQLWwoiB2TcKQFl/cFHsbl8zeT8c0h5Zh/9NNRzQNBrLZW+J6Gur03
        8H7OAInAejuo2dpiqlzY5Kms1N843gM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-ruIwti6cMYWB5XwhwSJ_Sg-1; Wed, 15 Jun 2022 16:50:57 -0400
X-MC-Unique: ruIwti6cMYWB5XwhwSJ_Sg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B4AD1C1C1AA;
        Wed, 15 Jun 2022 20:50:56 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E7D2E111F5;
        Wed, 15 Jun 2022 20:50:54 +0000 (UTC)
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
Subject: [PATCH v2 09/40] media: atomisp: remove hmm_pool_[un]register()
Date:   Wed, 15 Jun 2022 22:50:06 +0200
Message-Id: <20220615205037.16549-10-hdegoede@redhat.com>
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

These are no-ops, so lets remove them.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/include/hmm/hmm.h   |  3 --
 .../staging/media/atomisp/pci/atomisp_fops.c  |  9 ----
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 10 -----
 drivers/staging/media/atomisp/pci/hmm/hmm.c   | 42 -------------------
 4 files changed, 64 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index b48bdf5c274c..067e0310d02b 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -32,9 +32,6 @@
 #define mmgr_NULL              ((ia_css_ptr)0)
 #define mmgr_EXCEPTION         ((ia_css_ptr) - 1)
 
-int hmm_pool_register(unsigned int pool_size, enum hmm_pool_type pool_type);
-void hmm_pool_unregister(enum hmm_pool_type pool_type);
-
 int hmm_init(void);
 void hmm_cleanup(void);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index be6a74d5ac19..e78d9364feb7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -865,12 +865,6 @@ static int atomisp_open(struct file *file)
 		goto error;
 	}
 
-	if (dypool_enable) {
-		ret = hmm_pool_register(dypool_pgnr, HMM_POOL_TYPE_DYNAMIC);
-		if (ret)
-			dev_err(isp->dev, "Failed to register dynamic memory pool.\n");
-	}
-
 	/* Init ISP */
 	if (atomisp_css_init(isp)) {
 		ret = -EINVAL;
@@ -910,7 +904,6 @@ static int atomisp_open(struct file *file)
 	atomisp_css_uninit(isp);
 	pm_runtime_put(vdev->v4l2_dev->dev);
 error:
-	hmm_pool_unregister(HMM_POOL_TYPE_DYNAMIC);
 	rt_mutex_unlock(&isp->mutex);
 	return ret;
 }
@@ -1032,8 +1025,6 @@ static int atomisp_release(struct file *file)
 		isp->css_env.isp_css_fw.bytes = 0;
 	}
 
-	hmm_pool_unregister(HMM_POOL_TYPE_DYNAMIC);
-
 	ret = v4l2_subdev_call(isp->flash, core, s_power, 0);
 	if (ret < 0 && ret != -ENODEV && ret != -ENOIOCTLCMD)
 		dev_warn(isp->dev, "Failed to power-off flash\n");
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 49ccfb1646da..3fd0c526193f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1771,12 +1771,6 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	pm_runtime_allow(&pdev->dev);
 
 	hmm_init_mem_stat(repool_pgnr, dypool_enable, dypool_pgnr);
-	err = hmm_pool_register(repool_pgnr, HMM_POOL_TYPE_RESERVED);
-	if (err) {
-		dev_err(&pdev->dev, "Failed to register reserved memory pool.\n");
-		goto hmm_pool_fail;
-	}
-
 	/* Init ISP memory management */
 	hmm_init();
 
@@ -1813,8 +1807,6 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	devm_free_irq(&pdev->dev, pdev->irq, isp);
 request_irq_fail:
 	hmm_cleanup();
-	hmm_pool_unregister(HMM_POOL_TYPE_RESERVED);
-hmm_pool_fail:
 	pm_runtime_get_noresume(&pdev->dev);
 	destroy_workqueue(isp->wdt_work_queue);
 wdt_work_queue_fail:
@@ -1885,8 +1877,6 @@ static void atomisp_pci_remove(struct pci_dev *pdev)
 	atomisp_file_input_cleanup(isp);
 
 	release_firmware(isp->firmware);
-
-	hmm_pool_unregister(HMM_POOL_TYPE_RESERVED);
 }
 
 static const struct pci_device_id atomisp_pci_tbl[] = {
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index a4722155ddef..f609e154d788 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -660,48 +660,6 @@ void hmm_vunmap(ia_css_ptr virt)
 	hmm_bo_vunmap(bo);
 }
 
-int hmm_pool_register(unsigned int pool_size, enum hmm_pool_type pool_type)
-{
-#if 0	// Just use the "normal" pool
-	switch (pool_type) {
-	case HMM_POOL_TYPE_RESERVED:
-		reserved_pool.pops = &reserved_pops;
-		return reserved_pool.pops->pool_init(&reserved_pool.pool_info,
-						     pool_size);
-	case HMM_POOL_TYPE_DYNAMIC:
-		dynamic_pool.pops = &dynamic_pops;
-		return dynamic_pool.pops->pool_init(&dynamic_pool.pool_info,
-						    pool_size);
-	default:
-		dev_err(atomisp_dev, "invalid pool type.\n");
-		return -EINVAL;
-	}
-#else
-	return 0;
-#endif
-}
-
-void hmm_pool_unregister(enum hmm_pool_type pool_type)
-{
-#if 0	// Just use the "normal" pool
-	switch (pool_type) {
-	case HMM_POOL_TYPE_RESERVED:
-		if (reserved_pool.pops && reserved_pool.pops->pool_exit)
-			reserved_pool.pops->pool_exit(&reserved_pool.pool_info);
-		break;
-	case HMM_POOL_TYPE_DYNAMIC:
-		if (dynamic_pool.pops && dynamic_pool.pops->pool_exit)
-			dynamic_pool.pops->pool_exit(&dynamic_pool.pool_info);
-		break;
-	default:
-		dev_err(atomisp_dev, "invalid pool type.\n");
-		break;
-	}
-#endif
-
-	return;
-}
-
 void *hmm_isp_vaddr_to_host_vaddr(ia_css_ptr ptr, bool cached)
 {
 	return hmm_vmap(ptr, cached);
-- 
2.36.0

