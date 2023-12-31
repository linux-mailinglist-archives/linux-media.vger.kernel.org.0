Return-Path: <linux-media+bounces-3125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2C7820B09
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 11:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A54BB21248
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 10:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74EBE6112;
	Sun, 31 Dec 2023 10:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PouY1al9"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8683053A8
	for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 10:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704018692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jdxf0apCEx6ROxq+hFkMBohmP/+BdrI6zj4C+8lCkwI=;
	b=PouY1al9DTeOJHKVSZaVfP97xsM+ibAy0j/iXLWh6lMac+IteH3pT/0X3VN5gjyVgtsZNS
	1jDWNW+W9ePyzaBAD8J1M/BlRfgCRGc7pw/+1DW4VC0uIxPugZy7/beyxj3HRrWyd6CObS
	GDSsC10Jul+N61ej4yJw/FtEs55OG+4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-PuUZVprCPTmp56Ptpke6tg-1; Sun, 31 Dec 2023 05:31:28 -0500
X-MC-Unique: PuUZVprCPTmp56Ptpke6tg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49975185A781;
	Sun, 31 Dec 2023 10:31:28 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7122492BC6;
	Sun, 31 Dec 2023 10:31:26 +0000 (UTC)
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
Subject: [PATCH 12/15] media: atomisp: Move power-management [un]init into atomisp_pm_[un]init()
Date: Sun, 31 Dec 2023 11:30:54 +0100
Message-ID: <20231231103057.35837-13-hdegoede@redhat.com>
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

Move the power-management setup and cleanup code into
atomisp_pm_[un]init() helper functions.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 69 ++++++++++---------
 1 file changed, 38 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 0c78c1d82659..f44be2d656a8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1192,6 +1192,41 @@ atomisp_load_firmware(struct atomisp_device *isp)
 	return fw;
 }
 
+static void atomisp_pm_init(struct atomisp_device *isp)
+{
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
+	dev_pm_domain_set(isp->dev, &isp->pm_domain);
+
+	pm_runtime_allow(isp->dev);
+	pm_runtime_put_sync_suspend(isp->dev);
+}
+
+static void atomisp_pm_uninit(struct atomisp_device *isp)
+{
+	pm_runtime_get_sync(isp->dev);
+	pm_runtime_forbid(isp->dev);
+	dev_pm_domain_set(isp->dev, NULL);
+	cpu_latency_qos_remove_request(&isp->pm_qos);
+}
+
 #define ATOM_ISP_PCI_BAR	0
 
 static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
@@ -1438,29 +1473,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	isp->firmware = NULL;
 	isp->css_env.isp_css_fw.data = NULL;
 
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
-	pm_runtime_allow(&pdev->dev);
-	pm_runtime_put_sync_suspend(&pdev->dev);
+	atomisp_pm_init(isp);
 
 	err = v4l2_async_nf_register(&isp->notifier);
 	if (err) {
@@ -1471,10 +1484,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	return 0;
 
 error_unload_firmware:
-	pm_runtime_get_sync(&pdev->dev);
-	pm_runtime_forbid(&pdev->dev);
-	dev_pm_domain_set(&pdev->dev, NULL);
-	cpu_latency_qos_remove_request(&isp->pm_qos);
+	atomisp_pm_uninit(isp);
 	ia_css_unload_firmware();
 error_free_irq:
 	devm_free_irq(&pdev->dev, pdev->irq, isp);
@@ -1495,10 +1505,7 @@ static void atomisp_pci_remove(struct pci_dev *pdev)
 {
 	struct atomisp_device *isp = pci_get_drvdata(pdev);
 
-	pm_runtime_get_sync(&pdev->dev);
-	pm_runtime_forbid(&pdev->dev);
-	dev_pm_domain_set(&pdev->dev, NULL);
-	cpu_latency_qos_remove_request(&isp->pm_qos);
+	atomisp_pm_uninit(isp);
 
 	/* Undo ia_css_init() from atomisp_power_on() */
 	atomisp_css_uninit(isp);
-- 
2.43.0


