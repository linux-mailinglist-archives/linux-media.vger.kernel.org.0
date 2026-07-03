Return-Path: <linux-media+bounces-66502-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mzkuFbnUR2qzfwAAu9opvQ
	(envelope-from <linux-media+bounces-66502-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:26:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2C2703D7E
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:26:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=OtfnCbKD;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66502-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66502-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 718903034AFC
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB8A41735C;
	Fri,  3 Jul 2026 15:26:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D93417350
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:26:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092396; cv=none; b=EKBUJFR7h0Xn54cOHXShg9n+as0fAsFYoIIt3GRyaAIRuXwXwLjOMDoS2Qe3zBlXVG2xU/CGkvU+rf7QfD1U90O4c8GFSNY6vFGTwRtZE+qbteu/PoKPSPZJghCA6jf5LmTdz57vQmFYO+A6NpWVaixKdkcWnIcnnNbmjM4Woi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092396; c=relaxed/simple;
	bh=qlbkDfKzW6lFTI8xGbpsz1Urz4/guHwnqODbWH3TUlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sp+tTp8ckrL7SaxkrU06bNShmzBzmtz5dr2wGbuVaHEbq+rFD/ux2eGCLZexp5m0UxmYBbLq6oxIB5gCEYDr/rmJsG2Exk2yiZT6wz2TAnqeeWZPq2a46bgHEnWM2O7QrdEoOW0GcyqofT1+BCVcIWsKUe/3P8nY1Bqb40yhVww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OtfnCbKD; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092395; x=1814628395;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qlbkDfKzW6lFTI8xGbpsz1Urz4/guHwnqODbWH3TUlk=;
  b=OtfnCbKDGi+t9+8EOIjOVj4PEazZYG7jFEFXVogCCCESeFgsR2jWIEn2
   /lMJPtJMICZY5uwER2lUaof3rTNewUYXEvHZqtMfkdwOvaK0KFMEHWrxo
   zOPgVfWjnfvlsweZSlrzpg9FtAzDL0a39onBh4OmZ3okjsreOFF9ORzrB
   a3xu8vOL+alTL4vPOA4NBRuV+n7iZ6+Xg+laOkcALhRUkgngM+NMBSykB
   pVGMjKRJbv8r9zxA/HqvI3qhFZbqm1afRypm0cjdYQaLNpd5cCw5tG1vg
   n4A2xqC68BexVMU/5EM/AnwooRAVl4Z/qk98BU4DCWlDSd2VhHllGzrP9
   w==;
X-CSE-ConnectionGUID: QZxAB4HpRPqiWr5sbCnKgg==
X-CSE-MsgGUID: +LKBYSQ0T2eypkMDxym7Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396267"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396267"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:35 -0700
X-CSE-ConnectionGUID: 6QYYttuzQfq+WBIJ4CWRMw==
X-CSE-MsgGUID: nrY3TZL/T9y33kt932WSaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799841"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:33 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 36/41] media: ipu6: Move isys fw mapping to pci_probe
Date: Fri,  3 Jul 2026 18:24:46 +0300
Message-ID: <20260703152451.1743132-37-antti.laakso@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-66502-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 2C2C2703D7E

We are bout to add ipu7 firmware mapping. It is slightly different from
ipu6. Handling this and possible errors is easier when both isys and
psys mapping is in one place.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 29 -----------
 drivers/media/pci/intel/ipu6/ipu6.c      | 65 +++++++++++++++++++-----
 2 files changed, 52 insertions(+), 42 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 53a9500b8c26..dca6dd30a270 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -999,7 +999,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
 	const struct ipu6_isys_internal_csi2_pdata *csi2_pdata;
 	struct ipu6_bus_device *adev = auxdev_to_adev(auxdev);
 	struct ipu6_device *isp = adev->isp;
-	const struct firmware *fw;
 	struct ipu6_isys *isys;
 	unsigned int i;
 	int ret;
@@ -1044,18 +1043,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
 
 	isys_stream_init(isys);
 
-	if (!isp->secure_mode) {
-		fw = isp->cpd_fw;
-		ret = ipu6_map_fw_region(adev, fw->data, fw->size,
-					 DMA_TO_DEVICE, 0);
-		if (ret)
-			goto release_firmware;
-
-		ret = ipu6_cpd_create_pkg_dir(adev, isp->cpd_fw->data);
-		if (ret)
-			goto remove_shared_buffer;
-	}
-
 	cpu_latency_qos_add_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
 
 	ret = alloc_fw_msg_bufs(isys, 20);
@@ -1083,14 +1070,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
 	free_fw_msg_bufs(isys);
 out_remove_pkg_dir_shared_buffer:
 	cpu_latency_qos_remove_request(&isys->pm_qos);
-	if (!isp->secure_mode)
-		ipu6_cpd_free_pkg_dir(adev);
-remove_shared_buffer:
-	if (!isp->secure_mode)
-		ipu6_unmap_fw_region(adev, DMA_TO_DEVICE);
-release_firmware:
-	if (!isp->secure_mode)
-		release_firmware(adev->fw);
 
 	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++)
 		mutex_destroy(&isys->streams[i].mutex);
@@ -1103,9 +1082,7 @@ static int isys_probe(struct auxiliary_device *auxdev,
 
 static void isys_remove(struct auxiliary_device *auxdev)
 {
-	struct ipu6_bus_device *adev = auxdev_to_adev(auxdev);
 	struct ipu6_isys *isys = dev_get_drvdata(&auxdev->dev);
-	struct ipu6_device *isp = adev->isp;
 	unsigned int i;
 
 	free_fw_msg_bufs(isys);
@@ -1115,12 +1092,6 @@ static void isys_remove(struct auxiliary_device *auxdev)
 
 	cpu_latency_qos_remove_request(&isys->pm_qos);
 
-	if (!isp->secure_mode) {
-		ipu6_cpd_free_pkg_dir(adev);
-		ipu6_unmap_fw_region(adev, DMA_TO_DEVICE);
-		release_firmware(adev->fw);
-	}
-
 	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++)
 		mutex_destroy(&isys->streams[i].mutex);
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 67ca480e913d..ffb8b1df1953 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -400,6 +400,42 @@ static void ipu6_configure_vc_mechanism(struct ipu6_device *isp)
 	writel(val, isp->base + BUTTRESS_REG_BTRS_CTRL);
 }
 
+static int __ipu6_map_fw_by_sys(struct ipu6_device *isp, struct ipu6_bus_device *adev)
+{
+	int ret;
+
+	ret = ipu6_map_fw_region(adev, isp->cpd_fw->data, isp->cpd_fw->size,
+				 DMA_TO_DEVICE, 0);
+	if (ret) {
+		dev_err_probe(&isp->pdev->dev, ret,
+			      "Firmware mapping failed\n");
+		return ret;
+	}
+
+	ret = ipu6_cpd_create_pkg_dir(adev, isp->cpd_fw->data);
+	if (ret) {
+		dev_err_probe(&isp->pdev->dev, ret,
+			      "failed to create pkg dir\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ipu6_map_fw(struct ipu6_device *isp)
+{
+	int ret = 0;
+
+	ret = __ipu6_map_fw_by_sys(isp, isp->psys);
+	if (ret)
+		return ret;
+
+	if (!isp->secure_mode)
+		return __ipu6_map_fw_by_sys(isp, isp->isys);
+
+	return 0;
+}
+
 static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	const struct ipu6_buttress_ctrl *isys_ctrl, *psys_ctrl;
@@ -531,19 +567,9 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto out_ipu6_rpm_put;
 	}
 
-	ret = ipu6_map_fw_region(isp->psys, isp->cpd_fw->data,
-				 isp->cpd_fw->size, DMA_TO_DEVICE, 0);
-	if (ret) {
-		dev_err_probe(&isp->pdev->dev, ret, "failed to map fw image\n");
-		goto out_ipu6_rpm_put;
-	}
-
-	ret = ipu6_cpd_create_pkg_dir(isp->psys, isp->cpd_fw->data);
-	if (ret) {
-		dev_err_probe(&isp->pdev->dev, ret,
-			      "failed to create pkg dir\n");
+	ret = ipu6_map_fw(isp);
+	if (ret)
 		goto out_ipu6_rpm_put;
-	}
 
 	ret = devm_request_threaded_irq(dev, pdev->irq, ipu6_buttress_isr,
 					ipu6_buttress_isr_threaded,
@@ -585,7 +611,13 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 out_ipu6_bus_del_devices:
 	if (!IS_ERR_OR_NULL(isp->psys)) {
 		ipu6_cpd_free_pkg_dir(isp->psys);
-		ipu6_unmap_fw_region(isp->psys, DMA_TO_DEVICE);
+		if (isp->psys->fw_sgt.nents)
+			ipu6_unmap_fw_region(isp->psys, DMA_TO_DEVICE);
+	}
+	if (!IS_ERR_OR_NULL(isp->isys)) {
+		ipu6_cpd_free_pkg_dir(isp->isys);
+		if (isp->isys->fw_sgt.nents)
+			ipu6_unmap_fw_region(isp->isys, DMA_TO_DEVICE);
 	}
 	if (!IS_ERR_OR_NULL(isp->psys) && !IS_ERR_OR_NULL(isp->psys->mmu))
 		ipu6_mmu_cleanup(isp->psys->mmu);
@@ -609,6 +641,13 @@ static void ipu6_pci_remove(struct pci_dev *pdev)
 	ipu6_cpd_free_pkg_dir(isp->psys);
 
 	ipu6_unmap_fw_region(isp->psys, DMA_TO_DEVICE);
+
+	if (isp->isys) {
+		ipu6_cpd_free_pkg_dir(isp->isys);
+		if (isp->isys->fw_sgt.nents)
+			ipu6_unmap_fw_region(isp->isys, DMA_TO_DEVICE);
+	}
+
 	ipu6_buttress_exit(isp);
 
 	ipu6_bus_del_devices(pdev);
-- 
2.54.0


