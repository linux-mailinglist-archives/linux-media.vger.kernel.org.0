Return-Path: <linux-media+bounces-66504-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N9PHClTVR2rufwAAu9opvQ
	(envelope-from <linux-media+bounces-66504-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:29:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A161703E12
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:29:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=U1MA6zeI;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66504-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66504-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 000D0309A6DD
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E8541735F;
	Fri,  3 Jul 2026 15:26:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5B3417350
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:26:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092400; cv=none; b=f10h38444WZokWtkYiP7CODZeRAP/idop++GaPVBBhu+NRn/vZ61uBKSkg9NZczXy+CKNx6CHML047uggcQAFuLDsmBgT7FfxRb1iiTGm5VLDfL4x+C1TaNnWT7Tqh2HJ3Wy9Aaqg/H6IAQYCeMZNgUP0hiLNgXAi5ygmatt3iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092400; c=relaxed/simple;
	bh=WcqLyz/WU0BOCVDGLJ9SsiyeKbEYjzn2wW9vze5rdy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WIG4OGwr4yEuHVmBE1Z6G/1Pg0QoFEpmniqNHYrQqzhbduujFkSKORu4r7ROkDgGr4AWkS68Qw8aK3K0+Wps6ExUzbENVpgiliI2ysoupaTl5Zw5p8S7r3/w1us7NugIorPPrRBORVcKxOjjYCfx+NTCBRCauE8tQSD6PlW14fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U1MA6zeI; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092400; x=1814628400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WcqLyz/WU0BOCVDGLJ9SsiyeKbEYjzn2wW9vze5rdy4=;
  b=U1MA6zeIeMPx7oH0T4kvQtMO8Esh0G8ToeECYxabefJKf8Gv0euJNNip
   W1XdKJbQQZtTHh9xSD7a1lGuSGsWkXpt2uNe2msvPpGtH6tNtOjeGGOlU
   lKbANDnqjlO8biqzC5kiMyyHarwVj8Nhz7ziiJeMnSfpfaauWT6oJWyh0
   Oog17TfxwR8ZbYXd/2MS1Q5LkUnlfmvamOhdBJs5Nak9dBYuK/S9+6oWJ
   Z6OrKq2JJLgyuWCEEJgYe4dG293dbHj2QN3w27wPoRO54VPy5dP5+0S/m
   CXiKWvIMS32IifrVRJRjhM1C5Qx/RCLJpn6Mwtm24mLFffcIlpk168EYE
   Q==;
X-CSE-ConnectionGUID: LSnXbrrUR52KkRPWHINJzw==
X-CSE-MsgGUID: THeVz1ysSlGAe6RF4tlAKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396276"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396276"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:39 -0700
X-CSE-ConnectionGUID: GMKd2f6lTretFtMhS0Ttig==
X-CSE-MsgGUID: BCW63WxURe20fK4i6mA/vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799849"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:38 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 38/41] media: ipu6: Map ipu7 firmware
Date: Fri,  3 Jul 2026 18:24:48 +0300
Message-ID: <20260703152451.1743132-39-antti.laakso@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:antti.laakso@linux.intel.com,m:daxing.li@intel.com,m:ong.hock.yu@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66504-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid,linux.intel.com:from_mime,vger.kernel.org:from_smtp,intel.com:email,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A161703E12

Mapping of ipu7 firmware is slightly different compared to ipu6. Add
helpers for it and call them similar to ipu6.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6.c | 91 ++++++++++++++++++++++++++---
 drivers/media/pci/intel/ipu6/ipu6.h |  1 +
 2 files changed, 85 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index ffb8b1df1953..eed856a771fe 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -19,6 +19,7 @@
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/vmalloc.h>
 
 #include <media/ipu-bridge.h>
 #include <media/ipu6-pci-table.h>
@@ -27,6 +28,7 @@
 #include "ipu6-bus.h"
 #include "ipu6-buttress.h"
 #include "ipu6-cpd.h"
+#include "ipu6-dma.h"
 #include "ipu6-isys.h"
 #include "ipu6-mmu.h"
 #include "ipu6-platform-buttress-regs.h"
@@ -436,6 +438,67 @@ static int ipu6_map_fw(struct ipu6_device *isp)
 	return 0;
 }
 
+static int __ipu7_map_fw_non_secure(struct ipu6_device *isp)
+{
+	int ret;
+
+	/*
+	 * Allocate and map memory for running the firmware. Not
+	 * required in secure mode, in which firmware runs in IMR.
+	 */
+	isp->fw_code_region = vmalloc(IPU7_FW_CODE_REGION_SIZE);
+	if (!isp->fw_code_region)
+		return -ENOMEM;
+
+	ret = ipu7_cpd_copy_binary(isp->cpd_fw->data, "isys",
+				   isp->fw_code_region, &isp->isys->fw_entry);
+	if (ret)
+		goto free_fw_region;
+
+	ret = ipu6_map_fw_region(isp->isys, isp->fw_code_region,
+				 IPU7_FW_CODE_REGION_SIZE, DMA_BIDIRECTIONAL,
+				 0);
+	if (ret)
+		goto free_fw_region;
+
+	ret = ipu7_cpd_copy_binary(isp->cpd_fw->data, "psys",
+				   isp->fw_code_region, &isp->psys->fw_entry);
+	if (ret)
+		goto free_fw_region;
+
+	ret = ipu6_map_fw_region(isp->psys, isp->fw_code_region,
+				 IPU7_FW_CODE_REGION_SIZE, DMA_BIDIRECTIONAL,
+				 0);
+	if (ret)
+		goto free_fw_region;
+
+	return 0;
+
+free_fw_region:
+	vfree(isp->fw_code_region);
+	isp->fw_code_region = NULL;
+
+	return ret;
+}
+
+static int ipu7_map_fw(struct ipu6_device *isp)
+{
+	int ret;
+
+	ret = isp->secure_mode ?
+		ipu6_map_fw_region(isp->psys, isp->cpd_fw->data,
+				   isp->cpd_fw->size, DMA_BIDIRECTIONAL, 0) :
+		__ipu7_map_fw_non_secure(isp);
+
+	if (ret) {
+		dev_err_probe(&isp->pdev->dev, ret,
+			      "Failed to init ipu7 firmware region\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	const struct ipu6_buttress_ctrl *isys_ctrl, *psys_ctrl;
@@ -445,6 +508,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct ipu6_device *isp;
 	phys_addr_t phys;
 	u32 val, version, sku_id;
+	unsigned long attrs;
 	int ret;
 
 	isp = devm_kzalloc(dev, sizeof(*isp), GFP_KERNEL);
@@ -567,7 +631,8 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto out_ipu6_rpm_put;
 	}
 
-	ret = ipu6_map_fw(isp);
+	ret = pci_match_id(ipu7_ids, pdev) ? ipu7_map_fw(isp) :
+					     ipu6_map_fw(isp);
 	if (ret)
 		goto out_ipu6_rpm_put;
 
@@ -609,15 +674,21 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 out_ipu6_rpm_put:
 	pm_runtime_put_sync(&isp->psys->auxdev.dev);
 out_ipu6_bus_del_devices:
+	attrs = pci_match_id(ipu7_ids, pdev) ? DMA_BIDIRECTIONAL :
+					       DMA_TO_DEVICE;
 	if (!IS_ERR_OR_NULL(isp->psys)) {
-		ipu6_cpd_free_pkg_dir(isp->psys);
 		if (isp->psys->fw_sgt.nents)
-			ipu6_unmap_fw_region(isp->psys, DMA_TO_DEVICE);
+			ipu6_unmap_fw_region(isp->psys, attrs);
+		ipu6_cpd_free_pkg_dir(isp->psys);
 	}
 	if (!IS_ERR_OR_NULL(isp->isys)) {
 		ipu6_cpd_free_pkg_dir(isp->isys);
 		if (isp->isys->fw_sgt.nents)
-			ipu6_unmap_fw_region(isp->isys, DMA_TO_DEVICE);
+			ipu6_unmap_fw_region(isp->isys, attrs);
+	}
+	if (isp->fw_code_region) {
+		vfree(isp->fw_code_region);
+		isp->fw_code_region = NULL;
 	}
 	if (!IS_ERR_OR_NULL(isp->psys) && !IS_ERR_OR_NULL(isp->psys->mmu))
 		ipu6_mmu_cleanup(isp->psys->mmu);
@@ -636,18 +707,24 @@ static void ipu6_pci_remove(struct pci_dev *pdev)
 	struct ipu6_device *isp = pci_get_drvdata(pdev);
 	struct ipu6_mmu *isys_mmu = isp->isys->mmu;
 	struct ipu6_mmu *psys_mmu = isp->psys->mmu;
+	unsigned long attrs;
 
 	devm_free_irq(&pdev->dev, pdev->irq, isp);
-	ipu6_cpd_free_pkg_dir(isp->psys);
 
-	ipu6_unmap_fw_region(isp->psys, DMA_TO_DEVICE);
+	attrs = pci_match_id(ipu7_ids, pdev) ? DMA_BIDIRECTIONAL :
+					       DMA_TO_DEVICE;
+	ipu6_cpd_free_pkg_dir(isp->psys);
+	ipu6_unmap_fw_region(isp->psys, attrs);
 
 	if (isp->isys) {
 		ipu6_cpd_free_pkg_dir(isp->isys);
 		if (isp->isys->fw_sgt.nents)
-			ipu6_unmap_fw_region(isp->isys, DMA_TO_DEVICE);
+			ipu6_unmap_fw_region(isp->isys, attrs);
 	}
 
+	if (isp->fw_code_region)
+		vfree(isp->fw_code_region);
+
 	ipu6_buttress_exit(isp);
 
 	ipu6_bus_del_devices(pdev);
diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
index 1002d8785775..4cdc58ef0194 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -86,6 +86,7 @@ struct ipu6_device {
 	bool need_ipc_reset;
 	bool secure_mode;
 	bool bus_ready_to_probe;
+	u32 *fw_code_region;
 };
 
 #define IPU_PSYS	0
-- 
2.54.0


