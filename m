Return-Path: <linux-media+bounces-26545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4213A3EDAA
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 08:53:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98ABC7A2ECE
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 07:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248FD1FF7C2;
	Fri, 21 Feb 2025 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JtWedg/w"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D461FFC60
	for <linux-media@vger.kernel.org>; Fri, 21 Feb 2025 07:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740124396; cv=none; b=XSc1x6ffpcKinbCnsTePgzS3Fhvf/Gm5H/0RifPeW8Zj37amz31JBQVa3WjTkelqfYAssCq2LFD/Qwf+uW4pg9yByz7PqqbGumTvNZJnU5JzkbEdHtFOglF2l4yvyrRMuXFT0P6XHnrRcI7NIvg/BsWI3hAbNM2nsgvIKY6ny28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740124396; c=relaxed/simple;
	bh=c63hKzwTdbkw8CPmSbPFEQMt4+mmmrEf6yOYeZ99Co8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ifSITQdOPBH0Xs1RTg1LGDA6WAKmrot5jWF8HFPNB+dWZ7G8jTrNojy50MD8tDKVcpjCYYBLbMqcfRHFTpZY/OtW9hRo7VCM9/eVPy9fd8SLD4+bPy95yQE92MyMIYY3k4sNyaW4SD7jCqB8EuVb8+IjUyg+gNqAecbc5W1Nzw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JtWedg/w; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740124394; x=1771660394;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c63hKzwTdbkw8CPmSbPFEQMt4+mmmrEf6yOYeZ99Co8=;
  b=JtWedg/wXp7rQCbza7nHLHzY1yEthvuGZ8GRki2Hc5D6P65jVy4e21ex
   oVxe1D3bQV/2Jm7Csvhu5cJ8HR+4PE45HCf8qxxrcz/2Vf750leQ1JK5p
   QORNcQzFyrY/39/G+kAQ02oobbeHKQ5AC7OxbXwy6oTOSBn9U8f6cFxvt
   g6xtMEecXwB1jkOEzpiae/PBVOv+jI3XzyOYTAcnKgzEUkaF/Iq9Ezgk0
   4xA/gvn81Y+mIEZhUAEfFFty/3951Y7oeF0kQNWAhCcP+gKzIvYrYw2dt
   6Bjo2bDyoHCHjGvYHA4e/UBuTrXCrEL7e3Vsb5JZa4wjpT+oE20Iro50H
   Q==;
X-CSE-ConnectionGUID: E0DlmruoS8WhjK+sX50o/w==
X-CSE-MsgGUID: R6hXsAovTruiMERnXApwLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51552546"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="51552546"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 23:53:13 -0800
X-CSE-ConnectionGUID: ETjxID4OTEifpdC2Jl/5og==
X-CSE-MsgGUID: VNsZH7geQ5qqZHSFR+Jmjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="115829650"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2025 23:53:10 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	hdegoede@redhat.com
Cc: hans@hansg.org,
	stanislaw.gruszka@linux.intel.com,
	jerry.w.hu@intel.com,
	tian.shu.qiu@intel.com,
	daxing.li@intel.com,
	hao.yao@intel.com,
	bingbu.cao@linux.intel.com,
	bingbu.cao@intel.com
Subject: [RFC PATCH 5/7] media: ipu7: add IPU7 firmware ABI headers
Date: Fri, 21 Feb 2025 15:52:50 +0800
Message-Id: <20250221075252.3347582-6-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221075252.3347582-1-bingbu.cao@intel.com>
References: <20250221075252.3347582-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

IPU7 firmware defines the ABIs between firmware and software, this
patch adds a series of ABI headers.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 .../pci/intel/ipu7/abi/ipu7_fw_boot_abi.h     | 164 ++++++
 .../pci/intel/ipu7/abi/ipu7_fw_common_abi.h   | 243 +++++++++
 .../pci/intel/ipu7/abi/ipu7_fw_config_abi.h   |  19 +
 .../intel/ipu7/abi/ipu7_fw_insys_config_abi.h |  19 +
 .../pci/intel/ipu7/abi/ipu7_fw_isys_abi.h     | 495 +++++++++++++++++
 .../pci/intel/ipu7/abi/ipu7_fw_msg_abi.h      | 509 ++++++++++++++++++
 .../intel/ipu7/abi/ipu7_fw_psys_config_abi.h  |  22 +
 .../pci/intel/ipu7/abi/ipu7_fw_syscom_abi.h   |  60 +++
 8 files changed, 1531 insertions(+)
 create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_boot_abi.h
 create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_common_abi.h
 create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_config_abi.h
 create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_insys_config_abi.h
 create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_isys_abi.h
 create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_msg_abi.h
 create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_psys_config_abi.h
 create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_syscom_abi.h

diff --git a/drivers/media/pci/intel/ipu7/abi/ipu7_fw_boot_abi.h b/drivers/media/pci/intel/ipu7/abi/ipu7_fw_boot_abi.h
new file mode 100644
index 000000000000..29a224481ef2
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/abi/ipu7_fw_boot_abi.h
@@ -0,0 +1,164 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 - 2024 Intel Corporation
+ */
+
+#ifndef IPU7_FW_BOOT_ABI_H
+#define IPU7_FW_BOOT_ABI_H
+
+#include "ipu7_fw_common_abi.h"
+#include "ipu7_fw_syscom_abi.h"
+
+#define IA_GOFO_FWLOG_SEVERITY_CRIT			(0U)
+#define IA_GOFO_FWLOG_SEVERITY_ERROR			(1U)
+#define IA_GOFO_FWLOG_SEVERITY_WARNING			(2U)
+#define IA_GOFO_FWLOG_SEVERITY_INFO			(3U)
+#define IA_GOFO_FWLOG_SEVERITY_DEBUG			(4U)
+#define IA_GOFO_FWLOG_SEVERITY_VERBOSE			(5U)
+#define IA_GOFO_FWLOG_MAX_LOGGER_SOURCES		(64U)
+
+#define LOGGER_CONFIG_CHANNEL_ENABLE_HWPRINTF_BITMASK	BIT(0)
+#define LOGGER_CONFIG_CHANNEL_ENABLE_SYSCOM_BITMASK	BIT(1)
+#define LOGGER_CONFIG_CHANNEL_ENABLE_ALL_BITMASK \
+	(LOGGER_CONFIG_CHANNEL_ENABLE_HWPRINTF_BITMASK | \
+	 LOGGER_CONFIG_CHANNEL_ENABLE_SYSCOM_BITMASK)
+
+struct ia_gofo_logger_config {
+	u8 use_source_severity;
+	u8 source_severity[IA_GOFO_FWLOG_MAX_LOGGER_SOURCES];
+	u8 use_channels_enable_bitmask;
+	u8 channels_enable_bitmask;
+	u8 padding[1];
+	ia_gofo_addr_t hw_printf_buffer_base_addr;
+	u32 hw_printf_buffer_size_bytes;
+};
+
+static inline void ia_gofo_logger_config_abi_test_func(void)
+{
+	CHECK_ALIGN32(struct ia_gofo_logger_config);
+}
+
+#pragma pack(push, 1)
+
+#define IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP \
+	((u32)IA_GOFO_FW_BOOT_ID_MAX)
+#define IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_IS_OFFSET (0U)
+#define IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_PS_OFFSET \
+	((IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_IS_OFFSET) + \
+	(u32)(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP))
+#define IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_PRIMARY_OFFSET (0U)
+#define IA_GOFO_CCG_IPU_BUTTRESS_FW_BOOT_PARAMS_SECONDARY_OFFSET (0x3000U / 4U)
+#define IA_GOFO_HKR_IPU_BUTTRESS_FW_BOOT_PARAMS_SECONDARY_OFFSET \
+	(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP * 2U)
+#define IA_GOFO_HKR_HIF_BUTTRESS_FW_BOOT_PARAMS_SECONDARY_OFFSET \
+	(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP)
+#define IA_GOFO_CCG_IPU_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX \
+	(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP * 4U)
+#define IA_GOFO_HKR_IPU_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX \
+	(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP * 4U)
+
+#define IA_GOFO_BOOT_RESERVED_SIZE (58U)
+#define IA_GOFO_BOOT_SECONDARY_RESERVED_SIZE (IA_GOFO_BOOT_RESERVED_SIZE)
+#define IA_GOFO_BOOT_SECONDARY_RESERVED_FIELDS \
+	(sizeof(ia_gofo_addr_t) + sizeof(ia_gofo_addr_t) + sizeof(u32))
+
+enum ia_gofo_buttress_reg_id {
+	IA_GOFO_FW_BOOT_CONFIG_ID = 0,
+	IA_GOFO_FW_BOOT_STATE_ID = 1,
+	IA_GOFO_FW_BOOT_RESERVED1_ID = IA_GOFO_FW_BOOT_STATE_ID,
+	IA_GOFO_FW_BOOT_SYSCOM_QUEUE_INDICES_BASE_ID = 2,
+	IA_GOFO_FW_BOOT_UNTRUSTED_ADDR_MIN_ID = 3,
+	IA_GOFO_FW_BOOT_RESERVED0_ID = IA_GOFO_FW_BOOT_UNTRUSTED_ADDR_MIN_ID,
+	IA_GOFO_FW_BOOT_MESSAGING_VERSION_ID = 4,
+	IA_GOFO_FW_BOOT_ID_MAX
+};
+
+enum ia_gofo_boot_uc_tile_frequency_units {
+	IA_GOFO_FW_BOOT_UC_FREQUENCY_UNITS_MHZ = 0,
+	IA_GOFO_FW_BOOT_UC_FREQUENCY_UNITS_KHZ = 1,
+	IA_GOFO_FW_BOOT_UC_FREQUENCY_UNITS_N
+};
+
+#define IA_GOFO_FW_BOOT_STATE_IS_CRITICAL(boot_state) \
+	(0xdead0000U == ((boot_state) & 0xffff0000U))
+
+struct ia_gofo_boot_config {
+	u32 length;
+	struct ia_gofo_version_s config_version;
+	struct ia_gofo_msg_version_list client_version_support;
+	ia_gofo_addr_t pkg_dir;
+	ia_gofo_addr_t subsys_config;
+	u32 uc_tile_frequency;
+	u16 checksum;
+	u8 uc_tile_frequency_units;
+	u8 padding[1];
+	u32 reserved[IA_GOFO_BOOT_RESERVED_SIZE];
+	struct syscom_config_s syscom_context_config;
+};
+
+struct ia_gofo_secondary_boot_config {
+	u32 length;
+	struct ia_gofo_version_s config_version;
+	struct ia_gofo_msg_version_list client_version_support;
+	u8 reserved1[IA_GOFO_BOOT_SECONDARY_RESERVED_FIELDS];
+	u16 checksum;
+	u8 padding[2];
+	u32 reserved2[IA_GOFO_BOOT_SECONDARY_RESERVED_SIZE];
+	struct syscom_config_s syscom_context_config;
+};
+
+#pragma pack(pop)
+
+static inline void ia_gofo_boot_config_abi_test_func(void)
+{
+	CHECK_ALIGN32(struct ia_gofo_boot_config);
+	CHECK_ALIGN32(struct ia_gofo_secondary_boot_config);
+}
+
+#define IA_GOFO_WDT_TIMEOUT_ERR			0xdead0401U
+#define IA_GOFO_MEM_FATAL_DME_ERR		0xdead0801U
+#define IA_GOFO_MEM_UNCORRECTABLE_LOCAL_ERR	0xdead0802U
+#define IA_GOFO_MEM_UNCORRECTABLE_DIRTY_ERR	0xdead0803U
+#define IA_GOFO_MEM_UNCORRECTABLE_DTAG_ERR	0xdead0804U
+#define IA_GOFO_MEM_UNCORRECTABLE_CACHE_ERR	0xdead0805U
+#define IA_GOFO_DOUBLE_EXCEPTION_ERR		0xdead0806U
+#define IA_GOFO_BIST_DMEM_FAULT_DETECTION_ERR	0xdead1000U
+#define IA_GOFO_BIST_DATA_INTEGRITY_FAILURE	0xdead1010U
+
+enum ia_gofo_boot_state {
+	IA_GOFO_FW_BOOT_STATE_SECONDARY_BOOT_CONFIG_READY = 0x57a7b000U,
+	IA_GOFO_FW_BOOT_STATE_UNINIT = 0x57a7e000U,
+	IA_GOFO_FW_BOOT_STATE_STARTING_0 = 0x57a7d000U,
+	IA_GOFO_FW_BOOT_STATE_CACHE_INIT_DONE = 0x57a7d010U,
+	IA_GOFO_FW_BOOT_STATE_MEM_INIT_DONE = 0x57a7d020U,
+	IA_GOFO_FW_BOOT_STATE_STACK_INIT_DONE = 0x57a7d030U,
+	IA_GOFO_FW_BOOT_STATE_EARLY_BOOT_DONE = 0x57a7d100U,
+	IA_GOFO_FW_BOOT_STATE_BOOT_CONFIG_START = 0x57a7d200U,
+	IA_GOFO_FW_BOOT_STATE_QUEUE_INIT_DONE = 0x57a7d300U,
+	IA_GOFO_FW_BOOT_STATE_READY = 0x57a7e100U,
+	IA_GOFO_FW_BOOT_STATE_CRIT_UNSPECIFIED = 0xdead0001U,
+	IA_GOFO_FW_BOOT_STATE_CRIT_CFG_PTR = 0xdead0101U,
+	IA_GOFO_FW_BOOT_STATE_CRIT_CFG_VERSION = 0xdead0201U,
+	IA_GOFO_FW_BOOT_STATE_CRIT_MSG_VERSION = 0xdead0301U,
+	IA_GOFO_FW_BOOT_STATE_CRIT_WDT_TIMEOUT = IA_GOFO_WDT_TIMEOUT_ERR,
+	IA_GOFO_FW_BOOT_STATE_WRONG_DATA_SECTION_UNPACKING = 0xdead0501U,
+	IA_GOFO_FW_BOOT_STATE_WRONG_RO_DATA_SECTION_UNPACKING = 0xdead0601U,
+	IA_GOFO_FW_BOOT_STATE_INVALID_UNTRUSTED_ADDR_MIN = 0xdead0701U,
+	IA_GOFO_FW_BOOT_STATE_CRIT_MEM_FATAL_DME = IA_GOFO_MEM_FATAL_DME_ERR,
+	IA_GOFO_FW_BOOT_STATE_CRIT_MEM_UNCORRECTABLE_LOCAL =
+	IA_GOFO_MEM_UNCORRECTABLE_LOCAL_ERR,
+	IA_GOFO_FW_BOOT_STATE_CRIT_MEM_UNCORRECTABLE_DIRTY =
+	IA_GOFO_MEM_UNCORRECTABLE_DIRTY_ERR,
+	IA_GOFO_FW_BOOT_STATE_CRIT_MEM_UNCORRECTABLE_DTAG =
+	IA_GOFO_MEM_UNCORRECTABLE_DTAG_ERR,
+	IA_GOFO_FW_BOOT_STATE_CRIT_MEM_UNCORRECTABLE_CACHE =
+	IA_GOFO_MEM_UNCORRECTABLE_CACHE_ERR,
+	IA_GOFO_FW_BOOT_STATE_CRIT_DOUBLE_EXCEPTION =
+	IA_GOFO_DOUBLE_EXCEPTION_ERR,
+	IA_GOFO_FW_BOOT_STATE_SHUTDOWN_CMD = 0x57a7f001U,
+	IA_GOFO_FW_BOOT_STATE_SHUTDOWN_START = 0x57a7e200U,
+	IA_GOFO_FW_BOOT_STATE_INACTIVE = 0x57a7e300U,
+	IA_GOFO_FW_BOOT_HW_CMD_ACK_TIMEOUT = 0x57a7e400U
+};
+
+#endif
diff --git a/drivers/media/pci/intel/ipu7/abi/ipu7_fw_common_abi.h b/drivers/media/pci/intel/ipu7/abi/ipu7_fw_common_abi.h
new file mode 100644
index 000000000000..59ca10b64495
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/abi/ipu7_fw_common_abi.h
@@ -0,0 +1,243 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 - 2024 Intel Corporation
+ */
+
+#ifndef IPU7_FW_COMMOM_ABI_H
+#define IPU7_FW_COMMOM_ABI_H
+
+#include <linux/types.h>
+
+#define CHECK_SIZE_ALIGNMENT(struct_type, alignment) do { \
+	const u8 arr[((sizeof(struct_type) % (alignment)) == 0U) ? \
+			  1 : -1]; (void)arr;\
+	} while (false)
+
+#define CHECK_ALIGN16(struct_type) \
+	CHECK_SIZE_ALIGNMENT(struct_type, sizeof(u16))
+#define CHECK_ALIGN32(struct_type) \
+	CHECK_SIZE_ALIGNMENT(struct_type, sizeof(u32))
+#define CHECK_ALIGN64(struct_type) \
+	CHECK_SIZE_ALIGNMENT(struct_type, sizeof(u64))
+
+#define IA_GOFO_CL_SIZE		(64U)
+
+#define CHECK_ALIGN_CL(struct_type) \
+	CHECK_SIZE_ALIGNMENT(struct_type, IA_GOFO_CL_SIZE)
+
+#define IA_GOFO_PAGE_SIZE	(4096U)
+#define IA_GOFO_SRAM_PAGE_SIZE	(256U)
+
+#define CHECK_ALIGN_PAGE(struct_type) \
+	CHECK_SIZE_ALIGNMENT(struct_type, IA_GOFO_PAGE_SIZE)
+
+#define CHECK_EQUAL(lval, rval) do { \
+	const u8 arr[((lval) == (rval)) ? 1 : -1]; (void)arr;\
+	} while (false)
+
+#define CHECK_SMALLER_OR_EQUAL(lval, rval) do { \
+	const u8 arr[((lval) <= (rval)) ? 1 : -1]; (void)arr;\
+	} while (false)
+
+#define CHECK_SIZE(struct_type, size)	CHECK_EQUAL(sizeof(struct_type), size)
+
+#pragma pack(push, 1)
+typedef u32	ia_gofo_addr_t;
+
+#define IA_GOFO_ADDR_NULL	(0U)
+
+struct ia_gofo_version_s {
+	u8 patch;
+	u8 subminor;
+	u8 minor;
+	u8 major;
+};
+
+#define IA_GOFO_MSG_VERSION_INIT(major_val, minor_val, subminor_val, patch_val)\
+	{.major = (major_val), .minor = (minor_val), .subminor = \
+	(subminor_val), .patch = (patch_val)}
+
+#define IA_GOFO_MSG_VERSION_LIST_MAX_ENTRIES	(3U)
+#define IA_GOFO_MSG_RESERVED_SIZE		(3U)
+
+struct ia_gofo_msg_version_list {
+	u8 num_versions;
+	u8 reserved[IA_GOFO_MSG_RESERVED_SIZE];
+	struct ia_gofo_version_s versions[IA_GOFO_MSG_VERSION_LIST_MAX_ENTRIES];
+};
+
+#pragma pack(pop)
+
+static inline void ia_gofo_common_abi_test_func(void)
+{
+	CHECK_ALIGN32(struct ia_gofo_version_s);
+	CHECK_ALIGN32(struct ia_gofo_msg_version_list);
+}
+
+#define TLV_TYPE_PADDING		(0U)
+
+#pragma pack(push, 1)
+
+#define IA_GOFO_ABI_BITS_PER_BYTE	(8U)
+
+struct ia_gofo_tlv_header {
+	u16 tlv_type;
+	u16 tlv_len32;
+};
+
+struct ia_gofo_tlv_list {
+	u16 num_elems;
+	u16 head_offset;
+};
+
+#define TLV_ITEM_ALIGNMENT	((u32)sizeof(u32))
+#define TLV_MSG_ALIGNMENT	((u32)sizeof(u64))
+#define TLV_LIST_ALIGNMENT	TLV_ITEM_ALIGNMENT
+#pragma pack(pop)
+
+static inline void ia_gofo_msg_tlv_test_func(void)
+{
+	CHECK_ALIGN16(struct ia_gofo_tlv_header);
+	CHECK_ALIGN32(struct ia_gofo_tlv_list);
+}
+
+#define IA_GOFO_MODULO(dividend, divisor) ((dividend) % (divisor))
+
+#define IA_GOFO_MSG_ERR_MAX_DETAILS		(4U)
+#define IA_GOFO_MSG_ERR_OK			(0U)
+#define IA_GOFO_MSG_ERR_UNSPECIFED		(0xffffffffU)
+#define IA_GOFO_MSG_ERR_GROUP_UNSPECIFIED	(0U)
+#define IA_GOFO_MSG_ERR_IS_OK(err)	(IA_GOFO_MSG_ERR_OK == (err).err_code)
+
+#pragma pack(push, 1)
+struct ia_gofo_msg_err {
+	u32 err_group;
+	u32 err_code;
+	u32 err_detail[IA_GOFO_MSG_ERR_MAX_DETAILS];
+};
+
+#pragma pack(pop)
+
+#define IA_GOFO_MSG_ERR_GROUP_APP_EXT_START	(16U)
+#define IA_GOFO_MSG_ERR_GROUP_MAX		(31U)
+#define IA_GOFO_MSG_ERR_GROUP_INTERNAL_START	(IA_GOFO_MSG_ERR_GROUP_MAX + 1U)
+#define IA_GOFO_MSG_ERR_GROUP_RESERVED	IA_GOFO_MSG_ERR_GROUP_UNSPECIFIED
+#define IA_GOFO_MSG_ERR_GROUP_GENERAL		1
+
+static inline void ia_gofo_msg_err_test_func(void)
+{
+	CHECK_ALIGN64(struct ia_gofo_msg_err);
+}
+
+enum ia_gofo_msg_err_general {
+	IA_GOFO_MSG_ERR_GENERAL_OK = IA_GOFO_MSG_ERR_OK,
+	IA_GOFO_MSG_ERR_GENERAL_MSG_TOO_SMALL = 1,
+	IA_GOFO_MSG_ERR_GENERAL_MSG_TOO_LARGE = 2,
+	IA_GOFO_MSG_ERR_GENERAL_DEVICE_STATE = 3,
+	IA_GOFO_MSG_ERR_GENERAL_ALIGNMENT = 4,
+	IA_GOFO_MSG_ERR_GENERAL_INDIRECT_REF_PTR_INVALID = 5,
+	IA_GOFO_MSG_ERR_GENERAL_INVALID_MSG_TYPE = 6,
+	IA_GOFO_MSG_ERR_GENERAL_SYSCOM_FAIL = 7,
+	IA_GOFO_MSG_ERR_GENERAL_N
+};
+
+#pragma pack(push, 1)
+#define IA_GOFO_MSG_TYPE_RESERVED	0
+#define IA_GOFO_MSG_TYPE_INDIRECT	1
+#define IA_GOFO_MSG_TYPE_LOG		2
+#define IA_GOFO_MSG_TYPE_GENERAL_ERR	3
+
+struct ia_gofo_msg_header {
+	struct ia_gofo_tlv_header tlv_header;
+	struct ia_gofo_tlv_list msg_options;
+	u64 user_token;
+};
+
+struct ia_gofo_msg_header_ack {
+	struct ia_gofo_msg_header header;
+	struct ia_gofo_msg_err err;
+
+};
+
+struct ia_gofo_msg_general_err {
+	struct ia_gofo_msg_header_ack header;
+};
+
+#pragma pack(pop)
+
+static inline void ia_gofo_msg_header_test_func(void)
+{
+	CHECK_ALIGN64(struct ia_gofo_msg_header);
+	CHECK_ALIGN64(struct ia_gofo_msg_header_ack);
+	CHECK_ALIGN64(struct ia_gofo_msg_general_err);
+}
+
+#pragma pack(push, 1)
+enum ia_gofo_msg_link_streaming_mode {
+	IA_GOFO_MSG_LINK_STREAMING_MODE_SOFF = 0,
+	IA_GOFO_MSG_LINK_STREAMING_MODE_DOFF = 1,
+	IA_GOFO_MSG_LINK_STREAMING_MODE_BCLM = 2,
+	IA_GOFO_MSG_LINK_STREAMING_MODE_BCSM_FIX = 3,
+	IA_GOFO_MSG_LINK_STREAMING_MODE_N
+};
+
+enum ia_gofo_soc_pbk_instance_id {
+	IA_GOFO_SOC_PBK_ID0 = 0,
+	IA_GOFO_SOC_PBK_ID1 = 1,
+	IA_GOFO_SOC_PBK_ID_N
+};
+
+#define IA_GOFO_MSG_LINK_PBK_MAX_SLOTS	(2U)
+
+struct ia_gofo_msg_indirect {
+	struct ia_gofo_msg_header header;
+	struct ia_gofo_tlv_header ref_header;
+	ia_gofo_addr_t ref_msg_ptr;
+};
+
+#pragma pack(pop)
+
+static inline void ia_gofo_msg_indirect_test_func(void)
+{
+	CHECK_ALIGN64(struct ia_gofo_msg_indirect);
+}
+
+#pragma pack(push, 1)
+#define IA_GOFO_MSG_LOG_MAX_PARAMS	(4U)
+#define IA_GOFO_MSG_LOG_DOC_FMT_ID_MIN	(0U)
+
+#define IA_GOFO_MSG_LOG_DOC_FMT_ID_MAX	(4095U)
+#define IA_GOFO_MSG_LOG_FMT_ID_INVALID	(0xfffffffU)
+
+struct ia_gofo_msg_log_info {
+	u16 log_counter;
+	u8 msg_parameter_types;
+	u8 is_out_of_order;
+	u32 fmt_id;
+	u32 params[IA_GOFO_MSG_LOG_MAX_PARAMS];
+};
+
+struct ia_gofo_msg_log_info_ts {
+	u64 msg_ts;
+	struct ia_gofo_msg_log_info log_info;
+};
+
+struct ia_gofo_msg_log {
+	struct ia_gofo_msg_header header;
+	struct ia_gofo_msg_log_info_ts log_info_ts;
+};
+
+#pragma pack(pop)
+
+static inline void ia_gofo_msg_log_test_func(void)
+{
+	CHECK_ALIGN64(struct ia_gofo_msg_log);
+	CHECK_ALIGN64(struct ia_gofo_msg_log_info);
+	CHECK_ALIGN64(struct ia_gofo_msg_log_info_ts);
+}
+
+#define IA_GOFO_MSG_ABI_OUT_ACK_QUEUE_ID	(0U)
+#define IA_GOFO_MSG_ABI_OUT_LOG_QUEUE_ID	(1U)
+#define IA_GOFO_MSG_ABI_IN_DEV_QUEUE_ID		(2U)
+
+#endif
diff --git a/drivers/media/pci/intel/ipu7/abi/ipu7_fw_config_abi.h b/drivers/media/pci/intel/ipu7/abi/ipu7_fw_config_abi.h
new file mode 100644
index 000000000000..913e05e25018
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/abi/ipu7_fw_config_abi.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2021 - 2024 Intel Corporation
+ */
+
+#ifndef IPU7_FW_CONFIG_ABI_H
+#define IPU7_FW_CONFIG_ABI_H
+
+#include <linux/types.h>
+
+#define IPU_CONFIG_ABI_WDT_TIMER_DISABLED	0U
+#define IPU_CONFIG_ABI_CMD_TIMER_DISABLED	0U
+
+struct ipu7_wdt_abi {
+	u32 wdt_timer1_us;
+	u32 wdt_timer2_us;
+};
+
+#endif
diff --git a/drivers/media/pci/intel/ipu7/abi/ipu7_fw_insys_config_abi.h b/drivers/media/pci/intel/ipu7/abi/ipu7_fw_insys_config_abi.h
new file mode 100644
index 000000000000..7a822fa60811
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/abi/ipu7_fw_insys_config_abi.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2021 - 2024 Intel Corporation
+ */
+
+#ifndef IPU7_FW_INSYS_CONFIG_ABI_H
+#define IPU7_FW_INSYS_CONFIG_ABI_H
+
+#include "ipu7_fw_boot_abi.h"
+#include "ipu7_fw_config_abi.h"
+#include "ipu7_fw_isys_abi.h"
+
+struct ipu7_insys_config {
+	u32 timeout_val_ms;
+	struct ia_gofo_logger_config logger_config;
+	struct ipu7_wdt_abi wdt_config;
+};
+
+#endif
diff --git a/drivers/media/pci/intel/ipu7/abi/ipu7_fw_isys_abi.h b/drivers/media/pci/intel/ipu7/abi/ipu7_fw_isys_abi.h
new file mode 100644
index 000000000000..f925fbdf825b
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/abi/ipu7_fw_isys_abi.h
@@ -0,0 +1,495 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 - 2024 Intel Corporation
+ */
+
+#ifndef IPU7_FW_ISYS_ABI_H
+#define IPU7_FW_ISYS_ABI_H
+
+#include "ipu7_fw_common_abi.h"
+#include "ipu7_fw_isys_abi.h"
+
+#define IPU_INSYS_MAX_OUTPUT_QUEUES	(3U)
+#define IPU_INSYS_STREAM_ID_MAX		(16U)
+
+#define IPU_INSYS_MAX_INPUT_QUEUES	(IPU_INSYS_STREAM_ID_MAX + 1U)
+#define IPU_INSYS_OUTPUT_FIRST_QUEUE	(0U)
+#define IPU_INSYS_OUTPUT_LAST_QUEUE	(IPU_INSYS_MAX_OUTPUT_QUEUES - 1U)
+#define IPU_INSYS_OUTPUT_MSG_QUEUE	(IPU_INSYS_OUTPUT_FIRST_QUEUE)
+#define IPU_INSYS_OUTPUT_LOG_QUEUE	(IPU_INSYS_OUTPUT_FIRST_QUEUE + 1U)
+#define IPU_INSYS_OUTPUT_RESERVED_QUEUE	(IPU_INSYS_OUTPUT_LAST_QUEUE)
+#define IPU_INSYS_INPUT_FIRST_QUEUE	(IPU_INSYS_MAX_OUTPUT_QUEUES)
+#define IPU_INSYS_INPUT_LAST_QUEUE \
+	(IPU_INSYS_INPUT_FIRST_QUEUE + IPU_INSYS_MAX_INPUT_QUEUES - 1U)
+#define IPU_INSYS_INPUT_DEV_QUEUE	(IPU_INSYS_INPUT_FIRST_QUEUE)
+#define IPU_INSYS_INPUT_MSG_QUEUE	(IPU_INSYS_INPUT_FIRST_QUEUE + 1U)
+#define IPU_INSYS_INPUT_MSG_MAX_QUEUE	(IPU_INSYS_MAX_INPUT_QUEUES - 1U)
+
+#define MAX_IPINS			(4U)
+#define MAX_OPINS			(4U)
+
+#define MAX_OPINS_FOR_SINGLE_IPINS	(3U)
+#define DEV_SEND_QUEUE_SIZE		(IPU_INSYS_STREAM_ID_MAX)
+
+#define PIN_PLANES_MAX			(4U)
+
+#define INSYS_MSG_ERR_STREAM_INSUFFICIENT_RESOURCES_INPUT \
+	INSYS_MSG_ERR_STREAM_INSUFFICIENT_RESOURCES
+
+typedef u64 ipu7_insys_return_token;
+
+enum ipu7_insys_resp_type {
+	IPU_INSYS_RESP_TYPE_STREAM_OPEN_DONE = 0,
+	IPU_INSYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK = 1,
+	IPU_INSYS_RESP_TYPE_STREAM_CAPTURE_ACK = 2,
+	IPU_INSYS_RESP_TYPE_STREAM_ABORT_ACK = 3,
+	IPU_INSYS_RESP_TYPE_STREAM_FLUSH_ACK = 4,
+	IPU_INSYS_RESP_TYPE_STREAM_CLOSE_ACK = 5,
+	IPU_INSYS_RESP_TYPE_PIN_DATA_READY = 6,
+	IPU_INSYS_RESP_TYPE_FRAME_SOF = 7,
+	IPU_INSYS_RESP_TYPE_FRAME_EOF = 8,
+	IPU_INSYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE = 9,
+	IPU_INSYS_RESP_TYPE_STREAM_CAPTURE_DONE = 10,
+	IPU_INSYS_RESP_TYPE_PWM_IRQ = 11,
+	N_IPU_INSYS_RESP_TYPE
+};
+
+enum ipu7_insys_send_type {
+	IPU_INSYS_SEND_TYPE_STREAM_OPEN = 0,
+	IPU_INSYS_SEND_TYPE_STREAM_START_AND_CAPTURE = 1,
+	IPU_INSYS_SEND_TYPE_STREAM_CAPTURE = 2,
+	IPU_INSYS_SEND_TYPE_STREAM_ABORT = 3,
+	IPU_INSYS_SEND_TYPE_STREAM_FLUSH = 4,
+	IPU_INSYS_SEND_TYPE_STREAM_CLOSE = 5,
+	N_IPU_INSYS_SEND_TYPE
+};
+
+enum ipu7_insys_mipi_vc {
+	IPU_INSYS_MIPI_VC_0 = 0,
+	IPU_INSYS_MIPI_VC_1 = 1,
+	IPU_INSYS_MIPI_VC_2 = 2,
+	IPU_INSYS_MIPI_VC_3 = 3,
+	IPU_INSYS_MIPI_VC_4 = 4,
+	IPU_INSYS_MIPI_VC_5 = 5,
+	IPU_INSYS_MIPI_VC_6 = 6,
+	IPU_INSYS_MIPI_VC_7 = 7,
+	IPU_INSYS_MIPI_VC_8 = 8,
+	IPU_INSYS_MIPI_VC_9 = 9,
+	IPU_INSYS_MIPI_VC_10 = 10,
+	IPU_INSYS_MIPI_VC_11 = 11,
+	IPU_INSYS_MIPI_VC_12 = 12,
+	IPU_INSYS_MIPI_VC_13 = 13,
+	IPU_INSYS_MIPI_VC_14 = 14,
+	IPU_INSYS_MIPI_VC_15 = 15,
+	N_IPU_INSYS_MIPI_VC
+};
+
+enum ipu7_insys_mipi_port {
+	IPU_INSYS_MIPI_PORT_0 = 0,
+	IPU_INSYS_MIPI_PORT_1 = 1,
+	IPU_INSYS_MIPI_PORT_2 = 2,
+	IPU_INSYS_MIPI_PORT_3 = 3,
+	IPU_INSYS_MIPI_PORT_4 = 4,
+	IPU_INSYS_MIPI_PORT_5 = 5,
+	NA_IPU_INSYS_MIPI_PORT
+};
+
+enum ipu7_insys_frame_format_type {
+	IPU_INSYS_FRAME_FORMAT_NV11 = 0,
+	IPU_INSYS_FRAME_FORMAT_NV12 = 1,
+	IPU_INSYS_FRAME_FORMAT_NV12_16 = 2,
+	IPU_INSYS_FRAME_FORMAT_NV12_TILEY = 3,
+	IPU_INSYS_FRAME_FORMAT_NV16 = 4,
+	IPU_INSYS_FRAME_FORMAT_NV21 = 5,
+	IPU_INSYS_FRAME_FORMAT_NV61 = 6,
+	IPU_INSYS_FRAME_FORMAT_YV12 = 7,
+	IPU_INSYS_FRAME_FORMAT_YV16 = 8,
+	IPU_INSYS_FRAME_FORMAT_YUV420 = 9,
+	IPU_INSYS_FRAME_FORMAT_YUV420_10 = 10,
+	IPU_INSYS_FRAME_FORMAT_YUV420_12 = 11,
+	IPU_INSYS_FRAME_FORMAT_YUV420_14 = 12,
+	IPU_INSYS_FRAME_FORMAT_YUV420_16 = 13,
+	IPU_INSYS_FRAME_FORMAT_YUV422 = 14,
+	IPU_INSYS_FRAME_FORMAT_YUV422_16 = 15,
+	IPU_INSYS_FRAME_FORMAT_UYVY = 16,
+	IPU_INSYS_FRAME_FORMAT_YUYV = 17,
+	IPU_INSYS_FRAME_FORMAT_YUV444 = 18,
+	IPU_INSYS_FRAME_FORMAT_YUV_LINE = 19,
+	IPU_INSYS_FRAME_FORMAT_RAW8 = 20,
+	IPU_INSYS_FRAME_FORMAT_RAW10 = 21,
+	IPU_INSYS_FRAME_FORMAT_RAW12 = 22,
+	IPU_INSYS_FRAME_FORMAT_RAW14 = 23,
+	IPU_INSYS_FRAME_FORMAT_RAW16 = 24,
+	IPU_INSYS_FRAME_FORMAT_RGB565 = 25,
+	IPU_INSYS_FRAME_FORMAT_PLANAR_RGB888 = 26,
+	IPU_INSYS_FRAME_FORMAT_RGBA888 = 27,
+	IPU_INSYS_FRAME_FORMAT_QPLANE6 = 28,
+	IPU_INSYS_FRAME_FORMAT_BINARY_8 = 29,
+	IPU_INSYS_FRAME_FORMAT_Y_8 = 30,
+	IPU_INSYS_FRAME_FORMAT_ARGB888 = 31,
+	IPU_INSYS_FRAME_FORMAT_BGRA888 = 32,
+	IPU_INSYS_FRAME_FORMAT_ABGR888 = 33,
+	N_IPU_INSYS_FRAME_FORMAT
+};
+
+#define IPU_INSYS_FRAME_FORMAT_RAW (IPU_INSYS_FRAME_FORMAT_RAW16)
+
+enum ipu7_insys_mipi_data_type {
+	IPU_INSYS_MIPI_DATA_TYPE_FRAME_START_CODE = 0x00,
+	IPU_INSYS_MIPI_DATA_TYPE_FRAME_END_CODE = 0x01,
+	IPU_INSYS_MIPI_DATA_TYPE_LINE_START_CODE = 0x02,
+	IPU_INSYS_MIPI_DATA_TYPE_LINE_END_CODE = 0x03,
+	IPU_INSYS_MIPI_DATA_TYPE_RESERVED_0x04 = 0x04,
+	IPU_INSYS_MIPI_DATA_TYPE_RESERVED_0x05 = 0x05,
+	IPU_INSYS_MIPI_DATA_TYPE_RESERVED_0x06 = 0x06,
+	IPU_INSYS_MIPI_DATA_TYPE_RESERVED_0x07 = 0x07,
+	IPU_INSYS_MIPI_DATA_TYPE_GENERIC_SHORT1 = 0x08,
+	IPU_INSYS_MIPI_DATA_TYPE_GENERIC_SHORT2 = 0x09,
+	IPU_INSYS_MIPI_DATA_TYPE_GENERIC_SHORT3 = 0x0a,
+	IPU_INSYS_MIPI_DATA_TYPE_GENERIC_SHORT4 = 0x0b,
+	IPU_INSYS_MIPI_DATA_TYPE_GENERIC_SHORT5 = 0x0c,
+	IPU_INSYS_MIPI_DATA_TYPE_GENERIC_SHORT6 = 0x0d,
+	IPU_INSYS_MIPI_DATA_TYPE_GENERIC_SHORT7 = 0x0e,
+	IPU_INSYS_MIPI_DATA_TYPE_GENERIC_SHORT8 = 0x0f,
+	IPU_INSYS_MIPI_DATA_TYPE_NULL = 0x10,
+	IPU_INSYS_MIPI_DATA_TYPE_BLANKING_DATA = 0x11,
+	IPU_INSYS_MIPI_DATA_TYPE_EMBEDDED = 0x12,
+	IPU_INSYS_MIPI_DATA_TYPE_RESERVED_0x13 = 0x13,
+	IPU_INSYS_MIPI_DATA_TYPE_RESERVED_0x14 = 0x14,
+	IPU_INSYS_MIPI_DATA_TYPE_RESERVED_0x15 = 0x15,
+	IPU_INSYS_MIPI_DATA_TYPE_RESERVED_0x16 = 0x16,
+	IPU_INSYS_MIPI_DATA_TYPE_RESERVED_0x17 = 0x17,
+	IPU_INSYS_MIPI_DATA_TYPE_YUV420_8 = 0x18,
+	IPU_INSYS_MIPI_DATA_TYPE_YUV420_10 = 0x19,
+	IPU_INSYS_MIPI_DATA_TYPE_YUV420_8_LEGACY = 0x1a,
+	IPU_INSYS_MIPI_DATA_TYPE_RESERVED_0x1B = 0x1b,
+	IPU_INSYS_MIPI_DATA_TYPE_YUV420_8_SHIFT = 0x1c,
+	IPU_INSYS_MIPI_DATA_TYPE_YUV420_10_SHIFT = 0x1d,
+	IPU_INSYS_MIPI_DATA_TYPE_YUV422_8 = 0x1e,
+	IPU_INSYS_MIPI_DATA_TYPE_YUV422_10 = 0x1f,
+	IPU_INSYS_MIPI_DATA_TYPE_RGB_444 = 0x20,
+	IPU_INSYS_MIPI_DATA_TYPE_RGB_555 = 0x21,
+	IPU_INSYS_MIPI_DATA_TYPE_RGB_565 = 0x22,
+	IPU_INSYS_MIPI_DATA_TYPE_RGB_666 = 0x23,
+	IPU_INSYS_MIPI_DATA_TYPE_RGB_888 = 0x24,
+	IPU_INSYS_MIPI_DATA_TYPE_RESERVED_0x25 = 0x25,
+	IPU_INSYS_MIPI_DATA_TYPE_RESERVED_0x26 = 0x26,
+	IPU_INSYS_MIPI_DATA_TYPE_RESERVED_0x27 = 0x27,
+	IPU_INSYS_MIPI_DATA_TYPE_RAW_6 = 0x28,
+	IPU_INSYS_MIPI_DATA_TYPE_RAW_7 = 0x29,
+	IPU_INSYS_MIPI_DATA_TYPE_RAW_8 = 0x2a,
+	IPU_INSYS_MIPI_DATA_TYPE_RAW_10 = 0x2b,
+	IPU_INSYS_MIPI_DATA_TYPE_RAW_12 = 0x2c,
+	IPU_INSYS_MIPI_DATA_TYPE_RAW_14 = 0x2d,
+	IPU_INSYS_MIPI_DATA_TYPE_RAW_16 = 0x2e,
+	IPU_INSYS_MIPI_DATA_TYPE_BINARY_8 = 0x2f,
+	IPU_INSYS_MIPI_DATA_TYPE_USER_DEF1 = 0x30,
+	IPU_INSYS_MIPI_DATA_TYPE_USER_DEF2 = 0x31,
+	IPU_INSYS_MIPI_DATA_TYPE_USER_DEF3 = 0x32,
+	IPU_INSYS_MIPI_DATA_TYPE_USER_DEF4 = 0x33,
+	IPU_INSYS_MIPI_DATA_TYPE_USER_DEF5 = 0x34,
+	IPU_INSYS_MIPI_DATA_TYPE_USER_DEF6 = 0x35,
+	IPU_INSYS_MIPI_DATA_TYPE_USER_DEF7 = 0x36,
+	IPU_INSYS_MIPI_DATA_TYPE_USER_DEF8 = 0x37,
+	IPU_INSYS_MIPI_DATA_TYPE_RESERVED_0x38 = 0x38,
+	IPU_INSYS_MIPI_DATA_TYPE_RESERVED_0x39 = 0x39,
+	IPU_INSYS_MIPI_DATA_TYPE_RESERVED_0x3A = 0x3a,
+	IPU_INSYS_MIPI_DATA_TYPE_RESERVED_0x3B = 0x3b,
+	IPU_INSYS_MIPI_DATA_TYPE_RESERVED_0x3C = 0x3c,
+	IPU_INSYS_MIPI_DATA_TYPE_RESERVED_0x3D = 0x3d,
+	IPU_INSYS_MIPI_DATA_TYPE_RESERVED_0x3E = 0x3e,
+	IPU_INSYS_MIPI_DATA_TYPE_RESERVED_0x3F = 0x3f,
+	N_IPU_INSYS_MIPI_DATA_TYPE = 0x40
+};
+
+enum ipu7_insys_mipi_dt_rename_mode {
+	IPU_INSYS_MIPI_DT_NO_RENAME = 0,
+	IPU_INSYS_MIPI_DT_RENAMED_MODE = 1,
+	N_IPU_INSYS_MIPI_DT_MODE
+};
+
+#define IPU_INSYS_SEND_MSG_ENABLED				1U
+#define IPU_INSYS_SEND_MSG_DISABLED				0U
+
+#define IPU_INSYS_STREAM_SYNC_MSG_SEND_RESP_SOF			BIT(0)
+#define IPU_INSYS_STREAM_SYNC_MSG_SEND_RESP_EOF			BIT(1)
+#define IPU_INSYS_STREAM_SYNC_MSG_SEND_IRQ_SOF			BIT(2)
+#define IPU_INSYS_STREAM_SYNC_MSG_SEND_IRQ_EOF			BIT(3)
+#define IPU_INSYS_STREAM_SYNC_MSG_SEND_RESP_SOF_DISCARDED	BIT(4)
+#define IPU_INSYS_STREAM_SYNC_MSG_SEND_RESP_EOF_DISCARDED	BIT(5)
+#define IPU_INSYS_STREAM_SYNC_MSG_SEND_IRQ_SOF_DISCARDED	BIT(6)
+#define IPU_INSYS_STREAM_SYNC_MSG_SEND_IRQ_EOF_DISCARDED	BIT(7)
+#define IPU_INSYS_STREAM_SYNC_MSG_ENABLE_MSG_SEND_RESP ( \
+	IPU_INSYS_STREAM_SYNC_MSG_SEND_RESP_SOF | \
+	IPU_INSYS_STREAM_SYNC_MSG_SEND_RESP_EOF | \
+	IPU_INSYS_STREAM_SYNC_MSG_SEND_RESP_SOF_DISCARDED | \
+	IPU_INSYS_STREAM_SYNC_MSG_SEND_RESP_EOF_DISCARDED)
+#define IPU_INSYS_STREAM_SYNC_MSG_ENABLE_MSG_SEND_IRQ ( \
+	IPU_INSYS_STREAM_SYNC_MSG_SEND_IRQ_SOF | \
+	IPU_INSYS_STREAM_SYNC_MSG_SEND_IRQ_EOF | \
+	IPU_INSYS_STREAM_SYNC_MSG_SEND_IRQ_SOF_DISCARDED | \
+	IPU_INSYS_STREAM_SYNC_MSG_SEND_IRQ_EOF_DISCARDED)
+
+#define IPU_INSYS_STREAM_MSG_SEND_RESP_STREAM_OPEN_DONE		BIT(0)
+#define IPU_INSYS_STREAM_MSG_SEND_IRQ_STREAM_OPEN_DONE		BIT(1)
+#define IPU_INSYS_STREAM_MSG_SEND_RESP_STREAM_START_ACK		BIT(2)
+#define IPU_INSYS_STREAM_MSG_SEND_IRQ_STREAM_START_ACK		BIT(3)
+#define IPU_INSYS_STREAM_MSG_SEND_RESP_STREAM_CLOSE_ACK		BIT(4)
+#define IPU_INSYS_STREAM_MSG_SEND_IRQ_STREAM_CLOSE_ACK		BIT(5)
+#define IPU_INSYS_STREAM_MSG_SEND_RESP_STREAM_FLUSH_ACK		BIT(6)
+#define IPU_INSYS_STREAM_MSG_SEND_IRQ_STREAM_FLUSH_ACK		BIT(7)
+#define IPU_INSYS_STREAM_MSG_SEND_RESP_STREAM_ABORT_ACK		BIT(8)
+#define IPU_INSYS_STREAM_MSG_SEND_IRQ_STREAM_ABORT_ACK		BIT(9)
+#define IPU_INSYS_STREAM_ENABLE_MSG_SEND_RESP ( \
+	IPU_INSYS_STREAM_MSG_SEND_RESP_STREAM_OPEN_DONE | \
+	IPU_INSYS_STREAM_MSG_SEND_RESP_STREAM_START_ACK | \
+	IPU_INSYS_STREAM_MSG_SEND_RESP_STREAM_CLOSE_ACK | \
+	IPU_INSYS_STREAM_MSG_SEND_RESP_STREAM_FLUSH_ACK | \
+	IPU_INSYS_STREAM_MSG_SEND_RESP_STREAM_ABORT_ACK)
+#define IPU_INSYS_STREAM_ENABLE_MSG_SEND_IRQ ( \
+	IPU_INSYS_STREAM_MSG_SEND_IRQ_STREAM_OPEN_DONE | \
+	IPU_INSYS_STREAM_MSG_SEND_IRQ_STREAM_START_ACK | \
+	IPU_INSYS_STREAM_MSG_SEND_IRQ_STREAM_CLOSE_ACK | \
+	IPU_INSYS_STREAM_MSG_SEND_IRQ_STREAM_FLUSH_ACK | \
+	IPU_INSYS_STREAM_MSG_SEND_IRQ_STREAM_ABORT_ACK)
+
+#define IPU_INSYS_FRAME_MSG_SEND_RESP_CAPTURE_ACK		BIT(0)
+#define IPU_INSYS_FRAME_MSG_SEND_IRQ_CAPTURE_ACK		BIT(1)
+#define IPU_INSYS_FRAME_MSG_SEND_RESP_CAPTURE_DONE		BIT(2)
+#define IPU_INSYS_FRAME_MSG_SEND_IRQ_CAPTURE_DONE		BIT(3)
+#define IPU_INSYS_FRAME_MSG_SEND_RESP_PIN_DATA_READY		BIT(4)
+#define IPU_INSYS_FRAME_MSG_SEND_IRQ_PIN_DATA_READY		BIT(5)
+#define IPU_INSYS_FRAME_ENABLE_MSG_SEND_RESP ( \
+	IPU_INSYS_FRAME_MSG_SEND_RESP_CAPTURE_ACK | \
+	IPU_INSYS_FRAME_MSG_SEND_RESP_CAPTURE_DONE | \
+	IPU_INSYS_FRAME_MSG_SEND_RESP_PIN_DATA_READY)
+#define IPU_INSYS_FRAME_ENABLE_MSG_SEND_IRQ ( \
+	IPU_INSYS_FRAME_MSG_SEND_IRQ_CAPTURE_ACK | \
+	IPU_INSYS_FRAME_MSG_SEND_IRQ_CAPTURE_DONE | \
+	IPU_INSYS_FRAME_MSG_SEND_IRQ_PIN_DATA_READY)
+
+enum ipu7_insys_output_link_dest {
+	IPU_INSYS_OUTPUT_LINK_DEST_MEM = 0,
+	IPU_INSYS_OUTPUT_LINK_DEST_PSYS = 1,
+	IPU_INSYS_OUTPUT_LINK_DEST_IPU_EXTERNAL = 2
+};
+
+enum ipu7_insys_dpcm_type {
+	IPU_INSYS_DPCM_TYPE_DISABLED = 0,
+	IPU_INSYS_DPCM_TYPE_10_8_10 = 1,
+	IPU_INSYS_DPCM_TYPE_12_8_12 = 2,
+	IPU_INSYS_DPCM_TYPE_12_10_12 = 3,
+	N_IPU_INSYS_DPCM_TYPE
+};
+
+enum ipu7_insys_dpcm_predictor {
+	IPU_INSYS_DPCM_PREDICTOR_1 = 0,
+	IPU_INSYS_DPCM_PREDICTOR_2 = 1,
+	N_IPU_INSYS_DPCM_PREDICTOR
+};
+
+enum ipu7_insys_send_queue_token_flag {
+	IPU_INSYS_SEND_QUEUE_TOKEN_FLAG_NONE = 0,
+	IPU_INSYS_SEND_QUEUE_TOKEN_FLAG_FLUSH_FORCE = 1
+};
+
+#pragma pack(push, 1)
+struct ipu7_insys_resolution {
+	u32 width;
+	u32 height;
+};
+
+struct ipu7_insys_capture_output_pin_payload {
+	u64 user_token;
+	ia_gofo_addr_t addr;
+	u8 pad[4];
+};
+
+struct ipu7_insys_output_link {
+	u32 buffer_lines;
+	u16 foreign_key;
+	u16 granularity_pointer_update;
+	u8 msg_link_streaming_mode;
+	u8 pbk_id;
+	u8 pbk_slot_id;
+	u8 dest;
+	u8 use_sw_managed;
+	u8 is_snoop;
+	u8 pad[2];
+};
+
+struct ipu7_insys_output_cropping {
+	u16 line_top;
+	u16 line_bottom;
+};
+
+struct ipu7_insys_output_dpcm {
+	u8 enable;
+	u8 type;
+	u8 predictor;
+	u8 pad;
+};
+
+struct ipu7_insys_output_pin {
+	struct ipu7_insys_output_link link;
+	struct ipu7_insys_output_cropping crop;
+	struct ipu7_insys_output_dpcm dpcm;
+	u32 stride;
+	u16 ft;
+	u8 send_irq;
+	u8 input_pin_id;
+	u8 early_ack_en;
+	u8 pad[3];
+};
+
+struct ipu7_insys_input_pin {
+	struct ipu7_insys_resolution input_res;
+	u16 sync_msg_map;
+	u8 dt;
+	u8 disable_mipi_unpacking;
+	u8 dt_rename_mode;
+	u8 mapped_dt;
+	u8 pad[2];
+};
+
+struct ipu7_insys_stream_cfg {
+	struct ipu7_insys_input_pin input_pins[MAX_IPINS];
+	struct ipu7_insys_output_pin output_pins[MAX_OPINS];
+	u16 stream_msg_map;
+	u8 port_id;
+	u8 vc;
+	u8 nof_input_pins;
+	u8 nof_output_pins;
+	u8 pad[2];
+};
+
+struct ipu7_insys_buffset {
+	struct ipu7_insys_capture_output_pin_payload output_pins[MAX_OPINS];
+	u8 capture_msg_map;
+	u8 frame_id;
+	u8 skip_frame;
+	u8 pad[5];
+};
+
+struct ipu7_insys_resp {
+	u64 buf_id;
+	struct ipu7_insys_capture_output_pin_payload pin;
+	struct ia_gofo_msg_err error_info;
+	u32 timestamp[2];
+	u8 type;
+	u8 msg_link_streaming_mode;
+	u8 stream_id;
+	u8 pin_id;
+	u8 frame_id;
+	u8 skip_frame;
+	u8 pad[2];
+};
+
+struct ipu7_insys_resp_queue_token {
+	struct ipu7_insys_resp resp_info;
+};
+
+struct ipu7_insys_send_queue_token {
+	u64 buf_handle;
+	ia_gofo_addr_t addr;
+	u16 stream_id;
+	u8 send_type;
+	u8 flag;
+};
+
+#pragma pack(pop)
+
+static inline void ipu7_insys_types_test_func(void)
+{
+	CHECK_ALIGN32(struct ipu7_insys_resolution);
+	CHECK_ALIGN64(struct ipu7_insys_capture_output_pin_payload);
+	CHECK_ALIGN32(struct ipu7_insys_output_pin);
+	CHECK_ALIGN32(struct ipu7_insys_input_pin);
+	CHECK_ALIGN32(struct ipu7_insys_output_cropping);
+	CHECK_ALIGN32(struct ipu7_insys_stream_cfg);
+	CHECK_ALIGN64(struct ipu7_insys_buffset);
+	CHECK_ALIGN64(struct ipu7_insys_resp);
+	CHECK_ALIGN64(struct ipu7_insys_resp_queue_token);
+	CHECK_ALIGN64(struct ipu7_insys_send_queue_token);
+	CHECK_ALIGN32(struct ipu7_insys_output_link);
+}
+
+enum insys_msg_err_stream {
+	INSYS_MSG_ERR_STREAM_OK = IA_GOFO_MSG_ERR_OK,
+	INSYS_MSG_ERR_STREAM_STREAM_ID = 1,
+	INSYS_MSG_ERR_STREAM_MAX_OPINS = 2,
+	INSYS_MSG_ERR_STREAM_MAX_IPINS = 3,
+	INSYS_MSG_ERR_STREAM_STREAM_MESSAGES_MAP = 4,
+	INSYS_MSG_ERR_STREAM_SYNC_MESSAGES_MAP = 5,
+	INSYS_MSG_ERR_STREAM_SENSOR_TYPE = 6,
+	INSYS_MSG_ERR_STREAM_FOREIGN_KEY = 7,
+	INSYS_MSG_ERR_STREAM_STREAMING_MODE = 8,
+	INSYS_MSG_ERR_STREAM_DPCM_EN = 9,
+	INSYS_MSG_ERR_STREAM_DPCM_TYPE = 10,
+	INSYS_MSG_ERR_STREAM_DPCM_PREDICTOR = 11,
+	INSYS_MSG_ERR_STREAM_GRANULARITY_POINTER_UPDATE = 12,
+	INSYS_MSG_ERR_STREAM_MPF_LUT_ENTRY_RESOURCES_BUSY = 13,
+	INSYS_MSG_ERR_STREAM_MPF_DEV_ID = 14,
+	INSYS_MSG_ERR_STREAM_BUFFER_LINES = 15,
+	INSYS_MSG_ERR_STREAM_IPIN_ID = 16,
+	INSYS_MSG_ERR_STREAM_DATA_TYPE = 17,
+	INSYS_MSG_ERR_STREAM_STREAMING_PROTOCOL_STATE = 18,
+	INSYS_MSG_ERR_STREAM_SYSCOM_FLUSH = 19,
+	INSYS_MSG_ERR_STREAM_MIPI_VC = 20,
+	INSYS_MSG_ERR_STREAM_STREAM_SRC = 21,
+	INSYS_MSG_ERR_STREAM_PBK_ID = 22,
+	INSYS_MSG_ERR_STREAM_CMD_QUEUE_DEALLOCATE = 23,
+	INSYS_MSG_ERR_STREAM_INSUFFICIENT_RESOURCES = 24,
+	INSYS_MSG_ERR_STREAM_IPIN_CONFIGURATION = 25,
+	INSYS_MSG_ERR_STREAM_INVALID_STATE = 26,
+	INSYS_MSG_ERR_STREAM_SW_MANAGED = 27,
+	INSYS_MSG_ERR_STREAM_PBK_SLOT_ID = 28,
+	INSYS_MSG_ERR_STREAM_FLUSH_TIMEOUT = 29,
+	INSYS_MSG_ERR_STREAM_IPIN_WIDTH = 30,
+	INSYS_MSG_ERR_STREAM_IPIN_HEIGHT = 31,
+	INSYS_MSG_ERR_STREAM_OUTPUT_PIN_EARLY_ACK_EN = 32,
+	INSYS_MSG_ERR_STREAM_INCONSISTENT_PARAMS = 33,
+	INSYS_MSG_ERR_STREAM_PLANE_COUNT = 34,
+	INSYS_MSG_ERR_STREAM_FRAME_FORMAT_TYPE = 35,
+	INSYS_MSG_ERR_STREAM_INSUFFICIENT_RESOURCES_OUTPUT = 36,
+	INSYS_MSG_ERR_STREAM_N
+};
+
+enum insys_msg_err_capture {
+	INSYS_MSG_ERR_CAPTURE_OK = IA_GOFO_MSG_ERR_OK,
+	INSYS_MSG_ERR_CAPTURE_STREAM_ID = 1,
+	INSYS_MSG_ERR_CAPTURE_PAYLOAD_PTR = 2,
+	INSYS_MSG_ERR_CAPTURE_MEM_SLOT = 3,
+	INSYS_MSG_ERR_CAPTURE_STREAMING_MODE = 4,
+	INSYS_MSG_ERR_CAPTURE_AVAILABLE_CMD_SLOT = 5,
+	INSYS_MSG_ERR_CAPTURE_CONSUMED_CMD_SLOT = 6,
+	INSYS_MSG_ERR_CAPTURE_CMD_SLOT_PAYLOAD_PTR = 7,
+	INSYS_MSG_ERR_CAPTURE_CMD_PREPARE = 8,
+	INSYS_MSG_ERR_CAPTURE_OUTPUT_PIN = 9,
+	INSYS_MSG_ERR_CAPTURE_SYNC_FRAME_DROP = 10,
+	INSYS_MSG_ERR_CAPTURE_FRAME_MESSAGES_MAP = 11,
+	INSYS_MSG_ERR_CAPTURE_TIMEOUT = 12,
+	INSYS_MSG_ERR_CAPTURE_INVALID_STREAM_STATE = 13,
+	INSYS_MSG_ERR_CAPTURE_HW_ERR_MULTIBIT_PH_ERROR_DETECTED = 14,
+	INSYS_MSG_ERR_CAPTURE_HW_ERR_PAYLOAD_CRC_ERROR = 15,
+	INSYS_MSG_ERR_CAPTURE_HW_ERR_INPUT_DATA_LOSS_ELASTIC_FIFO_OVFL  = 16,
+	INSYS_MSG_ERR_CAPTURE_HW_ERR_PIXEL_BUFFER_OVERFLOW = 17,
+	INSYS_MSG_ERR_CAPTURE_HW_ERR_BAD_FRAME_DIM = 18,
+	INSYS_MSG_ERR_CAPTURE_HW_ERR_PHY_SYNC_ERR = 19,
+	INSYS_MSG_ERR_CAPTURE_HW_ERR_SECURE_TOUCH = 20,
+	INSYS_MSG_ERR_CAPTURE_HW_ERR_MASTER_SLAVE_SYNC_ERR = 21,
+	INSYS_MSG_ERR_CAPTURE_FRAME_SKIP_ERR = 22,
+	INSYS_MSG_ERR_CAPTURE_FE_INPUT_FIFO_OVERFLOW_ERR = 23,
+	INSYS_MSG_ERR_CAPTURE_CMD_SUBMIT_TO_HW = 24,
+	INSYS_MSG_ERR_CAPTURE_N
+};
+
+enum insys_msg_err_groups {
+	INSYS_MSG_ERR_GROUP_RESERVED = IA_GOFO_MSG_ERR_GROUP_RESERVED,
+	INSYS_MSG_ERR_GROUP_GENERAL = IA_GOFO_MSG_ERR_GROUP_GENERAL,
+	INSYS_MSG_ERR_GROUP_STREAM = 2,
+	INSYS_MSG_ERR_GROUP_CAPTURE = 3,
+	INSYS_MSG_ERR_GROUP_N,
+};
+
+#endif
diff --git a/drivers/media/pci/intel/ipu7/abi/ipu7_fw_msg_abi.h b/drivers/media/pci/intel/ipu7/abi/ipu7_fw_msg_abi.h
new file mode 100644
index 000000000000..f1437fb2bd82
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/abi/ipu7_fw_msg_abi.h
@@ -0,0 +1,509 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 - 2024 Intel Corporation
+ */
+
+#ifndef IPU7_FW_MSG_ABI_H
+#define IPU7_FW_MSG_ABI_H
+
+#include "ipu7_fw_common_abi.h"
+
+#pragma pack(push, 1)
+enum ipu7_msg_type {
+	IPU_MSG_TYPE_RESERVED = IA_GOFO_MSG_TYPE_RESERVED,
+	IPU_MSG_TYPE_INDIRECT = IA_GOFO_MSG_TYPE_INDIRECT,
+	IPU_MSG_TYPE_DEV_LOG = IA_GOFO_MSG_TYPE_LOG,
+	IPU_MSG_TYPE_GENERAL_ERR = IA_GOFO_MSG_TYPE_GENERAL_ERR,
+	IPU_MSG_TYPE_DEV_OPEN = 4,
+	IPU_MSG_TYPE_DEV_OPEN_ACK = 5,
+	IPU_MSG_TYPE_GRAPH_OPEN = 6,
+	IPU_MSG_TYPE_GRAPH_OPEN_ACK = 7,
+	IPU_MSG_TYPE_TASK_REQ = 8,
+	IPU_MSG_TYPE_TASK_DONE = 9,
+	IPU_MSG_TYPE_GRAPH_CLOSE = 10,
+	IPU_MSG_TYPE_GRAPH_CLOSE_ACK = 11,
+	IPU_MSG_TYPE_DEV_CLOSE = 12,
+	IPU_MSG_TYPE_DEV_CLOSE_ACK = 13,
+	IPU_MSG_TYPE_TERM_EVENT = 14,
+	IPU_MSG_TYPE_N,
+};
+
+#define IPU_MSG_MAX_NODE_TERMS		(64U)
+#define IPU_MSG_MAX_FRAGS		(7U)
+
+enum ipu7_msg_node_type {
+	IPU_MSG_NODE_TYPE_PAD = 0,
+	IPU_MSG_NODE_TYPE_BASE,
+	IPU_MSG_NODE_TYPE_N
+};
+
+#define IPU_MSG_NODE_MAX_DEVICES	(128U)
+#define DEB_NUM_UINT32	(IPU_MSG_NODE_MAX_DEVICES / (sizeof(u32) * 8U))
+
+typedef u32 ipu7_msg_teb_t[2];
+typedef u32 ipu7_msg_deb_t[DEB_NUM_UINT32];
+
+#define IPU_MSG_NODE_MAX_ROUTE_ENABLES	(128U)
+#define RBM_NUM_UINT32	(IPU_MSG_NODE_MAX_ROUTE_ENABLES / (sizeof(u32) * 8U))
+
+typedef u32 ipu7_msg_rbm_t[RBM_NUM_UINT32];
+
+enum ipu7_msg_node_profile_type {
+	IPU_MSG_NODE_PROFILE_TYPE_PAD = 0,
+	IPU_MSG_NODE_PROFILE_TYPE_BASE,
+	IPU_MSG_NODE_PROFILE_TYPE_CB,
+	IPU_MSG_NODE_PROFILE_TYPE_N
+};
+
+struct ipu7_msg_node_profile {
+	struct ia_gofo_tlv_header tlv_header;
+	ipu7_msg_teb_t teb;
+};
+
+struct ipu7_msg_cb_profile {
+	struct ipu7_msg_node_profile profile_base;
+	ipu7_msg_deb_t deb;
+	ipu7_msg_rbm_t rbm;
+	ipu7_msg_rbm_t reb;
+};
+
+#define IPU_MSG_NODE_MAX_PROFILES	(2U)
+#define IPU_MSG_NODE_DEF_PROFILE_IDX	(0U)
+#define IPU_MSG_NODE_RSRC_ID_EXT_IP	(0xffU)
+
+#define IPU_MSG_NODE_DONT_CARE_TEB_HI	(0xffffffffU)
+#define IPU_MSG_NODE_DONT_CARE_TEB_LO	(0xffffffffU)
+#define IPU_MSG_NODE_RSRC_ID_IS		(0xfeU)
+
+struct ipu7_msg_node {
+	struct ia_gofo_tlv_header tlv_header;
+	u8 node_rsrc_id;
+	u8 node_ctx_id;
+	u8 num_frags;
+	u8 reserved[1];
+	struct ia_gofo_tlv_list profiles_list;
+	struct ia_gofo_tlv_list terms_list;
+	struct ia_gofo_tlv_list node_options;
+};
+
+enum ipu7_msg_node_option_types {
+	IPU_MSG_NODE_OPTION_TYPES_PADDING = 0,
+	IPU_MSG_NODE_OPTION_TYPES_N
+};
+
+#pragma pack(pop)
+
+static inline void ipu7_msg_node_test_func(void)
+{
+	CHECK_ALIGN32(struct ipu7_msg_node);
+	CHECK_ALIGN32(struct ipu7_msg_node_profile);
+	CHECK_ALIGN32(struct ipu7_msg_cb_profile);
+}
+
+#pragma pack(push, 1)
+
+enum ipu7_msg_link_type {
+	IPU_MSG_LINK_TYPE_PAD = 0,
+	IPU_MSG_LINK_TYPE_GENERIC = 1,
+	IPU_MSG_LINK_TYPE_N
+};
+
+enum ipu7_msg_link_option_types {
+	IPU_MSG_LINK_OPTION_TYPES_PADDING = 0,
+	IPU_MSG_LINK_OPTION_TYPES_CMPRS = 1,
+	IPU_MSG_LINK_OPTION_TYPES_N
+};
+
+enum ipu7_msg_link_cmprs_option_bit_depth {
+	IPU_MSG_LINK_CMPRS_OPTION_8BPP = 0,
+	IPU_MSG_LINK_CMPRS_OPTION_10BPP = 1,
+	IPU_MSG_LINK_CMPRS_OPTION_12BPP = 2,
+};
+
+#define IPU_MSG_LINK_CMPRS_SPACE_SAVING_DENOM		(128U)
+#define IPU_MSG_LINK_CMPRS_LOSSY_CFG_PAYLOAD_SIZE	(5U)
+#define IPU_MSG_LINK_CMPRS_SPACE_SAVING_NUM_MAX \
+	(IPU_MSG_LINK_CMPRS_SPACE_SAVING_DENOM - 1U)
+
+struct ipu7_msg_link_cmprs_plane_desc {
+	u8 plane_enable;
+	u8 cmprs_enable;
+	u8 encoder_plane_id;
+	u8 decoder_plane_id;
+	u8 cmprs_is_lossy;
+	u8 cmprs_is_footprint;
+	u8 bit_depth;
+	u8 space_saving_numerator;
+	u32 pixels_offset;
+	u32 ts_offset;
+	u32 tile_row_to_tile_row_stride;
+	u32 rows_of_tiles;
+	u32 lossy_cfg[IPU_MSG_LINK_CMPRS_LOSSY_CFG_PAYLOAD_SIZE];
+};
+
+#define IPU_MSG_LINK_CMPRS_MAX_PLANES		(2U)
+#define IPU_MSG_LINK_CMPRS_NO_ALIGN_INTERVAL	(0U)
+#define IPU_MSG_LINK_CMPRS_MIN_ALIGN_INTERVAL	(16U)
+#define IPU_MSG_LINK_CMPRS_MAX_ALIGN_INTERVAL	(1024U)
+struct ipu7_msg_link_cmprs_option {
+	struct ia_gofo_tlv_header header;
+	u32 cmprs_buf_size;
+	u16 align_interval;
+	u8 reserved[2];
+	struct ipu7_msg_link_cmprs_plane_desc plane_descs[2];
+};
+
+struct ipu7_msg_link_ep {
+	u8 node_ctx_id;
+	u8 term_id;
+};
+
+struct ipu7_msg_link_ep_pair {
+	struct ipu7_msg_link_ep ep_src;
+	struct ipu7_msg_link_ep ep_dst;
+};
+
+#define IPU_MSG_LINK_FOREIGN_KEY_NONE		(65535U)
+#define IPU_MSG_LINK_FOREIGN_KEY_MAX		(64U)
+#define IPU_MSG_LINK_PBK_ID_DONT_CARE		(255U)
+#define IPU_MSG_LINK_PBK_SLOT_ID_DONT_CARE	(255U)
+#define IPU_MSG_LINK_TERM_ID_DONT_CARE		(0xffU)
+
+struct ipu7_msg_link {
+	struct ia_gofo_tlv_header tlv_header;
+	struct ipu7_msg_link_ep_pair endpoints;
+	u16 foreign_key;
+	u8 streaming_mode;
+	u8 pbk_id;
+	u8 pbk_slot_id;
+	u8 delayed_link;
+	u8 reserved[2];
+	struct ia_gofo_tlv_list link_options;
+};
+
+#pragma pack(pop)
+
+static inline void ipu7_msg_abi_link_test_func(void)
+{
+	CHECK_ALIGN32(struct ipu7_msg_link);
+	CHECK_ALIGN32(struct ipu7_msg_link_cmprs_option);
+	CHECK_ALIGN32(struct ipu7_msg_link_cmprs_plane_desc);
+}
+
+enum ipu7_msg_dev_state {
+	IPU_MSG_DEV_STATE_CLOSED = 0,
+	IPU_MSG_DEV_STATE_OPEN_WAIT = 1,
+	IPU_MSG_DEV_STATE_OPEN = 2,
+	IPU_MSG_DEV_STATE_CLOSE_WAIT = 3,
+	IPU_MSG_DEV_STATE_N
+};
+
+enum ipu7_msg_graph_state {
+	IPU_MSG_GRAPH_STATE_CLOSED = 0,
+	IPU_MSG_GRAPH_STATE_OPEN_WAIT = 1,
+	IPU_MSG_GRAPH_STATE_OPEN = 2,
+	IPU_MSG_GRAPH_STATE_CLOSE_WAIT = 3,
+	IPU_MSG_GRAPH_STATE_N
+};
+
+enum ipu7_msg_task_state {
+	IPU_MSG_TASK_STATE_DONE = 0,
+	IPU_MSG_TASK_STATE_WAIT_DONE = 1,
+	IPU_MSG_TASK_STATE_N
+};
+
+enum ipu7_msg_err_groups {
+	IPU_MSG_ERR_GROUP_RESERVED = IA_GOFO_MSG_ERR_GROUP_RESERVED,
+	IPU_MSG_ERR_GROUP_GENERAL = IA_GOFO_MSG_ERR_GROUP_GENERAL,
+	IPU_MSG_ERR_GROUP_DEVICE = 2,
+	IPU_MSG_ERR_GROUP_GRAPH = 3,
+	IPU_MSG_ERR_GROUP_TASK = 4,
+	IPU_MSG_ERR_GROUP_N,
+};
+
+#pragma pack(push, 1)
+struct ipu7_msg_task {
+	struct ia_gofo_msg_header header;
+	u8 graph_id;
+	u8 profile_idx;
+	u8 node_ctx_id;
+	u8 frame_id;
+	u8 frag_id;
+	u8 req_done_msg;
+	u8 req_done_irq;
+	u8 reserved[1];
+	ipu7_msg_teb_t payload_reuse_bm;
+	ia_gofo_addr_t term_buffers[IPU_MSG_MAX_NODE_TERMS];
+};
+
+struct ipu7_msg_task_done {
+	struct ia_gofo_msg_header_ack header;
+	u8 graph_id;
+	u8 frame_id;
+	u8 node_ctx_id;
+	u8 profile_idx;
+	u8 frag_id;
+	u8 reserved[3];
+};
+
+enum ipu7_msg_err_task {
+	IPU_MSG_ERR_TASK_OK = IA_GOFO_MSG_ERR_OK,
+	IPU_MSG_ERR_TASK_GRAPH_ID = 1,
+	IPU_MSG_ERR_TASK_NODE_CTX_ID = 2,
+	IPU_MSG_ERR_TASK_PROFILE_IDX = 3,
+	IPU_MSG_ERR_TASK_CTX_MEMORY_TASK = 4,
+	IPU_MSG_ERR_TASK_TERM_PAYLOAD_PTR = 5,
+	IPU_MSG_ERR_TASK_FRAME_ID = 6,
+	IPU_MSG_ERR_TASK_FRAG_ID = 7,
+	IPU_MSG_ERR_TASK_EXEC_EXT = 8,
+	IPU_MSG_ERR_TASK_EXEC_SBX = 9,
+	IPU_MSG_ERR_TASK_EXEC_INT = 10,
+	IPU_MSG_ERR_TASK_EXEC_UNKNOWN = 11,
+	IPU_MSG_ERR_TASK_N
+};
+
+#pragma pack(pop)
+
+static inline void ipu7_msg_task_test_func(void)
+{
+	CHECK_ALIGN64(struct ipu7_msg_task);
+	CHECK_ALIGN64(struct ipu7_msg_task_done);
+	CHECK_ALIGN32(struct ipu7_msg_link_cmprs_option);
+}
+
+#pragma pack(push, 1)
+enum ipu7_msg_term_type {
+	IPU_MSG_TERM_TYPE_PAD = 0,
+	IPU_MSG_TERM_TYPE_BASE,
+	IPU_MSG_TERM_TYPE_N,
+};
+
+#define IPU_MSG_TERM_EVENT_TYPE_NONE		0U
+#define IPU_MSG_TERM_EVENT_TYPE_PROGRESS	1U
+#define IPU_MSG_TERM_EVENT_TYPE_N	(IPU_MSG_TERM_EVENT_TYPE_PROGRESS + 1U)
+
+struct ipu7_msg_term {
+	struct ia_gofo_tlv_header tlv_header;
+	u8 term_id;
+	u8 event_req_bm;
+	u8 reserved[2];
+	u32 payload_size;
+	struct ia_gofo_tlv_list term_options;
+};
+
+enum ipu7_msg_term_option_types {
+	IPU_MSG_TERM_OPTION_TYPES_PADDING = 0,
+	IPU_MSG_TERM_OPTION_TYPES_N
+};
+
+struct ipu7_msg_term_event {
+	struct ia_gofo_msg_header header;
+	u8 graph_id;
+	u8 frame_id;
+	u8 node_ctx_id;
+	u8 profile_idx;
+	u8 frag_id;
+	u8 term_id;
+	u8 event_type;
+	u8 reserved[1];
+	u64 event_ts;
+};
+
+#pragma pack(pop)
+
+static inline void ipu7_msg_term_test_func(void)
+{
+	CHECK_ALIGN32(struct ipu7_msg_term);
+	CHECK_ALIGN64(struct ipu7_msg_term_event);
+}
+
+#pragma pack(push, 1)
+#define IPU_MSG_DEVICE_SEND_MSG_ENABLED		1U
+#define IPU_MSG_DEVICE_SEND_MSG_DISABLED	0U
+
+#define IPU_MSG_DEVICE_OPEN_SEND_RESP		BIT(0)
+#define IPU_MSG_DEVICE_OPEN_SEND_IRQ		BIT(1)
+
+#define IPU_MSG_DEVICE_CLOSE_SEND_RESP		BIT(0)
+#define IPU_MSG_DEVICE_CLOSE_SEND_IRQ		BIT(1)
+
+struct ipu7_msg_dev_open {
+	struct ia_gofo_msg_header header;
+	u32 max_graphs;
+	u8 dev_msg_map;
+	u8 enable_power_gating;
+	u8 reserved[2];
+};
+
+struct ipu7_msg_dev_open_ack {
+	struct ia_gofo_msg_header_ack header;
+};
+
+struct ipu7_msg_dev_close {
+	struct ia_gofo_msg_header header;
+	u8 dev_msg_map;
+	u8 reserved[7];
+};
+
+struct ipu7_msg_dev_close_ack {
+	struct ia_gofo_msg_header_ack header;
+};
+
+enum ipu7_msg_err_device {
+	IPU_MSG_ERR_DEVICE_OK = IA_GOFO_MSG_ERR_OK,
+	IPU_MSG_ERR_DEVICE_MAX_GRAPHS = 1,
+	IPU_MSG_ERR_DEVICE_MSG_MAP = 2,
+	IPU_MSG_ERR_DEVICE_N
+};
+
+#pragma pack(pop)
+
+static inline void ipu7_msg_device_test_func(void)
+{
+	CHECK_ALIGN32(struct ia_gofo_version_s);
+	CHECK_ALIGN64(struct ipu7_msg_dev_open);
+	CHECK_ALIGN64(struct ipu7_msg_dev_open_ack);
+	CHECK_ALIGN64(struct ipu7_msg_dev_close);
+	CHECK_ALIGN64(struct ipu7_msg_dev_close_ack);
+}
+
+#pragma pack(push, 1)
+#define IPU_MSG_GRAPH_ID_UNKNOWN	(0xffU)
+#define IPU_MSG_GRAPH_SEND_MSG_ENABLED	1U
+#define IPU_MSG_GRAPH_SEND_MSG_DISABLED	0U
+
+#define IPU_MSG_GRAPH_OPEN_SEND_RESP	BIT(0)
+#define IPU_MSG_GRAPH_OPEN_SEND_IRQ	BIT(1)
+
+#define IPU_MSG_GRAPH_CLOSE_SEND_RESP	BIT(0)
+#define IPU_MSG_GRAPH_CLOSE_SEND_IRQ	BIT(1)
+
+struct ipu7_msg_graph_open {
+	struct ia_gofo_msg_header header;
+	struct ia_gofo_tlv_list nodes;
+	struct ia_gofo_tlv_list links;
+	u8 graph_id;
+	u8 graph_msg_map;
+	u8 reserved[6];
+};
+
+enum ipu7_msg_graph_ack_option_types {
+	IPU_MSG_GRAPH_ACK_OPTION_TYPES_PADDING = 0,
+	IPU_MSG_GRAPH_ACK_TASK_Q_INFO,
+	IPU_MSG_GRAPH_ACK_OPTION_TYPES_N
+};
+
+struct ipu7_msg_graph_open_ack_task_q_info {
+	struct ia_gofo_tlv_header header;
+	u8 node_ctx_id;
+	u8 q_id;
+	u8 reserved[2];
+};
+
+struct ipu7_msg_graph_open_ack {
+	struct ia_gofo_msg_header_ack header;
+	u8 graph_id;
+	u8 reserved[7];
+};
+
+struct ipu7_msg_graph_close {
+	struct ia_gofo_msg_header header;
+	u8 graph_id;
+	u8 graph_msg_map;
+	u8 reserved[6];
+};
+
+struct ipu7_msg_graph_close_ack {
+	struct ia_gofo_msg_header_ack header;
+	u8 graph_id;
+	u8 reserved[7];
+};
+
+enum ipu7_msg_err_graph {
+	IPU_MSG_ERR_GRAPH_OK = IA_GOFO_MSG_ERR_OK,
+	IPU_MSG_ERR_GRAPH_GRAPH_STATE = 1,
+	IPU_MSG_ERR_GRAPH_MAX_GRAPHS = 2,
+	IPU_MSG_ERR_GRAPH_GRAPH_ID = 3,
+	IPU_MSG_ERR_GRAPH_NODE_CTX_ID = 4,
+	IPU_MSG_ERR_GRAPH_NODE_RSRC_ID = 5,
+	IPU_MSG_ERR_GRAPH_PROFILE_IDX = 6,
+	IPU_MSG_ERR_GRAPH_TERM_ID = 7,
+	IPU_MSG_ERR_GRAPH_TERM_PAYLOAD_SIZE = 8,
+	IPU_MSG_ERR_GRAPH_LINK_NODE_CTX_ID = 9,
+	IPU_MSG_ERR_GRAPH_LINK_TERM_ID = 10,
+	IPU_MSG_ERR_GRAPH_PROFILE_TYPE = 11,
+	IPU_MSG_ERR_GRAPH_NUM_FRAGS = 12,
+	IPU_MSG_ERR_GRAPH_QUEUE_ID_USAGE = 13,
+	IPU_MSG_ERR_GRAPH_QUEUE_OPEN = 14,
+	IPU_MSG_ERR_GRAPH_QUEUE_CLOSE = 15,
+	IPU_MSG_ERR_GRAPH_QUEUE_ID_TASK_REQ_MISMATCH = 16,
+	IPU_MSG_ERR_GRAPH_CTX_MEMORY_FGRAPH = 17,
+	IPU_MSG_ERR_GRAPH_CTX_MEMORY_NODE = 18,
+	IPU_MSG_ERR_GRAPH_CTX_MEMORY_NODE_PROFILE = 19,
+	IPU_MSG_ERR_GRAPH_CTX_MEMORY_TERM = 20,
+	IPU_MSG_ERR_GRAPH_CTX_MEMORY_LINK = 21,
+	IPU_MSG_ERR_GRAPH_CTX_MSG_MAP = 22,
+	IPU_MSG_ERR_GRAPH_CTX_FOREIGN_KEY = 23,
+	IPU_MSG_ERR_GRAPH_CTX_STREAMING_MODE = 24,
+	IPU_MSG_ERR_GRAPH_CTX_PBK_RSRC = 25,
+	IPU_MSG_ERR_GRAPH_UNSUPPORTED_EVENT_TYPE = 26,
+	IPU_MSG_ERR_GRAPH_TOO_MANY_EVENTS = 27,
+	IPU_MSG_ERR_GRAPH_CTX_MEMORY_CMPRS = 28,
+	IPU_MSG_ERR_GRAPH_CTX_CMPRS_ALIGN_INTERVAL = 29,
+	IPU_MSG_ERR_GRAPH_CTX_CMPRS_PLANE_ID = 30,
+	IPU_MSG_ERR_GRAPH_CTX_CMPRS_UNSUPPORTED_MODE = 31,
+	IPU_MSG_ERR_GRAPH_CTX_CMPRS_BIT_DEPTH = 32,
+	IPU_MSG_ERR_GRAPH_CTX_CMPRS_STRIDE_ALIGNMENT = 33,
+	IPU_MSG_ERR_GRAPH_CTX_CMPRS_SUB_BUFFER_ALIGNMENT = 34,
+	IPU_MSG_ERR_GRAPH_CTX_CMPRS_LAYOUT_ORDER = 35,
+	IPU_MSG_ERR_GRAPH_CTX_CMPRS_LAYOUT_OVERLAP = 36,
+	IPU_MSG_ERR_GRAPH_CTX_CMPRS_BUFFER_TOO_SMALL = 37,
+	IPU_MSG_ERR_GRAPH_CTX_DELAYED_LINK = 38,
+	IPU_MSG_ERR_GRAPH_N
+};
+
+#pragma pack(pop)
+
+static inline void ipu7_msg_graph_test_func(void)
+{
+	CHECK_ALIGN64(struct ipu7_msg_graph_open);
+	CHECK_ALIGN64(struct ipu7_msg_graph_open_ack);
+	CHECK_ALIGN64(struct ipu7_msg_graph_close);
+	CHECK_ALIGN64(struct ipu7_msg_graph_close_ack);
+	CHECK_ALIGN32(struct ipu7_msg_graph_open_ack_task_q_info);
+}
+
+#define FWPS_MSG_ABI_MAX_INPUT_QUEUES	(60U)
+#define FWPS_MSG_ABI_MAX_OUTPUT_QUEUES	(2U)
+#define FWPS_MSG_ABI_MAX_QUEUES \
+	(FWPS_MSG_ABI_MAX_OUTPUT_QUEUES + FWPS_MSG_ABI_MAX_INPUT_QUEUES)
+
+#define FWPS_MSG_ABI_OUT_ACK_QUEUE_ID	(IA_GOFO_MSG_ABI_OUT_ACK_QUEUE_ID)
+#define FWPS_MSG_ABI_OUT_LOG_QUEUE_ID	(IA_GOFO_MSG_ABI_OUT_LOG_QUEUE_ID)
+#if (FWPS_MSG_ABI_OUT_LOG_QUEUE_ID >= FWPS_MSG_ABI_MAX_OUTPUT_QUEUES)
+#error "Maximum output queues configuration is too small to fit ACK and LOG \
+queues"
+#endif
+#define FWPS_MSG_ABI_IN_DEV_QUEUE_ID	(IA_GOFO_MSG_ABI_IN_DEV_QUEUE_ID)
+#define FWPS_MSG_ABI_IN_RESERVED_QUEUE_ID	(3U)
+#define FWPS_MSG_ABI_IN_FIRST_TASK_QUEUE_ID \
+	(FWPS_MSG_ABI_IN_RESERVED_QUEUE_ID + 1U)
+
+#if (FWPS_MSG_ABI_IN_FIRST_TASK_QUEUE_ID >= FWPS_MSG_ABI_MAX_INPUT_QUEUES)
+#error "Maximum queues configuration is too small to fit minimum number of \
+useful queues"
+#endif
+
+#define FWPS_MSG_ABI_IN_LAST_TASK_QUEUE_ID	(FWPS_MSG_ABI_MAX_QUEUES - 1U)
+#define FWPS_MSG_ABI_IN_MAX_TASK_QUEUES \
+	(FWPS_MSG_ABI_IN_LAST_TASK_QUEUE_ID - \
+	FWPS_MSG_ABI_IN_FIRST_TASK_QUEUE_ID + 1U)
+#define FWPS_MSG_ABI_OUT_FIRST_QUEUE_ID		(FWPS_MSG_ABI_OUT_ACK_QUEUE_ID)
+#define FWPS_MSG_ABI_OUT_LAST_QUEUE_ID	(FWPS_MSG_ABI_MAX_OUTPUT_QUEUES - 1U)
+#define FWPS_MSG_ABI_IN_FIRST_QUEUE_ID		(FWPS_MSG_ABI_IN_DEV_QUEUE_ID)
+#define FWPS_MSG_ABI_IN_LAST_QUEUE_ID	(FWPS_MSG_ABI_IN_LAST_TASK_QUEUE_ID)
+
+#define FWPS_MSG_HOST2FW_MAX_SIZE	(2U * 1024U)
+#define FWPS_MSG_FW2HOST_MAX_SIZE	(256U)
+
+#endif
diff --git a/drivers/media/pci/intel/ipu7/abi/ipu7_fw_psys_config_abi.h b/drivers/media/pci/intel/ipu7/abi/ipu7_fw_psys_config_abi.h
new file mode 100644
index 000000000000..550716013795
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/abi/ipu7_fw_psys_config_abi.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 - 2024 Intel Corporation
+ */
+
+#ifndef IPU7_PSYS_CONFIG_ABI_H_INCLUDED__
+#define IPU7_PSYS_CONFIG_ABI_H_INCLUDED__
+
+#include <linux/types.h>
+
+#include "ipu7_fw_boot_abi.h"
+#include "ipu7_fw_config_abi.h"
+
+struct ipu7_psys_config {
+	u32 use_debug_manifest;
+	u32 timeout_val_ms;
+	u32 compression_support_enabled;
+	struct ia_gofo_logger_config logger_config;
+	struct ipu7_wdt_abi wdt_config;
+};
+
+#endif
diff --git a/drivers/media/pci/intel/ipu7/abi/ipu7_fw_syscom_abi.h b/drivers/media/pci/intel/ipu7/abi/ipu7_fw_syscom_abi.h
new file mode 100644
index 000000000000..2dcc09294b34
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/abi/ipu7_fw_syscom_abi.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 - 2024 Intel Corporation
+ */
+
+#ifndef IPU7_FW_SYSCOM_ABI_H
+#define IPU7_FW_SYSCOM_ABI_H
+
+#include <linux/types.h>
+
+#include "ipu7_fw_common_abi.h"
+
+#pragma pack(push, 1)
+#define SYSCOM_QUEUE_MIN_CAPACITY	2U
+
+struct syscom_queue_params_config {
+	ia_gofo_addr_t token_array_mem;
+	u16 token_size_in_bytes;
+	u16 max_capacity;
+};
+
+struct syscom_config_s {
+	u16 max_output_queues;
+	u16 max_input_queues;
+};
+
+#pragma pack(pop)
+
+static inline struct syscom_queue_params_config *
+syscom_config_get_queue_configs(struct syscom_config_s *config)
+{
+	return (struct syscom_queue_params_config *)(&config[1]);
+}
+
+static inline const struct syscom_queue_params_config *
+syscom_config_get_queue_configs_const(const struct syscom_config_s *config)
+{
+	return (const struct syscom_queue_params_config *)(&config[1]);
+}
+
+static inline void syscom_abi_test_func(void)
+{
+	CHECK_ALIGN32(struct syscom_queue_params_config);
+	CHECK_ALIGN32(struct syscom_config_s);
+}
+
+#pragma pack(push, 1)
+struct syscom_queue_indices_s {
+	u32 read_index;
+	u32 write_index;
+};
+
+#pragma pack(pop)
+
+static inline void syscom_queue_abi_test_func(void)
+{
+	CHECK_ALIGN64(struct syscom_queue_indices_s);
+}
+
+#endif
-- 
2.34.1


