Return-Path: <linux-media+bounces-19298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB033995EE8
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 07:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46B381F23A39
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 05:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4BF1156653;
	Wed,  9 Oct 2024 05:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="agSaw6aT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D95B15098F
	for <linux-media@vger.kernel.org>; Wed,  9 Oct 2024 05:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728451237; cv=none; b=IZVQfFZroBlLLwdFyTmPpHYg78mfNFFbnzm46m0S6FDKF6W+ApaW4lqrz3QAEfOrI37sOWHMSILnD8mMsqpXh7A9gU0SbIRVdRfwuVNjC1BlB5A5XF7N+FR/qgeSbXogjraTsQVDgUQSnRCFPHTToK7N7tLIYsPTJhDakWGWyA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728451237; c=relaxed/simple;
	bh=WaHl/YrTySm7dwFd5Wn7+xcmWXSp4Daia0Mn15ziKz8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p8LNCuEiBgvHvRczevZODG2xM5NqPJu9tQTB2vUn6D5K4jYYIKyam2lQQ18WJ7VnOmkJ9mvbPLs7JtPbSU+y71TFgWOqg5v1GkBiMCM++/dsD2YyzIM0yfd0oWSEjyi0UF4gVGaTsuzncbrL4tPiMJgMxAxFIetcRFXjr/5QE3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=agSaw6aT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728451235; x=1759987235;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WaHl/YrTySm7dwFd5Wn7+xcmWXSp4Daia0Mn15ziKz8=;
  b=agSaw6aTxOS5g3EUYyum9iPeI3HsZgGKYjoZwaLwdINOpe77LjesbRaw
   4xE0BG+Rfng+TCdi6rwSGf5Xp/l3lG3nGxFiu2D9LZG2QiL77NppQ5lSv
   edbNNO3Hyr92jQeLkUWrwc7/wFsiGcXZOA0vfca6k+6NjJmh6M+KIKolO
   y8z/tVKuCMX7jZN5gpbhJsRWatcARvFLOhZ2R+wWwODoIIK5xQXUHjxiV
   3sAFKc5Kz8xsRKKQ0UzPRLDbp2eAfKcv3VKDzWKCyldwzbaGWC2vaRBuG
   Yha8va1SrpDhwAvdpsxNVvETx84+Gk0m1oy+ZUFumAhtqEMC4Qmc38KR6
   Q==;
X-CSE-ConnectionGUID: u3qZu5MgRgavr4fney8WVw==
X-CSE-MsgGUID: +uFitCfKRnKmLF/KE96vjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38315000"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="38315000"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 22:20:34 -0700
X-CSE-ConnectionGUID: 0FFUDwl0RVmyni1qOwFPLA==
X-CSE-MsgGUID: b/6nyleFQjqFFT1jz67SUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="76441369"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by fmviesa010.fm.intel.com with ESMTP; 08 Oct 2024 22:20:32 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	sakari.ailus@linux.intel.com
Cc: andriy.shevchenko@intel.com,
	bingbu.cao@linux.intel.com,
	bingbu.cao@intel.com
Subject: [PATCH v2 1/2] media: ipu6: fix the wrong type casting and 64-bit division
Date: Wed,  9 Oct 2024 13:20:30 +0800
Message-Id: <20241009052031.2798618-1-bingbu.cao@intel.com>
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
errors are caused by wrong type casting and 64-bit division.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
v2: keep the type in ABI unchanged, fix comments from Andy
---
 drivers/media/pci/intel/ipu6/ipu6-cpd.c          | 6 +++---
 drivers/media/pci/intel/ipu6/ipu6-fw-com.c       | 8 ++++----
 drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c | 4 ++--
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c   | 6 +++---
 drivers/media/pci/intel/ipu6/ipu6-isys.c         | 6 +++---
 drivers/media/pci/intel/ipu6/ipu6-isys.h         | 2 +-
 drivers/media/pci/intel/ipu6/ipu6.c              | 3 ++-
 7 files changed, 18 insertions(+), 17 deletions(-)

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
index 0b33fe9e703d..958196a6b263 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-com.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-com.c
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
@@ -358,7 +358,7 @@ void *ipu6_send_get_token(struct ipu6_fw_com_context *ctx, int q_nbr)
 
 	index = readl(q_dmem + FW_COM_WR_REG);
 
-	return (void *)(q->host_address + index * q->token_size);
+	return (void *)((uintptr_t)q->host_address + index * q->token_size);
 }
 EXPORT_SYMBOL_NS_GPL(ipu6_send_get_token, INTEL_IPU6);
 
@@ -395,7 +395,7 @@ void *ipu6_recv_get_token(struct ipu6_fw_com_context *ctx, int q_nbr)
 	if (!packets)
 		return NULL;
 
-	return (void *)(q->host_address + rd * q->token_size);
+	return (void *)((uintptr_t)q->host_address + rd * q->token_size);
 }
 EXPORT_SYMBOL_NS_GPL(ipu6_recv_get_token, INTEL_IPU6);
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c b/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
index 1715275e6776..db2874843453 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
@@ -67,7 +67,7 @@ static void dwc_dphy_write(struct ipu6_isys *isys, u32 phy_id, u32 addr,
 	void __iomem *isys_base = isys->pdata->base;
 	void __iomem *base = isys_base + IPU6_DWC_DPHY_BASE(phy_id);
 
-	dev_dbg(dev, "write: reg 0x%lx = data 0x%x", base + addr - isys_base,
+	dev_dbg(dev, "write: reg 0x%zx = data 0x%x", base + addr - isys_base,
 		data);
 	writel(data, base + addr);
 }
@@ -80,7 +80,7 @@ static u32 dwc_dphy_read(struct ipu6_isys *isys, u32 phy_id, u32 addr)
 	u32 data;
 
 	data = readl(base + addr);
-	dev_dbg(dev, "read: reg 0x%lx = data 0x%x", base + addr - isys_base,
+	dev_dbg(dev, "read: reg 0x%zx = data 0x%x", base + addr - isys_base,
 		data);
 
 	return data;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index b37561352ead..387963529adb 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -543,7 +543,7 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 
 		ret = ipu6_isys_fw_pin_cfg(__av, stream_cfg);
 		if (ret < 0) {
-			ipu6_put_fw_msg_buf(av->isys, (u64)stream_cfg);
+			ipu6_put_fw_msg_buf(av->isys, (uintptr_t)stream_cfg);
 			return ret;
 		}
 	}
@@ -560,7 +560,7 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 				       IPU6_FW_ISYS_SEND_TYPE_STREAM_OPEN);
 	if (ret < 0) {
 		dev_err(dev, "can't open stream (%d)\n", ret);
-		ipu6_put_fw_msg_buf(av->isys, (u64)stream_cfg);
+		ipu6_put_fw_msg_buf(av->isys, (uintptr_t)stream_cfg);
 		return ret;
 	}
 
@@ -569,7 +569,7 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 	tout = wait_for_completion_timeout(&stream->stream_open_completion,
 					   IPU6_FW_CALL_TIMEOUT_JIFFIES);
 
-	ipu6_put_fw_msg_buf(av->isys, (u64)stream_cfg);
+	ipu6_put_fw_msg_buf(av->isys, (uintptr_t)stream_cfg);
 
 	if (!tout) {
 		dev_err(dev, "stream open time out\n");
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index c4aff2e2009b..5b5abf872c15 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -576,7 +576,7 @@ void update_watermark_setting(struct ipu6_isys *isys)
 	}
 
 	enable_iwake(isys, true);
-	calc_fill_time_us = max_sram_size / isys_pb_datarate_mbs;
+	calc_fill_time_us = div64_u64(max_sram_size, isys_pb_datarate_mbs);
 
 	if (isys->pdata->ipdata->enhanced_iwake) {
 		ltr = isys->pdata->ipdata->ltr;
@@ -1026,11 +1026,11 @@ void ipu6_cleanup_fw_msg_bufs(struct ipu6_isys *isys)
 	spin_unlock_irqrestore(&isys->listlock, flags);
 }
 
-void ipu6_put_fw_msg_buf(struct ipu6_isys *isys, u64 data)
+void ipu6_put_fw_msg_buf(struct ipu6_isys *isys, uintptr_t data)
 {
 	struct isys_fw_msgs *msg;
 	unsigned long flags;
-	u64 *ptr = (u64 *)data;
+	void *ptr = (void *)data;
 
 	if (!ptr)
 		return;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index 86dfc2eff5d0..610b60e69152 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -180,7 +180,7 @@ struct isys_fw_msgs {
 };
 
 struct isys_fw_msgs *ipu6_get_fw_msg_buf(struct ipu6_isys_stream *stream);
-void ipu6_put_fw_msg_buf(struct ipu6_isys *isys, u64 data);
+void ipu6_put_fw_msg_buf(struct ipu6_isys *isys, uintptr_t data);
 void ipu6_cleanup_fw_msg_bufs(struct ipu6_isys *isys);
 
 extern const struct v4l2_ioctl_ops ipu6_isys_ioctl_ops;
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


