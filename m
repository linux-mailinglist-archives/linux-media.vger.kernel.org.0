Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 457B2677BBA
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:53:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231851AbjAWMxP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:53:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbjAWMxN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:53:13 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA8B10F2
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478347;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZOiLEgNt8V0MMRu99NAtZIsMApLnONu+A8O0onIE4TU=;
        b=axsI1vLZZoXjs7209N0Z+O0g7bLPV1FPaElK2EziadYUwznsgoytU0Sd4vAUwn4AL0QGEW
        Vx/6eNoxnqGrWtR3g6BN2tA0Fz5B9GL50RN/I54rfjzdXuweSMVm9tY6jwDb5lxDU4DbGp
        KPsnT0XRWmJCh3wunPzEyh0u0l1gPV8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-PGG4YroHOX-sT086sd5fZw-1; Mon, 23 Jan 2023 07:52:22 -0500
X-MC-Unique: PGG4YroHOX-sT086sd5fZw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD46218A6460;
        Mon, 23 Jan 2023 12:52:21 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6A70FC15BA0;
        Mon, 23 Jan 2023 12:52:19 +0000 (UTC)
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
Subject: [PATCH 04/57] media: atomisp: Move power-management over to a custom pm-domain
Date:   Mon, 23 Jan 2023 13:51:12 +0100
Message-Id: <20230123125205.622152-5-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The atomisp does not use standard PCI power-management through the
PCI config space. Instead this driver directly tells the P-Unit to
disable the ISP over the IOSF. The standard PCI subsystem pm_ops will
try to access the config space before (resume) / after (suspend) this
driver has turned the ISP on / off, resulting in the following errors:

 Unable to change power state from D0 to D3hot, device inaccessible
 Unable to change power state from D3cold to D0, device inaccessible

Getting logged into dmesg a whole bunch of time during boot as well as
every time the camera is used.

To avoid these errors use a custom pm_domain instead of standard driver
pm-callbacks so that all the PCI subsys suspend / resume handling is
skipped and call pci_save_state() / pci_restore_state() ourselves.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_internal.h      |  1 +
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 44 ++++++++++++++-----
 2 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 675007d7d9af..fa38d91420cf 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -210,6 +210,7 @@ struct atomisp_device {
 	void __iomem *base;
 	const struct firmware *firmware;
 
+	struct dev_pm_domain pm_domain;
 	struct pm_qos_request pm_qos;
 	s32 max_isr_latency;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index e786b81921da..e994a4a5284e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -19,6 +19,7 @@
  */
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_qos.h>
 #include <linux/timer.h>
@@ -524,7 +525,7 @@ static int atomisp_save_iunit_reg(struct atomisp_device *isp)
 	return 0;
 }
 
-static int __maybe_unused atomisp_restore_iunit_reg(struct atomisp_device *isp)
+static int atomisp_restore_iunit_reg(struct atomisp_device *isp)
 {
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
 
@@ -662,6 +663,7 @@ static void punit_ddr_dvfs_enable(bool enable)
 
 static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 {
+	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	unsigned long timeout;
 	u32 val = enable ? MRFLD_ISPSSPM0_IUNIT_POWER_ON :
 			   MRFLD_ISPSSPM0_IUNIT_POWER_OFF;
@@ -703,6 +705,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 		tmp = (tmp >> MRFLD_ISPSSPM0_ISPSSS_OFFSET) & MRFLD_ISPSSPM0_ISPSSC_MASK;
 		if (tmp == val) {
 			trace_ipu_cstate(enable);
+			pdev->current_state = enable ? PCI_D0 : PCI_D3cold;
 			return 0;
 		}
 
@@ -743,6 +746,7 @@ int atomisp_power_off(struct device *dev)
 	pci_write_config_dword(pdev, MRFLD_PCI_CSI_CONTROL, reg);
 
 	cpu_latency_qos_update_request(&isp->pm_qos, PM_QOS_DEFAULT_VALUE);
+	pci_save_state(pdev);
 	return atomisp_mrfld_power(isp, false);
 }
 
@@ -756,6 +760,7 @@ int atomisp_power_on(struct device *dev)
 	if (ret)
 		return ret;
 
+	pci_restore_state(to_pci_dev(dev));
 	cpu_latency_qos_update_request(&isp->pm_qos, isp->max_isr_latency);
 
 	/*restore register values for iUnit and iUnitPHY registers*/
@@ -767,7 +772,7 @@ int atomisp_power_on(struct device *dev)
 	return atomisp_css_init(isp);
 }
 
-static int __maybe_unused atomisp_suspend(struct device *dev)
+static int atomisp_suspend(struct device *dev)
 {
 	struct atomisp_device *isp = (struct atomisp_device *)
 				     dev_get_drvdata(dev);
@@ -790,10 +795,12 @@ static int __maybe_unused atomisp_suspend(struct device *dev)
 	}
 	spin_unlock_irqrestore(&isp->lock, flags);
 
+	pm_runtime_resume(dev);
+
 	return atomisp_power_off(dev);
 }
 
-static int __maybe_unused atomisp_resume(struct device *dev)
+static int atomisp_resume(struct device *dev)
 {
 	return atomisp_power_on(dev);
 }
@@ -1603,6 +1610,26 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	/* save the iunit context only once after all the values are init'ed. */
 	atomisp_save_iunit_reg(isp);
 
+	/*
+	 * The atomisp does not use standard PCI power-management through the
+	 * PCI config space. Instead this driver directly tells the P-Unit to
+	 * disable the ISP over the IOSF. The standard PCI subsystem pm_ops will
+	 * try to access the config space before (resume) / after (suspend) this
+	 * driver has turned the ISP on / off, resulting in the following errors:
+	 *
+	 * "Unable to change power state from D0 to D3hot, device inaccessible"
+	 * "Unable to change power state from D3cold to D0, device inaccessible"
+	 *
+	 * To avoid these errors override the pm_domain so that all the PCI
+	 * subsys suspend / resume handling is skipped.
+	 */
+	isp->pm_domain.ops.runtime_suspend = atomisp_power_off;
+	isp->pm_domain.ops.runtime_resume = atomisp_power_on;
+	isp->pm_domain.ops.suspend = atomisp_suspend;
+	isp->pm_domain.ops.resume = atomisp_resume;
+
+	dev_pm_domain_set(&pdev->dev, &isp->pm_domain);
+
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_allow(&pdev->dev);
 
@@ -1645,6 +1672,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 request_irq_fail:
 	hmm_cleanup();
 	pm_runtime_get_noresume(&pdev->dev);
+	dev_pm_domain_set(&pdev->dev, NULL);
 	atomisp_unregister_entities(isp);
 register_entities_fail:
 	atomisp_uninitialize_modules(isp);
@@ -1697,6 +1725,7 @@ static void atomisp_pci_remove(struct pci_dev *pdev)
 
 	pm_runtime_forbid(&pdev->dev);
 	pm_runtime_get_noresume(&pdev->dev);
+	dev_pm_domain_set(&pdev->dev, NULL);
 	cpu_latency_qos_remove_request(&isp->pm_qos);
 
 	atomisp_msi_irq_uninit(isp);
@@ -1721,17 +1750,8 @@ static const struct pci_device_id atomisp_pci_tbl[] = {
 
 MODULE_DEVICE_TABLE(pci, atomisp_pci_tbl);
 
-static const struct dev_pm_ops atomisp_pm_ops = {
-	.runtime_suspend = atomisp_power_off,
-	.runtime_resume = atomisp_power_on,
-	.suspend = atomisp_suspend,
-	.resume = atomisp_resume,
-};
 
 static struct pci_driver atomisp_pci_driver = {
-	.driver = {
-		.pm = &atomisp_pm_ops,
-	},
 	.name = "atomisp-isp2",
 	.id_table = atomisp_pci_tbl,
 	.probe = atomisp_pci_probe,
-- 
2.39.0

