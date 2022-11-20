Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DDF26316EF
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 23:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbiKTWnX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 17:43:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbiKTWnM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 17:43:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06E8924F3E
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668984101;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LcxYMmqa9JOQ4v9gp9mtmfp5xuK6AjWkfCwozPHsc5o=;
        b=FaipC64FcWmNJf2N3yY2AKwF1Cm3fhjwSSg64NQ7VIOtoXZmW2OcPgJnB790J9P8+7pgfH
        GyHyaMyL91ENvdZh9yH5V8jycodRVrEIRaqFjzWaLCdnDMvBgQAYvnwAy2DvXUBT8CCnsR
        09WSDNQ+nYnvGsNIwp0KHBvd4qaCutk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-IcuL8E8gMaC0toPygrZKdQ-1; Sun, 20 Nov 2022 17:41:35 -0500
X-MC-Unique: IcuL8E8gMaC0toPygrZKdQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BBF92999B2D;
        Sun, 20 Nov 2022 22:41:35 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.70])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AAE9A47505E;
        Sun, 20 Nov 2022 22:41:33 +0000 (UTC)
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
Subject: [PATCH 14/20] media: atomisp: Remove atomisp_css_suspend()/_resume()
Date:   Sun, 20 Nov 2022 23:40:55 +0100
Message-Id: <20221120224101.746199-15-hdegoede@redhat.com>
In-Reply-To: <20221120224101.746199-1-hdegoede@redhat.com>
References: <20221120224101.746199-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

atomisp_css_suspend() is a 1:1 copy of atomisp_css_uninit() and
atomisp_css_resume() is a 1:1 copy of atomisp_css_init().

Remove the 2 copies and have their one caller just call
atomisp_css_uninit() / atomisp_css_init() instead.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  4 +--
 .../media/atomisp/pci/atomisp_compat.h        |  4 ---
 .../media/atomisp/pci/atomisp_compat_css20.c  | 29 -------------------
 3 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index c69a646aa4d5..e80038e46e0e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -307,7 +307,7 @@ int atomisp_reset(struct atomisp_device *isp)
 	int ret = 0;
 
 	dev_dbg(isp->dev, "%s\n", __func__);
-	atomisp_css_suspend(isp);
+	atomisp_css_uninit(isp);
 	ret = atomisp_runtime_suspend(isp->dev);
 	if (ret < 0)
 		dev_err(isp->dev, "atomisp_runtime_suspend failed, %d\n", ret);
@@ -316,7 +316,7 @@ int atomisp_reset(struct atomisp_device *isp)
 	if (ret < 0)
 		dev_err(isp->dev, "atomisp_runtime_resume failed, %d\n", ret);
 
-	ret = atomisp_css_resume(isp);
+	ret = atomisp_css_init(isp);
 	if (ret)
 		isp->isp_fatal_error = true;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat.h b/drivers/staging/media/atomisp/pci/atomisp_compat.h
index f73801197dd7..7316eb9f974a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat.h
@@ -41,10 +41,6 @@ int atomisp_css_init(struct atomisp_device *isp);
 
 void atomisp_css_uninit(struct atomisp_device *isp);
 
-void atomisp_css_suspend(struct atomisp_device *isp);
-
-int atomisp_css_resume(struct atomisp_device *isp);
-
 void atomisp_css_init_struct(struct atomisp_sub_device *asd);
 
 int atomisp_css_irq_translate(struct atomisp_device *isp,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 3237585d3044..9d6008659e02 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -868,35 +868,6 @@ void atomisp_css_uninit(struct atomisp_device *isp)
 	ia_css_uninit();
 }
 
-void atomisp_css_suspend(struct atomisp_device *isp)
-{
-	isp->css_initialized = false;
-	ia_css_uninit();
-}
-
-int atomisp_css_resume(struct atomisp_device *isp)
-{
-	unsigned int mmu_base_addr;
-	int ret;
-
-	ret = hmm_get_mmu_base_addr(isp->dev, &mmu_base_addr);
-	if (ret) {
-		dev_err(isp->dev, "get base address error.\n");
-		return -EINVAL;
-	}
-
-	ret = ia_css_init(isp->dev, &isp->css_env.isp_css_env, NULL,
-			  mmu_base_addr, IA_CSS_IRQ_TYPE_PULSE);
-	if (ret) {
-		dev_err(isp->dev, "re-init css failed.\n");
-		return -EINVAL;
-	}
-	ia_css_enable_isys_event_queue(true);
-
-	isp->css_initialized = true;
-	return 0;
-}
-
 int atomisp_css_irq_translate(struct atomisp_device *isp,
 			      unsigned int *infos)
 {
-- 
2.38.1

