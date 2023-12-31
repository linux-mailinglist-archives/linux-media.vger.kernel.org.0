Return-Path: <linux-media+bounces-3126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA594820B0A
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 11:32:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4A6F1C21372
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 10:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F097476;
	Sun, 31 Dec 2023 10:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tosi3jcM"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EE1568B
	for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 10:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704018694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k7BBT+mD/egNtAq4TsUSWQBDfbq6xwn3E6SHTBzXhCA=;
	b=Tosi3jcM/HpLrlXI4vPoSOsc7ZtM4qL7YGx/v/k/4u07SvKbISYayzzwiMUY/brnVr1zya
	mXJG0siHOkdKFrwTkq13z/EXdajuh9nPrAzqLoeE6SAL51wSvli+34OSbMbQYgW7Wmxw9Z
	CfeVtIG90wK9cIW1JnV9N8v5SR2jvYo=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-534-fGAFAzahNtitEUCYrEzxjA-1; Sun,
 31 Dec 2023 05:31:30 -0500
X-MC-Unique: fGAFAzahNtitEUCYrEzxjA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0056E3811F2B;
	Sun, 31 Dec 2023 10:31:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7AA0E492BC8;
	Sun, 31 Dec 2023 10:31:28 +0000 (UTC)
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
Subject: [PATCH 13/15] media: atomisp: Bind and do power-management without firmware
Date: Sun, 31 Dec 2023 11:30:55 +0100
Message-ID: <20231231103057.35837-14-hdegoede@redhat.com>
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

The ISP needs to be turned off in a special manner for the SoC
to be able to reach S0i3 during suspend.

When the firmware is missing still bind to the PCI device and
run in pm-only mode which takes care of turning the ISP off
(including turning it off again if the firmware has turned it
on during resume).

In this new pm-only mode the atomisp driver works exactly the same
as the non-staging, pm-only drivers/platform/x86/intel/atomisp2/pm.c
driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_internal.h      |  1 +
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 32 ++++++++++++++-----
 2 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index d5b077e602ca..bba9bc64d447 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -192,6 +192,7 @@ struct atomisp_device {
 	struct dev_pm_domain pm_domain;
 	struct pm_qos_request pm_qos;
 	s32 max_isr_latency;
+	bool pm_only;
 
 	struct atomisp_mipi_csi2_device csi2_port[ATOMISP_CAMERA_NR_PORTS];
 	struct atomisp_tpg_device tpg;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index f44be2d656a8..7e241f4e9e93 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -548,7 +548,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 	dev_dbg(isp->dev, "IUNIT power-%s.\n", enable ? "on" : "off");
 
 	/* WA for P-Unit, if DVFS enabled, ISP timeout observed */
-	if (IS_CHT && enable) {
+	if (IS_CHT && enable && !isp->pm_only) {
 		punit_ddr_dvfs_enable(false);
 		msleep(20);
 	}
@@ -558,7 +558,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 			val, MRFLD_ISPSSPM0_ISPSSC_MASK);
 
 	/* WA:Enable DVFS */
-	if (IS_CHT && !enable)
+	if (IS_CHT && !enable && !isp->pm_only)
 		punit_ddr_dvfs_enable(true);
 
 	/*
@@ -601,11 +601,15 @@ int atomisp_power_off(struct device *dev)
 	int ret;
 	u32 reg;
 
-	atomisp_css_uninit(isp);
+	if (isp->pm_only) {
+		pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, 0);
+	} else {
+		atomisp_css_uninit(isp);
 
-	ret = atomisp_mrfld_pre_power_down(isp);
-	if (ret)
-		return ret;
+		ret = atomisp_mrfld_pre_power_down(isp);
+		if (ret)
+			return ret;
+	}
 
 	/*
 	 * MRFLD IUNIT DPHY is located in an always-power-on island
@@ -634,6 +638,9 @@ int atomisp_power_on(struct device *dev)
 	pci_restore_state(to_pci_dev(dev));
 	cpu_latency_qos_update_request(&isp->pm_qos, isp->max_isr_latency);
 
+	if (isp->pm_only)
+		return 0;
+
 	/*restore register values for iUnit and iUnitPHY registers*/
 	if (isp->saved_regs.pcicmdsts)
 		atomisp_restore_iunit_reg(isp);
@@ -1252,6 +1259,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 
 	isp->dev = &pdev->dev;
 	isp->saved_regs.ispmmadr = start;
+	isp->asd.isp = isp;
 
 	mutex_init(&isp->mutex);
 	spin_lock_init(&isp->lock);
@@ -1368,8 +1376,13 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 
 	/* Load isp firmware from user space */
 	isp->firmware = atomisp_load_firmware(isp);
-	if (!isp->firmware)
-		return -ENOENT;
+	if (!isp->firmware) {
+		/* No firmware continue in pm-only mode for S0i3 support */
+		dev_info(&pdev->dev, "Continuing in power-management only mode\n");
+		isp->pm_only = true;
+		atomisp_pm_init(isp);
+		return 0;
+	}
 
 	err = sh_css_check_firmware_version(isp->dev, isp->firmware->data);
 	if (err) {
@@ -1507,6 +1520,9 @@ static void atomisp_pci_remove(struct pci_dev *pdev)
 
 	atomisp_pm_uninit(isp);
 
+	if (isp->pm_only)
+		return;
+
 	/* Undo ia_css_init() from atomisp_power_on() */
 	atomisp_css_uninit(isp);
 	ia_css_unload_firmware();
-- 
2.43.0


