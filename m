Return-Path: <linux-media+bounces-19198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0955C993EB9
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 08:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C3551C214C8
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 06:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADFF189910;
	Tue,  8 Oct 2024 06:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cFbinyAG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560B8183CB0
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 06:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728368361; cv=none; b=hrbfVDFHOa8D4/cNVx5Y1I+mhPGLlww+pbOZBhC95LwmKzYdXL5MnX1x/TT2lIeAXQnFZ147EoQehxYI1Sn/d1H+yEgUKo8GzdbRlodXywBu3CwDtjk9hAHrZuyyQe2xhGVrljj5IEjKugB2WidHS73dKPbDExpAsXndUEG+wTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728368361; c=relaxed/simple;
	bh=UfwaAGOTbFuXm+jejJd5FNkqMGztSxOeRgGnN8pTXuw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FlVOlRczzDwbOUCcThhOfgVInT37tkwLe/PFdp0ZP2ijKqfVdgbj3Mbzor6mxbOL733BYryi9QpNAZcKEsXD360UYJ/f2nnyv+AhbWPDw17v75VSfa4rYYmeoo+N5Id21xirBBSRI0tb8iWXzEogwvQxqWR1NqmOKJOF3w628aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cFbinyAG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728368360; x=1759904360;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UfwaAGOTbFuXm+jejJd5FNkqMGztSxOeRgGnN8pTXuw=;
  b=cFbinyAGGgvOTiSgK0JK8+wYG4NLGCgpPRebZQxVcsIpRaHxHCO7UCRw
   gMThGRJht4V3k23lwxCCBOvt6h2Z/SSEL0IwIpJ22Gm9TA9j9RMtNpSFq
   op4/k3LDYpxSOdofN4haKQgpmuz7JOZneXfcGw/iIULlMOCvRgzK3oSBW
   GrVZo1wM6vwZc9rN9K99IXWyllo6kNDXk2+GQKslKrkVnX6ccBZXmLgd0
   CadBZ/JDlMLVvMQD3estQEr/JCupC/mUIjBKlYfh9m8S23rD6WEbxTaLb
   ujwbOlgINibYl9z7p6ygGinuXVc6vI6G3pcy9n+7kdcDEZR9SEktLaPX8
   Q==;
X-CSE-ConnectionGUID: mzzj9a/6QG+7us/PE0S0BA==
X-CSE-MsgGUID: 0xGmKsu6Qta0E9zqKEPZnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="50068169"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="50068169"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 23:19:19 -0700
X-CSE-ConnectionGUID: LamO3HvGRLio5zhVkOyEgQ==
X-CSE-MsgGUID: xnVgNEn3RcK5rAvUQd6NdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="76555650"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by orviesa008.jf.intel.com with ESMTP; 07 Oct 2024 23:19:17 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	andriy.shevchenko@intel.com,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@linux.intel.com,
	bingbu.cao@intel.com
Subject: [PATCH 1/2] media: ipu6: fix the wrong type cast and 64-bit division
Date: Tue,  8 Oct 2024 14:19:15 +0800
Message-Id: <20241008061916.313517-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

This patch fixes the build errors with `i386-allmodconfig`, the
errors are caused by wrong type cast and 64-bit division.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-cpd.c          | 6 +++---
 drivers/media/pci/intel/ipu6/ipu6-fw-com.c       | 8 ++++----
 drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c | 8 ++++----
 drivers/media/pci/intel/ipu6/ipu6-isys.c         | 2 +-
 drivers/media/pci/intel/ipu6/ipu6.c              | 3 ++-
 5 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-cpd.c b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
index 715b21ab4b8e..9b46b91cfc1a 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-cpd.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
@@ -43,9 +43,9 @@
  * 63:56        55      54:48   47:32   31:24   23:0
  * Rsvd         Rsvd    Type    Version Rsvd    Size
  */
-#define PKG_DIR_SIZE_MASK	GENMASK(23, 0)
-#define PKG_DIR_VERSION_MASK	GENMASK(47, 32)
-#define PKG_DIR_TYPE_MASK	GENMASK(54, 48)
+#define PKG_DIR_SIZE_MASK	GENMASK_ULL(23, 0)
+#define PKG_DIR_VERSION_MASK	GENMASK_ULL(47, 32)
+#define PKG_DIR_TYPE_MASK	GENMASK_ULL(54, 48)
 
 static inline const struct ipu6_cpd_ent *ipu6_cpd_get_entry(const void *cpd,
 							    u8 idx)
diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-com.c b/drivers/media/pci/intel/ipu6/ipu6-fw-com.c
index 0b33fe9e703d..6da2aca69bd3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-com.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-com.c
@@ -30,7 +30,7 @@
 
 /* Shared structure between driver and FW - do not modify */
 struct ipu6_fw_sys_queue {
-	u64 host_address;
+	uintptr_t host_address;
 	u32 vied_address;
 	u32 size;
 	u32 token_size;
@@ -40,7 +40,7 @@ struct ipu6_fw_sys_queue {
 } __packed;
 
 struct ipu6_fw_sys_queue_res {
-	u64 host_address;
+	uintptr_t host_address;
 	u32 vied_address;
 	u32 reg;
 } __packed;
@@ -242,7 +242,7 @@ void *ipu6_fw_com_prepare(struct ipu6_fw_com_cfg *cfg,
 	/* initialize input queues */
 	offset += specific_size;
 	res.reg = SYSCOM_QPR_BASE_REG;
-	res.host_address = (u64)(ctx->dma_buffer + offset);
+	res.host_address = (uintptr_t)(ctx->dma_buffer + offset);
 	res.vied_address = ctx->dma_addr + offset;
 	for (i = 0; i < cfg->num_input_queues; i++)
 		ipu6_sys_queue_init(ctx->input_queue + i,
@@ -251,7 +251,7 @@ void *ipu6_fw_com_prepare(struct ipu6_fw_com_cfg *cfg,
 
 	/* initialize output queues */
 	offset += sizeinput;
-	res.host_address = (u64)(ctx->dma_buffer + offset);
+	res.host_address = (uintptr_t)(ctx->dma_buffer + offset);
 	res.vied_address = ctx->dma_addr + offset;
 	for (i = 0; i < cfg->num_output_queues; i++) {
 		ipu6_sys_queue_init(ctx->output_queue + i,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c b/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
index 1715275e6776..1cfc9a45bcea 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
@@ -67,8 +67,8 @@ static void dwc_dphy_write(struct ipu6_isys *isys, u32 phy_id, u32 addr,
 	void __iomem *isys_base = isys->pdata->base;
 	void __iomem *base = isys_base + IPU6_DWC_DPHY_BASE(phy_id);
 
-	dev_dbg(dev, "write: reg 0x%lx = data 0x%x", base + addr - isys_base,
-		data);
+	dev_dbg(dev, "write: reg 0x%lx = data 0x%x",
+		(ulong)(base + addr - isys_base), data);
 	writel(data, base + addr);
 }
 
@@ -80,8 +80,8 @@ static u32 dwc_dphy_read(struct ipu6_isys *isys, u32 phy_id, u32 addr)
 	u32 data;
 
 	data = readl(base + addr);
-	dev_dbg(dev, "read: reg 0x%lx = data 0x%x", base + addr - isys_base,
-		data);
+	dev_dbg(dev, "read: reg 0x%lx = data 0x%x",
+		(ulong)(base + addr - isys_base), data);
 
 	return data;
 }
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index c4aff2e2009b..51c1a567eff8 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -576,7 +576,7 @@ void update_watermark_setting(struct ipu6_isys *isys)
 	}
 
 	enable_iwake(isys, true);
-	calc_fill_time_us = max_sram_size / isys_pb_datarate_mbs;
+	calc_fill_time_us = div64_u64(max_sram_size, isys_pb_datarate_mbs);
 
 	if (isys->pdata->ipdata->enhanced_iwake) {
 		ltr = isys->pdata->ipdata->ltr;
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 7fb707d35309..797d11d1d3b1 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -247,7 +247,8 @@ ipu6_pkg_dir_configure_spc(struct ipu6_device *isp,
 		dma_addr = sg_dma_address(isp->psys->fw_sgt.sgl);
 
 	pg_offset = server_fw_addr - dma_addr;
-	prog = (struct ipu6_cell_program *)((u64)isp->cpd_fw->data + pg_offset);
+	prog = (struct ipu6_cell_program *)((uintptr_t)isp->cpd_fw->data +
+					    pg_offset);
 	spc_base = base + prog->regs_addr;
 	if (spc_base != (base + hw_variant->spc_offset))
 		dev_warn(&isp->pdev->dev,
-- 
2.34.1


