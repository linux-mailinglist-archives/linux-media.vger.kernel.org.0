Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FDAD6316EC
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 23:43:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbiKTWnP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 17:43:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbiKTWnM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 17:43:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76D3F24BFA
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668984096;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u/x3PFgdz/16MrezvanGWPD0A/kjWCqAmvp6KnIUi1Q=;
        b=iU3uDOHDxlyyeECeXBb1ZP6djwrSpRp2pzKSSZmWObeX5t7vOHgVYEFTDWPWf9eSkvwIF9
        hGqDw40hNd0xD/oTXO8VGGELD66lmOVcmwkFmZNvSAcjC13n2lhaaVPcr1IRRnVd9cN42m
        2YS12x8AOZZHB2zQDwMpr1jS5HYFmtc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-HnDXOpPCNmq-uoAiVhWjkg-1; Sun, 20 Nov 2022 17:41:32 -0500
X-MC-Unique: HnDXOpPCNmq-uoAiVhWjkg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE09B85A588;
        Sun, 20 Nov 2022 22:41:31 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.70])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 517D947505E;
        Sun, 20 Nov 2022 22:41:30 +0000 (UTC)
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
Subject: [PATCH 12/20] media: atomisp: Remove atomisp_mrfld_power_down()/_up()
Date:   Sun, 20 Nov 2022 23:40:53 +0100
Message-Id: <20221120224101.746199-13-hdegoede@redhat.com>
In-Reply-To: <20221120224101.746199-1-hdegoede@redhat.com>
References: <20221120224101.746199-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,TVD_SUBJ_WIPE_DEBT
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

atomisp_mrfld_power_down()/_up() are unnecessary wrappers around
atomisp_mrfld_power() remove them and just call atomisp_mrfld_power()
directly.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 22 +++++--------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index d7fb700252fa..f009a1bfd3ea 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -724,18 +724,6 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 	return -EBUSY;
 }
 
-/* Workaround for pmu_nc_set_power_state not ready in MRFLD */
-static int atomisp_mrfld_power_down(struct atomisp_device *isp)
-{
-	return atomisp_mrfld_power(isp, false);
-}
-
-/* Workaround for pmu_nc_set_power_state not ready in MRFLD */
-static int atomisp_mrfld_power_up(struct atomisp_device *isp)
-{
-	return atomisp_mrfld_power(isp, true);
-}
-
 int atomisp_runtime_suspend(struct device *dev)
 {
 	struct atomisp_device *isp = (struct atomisp_device *)
@@ -751,7 +739,7 @@ int atomisp_runtime_suspend(struct device *dev)
 	if (ret)
 		return ret;
 	cpu_latency_qos_update_request(&isp->pm_qos, PM_QOS_DEFAULT_VALUE);
-	return atomisp_mrfld_power_down(isp);
+	return atomisp_mrfld_power(isp, false);
 }
 
 int atomisp_runtime_resume(struct device *dev)
@@ -760,7 +748,7 @@ int atomisp_runtime_resume(struct device *dev)
 				     dev_get_drvdata(dev);
 	int ret;
 
-	ret = atomisp_mrfld_power_up(isp);
+	ret = atomisp_mrfld_power(isp, true);
 	if (ret)
 		return ret;
 
@@ -817,7 +805,7 @@ static int __maybe_unused atomisp_suspend(struct device *dev)
 		return ret;
 	}
 	cpu_latency_qos_update_request(&isp->pm_qos, PM_QOS_DEFAULT_VALUE);
-	return atomisp_mrfld_power_down(isp);
+	return atomisp_mrfld_power(isp, false);
 }
 
 static int __maybe_unused atomisp_resume(struct device *dev)
@@ -826,7 +814,7 @@ static int __maybe_unused atomisp_resume(struct device *dev)
 				     dev_get_drvdata(dev);
 	int ret;
 
-	ret = atomisp_mrfld_power_up(isp);
+	ret = atomisp_mrfld_power(isp, true);
 	if (ret)
 		return ret;
 
@@ -1726,7 +1714,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	atomisp_ospm_dphy_down(isp);
 
 	/* Address later when we worry about the ...field chips */
-	if (IS_ENABLED(CONFIG_PM) && atomisp_mrfld_power_down(isp))
+	if (IS_ENABLED(CONFIG_PM) && atomisp_mrfld_power(isp, false))
 		dev_err(&pdev->dev, "Failed to switch off ISP\n");
 
 atomisp_dev_alloc_fail:
-- 
2.38.1

