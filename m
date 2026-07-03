Return-Path: <linux-media+bounces-66492-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZCgDK/DUR2rKfwAAu9opvQ
	(envelope-from <linux-media+bounces-66492-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:27:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F50703DB3
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:27:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=cmpcvIpA;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66492-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66492-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 604CB30068D7
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B3E403E87;
	Fri,  3 Jul 2026 15:26:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD420417359
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:26:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092374; cv=none; b=QfhjPYPA9OMxpiwjTTLiCDnUiQiacAwY9OwVTF7TOGiPx/GaD0e18/5tO/G7NKhFTMh0QpK+QdeQtlQrJMRDPPY846Y8e1zUE+J99ryvkqAAfR3e0Y+pdp0ryT5Z+V765jlyEesdYuLL9mZ8P74G0hbwTaL4gktIAw1mCHCnTyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092374; c=relaxed/simple;
	bh=dPtyFUEWHdOkSP6OoM0wvr6KuySKfklBAJMj2JiK2/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h1y456FwTZMOPTMBZCJOZltS2wmPPhK2H+e1FXCqzzcGbsGirdLaxFVFoLq4G3FjIlpn8UGNSbTbl9IZHxWbC7q2Cl2QHmwOGLL7QxeHREATQNmXkvQ4TDtCGTTVTD+eqPQejOlA4/3IvhikyiZD9Ynn742/LsadOrHM8WX/f+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cmpcvIpA; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092372; x=1814628372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dPtyFUEWHdOkSP6OoM0wvr6KuySKfklBAJMj2JiK2/U=;
  b=cmpcvIpA+Kp07swRO+Z2lcXPWc8hoaRy5VbB+MCTcFqqDRAW/LfRK4wa
   3wcvPzxMqyLV1RyGWTVaGHBB9EcPCCNSjmk2WSQ2+vkXnvtzEcXyf2xn8
   pmDCedTBqC7mxIZAcuIa3dgpHFDvqhKBFjIEXITTSgMh+6meTQY/ijGM5
   +YhxC8i5fgjzmcBdcoGCJ83wsaoOz6LfSQ0Wvfvv18JEPttw/I8y3sY4S
   QInLhR1HOwX6ja+hF5CBW7eLFkzWoZLXLk0rjZhV3LUcJQHjZjH3y8R2P
   ClUoxbt9oNApK9q/TImqROZc3qm/+c9L7QRiQNjWBUaFH98+C7wc53PS9
   A==;
X-CSE-ConnectionGUID: 2cMdlHcISmKycZdRiaJuDw==
X-CSE-MsgGUID: xQmAsr/ARruv1gT5/jfblg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396222"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396222"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:11 -0700
X-CSE-ConnectionGUID: 7sLM85MeSu2k6q/Jg2JqWQ==
X-CSE-MsgGUID: hr6Z02W3TIWhIbVyhR4fag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799728"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:10 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 26/41] media: ipu6: Add ipu7 csi phy driver
Date: Fri,  3 Jul 2026 18:24:36 +0300
Message-ID: <20260703152451.1743132-27-antti.laakso@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:antti.laakso@linux.intel.com,m:daxing.li@intel.com,m:ong.hock.yu@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66492-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.intel.com:mid,linux.intel.com:from_mime,intel.com:email,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19F50703DB3

The csi receiver is completely different in ipu7 compared to ipu6,
add driver for it.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/Makefile         |    3 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |    4 +
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |    7 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |    1 +
 drivers/media/pci/intel/ipu6/ipu6.c           |    6 +
 drivers/media/pci/intel/ipu6/ipu6.h           |    2 +
 .../media/pci/intel/ipu6/ipu7-isys-csi-phy.c  | 1074 +++++++++++++++++
 .../media/pci/intel/ipu6/ipu7-isys-csi-phy.h  |   16 +
 8 files changed, 1111 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.h

diff --git a/drivers/media/pci/intel/ipu6/Makefile b/drivers/media/pci/intel/ipu6/Makefile
index 66986d5709ae..676bc978b972 100644
--- a/drivers/media/pci/intel/ipu6/Makefile
+++ b/drivers/media/pci/intel/ipu6/Makefile
@@ -23,6 +23,7 @@ intel-ipu6-isys-y		:= ipu6-isys.o \
 				ipu6-isys-subdev.o \
 				ipu6-isys-mcd-phy.o \
 				ipu6-isys-jsl-phy.o \
-				ipu6-isys-dwc-phy.o
+				ipu6-isys-dwc-phy.o \
+				ipu7-isys-csi-phy.o
 
 obj-$(CONFIG_VIDEO_INTEL_IPU6)	+= intel-ipu6-isys.o
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
index ef367c7dc0fa..dbaaf00af623 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
@@ -16,6 +16,9 @@ struct ipu6_isys_video;
 struct ipu6_isys;
 struct ipu6_isys_stream;
 
+#define PHY_MODE_DPHY		0
+#define PHY_MODE_CPHY		1
+
 #define NR_OF_CSI2_VC		16
 #define INVALID_VC_ID		-1
 #define NR_OF_CSI2_SINK_PADS	1
@@ -44,6 +47,7 @@ struct ipu6_isys_csi2 {
 	unsigned int nlanes;
 	unsigned int port;
 	u32 legacy_irq_mask;
+	unsigned int phy_mode;
 };
 
 struct ipu6_isys_csi2_timing {
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 9dd75e8a6ef6..4a1ff3f27660 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -41,6 +41,9 @@
 #include "ipu6-platform-buttress-regs.h"
 #include "ipu6-platform-isys-csi2-reg.h"
 #include "ipu6-platform-regs.h"
+#include "ipu7-isys-csi-phy.h"
+#include "ipu7-isys-csi2-regs.h"
+#include "ipu7-platform-regs.h"
 
 #define IPU6_BUTTRESS_FABIC_CONTROL		0x68
 #define GDA_ENABLE_IWAKE_INDEX			2
@@ -1003,7 +1006,9 @@ static int isys_probe(struct auxiliary_device *auxdev,
 
 	isys_iwake_watermark_init(isys);
 
-	if (pci_match_id(ipu6se_ids, adev->isp->pdev))
+	if (pci_match_id(ipu7_ids, adev->isp->pdev))
+		isys->phy_set_power = ipu7_isys_csi_phy_set_power;
+	else if (pci_match_id(ipu6se_ids, adev->isp->pdev))
 		isys->phy_set_power = ipu6_isys_jsl_phy_set_power;
 	else if (pci_match_id(ipu6ep_mtl_ids, adev->isp->pdev))
 		isys->phy_set_power = ipu6_isys_dwc_phy_set_power;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index 697c090cc3b1..30539ea5f826 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -138,6 +138,7 @@ struct ipu6_isys {
 	int streams_ref_count[IPU6_ISYS_MAX_STREAMS];
 	void *fwctx;
 	u32 phy_termcal_val;
+	u32 phy_rext_cal;
 	bool need_reset;
 	bool icache_prefetch;
 	bool csi2_cse_ipc_not_supported;
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 31b175e2a4c6..15d1590eda06 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -32,6 +32,7 @@
 #include "ipu6-platform-buttress-regs.h"
 #include "ipu6-platform-isys-csi2-reg.h"
 #include "ipu6-platform-regs.h"
+#include "ipu7-isys-csi2-regs.h"
 
 #define IPU6_PCI_BAR		0
 #define IPU7_PCI_PBBAR		4
@@ -247,6 +248,11 @@ static void ipu6_internal_pdata_init(struct ipu6_device *isp)
 		isys_ipdata.max_devq_size = IPU6SE_DEV_SEND_QUEUE_SIZE;
 		psys_ipdata.hw_variant.spc_offset = IPU6SE_PSYS_SPC_OFFSET;
 	}
+
+	if (pci_match_id(ipu7_ids, isp->pdev)) {
+		isys_ipdata.csi2.gpreg = IPU7_IS_IO_CSI2_GPREGS_BASE;
+		isys_ipdata.csi2.nports = 4;
+	}
 }
 
 static struct ipu6_bus_device *
diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
index 728113b22fd9..1002d8785775 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -152,6 +152,8 @@ struct ipu6_isys_internal_csi2_pdata {
 	u32 ctrl0_irq_lnp;
 	u32 ctrl0_irq_status;
 	u32 fw_access_port_ofs;
+	/* IPU7-specific field */
+	u32 gpreg;
 };
 
 struct ipu6_isys_internal_tpg_pdata {
diff --git a/drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.c b/drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.c
new file mode 100644
index 000000000000..f8d1a7e9e2f5
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.c
@@ -0,0 +1,1074 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 - 2025 Intel Corporation
+ */
+
+#include <linux/bitmap.h>
+#include <linux/bug.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/types.h>
+
+#include <media/mipi-csi2.h>
+#include <media/v4l2-device.h>
+
+#include "ipu6.h"
+#include "ipu6-bus.h"
+#include "ipu6-isys.h"
+#include "ipu6-isys-csi2.h"
+#include "ipu7-isys-csi2-regs.h"
+#include "ipu7-isys-csi-phy.h"
+
+#define PORT_A		0U
+#define PORT_B		1U
+#define PORT_C		2U
+#define PORT_D		3U
+
+#define N_DATA_IDS	8U
+static DECLARE_BITMAP(data_ids, N_DATA_IDS);
+
+struct ddlcal_counter_ref_s {
+	u16 min_mbps;
+	u16 max_mbps;
+
+	u16 ddlcal_counter_ref;
+};
+
+struct ddlcal_params {
+	u16 min_mbps;
+	u16 max_mbps;
+	u16 oa_lanex_hsrx_cdphy_sel_fast;
+	u16 ddlcal_max_phase;
+	u16 phase_bound;
+	u16 ddlcal_dll_fbk;
+	u16 ddlcal_ddl_coarse_bank;
+	u16 fjump_deskew;
+	u16 min_eye_opening_deskew;
+};
+
+struct i_thssettle_params {
+	u16 min_mbps;
+	u16 max_mbps;
+	u16 i_thssettle;
+};
+
+/* lane2 for 4l3t, lane1 for 2l2t */
+struct oa_lane_clk_div_params {
+	u16 min_mbps;
+	u16 max_mbps;
+	u16 oa_lane_hsrx_hs_clk_div;
+};
+
+struct cdr_fbk_cap_prog_params {
+	u16 min_mbps;
+	u16 max_mbps;
+	u16 val;
+};
+
+static const struct ddlcal_counter_ref_s table0[] = {
+	{ 1500, 1999, 118 },
+	{ 2000, 2499, 157 },
+	{ 2500, 3499, 196 },
+	{ 3500, 4499, 274 },
+	{ 4500, 4500, 352 },
+	{ }
+};
+
+static const struct ddlcal_params table1[] = {
+	{ 1500, 1587, 0, 143, 167, 17, 3, 4, 29 },
+	{ 1588, 1687, 0, 135, 167, 15, 3, 4, 27 },
+	{ 1688, 1799, 0, 127, 135, 15, 2, 4, 26 },
+	{ 1800, 1928, 0, 119, 135, 13, 2, 3, 24 },
+	{ 1929, 2076, 0, 111, 135, 13, 2, 3, 23 },
+	{ 2077, 2249, 0, 103, 135, 11, 2, 3, 21 },
+	{ 2250, 2454, 0, 95, 103, 11, 1, 3, 19 },
+	{ 2455, 2699, 0, 87, 103, 9, 1, 3, 18 },
+	{ 2700, 2999, 0, 79, 103, 9, 1, 2, 16 },
+	{ 3000, 3229, 0, 71, 71, 7, 1, 2, 15 },
+	{ 3230, 3599, 1, 87, 103, 9, 1, 3, 18 },
+	{ 3600, 3999, 1, 79, 103, 9, 1, 2, 16 },
+	{ 4000, 4499, 1, 71, 103, 7, 1, 2, 15 },
+	{ 4500, 4500, 1, 63, 71, 7, 0, 2, 13 },
+	{ }
+};
+
+static const struct i_thssettle_params table2[] = {
+	{ 80, 124, 24 },
+	{ 125, 249, 20 },
+	{ 250, 499, 16 },
+	{ 500, 749, 14 },
+	{ 750, 1499, 13 },
+	{ 1500, 4500, 12 },
+	{ }
+};
+
+static const struct oa_lane_clk_div_params table6[] = {
+	{ 80, 159, 0x1 },
+	{ 160, 319, 0x2 },
+	{ 320, 639, 0x3 },
+	{ 640, 1279, 0x4 },
+	{ 1280, 2560, 0x5 },
+	{ 2561, 4500, 0x6 },
+	{ }
+};
+
+static const struct cdr_fbk_cap_prog_params table7[] = {
+	{ 80, 919, 0 },
+	{ 920, 1029, 1 },
+	{ 1030, 1169, 2 },
+	{ 1170, 1349, 3 },
+	{ 1350, 1589, 4 },
+	{ 1590, 1949, 5 },
+	{ 1950, 2499, 6 },
+	{ 2500, 3500, 7 },
+	{ }
+};
+
+static void dwc_phy_write(struct ipu6_isys *isys, u32 id, u32 addr, u16 data)
+{
+	void __iomem *isys_base = isys->pdata->base;
+	void __iomem *base = isys_base + IPU7_IS_IO_CDPHY_BASE(id);
+
+	dev_dbg(&isys->adev->auxdev.dev, "phy write: reg 0x%lx = data 0x%04x",
+		(unsigned long)(base + addr - isys_base), data);
+	writew(data, base + addr);
+}
+
+static u16 dwc_phy_read(struct ipu6_isys *isys, u32 id, u32 addr)
+{
+	void __iomem *isys_base = isys->pdata->base;
+	void __iomem *base = isys_base + IPU7_IS_IO_CDPHY_BASE(id);
+	u16 data;
+
+	data = readw(base + addr);
+	dev_dbg(&isys->adev->auxdev.dev, "phy read: reg 0x%lx = data 0x%04x",
+		(unsigned long)(base + addr - isys_base), data);
+
+	return data;
+}
+
+static void dwc_csi_write(struct ipu6_isys *isys, u32 id, u32 addr, u32 data)
+{
+	void __iomem *isys_base = isys->pdata->base;
+	void __iomem *base = isys_base + IPU7_IS_IO_CSI2_HOST_BASE(id);
+	struct device *dev = &isys->adev->auxdev.dev;
+
+	dev_dbg(dev, "csi write: reg 0x%lx = data 0x%08x",
+		(unsigned long)(base + addr - isys_base), data);
+	writel(data, base + addr);
+	dev_dbg(dev, "csi read: reg 0x%lx = data 0x%08x",
+		(unsigned long)(base + addr - isys_base),
+		readl(base + addr));
+}
+
+static void gpreg_write(struct ipu6_isys *isys, u32 id, u32 addr, u32 data)
+{
+	void __iomem *isys_base = isys->pdata->base;
+	u32 gpreg = isys->pdata->ipdata->csi2.gpreg;
+	void __iomem *base = isys_base + gpreg + 0x1000 * id;
+	struct device *dev = &isys->adev->auxdev.dev;
+
+	dev_dbg(dev, "gpreg write: reg 0x%lx = data 0x%08x",
+		(unsigned long)(base + addr - isys_base), data);
+	writel(data, base + addr);
+	dev_dbg(dev, "gpreg read: reg 0x%lx = data 0x%08x",
+		(unsigned long)(base + addr - isys_base),
+		readl(base + addr));
+}
+
+static u32 dwc_csi_read(struct ipu6_isys *isys, u32 id, u32 addr)
+{
+	void __iomem *isys_base = isys->pdata->base;
+	void __iomem *base = isys_base + IPU7_IS_IO_CSI2_HOST_BASE(id);
+	u32 data;
+
+	data = readl(base + addr);
+	dev_dbg(&isys->adev->auxdev.dev, "csi read: reg 0x%lx = data 0x%x",
+		(unsigned long)(base + addr - isys_base), data);
+
+	return data;
+}
+
+static void dwc_phy_write_mask(struct ipu6_isys *isys, u32 id, u32 addr,
+			       u16 val, u8 lo, u8 hi)
+{
+	u32 temp, mask;
+
+	WARN_ON(lo > hi);
+	WARN_ON(hi > 15);
+
+	mask = ((~0U - (1U << lo) + 1U)) & (~0U >> (31 - hi));
+	temp = dwc_phy_read(isys, id, addr);
+	temp &= ~mask;
+	temp |= (val << lo) & mask;
+	dwc_phy_write(isys, id, addr, temp);
+}
+
+static void dwc_csi_write_mask(struct ipu6_isys *isys, u32 id, u32 addr,
+			       u32 val, u8 hi, u8 lo)
+{
+	u32 temp, mask;
+
+	WARN_ON(lo > hi);
+
+	mask = ((~0U - (1U << lo) + 1U)) & (~0U >> (31 - hi));
+	temp = dwc_csi_read(isys, id, addr);
+	temp &= ~mask;
+	temp |= (val << lo) & mask;
+	dwc_csi_write(isys, id, addr, temp);
+}
+
+static void ipu7_isys_csi_ctrl_cfg(struct ipu6_isys_csi2 *csi2)
+{
+	struct ipu6_isys *isys = csi2->isys;
+	struct device *dev = &isys->adev->auxdev.dev;
+	u32 id, lanes, phy_mode;
+	u32 val;
+
+	id = csi2->port;
+	lanes = csi2->nlanes;
+	phy_mode = csi2->phy_mode;
+	dev_dbg(dev, "csi-%d controller init with %u lanes, phy mode %u",
+		id, lanes, phy_mode);
+
+	val = dwc_csi_read(isys, id, IPU7_VERSION);
+	dev_dbg(dev, "csi-%d controller version = 0x%x", id, val);
+
+	/* num of active data lanes */
+	dwc_csi_write(isys, id, IPU7_N_LANES, lanes - 1);
+	dwc_csi_write(isys, id, IPU7_CDPHY_MODE, phy_mode);
+	dwc_csi_write(isys, id, IPU7_VC_EXTENSION, 0);
+
+	/* only mask PHY_FATAL and PKT_FATAL interrupts */
+	dwc_csi_write(isys, id, IPU7_INT_MSK_PHY_FATAL, 0xff);
+	dwc_csi_write(isys, id, IPU7_INT_MSK_PKT_FATAL, 0x3);
+	dwc_csi_write(isys, id, IPU7_INT_MSK_PHY, 0x0);
+	dwc_csi_write(isys, id, IPU7_INT_MSK_LINE, 0x0);
+	dwc_csi_write(isys, id, IPU7_INT_MSK_BNDRY_FRAME_FATAL, 0x0);
+	dwc_csi_write(isys, id, IPU7_INT_MSK_SEQ_FRAME_FATAL, 0x0);
+	dwc_csi_write(isys, id, IPU7_INT_MSK_CRC_FRAME_FATAL, 0x0);
+	dwc_csi_write(isys, id, IPU7_INT_MSK_PLD_CRC_FATAL, 0x0);
+	dwc_csi_write(isys, id, IPU7_INT_MSK_DATA_ID, 0x0);
+	dwc_csi_write(isys, id, IPU7_INT_MSK_ECC_CORRECTED, 0x0);
+}
+
+static void ipu7_isys_csi_phy_reset(struct ipu6_isys *isys, u32 id)
+{
+	dwc_csi_write(isys, id, IPU7_PHY_SHUTDOWNZ, 0);
+	dwc_csi_write(isys, id, IPU7_DPHY_RSTZ, 0);
+	dwc_csi_write(isys, id, IPU7_CSI2_RESETN, 0);
+	gpreg_write(isys, id, IPU7_PHY_RESET, 0);
+	gpreg_write(isys, id, IPU7_PHY_SHUTDOWN, 0);
+}
+
+/* 8 Data ID monitors, each Data ID is composed by pair of VC and data type */
+static int __dids_config(struct ipu6_isys_csi2 *csi2, u32 id, u8 vc, u8 dt)
+{
+	struct ipu6_isys *isys = csi2->isys;
+	u32 reg, n;
+	u8 lo, hi;
+	int ret;
+
+	dev_dbg(&isys->adev->auxdev.dev,
+		"config CSI-%u with vc:%u dt:0x%02x\n", id, vc, dt);
+
+	dwc_csi_write(isys, id, IPU7_VC_EXTENSION, 0x0);
+	n = find_first_zero_bit(data_ids, N_DATA_IDS);
+	if (n == N_DATA_IDS)
+		return -ENOSPC;
+
+	ret = test_and_set_bit(n, data_ids);
+	if (ret)
+		return -EBUSY;
+
+	reg = n < 4 ? IPU7_DATA_IDS_VC_1 : IPU7_DATA_IDS_VC_2;
+	lo = (n % 4) * 8;
+	hi = lo + 4;
+	dwc_csi_write_mask(isys, id, reg, vc & GENMASK(4, 0), hi, lo);
+
+	reg = n < 4 ? IPU7_DATA_IDS_1 : IPU7_DATA_IDS_2;
+	lo = (n % 4) * 8;
+	hi = lo + 5;
+	dwc_csi_write_mask(isys, id, reg, dt & GENMASK(5, 0), hi, lo);
+
+	return 0;
+}
+
+static int ipu7_isys_csi_ctrl_dids_config(struct ipu6_isys_csi2 *csi2, u32 id)
+{
+	struct v4l2_mbus_frame_desc_entry *desc_entry = NULL;
+	struct device *dev = &csi2->isys->adev->auxdev.dev;
+	struct v4l2_mbus_frame_desc desc;
+	struct v4l2_subdev *ext_sd;
+	struct media_pad *pad;
+	int ret;
+
+	pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
+	if (IS_ERR(pad)) {
+		dev_warn(dev, "can't get remote source pad of %s (%pe)\n",
+			 csi2->asd.sd.name, pad);
+		return PTR_ERR(pad);
+	}
+
+	ext_sd = media_entity_to_v4l2_subdev(pad->entity);
+	if (WARN(!ext_sd, "Failed to get subdev for entity %s\n",
+		 pad->entity->name))
+		return -ENODEV;
+
+	ret = v4l2_subdev_call(ext_sd, pad, get_frame_desc, pad->index, &desc);
+	if (ret)
+		return ret;
+
+	if (desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		dev_warn(dev, "Unsupported frame descriptor type\n");
+		return -EINVAL;
+	}
+
+	for (unsigned int i = 0; i < desc.num_entries; i++) {
+		desc_entry = &desc.entry[i];
+		if (desc_entry->bus.csi2.vc < NR_OF_CSI2_VC) {
+			ret = __dids_config(csi2, id, desc_entry->bus.csi2.vc,
+					    desc_entry->bus.csi2.dt);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+#define CDPHY_TIMEOUT 5000000U
+static int ipu7_isys_phy_ready(struct ipu6_isys *isys, u32 id)
+{
+	void __iomem *isys_base = isys->pdata->base;
+	u32 gpreg_offset = isys->pdata->ipdata->csi2.gpreg;
+	void __iomem *gpreg = isys_base + gpreg_offset + 0x1000 * id;
+	struct device *dev = &isys->adev->auxdev.dev;
+	u32 phy_ready;
+	u32 reg, rext;
+	int ret;
+
+	dev_dbg(dev, "waiting phy ready...\n");
+	ret = readl_poll_timeout(gpreg + IPU7_PHY_READY, phy_ready,
+				 phy_ready & BIT(0) && phy_ready != ~0U,
+				 100, CDPHY_TIMEOUT);
+	dev_dbg(dev, "phy %u ready = 0x%08x\n",
+		id, readl(gpreg + IPU7_PHY_READY));
+	dev_dbg(dev, "csi %u IPU7_PHY_RX = 0x%08x\n", id,
+		dwc_csi_read(isys, id, IPU7_PHY_RX));
+	dev_dbg(dev, "csi %u IPU7_PHY_STOPSTATE = 0x%08x\n", id,
+		dwc_csi_read(isys, id, IPU7_PHY_STOPSTATE));
+	dev_dbg(dev, "csi %u IPU7_PHY_CAL = 0x%08x\n", id,
+		dwc_csi_read(isys, id, IPU7_PHY_CAL));
+	for (unsigned int i = 0; i < 4U; i++) {
+		reg = IPU7_CORE_DIG_DLANE_0_R_HS_RX_0 + (i * 0x400U);
+		dev_dbg(dev, "phy %u DLANE%u skewcal = 0x%04x\n",
+			id, i, dwc_phy_read(isys, id, reg));
+	}
+	dev_dbg(dev, "phy %u DDLCAL = 0x%04x\n", id,
+		dwc_phy_read(isys, id,
+			     IPU7_PPI_CALIBCTRL_R_COMMON_CALIBCTRL_2_5));
+	dev_dbg(dev, "phy %u TERMCAL = 0x%04x\n", id,
+		dwc_phy_read(isys, id, IPU7_PPI_R_TERMCAL_DEBUG_0));
+	dev_dbg(dev, "phy %u LPDCOCAL = 0x%04x\n", id,
+		dwc_phy_read(isys, id, IPU7_PPI_R_LPDCOCAL_DEBUG_RB));
+	dev_dbg(dev, "phy %u HSDCOCAL = 0x%04x\n", id,
+		dwc_phy_read(isys, id, IPU7_PPI_R_HSDCOCAL_DEBUG_RB));
+	dev_dbg(dev, "phy %u LPDCOCAL_VT = 0x%04x\n", id,
+		dwc_phy_read(isys, id, IPU7_PPI_R_LPDCOCAL_DEBUG_VT));
+
+	if (!ret) {
+		if (id) {
+			dev_dbg(dev, "ignore phy %u rext\n", id);
+			return 0;
+		}
+
+		rext = dwc_phy_read(isys, id,
+				    IPU7_CORE_DIG_IOCTRL_R_AFE_CB_CTRL_2_15) &
+					0xfU;
+		dev_dbg(dev, "phy %u rext value = %u\n", id, rext);
+		isys->phy_rext_cal = (rext ? rext : 5);
+
+		return 0;
+	}
+
+	dev_err(dev, "wait phy ready timeout!\n");
+
+	return ret;
+}
+
+static int lookup_table1(u64 mbps)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(table1); i++) {
+		if (mbps >= table1[i].min_mbps && mbps <= table1[i].max_mbps)
+			return i;
+	}
+
+	return -ENXIO;
+}
+
+static const u16 deskew_fine_mem[] = {
+	0x0404, 0x040c, 0x0414, 0x041c,
+	0x0423, 0x0429, 0x0430, 0x043a,
+	0x0445, 0x044a, 0x0450, 0x045a,
+	0x0465, 0x0469, 0x0472, 0x047a,
+	0x0485, 0x0489, 0x0490, 0x049a,
+	0x04a4, 0x04ac, 0x04b4, 0x04bc,
+	0x04c4, 0x04cc, 0x04d4, 0x04dc,
+	0x04e4, 0x04ec, 0x04f4, 0x04fc,
+	0x0504, 0x050c, 0x0514, 0x051c,
+	0x0523, 0x0529, 0x0530, 0x053a,
+	0x0545, 0x054a, 0x0550, 0x055a,
+	0x0565, 0x0569, 0x0572, 0x057a,
+	0x0585, 0x0589, 0x0590, 0x059a,
+	0x05a4, 0x05ac, 0x05b4, 0x05bc,
+	0x05c4, 0x05cc, 0x05d4, 0x05dc,
+	0x05e4, 0x05ec, 0x05f4, 0x05fc,
+	0x0604, 0x060c, 0x0614, 0x061c,
+	0x0623, 0x0629, 0x0632, 0x063a,
+	0x0645, 0x064a, 0x0650, 0x065a,
+	0x0665, 0x0669, 0x0672, 0x067a,
+	0x0685, 0x0689, 0x0690, 0x069a,
+	0x06a4, 0x06ac, 0x06b4, 0x06bc,
+	0x06c4, 0x06cc, 0x06d4, 0x06dc,
+	0x06e4, 0x06ec, 0x06f4, 0x06fc,
+	0x0704, 0x070c, 0x0714, 0x071c,
+	0x0723, 0x072a, 0x0730, 0x073a,
+	0x0745, 0x074a, 0x0750, 0x075a,
+	0x0765, 0x0769, 0x0772, 0x077a,
+	0x0785, 0x0789, 0x0790, 0x079a,
+	0x07a4, 0x07ac, 0x07b4, 0x07bc,
+	0x07c4, 0x07cc, 0x07d4, 0x07dc,
+	0x07e4, 0x07ec, 0x07f4, 0x07fc,
+};
+
+static void ipu7_isys_dphy_config(struct ipu6_isys *isys, u8 id, u8 lanes,
+				  bool aggregation, u64 mbps)
+{
+	struct pci_dev *dev = isys->adev->isp->pdev;
+	u16 hsrxval0 = 0;
+	u16 hsrxval1 = 0;
+	u16 hsrxval2 = 0;
+	int index;
+	u16 reg;
+	u16 val;
+	u32 i;
+
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_RW_COMMON_7, 0, 0, 9);
+	if (mbps > 1500)
+		dwc_phy_write_mask(isys, id, IPU7_PPI_STARTUP_RW_COMMON_DPHY_7,
+				   40, 0, 7);
+	else
+		dwc_phy_write_mask(isys, id, IPU7_PPI_STARTUP_RW_COMMON_DPHY_7,
+				   104, 0, 7);
+
+	dwc_phy_write_mask(isys, id, IPU7_PPI_STARTUP_RW_COMMON_DPHY_8,
+			   80, 0, 7);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_RW_DDLCAL_CFG_0, 191, 0, 9);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_RW_DDLCAL_CFG_7, 34, 7, 12);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_RW_DDLCAL_CFG_1, 38, 8, 15);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_RW_DDLCAL_CFG_2, 4, 12, 15);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_RW_DDLCAL_CFG_2, 2, 10, 11);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_RW_DDLCAL_CFG_2, 1, 8, 8);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_RW_DDLCAL_CFG_2, 38, 0, 7);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_RW_DDLCAL_CFG_2, 1, 9, 9);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_RW_DDLCAL_CFG_4, 10, 0, 9);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_RW_DDLCAL_CFG_6, 20, 0, 9);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_RW_DDLCAL_CFG_7, 19, 0, 6);
+
+	for (i = 0; i < ARRAY_SIZE(table0); i++) {
+		if (mbps >= table0[i].min_mbps && mbps <= table0[i].max_mbps) {
+			dwc_phy_write_mask(isys, id, IPU7_PPI_RW_DDLCAL_CFG_3,
+					   table0[i].ddlcal_counter_ref,
+					   0, 9);
+			break;
+		}
+	}
+
+	index = lookup_table1(mbps);
+	if (index >= 0) {
+		dwc_phy_write_mask(isys, id, IPU7_PPI_RW_DDLCAL_CFG_1,
+				   table1[index].phase_bound, 0, 7);
+		dwc_phy_write_mask(isys, id, IPU7_PPI_RW_DDLCAL_CFG_5,
+				   table1[index].ddlcal_dll_fbk, 4, 9);
+		dwc_phy_write_mask(isys, id, IPU7_PPI_RW_DDLCAL_CFG_5,
+				   table1[index].ddlcal_ddl_coarse_bank, 0, 3);
+
+		reg = IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_8;
+		val = table1[index].oa_lanex_hsrx_cdphy_sel_fast;
+		for (i = 0; i < lanes + 1; i++)
+			dwc_phy_write_mask(isys, id, reg + (i * 0x400), val,
+					   12, 12);
+	}
+
+	reg = IPU7_CORE_DIG_DLANE_0_RW_LP_0;
+	for (i = 0; i < lanes; i++)
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 6, 8, 11);
+
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_2,
+			   0, 0, 0);
+	if (!pci_match_id(ipu7_ids, dev) || id == PORT_B || id == PORT_C) {
+		dwc_phy_write_mask(isys, id,
+				   IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_2,
+				   1, 0, 0);
+		dwc_phy_write_mask(isys, id,
+				   IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_2,
+				   0, 0, 0);
+	} else {
+		dwc_phy_write_mask(isys, id,
+				   IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_2,
+				   0, 0, 0);
+		dwc_phy_write_mask(isys, id,
+				   IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_2,
+				   1, 0, 0);
+	}
+
+	if (lanes == 4 && pci_match_id(ipu7_ids, dev)) {
+		dwc_phy_write_mask(isys, id,
+				   IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_2,
+				   0, 0, 0);
+		dwc_phy_write_mask(isys, id,
+				   IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_2,
+				   0, 0, 0);
+	}
+
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_RW_COMMON_6, 1, 0, 2);
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_RW_COMMON_6, 1, 3, 5);
+
+	reg = IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_12;
+	val = (mbps > 1500) ? 0 : 1;
+	for (i = 0; i < lanes + 1; i++) {
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), val, 1, 1);
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), !val, 3, 3);
+	}
+
+	reg = IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_13;
+	val = (mbps > 1500) ? 0 : 1;
+	for (i = 0; i < lanes + 1; i++) {
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), val, 1, 1);
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), val, 3, 3);
+	}
+
+	if (!pci_match_id(ipu7_ids, dev) || id == PORT_B || id == PORT_C)
+		reg = IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_9;
+	else
+		reg = IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_9;
+
+	for (i = 0; i < ARRAY_SIZE(table6); i++) {
+		if (mbps >= table6[i].min_mbps && mbps <= table6[i].max_mbps) {
+			dwc_phy_write_mask(isys, id, reg,
+					   table6[i].oa_lane_hsrx_hs_clk_div,
+					   5, 7);
+			break;
+		}
+	}
+
+	if (aggregation) {
+		dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_RW_COMMON_0, 1,
+				   1, 1);
+
+		reg = IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_15;
+		dwc_phy_write_mask(isys, id, reg, 3, 3, 4);
+
+		val = (id == PORT_A) ? 3 : 0;
+		reg = IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_15;
+		dwc_phy_write_mask(isys, id, reg, val, 3, 4);
+
+		reg = IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_15;
+		dwc_phy_write_mask(isys, id, reg, 3, 3, 4);
+	}
+
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_DLANE_CLK_RW_HS_RX_0,
+			   28, 0, 7);
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_DLANE_CLK_RW_HS_RX_7,
+			   6, 0, 7);
+
+	reg = IPU7_CORE_DIG_DLANE_0_RW_HS_RX_0;
+	for (i = 0; i < ARRAY_SIZE(table2); i++) {
+		if (mbps >= table2[i].min_mbps && mbps <= table2[i].max_mbps) {
+			u8 j;
+
+			for (j = 0; j < lanes; j++)
+				dwc_phy_write_mask(isys, id, reg + (j * 0x400),
+						   table2[i].i_thssettle,
+						   8, 15);
+			break;
+		}
+	}
+
+	/* deskew */
+	for (i = 0; i < lanes; i++) {
+		reg = IPU7_CORE_DIG_DLANE_0_RW_CFG_1;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400),
+				   ((mbps > 1500) ? 0x1 : 0x2), 2, 3);
+
+		reg = IPU7_CORE_DIG_DLANE_0_RW_HS_RX_2;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400),
+				   ((mbps > 2500) ? 0 : 1), 15, 15);
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 1, 13, 13);
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 7, 9, 12);
+
+		reg = IPU7_CORE_DIG_DLANE_0_RW_LP_0;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 1, 12, 15);
+
+		reg = IPU7_CORE_DIG_DLANE_0_RW_LP_2;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 0, 0, 0);
+
+		reg = IPU7_CORE_DIG_DLANE_0_RW_HS_RX_1;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 16, 0, 7);
+
+		reg = IPU7_CORE_DIG_DLANE_0_RW_HS_RX_3;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 2, 0, 2);
+		index = lookup_table1(mbps);
+		if (index >= 0) {
+			val = table1[index].fjump_deskew;
+			dwc_phy_write_mask(isys, id, reg + (i * 0x400), val,
+					   3, 8);
+		}
+
+		reg = IPU7_CORE_DIG_DLANE_0_RW_HS_RX_4;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 150, 0, 15);
+
+		reg = IPU7_CORE_DIG_DLANE_0_RW_HS_RX_5;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 0, 0, 7);
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 1, 8, 15);
+
+		reg = IPU7_CORE_DIG_DLANE_0_RW_HS_RX_6;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 2, 0, 7);
+		index = lookup_table1(mbps);
+		if (index >= 0) {
+			val = table1[index].min_eye_opening_deskew;
+			dwc_phy_write_mask(isys, id, reg + (i * 0x400), val,
+					   8, 15);
+		}
+		reg = IPU7_CORE_DIG_DLANE_0_RW_HS_RX_7;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 0, 13, 13);
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 0, 15, 15);
+
+		reg = IPU7_CORE_DIG_DLANE_0_RW_HS_RX_9;
+		index = lookup_table1(mbps);
+		if (index >= 0) {
+			val = table1[index].ddlcal_max_phase;
+			dwc_phy_write_mask(isys, id, reg + (i * 0x400),
+					   val, 0, 7);
+		}
+	}
+
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_DLANE_CLK_RW_LP_0,
+			   1, 12, 15);
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_DLANE_CLK_RW_LP_2, 0, 0, 0);
+
+	for (i = 0; i < ARRAY_SIZE(deskew_fine_mem); i++)
+		dwc_phy_write_mask(isys, id,
+				   IPU7_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM,
+				   deskew_fine_mem[i], 0, 15);
+
+	if (mbps > 1500) {
+		hsrxval0 = 4;
+		hsrxval2 = 3;
+	}
+
+	if (mbps > 2500)
+		hsrxval1 = 2;
+
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_9,
+			   hsrxval0, 0, 2);
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_9,
+			   hsrxval0, 0, 2);
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_9,
+			   hsrxval0, 0, 2);
+	if (lanes == 4 && pci_match_id(ipu7_ids, dev)) {
+		dwc_phy_write_mask(isys, id,
+				   IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_9,
+				   hsrxval0, 0, 2);
+		dwc_phy_write_mask(isys, id,
+				   IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_9,
+				   hsrxval0, 0, 2);
+	}
+
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_9,
+			   hsrxval1, 3, 4);
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_9,
+			   hsrxval1, 3, 4);
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_9,
+			   hsrxval1, 3, 4);
+	if (lanes == 4 && pci_match_id(ipu7_ids, dev)) {
+		dwc_phy_write_mask(isys, id,
+				   IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_9,
+				   hsrxval1, 3, 4);
+		dwc_phy_write_mask(isys, id,
+				   IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_9,
+				   hsrxval1, 3, 4);
+	}
+
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_15,
+			   hsrxval2, 0, 2);
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_15,
+			   hsrxval2, 0, 2);
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_15,
+			   hsrxval2, 0, 2);
+	if (lanes == 4 && pci_match_id(ipu7_ids, dev)) {
+		dwc_phy_write_mask(isys, id,
+				   IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_15,
+				   hsrxval2, 0, 2);
+		dwc_phy_write_mask(isys, id,
+				   IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_15,
+				   hsrxval2, 0, 2);
+	}
+
+	/* force and override rext */
+	if (isys->phy_rext_cal && id) {
+		dwc_phy_write_mask(isys, id,
+				   IPU7_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_8,
+				   isys->phy_rext_cal, 0, 3);
+		dwc_phy_write_mask(isys, id,
+				   IPU7_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_7,
+				   1, 11, 11);
+	}
+}
+
+static void ipu7_isys_cphy_config(struct ipu6_isys *isys, u8 id, u8 lanes,
+				  bool aggregation, u64 mbps)
+{
+	struct pci_dev *dev = isys->adev->isp->pdev;
+	u8 trios = 2;
+	u16 coarse_target;
+	u16 deass_thresh;
+	u16 delay_thresh;
+	u16 reset_thresh;
+	u16 cap_prog = 6U;
+	u16 reg;
+	u16 val;
+	u32 i;
+	u64 r64;
+	u32 r;
+
+	if (pci_match_id(ipu7p5_ids, dev))
+		val = 0x15;
+	else
+		val = 0x155;
+
+	if (pci_match_id(ipu7_ids, dev))
+		trios = 3;
+
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_RW_COMMON_7, val, 0, 9);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_STARTUP_RW_COMMON_DPHY_7,
+			   104, 0, 7);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_STARTUP_RW_COMMON_DPHY_8,
+			   16, 0, 7);
+
+	reg = IPU7_CORE_DIG_CLANE_0_RW_LP_0;
+	for (i = 0; i < trios; i++)
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 6, 8, 11);
+
+	val = (mbps > 900U) ? 1U : 0U;
+	for (i = 0; i < trios; i++) {
+		reg = IPU7_CORE_DIG_CLANE_0_RW_HS_RX_0;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 1, 0, 0);
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), val, 1, 1);
+
+		reg = IPU7_CORE_DIG_CLANE_0_RW_HS_RX_1;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 38, 0, 15);
+
+		reg = IPU7_CORE_DIG_CLANE_0_RW_HS_RX_5;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 38, 0, 15);
+
+		reg = IPU7_CORE_DIG_CLANE_0_RW_HS_RX_6;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 10, 0, 15);
+	}
+
+	/*
+	 * Below 900Msps, always use the same value.
+	 * The formula is suitable for data rate 80-3500Msps.
+	 * Timebase (us) = 1, DIV = 32, TDDL (UI) = 0.5
+	 */
+	if (mbps >= 80U)
+		coarse_target = DIV_ROUND_UP_ULL(mbps, 16) - 1;
+	else
+		coarse_target = 56;
+
+	for (i = 0; i < trios; i++) {
+		reg = IPU7_CORE_DIG_CLANE_0_RW_HS_RX_2 + i * 0x400;
+		dwc_phy_write_mask(isys, id, reg, coarse_target, 0, 15);
+	}
+
+	dwc_phy_write_mask(isys, id,
+			   IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_2, 1, 0, 0);
+	dwc_phy_write_mask(isys, id,
+			   IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_2, 0, 0, 0);
+	dwc_phy_write_mask(isys, id,
+			   IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_2, 1, 0, 0);
+
+	if (!pci_match_id(ipu7p5_ids, dev) && lanes == 4) {
+		dwc_phy_write_mask(isys, id,
+				   IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_2,
+				   1, 0, 0);
+		dwc_phy_write_mask(isys, id,
+				   IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_2,
+				   0, 0, 0);
+	}
+
+	for (i = 0; i < trios; i++) {
+		reg = IPU7_CORE_DIG_RW_TRIO0_0 + i * 0x400;
+		dwc_phy_write_mask(isys, id, reg, 1, 6, 8);
+		dwc_phy_write_mask(isys, id, reg, 1, 3, 5);
+		dwc_phy_write_mask(isys, id, reg, 2, 0, 2);
+	}
+
+	deass_thresh = (u16)div64_u64_rem(7 * 1000 * 6, mbps * 5U, &r64) + 1;
+	if (r64 != 0)
+		deass_thresh++;
+
+	reg = IPU7_CORE_DIG_RW_TRIO0_2;
+	for (i = 0; i < trios; i++)
+		dwc_phy_write_mask(isys, id, reg + 0x400 * i,
+				   deass_thresh, 0, 7);
+
+	delay_thresh = div64_u64((224U - (9U * 7U)) * 1000U, 5U * mbps) - 7u;
+
+	if (delay_thresh < 1)
+		delay_thresh = 1;
+
+	reg = IPU7_CORE_DIG_RW_TRIO0_1;
+	for (i = 0; i < trios; i++)
+		dwc_phy_write_mask(isys, id, reg + 0x400 * i,
+				   delay_thresh, 0, 15);
+
+	reset_thresh = (u16)div_u64_rem(2U * 5U * mbps, 7U * 1000U, &r);
+	if (!r)
+		reset_thresh--;
+
+	if (reset_thresh < 1)
+		reset_thresh = 1;
+
+	reg = IPU7_CORE_DIG_RW_TRIO0_0;
+	for (i = 0; i < trios; i++)
+		dwc_phy_write_mask(isys, id, reg + 0x400 * i,
+				   reset_thresh, 9, 11);
+
+	/* Tuning ITMINRX to 2 for CPHY */
+	reg = IPU7_CORE_DIG_CLANE_0_RW_LP_0;
+	for (i = 0; i < trios; i++)
+		dwc_phy_write_mask(isys, id, reg + 0x400 * i, 2, 12, 15);
+
+	reg = IPU7_CORE_DIG_CLANE_0_RW_LP_2;
+	for (i = 0; i < trios; i++)
+		dwc_phy_write_mask(isys, id, reg + 0x400 * i, 0, 0, 0);
+
+	reg = IPU7_CORE_DIG_CLANE_0_RW_HS_RX_0;
+	for (i = 0; i < trios; i++)
+		dwc_phy_write_mask(isys, id, reg + 0x400 * i, 12, 2, 6);
+
+	for (i = 0; i < ARRAY_SIZE(table7); i++) {
+		if (mbps >= table7[i].min_mbps && mbps <= table7[i].max_mbps) {
+			cap_prog = table7[i].val;
+			break;
+		}
+	}
+
+	for (i = 0; i < (lanes + 1); i++) {
+		reg = IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_9 + 0x400 * i;
+		dwc_phy_write_mask(isys, id, reg, 4U, 0, 2);
+		/* Set GMODE to 2 when CPHY >= 1.5Gsps */
+		if (mbps >= 1500)
+			dwc_phy_write_mask(isys, id, reg, 2U, 3, 4);
+		else
+			dwc_phy_write_mask(isys, id, reg, 0U, 3, 4);
+
+		reg = IPU7_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_7 + 0x400 * i;
+		dwc_phy_write_mask(isys, id, reg, cap_prog, 10, 12);
+	}
+}
+
+static int ipu7_isys_phy_config(struct ipu6_isys *isys, u8 id, u8 lanes,
+				bool aggregation)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	u32 phy_mode;
+	s64 link_freq;
+	u64 mbps;
+
+	if (aggregation)
+		link_freq = ipu6_isys_csi2_get_link_freq(&isys->csi2[0]);
+	else
+		link_freq = ipu6_isys_csi2_get_link_freq(&isys->csi2[id]);
+
+	if (link_freq < 0) {
+		dev_err(dev, "get link freq failed (%lld)\n", link_freq);
+		return link_freq;
+	}
+
+	mbps = div_u64(link_freq, 500000);
+	dev_dbg(dev, "config phy %u with lanes %u aggregation %d mbps %lld\n",
+		id, lanes, aggregation, mbps);
+
+	dwc_phy_write_mask(isys, id, IPU7_PPI_STARTUP_RW_COMMON_DPHY_10,
+			   48, 0, 7);
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2,
+			   1, 12, 13);
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_0,
+			   63, 2, 7);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_STARTUP_RW_COMMON_STARTUP_1_1,
+			   563, 0, 11);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_STARTUP_RW_COMMON_DPHY_2,
+			   5, 0, 7);
+	/* bypass the RCAL state (bit6) */
+	if (aggregation && id != PORT_A)
+		dwc_phy_write_mask(isys, id, IPU7_PPI_STARTUP_RW_COMMON_DPHY_2,
+				   0x45, 0, 7);
+
+	dwc_phy_write_mask(isys, id, IPU7_PPI_STARTUP_RW_COMMON_DPHY_6,
+			   39, 0, 7);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_CALIBCTRL_RW_COMMON_BG_0,
+			   500, 0, 8);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_RW_TERMCAL_CFG_0, 38, 0, 6);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_RW_OFFSETCAL_CFG_0, 7, 0, 4);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_RW_LPDCOCAL_TIMEBASE, 153, 0, 9);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_RW_LPDCOCAL_NREF, 800, 0, 10);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_RW_LPDCOCAL_NREF_RANGE,
+			   27, 0, 4);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_RW_LPDCOCAL_TWAIT_CONFIG,
+			   47, 0, 8);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_RW_LPDCOCAL_TWAIT_CONFIG,
+			   127, 9, 15);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_RW_LPDCOCAL_VT_CONFIG, 47, 7, 15);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_RW_LPDCOCAL_VT_CONFIG, 27, 2, 6);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_RW_LPDCOCAL_VT_CONFIG, 3, 0, 1);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_RW_LPDCOCAL_COARSE_CFG, 1, 0, 1);
+	dwc_phy_write_mask(isys, id, IPU7_PPI_RW_COMMON_CFG, 3, 0, 1);
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_0,
+			   0, 10, 10);
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_1,
+			   1, 10, 10);
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_1,
+			   0, 15, 15);
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_3,
+			   3, 8, 9);
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_0,
+			   0, 15, 15);
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_6,
+			   7, 12, 14);
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_7,
+			   0, 8, 10);
+	/* resistance tuning: 1 for 45ohm, 0 for 50ohm */
+	dwc_phy_write_mask(isys, id, IPU7_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_5,
+			   1, 8, 8);
+
+	if (aggregation)
+		phy_mode = isys->csi2[0].phy_mode;
+	else
+		phy_mode = isys->csi2[id].phy_mode;
+
+	if (phy_mode == PHY_MODE_DPHY) {
+		ipu7_isys_dphy_config(isys, id, lanes, aggregation, mbps);
+	} else if (phy_mode == PHY_MODE_CPHY) {
+		ipu7_isys_cphy_config(isys, id, lanes, aggregation, mbps);
+	} else {
+		dev_err(dev, "unsupported phy mode %d!\n",
+			isys->csi2[id].phy_mode);
+	}
+
+	return 0;
+}
+
+static int ipu7_isys_csi_phy_powerup(struct ipu6_isys_csi2 *csi2)
+{
+	struct ipu6_isys *isys = csi2->isys;
+	struct pci_dev *dev = isys->adev->isp->pdev;
+	u32 lanes = csi2->nlanes;
+	bool aggregation = false;
+	u32 id = csi2->port;
+	int ret;
+
+	/* lanes remapping for aggregation (port AB) mode */
+	if (!pci_match_id(ipu7_ids, dev) && lanes > 2 && id == PORT_A) {
+		aggregation = true;
+		lanes = 2;
+	}
+
+	ipu7_isys_csi_phy_reset(isys, id);
+	gpreg_write(isys, id, IPU7_PHY_CLK_LANE_CONTROL, 0x1);
+	gpreg_write(isys, id, IPU7_PHY_CLK_LANE_FORCE_CONTROL, 0x2);
+	gpreg_write(isys, id, IPU7_PHY_LANE_CONTROL_EN, (1U << lanes) - 1U);
+	gpreg_write(isys, id, IPU7_PHY_LANE_FORCE_CONTROL, 0xf);
+	gpreg_write(isys, id, IPU7_PHY_MODE, csi2->phy_mode);
+
+	/* config PORT_B if aggregation mode */
+	if (aggregation) {
+		ipu7_isys_csi_phy_reset(isys, PORT_B);
+		gpreg_write(isys, PORT_B, IPU7_PHY_CLK_LANE_CONTROL, 0x0);
+		gpreg_write(isys, PORT_B, IPU7_PHY_LANE_CONTROL_EN, 0x3);
+		gpreg_write(isys, PORT_B, IPU7_PHY_CLK_LANE_FORCE_CONTROL, 0x2);
+		gpreg_write(isys, PORT_B, IPU7_PHY_LANE_FORCE_CONTROL, 0xf);
+		gpreg_write(isys, PORT_B, IPU7_PHY_MODE, csi2->phy_mode);
+	}
+
+	ipu7_isys_csi_ctrl_cfg(csi2);
+	ipu7_isys_csi_ctrl_dids_config(csi2, id);
+
+	ret = ipu7_isys_phy_config(isys, id, lanes, aggregation);
+	if (ret < 0)
+		return ret;
+
+	gpreg_write(isys, id, IPU7_PHY_RESET, 1);
+	gpreg_write(isys, id, IPU7_PHY_SHUTDOWN, 1);
+	dwc_csi_write(isys, id, IPU7_DPHY_RSTZ, 1);
+	dwc_csi_write(isys, id, IPU7_PHY_SHUTDOWNZ, 1);
+	dwc_csi_write(isys, id, IPU7_CSI2_RESETN, 1);
+
+	ret = ipu7_isys_phy_ready(isys, id);
+	if (ret < 0)
+		return ret;
+
+	gpreg_write(isys, id, IPU7_PHY_LANE_FORCE_CONTROL, 0);
+	gpreg_write(isys, id, IPU7_PHY_CLK_LANE_FORCE_CONTROL, 0);
+
+	/* config PORT_B if aggregation mode */
+	if (aggregation) {
+		ret = ipu7_isys_phy_config(isys, PORT_B, 2, aggregation);
+		if (ret < 0)
+			return ret;
+
+		gpreg_write(isys, PORT_B, IPU7_PHY_RESET, 1);
+		gpreg_write(isys, PORT_B, IPU7_PHY_SHUTDOWN, 1);
+		dwc_csi_write(isys, PORT_B, IPU7_DPHY_RSTZ, 1);
+		dwc_csi_write(isys, PORT_B, IPU7_PHY_SHUTDOWNZ, 1);
+		dwc_csi_write(isys, PORT_B, IPU7_CSI2_RESETN, 1);
+		ret = ipu7_isys_phy_ready(isys, PORT_B);
+		if (ret < 0)
+			return ret;
+
+		gpreg_write(isys, PORT_B, IPU7_PHY_LANE_FORCE_CONTROL, 0);
+		gpreg_write(isys, PORT_B, IPU7_PHY_CLK_LANE_FORCE_CONTROL, 0);
+	}
+
+	return 0;
+}
+
+static void ipu7_isys_csi_phy_powerdown(struct ipu6_isys_csi2 *csi2)
+{
+	struct ipu6_isys *isys = csi2->isys;
+	struct pci_dev *dev = isys->adev->isp->pdev;
+
+	ipu7_isys_csi_phy_reset(isys, csi2->port);
+	if (!pci_match_id(ipu7_ids, dev) &&
+	    csi2->nlanes > 2U && csi2->port == PORT_A)
+		ipu7_isys_csi_phy_reset(isys, PORT_B);
+}
+
+int ipu7_isys_csi_phy_set_power(struct ipu6_isys *isys,
+				 struct ipu6_isys_csi2_config *cfg,
+				 const struct ipu6_isys_csi2_timing *timing,
+				 bool on)
+{
+	struct ipu6_isys_csi2 *csi2 = &isys->csi2[cfg->port];
+
+	if (on)
+		return ipu7_isys_csi_phy_powerup(csi2);
+
+	ipu7_isys_csi_phy_powerdown(csi2);
+
+	return 0;
+}
diff --git a/drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.h b/drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.h
new file mode 100644
index 000000000000..849fe888db07
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2026 Intel Corporation */
+
+#ifndef IPU7_ISYS_CSI_PHY_H
+#define IPU7_ISYS_CSI_PHY_H
+
+struct ipu6_isys;
+struct ipu6_isys_csi2_config;
+struct ipu6_isys_csi2_timing;
+
+int ipu7_isys_csi_phy_set_power(struct ipu6_isys *isys,
+				struct ipu6_isys_csi2_config *cfg,
+				const struct ipu6_isys_csi2_timing *timing,
+				bool on);
+
+#endif /* IPU7_ISYS_CSI_PHY_H */
-- 
2.54.0


