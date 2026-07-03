Return-Path: <linux-media+bounces-66488-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 45deOczUR2q4fwAAu9opvQ
	(envelope-from <linux-media+bounces-66488-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:27:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E15703D93
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:27:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=QfObMnbn;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66488-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66488-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14B1A3038778
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E54416D13;
	Fri,  3 Jul 2026 15:26:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3944C417344
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:26:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092364; cv=none; b=si+VC0s2x011e2keChHpI8Ietmo1pLmtZZku6bKwXTYEz+k4GRc36y6bLqmHQGsxGVDEnUY7q9l7XaJFkuytDIxP1i0Ysksqiyfbhk6yrLzFU589gkoqc9mYnp6YS3GQDot0tOyZmQIUc5j4fuSPlMje2eJdhAr7f/jNT/S40fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092364; c=relaxed/simple;
	bh=QQFW8A+4hnlWRBJlvOfB4xQXYFDLSVDV8ciHFNO6ncY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XOMXvXj5FeBZFIgRLNmdyzQxJhMYVSzrh80qN06y6X4xHt8cazDu+AHpfnQtOVwDOaM1uSyVdws8oBCbh9yiCWVDqCUSkegXTXXYgQZYDdJcaxc6TEXJng/iz4HHUCQwfF7fKl6iUOpEGgF+cRj+4aVtEHLcWdMLvE518A5JmDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QfObMnbn; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092362; x=1814628362;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QQFW8A+4hnlWRBJlvOfB4xQXYFDLSVDV8ciHFNO6ncY=;
  b=QfObMnbnqyBh+XIOVXxEkMWPPrJrceO4akNLLFfgeRtUgT4obNkcQDNs
   ThTNcrcOIJ1b65/klgS2UKHHoicKnBSiirEf2G5Q4FTn6nf1R8UjBRlf+
   /C0rRLjPuWu/BZluHIIPTEFkxPs7Tsf5XH7MvcB3Yi6z6O5TcldD5WATw
   mfNmhdLi08TiharBMUDzulyOqQTT18Rb9ZZzJv2LyY1kFsH/SWQyEHP/Y
   7QPa+jYdCoElMYmLYqW072KW01kn03ZpOlABpGhbrrWF9667XTg3IABqb
   lTYajLYJwQrHQQ9SF8OxvXYY6Ln2QKqAZzZyrCNk/x6H8NcKC/RBapusc
   g==;
X-CSE-ConnectionGUID: SoIfgee1RAyPN/A1fccs1A==
X-CSE-MsgGUID: uOdaUY6fQIuHXPW7jrUufA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396199"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396199"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:02 -0700
X-CSE-ConnectionGUID: xWE2YT//S+OjUNOdEgiSdg==
X-CSE-MsgGUID: g4GYK5OxQR6GSD7SWgnrTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799691"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:00 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 22/41] media: ipu6: Add ipu7 fw com methods
Date: Fri,  3 Jul 2026 18:24:32 +0300
Message-ID: <20260703152451.1743132-23-antti.laakso@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-66488-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.intel.com:mid,linux.intel.com:from_mime,intel.com:email,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 62E15703D93

The get/put token methods read/write to ipu7 firmware message queues.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/Makefile         |   4 +-
 drivers/media/pci/intel/ipu6/ipu6.h           |   1 +
 drivers/media/pci/intel/ipu6/ipu7-boot.c      | 408 ++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu7-boot.h      |  41 ++
 drivers/media/pci/intel/ipu6/ipu7-fw-com.c    |  74 ++++
 drivers/media/pci/intel/ipu6/ipu7-fw-com.h    |  51 +++
 .../media/pci/intel/ipu6/ipu7-platform-regs.h |  12 +
 7 files changed, 590 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-boot.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-boot.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-fw-com.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-fw-com.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-platform-regs.h

diff --git a/drivers/media/pci/intel/ipu6/Makefile b/drivers/media/pci/intel/ipu6/Makefile
index c0daf0995b22..406e2e19df17 100644
--- a/drivers/media/pci/intel/ipu6/Makefile
+++ b/drivers/media/pci/intel/ipu6/Makefile
@@ -8,7 +8,9 @@ intel-ipu6-y			:= ipu6.o \
 				ipu7-mmu-hw.o \
 				ipu6-buttress.o \
 				ipu6-cpd.o \
-				ipu6-fw-com.o
+				ipu6-fw-com.o \
+				ipu7-fw-com.o \
+				ipu7-boot.o
 
 obj-$(CONFIG_VIDEO_INTEL_IPU6)	+= intel-ipu6.o
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
index c1693e0022b4..728113b22fd9 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -90,6 +90,7 @@ struct ipu6_device {
 
 #define IPU_PSYS	0
 #define IPU_ISYS	1
+#define IPU_SUBSYS_NUM	2
 
 #define IPU6_ISYS_NAME "isys"
 #define IPU6_PSYS_NAME "psys"
diff --git a/drivers/media/pci/intel/ipu6/ipu7-boot.c b/drivers/media/pci/intel/ipu6/ipu7-boot.c
new file mode 100644
index 000000000000..982b6ee36e6c
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu7-boot.c
@@ -0,0 +1,408 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022 - 2026 Intel Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/iopoll.h>
+#include <linux/types.h>
+
+#include "ipu6.h"
+#include "ipu7-boot.h"
+#include "ipu6-bus.h"
+#include "ipu6-buttress.h"
+#include "ipu6-dma.h"
+#include "ipu7-fw-com.h"
+#include "ipu6-isys.h"
+#include "ipu6-platform-buttress-regs.h"
+#include "ipu7-platform-regs.h"
+
+#define IPU7_FW_START_STOP_TIMEOUT		2000
+#define IPU7_BOOT_CELL_RESET_TIMEOUT		(2 * USEC_PER_SEC)
+#define IPU7_BOOT_STATE_CRITICAL(s)		(((s) & 0xffff0000U) == 0xdead0000U)
+#define IPU7_BOOT_STATE_READY(s)		((s) == 0x57a7e100U)
+#define IPU7_BOOT_STATE_INACTIVE(s)		((s) == 0x57a7e300U)
+#define IPU7_BUTTRESS_REG_FW_BOOT_PARAMS0				0x4000
+#define IPU7_BUTTRESS_FW_BOOT_PARAMS_ENTRY(i) \
+	(IPU7_BUTTRESS_REG_FW_BOOT_PARAMS0 + ((i) * 4U))
+
+struct boot_regs {
+	u32 base;
+	u32 dmem_address;
+	u32 status_ctrl_reg;
+	u32 fw_start_address_reg;
+	u32 fw_code_base_reg;
+};
+
+enum ipu7_boot_reg_id {
+	IPU7_FW_BOOT_CONFIG_ID = 0,
+	IPU7_FW_BOOT_STATE_ID = 1,
+	IPU7_FW_BOOT_SYSCOM_QUEUE_INDICES_BASE_ID = 2,
+	IPU7_FW_BOOT_UNTRUSTED_ADDR_MIN_ID = 3,
+	IPU7_FW_BOOT_MESSAGING_VERSION_ID = 4,
+	IPU7_FW_BOOT_ID_MAX,
+};
+
+enum ipu7_boot_state {
+	IPU7_FW_BOOT_STATE_UNINIT = 0x57a7e000U,
+	IPU7_FW_BOOT_STATE_READY = 0x57a7e100U,
+	IPU7_FW_BOOT_STATE_SHUTDOWN_CMD = 0x57a7f001U,
+	IPU7_FW_BOOT_STATE_INACTIVE = 0x57a7e300U,
+};
+
+static const struct boot_regs boot_regs[IPU_SUBSYS_NUM] = {
+	[IPU_ISYS] = {
+		.dmem_address = IPU7_ISYS_DMEM_OFFSET,
+		.status_ctrl_reg = IPU7_BUTTRESS_REG_ISYS_UCX_CTRL_STATUS,
+		.fw_start_address_reg = IPU7_BUTTRESS_REG_ISYS_UCX_START_ADDR,
+		.fw_code_base_reg = IPU7_IS_UC_CTRL_BASE
+	},
+	[IPU_PSYS] = {
+		.dmem_address = IPU7_PSYS_DMEM_OFFSET,
+		.status_ctrl_reg = IPU7_BUTTRESS_REG_PSYS_UCX_CTRL_STATUS,
+		.fw_start_address_reg = IPU7_BUTTRESS_REG_PSYS_UCX_START_ADDR,
+		.fw_code_base_reg = IPU7_PS_UC_CTRL_BASE
+	}
+};
+
+static u32 get_fw_boot_reg_addr(const struct ipu6_bus_device *adev,
+				enum ipu7_boot_reg_id reg)
+{
+	u32 base = (adev->ctrl->subsys_id == IPU_ISYS) ?
+				0U : (u32)IPU7_FW_BOOT_ID_MAX;
+
+	return IPU7_BUTTRESS_FW_BOOT_PARAMS_ENTRY(base + (u32)reg);
+}
+
+static void write_fw_boot_param(const struct ipu6_bus_device *adev,
+				enum ipu7_boot_reg_id reg,
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
+static u32 read_fw_boot_param(const struct ipu6_bus_device *adev,
+			      enum ipu7_boot_reg_id reg)
+{
+	void __iomem *base = adev->isp->base;
+
+	return readl(base + get_fw_boot_reg_addr(adev, reg));
+}
+
+static int ipu7_boot_cell_reset(const struct ipu6_bus_device *adev)
+{
+	const struct device *dev = &adev->auxdev.dev;
+	const struct boot_regs *regs = &boot_regs[adev->ctrl->subsys_id];
+	u32 ucx_ctrl_status = regs->status_ctrl_reg;
+	u32 timeout = IPU7_BOOT_CELL_RESET_TIMEOUT;
+	void __iomem *base = adev->isp->base;
+	u32 val, val2;
+	int ret;
+
+	val = readl(base + ucx_ctrl_status);
+	val |= IPU7_UCX_CTL_RESET;
+	val &= ~IPU7_UCX_CTL_RUN;
+
+	writel(val, base + ucx_ctrl_status);
+
+	ret = readl_poll_timeout(base + ucx_ctrl_status, val2,
+				 (val2 & 0x3U) == (val & 0x3U), 100, timeout);
+	if (ret) {
+		dev_err(dev, "cell enter reset timeout. status: 0x%x\n", val2);
+		return -ETIMEDOUT;
+	}
+
+	val = readl(base + ucx_ctrl_status);
+	val &= ~(IPU7_UCX_CTL_RESET | IPU7_UCX_CTL_RUN);
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
+static void ipu7_boot_cell_start(const struct ipu6_bus_device *adev)
+{
+	const struct boot_regs *regs = &boot_regs[adev->ctrl->subsys_id];
+	void __iomem *base = adev->isp->base;
+	u32 val;
+
+	val = readl(base + regs->status_ctrl_reg);
+	WARN_ON(val & (IPU7_UCX_CTL_RESET | IPU7_UCX_CTL_RUN));
+
+	val &= ~IPU7_UCX_CTL_RESET;
+	val |= IPU7_UCX_CTL_RUN;
+	writel(val, base + regs->status_ctrl_reg);
+}
+
+static void ipu7_boot_cell_stop(const struct ipu6_bus_device *adev)
+{
+	const struct boot_regs *regs = &boot_regs[adev->ctrl->subsys_id];
+	void __iomem *base = adev->isp->base;
+	u32 val;
+
+	val = readl(base + regs->status_ctrl_reg);
+	val &= ~IPU7_UCX_CTL_RUN;
+	writel(val, base + regs->status_ctrl_reg);
+
+	/* Wait for uC transactions complete */
+	usleep_range(10, 20);
+
+	val = readl(base + regs->status_ctrl_reg);
+	val |= IPU7_UCX_CTL_RESET;
+	writel(val, base + regs->status_ctrl_reg);
+}
+
+static int ipu7_boot_cell_init(const struct ipu6_bus_device *adev)
+{
+	const struct boot_regs *regs = &boot_regs[adev->ctrl->subsys_id];
+	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
+	struct ipu7_fw_com_context *fwctx = isys->fwctx;
+	void __iomem *base = adev->isp->base;
+
+	writel(fwctx->fw_entry, base + regs->fw_start_address_reg);
+
+	return ipu7_boot_cell_reset(adev);
+}
+
+static void init_cfg_versions(struct ipu7_boot_abi_cfg *boot_cfg, u32 length, u8 major)
+{
+	boot_cfg->length = length;
+	boot_cfg->config_version.major = 1U;
+	boot_cfg->config_version.minor = 0U;
+	boot_cfg->config_version.subminor = 0U;
+	boot_cfg->config_version.patch = 0U;
+
+	boot_cfg->client_version_support.num_versions = 1U;
+	boot_cfg->client_version_support.versions[0].major = major;
+	boot_cfg->client_version_support.versions[0].minor = 0U;
+	boot_cfg->client_version_support.versions[0].subminor = 0U;
+	boot_cfg->client_version_support.versions[0].patch = 0U;
+}
+
+int ipu7_init_boot_config(struct ipu6_bus_device *adev,
+			  struct ipu7_fw_com_queue_config *qconfigs,
+			  int num_queues, u32 uc_freq,
+			  dma_addr_t subsys_config, u8 major)
+{
+	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
+	struct ipu7_fw_com_context *fwctx = isys->fwctx;
+	struct ipu7_boot_abi_cfg *boot_config;
+	struct ipu7_fw_com_queue_params_config *cfgs;
+	struct device *dev = &adev->auxdev.dev;
+	u32 total_queue_size_aligned = 0;
+	dma_addr_t queue_mem_dma_ptr;
+	void *queue_mem_ptr;
+	unsigned int i;
+
+	/* Allocate boot config. */
+	fwctx->boot_config_size =
+		sizeof(*cfgs) * num_queues + sizeof(*boot_config);
+	fwctx->boot_config = ipu6_dma_alloc(adev, fwctx->boot_config_size,
+					    &fwctx->boot_config_dma_addr,
+					    GFP_KERNEL, 0);
+	if (!fwctx->boot_config) {
+		dev_err(dev, "Failed to allocate boot config.\n");
+		return -ENOMEM;
+	}
+
+	boot_config = fwctx->boot_config;
+	memset(boot_config, 0, sizeof(*boot_config));
+	init_cfg_versions(boot_config, fwctx->boot_config_size, major);
+	boot_config->subsys_config = subsys_config;
+
+	boot_config->uc_tile_frequency = uc_freq;
+	boot_config->uc_tile_frequency_units = 0;
+	boot_config->fw_com_config.max_output_queues =
+		fwctx->num_output_queues;
+	boot_config->fw_com_config.max_input_queues =
+		fwctx->num_input_queues;
+
+	ipu6_dma_sync_single(adev, fwctx->boot_config_dma_addr,
+			     fwctx->boot_config_size);
+
+	for (i = 0; i < num_queues; i++) {
+		u32 queue_size = qconfigs[i].max_capacity *
+			qconfigs[i].token_size_in_bytes;
+
+		queue_size = ALIGN(queue_size, 64U);
+		total_queue_size_aligned += queue_size;
+		qconfigs[i].queue_size = queue_size;
+	}
+
+	/* Allocate queue memory */
+	fwctx->queue_mem = ipu6_dma_alloc(adev, total_queue_size_aligned,
+					   &fwctx->queue_mem_dma_addr,
+					   GFP_KERNEL, 0);
+	if (!fwctx->queue_mem) {
+		dev_err(dev, "Failed to allocate queue memory.\n");
+		return -ENOMEM;
+	}
+	fwctx->queue_mem_size = total_queue_size_aligned;
+
+	cfgs = ipu7_fw_com_get_queue_config(&boot_config->fw_com_config);
+	queue_mem_ptr = fwctx->queue_mem;
+	queue_mem_dma_ptr = fwctx->queue_mem_dma_addr;
+	for (i = 0; i < num_queues; i++) {
+		cfgs[i].token_array_mem = queue_mem_dma_ptr;
+		cfgs[i].max_capacity = qconfigs[i].max_capacity;
+		cfgs[i].token_size_in_bytes = qconfigs[i].token_size_in_bytes;
+		qconfigs[i].token_array_mem = queue_mem_ptr;
+		queue_mem_dma_ptr += qconfigs[i].queue_size;
+		queue_mem_ptr += qconfigs[i].queue_size;
+	}
+
+	ipu6_dma_sync_single(adev, fwctx->queue_mem_dma_addr,
+			     total_queue_size_aligned);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_init_boot_config, "INTEL_IPU6");
+
+void ipu7_release_boot_config(struct ipu6_bus_device *adev)
+{
+	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
+	struct ipu7_fw_com_context *fwctx;
+
+	if (!isys || !isys->fwctx)
+		return;
+
+	fwctx = isys->fwctx;
+
+	if (fwctx->queue_mem) {
+		ipu6_dma_free(adev, fwctx->queue_mem_size,
+			      fwctx->queue_mem,
+			      fwctx->queue_mem_dma_addr, 0);
+		fwctx->queue_mem = NULL;
+		fwctx->queue_mem_dma_addr = 0;
+	}
+
+	if (fwctx->boot_config) {
+		ipu6_dma_free(adev, fwctx->boot_config_size,
+			      fwctx->boot_config,
+			      fwctx->boot_config_dma_addr, 0);
+		fwctx->boot_config = NULL;
+		fwctx->boot_config_dma_addr = 0;
+	}
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_release_boot_config, "INTEL_IPU6");
+
+int ipu7_boot_start_fw(const struct ipu6_bus_device *adev)
+{
+	const struct device *dev = &adev->auxdev.dev;
+	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
+	struct ipu7_fw_com_context *fwctx = isys->fwctx;
+	u32 timeout = IPU7_FW_START_STOP_TIMEOUT;
+	void __iomem *base = adev->isp->base;
+	u32 boot_state, last_boot_state;
+	u32 indices_addr, msg_ver, id;
+	int ret;
+
+	ret = ipu7_boot_cell_init(adev);
+	if (ret)
+		return ret;
+
+	/* store "uninit" state to boot state reg */
+	write_fw_boot_param(adev, IPU7_FW_BOOT_STATE_ID,
+			    IPU7_FW_BOOT_STATE_UNINIT);
+	/* Set registers to zero, recommended for diagnostics. */
+	write_fw_boot_param(adev,
+			    IPU7_FW_BOOT_SYSCOM_QUEUE_INDICES_BASE_ID, 0);
+	write_fw_boot_param(adev, IPU7_FW_BOOT_MESSAGING_VERSION_ID, 0);
+	/* store firmware configuration address */
+	write_fw_boot_param(adev, IPU7_FW_BOOT_CONFIG_ID,
+			    fwctx->boot_config_dma_addr);
+
+	ipu7_boot_cell_start(adev);
+
+	last_boot_state = IPU7_FW_BOOT_STATE_UNINIT;
+	while (timeout--) {
+		boot_state = read_fw_boot_param(adev,
+						IPU7_FW_BOOT_STATE_ID);
+		if (boot_state != last_boot_state) {
+			dev_dbg(dev, "boot state changed from 0x%x to 0x%x\n",
+				last_boot_state, boot_state);
+			last_boot_state = boot_state;
+		}
+		if (IPU7_BOOT_STATE_CRITICAL(boot_state) ||
+		    IPU7_BOOT_STATE_READY(boot_state))
+			break;
+		usleep_range(1000, 1200);
+	}
+
+	if (IPU7_BOOT_STATE_CRITICAL(boot_state)) {
+		/*TODO: ipu7_dump_fw_error_log(adev);*/
+		dev_err(dev, "critical boot state error 0x%x\n", boot_state);
+		return -EINVAL;
+	} else if (!IPU7_BOOT_STATE_READY(boot_state)) {
+		dev_err(dev, "fw boot timeout. state: 0x%x\n", boot_state);
+		return -ETIMEDOUT;
+	}
+	dev_dbg(dev, "fw boot done.\n");
+
+	id = IPU7_FW_BOOT_SYSCOM_QUEUE_INDICES_BASE_ID;
+	indices_addr = read_fw_boot_param(adev, id);
+	fwctx->queue_indices = base + indices_addr;
+	dev_dbg(dev, "fw queue indices offset is 0x%x\n", indices_addr);
+
+	msg_ver = read_fw_boot_param(adev,
+				     IPU7_FW_BOOT_MESSAGING_VERSION_ID);
+	dev_dbg(dev, "ipu message version is 0x%08x\n", msg_ver);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_boot_start_fw, "INTEL_IPU6");
+
+int ipu7_boot_stop_fw(const struct ipu6_bus_device *adev)
+{
+	const struct device *dev = &adev->auxdev.dev;
+	u32 timeout = IPU7_FW_START_STOP_TIMEOUT;
+	u32 boot_state;
+
+	boot_state = read_fw_boot_param(adev, IPU7_FW_BOOT_STATE_ID);
+	if (IPU7_BOOT_STATE_CRITICAL(boot_state) ||
+	    !IPU7_BOOT_STATE_READY(boot_state)) {
+		dev_err(dev, "fw not ready for shutdown, state 0x%x\n",
+			boot_state);
+		return -EBUSY;
+	}
+
+	/* Issue shutdown to start shutdown process */
+	dev_dbg(dev, "stopping fw...\n");
+	write_fw_boot_param(adev, IPU7_FW_BOOT_STATE_ID,
+			    IPU7_FW_BOOT_STATE_SHUTDOWN_CMD);
+	while (timeout--) {
+		boot_state = read_fw_boot_param(adev,
+						IPU7_FW_BOOT_STATE_ID);
+		if (IPU7_BOOT_STATE_CRITICAL(boot_state) ||
+		    IPU7_BOOT_STATE_INACTIVE(boot_state))
+			break;
+		usleep_range(1000, 1200);
+	}
+
+	if (IPU7_BOOT_STATE_CRITICAL(boot_state)) {
+		/* TODO: ipu7_dump_fw_error_log(adev); */
+		dev_err(dev, "critical boot state error 0x%x\n", boot_state);
+		return -EINVAL;
+	} else if (!IPU7_BOOT_STATE_INACTIVE(boot_state)) {
+		dev_err(dev, "stop fw timeout. state: 0x%x\n", boot_state);
+		return -ETIMEDOUT;
+	}
+
+	ipu7_boot_cell_stop(adev);
+	dev_dbg(dev, "stop fw done.\n");
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_boot_stop_fw, "INTEL_IPU6");
diff --git a/drivers/media/pci/intel/ipu6/ipu7-boot.h b/drivers/media/pci/intel/ipu6/ipu7-boot.h
new file mode 100644
index 000000000000..e17870d10687
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu7-boot.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2026 Intel Corporation */
+
+#include "ipu7-fw-com.h"
+
+#define IPU7_BOOT_MSG_VER_MAX_ENTRIES	3U
+
+struct ipu7_boot_abi_version {
+	u8 patch;
+	u8 subminor;
+	u8 minor;
+	u8 major;
+};
+
+struct ipu7_boot_abi_msg_versions {
+	u8 num_versions;
+	u8 reserved[3];
+	struct ipu7_boot_abi_version versions[IPU7_BOOT_MSG_VER_MAX_ENTRIES];
+};
+
+struct ipu7_boot_abi_cfg {
+	u32 length;
+	struct ipu7_boot_abi_version config_version;
+	struct ipu7_boot_abi_msg_versions client_version_support;
+	u32 pkg_dir;
+	u32 subsys_config;
+	u32 uc_tile_frequency;
+	u16 checksum;
+	u8 uc_tile_frequency_units;
+	u8 padding[1];
+	u32 reserved[58];
+	struct ipu7_fw_com_config fw_com_config;
+} __packed;
+
+int ipu7_init_boot_config(struct ipu6_bus_device *adev,
+			  struct ipu7_fw_com_queue_config *qconfigs,
+			  int num_queues, u32 uc_freq,
+			  dma_addr_t subsys_config, u8 major);
+void ipu7_release_boot_config(struct ipu6_bus_device *adev);
+int ipu7_boot_start_fw(const struct ipu6_bus_device *adev);
+int ipu7_boot_stop_fw(const struct ipu6_bus_device *adev);
diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-com.c b/drivers/media/pci/intel/ipu6/ipu7-fw-com.c
new file mode 100644
index 000000000000..7dd1e683aa92
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-com.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Intel Corporation
+ */
+
+#include <linux/io.h>
+
+#include "ipu7-fw-com.h"
+
+static void __iomem *ipu7_fw_com_get_indices(struct ipu7_fw_com_context *ctx,
+					     u32 q)
+{
+	return ctx->queue_indices + (q * sizeof(struct ipu7_fw_com_queue_indices));
+}
+
+void *ipu7_fw_com_get_token(struct ipu7_fw_com_context *ctx, int q)
+{
+	struct ipu7_fw_com_queue_config *queue_params = &ctx->queue_configs[q];
+	void __iomem *queue_indices = ipu7_fw_com_get_indices(ctx, q);
+	u32 write_index = readl(queue_indices +
+				offsetof(struct ipu7_fw_com_queue_indices,
+					 write_index));
+	u32 read_index = readl(queue_indices +
+			       offsetof(struct ipu7_fw_com_queue_indices,
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
+EXPORT_SYMBOL_NS_GPL(ipu7_fw_com_get_token, "INTEL_IPU6");
+
+void ipu7_fw_com_put_token(struct ipu7_fw_com_context *ctx, int q)
+{
+	struct ipu7_fw_com_queue_config *queue_params = &ctx->queue_configs[q];
+	void __iomem *queue_indices = ipu7_fw_com_get_indices(ctx, q);
+	u32 offset, index;
+
+	if (q < ctx->num_output_queues)
+		/* Output queue */
+		offset = offsetof(struct ipu7_fw_com_queue_indices, read_index);
+
+	else
+		/* Input queue */
+		offset = offsetof(struct ipu7_fw_com_queue_indices, write_index);
+
+	index = readl(queue_indices + offset);
+	writel((index + 1U) % queue_params->max_capacity,
+	       queue_indices + offset);
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_fw_com_put_token, "INTEL_IPU6");
+
+struct ipu7_fw_com_queue_params_config *
+ipu7_fw_com_get_queue_config(struct ipu7_fw_com_config *config)
+{
+	return (struct ipu7_fw_com_queue_params_config *)(&config[1]);
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_fw_com_get_queue_config, "INTEL_IPU6");
diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-com.h b/drivers/media/pci/intel/ipu6/ipu7-fw-com.h
new file mode 100644
index 000000000000..10c09e759bed
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-com.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2026 Intel Corporation */
+
+#ifndef IPU7_FW_COM_H
+#define IPU7_FW_COM_H
+
+#include <linux/types.h>
+
+struct ipu7_fw_com_queue_config {
+	void *token_array_mem;
+	u32 queue_size;
+	u16 token_size_in_bytes;
+	u16 max_capacity;
+};
+
+struct ipu7_fw_com_context {
+	u16 num_input_queues;
+	u16 num_output_queues;
+	struct ipu7_fw_com_queue_config *queue_configs;
+	void __iomem *queue_indices;
+	dma_addr_t queue_mem_dma_addr;
+	void *queue_mem;
+	u32 queue_mem_size;
+	struct ipu7_boot_abi_cfg *boot_config;
+	dma_addr_t boot_config_dma_addr;
+	u32 boot_config_size;
+	u32 fw_entry;
+};
+
+struct ipu7_fw_com_queue_params_config {
+	u32 token_array_mem;
+	u16 token_size_in_bytes;
+	u16 max_capacity;
+};
+
+struct ipu7_fw_com_config {
+	u16 max_output_queues;
+	u16 max_input_queues;
+};
+
+struct ipu7_fw_com_queue_indices {
+	u32 read_index;
+	u32 write_index;
+};
+
+void ipu7_fw_com_put_token(struct ipu7_fw_com_context *ctx, int q);
+void *ipu7_fw_com_get_token(struct ipu7_fw_com_context *ctx, int q);
+struct ipu7_fw_com_queue_params_config *
+ipu7_fw_com_get_queue_config(struct ipu7_fw_com_config *config);
+
+#endif /* IPU7_FW_COM_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu7-platform-regs.h b/drivers/media/pci/intel/ipu6/ipu7-platform-regs.h
new file mode 100644
index 000000000000..3ca9d65e58b9
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu7-platform-regs.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2026 Intel Corporation */
+
+#ifndef IPU7_PLATFORM_REGS_H
+#define IPU7_PLATFORM_REGS_H
+
+#define IPU7_IS_UC_CTRL_BASE                   0x230000
+#define IPU7_ISYS_DMEM_OFFSET                  0x200000
+#define IPU7_PS_UC_CTRL_BASE                   0x130000
+#define IPU7_PSYS_DMEM_OFFSET                  0x100000
+
+#endif
-- 
2.54.0


