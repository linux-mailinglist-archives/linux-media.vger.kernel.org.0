Return-Path: <linux-media+bounces-66467-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hGGmOF/UR2qDfwAAu9opvQ
	(envelope-from <linux-media+bounces-66467-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:25:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5CB703D1D
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:25:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=I3CIdqxQ;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66467-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66467-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4EB3830117B1
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E2B21FF25;
	Fri,  3 Jul 2026 15:25:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75253DB305
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:25:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092314; cv=none; b=OLJ6QO/lHUSmH9p6TxVH7vU2DgdtejeyxArApksvu+RshBY6e69i+BxoOP9/qjqMsIT2iudmwnc2ZGf9jmtw4dSE4sBIdWoKfrWTbULTNVntMfJ/yytlA3CWtd5RjzFqefMnC7pwV6Mm/v4I2bn+fqI/T9p+M93AX/ouDSDWM/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092314; c=relaxed/simple;
	bh=NwsTq+w8S2YGaQ6JkomM7p+PN+zibS5MDyHzRkqxm08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Haos8JX6w2n9u7fTldA51jpfeC37+BZKgMBrixq8ZQN6jZcD1cF0BYXL+tJqKDlEgLVeD2pl0IAtyNKhOjnjmFsrjdM30vw6bCzv5rb6QCJd1sxl0mav8vrVe5m44uZlEqCwGypAOJZEvRqE4h8qQVnwt4bN4vPWyh5+woMqtDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I3CIdqxQ; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092313; x=1814628313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NwsTq+w8S2YGaQ6JkomM7p+PN+zibS5MDyHzRkqxm08=;
  b=I3CIdqxQDccnjFB2fMbc2LzOKcIcmBTJf216AXBBhjEo4iUWNUX1s2Yn
   2VNS4+nq4pmA2f6LVe9INNF73dxizVWu7l7OAxyeC0YfvXI66clG8jmtb
   DI7U+2FijCflxKCm9BqB9nl2O26E0LY+7XGVNDfvs2jdq7UrBSBkmu3Vf
   t7l7Tx2PbU4Fe23Pf6YLqzcb7LnfqqGXxV1gd2ycjK4sVwg0nr5hIzNJl
   PGCfBH4n/TOpvBpBo4v/OqOVOOt0RUtsZyVgILYhUUy/8RfvyZwlX2eef
   nEUs31N5ghcq0Ox3WRnu4Gh3QCQ75rbDiHKQXkVuzCCVGJj+3Wl3zNdUb
   w==;
X-CSE-ConnectionGUID: K8t+Izl3SjWKsE2GRDPqAA==
X-CSE-MsgGUID: WgoG71z9Qu6GfgNPyZ8rHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396105"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396105"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:12 -0700
X-CSE-ConnectionGUID: pkkHKq9LTEeRUBmb8E3p9g==
X-CSE-MsgGUID: uAzYqf/4TR+67w9WHlWAuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799463"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:11 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 01/41] media: ipu6: Replace internal hw flag
Date: Fri,  3 Jul 2026 18:24:11 +0300
Message-ID: <20260703152451.1743132-2-antti.laakso@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-66467-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.intel.com:mid,linux.intel.com:from_mime,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B5CB703D1D

Use pci_match_id instead.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c |  4 +-
 drivers/media/pci/intel/ipu6/ipu6.c      | 28 +++++--------
 drivers/media/pci/intel/ipu6/ipu6.h      | 53 ++++++++++--------------
 3 files changed, 34 insertions(+), 51 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index c9cdeb7054d7..0789f5d6a581 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -1103,9 +1103,9 @@ static int isys_probe(struct auxiliary_device *auxdev,
 
 	isys_iwake_watermark_init(isys);
 
-	if (is_ipu6se(adev->isp->hw_ver))
+	if (pci_match_id(ipu6se_ids, adev->isp->pdev))
 		isys->phy_set_power = ipu6_isys_jsl_phy_set_power;
-	else if (is_ipu6ep_mtl(adev->isp->hw_ver))
+	else if (pci_match_id(ipu6ep_mtl_ids, adev->isp->pdev))
 		isys->phy_set_power = ipu6_isys_dwc_phy_set_power;
 	else
 		isys->phy_set_power = ipu6_isys_mcd_phy_set_power;
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index d033d4618169..55686fccb537 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -290,8 +290,6 @@ EXPORT_SYMBOL_NS_GPL(ipu6_configure_spc, "INTEL_IPU6");
 
 static void ipu6_internal_pdata_init(struct ipu6_device *isp)
 {
-	u8 hw_ver = isp->hw_ver;
-
 	isys_ipdata.num_parallel_streams = IPU6_ISYS_NUM_STREAMS;
 	isys_ipdata.sram_gran_shift = IPU6_SRAM_GRANULARITY_SHIFT;
 	isys_ipdata.sram_gran_size = IPU6_SRAM_GRANULARITY_SIZE;
@@ -314,19 +312,20 @@ static void ipu6_internal_pdata_init(struct ipu6_device *isp)
 		IPU6_REG_ISYS_CSI_TOP_CTRL0_IRQ_STATUS;
 	isys_ipdata.csi2.ctrl0_irq_lnp =
 		IPU6_REG_ISYS_CSI_TOP_CTRL0_IRQ_LEVEL_NOT_PULSE;
-	isys_ipdata.enhanced_iwake = is_ipu6ep_mtl(hw_ver) || is_ipu6ep(hw_ver);
+	isys_ipdata.enhanced_iwake = pci_match_id(ipu6ep_mtl_ids, isp->pdev) ||
+				     pci_match_id(ipu6ep_ids, isp->pdev);
 	psys_ipdata.hw_variant.spc_offset = IPU6_PSYS_SPC_OFFSET;
 	isys_ipdata.csi2.fw_access_port_ofs = CSI_REG_HUB_FW_ACCESS_PORT_OFS;
 
-	if (is_ipu6ep(hw_ver)) {
+	if (pci_match_id(ipu6ep_ids, isp->pdev)) {
 		isys_ipdata.ltr = IPU6EP_LTR_VALUE;
 		isys_ipdata.memopen_threshold = IPU6EP_MIN_MEMOPEN_TH;
 	}
 
-	if (is_ipu6_tgl(hw_ver))
+	if (pci_match_id(ipu6_tgl_ids, isp->pdev))
 		isys_ipdata.csi2.nports = IPU6_TGL_ISYS_CSI2_NPORTS;
 
-	if (is_ipu6ep_mtl(hw_ver)) {
+	if (pci_match_id(ipu6ep_mtl_ids, isp->pdev)) {
 		isys_ipdata.csi2.nports = IPU6EP_MTL_ISYS_CSI2_NPORTS;
 
 		isys_ipdata.csi2.ctrl0_irq_edge =
@@ -347,7 +346,7 @@ static void ipu6_internal_pdata_init(struct ipu6_device *isp)
 		isys_ipdata.memopen_threshold = IPU6EP_MTL_MIN_MEMOPEN_TH;
 	}
 
-	if (is_ipu6se(hw_ver)) {
+	if (pci_match_id(ipu6se_ids, isp->pdev)) {
 		isys_ipdata.csi2.nports = IPU6SE_ISYS_CSI2_NPORTS;
 		isys_ipdata.csi2.irq_mask = IPU6SE_CSI_RX_ERROR_IRQ_MASK;
 		isys_ipdata.num_parallel_streams = IPU6SE_ISYS_NUM_STREAMS;
@@ -460,12 +459,13 @@ ipu6_psys_init(struct pci_dev *pdev, struct device *parent,
 	return psys_adev;
 }
 
-static int ipu6_pci_config_setup(struct pci_dev *dev, u8 hw_ver)
+static int ipu6_pci_config_setup(struct pci_dev *dev)
 {
 	int ret;
 
 	/* No PCI msi capability for IPU6EP */
-	if (is_ipu6ep(hw_ver) || is_ipu6ep_mtl(hw_ver)) {
+	if (pci_match_id(ipu6ep_ids, dev) ||
+	    pci_match_id(ipu6ep_mtl_ids, dev)) {
 		/* likely do nothing as msi not enabled by default */
 		pci_disable_msi(dev);
 		return 0;
@@ -531,26 +531,21 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	isp->cpd_metadata_cmpnt_size = sizeof(struct ipu6_cpd_metadata_cmpnt);
 	switch (id->device) {
 	case PCI_DEVICE_ID_INTEL_IPU6:
-		isp->hw_ver = IPU6_VER_6;
 		isp->cpd_fw_name = IPU6_FIRMWARE_NAME;
 		break;
 	case PCI_DEVICE_ID_INTEL_IPU6SE:
-		isp->hw_ver = IPU6_VER_6SE;
 		isp->cpd_fw_name = IPU6SE_FIRMWARE_NAME;
 		isp->cpd_metadata_cmpnt_size =
 			sizeof(struct ipu6se_cpd_metadata_cmpnt);
 		break;
 	case PCI_DEVICE_ID_INTEL_IPU6EP_ADLP:
 	case PCI_DEVICE_ID_INTEL_IPU6EP_RPLP:
-		isp->hw_ver = IPU6_VER_6EP;
 		isp->cpd_fw_name = IPU6EP_FIRMWARE_NAME;
 		break;
 	case PCI_DEVICE_ID_INTEL_IPU6EP_ADLN:
-		isp->hw_ver = IPU6_VER_6EP;
 		isp->cpd_fw_name = IPU6EPADLN_FIRMWARE_NAME;
 		break;
 	case PCI_DEVICE_ID_INTEL_IPU6EP_MTL:
-		isp->hw_ver = IPU6_VER_6EP_MTL;
 		isp->cpd_fw_name = IPU6EPMTL_FIRMWARE_NAME;
 		break;
 	default:
@@ -570,7 +565,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 
-	ret = ipu6_pci_config_setup(pdev, isp->hw_ver);
+	ret = ipu6_pci_config_setup(pdev);
 	if (ret)
 		return ret;
 
@@ -671,8 +666,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	val = readl(isp->base + BUTTRESS_REG_SKU);
 	sku_id = FIELD_GET(GENMASK(6, 4), val);
 	version = FIELD_GET(GENMASK(3, 0), val);
-	dev_info(dev, "IPU%u-v%u[%x] hardware version %d\n", version, sku_id,
-		 pdev->device, isp->hw_ver);
+	dev_info(dev, "IPU%u-v%u[%x]\n", version, sku_id, pdev->device);
 
 	pm_runtime_put_noidle(dev);
 	pm_runtime_allow(dev);
diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
index 92e3c3414c91..883c83f30682 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -8,6 +8,8 @@
 #include <linux/pci.h>
 #include <linux/types.h>
 
+#include <media/ipu6-pci-table.h>
+
 #include "ipu6-buttress.h"
 
 struct firmware;
@@ -23,39 +25,27 @@ struct ipu6_bus_device;
 #define IPU6EPMTL_FIRMWARE_NAME		"intel/ipu/ipu6epmtl_fw.bin"
 #define IPU6EPADLN_FIRMWARE_NAME	"intel/ipu/ipu6epadln_fw.bin"
 
-enum ipu6_version {
-	IPU6_VER_INVALID = 0,
-	IPU6_VER_6 = 1,
-	IPU6_VER_6SE = 3,
-	IPU6_VER_6EP = 5,
-	IPU6_VER_6EP_MTL = 6,
+static const struct pci_device_id ipu6se_ids[] = {
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6SE), },
+	{ }
 };
 
-/*
- * IPU6 - TGL
- * IPU6SE - JSL
- * IPU6EP - ADL/RPL
- * IPU6EP_MTL - MTL
- */
-static inline bool is_ipu6se(u8 hw_ver)
-{
-	return hw_ver == IPU6_VER_6SE;
-}
-
-static inline bool is_ipu6ep(u8 hw_ver)
-{
-	return hw_ver == IPU6_VER_6EP;
-}
-
-static inline bool is_ipu6ep_mtl(u8 hw_ver)
-{
-	return hw_ver == IPU6_VER_6EP_MTL;
-}
-
-static inline bool is_ipu6_tgl(u8 hw_ver)
-{
-	return hw_ver == IPU6_VER_6;
-}
+static const struct pci_device_id ipu6ep_ids[] = {
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_ADLP), },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_RPLP), },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_ADLN), },
+	{ }
+};
+
+static const struct pci_device_id ipu6ep_mtl_ids[] = {
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_MTL), },
+	{ }
+};
+
+static const struct pci_device_id ipu6_tgl_ids[] = {
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6), },
+	{ }
+};
 
 /*
  * ISYS DMA can overshoot. For higher resolutions over allocation is one line
@@ -84,7 +74,6 @@ struct ipu6_device {
 	void __iomem *base;
 	bool need_ipc_reset;
 	bool secure_mode;
-	u8 hw_ver;
 	bool bus_ready_to_probe;
 };
 
-- 
2.54.0


