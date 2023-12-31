Return-Path: <linux-media+bounces-3118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 022D7820B02
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 11:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2721D1C20DAD
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 10:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF4A3C38;
	Sun, 31 Dec 2023 10:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ndzwlcrp"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9EB28F5
	for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 10:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704018679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Qk5vDb2c2h9sLsJfdVsGU1LkgZW1c5p5JmKyi3n3Ds=;
	b=Ndzwlcrp4RND1Dh6U3HhtEX2QZ70vMwtDPlaNeRXokAVz8Rt716QyWAzNPiSCcNO2Ikibl
	qQAcwG7DEL8zf5326LZiy9qqzxGDe0nG7CnDoQkguF3X7pok3wU4xE7737GUGGcv04hzIc
	Fn7VKTt466W9zaxldqcHbUX9j//nYtA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-474-79u70tKvPnuZfdgK17sEyw-1; Sun,
 31 Dec 2023 05:31:16 -0500
X-MC-Unique: 79u70tKvPnuZfdgK17sEyw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 267993C0C48C;
	Sun, 31 Dec 2023 10:31:16 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 898EC492BC6;
	Sun, 31 Dec 2023 10:31:14 +0000 (UTC)
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
Subject: [PATCH 05/15] media: atomisp: Drop is_valid_device() function
Date: Sun, 31 Dec 2023 11:30:47 +0100
Message-ID: <20231231103057.35837-6-hdegoede@redhat.com>
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

Now that a single build supports both the ISP 2400 and the ISP 2401
this function is no longer necessary. The main probe() already
contains a similar switch (id->device & ATOMISP_PCI_DEVICE_SOC_MASK)
checking for a known device_id.

Move the revision check into the main probe() and drop
the is_valid_device() function.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 50 ++-----------------
 1 file changed, 5 insertions(+), 45 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 206fdaee5952..176b39906d10 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1192,48 +1192,6 @@ atomisp_load_firmware(struct atomisp_device *isp)
 	return fw;
 }
 
-/*
- * Check for flags the driver was compiled with against the PCI
- * device. Always returns true on other than ISP 2400.
- */
-static bool is_valid_device(struct pci_dev *pdev, const struct pci_device_id *id)
-{
-	const char *name;
-	const char *product;
-
-	product = dmi_get_system_info(DMI_PRODUCT_NAME);
-
-	switch (id->device & ATOMISP_PCI_DEVICE_SOC_MASK) {
-	case ATOMISP_PCI_DEVICE_SOC_MRFLD:
-		name = "Merrifield";
-		break;
-	case ATOMISP_PCI_DEVICE_SOC_BYT:
-		name = "Baytrail";
-		break;
-	case ATOMISP_PCI_DEVICE_SOC_ANN:
-		name = "Anniedale";
-		break;
-	case ATOMISP_PCI_DEVICE_SOC_CHT:
-		name = "Cherrytrail";
-		break;
-	default:
-		dev_err(&pdev->dev, "%s: unknown device ID %x04:%x04\n",
-			product, id->vendor, id->device);
-		return false;
-	}
-
-	if (pdev->revision <= ATOMISP_PCI_REV_BYT_A0_MAX) {
-		dev_err(&pdev->dev, "%s revision %d is not unsupported\n",
-			name, pdev->revision);
-		return false;
-	}
-
-	dev_info(&pdev->dev, "Detected %s version %d (ISP240%c) on %s\n",
-		 name, pdev->revision, IS_ISP2401 ? '1' : '0', product);
-
-	return true;
-}
-
 #define ATOM_ISP_PCI_BAR	0
 
 static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
@@ -1244,9 +1202,6 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	int err, val;
 	u32 irq;
 
-	if (!is_valid_device(pdev, id))
-		return -ENODEV;
-
 	/* Pointer to struct device. */
 	atomisp_dev = &pdev->dev;
 
@@ -1386,6 +1341,11 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 		goto atomisp_dev_alloc_fail;
 	}
 
+	if (pdev->revision <= ATOMISP_PCI_REV_BYT_A0_MAX) {
+		dev_err(&pdev->dev, "revision %d is not unsupported\n", pdev->revision);
+		return -ENODEV;
+	}
+
 	dev_info(&pdev->dev, "ISP HPLL frequency base = %d MHz\n", isp->hpll_freq);
 
 	isp->max_isr_latency = ATOMISP_MAX_ISR_LATENCY;
-- 
2.43.0


