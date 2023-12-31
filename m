Return-Path: <linux-media+bounces-3124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FBE820B08
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 11:31:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67472282108
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 10:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E8963A4;
	Sun, 31 Dec 2023 10:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CPcpLMSP"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1515033D5
	for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 10:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704018691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=50IKayWWLqHw5VuwhWK+OJNcSeKcRRhBGrNjS+iJJnw=;
	b=CPcpLMSPj+7U5fiE5536qFdH9EQpui6/9tiQn81tMblD7+1Hkqv1Zx06VO4M1nwLROpRbM
	q09rrxtEntfsxzEATjT72TDjm+HAJAObR9JiGa+ily0J4x8IJZ3g+6X75cEIW12Au7oCz+
	+zyepq64X1G0YiZNlr/T/KNI+NiG1GY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-ak6lnlX5Phuy7qLB1LNirw-1; Sun, 31 Dec 2023 05:31:25 -0500
X-MC-Unique: ak6lnlX5Phuy7qLB1LNirw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0E19832D1A;
	Sun, 31 Dec 2023 10:31:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A8FE492BC6;
	Sun, 31 Dec 2023 10:31:23 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 10/15] media: atomisp: Fix probe()/remove() power-management
Date: Sun, 31 Dec 2023 11:30:52 +0100
Message-ID: <20231231103057.35837-11-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-1-hdegoede@redhat.com>
References: <20231231103057.35837-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

Fix probe()/remove() power-management:

-Currently the driver uses pm_runtime_put_noidle() and relies on
 userspace to open + close the /dev/video# node at least once to
 actually turn the ISP off. Replace the pm_runtime_put_noidle()
 with pm_runtime_put_sync() to make sure that the device is turned
 off without relying on userspace for this.
 This also ensures that atomisp_css_init() is run (by atomisp_power_on())
 if the first userspace process opening /dev/video# wants to do more then
 just query the v4l2-caps.
 As part of this change move the pm setup code in probe() to just before
 calling v4l2_async_nf_register() which registers the /dev/* nodes, so
 that the device is left on for the entirety of the probe() function.

-Remove the turning off of the atomisp from the exit-error path,
 the PCI subsystem and subsequent probe() attempts expect the device
 to be in the on state when probe() fails.
 This also fixes the atomisp driver causing the system to hang / freeze
 when its firmware is missing. This freeze is caused by an unidentified
 bug in the power-off on exit-error code which is now removed.

-Make sure that remove() properly powers on the device by replacing
 pm_runtime_get_noresume() with pm_runtime_get_sync. The PCI subsystem
 and subsequent probe() attempts expect the device to be in the on state
 after unbinding the driver.

-Note this also swaps the order of put()/allow() and forbid()/get()
 so that the sync versions actually work by calling allow() before put()
 and forbid() after get()

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 98 +++++++------------
 1 file changed, 37 insertions(+), 61 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 7d99b53107b0..6e8c9add35f9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1200,7 +1200,6 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	struct atomisp_device *isp;
 	unsigned int start;
 	int err, val;
-	u32 irq;
 
 	/* Pointer to struct device. */
 	atomisp_dev = &pdev->dev;
@@ -1334,11 +1333,8 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 
 	/* Load isp firmware from user space */
 	isp->firmware = atomisp_load_firmware(isp);
-	if (!isp->firmware) {
-		err = -ENOENT;
-		dev_dbg(&pdev->dev, "Firmware load failed\n");
-		goto error_power_off;
-	}
+	if (!isp->firmware)
+		return -ENOENT;
 
 	err = sh_css_check_firmware_version(isp->dev, isp->firmware->data);
 	if (err) {
@@ -1420,30 +1416,6 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	/* save the iunit context only once after all the values are init'ed. */
 	atomisp_save_iunit_reg(isp);
 
-	/*
-	 * The atomisp does not use standard PCI power-management through the
-	 * PCI config space. Instead this driver directly tells the P-Unit to
-	 * disable the ISP over the IOSF. The standard PCI subsystem pm_ops will
-	 * try to access the config space before (resume) / after (suspend) this
-	 * driver has turned the ISP on / off, resulting in the following errors:
-	 *
-	 * "Unable to change power state from D0 to D3hot, device inaccessible"
-	 * "Unable to change power state from D3cold to D0, device inaccessible"
-	 *
-	 * To avoid these errors override the pm_domain so that all the PCI
-	 * subsys suspend / resume handling is skipped.
-	 */
-	isp->pm_domain.ops.runtime_suspend = atomisp_power_off;
-	isp->pm_domain.ops.runtime_resume = atomisp_power_on;
-	isp->pm_domain.ops.suspend = atomisp_suspend;
-	isp->pm_domain.ops.resume = atomisp_resume;
-
-	cpu_latency_qos_add_request(&isp->pm_qos, PM_QOS_DEFAULT_VALUE);
-	dev_pm_domain_set(&pdev->dev, &isp->pm_domain);
-
-	pm_runtime_put_noidle(&pdev->dev);
-	pm_runtime_allow(&pdev->dev);
-
 	/* Init ISP memory management */
 	hmm_init();
 
@@ -1466,6 +1438,30 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	isp->firmware = NULL;
 	isp->css_env.isp_css_fw.data = NULL;
 
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
+	cpu_latency_qos_add_request(&isp->pm_qos, PM_QOS_DEFAULT_VALUE);
+	dev_pm_domain_set(&pdev->dev, &isp->pm_domain);
+
+	pm_runtime_allow(&pdev->dev);
+	pm_runtime_put_sync_suspend(&pdev->dev);
+
 	err = v4l2_async_nf_register(&isp->notifier);
 	if (err) {
 		dev_err(isp->dev, "failed to register async notifier : %d\n", err);
@@ -1477,15 +1473,15 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	return 0;
 
 error_unload_firmware:
+	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_forbid(&pdev->dev);
+	dev_pm_domain_set(&pdev->dev, NULL);
+	cpu_latency_qos_remove_request(&isp->pm_qos);
 	ia_css_unload_firmware();
 error_free_irq:
 	devm_free_irq(&pdev->dev, pdev->irq, isp);
 error_unregister_entities:
 	hmm_cleanup();
-	pm_runtime_forbid(&pdev->dev);
-	pm_runtime_get_noresume(&pdev->dev);
-	dev_pm_domain_set(&pdev->dev, NULL);
-	cpu_latency_qos_remove_request(&isp->pm_qos);
 	atomisp_unregister_entities(isp);
 error_uninitialize_modules:
 	atomisp_uninitialize_modules(isp);
@@ -1494,28 +1490,6 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	pci_free_irq_vectors(pdev);
 error_release_firmware:
 	release_firmware(isp->firmware);
-error_power_off:
-	/*
-	 * Switch off ISP, as keeping it powered on would prevent
-	 * reaching S0ix states.
-	 *
-	 * The following lines have been copied from atomisp suspend path
-	 */
-
-	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
-	irq &= BIT(INTR_IIR);
-	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
-
-	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
-	irq &= ~BIT(INTR_IER);
-	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
-
-	atomisp_msi_irq_uninit(isp);
-
-	/* Address later when we worry about the ...field chips */
-	if (IS_ENABLED(CONFIG_PM) && atomisp_mrfld_power(isp, false))
-		dev_err(&pdev->dev, "Failed to switch off ISP\n");
-
 	return err;
 }
 
@@ -1525,15 +1499,17 @@ static void atomisp_pci_remove(struct pci_dev *pdev)
 
 	atomisp_drvfs_exit();
 
+	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_forbid(&pdev->dev);
+	dev_pm_domain_set(&pdev->dev, NULL);
+	cpu_latency_qos_remove_request(&isp->pm_qos);
+
+	/* Undo ia_css_init() from atomisp_power_on() */
+	atomisp_css_uninit(isp);
 	ia_css_unload_firmware();
 	devm_free_irq(&pdev->dev, pdev->irq, isp);
 	hmm_cleanup();
 
-	pm_runtime_forbid(&pdev->dev);
-	pm_runtime_get_noresume(&pdev->dev);
-	dev_pm_domain_set(&pdev->dev, NULL);
-	cpu_latency_qos_remove_request(&isp->pm_qos);
-
 	atomisp_unregister_entities(isp);
 	atomisp_uninitialize_modules(isp);
 	atomisp_msi_irq_uninit(isp);
-- 
2.43.0


