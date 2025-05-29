Return-Path: <linux-media+bounces-33567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E16AAC7707
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 06:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89D701C01EAC
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 04:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4714D24EAB1;
	Thu, 29 May 2025 04:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c0eyZmf/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4C324DFF4
	for <linux-media@vger.kernel.org>; Thu, 29 May 2025 04:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748492019; cv=none; b=rHs3Zhmwww3e/S20RqBrSEpjeuUfp37GG1ZwveK8RuWQMor3DGC+Y6z64TE+KvBPEq6ZbqK0L6tPad5CQkoA771/ZP20BmzWq9U9A8p5K/nj/owbyzImtLhhuAJXrzB6J1+MeHmmpd8S6csD2jz/NZuiyVixHIkBRTw9qodw3C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748492019; c=relaxed/simple;
	bh=s0/4wFYmoTxLFh9sL8uCqmo7722amCX/2sDO0bizrNM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=otEG21V9Bd26jqsJh78LdwGOxAFw9yhMutjFuRdvtsyq6JJENC3AlhEF5vC0yyS4N18ABwIgqRTQ50RHX3zwbyOTPkCctHZWwb4e9qlQqwP2NyPWw5mi4X1sR1PINegt7ZnaIAF1GBK7M486N4KRFMceNEfpS+05UAbaXbYtq7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c0eyZmf/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748492017; x=1780028017;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s0/4wFYmoTxLFh9sL8uCqmo7722amCX/2sDO0bizrNM=;
  b=c0eyZmf/r3dwXGnIeSDlGLUNe4QZqfay5Ll5xnw/EN/aknuR2V5fo9vG
   I6ZpMsL2XLVh96QmexUCjZBON7H/J4zblAIRLDJ0X6xQQ8sM6FL0hrig5
   fTx0kCr1F2tjipTOaqMdaM84FwQiYpbHf/ODXwikioXFQX7laYjkcJd7h
   ajFKriR71GMwL+zGIYW5IA+f/oYgEPDm7OQEfAnbBcqqh9BKfo3xt11zf
   CXTKN6f9jMswbRmxOMBzWm4o74QHTPRLGutAGBs/13bM8lxYi65HSMR7/
   ftLGFia2JtSzJlGwcnzX+gsE8ZW5sl2m6Ui5LE+c+YPfGx5x7W8hdDxOF
   A==;
X-CSE-ConnectionGUID: MensY2z1RBmna76uqxiCIw==
X-CSE-MsgGUID: KGdLuOoGT/OMMlMrVtqr5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="75928567"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="75928567"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 21:13:37 -0700
X-CSE-ConnectionGUID: WJ0OlvFqQnG09Ui1Lz6VsQ==
X-CSE-MsgGUID: j6dC+za3QSKcFblGKm6JEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="148211548"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by orviesa003.jf.intel.com with ESMTP; 28 May 2025 21:13:34 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	stanislaw.gruszka@linux.intel.com
Cc: laurent.pinchart@ideasonboard.com,
	jerry.w.hu@intel.com,
	hao.yao@intel.com,
	tian.shu.qiu@intel.com,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH v3 3/7] media: staging/ipu7: add firmware parse, syscom interface and boot
Date: Thu, 29 May 2025 12:13:19 +0800
Message-Id: <20250529041323.3026998-4-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529041323.3026998-1-bingbu.cao@intel.com>
References: <20250529041323.3026998-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

IPU7 irmware is generated and released as signed Code Partition
Directory (CPD) format file which is aligned with the SPI flash code
partition definition. The driver parses the CPD based on the layout.

Syscom is an inter-process(or) communication mechanism between an IPU and
host. Syscom uses message queues for message exchange between IPU and
host. Each message queue has its consumer and producer, host queue
messages to firmware as the producer and then firmware to dequeue the
messages as consumer and vice versa. IPU and host use shared registers or
memory to reside the read and write indices which are updated by consumer
and producer.

IPU7 firmware defined its boot sequence, driver setup the boot
configuration and program the boot parameters to start and run
the firmware.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu7/ipu7-boot.c   | 431 +++++++++++++++++++++++
 drivers/staging/media/ipu7/ipu7-boot.h   |  25 ++
 drivers/staging/media/ipu7/ipu7-cpd.c    | 276 +++++++++++++++
 drivers/staging/media/ipu7/ipu7-cpd.h    |  16 +
 drivers/staging/media/ipu7/ipu7-syscom.c |  78 ++++
 drivers/staging/media/ipu7/ipu7-syscom.h |  35 ++
 6 files changed, 861 insertions(+)
 create mode 100644 drivers/staging/media/ipu7/ipu7-boot.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-boot.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-cpd.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-cpd.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-syscom.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-syscom.h

diff --git a/drivers/staging/media/ipu7/ipu7-boot.c b/drivers/staging/media/ipu7/ipu7-boot.c
new file mode 100644
index 000000000000..8e58d00566b4
--- /dev/null
+++ b/drivers/staging/media/ipu7/ipu7-boot.c
@@ -0,0 +1,431 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022 - 2025 Intel Corporation
+ */
+
+#include <linux/bug.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/module.h>
+#include <linux/iopoll.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+#include "abi/ipu7_fw_boot_abi.h"
+
+#include "ipu7.h"
+#include "ipu7-boot.h"
+#include "ipu7-bus.h"
+#include "ipu7-buttress-regs.h"
+#include "ipu7-dma.h"
+#include "ipu7-platform-regs.h"
+#include "ipu7-syscom.h"
+
+#define IPU_FW_START_STOP_TIMEOUT		2000
+#define IPU_BOOT_CELL_RESET_TIMEOUT		(2 * USEC_PER_SEC)
+#define BOOT_STATE_IS_CRITICAL(s)	IA_GOFO_FW_BOOT_STATE_IS_CRITICAL(s)
+#define BOOT_STATE_IS_READY(s)		((s) == IA_GOFO_FW_BOOT_STATE_READY)
+#define BOOT_STATE_IS_INACTIVE(s)	((s) == IA_GOFO_FW_BOOT_STATE_INACTIVE)
+
+struct ipu7_boot_context {
+	u32 base;
+	u32 dmem_address;
+	u32 status_ctrl_reg;
+	u32 fw_start_address_reg;
+	u32 fw_code_base_reg;
+};
+
+static const struct ipu7_boot_context contexts[IPU_SUBSYS_NUM] = {
+	{
+		/* ISYS */
+		.dmem_address = IPU_ISYS_DMEM_OFFSET,
+		.status_ctrl_reg = BUTTRESS_REG_DRV_IS_UCX_CONTROL_STATUS,
+		.fw_start_address_reg = BUTTRESS_REG_DRV_IS_UCX_START_ADDR,
+		.fw_code_base_reg = IS_UC_CTRL_BASE
+	},
+	{
+		/* PSYS */
+		.dmem_address = IPU_PSYS_DMEM_OFFSET,
+		.status_ctrl_reg = BUTTRESS_REG_DRV_PS_UCX_CONTROL_STATUS,
+		.fw_start_address_reg = BUTTRESS_REG_DRV_PS_UCX_START_ADDR,
+		.fw_code_base_reg = PS_UC_CTRL_BASE
+	}
+};
+
+static u32 get_fw_boot_reg_addr(const struct ipu7_bus_device *adev,
+				enum ia_gofo_buttress_reg_id reg)
+{
+	u32 base = (adev->subsys == IPU_IS) ? 0U : (u32)IA_GOFO_FW_BOOT_ID_MAX;
+
+	return BUTTRESS_FW_BOOT_PARAMS_ENTRY(base + (u32)reg);
+}
+
+static void write_fw_boot_param(const struct ipu7_bus_device *adev,
+				enum ia_gofo_buttress_reg_id reg,
+				u32 val)
+{
+	void __iomem *base = adev->isp->base;
+
+	dev_dbg(&adev->auxdev.dev,
+		"write boot param reg: %d addr: %x val: 0x%x\n",
+		reg, get_fw_boot_reg_addr(adev, reg), val);
+	writel(val, base + get_fw_boot_reg_addr(adev, reg));
+}
+
+static u32 read_fw_boot_param(const struct ipu7_bus_device *adev,
+			      enum ia_gofo_buttress_reg_id reg)
+{
+	void __iomem *base = adev->isp->base;
+
+	return readl(base + get_fw_boot_reg_addr(adev, reg));
+}
+
+static int ipu7_boot_cell_reset(const struct ipu7_bus_device *adev)
+{
+	const struct ipu7_boot_context *ctx = &contexts[adev->subsys];
+	const struct device *dev = &adev->auxdev.dev;
+	u32 ucx_ctrl_status = ctx->status_ctrl_reg;
+	u32 timeout = IPU_BOOT_CELL_RESET_TIMEOUT;
+	void __iomem *base = adev->isp->base;
+	u32 val, val2;
+	int ret;
+
+	dev_dbg(dev, "cell enter reset...\n");
+	val = readl(base + ucx_ctrl_status);
+	dev_dbg(dev, "cell_ctrl_reg addr = 0x%x, val = 0x%x\n",
+		ucx_ctrl_status, val);
+
+	dev_dbg(dev, "force cell reset...\n");
+	val |= UCX_CTL_RESET;
+	val &= ~UCX_CTL_RUN;
+
+	dev_dbg(dev, "write status_ctrl_reg(0x%x) to 0x%x\n",
+		ucx_ctrl_status, val);
+	writel(val, base + ucx_ctrl_status);
+
+	ret = readl_poll_timeout(base + ucx_ctrl_status, val2,
+				 (val2 & 0x3U) == (val & 0x3U), 100, timeout);
+	if (ret) {
+		dev_err(dev, "cell enter reset timeout. status: 0x%x\n", val2);
+		return -ETIMEDOUT;
+	}
+
+	dev_dbg(dev, "cell exit reset...\n");
+	val = readl(base + ucx_ctrl_status);
+	WARN((!(val & UCX_CTL_RESET) || val & UCX_CTL_RUN),
+	     "cell status 0x%x", val);
+
+	val &= ~(UCX_CTL_RESET | UCX_CTL_RUN);
+	dev_dbg(dev, "write status_ctrl_reg(0x%x) to 0x%x\n",
+		ucx_ctrl_status, val);
+	writel(val, base + ucx_ctrl_status);
+
+	ret = readl_poll_timeout(base + ucx_ctrl_status, val2,
+				 (val2 & 0x3U) == (val & 0x3U), 100, timeout);
+	if (ret) {
+		dev_err(dev, "cell exit reset timeout. status: 0x%x\n", val2);
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static void ipu7_boot_cell_start(const struct ipu7_bus_device *adev)
+{
+	const struct ipu7_boot_context *ctx = &contexts[adev->subsys];
+	void __iomem *base = adev->isp->base;
+	const struct device *dev = &adev->auxdev.dev;
+	u32 val;
+
+	dev_dbg(dev, "starting cell...\n");
+	val = readl(base + ctx->status_ctrl_reg);
+	WARN_ON(val & (UCX_CTL_RESET | UCX_CTL_RUN));
+
+	val &= ~UCX_CTL_RESET;
+	val |= UCX_CTL_RUN;
+	dev_dbg(dev, "write status_ctrl_reg(0x%x) to 0x%x\n",
+		ctx->status_ctrl_reg, val);
+	writel(val, base + ctx->status_ctrl_reg);
+}
+
+static void ipu7_boot_cell_stop(const struct ipu7_bus_device *adev)
+{
+	const struct ipu7_boot_context *ctx = &contexts[adev->subsys];
+	void __iomem *base = adev->isp->base;
+	const struct device *dev = &adev->auxdev.dev;
+	u32 val;
+
+	dev_dbg(dev, "stopping cell...\n");
+
+	val = readl(base + ctx->status_ctrl_reg);
+	val &= ~UCX_CTL_RUN;
+	dev_dbg(dev, "write status_ctrl_reg(0x%x) to 0x%x\n",
+		ctx->status_ctrl_reg, val);
+	writel(val, base + ctx->status_ctrl_reg);
+
+	/* Wait for uC transactions complete */
+	usleep_range(10, 20);
+
+	val = readl(base + ctx->status_ctrl_reg);
+	val |= UCX_CTL_RESET;
+	dev_dbg(dev, "write status_ctrl_reg(0x%x) to 0x%x\n",
+		ctx->status_ctrl_reg, val);
+	writel(val, base + ctx->status_ctrl_reg);
+}
+
+static int ipu7_boot_cell_init(const struct ipu7_bus_device *adev)
+{
+	const struct ipu7_boot_context *ctx = &contexts[adev->subsys];
+	void __iomem *base = adev->isp->base;
+
+	dev_dbg(&adev->auxdev.dev, "write fw_start_address_reg(0x%x) to 0x%x\n",
+		ctx->fw_start_address_reg, adev->fw_entry);
+	writel(adev->fw_entry, base + ctx->fw_start_address_reg);
+
+	return ipu7_boot_cell_reset(adev);
+}
+
+static void init_boot_config(struct ia_gofo_boot_config *boot_config,
+			     u32 length, u8 major)
+{
+	/* syscom version, new syscom2 version */
+	boot_config->length = length;
+	boot_config->config_version.major = 1U;
+	boot_config->config_version.minor = 0U;
+	boot_config->config_version.subminor = 0U;
+	boot_config->config_version.patch = 0U;
+
+	/* msg version for task interface */
+	boot_config->client_version_support.num_versions = 1U;
+	boot_config->client_version_support.versions[0].major = major;
+	boot_config->client_version_support.versions[0].minor = 0U;
+	boot_config->client_version_support.versions[0].subminor = 0U;
+	boot_config->client_version_support.versions[0].patch = 0U;
+}
+
+int ipu7_boot_init_boot_config(struct ipu7_bus_device *adev,
+			       struct syscom_queue_config *qconfigs,
+			       int num_queues, u32 uc_freq,
+			       dma_addr_t subsys_config, u8 major)
+{
+	u32 total_queue_size = 0, total_queue_size_aligned = 0;
+	struct ipu7_syscom_context *syscom = adev->syscom;
+	struct ia_gofo_boot_config *boot_config;
+	struct syscom_queue_params_config *cfgs;
+	struct device *dev = &adev->auxdev.dev;
+	struct syscom_config_s *syscfg;
+	dma_addr_t queue_mem_dma_ptr;
+	void *queue_mem_ptr;
+	unsigned int i;
+
+	dev_dbg(dev, "boot config queues_nr: %d freq: %u sys_conf: 0x%llx\n",
+		num_queues, uc_freq, subsys_config);
+	/* Allocate boot config. */
+	adev->boot_config_size =
+		sizeof(*cfgs) * num_queues + sizeof(*boot_config);
+	adev->boot_config = ipu7_dma_alloc(adev, adev->boot_config_size,
+					   &adev->boot_config_dma_addr,
+					   GFP_KERNEL, 0);
+	if (!adev->boot_config) {
+		dev_err(dev, "Failed to allocate boot config.\n");
+		return -ENOMEM;
+	}
+
+	boot_config = adev->boot_config;
+	memset(boot_config, 0, sizeof(struct ia_gofo_boot_config));
+	init_boot_config(boot_config, adev->boot_config_size, major);
+	boot_config->subsys_config = subsys_config;
+
+	boot_config->uc_tile_frequency = uc_freq;
+	boot_config->uc_tile_frequency_units =
+		IA_GOFO_FW_BOOT_UC_FREQUENCY_UNITS_MHZ;
+	boot_config->syscom_context_config.max_output_queues =
+		syscom->num_output_queues;
+	boot_config->syscom_context_config.max_input_queues =
+		syscom->num_input_queues;
+
+	ipu7_dma_sync_single(adev, adev->boot_config_dma_addr,
+			     adev->boot_config_size);
+
+	for (i = 0; i < num_queues; i++) {
+		u32 queue_size = qconfigs[i].max_capacity *
+			qconfigs[i].token_size_in_bytes;
+
+		total_queue_size += queue_size;
+		queue_size = ALIGN(queue_size, 64U);
+		total_queue_size_aligned += queue_size;
+		qconfigs[i].queue_size = queue_size;
+	}
+
+	/* Allocate queue memory */
+	syscom->queue_mem = ipu7_dma_alloc(adev, total_queue_size_aligned,
+					   &syscom->queue_mem_dma_addr,
+					   GFP_KERNEL, 0);
+	if (!syscom->queue_mem) {
+		dev_err(dev, "Failed to allocate queue memory.\n");
+		return -ENOMEM;
+	}
+	syscom->queue_mem_size = total_queue_size_aligned;
+
+	syscfg = &boot_config->syscom_context_config;
+	cfgs = ipu7_syscom_get_queue_config(syscfg);
+	queue_mem_ptr = syscom->queue_mem;
+	queue_mem_dma_ptr = syscom->queue_mem_dma_addr;
+	for (i = 0; i < num_queues; i++) {
+		cfgs[i].token_array_mem = queue_mem_dma_ptr;
+		cfgs[i].max_capacity = qconfigs[i].max_capacity;
+		cfgs[i].token_size_in_bytes = qconfigs[i].token_size_in_bytes;
+		qconfigs[i].token_array_mem = queue_mem_ptr;
+		queue_mem_dma_ptr += qconfigs[i].queue_size;
+		queue_mem_ptr += qconfigs[i].queue_size;
+	}
+
+	ipu7_dma_sync_single(adev, syscom->queue_mem_dma_addr,
+			     total_queue_size_aligned);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_boot_init_boot_config, "INTEL_IPU7");
+
+void ipu7_boot_release_boot_config(struct ipu7_bus_device *adev)
+{
+	struct ipu7_syscom_context *syscom = adev->syscom;
+
+	if (syscom->queue_mem) {
+		ipu7_dma_free(adev, syscom->queue_mem_size,
+			      syscom->queue_mem,
+			      syscom->queue_mem_dma_addr, 0);
+		syscom->queue_mem = NULL;
+		syscom->queue_mem_dma_addr = 0;
+	}
+
+	if (adev->boot_config) {
+		ipu7_dma_free(adev, adev->boot_config_size,
+			      adev->boot_config,
+			      adev->boot_config_dma_addr, 0);
+		adev->boot_config = NULL;
+		adev->boot_config_dma_addr = 0;
+	}
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_boot_release_boot_config, "INTEL_IPU7");
+
+int ipu7_boot_start_fw(const struct ipu7_bus_device *adev)
+{
+	const struct device *dev = &adev->auxdev.dev;
+	u32 timeout = IPU_FW_START_STOP_TIMEOUT;
+	void __iomem *base = adev->isp->base;
+	u32 boot_state, last_boot_state;
+	u32 indices_addr, msg_ver, id;
+	int ret;
+
+	ret = ipu7_boot_cell_init(adev);
+	if (ret)
+		return ret;
+
+	dev_dbg(dev, "start booting fw...\n");
+	/* store "uninit" state to syscom/boot state reg */
+	write_fw_boot_param(adev, IA_GOFO_FW_BOOT_STATE_ID,
+			    IA_GOFO_FW_BOOT_STATE_UNINIT);
+	/*
+	 * Set registers to zero
+	 * (not strictly required, but recommended for diagnostics)
+	 */
+	write_fw_boot_param(adev,
+			    IA_GOFO_FW_BOOT_SYSCOM_QUEUE_INDICES_BASE_ID, 0);
+	write_fw_boot_param(adev, IA_GOFO_FW_BOOT_MESSAGING_VERSION_ID, 0);
+	/* store firmware configuration address */
+	write_fw_boot_param(adev, IA_GOFO_FW_BOOT_CONFIG_ID,
+			    adev->boot_config_dma_addr);
+
+	/* Kick uC, then wait for boot complete */
+	ipu7_boot_cell_start(adev);
+
+	last_boot_state = IA_GOFO_FW_BOOT_STATE_UNINIT;
+	while (timeout--) {
+		boot_state = read_fw_boot_param(adev,
+						IA_GOFO_FW_BOOT_STATE_ID);
+		if (boot_state != last_boot_state) {
+			dev_dbg(dev, "boot state changed from 0x%x to 0x%x\n",
+				last_boot_state, boot_state);
+			last_boot_state = boot_state;
+		}
+		if (BOOT_STATE_IS_CRITICAL(boot_state) ||
+		    BOOT_STATE_IS_READY(boot_state))
+			break;
+		usleep_range(1000, 1200);
+	}
+
+	if (BOOT_STATE_IS_CRITICAL(boot_state)) {
+		ipu7_dump_fw_error_log(adev);
+		dev_err(dev, "critical boot state error 0x%x\n", boot_state);
+		return -EINVAL;
+	} else if (!BOOT_STATE_IS_READY(boot_state)) {
+		dev_err(dev, "fw boot timeout. state: 0x%x\n", boot_state);
+		return -ETIMEDOUT;
+	}
+	dev_dbg(dev, "fw boot done.\n");
+
+	/* Get FW syscom queue indices addr */
+	id = IA_GOFO_FW_BOOT_SYSCOM_QUEUE_INDICES_BASE_ID;
+	indices_addr = read_fw_boot_param(adev, id);
+	adev->syscom->queue_indices = base + indices_addr;
+	dev_dbg(dev, "fw queue indices offset is 0x%x\n", indices_addr);
+
+	/* Get message version. */
+	msg_ver = read_fw_boot_param(adev,
+				     IA_GOFO_FW_BOOT_MESSAGING_VERSION_ID);
+	dev_dbg(dev, "ipu message version is 0x%08x\n", msg_ver);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_boot_start_fw, "INTEL_IPU7");
+
+int ipu7_boot_stop_fw(const struct ipu7_bus_device *adev)
+{
+	const struct device *dev = &adev->auxdev.dev;
+	u32 timeout = IPU_FW_START_STOP_TIMEOUT;
+	u32 boot_state;
+
+	boot_state = read_fw_boot_param(adev, IA_GOFO_FW_BOOT_STATE_ID);
+	if (BOOT_STATE_IS_CRITICAL(boot_state) ||
+	    !BOOT_STATE_IS_READY(boot_state)) {
+		dev_err(dev, "fw not ready for shutdown, state 0x%x\n",
+			boot_state);
+		return -EBUSY;
+	}
+
+	/* Issue shutdown to start shutdown process */
+	dev_dbg(dev, "stopping fw...\n");
+	write_fw_boot_param(adev, IA_GOFO_FW_BOOT_STATE_ID,
+			    IA_GOFO_FW_BOOT_STATE_SHUTDOWN_CMD);
+	while (timeout--) {
+		boot_state = read_fw_boot_param(adev,
+						IA_GOFO_FW_BOOT_STATE_ID);
+		if (BOOT_STATE_IS_CRITICAL(boot_state) ||
+		    BOOT_STATE_IS_INACTIVE(boot_state))
+			break;
+		usleep_range(1000, 1200);
+	}
+
+	if (BOOT_STATE_IS_CRITICAL(boot_state)) {
+		ipu7_dump_fw_error_log(adev);
+		dev_err(dev, "critical boot state error 0x%x\n", boot_state);
+		return -EINVAL;
+	} else if (!BOOT_STATE_IS_INACTIVE(boot_state)) {
+		dev_err(dev, "stop fw timeout. state: 0x%x\n", boot_state);
+		return -ETIMEDOUT;
+	}
+
+	ipu7_boot_cell_stop(adev);
+	dev_dbg(dev, "stop fw done.\n");
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_boot_stop_fw, "INTEL_IPU7");
+
+u32 ipu7_boot_get_boot_state(const struct ipu7_bus_device *adev)
+{
+	return read_fw_boot_param(adev, IA_GOFO_FW_BOOT_STATE_ID);
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_boot_get_boot_state, "INTEL_IPU7");
diff --git a/drivers/staging/media/ipu7/ipu7-boot.h b/drivers/staging/media/ipu7/ipu7-boot.h
new file mode 100644
index 000000000000..5600be849931
--- /dev/null
+++ b/drivers/staging/media/ipu7/ipu7-boot.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2022 - 2025 Intel Corporation
+ */
+
+#ifndef IPU7_BOOT_H
+#define IPU7_BOOT_H
+
+#include <linux/types.h>
+
+struct ipu7_bus_device;
+struct syscom_queue_config;
+
+#define FW_QUEUE_CONFIG_SIZE(num_queues)	\
+	(sizeof(struct syscom_queue_config) * (num_queues))
+
+int ipu7_boot_init_boot_config(struct ipu7_bus_device *adev,
+			       struct syscom_queue_config *qconfigs,
+			       int num_queues, u32 uc_freq,
+			       dma_addr_t subsys_config, u8 major);
+void ipu7_boot_release_boot_config(struct ipu7_bus_device *adev);
+int ipu7_boot_start_fw(const struct ipu7_bus_device *adev);
+int ipu7_boot_stop_fw(const struct ipu7_bus_device *adev);
+u32 ipu7_boot_get_boot_state(const struct ipu7_bus_device *adev);
+#endif
diff --git a/drivers/staging/media/ipu7/ipu7-cpd.c b/drivers/staging/media/ipu7/ipu7-cpd.c
new file mode 100644
index 000000000000..4f49fb57eae4
--- /dev/null
+++ b/drivers/staging/media/ipu7/ipu7-cpd.c
@@ -0,0 +1,276 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2015 - 2025 Intel Corporation
+ */
+
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/gfp_types.h>
+#include <linux/pci.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include "ipu7.h"
+#include "ipu7-cpd.h"
+
+/* $CPD */
+#define CPD_HDR_MARK		0x44504324
+
+/* Maximum size is 4K DWORDs or 16KB */
+#define MAX_MANIFEST_SIZE	(SZ_4K * sizeof(u32))
+
+#define CPD_MANIFEST_IDX	0
+#define CPD_BINARY_START_IDX	1U
+#define CPD_METADATA_START_IDX	2U
+#define CPD_BINARY_NUM		2U /* ISYS + PSYS */
+/*
+ * Entries include:
+ * 1 manifest entry.
+ * 1 metadata entry for each sub system(ISYS and PSYS).
+ * 1 binary entry for each sub system(ISYS and PSYS).
+ */
+#define CPD_ENTRY_NUM		(CPD_BINARY_NUM * 2U + 1U)
+
+#define CPD_METADATA_ATTR	0xa
+#define CPD_METADATA_IPL	0x1c
+#define ONLINE_METADATA_SIZE	128U
+#define ONLINE_METADATA_LINES	6U
+
+struct ipu7_cpd_hdr {
+	u32 hdr_mark;
+	u32 ent_cnt;
+	u8 hdr_ver;
+	u8 ent_ver;
+	u8 hdr_len;
+	u8 rsvd;
+	u8 partition_name[4];
+	u32 crc32;
+} __packed;
+
+struct ipu7_cpd_ent {
+	u8 name[12];
+	u32 offset;
+	u32 len;
+	u8 rsvd[4];
+} __packed;
+
+struct ipu7_cpd_metadata_hdr {
+	u32 type;
+	u32 len;
+} __packed;
+
+struct ipu7_cpd_metadata_attr {
+	struct ipu7_cpd_metadata_hdr hdr;
+	u8 compression_type;
+	u8 encryption_type;
+	u8 rsvd[2];
+	u32 uncompressed_size;
+	u32 compressed_size;
+	u32 module_id;
+	u8 hash[48];
+} __packed;
+
+struct ipu7_cpd_metadata_ipl {
+	struct ipu7_cpd_metadata_hdr hdr;
+	u32 param[4];
+	u8 rsvd[8];
+} __packed;
+
+struct ipu7_cpd_metadata {
+	struct ipu7_cpd_metadata_attr attr;
+	struct ipu7_cpd_metadata_ipl ipl;
+} __packed;
+
+static inline struct ipu7_cpd_ent *ipu7_cpd_get_entry(const void *cpd, int idx)
+{
+	const struct ipu7_cpd_hdr *cpd_hdr = cpd;
+
+	return ((struct ipu7_cpd_ent *)((u8 *)cpd + cpd_hdr->hdr_len)) + idx;
+}
+
+#define ipu7_cpd_get_manifest(cpd) ipu7_cpd_get_entry(cpd, 0)
+
+static struct ipu7_cpd_metadata *ipu7_cpd_get_metadata(const void *cpd, int idx)
+{
+	struct ipu7_cpd_ent *cpd_ent =
+		ipu7_cpd_get_entry(cpd, CPD_METADATA_START_IDX + idx * 2);
+
+	return (struct ipu7_cpd_metadata *)((u8 *)cpd + cpd_ent->offset);
+}
+
+static int ipu7_cpd_validate_cpd(struct ipu7_device *isp,
+				 const void *cpd, unsigned long data_size)
+{
+	const struct ipu7_cpd_hdr *cpd_hdr = cpd;
+	struct device *dev = &isp->pdev->dev;
+	struct ipu7_cpd_ent *ent;
+	unsigned int i;
+	u8 len;
+
+	len = cpd_hdr->hdr_len;
+
+	/* Ensure cpd hdr is within moduledata */
+	if (data_size < len) {
+		dev_err(dev, "Invalid CPD moduledata size\n");
+		return -EINVAL;
+	}
+
+	/* Check for CPD file marker */
+	if (cpd_hdr->hdr_mark != CPD_HDR_MARK) {
+		dev_err(dev, "Invalid CPD header marker\n");
+		return -EINVAL;
+	}
+
+	/* Sanity check for CPD entry header */
+	if (cpd_hdr->ent_cnt != CPD_ENTRY_NUM) {
+		dev_err(dev, "Invalid CPD entry number %d\n",
+			cpd_hdr->ent_cnt);
+		return -EINVAL;
+	}
+	if ((data_size - len) / sizeof(*ent) < cpd_hdr->ent_cnt) {
+		dev_err(dev, "Invalid CPD entry headers\n");
+		return -EINVAL;
+	}
+
+	/* Ensure that all entries are within moduledata */
+	ent = (struct ipu7_cpd_ent *)(((u8 *)cpd_hdr) + len);
+	for (i = 0; i < cpd_hdr->ent_cnt; i++) {
+		if (data_size < ent->offset ||
+		    data_size - ent->offset < ent->len) {
+			dev_err(dev, "Invalid CPD entry %d\n", i);
+			return -EINVAL;
+		}
+		ent++;
+	}
+
+	return 0;
+}
+
+static int ipu7_cpd_validate_metadata(struct ipu7_device *isp,
+				      const void *cpd, int idx)
+{
+	const struct ipu7_cpd_ent *cpd_ent =
+		ipu7_cpd_get_entry(cpd, CPD_METADATA_START_IDX + idx * 2);
+	const struct ipu7_cpd_metadata *metadata =
+		ipu7_cpd_get_metadata(cpd, idx);
+	struct device *dev = &isp->pdev->dev;
+
+	/* Sanity check for metadata size */
+	if (cpd_ent->len != sizeof(struct ipu7_cpd_metadata)) {
+		dev_err(dev, "Invalid metadata size\n");
+		return -EINVAL;
+	}
+
+	/* Validate type and length of metadata sections */
+	if (metadata->attr.hdr.type != CPD_METADATA_ATTR) {
+		dev_err(dev, "Invalid metadata attr type (%d)\n",
+			metadata->attr.hdr.type);
+		return -EINVAL;
+	}
+	if (metadata->attr.hdr.len != sizeof(struct ipu7_cpd_metadata_attr)) {
+		dev_err(dev, "Invalid metadata attr size (%d)\n",
+			metadata->attr.hdr.len);
+		return -EINVAL;
+	}
+	if (metadata->ipl.hdr.type != CPD_METADATA_IPL) {
+		dev_err(dev, "Invalid metadata ipl type (%d)\n",
+			metadata->ipl.hdr.type);
+		return -EINVAL;
+	}
+	if (metadata->ipl.hdr.len != sizeof(struct ipu7_cpd_metadata_ipl)) {
+		dev_err(dev, "Invalid metadata ipl size (%d)\n",
+			metadata->ipl.hdr.len);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int ipu7_cpd_validate_cpd_file(struct ipu7_device *isp, const void *cpd_file,
+			       unsigned long cpd_file_size)
+{
+	struct device *dev = &isp->pdev->dev;
+	struct ipu7_cpd_ent *ent;
+	unsigned int i;
+	int ret;
+	char *buf;
+
+	ret = ipu7_cpd_validate_cpd(isp, cpd_file, cpd_file_size);
+	if (ret) {
+		dev_err(dev, "Invalid CPD in file\n");
+		return -EINVAL;
+	}
+
+	/* Sanity check for manifest size */
+	ent = ipu7_cpd_get_manifest(cpd_file);
+	if (ent->len > MAX_MANIFEST_SIZE) {
+		dev_err(dev, "Invalid manifest size\n");
+		return -EINVAL;
+	}
+
+	/* Validate metadata */
+	for (i = 0; i < CPD_BINARY_NUM; i++) {
+		ret = ipu7_cpd_validate_metadata(isp, cpd_file, i);
+		if (ret) {
+			dev_err(dev, "Invalid metadata%d\n", i);
+			return ret;
+		}
+	}
+
+	/* Get fw binary version. */
+	buf = kmalloc(ONLINE_METADATA_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+	for (i = 0; i < CPD_BINARY_NUM; i++) {
+		char *lines[ONLINE_METADATA_LINES];
+		char *info = buf;
+		unsigned int l;
+
+		ent = ipu7_cpd_get_entry(cpd_file,
+					 CPD_BINARY_START_IDX + i * 2U);
+		memcpy(info, (u8 *)cpd_file + ent->offset + ent->len -
+		       ONLINE_METADATA_SIZE, ONLINE_METADATA_SIZE);
+		for (l = 0; l < ONLINE_METADATA_LINES; l++) {
+			lines[l] = strsep((char **)&info, "\n");
+			if (!lines[l])
+				break;
+		}
+		if (l < ONLINE_METADATA_LINES) {
+			dev_err(dev, "Failed to parse fw binary%d info.\n", i);
+			continue;
+		}
+		dev_info(dev, "FW binary%d info:\n", i);
+		dev_info(dev, "Name: %s\n", lines[1]);
+		dev_info(dev, "Version: %s\n", lines[2]);
+		dev_info(dev, "Timestamp: %s\n", lines[3]);
+		dev_info(dev, "Commit: %s\n", lines[4]);
+	}
+	kfree(buf);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_cpd_validate_cpd_file, "INTEL_IPU7");
+
+int ipu7_cpd_copy_binary(const void *cpd, const char *name,
+			 void *code_region, u32 *entry)
+{
+	unsigned int i;
+
+	for (i = 0; i < CPD_BINARY_NUM; i++) {
+		const struct ipu7_cpd_ent *binary =
+			ipu7_cpd_get_entry(cpd, CPD_BINARY_START_IDX + i * 2U);
+		const struct ipu7_cpd_metadata *metadata =
+			ipu7_cpd_get_metadata(cpd, i);
+
+		if (!strncmp(binary->name, name, sizeof(binary->name))) {
+			memcpy(code_region + metadata->ipl.param[0],
+			       cpd + binary->offset, binary->len);
+			*entry = metadata->ipl.param[2];
+			return 0;
+		}
+	}
+
+	return -ENOENT;
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_cpd_copy_binary, "INTEL_IPU7");
diff --git a/drivers/staging/media/ipu7/ipu7-cpd.h b/drivers/staging/media/ipu7/ipu7-cpd.h
new file mode 100644
index 000000000000..b4178848c6b9
--- /dev/null
+++ b/drivers/staging/media/ipu7/ipu7-cpd.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2015 - 2025 Intel Corporation
+ */
+
+#ifndef IPU7_CPD_H
+#define IPU7_CPD_H
+
+struct ipu7_device;
+
+int ipu7_cpd_validate_cpd_file(struct ipu7_device *isp,
+			       const void *cpd_file,
+			       unsigned long cpd_file_size);
+int ipu7_cpd_copy_binary(const void *cpd, const char *name,
+			 void *code_region, u32 *entry);
+#endif /* IPU7_CPD_H */
diff --git a/drivers/staging/media/ipu7/ipu7-syscom.c b/drivers/staging/media/ipu7/ipu7-syscom.c
new file mode 100644
index 000000000000..3f9f9c5c3cce
--- /dev/null
+++ b/drivers/staging/media/ipu7/ipu7-syscom.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 - 2025 Intel Corporation
+ */
+
+#include <linux/export.h>
+#include <linux/io.h>
+
+#include "abi/ipu7_fw_syscom_abi.h"
+
+#include "ipu7.h"
+#include "ipu7-syscom.h"
+
+static void __iomem *ipu7_syscom_get_indices(struct ipu7_syscom_context *ctx,
+					     u32 q)
+{
+	return ctx->queue_indices + (q * sizeof(struct syscom_queue_indices_s));
+}
+
+void *ipu7_syscom_get_token(struct ipu7_syscom_context *ctx, int q)
+{
+	struct syscom_queue_config *queue_params = &ctx->queue_configs[q];
+	void __iomem *queue_indices = ipu7_syscom_get_indices(ctx, q);
+	u32 write_index = readl(queue_indices +
+				offsetof(struct syscom_queue_indices_s,
+					 write_index));
+	u32 read_index = readl(queue_indices +
+			       offsetof(struct syscom_queue_indices_s,
+					read_index));
+	void *token = NULL;
+
+	if (q < ctx->num_output_queues) {
+		/* Output queue */
+		bool empty = (write_index == read_index);
+
+		if (!empty)
+			token = queue_params->token_array_mem +
+				read_index *
+				queue_params->token_size_in_bytes;
+	} else {
+		/* Input queue */
+		bool full = (read_index == ((write_index + 1U) %
+					    (u32)queue_params->max_capacity));
+
+		if (!full)
+			token = queue_params->token_array_mem +
+				write_index * queue_params->token_size_in_bytes;
+	}
+	return token;
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_syscom_get_token, "INTEL_IPU7");
+
+void ipu7_syscom_put_token(struct ipu7_syscom_context *ctx, int q)
+{
+	struct syscom_queue_config *queue_params = &ctx->queue_configs[q];
+	void __iomem *queue_indices = ipu7_syscom_get_indices(ctx, q);
+	u32 offset, index;
+
+	if (q < ctx->num_output_queues)
+		/* Output queue */
+		offset = offsetof(struct syscom_queue_indices_s, read_index);
+
+	else
+		/* Input queue */
+		offset = offsetof(struct syscom_queue_indices_s, write_index);
+
+	index = readl(queue_indices + offset);
+	writel((index + 1U) % queue_params->max_capacity,
+	       queue_indices + offset);
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_syscom_put_token, "INTEL_IPU7");
+
+struct syscom_queue_params_config *
+ipu7_syscom_get_queue_config(struct syscom_config_s *config)
+{
+	return (struct syscom_queue_params_config *)(&config[1]);
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_syscom_get_queue_config, "INTEL_IPU7");
diff --git a/drivers/staging/media/ipu7/ipu7-syscom.h b/drivers/staging/media/ipu7/ipu7-syscom.h
new file mode 100644
index 000000000000..e1fbe3b7914e
--- /dev/null
+++ b/drivers/staging/media/ipu7/ipu7-syscom.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2013 - 2025 Intel Corporation
+ */
+
+#ifndef IPU7_SYSCOM_H
+#define IPU7_SYSCOM_H
+
+#include <linux/types.h>
+
+struct syscom_config_s;
+struct syscom_queue_params_config;
+
+struct syscom_queue_config {
+	void *token_array_mem;
+	u32 queue_size;
+	u16 token_size_in_bytes;
+	u16 max_capacity;
+};
+
+struct ipu7_syscom_context {
+	u16 num_input_queues;
+	u16 num_output_queues;
+	struct syscom_queue_config *queue_configs;
+	void __iomem *queue_indices;
+	dma_addr_t queue_mem_dma_addr;
+	void *queue_mem;
+	u32 queue_mem_size;
+};
+
+void ipu7_syscom_put_token(struct ipu7_syscom_context *ctx, int q);
+void *ipu7_syscom_get_token(struct ipu7_syscom_context *ctx, int q);
+struct syscom_queue_params_config *
+ipu7_syscom_get_queue_config(struct syscom_config_s *config);
+#endif
-- 
2.34.1


