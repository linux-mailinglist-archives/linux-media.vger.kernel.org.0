Return-Path: <linux-media+bounces-3121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A061C820B05
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 11:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 190BA1F21384
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 10:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA7A4688;
	Sun, 31 Dec 2023 10:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bsWL9AaG"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135EE33D5
	for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 10:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704018687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8roqVBsjH2VTw0PdNh5kieuqyXZ5Eq9sxg65swMshRw=;
	b=bsWL9AaGxBpylkq5Amb6eJsMOZOKoMDtazgi3LCnPo3QXH0P/IJUavJ3IcFNqLHylWOC8I
	CU8IJHT1lCY6wQLLrNdsxnoTIo/VZF+3y8LCIEw9ASb557A5SPhD2wGlK/OoASJmRjPHn3
	GtT/+Md1QRlbMdUZWPgM6TdEr0xFFLk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-687-rb4PMvagPKiKCjF5_2m7aA-1; Sun,
 31 Dec 2023 05:31:20 -0500
X-MC-Unique: rb4PMvagPKiKCjF5_2m7aA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1F511C0514E;
	Sun, 31 Dec 2023 10:31:19 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 59979492BC6;
	Sun, 31 Dec 2023 10:31:18 +0000 (UTC)
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
Subject: [PATCH 07/15] media: atomisp: Fix probe error-exit path
Date: Sun, 31 Dec 2023 11:30:49 +0100
Message-ID: <20231231103057.35837-8-hdegoede@redhat.com>
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

Fix probe error-exit path:
-Add a missing ia_css_unload_firmware() call when v4l2_async_nf_register()
 fails
-Add a missing pm_runtime_forbid() call to undo the pm_runtime_allow() call
-Remove the unnecessary pcim_iounmap_regions() those are devm managed
 so they will get cleaned up automatically on an error exit from probe()
-Rename the labels to avoid having multiple labels pointing to the same
 place in the error-exit path

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 39 +++++++++----------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 0eea20704e66..336c5a895ecc 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1337,25 +1337,25 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	if (!isp->firmware) {
 		err = -ENOENT;
 		dev_dbg(&pdev->dev, "Firmware load failed\n");
-		goto load_fw_fail;
+		goto error_power_off;
 	}
 
 	err = sh_css_check_firmware_version(isp->dev, isp->firmware->data);
 	if (err) {
 		dev_dbg(&pdev->dev, "Firmware version check failed\n");
-		goto fw_validation_fail;
+		goto error_release_firmware;
 	}
 
 	err = pcim_enable_device(pdev);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to enable ISP PCI device (%d)\n", err);
-		goto pci_enable_fail;
+		goto error_release_firmware;
 	}
 
 	err = pcim_iomap_regions(pdev, BIT(ATOM_ISP_PCI_BAR), pci_name(pdev));
 	if (err) {
 		dev_err(&pdev->dev, "Failed to I/O memory remapping (%d)\n", err);
-		goto ioremap_fail;
+		goto error_release_firmware;
 	}
 
 	isp->base = pcim_iomap_table(pdev)[ATOM_ISP_PCI_BAR];
@@ -1365,7 +1365,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	err = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
 	if (err < 0) {
 		dev_err(&pdev->dev, "Failed to enable msi (%d)\n", err);
-		goto enable_msi_fail;
+		goto error_release_firmware;
 	}
 
 	atomisp_msi_irq_init(isp);
@@ -1408,13 +1408,13 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	err = atomisp_initialize_modules(isp);
 	if (err < 0) {
 		dev_err(&pdev->dev, "atomisp_initialize_modules (%d)\n", err);
-		goto initialize_modules_fail;
+		goto error_irq_uninit;
 	}
 
 	err = atomisp_register_entities(isp);
 	if (err < 0) {
 		dev_err(&pdev->dev, "atomisp_register_entities failed (%d)\n", err);
-		goto register_entities_fail;
+		goto error_uninitialize_modules;
 	}
 
 	INIT_WORK(&isp->assert_recovery_work, atomisp_assert_recovery_work);
@@ -1453,14 +1453,14 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 					IRQF_SHARED, "isp_irq", isp);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to request irq (%d)\n", err);
-		goto request_irq_fail;
+		goto error_unregister_entities;
 	}
 
 	/* Load firmware into ISP memory */
 	err = atomisp_css_load_firmware(isp);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to init css.\n");
-		goto css_init_fail;
+		goto error_free_irq;
 	}
 	/* Clear FW image from memory */
 	release_firmware(isp->firmware);
@@ -1470,33 +1470,32 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	err = v4l2_async_nf_register(&isp->notifier);
 	if (err) {
 		dev_err(isp->dev, "failed to register async notifier : %d\n", err);
-		goto css_init_fail;
+		goto error_unload_firmware;
 	}
 
 	atomisp_drvfs_init(isp);
 
 	return 0;
 
-css_init_fail:
+error_unload_firmware:
+	ia_css_unload_firmware();
+error_free_irq:
 	devm_free_irq(&pdev->dev, pdev->irq, isp);
-request_irq_fail:
+error_unregister_entities:
 	hmm_cleanup();
+	pm_runtime_forbid(&pdev->dev);
 	pm_runtime_get_noresume(&pdev->dev);
 	dev_pm_domain_set(&pdev->dev, NULL);
 	atomisp_unregister_entities(isp);
-register_entities_fail:
+error_uninitialize_modules:
 	atomisp_uninitialize_modules(isp);
-initialize_modules_fail:
+error_irq_uninit:
 	cpu_latency_qos_remove_request(&isp->pm_qos);
 	atomisp_msi_irq_uninit(isp);
 	pci_free_irq_vectors(pdev);
-enable_msi_fail:
-	pcim_iounmap_regions(pdev, BIT(ATOM_ISP_PCI_BAR));
-ioremap_fail:
-pci_enable_fail:
-fw_validation_fail:
+error_release_firmware:
 	release_firmware(isp->firmware);
-load_fw_fail:
+error_power_off:
 	/*
 	 * Switch off ISP, as keeping it powered on would prevent
 	 * reaching S0ix states.
-- 
2.43.0


