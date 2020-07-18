Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76DB5224A4A
	for <lists+linux-media@lfdr.de>; Sat, 18 Jul 2020 11:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbgGRJ2b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jul 2020 05:28:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:43096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726262AbgGRJ2a (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jul 2020 05:28:30 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 51D892070E;
        Sat, 18 Jul 2020 09:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595064507;
        bh=icNLG43iaS2YjnSyoe4b7iGajMbLwJRnNzCVqiteJCE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GwHHad9zxFCYI6/iPfe3epQMbvG5jVLA3Gj9sOTe3mrOxZWs/jBgXmcnwBAtPeAun
         uzsnzWX9+R34Y1IM1VVessVDlJs9s+D10wjKuFhqmJywpJNQwzCyOU9u2mvKvkr2tY
         Guj9z7x/R8yMMf1rcyCoA/E6kzAyfaFg5jFAHOHw=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1jwj8r-005wDY-A2; Sat, 18 Jul 2020 11:28:25 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] media: atomisp: move global stuff into a common header
Date:   Sat, 18 Jul 2020 11:28:21 +0200
Message-Id: <b30258ce61cde8267ee78e420ed974fc5847b395.1595062851.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <22a1ad531d3b2030fe0b0ffae9d883b0d5cc0406.1595062851.git.mchehab+huawei@kernel.org>
References: <22a1ad531d3b2030fe0b0ffae9d883b0d5cc0406.1595062851.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Right now, there are two versions of system_global.h headers.

Both share a lot of common code. There are some ISP2401 specific
types on one of the headers, but it doesn't conflict with the
ISP2400 ones.

Also, the common code is identical.

So, remove code duplication by moving such code into a
common header.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/atomisp/pci/isp2400_system_global.h | 300 -------------
 .../media/atomisp/pci/isp2400_system_local.h  |   3 -
 .../media/atomisp/pci/isp2401_system_global.h | 406 +-----------------
 .../media/atomisp/pci/isp2401_system_local.h  |   3 -
 drivers/staging/media/atomisp/pci/sh_css.c    |   9 +-
 .../staging/media/atomisp/pci/system_global.h | 395 +++++++++++++++++
 .../staging/media/atomisp/pci/system_local.h  |   1 -
 7 files changed, 403 insertions(+), 714 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp2400_system_global.h b/drivers/staging/media/atomisp/pci/isp2400_system_global.h
index 3888793a31e2..74fff465e8e8 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_system_global.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_system_global.h
@@ -13,304 +13,4 @@
  * more details.
  */
 
-#ifndef __SYSTEM_GLOBAL_H_INCLUDED__
-#define __SYSTEM_GLOBAL_H_INCLUDED__
-
-#include <hive_isp_css_defs.h>
-#include <type_support.h>
-
-/*
- * The longest allowed (uninteruptible) bus transfer, does not
- * take stalling into account
- */
-#define HIVE_ISP_MAX_BURST_LENGTH	1024
-
-/*
- * Maximum allowed burst length in words for the ISP DMA
- */
-#define ISP_DMA_MAX_BURST_LENGTH	128
-
-/*
- * Create a list of HAS and IS properties that defines the system
- *
- * The configuration assumes the following
- * - The system is hetereogeneous; Multiple cells and devices classes
- * - The cell and device instances are homogeneous, each device type
- *   belongs to the same class
- * - Device instances supporting a subset of the class capabilities are
- *   allowed
- *
- * We could manage different device classes through the enumerated
- * lists (C) or the use of classes (C++), but that is presently not
- * fully supported
- *
- * N.B. the 3 input formatters are of 2 different classess
- */
-
 #define USE_INPUT_SYSTEM_VERSION_2
-
-#define HAS_MMU_VERSION_2
-#define HAS_DMA_VERSION_2
-#define HAS_GDC_VERSION_2
-#define HAS_VAMEM_VERSION_2
-#define HAS_HMEM_VERSION_1
-#define HAS_BAMEM_VERSION_2
-#define HAS_IRQ_VERSION_2
-#define HAS_IRQ_MAP_VERSION_2
-#define HAS_INPUT_FORMATTER_VERSION_2
-/* 2401: HAS_INPUT_SYSTEM_VERSION_2401 */
-#define HAS_INPUT_SYSTEM_VERSION_2
-#define HAS_BUFFERED_SENSOR
-#define HAS_FIFO_MONITORS_VERSION_2
-/* #define HAS_GP_REGS_VERSION_2 */
-#define HAS_GP_DEVICE_VERSION_2
-#define HAS_GPIO_VERSION_1
-#define HAS_TIMED_CTRL_VERSION_1
-#define HAS_RX_VERSION_2
-
-#define DMA_DDR_TO_VAMEM_WORKAROUND
-#define DMA_DDR_TO_HMEM_WORKAROUND
-
-/*
- * Semi global. "HRT" is accessible from SP, but the HRT types do not fully apply
- */
-#define HRT_VADDRESS_WIDTH	32
-
-#define SIZEOF_HRT_REG		(HRT_DATA_WIDTH >> 3)
-#define HIVE_ISP_CTRL_DATA_BYTES (HIVE_ISP_CTRL_DATA_WIDTH / 8)
-
-/* The main bus connecting all devices */
-#define HRT_BUS_WIDTH		HIVE_ISP_CTRL_DATA_WIDTH
-#define HRT_BUS_BYTES		HIVE_ISP_CTRL_DATA_BYTES
-
-/* per-frame parameter handling support */
-#define SH_CSS_ENABLE_PER_FRAME_PARAMS
-
-typedef u32			hrt_bus_align_t;
-
-/*
- * Enumerate the devices, device access through the API is by ID, through the DLI by address
- * The enumerator terminators are used to size the wiring arrays and as an exception value.
- */
-typedef enum {
-	DDR0_ID = 0,
-	N_DDR_ID
-} ddr_ID_t;
-
-typedef enum {
-	ISP0_ID = 0,
-	N_ISP_ID
-} isp_ID_t;
-
-typedef enum {
-	SP0_ID = 0,
-	N_SP_ID
-} sp_ID_t;
-
-typedef enum {
-	MMU0_ID = 0,
-	MMU1_ID,
-	N_MMU_ID
-} mmu_ID_t;
-
-typedef enum {
-	DMA0_ID = 0,
-	N_DMA_ID
-} dma_ID_t;
-
-typedef enum {
-	GDC0_ID = 0,
-	GDC1_ID,
-	N_GDC_ID
-} gdc_ID_t;
-
-#define N_GDC_ID_CPP 2 // this extra define is needed because we want to use it also in the preprocessor, and that doesn't work with enums.
-
-typedef enum {
-	VAMEM0_ID = 0,
-	VAMEM1_ID,
-	VAMEM2_ID,
-	N_VAMEM_ID
-} vamem_ID_t;
-
-typedef enum {
-	BAMEM0_ID = 0,
-	N_BAMEM_ID
-} bamem_ID_t;
-
-typedef enum {
-	HMEM0_ID = 0,
-	N_HMEM_ID
-} hmem_ID_t;
-
-/*
-typedef enum {
-	IRQ0_ID = 0,
-	N_IRQ_ID
-} irq_ID_t;
-*/
-
-typedef enum {
-	IRQ0_ID = 0,	// GP IRQ block
-	IRQ1_ID,		// Input formatter
-	IRQ2_ID,		// input system
-	IRQ3_ID,		// input selector
-	N_IRQ_ID
-} irq_ID_t;
-
-typedef enum {
-	FIFO_MONITOR0_ID = 0,
-	N_FIFO_MONITOR_ID
-} fifo_monitor_ID_t;
-
-/*
- * Deprecated: Since all gp_reg instances are different
- * and put in the address maps of other devices we cannot
- * enumerate them as that assumes the instrances are the
- * same.
- *
- * We define a single GP_DEVICE containing all gp_regs
- * w.r.t. a single base address
- *
-typedef enum {
-	GP_REGS0_ID = 0,
-	N_GP_REGS_ID
-} gp_regs_ID_t;
- */
-typedef enum {
-	GP_DEVICE0_ID = 0,
-	N_GP_DEVICE_ID
-} gp_device_ID_t;
-
-typedef enum {
-	GP_TIMER0_ID = 0,
-	GP_TIMER1_ID,
-	GP_TIMER2_ID,
-	GP_TIMER3_ID,
-	GP_TIMER4_ID,
-	GP_TIMER5_ID,
-	GP_TIMER6_ID,
-	GP_TIMER7_ID,
-	N_GP_TIMER_ID
-} gp_timer_ID_t;
-
-typedef enum {
-	GPIO0_ID = 0,
-	N_GPIO_ID
-} gpio_ID_t;
-
-typedef enum {
-	TIMED_CTRL0_ID = 0,
-	N_TIMED_CTRL_ID
-} timed_ctrl_ID_t;
-
-typedef enum {
-	INPUT_FORMATTER0_ID = 0,
-	INPUT_FORMATTER1_ID,
-	INPUT_FORMATTER2_ID,
-	INPUT_FORMATTER3_ID,
-	N_INPUT_FORMATTER_ID
-} input_formatter_ID_t;
-
-/* The IF RST is outside the IF */
-#define INPUT_FORMATTER0_SRST_OFFSET	0x0824
-#define INPUT_FORMATTER1_SRST_OFFSET	0x0624
-#define INPUT_FORMATTER2_SRST_OFFSET	0x0424
-#define INPUT_FORMATTER3_SRST_OFFSET	0x0224
-
-#define INPUT_FORMATTER0_SRST_MASK		0x0001
-#define INPUT_FORMATTER1_SRST_MASK		0x0002
-#define INPUT_FORMATTER2_SRST_MASK		0x0004
-#define INPUT_FORMATTER3_SRST_MASK		0x0008
-
-typedef enum {
-	INPUT_SYSTEM0_ID = 0,
-	N_INPUT_SYSTEM_ID
-} input_system_ID_t;
-
-typedef enum {
-	RX0_ID = 0,
-	N_RX_ID
-} rx_ID_t;
-
-enum mipi_port_id {
-	MIPI_PORT0_ID = 0,
-	MIPI_PORT1_ID,
-	MIPI_PORT2_ID,
-	N_MIPI_PORT_ID
-};
-
-#define	N_RX_CHANNEL_ID		4
-
-/* Generic port enumeration with an internal port type ID */
-typedef enum {
-	CSI_PORT0_ID = 0,
-	CSI_PORT1_ID,
-	CSI_PORT2_ID,
-	TPG_PORT0_ID,
-	PRBS_PORT0_ID,
-	FIFO_PORT0_ID,
-	MEMORY_PORT0_ID,
-	N_INPUT_PORT_ID
-} input_port_ID_t;
-
-typedef enum {
-	CAPTURE_UNIT0_ID = 0,
-	CAPTURE_UNIT1_ID,
-	CAPTURE_UNIT2_ID,
-	ACQUISITION_UNIT0_ID,
-	DMA_UNIT0_ID,
-	CTRL_UNIT0_ID,
-	GPREGS_UNIT0_ID,
-	FIFO_UNIT0_ID,
-	IRQ_UNIT0_ID,
-	N_SUB_SYSTEM_ID
-} sub_system_ID_t;
-
-#define	N_CAPTURE_UNIT_ID		3
-#define	N_ACQUISITION_UNIT_ID	1
-#define	N_CTRL_UNIT_ID			1
-
-enum ia_css_isp_memories {
-	IA_CSS_ISP_PMEM0 = 0,
-	IA_CSS_ISP_DMEM0,
-	IA_CSS_ISP_VMEM0,
-	IA_CSS_ISP_VAMEM0,
-	IA_CSS_ISP_VAMEM1,
-	IA_CSS_ISP_VAMEM2,
-	IA_CSS_ISP_HMEM0,
-	IA_CSS_SP_DMEM0,
-	IA_CSS_DDR,
-	N_IA_CSS_MEMORIES
-};
-
-#define IA_CSS_NUM_MEMORIES 9
-/* For driver compatibility */
-#define N_IA_CSS_ISP_MEMORIES   IA_CSS_NUM_MEMORIES
-#define IA_CSS_NUM_ISP_MEMORIES IA_CSS_NUM_MEMORIES
-
-#if 0
-typedef enum {
-	dev_chn, /* device channels, external resource */
-	ext_mem, /* external memories */
-	int_mem, /* internal memories */
-	int_chn  /* internal channels, user defined */
-} resource_type_t;
-
-/* if this enum is extended with other memory resources, pls also extend the function resource_to_memptr() */
-typedef enum {
-	vied_nci_dev_chn_dma_ext0,
-	int_mem_vmem0,
-	int_mem_dmem0
-} resource_id_t;
-
-/* enum listing the different memories within a program group.
-   This enum is used in the mem_ptr_t type */
-typedef enum {
-	buf_mem_invalid = 0,
-	buf_mem_vmem_prog0,
-	buf_mem_dmem_prog0
-} buf_mem_t;
-
-#endif
-#endif /* __SYSTEM_GLOBAL_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/isp2400_system_local.h b/drivers/staging/media/atomisp/pci/isp2400_system_local.h
index 3c7dc180ffe6..fb6355c7e1a3 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_system_local.h
@@ -24,9 +24,6 @@
 
 #include "system_global.h"
 
-/* This interface is deprecated */
-#include "hive_types.h"
-
 /*
  * Cell specific address maps
  */
diff --git a/drivers/staging/media/atomisp/pci/isp2401_system_global.h b/drivers/staging/media/atomisp/pci/isp2401_system_global.h
index b4a6976d7eab..27cd2535bab8 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_system_global.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_system_global.h
@@ -13,411 +13,7 @@
  * more details.
  */
 
-#ifndef __SYSTEM_GLOBAL_H_INCLUDED__
-#define __SYSTEM_GLOBAL_H_INCLUDED__
-
-#include <hive_isp_css_defs.h>
-#include <type_support.h>
-
-/*
- * The longest allowed (uninteruptible) bus transfer, does not
- * take stalling into account
- */
-#define HIVE_ISP_MAX_BURST_LENGTH	1024
-
-/*
- * Maximum allowed burst length in words for the ISP DMA
- * This value is set to 2 to prevent the ISP DMA from blocking
- * the bus for too long; as the input system can only buffer
- * 2 lines on Moorefield and Cherrytrail, the input system buffers
- * may overflow if blocked for too long (BZ 2726).
- */
-#define ISP_DMA_MAX_BURST_LENGTH	2
-
-/*
- * Create a list of HAS and IS properties that defines the system
- *
- * The configuration assumes the following
- * - The system is hetereogeneous; Multiple cells and devices classes
- * - The cell and device instances are homogeneous, each device type
- *   belongs to the same class
- * - Device instances supporting a subset of the class capabilities are
- *   allowed
- *
- * We could manage different device classes through the enumerated
- * lists (C) or the use of classes (C++), but that is presently not
- * fully supported
- *
- * N.B. the 3 input formatters are of 2 different classess
- */
-
+#define HAS_NO_INPUT_FORMATTER
 #define USE_INPUT_SYSTEM_VERSION_2401
-
-#define HAS_MMU_VERSION_2
-#define HAS_DMA_VERSION_2
-#define HAS_GDC_VERSION_2
-#define HAS_VAMEM_VERSION_2
-#define HAS_HMEM_VERSION_1
-#define HAS_BAMEM_VERSION_2
-#define HAS_IRQ_VERSION_2
-#define HAS_IRQ_MAP_VERSION_2
-#define HAS_INPUT_FORMATTER_VERSION_2
-/* 2401: HAS_INPUT_SYSTEM_VERSION_3 */
-/* 2400: HAS_INPUT_SYSTEM_VERSION_2 */
-#define HAS_INPUT_SYSTEM_VERSION_2
 #define HAS_INPUT_SYSTEM_VERSION_2401
-#define HAS_BUFFERED_SENSOR
-#define HAS_FIFO_MONITORS_VERSION_2
-/* #define HAS_GP_REGS_VERSION_2 */
-#define HAS_GP_DEVICE_VERSION_2
-#define HAS_GPIO_VERSION_1
-#define HAS_TIMED_CTRL_VERSION_1
-#define HAS_RX_VERSION_2
-#define HAS_NO_INPUT_FORMATTER
-/*#define HAS_NO_PACKED_RAW_PIXELS*/
-/*#define HAS_NO_DVS_6AXIS_CONFIG_UPDATE*/
-
-#define DMA_DDR_TO_VAMEM_WORKAROUND
-#define DMA_DDR_TO_HMEM_WORKAROUND
-
-/*
- * Semi global. "HRT" is accessible from SP, but
- * the HRT types do not fully apply
- */
-#define HRT_VADDRESS_WIDTH	32
-
-#define HIVE_ISP_CTRL_DATA_BYTES (HIVE_ISP_CTRL_DATA_WIDTH / 8)
-
-/* The main bus connecting all devices */
-#define HRT_BUS_WIDTH		HIVE_ISP_CTRL_DATA_WIDTH
-#define HRT_BUS_BYTES		HIVE_ISP_CTRL_DATA_BYTES
-
 #define CSI2P_DISABLE_ISYS2401_ONLINE_MODE
-
-/* per-frame parameter handling support */
-#define SH_CSS_ENABLE_PER_FRAME_PARAMS
-
-typedef u32			hrt_bus_align_t;
-
-/*
- * Enumerate the devices, device access through the API is by ID,
- * through the DLI by address. The enumerator terminators are used
- * to size the wiring arrays and as an exception value.
- */
-typedef enum {
-	DDR0_ID = 0,
-	N_DDR_ID
-} ddr_ID_t;
-
-typedef enum {
-	ISP0_ID = 0,
-	N_ISP_ID
-} isp_ID_t;
-
-typedef enum {
-	SP0_ID = 0,
-	N_SP_ID
-} sp_ID_t;
-
-typedef enum {
-	MMU0_ID = 0,
-	MMU1_ID,
-	N_MMU_ID
-} mmu_ID_t;
-
-typedef enum {
-	DMA0_ID = 0,
-	N_DMA_ID
-} dma_ID_t;
-
-typedef enum {
-	GDC0_ID = 0,
-	GDC1_ID,
-	N_GDC_ID
-} gdc_ID_t;
-
-/* this extra define is needed because we want to use it also
-   in the preprocessor, and that doesn't work with enums.
- */
-#define N_GDC_ID_CPP 2
-
-typedef enum {
-	VAMEM0_ID = 0,
-	VAMEM1_ID,
-	VAMEM2_ID,
-	N_VAMEM_ID
-} vamem_ID_t;
-
-typedef enum {
-	BAMEM0_ID = 0,
-	N_BAMEM_ID
-} bamem_ID_t;
-
-typedef enum {
-	HMEM0_ID = 0,
-	N_HMEM_ID
-} hmem_ID_t;
-
-typedef enum {
-	ISYS_IRQ0_ID = 0,	/* port a */
-	ISYS_IRQ1_ID,	/* port b */
-	ISYS_IRQ2_ID,	/* port c */
-	N_ISYS_IRQ_ID
-} isys_irq_ID_t;
-
-typedef enum {
-	IRQ0_ID = 0,	/* GP IRQ block */
-	IRQ1_ID,	/* Input formatter */
-	IRQ2_ID,	/* input system */
-	IRQ3_ID,	/* input selector */
-	N_IRQ_ID
-} irq_ID_t;
-
-typedef enum {
-	FIFO_MONITOR0_ID = 0,
-	N_FIFO_MONITOR_ID
-} fifo_monitor_ID_t;
-
-/*
- * Deprecated: Since all gp_reg instances are different
- * and put in the address maps of other devices we cannot
- * enumerate them as that assumes the instrances are the
- * same.
- *
- * We define a single GP_DEVICE containing all gp_regs
- * w.r.t. a single base address
- *
-typedef enum {
-	GP_REGS0_ID = 0,
-	N_GP_REGS_ID
-} gp_regs_ID_t;
- */
-typedef enum {
-	GP_DEVICE0_ID = 0,
-	N_GP_DEVICE_ID
-} gp_device_ID_t;
-
-typedef enum {
-	GP_TIMER0_ID = 0,
-	GP_TIMER1_ID,
-	GP_TIMER2_ID,
-	GP_TIMER3_ID,
-	GP_TIMER4_ID,
-	GP_TIMER5_ID,
-	GP_TIMER6_ID,
-	GP_TIMER7_ID,
-	N_GP_TIMER_ID
-} gp_timer_ID_t;
-
-typedef enum {
-	GPIO0_ID = 0,
-	N_GPIO_ID
-} gpio_ID_t;
-
-typedef enum {
-	TIMED_CTRL0_ID = 0,
-	N_TIMED_CTRL_ID
-} timed_ctrl_ID_t;
-
-typedef enum {
-	INPUT_FORMATTER0_ID = 0,
-	INPUT_FORMATTER1_ID,
-	INPUT_FORMATTER2_ID,
-	INPUT_FORMATTER3_ID,
-	N_INPUT_FORMATTER_ID
-} input_formatter_ID_t;
-
-/* The IF RST is outside the IF */
-#define INPUT_FORMATTER0_SRST_OFFSET	0x0824
-#define INPUT_FORMATTER1_SRST_OFFSET	0x0624
-#define INPUT_FORMATTER2_SRST_OFFSET	0x0424
-#define INPUT_FORMATTER3_SRST_OFFSET	0x0224
-
-#define INPUT_FORMATTER0_SRST_MASK		0x0001
-#define INPUT_FORMATTER1_SRST_MASK		0x0002
-#define INPUT_FORMATTER2_SRST_MASK		0x0004
-#define INPUT_FORMATTER3_SRST_MASK		0x0008
-
-typedef enum {
-	INPUT_SYSTEM0_ID = 0,
-	N_INPUT_SYSTEM_ID
-} input_system_ID_t;
-
-typedef enum {
-	RX0_ID = 0,
-	N_RX_ID
-} rx_ID_t;
-
-enum mipi_port_id {
-	MIPI_PORT0_ID = 0,
-	MIPI_PORT1_ID,
-	MIPI_PORT2_ID,
-	N_MIPI_PORT_ID
-};
-
-#define	N_RX_CHANNEL_ID		4
-
-/* Generic port enumeration with an internal port type ID */
-typedef enum {
-	CSI_PORT0_ID = 0,
-	CSI_PORT1_ID,
-	CSI_PORT2_ID,
-	TPG_PORT0_ID,
-	PRBS_PORT0_ID,
-	FIFO_PORT0_ID,
-	MEMORY_PORT0_ID,
-	N_INPUT_PORT_ID
-} input_port_ID_t;
-
-typedef enum {
-	CAPTURE_UNIT0_ID = 0,
-	CAPTURE_UNIT1_ID,
-	CAPTURE_UNIT2_ID,
-	ACQUISITION_UNIT0_ID,
-	DMA_UNIT0_ID,
-	CTRL_UNIT0_ID,
-	GPREGS_UNIT0_ID,
-	FIFO_UNIT0_ID,
-	IRQ_UNIT0_ID,
-	N_SUB_SYSTEM_ID
-} sub_system_ID_t;
-
-#define	N_CAPTURE_UNIT_ID		3
-#define	N_ACQUISITION_UNIT_ID	1
-#define	N_CTRL_UNIT_ID			1
-
-/*
- * Input-buffer Controller.
- */
-typedef enum {
-	IBUF_CTRL0_ID = 0,	/* map to ISYS2401_IBUF_CNTRL_A */
-	IBUF_CTRL1_ID,		/* map to ISYS2401_IBUF_CNTRL_B */
-	IBUF_CTRL2_ID,		/* map ISYS2401_IBUF_CNTRL_C */
-	N_IBUF_CTRL_ID
-} ibuf_ctrl_ID_t;
-/* end of Input-buffer Controller */
-
-/*
- * Stream2MMIO.
- */
-typedef enum {
-	STREAM2MMIO0_ID = 0,	/* map to ISYS2401_S2M_A */
-	STREAM2MMIO1_ID,	/* map to ISYS2401_S2M_B */
-	STREAM2MMIO2_ID,	/* map to ISYS2401_S2M_C */
-	N_STREAM2MMIO_ID
-} stream2mmio_ID_t;
-
-typedef enum {
-	/*
-	 * Stream2MMIO 0 has 8 SIDs that are indexed by
-	 * [STREAM2MMIO_SID0_ID...STREAM2MMIO_SID7_ID].
-	 *
-	 * Stream2MMIO 1 has 4 SIDs that are indexed by
-	 * [STREAM2MMIO_SID0_ID...TREAM2MMIO_SID3_ID].
-	 *
-	 * Stream2MMIO 2 has 4 SIDs that are indexed by
-	 * [STREAM2MMIO_SID0_ID...STREAM2MMIO_SID3_ID].
-	 */
-	STREAM2MMIO_SID0_ID = 0,
-	STREAM2MMIO_SID1_ID,
-	STREAM2MMIO_SID2_ID,
-	STREAM2MMIO_SID3_ID,
-	STREAM2MMIO_SID4_ID,
-	STREAM2MMIO_SID5_ID,
-	STREAM2MMIO_SID6_ID,
-	STREAM2MMIO_SID7_ID,
-	N_STREAM2MMIO_SID_ID
-} stream2mmio_sid_ID_t;
-/* end of Stream2MMIO */
-
-/**
- * Input System 2401: CSI-MIPI recevier.
- */
-typedef enum {
-	CSI_RX_BACKEND0_ID = 0,	/* map to ISYS2401_MIPI_BE_A */
-	CSI_RX_BACKEND1_ID,		/* map to ISYS2401_MIPI_BE_B */
-	CSI_RX_BACKEND2_ID,		/* map to ISYS2401_MIPI_BE_C */
-	N_CSI_RX_BACKEND_ID
-} csi_rx_backend_ID_t;
-
-typedef enum {
-	CSI_RX_FRONTEND0_ID = 0,	/* map to ISYS2401_CSI_RX_A */
-	CSI_RX_FRONTEND1_ID,		/* map to ISYS2401_CSI_RX_B */
-	CSI_RX_FRONTEND2_ID,		/* map to ISYS2401_CSI_RX_C */
-#define N_CSI_RX_FRONTEND_ID (CSI_RX_FRONTEND2_ID + 1)
-} csi_rx_frontend_ID_t;
-
-typedef enum {
-	CSI_RX_DLANE0_ID = 0,		/* map to DLANE0 in CSI RX */
-	CSI_RX_DLANE1_ID,		/* map to DLANE1 in CSI RX */
-	CSI_RX_DLANE2_ID,		/* map to DLANE2 in CSI RX */
-	CSI_RX_DLANE3_ID,		/* map to DLANE3 in CSI RX */
-	N_CSI_RX_DLANE_ID
-} csi_rx_fe_dlane_ID_t;
-/* end of CSI-MIPI receiver */
-
-typedef enum {
-	ISYS2401_DMA0_ID = 0,
-	N_ISYS2401_DMA_ID
-} isys2401_dma_ID_t;
-
-/**
- * Pixel-generator. ("system_global.h")
- */
-typedef enum {
-	PIXELGEN0_ID = 0,
-	PIXELGEN1_ID,
-	PIXELGEN2_ID,
-	N_PIXELGEN_ID
-} pixelgen_ID_t;
-/* end of pixel-generator. ("system_global.h") */
-
-typedef enum {
-	INPUT_SYSTEM_CSI_PORT0_ID = 0,
-	INPUT_SYSTEM_CSI_PORT1_ID,
-	INPUT_SYSTEM_CSI_PORT2_ID,
-
-	INPUT_SYSTEM_PIXELGEN_PORT0_ID,
-	INPUT_SYSTEM_PIXELGEN_PORT1_ID,
-	INPUT_SYSTEM_PIXELGEN_PORT2_ID,
-
-	N_INPUT_SYSTEM_INPUT_PORT_ID
-} input_system_input_port_ID_t;
-
-#define N_INPUT_SYSTEM_CSI_PORT	3
-
-typedef enum {
-	ISYS2401_DMA_CHANNEL_0 = 0,
-	ISYS2401_DMA_CHANNEL_1,
-	ISYS2401_DMA_CHANNEL_2,
-	ISYS2401_DMA_CHANNEL_3,
-	ISYS2401_DMA_CHANNEL_4,
-	ISYS2401_DMA_CHANNEL_5,
-	ISYS2401_DMA_CHANNEL_6,
-	ISYS2401_DMA_CHANNEL_7,
-	ISYS2401_DMA_CHANNEL_8,
-	ISYS2401_DMA_CHANNEL_9,
-	ISYS2401_DMA_CHANNEL_10,
-	ISYS2401_DMA_CHANNEL_11,
-	N_ISYS2401_DMA_CHANNEL
-} isys2401_dma_channel;
-
-enum ia_css_isp_memories {
-	IA_CSS_ISP_PMEM0 = 0,
-	IA_CSS_ISP_DMEM0,
-	IA_CSS_ISP_VMEM0,
-	IA_CSS_ISP_VAMEM0,
-	IA_CSS_ISP_VAMEM1,
-	IA_CSS_ISP_VAMEM2,
-	IA_CSS_ISP_HMEM0,
-	IA_CSS_SP_DMEM0,
-	IA_CSS_DDR,
-	N_IA_CSS_MEMORIES
-};
-
-#define IA_CSS_NUM_MEMORIES 9
-/* For driver compatibility */
-#define N_IA_CSS_ISP_MEMORIES   IA_CSS_NUM_MEMORIES
-#define IA_CSS_NUM_ISP_MEMORIES IA_CSS_NUM_MEMORIES
-
-#endif /* __SYSTEM_GLOBAL_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/isp2401_system_local.h b/drivers/staging/media/atomisp/pci/isp2401_system_local.h
index d60591e04b61..ae7dfd9ea0c4 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_system_local.h
@@ -24,9 +24,6 @@
 
 #include "system_global.h"
 
-/* This interface is deprecated */
-#include "hive_types.h"
-
 /*
  * Cell specific address maps
  */
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6676537f0e97..54434c2dbaf9 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1841,8 +1841,13 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
 #endif
 
 #if !defined(HAS_NO_INPUT_SYSTEM)
-	dma_set_max_burst_size(DMA0_ID, HIVE_DMA_BUS_DDR_CONN,
-			       ISP_DMA_MAX_BURST_LENGTH);
+
+	if (!IS_ISP2401)
+		dma_set_max_burst_size(DMA0_ID, HIVE_DMA_BUS_DDR_CONN,
+				       ISP2400_DMA_MAX_BURST_LENGTH);
+	else
+		dma_set_max_burst_size(DMA0_ID, HIVE_DMA_BUS_DDR_CONN,
+				       ISP2401_DMA_MAX_BURST_LENGTH);
 
 	if (ia_css_isys_init() != INPUT_SYSTEM_ERR_NO_ERROR)
 		err = -EINVAL;
diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index 16d0a2e9a4dc..90210f6943d2 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -4,8 +4,403 @@
  *    (c) 2020 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  */
 
+#ifndef __SYSTEM_GLOBAL_H_INCLUDED__
+#define __SYSTEM_GLOBAL_H_INCLUDED__
+
+/*
+ * Create a list of HAS and IS properties that defines the system
+ * Those are common for both ISP2400 and ISP2401
+ *
+ * The configuration assumes the following
+ * - The system is hetereogeneous; Multiple cells and devices classes
+ * - The cell and device instances are homogeneous, each device type
+ *   belongs to the same class
+ * - Device instances supporting a subset of the class capabilities are
+ *   allowed
+ *
+ * We could manage different device classes through the enumerated
+ * lists (C) or the use of classes (C++), but that is presently not
+ * fully supported
+ *
+ * N.B. the 3 input formatters are of 2 different classess
+ */
+
+#define HAS_MMU_VERSION_2
+#define HAS_DMA_VERSION_2
+#define HAS_GDC_VERSION_2
+#define HAS_VAMEM_VERSION_2
+#define HAS_HMEM_VERSION_1
+#define HAS_BAMEM_VERSION_2
+#define HAS_IRQ_VERSION_2
+#define HAS_IRQ_MAP_VERSION_2
+#define HAS_INPUT_FORMATTER_VERSION_2
+#define HAS_INPUT_SYSTEM_VERSION_2
+#define HAS_BUFFERED_SENSOR
+#define HAS_FIFO_MONITORS_VERSION_2
+#define HAS_GP_DEVICE_VERSION_2
+#define HAS_GPIO_VERSION_1
+#define HAS_TIMED_CTRL_VERSION_1
+#define HAS_RX_VERSION_2
+
+/* per-frame parameter handling support */
+#define SH_CSS_ENABLE_PER_FRAME_PARAMS
+
+#define DMA_DDR_TO_VAMEM_WORKAROUND
+#define DMA_DDR_TO_HMEM_WORKAROUND
+
+/*
+ * The longest allowed (uninteruptible) bus transfer, does not
+ * take stalling into account
+ */
+#define HIVE_ISP_MAX_BURST_LENGTH	1024
+
+/*
+ * Maximum allowed burst length in words for the ISP DMA
+ * This value is set to 2 to prevent the ISP DMA from blocking
+ * the bus for too long; as the input system can only buffer
+ * 2 lines on Moorefield and Cherrytrail, the input system buffers
+ * may overflow if blocked for too long (BZ 2726).
+ */
+#define ISP2400_DMA_MAX_BURST_LENGTH	128
+#define ISP2401_DMA_MAX_BURST_LENGTH	2
+
 #ifdef ISP2401
 #  include "isp2401_system_global.h"
 #else
 #  include "isp2400_system_global.h"
 #endif
+
+#include <hive_isp_css_defs.h>
+#include <type_support.h>
+
+/* This interface is deprecated */
+#include "hive_types.h"
+
+/*
+ * Semi global. "HRT" is accessible from SP, but the HRT types do not fully apply
+ */
+#define HRT_VADDRESS_WIDTH	32
+
+#define SIZEOF_HRT_REG		(HRT_DATA_WIDTH >> 3)
+#define HIVE_ISP_CTRL_DATA_BYTES (HIVE_ISP_CTRL_DATA_WIDTH / 8)
+
+/* The main bus connecting all devices */
+#define HRT_BUS_WIDTH		HIVE_ISP_CTRL_DATA_WIDTH
+#define HRT_BUS_BYTES		HIVE_ISP_CTRL_DATA_BYTES
+
+typedef u32			hrt_bus_align_t;
+
+/*
+ * Enumerate the devices, device access through the API is by ID,
+ * through the DLI by address. The enumerator terminators are used
+ * to size the wiring arrays and as an exception value.
+ */
+typedef enum {
+	DDR0_ID = 0,
+	N_DDR_ID
+} ddr_ID_t;
+
+typedef enum {
+	ISP0_ID = 0,
+	N_ISP_ID
+} isp_ID_t;
+
+typedef enum {
+	SP0_ID = 0,
+	N_SP_ID
+} sp_ID_t;
+
+typedef enum {
+	MMU0_ID = 0,
+	MMU1_ID,
+	N_MMU_ID
+} mmu_ID_t;
+
+typedef enum {
+	DMA0_ID = 0,
+	N_DMA_ID
+} dma_ID_t;
+
+typedef enum {
+	GDC0_ID = 0,
+	GDC1_ID,
+	N_GDC_ID
+} gdc_ID_t;
+
+/* this extra define is needed because we want to use it also
+   in the preprocessor, and that doesn't work with enums.
+ */
+#define N_GDC_ID_CPP 2
+
+typedef enum {
+	VAMEM0_ID = 0,
+	VAMEM1_ID,
+	VAMEM2_ID,
+	N_VAMEM_ID
+} vamem_ID_t;
+
+typedef enum {
+	BAMEM0_ID = 0,
+	N_BAMEM_ID
+} bamem_ID_t;
+
+typedef enum {
+	HMEM0_ID = 0,
+	N_HMEM_ID
+} hmem_ID_t;
+
+typedef enum {
+	IRQ0_ID = 0,	/* GP IRQ block */
+	IRQ1_ID,	/* Input formatter */
+	IRQ2_ID,	/* input system */
+	IRQ3_ID,	/* input selector */
+	N_IRQ_ID
+} irq_ID_t;
+
+typedef enum {
+	FIFO_MONITOR0_ID = 0,
+	N_FIFO_MONITOR_ID
+} fifo_monitor_ID_t;
+
+typedef enum {
+	GP_DEVICE0_ID = 0,
+	N_GP_DEVICE_ID
+} gp_device_ID_t;
+
+typedef enum {
+	GP_TIMER0_ID = 0,
+	GP_TIMER1_ID,
+	GP_TIMER2_ID,
+	GP_TIMER3_ID,
+	GP_TIMER4_ID,
+	GP_TIMER5_ID,
+	GP_TIMER6_ID,
+	GP_TIMER7_ID,
+	N_GP_TIMER_ID
+} gp_timer_ID_t;
+
+typedef enum {
+	GPIO0_ID = 0,
+	N_GPIO_ID
+} gpio_ID_t;
+
+typedef enum {
+	TIMED_CTRL0_ID = 0,
+	N_TIMED_CTRL_ID
+} timed_ctrl_ID_t;
+
+typedef enum {
+	INPUT_FORMATTER0_ID = 0,
+	INPUT_FORMATTER1_ID,
+	INPUT_FORMATTER2_ID,
+	INPUT_FORMATTER3_ID,
+	N_INPUT_FORMATTER_ID
+} input_formatter_ID_t;
+
+/* The IF RST is outside the IF */
+#define INPUT_FORMATTER0_SRST_OFFSET	0x0824
+#define INPUT_FORMATTER1_SRST_OFFSET	0x0624
+#define INPUT_FORMATTER2_SRST_OFFSET	0x0424
+#define INPUT_FORMATTER3_SRST_OFFSET	0x0224
+
+#define INPUT_FORMATTER0_SRST_MASK		0x0001
+#define INPUT_FORMATTER1_SRST_MASK		0x0002
+#define INPUT_FORMATTER2_SRST_MASK		0x0004
+#define INPUT_FORMATTER3_SRST_MASK		0x0008
+
+typedef enum {
+	INPUT_SYSTEM0_ID = 0,
+	N_INPUT_SYSTEM_ID
+} input_system_ID_t;
+
+typedef enum {
+	RX0_ID = 0,
+	N_RX_ID
+} rx_ID_t;
+
+enum mipi_port_id {
+	MIPI_PORT0_ID = 0,
+	MIPI_PORT1_ID,
+	MIPI_PORT2_ID,
+	N_MIPI_PORT_ID
+};
+
+#define	N_RX_CHANNEL_ID		4
+
+/* Generic port enumeration with an internal port type ID */
+typedef enum {
+	CSI_PORT0_ID = 0,
+	CSI_PORT1_ID,
+	CSI_PORT2_ID,
+	TPG_PORT0_ID,
+	PRBS_PORT0_ID,
+	FIFO_PORT0_ID,
+	MEMORY_PORT0_ID,
+	N_INPUT_PORT_ID
+} input_port_ID_t;
+
+typedef enum {
+	CAPTURE_UNIT0_ID = 0,
+	CAPTURE_UNIT1_ID,
+	CAPTURE_UNIT2_ID,
+	ACQUISITION_UNIT0_ID,
+	DMA_UNIT0_ID,
+	CTRL_UNIT0_ID,
+	GPREGS_UNIT0_ID,
+	FIFO_UNIT0_ID,
+	IRQ_UNIT0_ID,
+	N_SUB_SYSTEM_ID
+} sub_system_ID_t;
+
+#define	N_CAPTURE_UNIT_ID		3
+#define	N_ACQUISITION_UNIT_ID		1
+#define	N_CTRL_UNIT_ID			1
+
+
+enum ia_css_isp_memories {
+	IA_CSS_ISP_PMEM0 = 0,
+	IA_CSS_ISP_DMEM0,
+	IA_CSS_ISP_VMEM0,
+	IA_CSS_ISP_VAMEM0,
+	IA_CSS_ISP_VAMEM1,
+	IA_CSS_ISP_VAMEM2,
+	IA_CSS_ISP_HMEM0,
+	IA_CSS_SP_DMEM0,
+	IA_CSS_DDR,
+	N_IA_CSS_MEMORIES
+};
+
+#define IA_CSS_NUM_MEMORIES 9
+/* For driver compatibility */
+#define N_IA_CSS_ISP_MEMORIES   IA_CSS_NUM_MEMORIES
+#define IA_CSS_NUM_ISP_MEMORIES IA_CSS_NUM_MEMORIES
+
+/*
+ * ISP2401 specific enums
+ */
+
+typedef enum {
+	ISYS_IRQ0_ID = 0,	/* port a */
+	ISYS_IRQ1_ID,	/* port b */
+	ISYS_IRQ2_ID,	/* port c */
+	N_ISYS_IRQ_ID
+} isys_irq_ID_t;
+
+
+/*
+ * Input-buffer Controller.
+ */
+typedef enum {
+	IBUF_CTRL0_ID = 0,	/* map to ISYS2401_IBUF_CNTRL_A */
+	IBUF_CTRL1_ID,		/* map to ISYS2401_IBUF_CNTRL_B */
+	IBUF_CTRL2_ID,		/* map ISYS2401_IBUF_CNTRL_C */
+	N_IBUF_CTRL_ID
+} ibuf_ctrl_ID_t;
+/* end of Input-buffer Controller */
+
+/*
+ * Stream2MMIO.
+ */
+typedef enum {
+	STREAM2MMIO0_ID = 0,	/* map to ISYS2401_S2M_A */
+	STREAM2MMIO1_ID,	/* map to ISYS2401_S2M_B */
+	STREAM2MMIO2_ID,	/* map to ISYS2401_S2M_C */
+	N_STREAM2MMIO_ID
+} stream2mmio_ID_t;
+
+typedef enum {
+	/*
+	 * Stream2MMIO 0 has 8 SIDs that are indexed by
+	 * [STREAM2MMIO_SID0_ID...STREAM2MMIO_SID7_ID].
+	 *
+	 * Stream2MMIO 1 has 4 SIDs that are indexed by
+	 * [STREAM2MMIO_SID0_ID...TREAM2MMIO_SID3_ID].
+	 *
+	 * Stream2MMIO 2 has 4 SIDs that are indexed by
+	 * [STREAM2MMIO_SID0_ID...STREAM2MMIO_SID3_ID].
+	 */
+	STREAM2MMIO_SID0_ID = 0,
+	STREAM2MMIO_SID1_ID,
+	STREAM2MMIO_SID2_ID,
+	STREAM2MMIO_SID3_ID,
+	STREAM2MMIO_SID4_ID,
+	STREAM2MMIO_SID5_ID,
+	STREAM2MMIO_SID6_ID,
+	STREAM2MMIO_SID7_ID,
+	N_STREAM2MMIO_SID_ID
+} stream2mmio_sid_ID_t;
+/* end of Stream2MMIO */
+
+/**
+ * Input System 2401: CSI-MIPI recevier.
+ */
+typedef enum {
+	CSI_RX_BACKEND0_ID = 0,	/* map to ISYS2401_MIPI_BE_A */
+	CSI_RX_BACKEND1_ID,		/* map to ISYS2401_MIPI_BE_B */
+	CSI_RX_BACKEND2_ID,		/* map to ISYS2401_MIPI_BE_C */
+	N_CSI_RX_BACKEND_ID
+} csi_rx_backend_ID_t;
+
+typedef enum {
+	CSI_RX_FRONTEND0_ID = 0,	/* map to ISYS2401_CSI_RX_A */
+	CSI_RX_FRONTEND1_ID,		/* map to ISYS2401_CSI_RX_B */
+	CSI_RX_FRONTEND2_ID,		/* map to ISYS2401_CSI_RX_C */
+#define N_CSI_RX_FRONTEND_ID (CSI_RX_FRONTEND2_ID + 1)
+} csi_rx_frontend_ID_t;
+
+typedef enum {
+	CSI_RX_DLANE0_ID = 0,		/* map to DLANE0 in CSI RX */
+	CSI_RX_DLANE1_ID,		/* map to DLANE1 in CSI RX */
+	CSI_RX_DLANE2_ID,		/* map to DLANE2 in CSI RX */
+	CSI_RX_DLANE3_ID,		/* map to DLANE3 in CSI RX */
+	N_CSI_RX_DLANE_ID
+} csi_rx_fe_dlane_ID_t;
+/* end of CSI-MIPI receiver */
+
+typedef enum {
+	ISYS2401_DMA0_ID = 0,
+	N_ISYS2401_DMA_ID
+} isys2401_dma_ID_t;
+
+/**
+ * Pixel-generator. ("system_global.h")
+ */
+typedef enum {
+	PIXELGEN0_ID = 0,
+	PIXELGEN1_ID,
+	PIXELGEN2_ID,
+	N_PIXELGEN_ID
+} pixelgen_ID_t;
+/* end of pixel-generator. ("system_global.h") */
+
+typedef enum {
+	INPUT_SYSTEM_CSI_PORT0_ID = 0,
+	INPUT_SYSTEM_CSI_PORT1_ID,
+	INPUT_SYSTEM_CSI_PORT2_ID,
+
+	INPUT_SYSTEM_PIXELGEN_PORT0_ID,
+	INPUT_SYSTEM_PIXELGEN_PORT1_ID,
+	INPUT_SYSTEM_PIXELGEN_PORT2_ID,
+
+	N_INPUT_SYSTEM_INPUT_PORT_ID
+} input_system_input_port_ID_t;
+
+#define N_INPUT_SYSTEM_CSI_PORT	3
+
+typedef enum {
+	ISYS2401_DMA_CHANNEL_0 = 0,
+	ISYS2401_DMA_CHANNEL_1,
+	ISYS2401_DMA_CHANNEL_2,
+	ISYS2401_DMA_CHANNEL_3,
+	ISYS2401_DMA_CHANNEL_4,
+	ISYS2401_DMA_CHANNEL_5,
+	ISYS2401_DMA_CHANNEL_6,
+	ISYS2401_DMA_CHANNEL_7,
+	ISYS2401_DMA_CHANNEL_8,
+	ISYS2401_DMA_CHANNEL_9,
+	ISYS2401_DMA_CHANNEL_10,
+	ISYS2401_DMA_CHANNEL_11,
+	N_ISYS2401_DMA_CHANNEL
+} isys2401_dma_channel;
+
+#endif /* __SYSTEM_GLOBAL_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/system_local.h b/drivers/staging/media/atomisp/pci/system_local.h
index dfcc4c2b8f16..7ad9cee6d550 100644
--- a/drivers/staging/media/atomisp/pci/system_local.h
+++ b/drivers/staging/media/atomisp/pci/system_local.h
@@ -1,5 +1,4 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *    (c) 2020 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  */
-- 
2.26.2

