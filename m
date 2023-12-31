Return-Path: <linux-media+bounces-3119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CD9820B03
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 11:31:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AFE71C212B4
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 10:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1222912;
	Sun, 31 Dec 2023 10:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z1rBS63i"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05377523C
	for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 10:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704018683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=THXKYsFKR70ZZ0iCIhtUXHKlbRr3sCXZyu8f/PhaYCM=;
	b=Z1rBS63i+h74fPzrRsV+MJ3fh4/bDISvEQi88QdhWf1OFHPLFnMUwDsBjowsnJ7+MA1yNr
	2lWavkZ9mkSyOsJ8DnE368jeuen1V70YCcrADMhDY/A4umGpbRodHtWW6uFLlr25+KJhJ4
	0HzKcaLg5+Anjgo/tE1PClKWEELwQ+o=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-CLw2IdNJOReBvZYROv6oIg-1; Sun,
 31 Dec 2023 05:31:18 -0500
X-MC-Unique: CLw2IdNJOReBvZYROv6oIg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF65D1C0514E;
	Sun, 31 Dec 2023 10:31:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 57B07492BC6;
	Sun, 31 Dec 2023 10:31:16 +0000 (UTC)
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
Subject: [PATCH 06/15] media: atomisp: Call pcim_enable_device() and pcim_iomap_regions() later
Date: Sun, 31 Dec 2023 11:30:48 +0100
Message-ID: <20231231103057.35837-7-hdegoede@redhat.com>
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

ATM the atomisp firmware is not available in linux-firmware,
so most users will not have it installed.

Move pcim_enable_device() and pcim_iomap_regions() down in
atomisp_pci_probe() so that they are never called when the firmware
is not there.

This is a preparation patch for making the atomisp driver handle
missing firmware better.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 45 +++++++++----------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 176b39906d10..0eea20704e66 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1209,33 +1209,16 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	if (!pdata)
 		dev_warn(&pdev->dev, "no platform data available\n");
 
-	err = pcim_enable_device(pdev);
-	if (err) {
-		dev_err(&pdev->dev, "Failed to enable CI ISP device (%d)\n", err);
-		return err;
-	}
-
 	start = pci_resource_start(pdev, ATOM_ISP_PCI_BAR);
 	dev_dbg(&pdev->dev, "start: 0x%x\n", start);
 
-	err = pcim_iomap_regions(pdev, BIT(ATOM_ISP_PCI_BAR), pci_name(pdev));
-	if (err) {
-		dev_err(&pdev->dev, "Failed to I/O memory remapping (%d)\n", err);
-		goto ioremap_fail;
-	}
-
 	isp = devm_kzalloc(&pdev->dev, sizeof(*isp), GFP_KERNEL);
-	if (!isp) {
-		err = -ENOMEM;
-		goto atomisp_dev_alloc_fail;
-	}
+	if (!isp)
+		return -ENOMEM;
 
 	isp->dev = &pdev->dev;
-	isp->base = pcim_iomap_table(pdev)[ATOM_ISP_PCI_BAR];
 	isp->saved_regs.ispmmadr = start;
 
-	dev_dbg(&pdev->dev, "atomisp mmio base: %p\n", isp->base);
-
 	mutex_init(&isp->mutex);
 	spin_lock_init(&isp->lock);
 
@@ -1337,8 +1320,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 		break;
 	default:
 		dev_err(&pdev->dev, "un-supported IUNIT device\n");
-		err = -ENODEV;
-		goto atomisp_dev_alloc_fail;
+		return -ENODEV;
 	}
 
 	if (pdev->revision <= ATOMISP_PCI_REV_BYT_A0_MAX) {
@@ -1364,6 +1346,20 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 		goto fw_validation_fail;
 	}
 
+	err = pcim_enable_device(pdev);
+	if (err) {
+		dev_err(&pdev->dev, "Failed to enable ISP PCI device (%d)\n", err);
+		goto pci_enable_fail;
+	}
+
+	err = pcim_iomap_regions(pdev, BIT(ATOM_ISP_PCI_BAR), pci_name(pdev));
+	if (err) {
+		dev_err(&pdev->dev, "Failed to I/O memory remapping (%d)\n", err);
+		goto ioremap_fail;
+	}
+
+	isp->base = pcim_iomap_table(pdev)[ATOM_ISP_PCI_BAR];
+
 	pci_set_master(pdev);
 
 	err = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
@@ -1495,6 +1491,9 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	atomisp_msi_irq_uninit(isp);
 	pci_free_irq_vectors(pdev);
 enable_msi_fail:
+	pcim_iounmap_regions(pdev, BIT(ATOM_ISP_PCI_BAR));
+ioremap_fail:
+pci_enable_fail:
 fw_validation_fail:
 	release_firmware(isp->firmware);
 load_fw_fail:
@@ -1519,10 +1518,6 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	if (IS_ENABLED(CONFIG_PM) && atomisp_mrfld_power(isp, false))
 		dev_err(&pdev->dev, "Failed to switch off ISP\n");
 
-atomisp_dev_alloc_fail:
-	pcim_iounmap_regions(pdev, BIT(ATOM_ISP_PCI_BAR));
-
-ioremap_fail:
 	return err;
 }
 
-- 
2.43.0


