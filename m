Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44EB27647F9
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 09:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233234AbjG0HKY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 03:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233150AbjG0HJV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 03:09:21 -0400
Received: from mgamail.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A08F30FC
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 00:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690441508; x=1721977508;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6Ba/5lTrfoplhD1qmRcT6RezbJKDddWNzoCRZMbceMU=;
  b=M8ayVl1jjxzOtbetvDL5dmUCssVUgJDSMCektmua5dYEi0IJ27avfcKL
   7ImVrJty4XnKDsuJXu0poClmxc5eR1y/xrgSj8uMgfkjhMDVFlRUoPLmJ
   qatpEJNvdoZbLU5I4DkyOJSL+fOZOgK84wO3A4KfFr5hz5rBNg4mq7SmB
   3XKXoIkhAywPDS+hrk/CnnCkwWLosiOjFwP0Q2H5RrefhRa738jYMFfZV
   eZJUVQz4cAxVtwvxlA2ZQRN+KL5lHra0vSkDyIj52dpbTpDU64RGGZzib
   y0/kc7zZJHKB1Ll7uA8o9M25ycKqnEOcYEYhnRSoiTOxRuThq3b+PM/3L
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="370900702"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="370900702"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 00:03:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="704072494"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="704072494"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by orsmga006.jf.intel.com with ESMTP; 27 Jul 2023 00:03:49 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, bingbu.cao@linux.intel.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Subject: [PATCH 01/15] media: intel/ipu6: add Intel IPU6 PCI device driver
Date:   Thu, 27 Jul 2023 15:15:44 +0800
Message-Id: <20230727071558.1148653-2-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230727071558.1148653-1-bingbu.cao@intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

Intel Image Processing Unit 6th Gen includes input and processing systems
but the hardware presents itself as a single PCI device in system.

IPU6 PCI device driver basically does PCI configurations and load
the firmware binary, initialises IPU virtual bus, and sets up platform
specific variants to support multiple IPU6 devices in single device
driver.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 .../media/pci/intel/ipu6/ipu6-platform-regs.h | 177 ++++
 drivers/media/pci/intel/ipu6/ipu6-platform.h  |  31 +
 drivers/media/pci/intel/ipu6/ipu6.c           | 982 ++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6.h           | 347 +++++++
 4 files changed, 1537 insertions(+)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6.h

diff --git a/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h b/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
new file mode 100644
index 000000000000..85752914a562
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
@@ -0,0 +1,177 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2018 - 2023 Intel Corporation */
+
+#ifndef IPU6_PLATFORM_REGS_H
+#define IPU6_PLATFORM_REGS_H
+
+/*
+ * IPU6 uses uniform address within IPU6, therefore all subsystem registers
+ * locates in one single space starts from 0 but in different sctions with
+ * different addresses, the subsystem offsets are defined to 0 as the
+ * register definition will have the address offset to 0.
+ */
+#define IPU6_UNIFIED_OFFSET			0
+
+#define IPU6_ISYS_IOMMU0_OFFSET		0x2e0000
+#define IPU6_ISYS_IOMMU1_OFFSET		0x2e0500
+#define IPU6_ISYS_IOMMUI_OFFSET		0x2e0a00
+
+#define IPU6_PSYS_IOMMU0_OFFSET		0x1b0000
+#define IPU6_PSYS_IOMMU1_OFFSET		0x1b0700
+#define IPU6_PSYS_IOMMU1R_OFFSET	0x1b0e00
+#define IPU6_PSYS_IOMMUI_OFFSET		0x1b1500
+
+/* the offset from IOMMU base register */
+#define IPU6_MMU_L1_STREAM_ID_REG_OFFSET	0x0c
+#define IPU6_MMU_L2_STREAM_ID_REG_OFFSET	0x4c
+#define IPU6_PSYS_MMU1W_L2_STREAM_ID_REG_OFFSET	0x8c
+
+#define IPU6_MMU_INFO_OFFSET		0x8
+
+#define IPU6_ISYS_SPC_OFFSET		0x210000
+
+#define IPU6SE_PSYS_SPC_OFFSET		0x110000
+#define IPU6_PSYS_SPC_OFFSET		0x118000
+
+#define IPU6_ISYS_DMEM_OFFSET		0x200000
+#define IPU6_PSYS_DMEM_OFFSET		0x100000
+
+#define IPU6_REG_ISYS_UNISPART_IRQ_EDGE			0x27c000
+#define IPU6_REG_ISYS_UNISPART_IRQ_MASK			0x27c004
+#define IPU6_REG_ISYS_UNISPART_IRQ_STATUS		0x27c008
+#define IPU6_REG_ISYS_UNISPART_IRQ_CLEAR		0x27c00c
+#define IPU6_REG_ISYS_UNISPART_IRQ_ENABLE		0x27c010
+#define IPU6_REG_ISYS_UNISPART_IRQ_LEVEL_NOT_PULSE	0x27c014
+#define IPU6_REG_ISYS_UNISPART_SW_IRQ_REG		0x27c414
+#define IPU6_REG_ISYS_UNISPART_SW_IRQ_MUX_REG		0x27c418
+#define IPU6_ISYS_UNISPART_IRQ_CSI0			BIT(2)
+#define IPU6_ISYS_UNISPART_IRQ_CSI1			BIT(3)
+#define IPU6_ISYS_UNISPART_IRQ_SW			BIT(22)
+
+#define IPU6_REG_ISYS_ISL_TOP_IRQ_EDGE			0x2b0200
+#define IPU6_REG_ISYS_ISL_TOP_IRQ_MASK			0x2b0204
+#define IPU6_REG_ISYS_ISL_TOP_IRQ_STATUS		0x2b0208
+#define IPU6_REG_ISYS_ISL_TOP_IRQ_CLEAR			0x2b020c
+#define IPU6_REG_ISYS_ISL_TOP_IRQ_ENABLE		0x2b0210
+#define IPU6_REG_ISYS_ISL_TOP_IRQ_LEVEL_NOT_PULSE	0x2b0214
+
+#define IPU6_REG_ISYS_CMPR_TOP_IRQ_EDGE			0x2d2100
+#define IPU6_REG_ISYS_CMPR_TOP_IRQ_MASK			0x2d2104
+#define IPU6_REG_ISYS_CMPR_TOP_IRQ_STATUS		0x2d2108
+#define IPU6_REG_ISYS_CMPR_TOP_IRQ_CLEAR		0x2d210c
+#define IPU6_REG_ISYS_CMPR_TOP_IRQ_ENABLE		0x2d2110
+#define IPU6_REG_ISYS_CMPR_TOP_IRQ_LEVEL_NOT_PULSE	0x2d2114
+
+/* CDC Burst collector thresholds for isys - 3 FIFOs i = 0..2 */
+#define IPU6_REG_ISYS_CDC_THRESHOLD(i)		(0x27c400 + ((i) * 4))
+
+#define IPU6_CSI_IRQ_NUM_PER_PIPE			4
+#define IPU6SE_ISYS_CSI_PORT_NUM			4
+#define IPU6_ISYS_CSI_PORT_NUM				8
+
+#define IPU6_ISYS_CSI_PORT_IRQ(irq_num)		(1 << (irq_num))
+
+/* PKG DIR OFFSET in IMR in secure mode */
+#define IPU6_PKG_DIR_IMR_OFFSET			0x40
+
+#define IPU6_ISYS_REG_SPC_STATUS_CTRL		0x0
+
+#define IPU6_ISYS_SPC_STATUS_START			BIT(1)
+#define IPU6_ISYS_SPC_STATUS_RUN			BIT(3)
+#define IPU6_ISYS_SPC_STATUS_READY			BIT(5)
+#define IPU6_ISYS_SPC_STATUS_CTRL_ICACHE_INVALIDATE	BIT(12)
+#define IPU6_ISYS_SPC_STATUS_ICACHE_PREFETCH		BIT(13)
+
+#define IPU6_PSYS_REG_SPC_STATUS_CTRL			0x0
+#define IPU6_PSYS_REG_SPC_START_PC			0x4
+#define IPU6_PSYS_REG_SPC_ICACHE_BASE			0x10
+#define IPU6_REG_PSYS_INFO_SEG_0_CONFIG_ICACHE_MASTER	0x14
+
+#define IPU6_PSYS_SPC_STATUS_START			BIT(1)
+#define IPU6_PSYS_SPC_STATUS_RUN			BIT(3)
+#define IPU6_PSYS_SPC_STATUS_READY			BIT(5)
+#define IPU6_PSYS_SPC_STATUS_CTRL_ICACHE_INVALIDATE	BIT(12)
+#define IPU6_PSYS_SPC_STATUS_ICACHE_PREFETCH		BIT(13)
+
+#define IPU6_PSYS_REG_SPP0_STATUS_CTRL			0x20000
+
+#define IPU6_INFO_ENABLE_SNOOP			BIT(0)
+#define IPU6_INFO_DEC_FORCE_FLUSH		BIT(1)
+#define IPU6_INFO_DEC_PASS_THROUGH		BIT(2)
+#define IPU6_INFO_ZLW				BIT(3)
+#define IPU6_INFO_REQUEST_DESTINATION_IOSF	BIT(9)
+#define IPU6_INFO_IMR_BASE			BIT(10)
+#define IPU6_INFO_IMR_DESTINED			BIT(11)
+
+#define IPU6_INFO_REQUEST_DESTINATION_PRIMARY IPU6_INFO_REQUEST_DESTINATION_IOSF
+
+/*
+ * s2m_pixel_soc_pixel_remapping is dedicated for the enabling of the
+ * pixel s2m remp ability.Remap here  means that s2m rearange the order
+ * of the pixels in each 4 pixels group.
+ * For examle, mirroring remping means that if input's 4 first pixels
+ * are 1 2 3 4 then in output we should see 4 3 2 1 in this 4 first pixels.
+ * 0xE4 is from s2m MAS document. It means no remapping.
+ */
+#define S2M_PIXEL_SOC_PIXEL_REMAPPING_FLAG_NO_REMAPPING 0xE4
+/*
+ * csi_be_soc_pixel_remapping is for the enabling of the pixel remapping.
+ * This remapping is exactly like the stream2mmio remapping.
+ */
+#define CSI_BE_SOC_PIXEL_REMAPPING_FLAG_NO_REMAPPING    0xE4
+
+#define IPU6_REG_DMA_TOP_AB_GROUP1_BASE_ADDR		0x1ae000
+#define IPU6_REG_DMA_TOP_AB_GROUP2_BASE_ADDR		0x1af000
+#define IPU6_REG_DMA_TOP_AB_RING_MIN_OFFSET(n)		(0x4 + (n) * 0xc)
+#define IPU6_REG_DMA_TOP_AB_RING_MAX_OFFSET(n)		(0x8 + (n) * 0xc)
+#define IPU6_REG_DMA_TOP_AB_RING_ACCESS_OFFSET(n)	(0xc + (n) * 0xc)
+
+enum ipu6_device_ab_group1_target_id {
+	IPU6_DEVICE_AB_GROUP1_TARGET_ID_R0_SPC_DMEM,
+	IPU6_DEVICE_AB_GROUP1_TARGET_ID_R1_SPC_DMEM,
+	IPU6_DEVICE_AB_GROUP1_TARGET_ID_R2_SPC_DMEM,
+	IPU6_DEVICE_AB_GROUP1_TARGET_ID_R3_SPC_STATUS_REG,
+	IPU6_DEVICE_AB_GROUP1_TARGET_ID_R4_SPC_MASTER_BASE_ADDR,
+	IPU6_DEVICE_AB_GROUP1_TARGET_ID_R5_SPC_PC_STALL,
+	IPU6_DEVICE_AB_GROUP1_TARGET_ID_R6_SPC_EQ,
+	IPU6_DEVICE_AB_GROUP1_TARGET_ID_R7_SPC_RESERVED,
+	IPU6_DEVICE_AB_GROUP1_TARGET_ID_R8_SPC_RESERVED,
+	IPU6_DEVICE_AB_GROUP1_TARGET_ID_R9_SPP0,
+	IPU6_DEVICE_AB_GROUP1_TARGET_ID_R10_SPP1,
+	IPU6_DEVICE_AB_GROUP1_TARGET_ID_R11_CENTRAL_R1,
+	IPU6_DEVICE_AB_GROUP1_TARGET_ID_R12_IRQ,
+	IPU6_DEVICE_AB_GROUP1_TARGET_ID_R13_CENTRAL_R2,
+	IPU6_DEVICE_AB_GROUP1_TARGET_ID_R14_DMA,
+	IPU6_DEVICE_AB_GROUP1_TARGET_ID_R15_DMA,
+	IPU6_DEVICE_AB_GROUP1_TARGET_ID_R16_GP,
+	IPU6_DEVICE_AB_GROUP1_TARGET_ID_R17_ZLW_INSERTER,
+	IPU6_DEVICE_AB_GROUP1_TARGET_ID_R18_AB,
+};
+
+enum nci_ab_access_mode {
+	NCI_AB_ACCESS_MODE_RW,	/* read & write */
+	NCI_AB_ACCESS_MODE_RO,	/* read only */
+	NCI_AB_ACCESS_MODE_WO,	/* write only */
+	NCI_AB_ACCESS_MODE_NA	/* No access at all */
+};
+
+/* IRQ-related registers in PSYS */
+#define IPU6_REG_PSYS_GPDEV_IRQ_EDGE		0x1aa200
+#define IPU6_REG_PSYS_GPDEV_IRQ_MASK		0x1aa204
+#define IPU6_REG_PSYS_GPDEV_IRQ_STATUS		0x1aa208
+#define IPU6_REG_PSYS_GPDEV_IRQ_CLEAR		0x1aa20c
+#define IPU6_REG_PSYS_GPDEV_IRQ_ENABLE		0x1aa210
+#define IPU6_REG_PSYS_GPDEV_IRQ_LEVEL_NOT_PULSE	0x1aa214
+/* There are 8 FW interrupts, n = 0..7 */
+#define IPU6_PSYS_GPDEV_FWIRQ0			5
+#define IPU6_PSYS_GPDEV_FWIRQ1			6
+#define IPU6_PSYS_GPDEV_FWIRQ2			7
+#define IPU6_PSYS_GPDEV_FWIRQ3			8
+#define IPU6_PSYS_GPDEV_FWIRQ4			9
+#define IPU6_PSYS_GPDEV_FWIRQ5			10
+#define IPU6_PSYS_GPDEV_FWIRQ6			11
+#define IPU6_PSYS_GPDEV_FWIRQ7			12
+#define IPU6_PSYS_GPDEV_IRQ_FWIRQ(n)		(1 << (n))
+#define IPU6_REG_PSYS_GPDEV_FWIRQ(n)		(4 * (n) + 0x1aa100)
+
+#endif /* IPU6_PLATFORM_REGS_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu6-platform.h b/drivers/media/pci/intel/ipu6/ipu6-platform.h
new file mode 100644
index 000000000000..f730a6797a9c
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-platform.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2013 - 2023 Intel Corporation */
+
+#ifndef IPU6_PLATFORM_H
+#define IPU6_PLATFORM_H
+
+#include "ipu6-fw-isys.h"
+
+#define IPU6_NAME			"intel-ipu6"
+
+#define IPU6SE_FIRMWARE_NAME		"intel/ipu6se_fw.bin"
+#define IPU6EP_FIRMWARE_NAME		"intel/ipu6ep_fw.bin"
+#define IPU6_FIRMWARE_NAME		"intel/ipu6_fw.bin"
+#define IPU6EPMTL_FIRMWARE_NAME		"intel/ipu6epmtl_fw.bin"
+
+/*
+ * The following definitions are encoded to the media_device's model field so
+ * that the software components which uses IPU6 driver can get the hw stepping
+ * information.
+ */
+#define IPU6_MEDIA_DEV_MODEL_NAME		"ipu6"
+
+#define IPU6SE_ISYS_NUM_STREAMS          IPU6SE_NONSECURE_STREAM_ID_MAX
+#define IPU6_ISYS_NUM_STREAMS            IPU6_NONSECURE_STREAM_ID_MAX
+
+extern struct ipu6_isys_internal_pdata isys_ipdata;
+extern struct ipu6_psys_internal_pdata psys_ipdata;
+extern const struct ipu6_buttress_ctrl isys_buttress_ctrl;
+extern const struct ipu6_buttress_ctrl psys_buttress_ctrl;
+
+#endif
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
new file mode 100644
index 000000000000..7d5f465a9e71
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -0,0 +1,982 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2013 - 2023 Intel Corporation
+
+#include <linux/acpi.h>
+#include <linux/bitfield.h>
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/firmware.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pci.h>
+#include <linux/pm_qos.h>
+#include <linux/pm_runtime.h>
+#include <linux/timer.h>
+
+#include "ipu6.h"
+#include "ipu6-bus.h"
+#include "ipu6-buttress.h"
+#include "ipu6-cpd.h"
+#include "ipu6-isys.h"
+#include "ipu6-mmu.h"
+#include "ipu6-platform.h"
+#include "ipu6-platform-buttress-regs.h"
+#include "ipu6-platform-isys-csi2-reg.h"
+#include "ipu6-platform-regs.h"
+#include "../ipu-bridge.h"
+
+#define IPU6_PCI_BAR		0
+
+struct ipu6_cell_program_t {
+	u32 magic_number;
+
+	u32 blob_offset;
+	u32 blob_size;
+
+	u32 start[3];
+
+	u32 icache_source;
+	u32 icache_target;
+	u32 icache_size;
+
+	u32 pmem_source;
+	u32 pmem_target;
+	u32 pmem_size;
+
+	u32 data_source;
+	u32 data_target;
+	u32 data_size;
+
+	u32 bss_target;
+	u32 bss_size;
+
+	u32 cell_id;
+	u32 regs_addr;
+
+	u32 cell_pmem_data_bus_address;
+	u32 cell_dmem_data_bus_address;
+	u32 cell_pmem_control_bus_address;
+	u32 cell_dmem_control_bus_address;
+
+	u32 next;
+	u32 dummy[2];
+} __packed;
+
+static u32 ipu6se_csi_offsets[] = {
+	IPU6_CSI_PORT_A_ADDR_OFFSET,
+	IPU6_CSI_PORT_B_ADDR_OFFSET,
+	IPU6_CSI_PORT_C_ADDR_OFFSET,
+	IPU6_CSI_PORT_D_ADDR_OFFSET,
+};
+
+/*
+ * IPU6 on TGL support maximum 8 csi2 ports
+ * IPU6SE on JSL and IPU6EP on ADL support maximum 4 csi2 ports
+ * IPU6EP on MTL support maximum 6 csi2 ports
+ */
+static u32 ipu6_tgl_csi_offsets[] = {
+	IPU6_CSI_PORT_A_ADDR_OFFSET,
+	IPU6_CSI_PORT_B_ADDR_OFFSET,
+	IPU6_CSI_PORT_C_ADDR_OFFSET,
+	IPU6_CSI_PORT_D_ADDR_OFFSET,
+	IPU6_CSI_PORT_E_ADDR_OFFSET,
+	IPU6_CSI_PORT_F_ADDR_OFFSET,
+	IPU6_CSI_PORT_G_ADDR_OFFSET,
+	IPU6_CSI_PORT_H_ADDR_OFFSET
+};
+
+static u32 ipu6ep_mtl_csi_offsets[] = {
+	IPU6_CSI_PORT_A_ADDR_OFFSET,
+	IPU6_CSI_PORT_B_ADDR_OFFSET,
+	IPU6_CSI_PORT_C_ADDR_OFFSET,
+	IPU6_CSI_PORT_D_ADDR_OFFSET,
+	IPU6_CSI_PORT_E_ADDR_OFFSET,
+	IPU6_CSI_PORT_F_ADDR_OFFSET,
+};
+
+static u32 ipu6_csi_offsets[] = {
+	IPU6_CSI_PORT_A_ADDR_OFFSET,
+	IPU6_CSI_PORT_B_ADDR_OFFSET,
+	IPU6_CSI_PORT_C_ADDR_OFFSET,
+	IPU6_CSI_PORT_D_ADDR_OFFSET,
+};
+
+struct ipu6_isys_internal_pdata isys_ipdata = {
+	.hw_variant = {
+		.offset = IPU6_UNIFIED_OFFSET,
+		.nr_mmus = 3,
+		.mmu_hw = {
+			{
+				.offset = IPU6_ISYS_IOMMU0_OFFSET,
+				.info_bits = IPU6_INFO_REQUEST_DESTINATION_IOSF,
+				.nr_l1streams = 16,
+				.l1_block_sz = {
+					3, 8, 2, 2, 2, 2, 2, 2, 1, 1,
+					1, 1, 1, 1, 1, 1
+				},
+				.nr_l2streams = 16,
+				.l2_block_sz = {
+					2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
+					2, 2, 2, 2, 2, 2
+				},
+				.insert_read_before_invalidate = false,
+				.l1_stream_id_reg_offset =
+				IPU6_MMU_L1_STREAM_ID_REG_OFFSET,
+				.l2_stream_id_reg_offset =
+				IPU6_MMU_L2_STREAM_ID_REG_OFFSET,
+			},
+			{
+				.offset = IPU6_ISYS_IOMMU1_OFFSET,
+				.info_bits = 0,
+				.nr_l1streams = 16,
+				.l1_block_sz = {
+					2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
+					2, 2, 2, 1, 1, 4
+				},
+				.nr_l2streams = 16,
+				.l2_block_sz = {
+					2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
+					2, 2, 2, 2, 2, 2
+				},
+				.insert_read_before_invalidate = false,
+				.l1_stream_id_reg_offset =
+				IPU6_MMU_L1_STREAM_ID_REG_OFFSET,
+				.l2_stream_id_reg_offset =
+				IPU6_MMU_L2_STREAM_ID_REG_OFFSET,
+			},
+			{
+				.offset = IPU6_ISYS_IOMMUI_OFFSET,
+				.info_bits = 0,
+				.nr_l1streams = 0,
+				.nr_l2streams = 0,
+				.insert_read_before_invalidate = false,
+			},
+		},
+		.cdc_fifos = 3,
+		.cdc_fifo_threshold = {6, 8, 2},
+		.dmem_offset = IPU6_ISYS_DMEM_OFFSET,
+		.spc_offset = IPU6_ISYS_SPC_OFFSET,
+	},
+	.isys_dma_overshoot = IPU6_ISYS_OVERALLOC_MIN,
+};
+
+struct ipu6_psys_internal_pdata psys_ipdata = {
+	.hw_variant = {
+		.offset = IPU6_UNIFIED_OFFSET,
+		.nr_mmus = 4,
+		.mmu_hw = {
+			{
+				.offset = IPU6_PSYS_IOMMU0_OFFSET,
+				.info_bits =
+				IPU6_INFO_REQUEST_DESTINATION_IOSF,
+				.nr_l1streams = 16,
+				.l1_block_sz = {
+					2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
+					2, 2, 2, 2, 2, 2
+				},
+				.nr_l2streams = 16,
+				.l2_block_sz = {
+					2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
+					2, 2, 2, 2, 2, 2
+				},
+				.insert_read_before_invalidate = false,
+				.l1_stream_id_reg_offset =
+				IPU6_MMU_L1_STREAM_ID_REG_OFFSET,
+				.l2_stream_id_reg_offset =
+				IPU6_MMU_L2_STREAM_ID_REG_OFFSET,
+			},
+			{
+				.offset = IPU6_PSYS_IOMMU1_OFFSET,
+				.info_bits = 0,
+				.nr_l1streams = 32,
+				.l1_block_sz = {
+					1, 2, 2, 2, 2, 2, 2, 2, 2, 2,
+					2, 2, 2, 2, 2, 10,
+					5, 4, 14, 6, 4, 14, 6, 4, 8,
+					4, 2, 1, 1, 1, 1, 14
+				},
+				.nr_l2streams = 32,
+				.l2_block_sz = {
+					2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
+					2, 2, 2, 2, 2, 2,
+					2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
+					2, 2, 2, 2, 2, 2
+				},
+				.insert_read_before_invalidate = false,
+				.l1_stream_id_reg_offset =
+				IPU6_MMU_L1_STREAM_ID_REG_OFFSET,
+				.l2_stream_id_reg_offset =
+				IPU6_PSYS_MMU1W_L2_STREAM_ID_REG_OFFSET,
+			},
+			{
+				.offset = IPU6_PSYS_IOMMU1R_OFFSET,
+				.info_bits = 0,
+				.nr_l1streams = 16,
+				.l1_block_sz = {
+					1, 4, 4, 4, 4, 16, 8, 4, 32,
+					16, 16, 2, 2, 2, 1, 12
+				},
+				.nr_l2streams = 16,
+				.l2_block_sz = {
+					2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
+					2, 2, 2, 2, 2, 2
+				},
+				.insert_read_before_invalidate = false,
+				.l1_stream_id_reg_offset =
+				IPU6_MMU_L1_STREAM_ID_REG_OFFSET,
+				.l2_stream_id_reg_offset =
+				IPU6_MMU_L2_STREAM_ID_REG_OFFSET,
+			},
+			{
+				.offset = IPU6_PSYS_IOMMUI_OFFSET,
+				.info_bits = 0,
+				.nr_l1streams = 0,
+				.nr_l2streams = 0,
+				.insert_read_before_invalidate = false,
+			},
+		},
+		.dmem_offset = IPU6_PSYS_DMEM_OFFSET,
+	},
+};
+
+const struct ipu6_buttress_ctrl isys_buttress_ctrl = {
+	.ratio = IPU6_IS_FREQ_CTL_DEFAULT_RATIO,
+	.qos_floor = IPU6_IS_FREQ_CTL_DEFAULT_QOS_FLOOR_RATIO,
+	.freq_ctl = IPU6_BUTTRESS_REG_IS_FREQ_CTL,
+	.pwr_sts_shift = IPU6_BUTTRESS_PWR_STATE_IS_PWR_SHIFT,
+	.pwr_sts_mask = IPU6_BUTTRESS_PWR_STATE_IS_PWR_MASK,
+	.pwr_sts_on = IPU6_BUTTRESS_PWR_STATE_UP_DONE,
+	.pwr_sts_off = IPU6_BUTTRESS_PWR_STATE_DN_DONE,
+};
+
+const struct ipu6_buttress_ctrl psys_buttress_ctrl = {
+	.ratio = IPU6_PS_FREQ_CTL_DEFAULT_RATIO,
+	.qos_floor = IPU6_PS_FREQ_CTL_DEFAULT_QOS_FLOOR_RATIO,
+	.freq_ctl = IPU6_BUTTRESS_REG_PS_FREQ_CTL,
+	.pwr_sts_shift = IPU6_BUTTRESS_PWR_STATE_PS_PWR_SHIFT,
+	.pwr_sts_mask = IPU6_BUTTRESS_PWR_STATE_PS_PWR_MASK,
+	.pwr_sts_on = IPU6_BUTTRESS_PWR_STATE_UP_DONE,
+	.pwr_sts_off = IPU6_BUTTRESS_PWR_STATE_DN_DONE,
+};
+
+static void
+ipu6_pkg_dir_configure_spc(struct ipu6_device *isp,
+			   const struct ipu6_hw_variants *hw_variant,
+			   int pkg_dir_idx, void __iomem *base,
+			   u64 *pkg_dir, dma_addr_t pkg_dir_vied_address)
+{
+	u32 server_fw_addr;
+	struct ipu6_cell_program_t *prog;
+	void __iomem *spc_base;
+	dma_addr_t dma_addr;
+
+	server_fw_addr = lower_32_bits(*(pkg_dir + (pkg_dir_idx + 1) * 2));
+	if (pkg_dir_idx == IPU6_CPD_PKG_DIR_ISYS_SERVER_IDX)
+		dma_addr = sg_dma_address(isp->isys->fw_sgt.sgl);
+	else
+		dma_addr = sg_dma_address(isp->psys->fw_sgt.sgl);
+
+	prog = (struct ipu6_cell_program_t *)((u64)isp->cpd_fw->data +
+					      (server_fw_addr -
+					       dma_addr));
+	spc_base = base + prog->regs_addr;
+	if (spc_base != (base + hw_variant->spc_offset))
+		dev_warn(&isp->pdev->dev,
+			 "SPC reg addr %p not matching value from CPD %p\n",
+			 base + hw_variant->spc_offset, spc_base);
+	writel(server_fw_addr + prog->blob_offset +
+	       prog->icache_source, spc_base + IPU6_PSYS_REG_SPC_ICACHE_BASE);
+	writel(IPU6_INFO_REQUEST_DESTINATION_IOSF,
+	       spc_base + IPU6_REG_PSYS_INFO_SEG_0_CONFIG_ICACHE_MASTER);
+	writel(prog->start[1], spc_base + IPU6_PSYS_REG_SPC_START_PC);
+	writel(pkg_dir_vied_address, base + hw_variant->dmem_offset);
+}
+
+void ipu6_configure_spc(struct ipu6_device *isp,
+			const struct ipu6_hw_variants *hw_variant,
+			int pkg_dir_idx, void __iomem *base, u64 *pkg_dir,
+			dma_addr_t pkg_dir_dma_addr)
+{
+	void __iomem *dmem_base = base + hw_variant->dmem_offset;
+	void __iomem *spc_regs_base = base + hw_variant->spc_offset;
+	u32 val;
+
+	val = readl(spc_regs_base + IPU6_PSYS_REG_SPC_STATUS_CTRL);
+	val |= IPU6_PSYS_SPC_STATUS_CTRL_ICACHE_INVALIDATE;
+	writel(val, spc_regs_base + IPU6_PSYS_REG_SPC_STATUS_CTRL);
+
+	if (isp->secure_mode)
+		writel(IPU6_PKG_DIR_IMR_OFFSET, dmem_base);
+	else
+		ipu6_pkg_dir_configure_spc(isp, hw_variant, pkg_dir_idx, base,
+					   pkg_dir, pkg_dir_dma_addr);
+}
+EXPORT_SYMBOL_NS_GPL(ipu6_configure_spc, INTEL_IPU6);
+
+static void ipu6_internal_pdata_init(struct ipu6_device *isp)
+{
+	u8 hw_ver = isp->hw_ver;
+
+	isys_ipdata.num_parallel_streams = IPU6_ISYS_NUM_STREAMS;
+	isys_ipdata.sram_gran_shift = IPU6_SRAM_GRANULARITY_SHIFT;
+	isys_ipdata.sram_gran_size = IPU6_SRAM_GRANULARITY_SIZE;
+	isys_ipdata.max_sram_size = IPU6_MAX_SRAM_SIZE;
+	isys_ipdata.sensor_type_start = IPU6_FW_ISYS_SENSOR_TYPE_START;
+	isys_ipdata.sensor_type_end = IPU6_FW_ISYS_SENSOR_TYPE_END;
+	isys_ipdata.max_streams = IPU6_ISYS_NUM_STREAMS;
+	isys_ipdata.max_send_queues = IPU6_N_MAX_SEND_QUEUES;
+	isys_ipdata.max_sram_blocks = IPU6_NOF_SRAM_BLOCKS_MAX;
+	isys_ipdata.max_devq_size = IPU6_DEV_SEND_QUEUE_SIZE;
+	isys_ipdata.csi2.nports = ARRAY_SIZE(ipu6_csi_offsets);
+	isys_ipdata.csi2.offsets = ipu6_csi_offsets;
+	isys_ipdata.csi2.irq_mask = IPU6_CSI_RX_ERROR_IRQ_MASK;
+	isys_ipdata.csi2.ctrl0_irq_edge = IPU6_REG_ISYS_CSI_TOP_CTRL0_IRQ_EDGE;
+	isys_ipdata.csi2.ctrl0_irq_clear =
+		IPU6_REG_ISYS_CSI_TOP_CTRL0_IRQ_CLEAR;
+	isys_ipdata.csi2.ctrl0_irq_mask = IPU6_REG_ISYS_CSI_TOP_CTRL0_IRQ_MASK;
+	isys_ipdata.csi2.ctrl0_irq_enable =
+		IPU6_REG_ISYS_CSI_TOP_CTRL0_IRQ_ENABLE;
+	isys_ipdata.csi2.ctrl0_irq_status =
+		IPU6_REG_ISYS_CSI_TOP_CTRL0_IRQ_STATUS;
+	isys_ipdata.csi2.ctrl0_irq_lnp =
+		IPU6_REG_ISYS_CSI_TOP_CTRL0_IRQ_LEVEL_NOT_PULSE;
+	isys_ipdata.enhanced_iwake = is_ipu6ep_mtl(hw_ver) || is_ipu6ep(hw_ver);
+	psys_ipdata.hw_variant.spc_offset = IPU6_PSYS_SPC_OFFSET;
+	isys_ipdata.csi2.fw_access_port_ofs = CSI_REG_HUB_FW_ACCESS_PORT_OFS;
+
+	if (is_ipu6ep(hw_ver)) {
+		isys_ipdata.ltr = IPU6EP_LTR_VALUE;
+		isys_ipdata.memopen_threshold = IPU6EP_MIN_MEMOPEN_TH;
+	}
+
+	if (is_ipu6_tgl(hw_ver)) {
+		isys_ipdata.csi2.nports = ARRAY_SIZE(ipu6_tgl_csi_offsets);
+		isys_ipdata.csi2.offsets = ipu6_tgl_csi_offsets;
+	}
+
+	if (is_ipu6ep_mtl(hw_ver)) {
+		isys_ipdata.csi2.nports = ARRAY_SIZE(ipu6ep_mtl_csi_offsets);
+		isys_ipdata.csi2.offsets = ipu6ep_mtl_csi_offsets;
+
+		isys_ipdata.csi2.ctrl0_irq_edge =
+			IPU6V6_REG_ISYS_CSI_TOP_CTRL0_IRQ_EDGE;
+		isys_ipdata.csi2.ctrl0_irq_clear =
+			IPU6V6_REG_ISYS_CSI_TOP_CTRL0_IRQ_CLEAR;
+		isys_ipdata.csi2.ctrl0_irq_mask =
+			IPU6V6_REG_ISYS_CSI_TOP_CTRL0_IRQ_MASK;
+		isys_ipdata.csi2.ctrl0_irq_enable =
+			IPU6V6_REG_ISYS_CSI_TOP_CTRL0_IRQ_ENABLE;
+		isys_ipdata.csi2.ctrl0_irq_lnp =
+			IPU6V6_REG_ISYS_CSI_TOP_CTRL0_IRQ_LEVEL_NOT_PULSE;
+		isys_ipdata.csi2.ctrl0_irq_status =
+			IPU6V6_REG_ISYS_CSI_TOP_CTRL0_IRQ_STATUS;
+		isys_ipdata.csi2.fw_access_port_ofs =
+			CSI_REG_HUB_FW_ACCESS_PORT_V6OFS;
+		isys_ipdata.ltr = IPU6EP_MTL_LTR_VALUE;
+		isys_ipdata.memopen_threshold = IPU6EP_MTL_MIN_MEMOPEN_TH;
+	}
+
+	if (is_ipu6se(hw_ver)) {
+		isys_ipdata.csi2.nports = ARRAY_SIZE(ipu6se_csi_offsets);
+		isys_ipdata.csi2.irq_mask = IPU6SE_CSI_RX_ERROR_IRQ_MASK;
+		isys_ipdata.csi2.offsets = ipu6se_csi_offsets;
+		isys_ipdata.num_parallel_streams = IPU6SE_ISYS_NUM_STREAMS;
+		isys_ipdata.sram_gran_shift = IPU6SE_SRAM_GRANULARITY_SHIFT;
+		isys_ipdata.sram_gran_size = IPU6SE_SRAM_GRANULARITY_SIZE;
+		isys_ipdata.max_sram_size = IPU6SE_MAX_SRAM_SIZE;
+		isys_ipdata.sensor_type_start =
+			IPU6SE_FW_ISYS_SENSOR_TYPE_START;
+		isys_ipdata.sensor_type_end = IPU6SE_FW_ISYS_SENSOR_TYPE_END;
+		isys_ipdata.max_streams = IPU6SE_ISYS_NUM_STREAMS;
+		isys_ipdata.max_send_queues = IPU6SE_N_MAX_SEND_QUEUES;
+		isys_ipdata.max_sram_blocks = IPU6SE_NOF_SRAM_BLOCKS_MAX;
+		isys_ipdata.max_devq_size = IPU6SE_DEV_SEND_QUEUE_SIZE;
+		psys_ipdata.hw_variant.spc_offset = IPU6SE_PSYS_SPC_OFFSET;
+	}
+}
+
+static int ipu6_isys_check_fwnode_graph(struct fwnode_handle *fwnode)
+{
+	struct fwnode_handle *endpoint;
+
+	if (IS_ERR_OR_NULL(fwnode))
+		return -EINVAL;
+
+	endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
+	if (endpoint) {
+		fwnode_handle_put(endpoint);
+		return 0;
+	}
+
+	return ipu6_isys_check_fwnode_graph(fwnode->secondary);
+}
+
+static struct ipu6_bus_device *
+ipu6_isys_init(struct pci_dev *pdev, struct device *parent,
+	       struct ipu6_buttress_ctrl *ctrl, void __iomem *base,
+	       const struct ipu6_isys_internal_pdata *ipdata)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
+	struct ipu6_bus_device *isys_adev;
+	struct ipu6_isys_pdata *pdata;
+	int ret;
+
+	ret = ipu6_isys_check_fwnode_graph(fwnode);
+	if (ret) {
+		if (fwnode && !IS_ERR_OR_NULL(fwnode->secondary)) {
+			dev_err(&pdev->dev,
+				"fwnode graph has no endpoints connection\n");
+			return ERR_PTR(-EINVAL);
+		}
+
+		ret = ipu_bridge_init(pdev);
+		if (ret) {
+			dev_err_probe(&pdev->dev, ret,
+				      "IPU6 bridge init failed\n");
+			return ERR_PTR(ret);
+		}
+	}
+
+	pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	pdata->base = base;
+	pdata->ipdata = ipdata;
+
+	isys_adev = ipu6_bus_initialize_device(pdev, parent, pdata, ctrl,
+					       IPU6_ISYS_NAME);
+	if (IS_ERR(isys_adev)) {
+		dev_err_probe(&pdev->dev, PTR_ERR(isys_adev),
+			      "ipu6_bus_add_device(isys_adev) failed\n");
+		kfree(pdata);
+		return ERR_CAST(isys_adev);
+	}
+
+	isys_adev->mmu = ipu6_mmu_init(&pdev->dev, base, ISYS_MMID,
+				       &ipdata->hw_variant);
+	if (IS_ERR(isys_adev->mmu)) {
+		dev_err_probe(&pdev->dev, PTR_ERR(isys_adev),
+			      "ipu6_mmu_init(isys_adev->mmu) failed\n");
+		put_device(&isys_adev->auxdev.dev);
+		return ERR_CAST(isys_adev->mmu);
+	}
+
+	isys_adev->mmu->dev = &isys_adev->auxdev.dev;
+
+	ret = ipu6_bus_add_device(isys_adev);
+
+	return ret ? ERR_PTR(ret) : isys_adev;
+}
+
+static struct ipu6_bus_device *
+ipu6_psys_init(struct pci_dev *pdev, struct device *parent,
+	       struct ipu6_buttress_ctrl *ctrl, void __iomem *base,
+	       const struct ipu6_psys_internal_pdata *ipdata)
+{
+	struct ipu6_bus_device *psys_adev;
+	struct ipu6_psys_pdata *pdata;
+	int ret;
+
+	pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	pdata->base = base;
+	pdata->ipdata = ipdata;
+
+	psys_adev = ipu6_bus_initialize_device(pdev, parent, pdata, ctrl,
+					       IPU6_PSYS_NAME);
+	if (IS_ERR(psys_adev)) {
+		dev_err_probe(&pdev->dev, PTR_ERR(psys_adev),
+			      "ipu6_bus_add_device(psys_adev) failed\n");
+		kfree(pdata);
+		return ERR_CAST(psys_adev);
+	}
+
+	psys_adev->mmu = ipu6_mmu_init(&pdev->dev, base, PSYS_MMID,
+				       &ipdata->hw_variant);
+	if (IS_ERR(psys_adev->mmu)) {
+		dev_err_probe(&pdev->dev, PTR_ERR(psys_adev),
+			      "ipu6_mmu_init(psys_adev->mmu) failed\n");
+		put_device(&psys_adev->auxdev.dev);
+		return ERR_CAST(psys_adev->mmu);
+	}
+
+	psys_adev->mmu->dev = &psys_adev->auxdev.dev;
+
+	ret = ipu6_bus_add_device(psys_adev);
+
+	return ret ? ERR_PTR(ret) : psys_adev;
+}
+
+static int ipu6_pci_config_setup(struct pci_dev *dev, u8 hw_ver)
+{
+	u16 pci_command;
+	int ret;
+
+	pci_read_config_word(dev, PCI_COMMAND, &pci_command);
+	pci_command |= PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER;
+	pci_write_config_word(dev, PCI_COMMAND, pci_command);
+
+	/* No PCI msi capability for IPU6EP */
+	if (hw_ver == IPU6_VER_6EP || hw_ver == IPU6_VER_6EP_MTL) {
+		/* likely do nothing as msi not enabled by default */
+		pci_disable_msi(dev);
+		return 0;
+	}
+
+	ret = pci_enable_msi(dev);
+	if (ret)
+		dev_err(&dev->dev, "Failed to enable msi (%d)\n", ret);
+
+	return ret;
+}
+
+static void ipu6_configure_vc_mechanism(struct ipu6_device *isp)
+{
+	u32 val = readl(isp->base + BUTTRESS_REG_BTRS_CTRL);
+
+	if (IPU6_BTRS_ARB_STALL_MODE_VC0 == IPU6_BTRS_ARB_MODE_TYPE_STALL)
+		val |= BUTTRESS_REG_BTRS_CTRL_STALL_MODE_VC0;
+	else
+		val &= ~BUTTRESS_REG_BTRS_CTRL_STALL_MODE_VC0;
+
+	if (IPU6_BTRS_ARB_STALL_MODE_VC1 == IPU6_BTRS_ARB_MODE_TYPE_STALL)
+		val |= BUTTRESS_REG_BTRS_CTRL_STALL_MODE_VC1;
+	else
+		val &= ~BUTTRESS_REG_BTRS_CTRL_STALL_MODE_VC1;
+
+	writel(val, isp->base + BUTTRESS_REG_BTRS_CTRL);
+}
+
+static int request_cpd_fw(const struct firmware **firmware_p, const char *name,
+			  struct device *device)
+{
+	const struct firmware *fw;
+	struct firmware *dst;
+	int ret = 0;
+
+	ret = request_firmware(&fw, name, device);
+	if (ret)
+		return ret;
+
+	if (is_vmalloc_addr(fw->data)) {
+		*firmware_p = fw;
+		return 0;
+	}
+
+	dst = kzalloc(sizeof(*dst), GFP_KERNEL);
+	if (!dst) {
+		ret = -ENOMEM;
+		goto release_firmware;
+	}
+
+	dst->size = fw->size;
+	dst->data = vmalloc(fw->size);
+	if (!dst->data) {
+		kfree(dst);
+		ret = -ENOMEM;
+		goto release_firmware;
+	}
+
+	memcpy((void *)dst->data, fw->data, fw->size);
+	*firmware_p = dst;
+
+release_firmware:
+	release_firmware(fw);
+
+	return ret;
+}
+
+static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct ipu6_buttress_ctrl *isys_ctrl = NULL, *psys_ctrl = NULL;
+	void __iomem *isys_base = NULL;
+	void __iomem *psys_base = NULL;
+	struct ipu6_device *isp;
+	phys_addr_t phys;
+	void __iomem *const *iomap;
+	int ret;
+	u32 val, version, sku_id;
+
+	isp = devm_kzalloc(&pdev->dev, sizeof(*isp), GFP_KERNEL);
+	if (!isp)
+		return -ENOMEM;
+
+	isp->pdev = pdev;
+	INIT_LIST_HEAD(&isp->devices);
+
+	ret = pcim_enable_device(pdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to enable PCI device (%d)\n", ret);
+		return ret;
+	}
+
+	dev_info(&pdev->dev, "Device 0x%x (rev: 0x%x)\n",
+		 pdev->device, pdev->revision);
+
+	phys = pci_resource_start(pdev, IPU6_PCI_BAR);
+
+	ret = pcim_iomap_regions(pdev, 1 << IPU6_PCI_BAR, pci_name(pdev));
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to I/O mem remapping (%d)\n", ret);
+		return ret;
+	}
+	dev_dbg(&pdev->dev, "physical base address 0x%llx\n", phys);
+
+	iomap = pcim_iomap_table(pdev);
+	if (!iomap) {
+		dev_err(&pdev->dev, "Failed to iomap table (%d)\n", ret);
+		return -ENODEV;
+	}
+
+	isp->base = iomap[IPU6_PCI_BAR];
+
+	pci_set_drvdata(pdev, isp);
+	pci_set_master(pdev);
+
+	isp->cpd_metadata_cmpnt_size = sizeof(struct ipu6_cpd_metadata_cmpnt);
+	switch (id->device) {
+	case IPU6_PCI_ID:
+		isp->hw_ver = IPU6_VER_6;
+		isp->cpd_fw_name = IPU6_FIRMWARE_NAME;
+		break;
+	case IPU6SE_PCI_ID:
+		isp->hw_ver = IPU6_VER_6SE;
+		isp->cpd_fw_name = IPU6SE_FIRMWARE_NAME;
+		isp->cpd_metadata_cmpnt_size =
+			sizeof(struct ipu6se_cpd_metadata_cmpnt);
+		break;
+	case IPU6EP_ADL_P_PCI_ID:
+	case IPU6EP_ADL_N_PCI_ID:
+	case IPU6EP_RPL_P_PCI_ID:
+		isp->hw_ver = IPU6_VER_6EP;
+		isp->cpd_fw_name = IPU6EP_FIRMWARE_NAME;
+		break;
+	case IPU6EP_MTL_PCI_ID:
+		isp->hw_ver = IPU6_VER_6EP_MTL;
+		isp->cpd_fw_name = IPU6EPMTL_FIRMWARE_NAME;
+		break;
+	default:
+		dev_err(&pdev->dev, "Unsupported IPU6 device %x\n", id->device);
+		return -ENODEV;
+	}
+
+	ipu6_internal_pdata_init(isp);
+
+	isys_base = isp->base + isys_ipdata.hw_variant.offset;
+	psys_base = isp->base + psys_ipdata.hw_variant.offset;
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(39));
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to set DMA mask (%d)\n", ret);
+		return ret;
+	}
+
+	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
+
+	ret = ipu6_pci_config_setup(pdev, isp->hw_ver);
+	if (ret)
+		return ret;
+
+	ret = devm_request_threaded_irq(&pdev->dev, pdev->irq,
+					ipu6_buttress_isr,
+					ipu6_buttress_isr_threaded,
+					IRQF_SHARED, IPU6_NAME, isp);
+	if (ret) {
+		dev_err(&pdev->dev, "Requesting irq failed(%d)\n", ret);
+		return ret;
+	}
+
+	ret = ipu6_buttress_init(isp);
+	if (ret)
+		return ret;
+
+	dev_info(&pdev->dev, "cpd file name: %s\n", isp->cpd_fw_name);
+
+	ret = request_cpd_fw(&isp->cpd_fw, isp->cpd_fw_name, &pdev->dev);
+	if (ret) {
+		dev_err(&isp->pdev->dev, "Requesting signed firmware failed\n");
+		goto buttress_exit;
+	}
+
+	ret = ipu6_cpd_validate_cpd_file(isp, isp->cpd_fw->data,
+					 isp->cpd_fw->size);
+	if (ret) {
+		dev_err(&isp->pdev->dev, "Failed to validate cpd\n");
+		goto out_ipu6_bus_del_devices;
+	}
+
+	isys_ctrl = devm_kzalloc(&pdev->dev, sizeof(*isys_ctrl), GFP_KERNEL);
+	if (!isys_ctrl) {
+		ret = -ENOMEM;
+		goto out_ipu6_bus_del_devices;
+	}
+
+	memcpy(isys_ctrl, &isys_buttress_ctrl, sizeof(*isys_ctrl));
+
+	isp->isys = ipu6_isys_init(pdev, &pdev->dev, isys_ctrl, isys_base,
+				   &isys_ipdata);
+	if (IS_ERR(isp->isys)) {
+		ret = PTR_ERR(isp->isys);
+		goto out_ipu6_bus_del_devices;
+	}
+
+	psys_ctrl = devm_kzalloc(&pdev->dev, sizeof(*psys_ctrl), GFP_KERNEL);
+	if (!psys_ctrl) {
+		ret = -ENOMEM;
+		goto out_ipu6_bus_del_devices;
+	}
+
+	memcpy(psys_ctrl, &psys_buttress_ctrl, sizeof(*psys_ctrl));
+
+	isp->psys = ipu6_psys_init(pdev, &isp->isys->auxdev.dev, psys_ctrl,
+				   psys_base, &psys_ipdata);
+	if (IS_ERR(isp->psys)) {
+		ret = PTR_ERR(isp->psys);
+		goto out_ipu6_bus_del_devices;
+	}
+
+	ret = pm_runtime_get_sync(&isp->psys->auxdev.dev);
+	if (ret < 0) {
+		dev_err(&isp->psys->auxdev.dev, "Failed to get runtime PM\n");
+		goto out_ipu6_bus_del_devices;
+	}
+
+	ret = ipu6_mmu_hw_init(isp->psys->mmu);
+	if (ret) {
+		dev_err(&isp->pdev->dev, "Failed to set MMU hardware\n");
+		goto out_ipu6_bus_del_devices;
+	}
+
+	ret = ipu6_buttress_map_fw_image(isp->psys, isp->cpd_fw,
+					 &isp->psys->fw_sgt);
+	if (ret) {
+		dev_err(&isp->pdev->dev, "failed to map fw image\n");
+		goto out_ipu6_bus_del_devices;
+	}
+
+	ret = ipu6_cpd_create_pkg_dir(isp->psys, isp->cpd_fw->data);
+	if (ret) {
+		dev_err(&isp->pdev->dev, "failed to create pkg dir\n");
+		goto out_ipu6_bus_del_devices;
+	}
+
+	ret = ipu6_buttress_authenticate(isp);
+	if (ret) {
+		dev_err(&isp->pdev->dev, "FW authentication failed(%d)\n",
+			ret);
+		goto out_ipu6_bus_del_devices;
+	}
+
+	ipu6_mmu_hw_cleanup(isp->psys->mmu);
+	pm_runtime_put(&isp->psys->auxdev.dev);
+
+	/* Configure the arbitration mechanisms for VC requests */
+	ipu6_configure_vc_mechanism(isp);
+
+	val = readl(isp->base + BUTTRESS_REG_SKU);
+	sku_id = FIELD_GET(GENMASK(6, 4), val);
+	version = FIELD_GET(GENMASK(3, 0), val);
+	dev_info(&pdev->dev, "IPU%u-v%u hardware version %d\n", version, sku_id,
+		 isp->hw_ver);
+
+	pm_runtime_put_noidle(&pdev->dev);
+	pm_runtime_allow(&pdev->dev);
+
+	isp->bus_ready_to_probe = true;
+
+	return 0;
+
+out_ipu6_bus_del_devices:
+	if (isp->psys) {
+		ipu6_cpd_free_pkg_dir(isp->psys);
+		ipu6_buttress_unmap_fw_image(isp->psys, &isp->psys->fw_sgt);
+	}
+	if (!IS_ERR_OR_NULL(isp->psys) && !IS_ERR_OR_NULL(isp->psys->mmu))
+		ipu6_mmu_cleanup(isp->psys->mmu);
+	if (!IS_ERR_OR_NULL(isp->isys) && !IS_ERR_OR_NULL(isp->isys->mmu))
+		ipu6_mmu_cleanup(isp->isys->mmu);
+	if (!IS_ERR_OR_NULL(isp->psys))
+		pm_runtime_put(&isp->psys->auxdev.dev);
+	ipu6_bus_del_devices(pdev);
+	release_firmware(isp->cpd_fw);
+buttress_exit:
+	ipu6_buttress_exit(isp);
+
+	return ret;
+}
+
+static void ipu6_pci_remove(struct pci_dev *pdev)
+{
+	struct ipu6_device *isp = pci_get_drvdata(pdev);
+
+	ipu6_cpd_free_pkg_dir(isp->psys);
+
+	ipu6_buttress_unmap_fw_image(isp->psys, &isp->psys->fw_sgt);
+
+	ipu6_bus_del_devices(pdev);
+
+	pm_runtime_forbid(&pdev->dev);
+	pm_runtime_get_noresume(&pdev->dev);
+
+	pci_release_regions(pdev);
+	pci_disable_device(pdev);
+
+	ipu6_buttress_exit(isp);
+
+	release_firmware(isp->cpd_fw);
+
+	ipu6_mmu_cleanup(isp->psys->mmu);
+	ipu6_mmu_cleanup(isp->isys->mmu);
+}
+
+static void ipu6_pci_reset_prepare(struct pci_dev *pdev)
+{
+	struct ipu6_device *isp = pci_get_drvdata(pdev);
+
+	dev_warn(&pdev->dev, "FLR prepare\n");
+	pm_runtime_forbid(&isp->pdev->dev);
+}
+
+static void ipu6_pci_reset_done(struct pci_dev *pdev)
+{
+	struct ipu6_device *isp = pci_get_drvdata(pdev);
+
+	ipu6_buttress_restore(isp);
+	if (isp->secure_mode)
+		ipu6_buttress_reset_authentication(isp);
+
+	isp->need_ipc_reset = true;
+	pm_runtime_allow(&isp->pdev->dev);
+
+	dev_info(&pdev->dev, "IPU6 PCI FLR completed\n");
+}
+
+/*
+ * PCI base driver code requires driver to provide these to enable
+ * PCI device level PM state transitions (D0<->D3)
+ */
+static int ipu6_suspend(struct device *dev)
+{
+	return 0;
+}
+
+static int ipu6_resume(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct ipu6_device *isp = pci_get_drvdata(pdev);
+	struct ipu6_buttress *b = &isp->buttress;
+	int ret;
+
+	/* Configure the arbitration mechanisms for VC requests */
+	ipu6_configure_vc_mechanism(isp);
+
+	isp->secure_mode = ipu6_buttress_get_secure_mode(isp);
+	dev_info(dev, "IPU6 in %s mode\n",
+		 isp->secure_mode ? "secure" : "non-secure");
+
+	ipu6_buttress_restore(isp);
+
+	ret = ipu6_buttress_ipc_reset(isp, &b->cse);
+	if (ret)
+		dev_err(&isp->pdev->dev, "IPC reset protocol failed!\n");
+
+	ret = pm_runtime_resume_and_get(&isp->psys->auxdev.dev);
+	if (ret < 0) {
+		dev_err(&isp->psys->auxdev.dev, "Failed to get runtime PM\n");
+		return 0;
+	}
+
+	ret = ipu6_buttress_authenticate(isp);
+	if (ret)
+		dev_err(&isp->pdev->dev, "FW authentication failed(%d)\n", ret);
+
+	pm_runtime_put(&isp->psys->auxdev.dev);
+
+	return 0;
+}
+
+static int ipu6_runtime_resume(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct ipu6_device *isp = pci_get_drvdata(pdev);
+	int ret;
+
+	ipu6_configure_vc_mechanism(isp);
+	ipu6_buttress_restore(isp);
+
+	if (isp->need_ipc_reset) {
+		struct ipu6_buttress *b = &isp->buttress;
+
+		isp->need_ipc_reset = false;
+		ret = ipu6_buttress_ipc_reset(isp, &b->cse);
+		if (ret)
+			dev_err(&isp->pdev->dev, "IPC reset protocol failed\n");
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops ipu6_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(&ipu6_suspend, &ipu6_resume)
+	SET_RUNTIME_PM_OPS(&ipu6_suspend, &ipu6_runtime_resume, NULL)
+};
+
+static const struct pci_device_id ipu6_pci_tbl[] = {
+	{ PCI_VDEVICE(INTEL, IPU6_PCI_ID) },
+	{ PCI_VDEVICE(INTEL, IPU6SE_PCI_ID) },
+	{ PCI_VDEVICE(INTEL, IPU6EP_ADL_P_PCI_ID) },
+	{ PCI_VDEVICE(INTEL, IPU6EP_ADL_N_PCI_ID) },
+	{ PCI_VDEVICE(INTEL, IPU6EP_RPL_P_PCI_ID) },
+	{ PCI_VDEVICE(INTEL, IPU6EP_MTL_PCI_ID) },
+	{ }
+};
+MODULE_DEVICE_TABLE(pci, ipu6_pci_tbl);
+
+static const struct pci_error_handlers pci_err_handlers = {
+	.reset_prepare = ipu6_pci_reset_prepare,
+	.reset_done = ipu6_pci_reset_done,
+};
+
+static struct pci_driver ipu6_pci_driver = {
+	.name = IPU6_NAME,
+	.id_table = ipu6_pci_tbl,
+	.probe = ipu6_pci_probe,
+	.remove = ipu6_pci_remove,
+	.driver = {
+		.pm = &ipu6_pm_ops,
+	},
+	.err_handler = &pci_err_handlers,
+};
+
+static int __init ipu6_init(void)
+{
+	int ret;
+
+	ret = pci_register_driver(&ipu6_pci_driver);
+	if (ret)
+		pr_warn("can't register PCI driver (%d)\n", ret);
+
+	return ret;
+}
+
+static void __exit ipu6_exit(void)
+{
+	pci_unregister_driver(&ipu6_pci_driver);
+}
+
+module_init(ipu6_init);
+module_exit(ipu6_exit);
+
+MODULE_IMPORT_NS(INTEL_IPU_BRIDGE);
+MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
+MODULE_AUTHOR("Tianshu Qiu <tian.shu.qiu@intel.com>");
+MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
+MODULE_AUTHOR("Qingwu Zhang <qingwu.zhang@intel.com>");
+MODULE_AUTHOR("Yunliang Ding <yunliang.ding@intel.com>");
+MODULE_AUTHOR("Hongju Wang <hongju.wang@intel.com>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Intel IPU6 PCI driver");
diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
new file mode 100644
index 000000000000..8ce9f99925ad
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -0,0 +1,347 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2013 - 2023 Intel Corporation */
+
+#ifndef IPU6_H
+#define IPU6_H
+
+#include <linux/firmware.h>
+#include <linux/ioport.h>
+#include <linux/list.h>
+#include <linux/pci.h>
+
+#include "ipu6-buttress.h"
+
+#define IPU6_PCI_ID	0x9a19
+#define IPU6SE_PCI_ID	0x4e19
+#define IPU6EP_ADL_P_PCI_ID	0x465d
+#define IPU6EP_ADL_N_PCI_ID	0x462e
+#define IPU6EP_RPL_P_PCI_ID	0xa75d
+#define IPU6EP_MTL_PCI_ID	0x7d19
+
+enum ipu6_version {
+	IPU6_VER_INVALID = 0,
+	IPU6_VER_6 = 1,
+	IPU6_VER_6SE = 3,
+	IPU6_VER_6EP = 5,
+	IPU6_VER_6EP_MTL = 6,
+};
+
+/*
+ * IPU6 - TGL
+ * IPU6SE - JSL
+ * IPU6EP - ADL/RPL
+ * IPU6EP_MTL - MTL
+ */
+static inline bool is_ipu6se(u8 hw_ver)
+{
+	return hw_ver == IPU6_VER_6SE;
+}
+
+static inline bool is_ipu6ep(u8 hw_ver)
+{
+	return hw_ver == IPU6_VER_6EP;
+}
+
+static inline bool is_ipu6ep_mtl(u8 hw_ver)
+{
+	return hw_ver == IPU6_VER_6EP_MTL;
+}
+
+static inline bool is_ipu6_tgl(u8 hw_ver)
+{
+	return hw_ver == IPU6_VER_6;
+}
+
+/*
+ * ISYS DMA can overshoot. For higher resolutions over allocation is one line
+ * but it must be at minimum 1024 bytes. Value could be different in
+ * different versions / generations thus provide it via platform data.
+ */
+#define IPU6_ISYS_OVERALLOC_MIN		1024
+
+/* Physical pages in GDA is 128, page size is 2K for IPU6, 1K for others */
+#define IPU6_DEVICE_GDA_NR_PAGES		128
+
+/* Virtualization factor to calculate the available virtual pages */
+#define IPU6_DEVICE_GDA_VIRT_FACTOR	32
+
+#define NR_OF_MMU_RESOURCES			2
+
+struct ipu6_device {
+	struct pci_dev *pdev;
+	struct list_head devices;
+	struct ipu6_bus_device *isys;
+	struct ipu6_bus_device *psys;
+	struct ipu6_buttress buttress;
+
+	const struct firmware *cpd_fw;
+	const char *cpd_fw_name;
+	u32 cpd_metadata_cmpnt_size;
+
+	void __iomem *base;
+	struct ipu6_trace *trace;
+	bool need_ipc_reset;
+	bool secure_mode;
+	u8 hw_ver;
+	bool bus_ready_to_probe;
+};
+
+#define IPU6_FW_CALL_TIMEOUT_MS		2000
+
+#define IPU6_ISYS_NAME "isys"
+#define IPU6_PSYS_NAME "psys"
+
+#define IPU6_MMU_MAX_DEVICES		4
+#define IPU6_MMU_ADDR_BITS		32
+/* The firmware is accessible within the first 2 GiB only in non-secure mode. */
+#define IPU6_MMU_ADDR_BITS_NON_SECURE	31
+
+#define IPU6_MMU_MAX_TLB_L1_STREAMS	32
+#define IPU6_MMU_MAX_TLB_L2_STREAMS	32
+#define IPU6_MAX_LI_BLOCK_ADDR		128
+#define IPU6_MAX_L2_BLOCK_ADDR		64
+
+#define IPU6_ISYS_MAX_CSI2_LEGACY_PORTS	4
+#define IPU6_ISYS_MAX_CSI2_COMBO_PORTS	2
+
+#define IPU6_MAX_FRAME_COUNTER	0xff
+
+/*
+ * To maximize the IOSF utlization, IPU6 need to send requests in bursts.
+ * At the DMA interface with the buttress, there are CDC FIFOs with burst
+ * collection capability. CDC FIFO burst collectors have a configurable
+ * threshold and is configured based on the outcome of performance measurements.
+ *
+ * isys has 3 ports with IOSF interface for VC0, VC1 and VC2
+ * psys has 4 ports with IOSF interface for VC0, VC1w, VC1r and VC2
+ *
+ * Threshold values are pre-defined and are arrived at after performance
+ * evaluations on a type of IPU6
+ */
+#define IPU6_MAX_VC_IOSF_PORTS		4
+
+/*
+ * IPU6 must configure correct arbitration mechanism related to the IOSF VC
+ * requests. There are two options per VC0 and VC1 - > 0 means rearbitrate on
+ * stall and 1 means stall until the request is completed.
+ */
+#define IPU6_BTRS_ARB_MODE_TYPE_REARB	0
+#define IPU6_BTRS_ARB_MODE_TYPE_STALL	1
+
+/* Currently chosen arbitration mechanism for VC0 */
+#define IPU6_BTRS_ARB_STALL_MODE_VC0	\
+			IPU6_BTRS_ARB_MODE_TYPE_REARB
+
+/* Currently chosen arbitration mechanism for VC1 */
+#define IPU6_BTRS_ARB_STALL_MODE_VC1	\
+			IPU6_BTRS_ARB_MODE_TYPE_REARB
+
+/*
+ * MMU Invalidation HW bug workaround by ZLW mechanism
+ *
+ * Old IPU6 MMUV2 has a bug in the invalidation mechanism which might result in
+ * wrong translation or replication of the translation. This will cause data
+ * corruption. So we cannot directly use the MMU V2 invalidation registers
+ * to invalidate the MMU. Instead, whenever an invalidate is called, we need to
+ * clear the TLB by evicting all the valid translations by filling it with trash
+ * buffer (which is guaranteed not to be used by any other processes). ZLW is
+ * used to fill the L1 and L2 caches with the trash buffer translations. ZLW
+ * or Zero length write, is pre-fetch mechanism to pre-fetch the pages in
+ * advance to the L1 and L2 caches without triggering any memory operations.
+ *
+ * In MMU V2, L1 -> 16 streams and 64 blocks, maximum 16 blocks per stream
+ * One L1 block has 16 entries, hence points to 16 * 4K pages
+ * L2 -> 16 streams and 32 blocks. 2 blocks per streams
+ * One L2 block maps to 1024 L1 entries, hence points to 4MB address range
+ * 2 blocks per L2 stream means, 1 stream points to 8MB range
+ *
+ * As we need to clear the caches and 8MB being the biggest cache size, we need
+ * to have trash buffer which points to 8MB address range. As these trash
+ * buffers are not used for any memory transactions, we need only the least
+ * amount of physical memory. So we reserve 8MB IOVA address range but only
+ * one page is reserved from physical memory. Each of this 8MB IOVA address
+ * range is then mapped to the same physical memory page.
+ */
+/* One L2 entry maps 1024 L1 entries and one L1 entry per page */
+#define IPU6_MMUV2_L2_RANGE		(1024 * PAGE_SIZE)
+/* Max L2 blocks per stream */
+#define IPU6_MMUV2_MAX_L2_BLOCKS		2
+/* Max L1 blocks per stream */
+#define IPU6_MMUV2_MAX_L1_BLOCKS		16
+#define IPU6_MMUV2_TRASH_RANGE		(IPU6_MMUV2_L2_RANGE * \
+						 IPU6_MMUV2_MAX_L2_BLOCKS)
+/* Entries per L1 block */
+#define MMUV2_ENTRIES_PER_L1_BLOCK		16
+#define MMUV2_TRASH_L1_BLOCK_OFFSET		(MMUV2_ENTRIES_PER_L1_BLOCK * \
+						 PAGE_SIZE)
+#define MMUV2_TRASH_L2_BLOCK_OFFSET		IPU6_MMUV2_L2_RANGE
+
+/*
+ * In some of the IPU6 MMUs, there is provision to configure L1 and L2 page
+ * table caches. Both these L1 and L2 caches are divided into multiple sections
+ * called streams. There is maximum 16 streams for both caches. Each of these
+ * sections are subdivided into multiple blocks. When nr_l1streams = 0 and
+ * nr_l2streams = 0, means the MMU is of type MMU_V1 and do not support
+ * L1/L2 page table caches.
+ *
+ * L1 stream per block sizes are configurable and varies per usecase.
+ * L2 has constant block sizes - 2 blocks per stream.
+ *
+ * MMU1 support pre-fetching of the pages to have less cache lookup misses. To
+ * enable the pre-fetching, MMU1 AT (Address Translator) device registers
+ * need to be configured.
+ *
+ * There are four types of memory accesses which requires ZLW configuration.
+ * ZLW(Zero Length Write) is a mechanism to enable VT-d pre-fetching on IOMMU.
+ *
+ * 1. Sequential Access or 1D mode
+ *	Set ZLW_EN -> 1
+ *	set ZLW_PAGE_CROSS_1D -> 1
+ *	Set ZLW_N to "N" pages so that ZLW will be inserte N pages ahead where
+ *		  N is pre-defined and hardcoded in the platform data
+ *	Set ZLW_2D -> 0
+ *
+ * 2. ZLW 2D mode
+ *	Set ZLW_EN -> 1
+ *	set ZLW_PAGE_CROSS_1D -> 1,
+ *	Set ZLW_N -> 0
+ *	Set ZLW_2D -> 1
+ *
+ * 3. ZLW Enable (no 1D or 2D mode)
+ *	Set ZLW_EN -> 1
+ *	set ZLW_PAGE_CROSS_1D -> 0,
+ *	Set ZLW_N -> 0
+ *	Set ZLW_2D -> 0
+ *
+ * 4. ZLW disable
+ *	Set ZLW_EN -> 0
+ *	set ZLW_PAGE_CROSS_1D -> 0,
+ *	Set ZLW_N -> 0
+ *	Set ZLW_2D -> 0
+ *
+ * To configure the ZLW for the above memory access, four registers are
+ * available. Hence to track these four settings, we have the following entries
+ * in the struct ipu6_mmu_hw. Each of these entries are per stream and
+ * available only for the L1 streams.
+ *
+ * a. l1_zlw_en -> To track zlw enabled per stream (ZLW_EN)
+ * b. l1_zlw_1d_mode -> Track 1D mode per stream. ZLW inserted at page boundary
+ * c. l1_ins_zlw_ahead_pages -> to track how advance the ZLW need to be inserted
+ *			Insert ZLW request N pages ahead address.
+ * d. l1_zlw_2d_mode -> To track 2D mode per stream (ZLW_2D)
+ *
+ *
+ * Currently L1/L2 streams, blocks, AT ZLW configurations etc. are pre-defined
+ * as per the usecase specific calculations. Any change to this pre-defined
+ * table has to happen in sync with IPU6 FW.
+ */
+struct ipu6_mmu_hw {
+	union {
+		unsigned long offset;
+		void __iomem *base;
+	};
+	u32 info_bits;
+	u8 nr_l1streams;
+	/*
+	 * L1 has variable blocks per stream - total of 64 blocks and maximum of
+	 * 16 blocks per stream. Configurable by using the block start address
+	 * per stream. Block start address is calculated from the block size
+	 */
+	u8 l1_block_sz[IPU6_MMU_MAX_TLB_L1_STREAMS];
+	/* Is ZLW is enabled in each stream */
+	bool l1_zlw_en[IPU6_MMU_MAX_TLB_L1_STREAMS];
+	bool l1_zlw_1d_mode[IPU6_MMU_MAX_TLB_L1_STREAMS];
+	u8 l1_ins_zlw_ahead_pages[IPU6_MMU_MAX_TLB_L1_STREAMS];
+	bool l1_zlw_2d_mode[IPU6_MMU_MAX_TLB_L1_STREAMS];
+
+	u32 l1_stream_id_reg_offset;
+	u32 l2_stream_id_reg_offset;
+
+	u8 nr_l2streams;
+	/*
+	 * L2 has fixed 2 blocks per stream. Block address is calculated
+	 * from the block size
+	 */
+	u8 l2_block_sz[IPU6_MMU_MAX_TLB_L2_STREAMS];
+	/* flag to track if WA is needed for successive invalidate HW bug */
+	bool insert_read_before_invalidate;
+};
+
+struct ipu6_mmu_pdata {
+	u32 nr_mmus;
+	struct ipu6_mmu_hw mmu_hw[IPU6_MMU_MAX_DEVICES];
+	int mmid;
+};
+
+struct ipu6_isys_csi2_pdata {
+	void __iomem *base;
+};
+
+struct ipu6_isys_internal_csi2_pdata {
+	u32 nports;
+	u32 irq_mask;
+	u32 *offsets;
+	u32 ctrl0_irq_edge;
+	u32 ctrl0_irq_clear;
+	u32 ctrl0_irq_mask;
+	u32 ctrl0_irq_enable;
+	u32 ctrl0_irq_lnp;
+	u32 ctrl0_irq_status;
+	u32 fw_access_port_ofs;
+};
+
+struct ipu6_isys_internal_tpg_pdata {
+	u32 ntpgs;
+	u32 *offsets;
+	u32 *sels;
+};
+
+struct ipu6_hw_variants {
+	unsigned long offset;
+	u32 nr_mmus;
+	struct ipu6_mmu_hw mmu_hw[IPU6_MMU_MAX_DEVICES];
+	u8 cdc_fifos;
+	u8 cdc_fifo_threshold[IPU6_MAX_VC_IOSF_PORTS];
+	u32 dmem_offset;
+	u32 spc_offset;
+};
+
+struct ipu6_isys_internal_pdata {
+	struct ipu6_isys_internal_csi2_pdata csi2;
+	struct ipu6_hw_variants hw_variant;
+	u32 num_parallel_streams;
+	u32 isys_dma_overshoot;
+	u32 sram_gran_shift;
+	u32 sram_gran_size;
+	u32 max_sram_size;
+	u32 max_streams;
+	u32 max_send_queues;
+	u32 max_sram_blocks;
+	u32 max_devq_size;
+	u32 sensor_type_start;
+	u32 sensor_type_end;
+	u32 ltr;
+	u32 memopen_threshold;
+	bool enhanced_iwake;
+};
+
+struct ipu6_isys_pdata {
+	void __iomem *base;
+	const struct ipu6_isys_internal_pdata *ipdata;
+};
+
+struct ipu6_psys_internal_pdata {
+	struct ipu6_hw_variants hw_variant;
+};
+
+struct ipu6_psys_pdata {
+	void __iomem *base;
+	const struct ipu6_psys_internal_pdata *ipdata;
+};
+
+int ipu6_fw_authenticate(void *data, u64 val);
+void ipu6_configure_spc(struct ipu6_device *isp,
+			const struct ipu6_hw_variants *hw_variant,
+			int pkg_dir_idx, void __iomem *base, u64 *pkg_dir,
+			dma_addr_t pkg_dir_dma_addr);
+#endif /* IPU6_H */
-- 
2.40.1

