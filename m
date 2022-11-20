Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 629166316F3
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 23:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbiKTWoA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 17:44:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiKTWn7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 17:43:59 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17E0225286
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668984103;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sb2hyytH28hqJKy6Q8eTe0ytgNivgpFlz8aL/4DglRo=;
        b=Z+OETODnugdLTnjBjWmMGWptjBcrZfPUiJZCLrKMVL2En7nd0DxqrZwfh7HVyHgjKISMS/
        i8Og2y6wxXDRv7ybfRTRDWELGkT/EL0KutucR0ZsyrY4HHE2aJ/cpY1ri8LCKUFLOj5JUQ
        3JS+fHzBcmPXzqByujEZs8KxVCt/LRg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-C3DGdYmtPL2qGy6yhFudfQ-1; Sun, 20 Nov 2022 17:41:39 -0500
X-MC-Unique: C3DGdYmtPL2qGy6yhFudfQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81C3B833A09;
        Sun, 20 Nov 2022 22:41:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.70])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 11B9647505E;
        Sun, 20 Nov 2022 22:41:36 +0000 (UTC)
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
Subject: [PATCH 16/20] media: atomisp: Remove duplication between runtime-pm and normal-pm code
Date:   Sun, 20 Nov 2022 23:40:57 +0100
Message-Id: <20221120224101.746199-17-hdegoede@redhat.com>
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

atomisp_suspend() contains a 1:1 copy of atomisp_runtime_suspend() and
the same goes for the resume() functions.

Rename the runtime functions to atomisp_power_on()/_off() and use these
as runtime-pm handlers as well as helper in other places to remove
the code duplication.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  8 ++--
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  4 +-
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 46 +++----------------
 3 files changed, 12 insertions(+), 46 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 475ba82b858b..dac19db55625 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -303,13 +303,13 @@ int atomisp_reset(struct atomisp_device *isp)
 
 	dev_dbg(isp->dev, "%s\n", __func__);
 	atomisp_css_uninit(isp);
-	ret = atomisp_runtime_suspend(isp->dev);
+	ret = atomisp_power_off(isp->dev);
 	if (ret < 0)
-		dev_err(isp->dev, "atomisp_runtime_suspend failed, %d\n", ret);
+		dev_err(isp->dev, "atomisp_power_off failed, %d\n", ret);
 
-	ret = atomisp_runtime_resume(isp->dev);
+	ret = atomisp_power_on(isp->dev);
 	if (ret < 0)
-		dev_err(isp->dev, "atomisp_runtime_resume failed, %d\n", ret);
+		dev_err(isp->dev, "atomisp_power_on failed, %d\n", ret);
 
 	ret = atomisp_css_init(isp);
 	if (ret)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index 61cbdc1215de..f7647edb25fb 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -341,6 +341,6 @@ int atomisp_inject_a_fake_event(struct atomisp_sub_device *asd, int *event);
 int atomisp_get_invalid_frame_num(struct video_device *vdev,
 				  int *invalid_frame_num);
 
-int atomisp_runtime_suspend(struct device *dev);
-int atomisp_runtime_resume(struct device *dev);
+int atomisp_power_off(struct device *dev);
+int atomisp_power_on(struct device *dev);
 #endif /* __ATOMISP_CMD_H__ */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 579cbf502fd1..f670517bc141 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -720,7 +720,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 	return -EBUSY;
 }
 
-int atomisp_runtime_suspend(struct device *dev)
+int atomisp_power_off(struct device *dev)
 {
 	struct atomisp_device *isp = (struct atomisp_device *)
 				     dev_get_drvdata(dev);
@@ -738,7 +738,7 @@ int atomisp_runtime_suspend(struct device *dev)
 	return atomisp_mrfld_power(isp, false);
 }
 
-int atomisp_runtime_resume(struct device *dev)
+int atomisp_power_on(struct device *dev)
 {
 	struct atomisp_device *isp = (struct atomisp_device *)
 				     dev_get_drvdata(dev);
@@ -771,7 +771,6 @@ static int __maybe_unused atomisp_suspend(struct device *dev)
 	/* FIXME: only has one isp_subdev at present */
 	struct atomisp_sub_device *asd = &isp->asd[0];
 	unsigned long flags;
-	int ret;
 
 	/*
 	 * FIXME: Suspend is not supported by sensors. Abort if any video
@@ -788,45 +787,12 @@ static int __maybe_unused atomisp_suspend(struct device *dev)
 	}
 	spin_unlock_irqrestore(&isp->lock, flags);
 
-	ret = atomisp_mrfld_pre_power_down(isp);
-	if (ret)
-		return ret;
-
-	/*Turn off the ISP d-phy */
-	ret = atomisp_ospm_dphy_down(isp);
-	if (ret) {
-		dev_err(isp->dev, "fail to power off ISP\n");
-		return ret;
-	}
-	cpu_latency_qos_update_request(&isp->pm_qos, PM_QOS_DEFAULT_VALUE);
-	return atomisp_mrfld_power(isp, false);
+	return atomisp_power_off(dev);
 }
 
 static int __maybe_unused atomisp_resume(struct device *dev)
 {
-	struct atomisp_device *isp = (struct atomisp_device *)
-				     dev_get_drvdata(dev);
-	int ret;
-
-	ret = atomisp_mrfld_power(isp, true);
-	if (ret)
-		return ret;
-
-	cpu_latency_qos_update_request(&isp->pm_qos, isp->max_isr_latency);
-
-	/*Turn on ISP d-phy */
-	ret = atomisp_ospm_dphy_up(isp);
-	if (ret) {
-		dev_err(isp->dev, "Failed to power up ISP!.\n");
-		return -EINVAL;
-	}
-
-	/*restore register values for iUnit and iUnitPHY registers*/
-	if (isp->saved_regs.pcicmdsts)
-		atomisp_restore_iunit_reg(isp);
-
-	atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_LOW, true);
-	return 0;
+	return atomisp_power_on(dev);
 }
 
 int atomisp_csi_lane_config(struct atomisp_device *isp)
@@ -1755,8 +1721,8 @@ static const struct pci_device_id atomisp_pci_tbl[] = {
 MODULE_DEVICE_TABLE(pci, atomisp_pci_tbl);
 
 static const struct dev_pm_ops atomisp_pm_ops = {
-	.runtime_suspend = atomisp_runtime_suspend,
-	.runtime_resume = atomisp_runtime_resume,
+	.runtime_suspend = atomisp_power_off,
+	.runtime_resume = atomisp_power_on,
 	.suspend = atomisp_suspend,
 	.resume = atomisp_resume,
 };
-- 
2.38.1

