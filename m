Return-Path: <linux-media+bounces-3120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE04820B04
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 11:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD7F21C20DDC
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 10:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF154436;
	Sun, 31 Dec 2023 10:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gk2L7dMN"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F909322A
	for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 10:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704018685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bVNw4HygPHIpPoa8ZE/baFU/gyqzrIuRJMtfWwnNS+Y=;
	b=gk2L7dMN7NFQ5vb5em6JpK0MvFfNdd/S34ddMHVOHCYngLWwN0pXdPNBwYJXzLrd0EVuJw
	ewnPa5ERMmt59pVQyzZAbdDecbxDDzBf73wpcC1fu5dLE8GDy9kjxDsHVU2uE95eFeY51x
	7AciiRuXOk9YpU8EDpFWM1ACIAKCKhU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-34-xtljsz9-NBClt2aFPLLIdA-1; Sun,
 31 Dec 2023 05:31:22 -0500
X-MC-Unique: xtljsz9-NBClt2aFPLLIdA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84E223C0C48C;
	Sun, 31 Dec 2023 10:31:21 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0EEA1492BC6;
	Sun, 31 Dec 2023 10:31:19 +0000 (UTC)
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
Subject: [PATCH 08/15] media: atomisp: Fix atomisp_pci_remove()
Date: Sun, 31 Dec 2023 11:30:50 +0100
Message-ID: <20231231103057.35837-9-hdegoede@redhat.com>
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

Fix atomisp_pci_remove():
-Remove uninformative "Removing atomisp driver" log message
-Add missing devm_free_irq(), atomisp_uninitialize_modules() and
 pci_free_irq_vectors() calls
-Move atomisp_msi_irq_uninit() down so that the remove() order is
 an exact mirror of the probe() order

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 336c5a895ecc..f3bd2c03dea5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1524,11 +1524,10 @@ static void atomisp_pci_remove(struct pci_dev *pdev)
 {
 	struct atomisp_device *isp = pci_get_drvdata(pdev);
 
-	dev_info(&pdev->dev, "Removing atomisp driver\n");
-
 	atomisp_drvfs_exit();
 
 	ia_css_unload_firmware();
+	devm_free_irq(&pdev->dev, pdev->irq, isp);
 	hmm_cleanup();
 
 	pm_runtime_forbid(&pdev->dev);
@@ -1536,8 +1535,10 @@ static void atomisp_pci_remove(struct pci_dev *pdev)
 	dev_pm_domain_set(&pdev->dev, NULL);
 	cpu_latency_qos_remove_request(&isp->pm_qos);
 
-	atomisp_msi_irq_uninit(isp);
 	atomisp_unregister_entities(isp);
+	atomisp_uninitialize_modules(isp);
+	atomisp_msi_irq_uninit(isp);
+	pci_free_irq_vectors(pdev);
 }
 
 static const struct pci_device_id atomisp_pci_tbl[] = {
-- 
2.43.0


