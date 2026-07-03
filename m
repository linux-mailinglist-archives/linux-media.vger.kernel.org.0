Return-Path: <linux-media+bounces-66498-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JvucDbLUR2qwfwAAu9opvQ
	(envelope-from <linux-media+bounces-66498-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:26:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC2F703D73
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:26:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=fB0+61yV;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66498-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66498-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2DB7A3036C1A
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866CA41734D;
	Fri,  3 Jul 2026 15:26:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25693CCFC4
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:26:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092387; cv=none; b=t406k8JRNsuTzDG6Cc9iS88F8/xWQQIDAZQKEoi49UQ5iDQUzIOoTCUjWUWXHMTrSf60yevtHoDbVE1BRScZUjfljHu9VT6Viy3mhwVDxC84CQw/WYRKDkS7Y/9VL+9yKvo09qMwY9KBSk2hDnkgQETwVjTh9lkxgcztWZOhJsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092387; c=relaxed/simple;
	bh=MH08jHDY/tCRcCV9M8NHFgwiWDh+zdPrffIBzxFthCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nx2Wcp8N1aEvre/HJjoIrlVReCzV+xz0gHYkRv47cfrdyN6b0HanVPcRJ2ROGMI02UiZm39OGKmr9EqChIgqjbt7ZSRFFaVJWjFQD+UabDChKEWGcARvMDqcuHupp/uyFLAnaAKwapxhPbNhQW2T+UTiegAAySTnSAmIVOjexd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fB0+61yV; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092386; x=1814628386;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MH08jHDY/tCRcCV9M8NHFgwiWDh+zdPrffIBzxFthCA=;
  b=fB0+61yVZIzMMwQ2HoLh5UorFx80WkuJtgJezNY5VdxhpEwpdjZ7e6kH
   nppzgrpf5aDa432sKz3RBUIHXoUkgbaQOERGlGttKvV5bxVo5/XJcQr+w
   w8lnHS3Y0L0zFY122piBcmVR0rO4bVkTe3Rs5yMPRVdsHCZlo6ipZXh5h
   p2BMcQzHgYP5mwLAs8vMogs9KA1Py7Z6rrE+x8fG1P0l+P/aZsXY65A6s
   7KGhLc+du+X+g/ZuCtSA2fUqgajm2EwW3DFmsC2mmhgkO6kXYRSoU5fla
   QHs5KyfddEfS64DmfJB2iEPk2e8zWdb9XkDAT+bbGdWtoFaRkcsSC6wcd
   g==;
X-CSE-ConnectionGUID: Svel4uGpQkKp7dkT2zgQnQ==
X-CSE-MsgGUID: ead0G6CeQweNTgr438jbUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396252"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396252"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:25 -0700
X-CSE-ConnectionGUID: d0LnWrzhTSOSIwDZF1Y4Sw==
X-CSE-MsgGUID: PLlayRmUS7KS6jImcvEnLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799810"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:24 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 32/41] media: ipu6: Move buttress mem alloc out from probe
Date: Fri,  3 Jul 2026 18:24:42 +0300
Message-ID: <20260703152451.1743132-33-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
References: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:antti.laakso@linux.intel.com,m:daxing.li@intel.com,m:ong.hock.yu@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66498-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.intel.com:mid,linux.intel.com:from_mime,intel.com:email,intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0EC2F703D73

Buttress registers are stored in separate buffer, which is passed
down to bus driver. Move allocation of this buffer to subsystem init
to cleanup pci probe function a bit.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6.c | 42 ++++++++++++++---------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 79661ff158f1..0c2c09a1c981 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -92,7 +92,7 @@ static struct ipu6_psys_internal_pdata psys_ipdata = {
 	},
 };
 
-static const struct ipu6_buttress_ctrl isys_buttress_ctrl = {
+static const struct ipu6_buttress_ctrl ipu6_isys_buttress_ctrl = {
 	.subsys_id = IPU_ISYS,
 	.ratio = IPU6_IS_FREQ_CTL_DEFAULT_RATIO,
 	.qos_floor = IPU6_IS_FREQ_CTL_DEFAULT_QOS_FLOOR_RATIO,
@@ -103,7 +103,7 @@ static const struct ipu6_buttress_ctrl isys_buttress_ctrl = {
 	.pwr_sts_off = IPU6_BUTTRESS_PWR_STATE_DN_DONE,
 };
 
-static const struct ipu6_buttress_ctrl psys_buttress_ctrl = {
+static const struct ipu6_buttress_ctrl ipu6_psys_buttress_ctrl = {
 	.subsys_id = IPU_PSYS,
 	.ratio = IPU6_PS_FREQ_CTL_DEFAULT_RATIO,
 	.qos_floor = IPU6_PS_FREQ_CTL_DEFAULT_QOS_FLOOR_RATIO,
@@ -257,11 +257,12 @@ static void ipu6_internal_pdata_init(struct ipu6_device *isp)
 
 static struct ipu6_bus_device *
 ipu6_isys_init(struct pci_dev *pdev, struct device *parent,
-	       struct ipu6_buttress_ctrl *ctrl, void __iomem *base,
+	       const struct ipu6_buttress_ctrl *ctrl, void __iomem *base,
 	       const struct ipu6_isys_internal_pdata *ipdata)
 {
 	struct device *dev = &pdev->dev;
 	struct ipu6_bus_device *isys_adev;
+	struct ipu6_buttress_ctrl *devm_ctrl;
 	struct ipu6_isys_pdata *pdata;
 	int ret;
 
@@ -271,6 +272,10 @@ ipu6_isys_init(struct pci_dev *pdev, struct device *parent,
 		return ERR_PTR(ret);
 	}
 
+	devm_ctrl = devm_kmemdup(dev, ctrl, sizeof(*ctrl), GFP_KERNEL);
+	if (!devm_ctrl)
+		return ERR_PTR(-ENOMEM);
+
 	pdata = kzalloc_obj(*pdata);
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
@@ -278,7 +283,7 @@ ipu6_isys_init(struct pci_dev *pdev, struct device *parent,
 	pdata->base = base;
 	pdata->ipdata = ipdata;
 
-	isys_adev = ipu6_bus_initialize_device(pdev, parent, pdata, ctrl,
+	isys_adev = ipu6_bus_initialize_device(pdev, parent, pdata, devm_ctrl,
 					       IPU6_ISYS_NAME);
 	if (IS_ERR(isys_adev)) {
 		kfree(pdata);
@@ -307,13 +312,19 @@ ipu6_isys_init(struct pci_dev *pdev, struct device *parent,
 
 static struct ipu6_bus_device *
 ipu6_psys_init(struct pci_dev *pdev, struct device *parent,
-	       struct ipu6_buttress_ctrl *ctrl, void __iomem *base,
+	       const struct ipu6_buttress_ctrl *ctrl, void __iomem *base,
 	       const struct ipu6_psys_internal_pdata *ipdata)
 {
+	struct device *dev = &pdev->dev;
 	struct ipu6_bus_device *psys_adev;
+	struct ipu6_buttress_ctrl *devm_ctrl;
 	struct ipu6_psys_pdata *pdata;
 	int ret;
 
+	devm_ctrl = devm_kmemdup(dev, ctrl, sizeof(*ctrl), GFP_KERNEL);
+	if (!devm_ctrl)
+		return ERR_PTR(-ENOMEM);
+
 	pdata = kzalloc_obj(*pdata);
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
@@ -321,7 +332,7 @@ ipu6_psys_init(struct pci_dev *pdev, struct device *parent,
 	pdata->base = base;
 	pdata->ipdata = ipdata;
 
-	psys_adev = ipu6_bus_initialize_device(pdev, parent, pdata, ctrl,
+	psys_adev = ipu6_bus_initialize_device(pdev, parent, pdata, devm_ctrl,
 					       IPU6_PSYS_NAME);
 	if (IS_ERR(psys_adev)) {
 		kfree(pdata);
@@ -391,7 +402,7 @@ static void ipu6_configure_vc_mechanism(struct ipu6_device *isp)
 
 static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
-	struct ipu6_buttress_ctrl *isys_ctrl = NULL, *psys_ctrl = NULL;
+	const struct ipu6_buttress_ctrl *isys_ctrl, *psys_ctrl;
 	struct device *dev = &pdev->dev;
 	void __iomem *isys_base = NULL;
 	void __iomem *psys_base = NULL;
@@ -432,6 +443,9 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	pci_set_master(pdev);
 
 	isp->cpd_metadata_cmpnt_size = sizeof(struct ipu6_cpd_metadata_cmpnt);
+	isys_ctrl = &ipu6_isys_buttress_ctrl;
+	psys_ctrl = &ipu6_psys_buttress_ctrl;
+
 	switch (id->device) {
 	case PCI_DEVICE_ID_INTEL_IPU6:
 		isp->cpd_fw_name = IPU6_FIRMWARE_NAME;
@@ -492,13 +506,6 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto out_ipu6_bus_del_devices;
 	}
 
-	isys_ctrl = devm_kmemdup(dev, &isys_buttress_ctrl,
-				 sizeof(isys_buttress_ctrl), GFP_KERNEL);
-	if (!isys_ctrl) {
-		ret = -ENOMEM;
-		goto out_ipu6_bus_del_devices;
-	}
-
 	isp->isys = ipu6_isys_init(pdev, dev, isys_ctrl, isys_base,
 				   &isys_ipdata);
 	if (IS_ERR(isp->isys)) {
@@ -506,13 +513,6 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto out_ipu6_bus_del_devices;
 	}
 
-	psys_ctrl = devm_kmemdup(dev, &psys_buttress_ctrl,
-				 sizeof(psys_buttress_ctrl), GFP_KERNEL);
-	if (!psys_ctrl) {
-		ret = -ENOMEM;
-		goto out_ipu6_bus_del_devices;
-	}
-
 	isp->psys = ipu6_psys_init(pdev, &isp->isys->auxdev.dev, psys_ctrl,
 				   psys_base, &psys_ipdata);
 	if (IS_ERR(isp->psys)) {
-- 
2.54.0


