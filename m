Return-Path: <linux-media+bounces-3122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D11820B06
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 11:31:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E327A1C21305
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 10:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C9B33EE;
	Sun, 31 Dec 2023 10:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YB43SHhI"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64447539F
	for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 10:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704018689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4edGzpRnZq7kVgd+JBN48IeCWGiNpHq7TZgEGSopufs=;
	b=YB43SHhIFrujeDHah/4zmLfzvddvb65U39gzB0xnZJNqOdb2amVKFj32jT3NcH5eBL1lnp
	Dt0CPWcfxd7WWpbiH+ZCfCK86YayuQZ+XMWIXbeOp7MuoCaPonBy7bo+Kw6ORHv/wudzfJ
	dMrV+5j2oJNSqbavc0xhL07wlUa0cVM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-7kQ5xAdrPKerHCYNRsQM7g-1; Sun, 31 Dec 2023 05:31:23 -0500
X-MC-Unique: 7kQ5xAdrPKerHCYNRsQM7g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39696831014;
	Sun, 31 Dec 2023 10:31:23 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B5D4A492BC6;
	Sun, 31 Dec 2023 10:31:21 +0000 (UTC)
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
Subject: [PATCH 09/15] media: atomisp: Group cpu_latency_qos_add_request() call together with other PM calls
Date: Sun, 31 Dec 2023 11:30:51 +0100
Message-ID: <20231231103057.35837-10-hdegoede@redhat.com>
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

Group the cpu_latency_qos_add_request() call in probe() together with
the other PM calls in probe().

This is a preparation patch for futher PM fixes / work.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index f3bd2c03dea5..7d99b53107b0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1370,8 +1370,6 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 
 	atomisp_msi_irq_init(isp);
 
-	cpu_latency_qos_add_request(&isp->pm_qos, PM_QOS_DEFAULT_VALUE);
-
 	/*
 	 * for MRFLD, Software/firmware needs to write a 1 to bit 0 of
 	 * the register at CSI_RECEIVER_SELECTION_REG to enable SH CSI
@@ -1440,6 +1438,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	isp->pm_domain.ops.suspend = atomisp_suspend;
 	isp->pm_domain.ops.resume = atomisp_resume;
 
+	cpu_latency_qos_add_request(&isp->pm_qos, PM_QOS_DEFAULT_VALUE);
 	dev_pm_domain_set(&pdev->dev, &isp->pm_domain);
 
 	pm_runtime_put_noidle(&pdev->dev);
@@ -1486,11 +1485,11 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	pm_runtime_forbid(&pdev->dev);
 	pm_runtime_get_noresume(&pdev->dev);
 	dev_pm_domain_set(&pdev->dev, NULL);
+	cpu_latency_qos_remove_request(&isp->pm_qos);
 	atomisp_unregister_entities(isp);
 error_uninitialize_modules:
 	atomisp_uninitialize_modules(isp);
 error_irq_uninit:
-	cpu_latency_qos_remove_request(&isp->pm_qos);
 	atomisp_msi_irq_uninit(isp);
 	pci_free_irq_vectors(pdev);
 error_release_firmware:
-- 
2.43.0


