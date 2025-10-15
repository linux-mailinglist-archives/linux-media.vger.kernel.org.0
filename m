Return-Path: <linux-media+bounces-44514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBF1BDC9FC
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ABE719A36AC
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 05:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDDB630596B;
	Wed, 15 Oct 2025 05:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Mwwhv/SF"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97CD2F7AB0;
	Wed, 15 Oct 2025 05:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760506864; cv=none; b=fiYgvv26A9Xn+s7td3y9UH9MOChOpGa5lpXafZMvKvOfOS8xR+5QriorBux/JpleErndCiEL5usT18sKvymLSi8Rkhq3ShL1wM+eE7xG4JkRCEFcCOLrx1RGmPxLDXN0FzIieba3cU9IczmkUzlLgPSi3DxebeTglXuecd6nHZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760506864; c=relaxed/simple;
	bh=8GztYp0mH+i0YqSMf148hXbuRiG+IHvcNqijuc7KrEk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UhSaxbkrIaYBbLOLvvOFGQPC5j19eylD6GHQrLyzqW09auavTAzofG6NfOgb4trVF/vpdrOVDilzpaqr868Zb8GqfH9nv8Tbb/vcl6k6u4SUDEWvqt+0QVJtLt6g9FpnHnMvXD+Z0suTNzDi4u4wqva8Sb8TYuIci8ODU0n2znE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Mwwhv/SF; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59F5ehnf1679918;
	Wed, 15 Oct 2025 00:40:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760506843;
	bh=stF8YH4swVlT0NmX+H5bjvaD0UtKGfpl4+BQH537yrY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Mwwhv/SFBdyeETTfbJbo8buq+ww0Vq7qDV+Mu6YakH7mlHktcdx/dT0PyJwJo8qUQ
	 WOKm45nXSbKDO06nagred+GYVQzPqzf5AV7uzKUCR458zc576+jKKP5IQTrnilN134
	 A/5nrI6GPtNb/DQ6c6GNrg737Jrn8h9IqgbaWqQc=
Received: from DLEE205.ent.ti.com (dlee205.ent.ti.com [157.170.170.85])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59F5ehtc588831
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Oct 2025 00:40:43 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 00:40:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 00:40:43 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59F5eGdq1402458;
	Wed, 15 Oct 2025 00:40:38 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <hverkuil+cisco@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
        <jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>, Sukrut Bellary <sbellary@baylibre.com>
Subject: [PATCH V4 4/4] media: ti: vpe: Add the VIP driver
Date: Wed, 15 Oct 2025 11:10:10 +0530
Message-ID: <20251015054010.3594423-5-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015054010.3594423-1-y-abhilashchandra@ti.com>
References: <20251015054010.3594423-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Dale Farnsworth <dale@farnsworth.org>

VIP stands for Video Input Port. It can be found on devices such as DRA7xx
and provides a parallel interface to a video source such as a sensor or TV
decoder. Each VIP can support two inputs (slices) and an SoC can be
configured with a variable number of VIPs. Each slice can support two
ports, each connected to its own sub-device.

Signed-off-by: Dale Farnsworth <dale@farnsworth.org>
Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
- Since we now have one contiguous address space, declare offsets
  of scalar, color space converter and vpdma in vip.h
- Also change the driver to use these offsets instead of
  using sc.c and csc.c libraries
- Since we now have one contiguous address space, we cannot use
  VPDMA helpers. Hence export vpdma_load_firmware() to load
  VPDMA firmware (Patch 2/4)

 drivers/media/platform/ti/Kconfig      |   13 +
 drivers/media/platform/ti/vpe/Makefile |    2 +
 drivers/media/platform/ti/vpe/vip.c    | 3742 ++++++++++++++++++++++++
 drivers/media/platform/ti/vpe/vip.h    |  721 +++++
 4 files changed, 4478 insertions(+)
 create mode 100644 drivers/media/platform/ti/vpe/vip.c
 create mode 100644 drivers/media/platform/ti/vpe/vip.h

diff --git a/drivers/media/platform/ti/Kconfig b/drivers/media/platform/ti/Kconfig
index 3bc4aa35887e..7cd1539ab84a 100644
--- a/drivers/media/platform/ti/Kconfig
+++ b/drivers/media/platform/ti/Kconfig
@@ -41,6 +41,19 @@ config VIDEO_TI_CAL_MC
 	  default. Note that this behavior can be overridden via
 	  module parameter 'mc_api'.
 
+config VIDEO_TI_VIP
+        tristate "TI Video Input Port"
+        default n
+        depends on VIDEO_DEV && SOC_DRA7XX
+        depends on HAS_DMA
+        select VIDEOBUF2_DMA_CONTIG
+        select VIDEO_TI_VPDMA
+        select VIDEO_TI_SC
+        select VIDEO_TI_CSC
+        help
+        Driver support for VIP module on certain TI SoC's
+        VIP = Video Input Port.
+
 # Mem2mem drivers
 
 config VIDEO_TI_VPE
diff --git a/drivers/media/platform/ti/vpe/Makefile b/drivers/media/platform/ti/vpe/Makefile
index 3fadfe084f87..fbb0dec5a30e 100644
--- a/drivers/media/platform/ti/vpe/Makefile
+++ b/drivers/media/platform/ti/vpe/Makefile
@@ -3,10 +3,12 @@ obj-$(CONFIG_VIDEO_TI_VPE) += ti-vpe.o
 obj-$(CONFIG_VIDEO_TI_VPDMA) += ti-vpdma.o
 obj-$(CONFIG_VIDEO_TI_SC) += ti-sc.o
 obj-$(CONFIG_VIDEO_TI_CSC) += ti-csc.o
+obj-$(CONFIG_VIDEO_TI_VIP) += ti-vip.o
 
 ti-vpe-y := vpe.o
 ti-vpdma-y := vpdma.o
 ti-sc-y := sc.o
 ti-csc-y := csc.o
+ti-vip-y := vip.o
 
 ccflags-$(CONFIG_VIDEO_TI_VPE_DEBUG) += -DDEBUG
diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
new file mode 100644
index 000000000000..f94ad2d9e7dd
--- /dev/null
+++ b/drivers/media/platform/ti/vpe/vip.c
@@ -0,0 +1,3742 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TI VIP capture driver
+ *
+ * Copyright (C) 2025 Texas Instruments Incorporated -  http://www.ti.com/
+ * David Griego, <dagriego@biglakesoftware.com>
+ * Dale Farnsworth, <dale@farnsworth.org>
+ * Yemike Abhilash Chandra, <y-abhilashchandra@ti.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/workqueue.h>
+#include <linux/pm_runtime.h>
+#include <linux/sched.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+
+#include <linux/pinctrl/consumer.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+
+#include "vip.h"
+
+#define VIP_MODULE_NAME "vip"
+
+static int debug;
+module_param(debug, int, 0644);
+MODULE_PARM_DESC(debug, "debug level (0-8)");
+
+/*
+ * Minimum and maximum frame sizes
+ */
+#define MIN_W		128
+#define MIN_H		128
+#define MAX_W		2048
+#define MAX_H		1536
+
+/*
+ * Required alignments
+ */
+#define S_ALIGN		0 /* multiple of 1 */
+#define H_ALIGN		1 /* multiple of 2 */
+#define W_ALIGN		1 /* multiple of 2 */
+#define L_ALIGN		7 /* multiple of 128, line stride, 16 bytes */
+
+/*
+ * Need a descriptor entry for each of up to 15 outputs,
+ * and up to 2 control transfers.
+ */
+#define VIP_DESC_LIST_SIZE	(17 * sizeof(struct vpdma_dtd))
+
+/*
+ * port flag bits
+ */
+#define FLAG_INTERLACED	BIT(4)
+#define FLAG_MULT_PORT		BIT(6)
+#define FLAG_MULT_ANC		BIT(7)
+
+#define VIP_VPDMA_FIFO_SIZE	2
+#define VIP_DROPQ_SIZE		3
+
+/*
+ * Define indices into the srce_info tables
+ */
+
+#define VIP_SRCE_MULT_PORT	0
+#define VIP_SRCE_MULT_ANC	1
+#define VIP_SRCE_LUMA		2
+#define VIP_SRCE_CHROMA	3
+#define VIP_SRCE_RGB		4
+
+#define reg_read(dev, offset) ioread32((dev)->base + (offset))
+#define reg_write(dev, offset, val) iowrite32((val), (dev)->base + (offset))
+
+#define GET_OFFSET_TOP(port, obj, reg)	\
+	((obj)->base - (port)->dev->base + (reg))
+
+#define VIP_SET_MMR_ADB_HDR(port, hdr, regs, offset_a)	\
+	VPDMA_SET_MMR_ADB_HDR((port)->mmr_adb, vip_mmr_adb, hdr, regs, offset_a)
+
+/*
+ * These represent the module resets bit for slice 1
+ * Upon detecting slice2 we simply left shift by 1
+ */
+#define VIP_DP_RST	BIT(16)
+#define VIP_CSC_RST	BIT(20)
+#define VIP_SC_RST	BIT(22)
+
+#define VIP_PARSER_PORT(p)		(VIP_PARSER_PORTA_0 + ((p) * 0x8U))
+#define VIP_PARSER_EXTRA_PORT(p)	(VIP_PARSER_PORTA_1 + ((p) * 0x8U))
+#define VIP_PARSER_CROP_H_PORT(p) \
+		(VIP_PARSER_PORTA_EXTRA4 + ((p) * 0x10U))
+#define VIP_PARSER_CROP_V_PORT(p) \
+		(VIP_PARSER_PORTA_EXTRA5 + ((p) * 0x10U))
+#define VIP_PARSER_STOP_IMM_PORT(p)	(VIP_PARSER_PORTA_EXTRA6 + ((p) * 0x4U))
+
+#define PARSER_IRQ_MASK (VIP_PORTA_OUTPUT_FIFO_YUV | \
+			 VIP_PORTB_OUTPUT_FIFO_YUV)
+
+/*
+ * The srce_info structure contains per-srce data.
+ */
+struct vip_srce_info {
+	u8	base_channel;	/* the VPDMA channel number */
+	u8	vb_index;	/* input frame f, f-1, f-2 index */
+	u8	vb_part;	/* identifies section of co-planar formats */
+};
+
+static struct vip_srce_info srce_info[5] = {
+	[VIP_SRCE_MULT_PORT] = {
+		.base_channel	= VIP1_CHAN_NUM_MULT_PORT_A_SRC0,
+		.vb_index	= 0,
+		.vb_part	= VIP_CHROMA,
+	},
+	[VIP_SRCE_MULT_ANC] = {
+		.base_channel	= VIP1_CHAN_NUM_MULT_ANC_A_SRC0,
+		.vb_index	= 0,
+		.vb_part	= VIP_LUMA,
+	},
+	[VIP_SRCE_LUMA] = {
+		.base_channel	= VIP1_CHAN_NUM_PORT_A_LUMA,
+		.vb_index	= 1,
+		.vb_part	= VIP_LUMA,
+	},
+	[VIP_SRCE_CHROMA] = {
+		.base_channel	= VIP1_CHAN_NUM_PORT_A_CHROMA,
+		.vb_index	= 1,
+		.vb_part	= VIP_CHROMA,
+	},
+	[VIP_SRCE_RGB] = {
+		.base_channel	= VIP1_CHAN_NUM_PORT_A_RGB,
+		.vb_part	= VIP_LUMA,
+	},
+};
+
+static struct vip_fmt vip_formats[VIP_MAX_ACTIVE_FMT] = {
+	{
+		.fourcc		= V4L2_PIX_FMT_NV12,
+		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
+		.coplanar	= 1,
+		.vpdma_fmt	= { &vpdma_yuv_fmts[VPDMA_DATA_FMT_Y420],
+				    &vpdma_yuv_fmts[VPDMA_DATA_FMT_C420],
+				  },
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_UYVY,
+		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
+		.coplanar	= 0,
+		.vpdma_fmt	= { &vpdma_yuv_fmts[VPDMA_DATA_FMT_CBY422],
+				  },
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_YUYV,
+		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
+		.coplanar	= 0,
+		.vpdma_fmt	= { &vpdma_yuv_fmts[VPDMA_DATA_FMT_YCB422],
+				  },
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_VYUY,
+		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
+		.coplanar	= 0,
+		.vpdma_fmt	= { &vpdma_yuv_fmts[VPDMA_DATA_FMT_CRY422],
+				  },
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_YVYU,
+		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
+		.coplanar	= 0,
+		.vpdma_fmt	= { &vpdma_yuv_fmts[VPDMA_DATA_FMT_YCR422],
+				  },
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_RGB24,
+		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
+		.coplanar	= 0,
+		.vpdma_fmt	= { &vpdma_rgb_fmts[VPDMA_DATA_FMT_RGB24],
+				  },
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_RGB32,
+		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
+		.coplanar	= 0,
+		.vpdma_fmt	= { &vpdma_rgb_fmts[VPDMA_DATA_FMT_ARGB32],
+				  },
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_BGR24,
+		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
+		.coplanar	= 0,
+		.vpdma_fmt	= { &vpdma_rgb_fmts[VPDMA_DATA_FMT_BGR24],
+				  },
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_BGR32,
+		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
+		.coplanar	= 0,
+		.vpdma_fmt	= { &vpdma_rgb_fmts[VPDMA_DATA_FMT_ABGR32],
+				  },
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_RGB24,
+		.code		= MEDIA_BUS_FMT_RGB888_1X24,
+		.coplanar	= 0,
+		.vpdma_fmt	= { &vpdma_rgb_fmts[VPDMA_DATA_FMT_RGB24],
+				  },
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_RGB32,
+		.code		= MEDIA_BUS_FMT_ARGB8888_1X32,
+		.coplanar	= 0,
+		.vpdma_fmt	= { &vpdma_rgb_fmts[VPDMA_DATA_FMT_ARGB32],
+				  },
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SBGGR8,
+		.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
+		.coplanar	= 0,
+		.vpdma_fmt	= { &vpdma_raw_fmts[VPDMA_DATA_FMT_RAW8],
+				  },
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SGBRG8,
+		.code		= MEDIA_BUS_FMT_SGBRG8_1X8,
+		.coplanar	= 0,
+		.vpdma_fmt	= { &vpdma_raw_fmts[VPDMA_DATA_FMT_RAW8],
+				  },
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SGRBG8,
+		.code		= MEDIA_BUS_FMT_SGRBG8_1X8,
+		.coplanar	= 0,
+		.vpdma_fmt	= { &vpdma_raw_fmts[VPDMA_DATA_FMT_RAW8],
+				  },
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SRGGB8,
+		.code		= MEDIA_BUS_FMT_SRGGB8_1X8,
+		.coplanar	= 0,
+		.vpdma_fmt	= { &vpdma_raw_fmts[VPDMA_DATA_FMT_RAW8],
+				  },
+	},
+	{
+		/* V4L2 currently only defines one 16 bit variant */
+		.fourcc		= V4L2_PIX_FMT_SBGGR16,
+		.code		= MEDIA_BUS_FMT_SBGGR16_1X16,
+		.coplanar	= 0,
+		.vpdma_fmt	= { &vpdma_raw_fmts[VPDMA_DATA_FMT_RAW16],
+				  },
+	},
+};
+
+/*
+ * DMA address/data block for the shadow registers
+ */
+struct vip_mmr_adb {
+	struct vpdma_adb_hdr	sc_hdr0;
+	u32			sc_regs0[7];
+	u32			sc_pad0[1];
+	struct vpdma_adb_hdr	sc_hdr8;
+	u32			sc_regs8[6];
+	u32			sc_pad8[2];
+	struct vpdma_adb_hdr	sc_hdr17;
+	u32			sc_regs17[9];
+	u32			sc_pad17[3];
+	struct vpdma_adb_hdr	csc_hdr;
+	u32			csc_regs[6];
+	u32			csc_pad[2];
+};
+
+/*
+ * Function prototype declarations
+ */
+static int alloc_port(struct vip_dev *, int);
+static void free_port(struct vip_port *);
+static int vip_setup_parser(struct vip_port *port);
+static int vip_setup_scaler(struct vip_stream *stream);
+static void vip_enable_parser(struct vip_port *port, bool on);
+static void vip_reset_parser(struct vip_port *port, bool on);
+static void vip_parser_stop_imm(struct vip_port *port, bool on);
+static void stop_dma(struct vip_stream *stream, bool clear_list);
+static int vip_load_vpdma_list_fifo(struct vip_stream *stream);
+static inline bool is_scaler_available(struct vip_port *port);
+static inline bool allocate_scaler(struct vip_port *port);
+static inline void free_scaler(struct vip_port *port);
+static bool is_csc_available(struct vip_port *port);
+static bool allocate_csc(struct vip_port *port,
+			 enum vip_csc_state csc_direction);
+static void free_csc(struct vip_port *port);
+
+/* initialize  v4l2_format_info member in vip_formats array */
+static void vip_init_format_info(struct device *dev)
+{
+	struct vip_fmt *fmt;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(vip_formats); i++) {
+		fmt = &vip_formats[i];
+		fmt->finfo = v4l2_format_info(fmt->fourcc);
+	}
+}
+
+/*  Print Four-character-code (FOURCC) */
+static char *fourcc_to_str(u32 fmt)
+{
+	static char code[5];
+
+	code[0] = (unsigned char)(fmt & 0xff);
+	code[1] = (unsigned char)((fmt >> 8) & 0xff);
+	code[2] = (unsigned char)((fmt >> 16) & 0xff);
+	code[3] = (unsigned char)((fmt >> 24) & 0xff);
+	code[4] = '\0';
+
+	return code;
+}
+
+/*
+ * Find our format description corresponding to the passed v4l2_format
+ */
+static struct vip_fmt *find_port_format_by_pix(struct vip_port *port,
+					       u32 pixelformat)
+{
+	struct vip_fmt *fmt;
+	unsigned int index;
+
+	for (index = 0; index < port->num_active_fmt; index++) {
+		fmt = port->active_fmt[index];
+		if (fmt->fourcc == pixelformat)
+			return fmt;
+	}
+
+	return NULL;
+}
+
+static struct vip_fmt *find_port_format_by_code(struct vip_port *port,
+						u32 code)
+{
+	struct vip_fmt *fmt;
+	unsigned int index;
+
+	for (index = 0; index < port->num_active_fmt; index++) {
+		fmt = port->active_fmt[index];
+		if (fmt->code == code)
+			return fmt;
+	}
+
+	return NULL;
+}
+
+inline struct vip_port *notifier_to_vip_port(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct vip_port, notifier);
+}
+
+static bool vip_is_mbuscode_yuv(u32 code)
+{
+	return ((code & 0xff00) == 0x2000);
+}
+
+static bool vip_is_mbuscode_rgb(u32 code)
+{
+	return ((code & 0xff00) == 0x1000);
+}
+
+static bool vip_is_mbuscode_raw(u32 code)
+{
+	return ((code & 0xff00) == 0x3000);
+}
+
+/*
+ * This is not an accurate conversion but it is only used to
+ * assess if color conversion is needed.
+ */
+static u32 vip_mbus_code_to_fourcc(u32 code)
+{
+	if (vip_is_mbuscode_rgb(code))
+		return V4L2_PIX_FMT_RGB24;
+
+	if (vip_is_mbuscode_yuv(code))
+		return V4L2_PIX_FMT_UYVY;
+
+	return V4L2_PIX_FMT_SBGGR8;
+}
+
+static enum vip_csc_state
+vip_csc_direction(u32 src_code, const struct v4l2_format_info *dfinfo)
+{
+	if (vip_is_mbuscode_yuv(src_code) && v4l2_is_format_rgb(dfinfo))
+		return VIP_CSC_Y2R;
+	else if (vip_is_mbuscode_rgb(src_code) && v4l2_is_format_yuv(dfinfo))
+		return VIP_CSC_R2Y;
+	else
+		return VIP_CSC_NA;
+}
+
+/*
+ * Insert a masked field into a 32-bit field
+ */
+static void insert_field(u32 *valp, u32 field, u32 mask, int shift)
+{
+	u32 val = *valp;
+
+	val &= ~(mask << shift);
+	val |= (field & mask) << shift;
+	*valp = val;
+}
+
+/*
+ * Set the headers for all of the address/data block structures.
+ */
+static void init_adb_hdrs(struct vip_port *port)
+{
+	VIP_SET_MMR_ADB_HDR(port, sc_hdr0, sc_regs0,
+			    GET_OFFSET_TOP(port, port->dev->sc, CFG_SC0));
+	VIP_SET_MMR_ADB_HDR(port, sc_hdr8, sc_regs8,
+			    GET_OFFSET_TOP(port, port->dev->sc, CFG_SC8));
+	VIP_SET_MMR_ADB_HDR(port, sc_hdr17, sc_regs17,
+			    GET_OFFSET_TOP(port, port->dev->sc, CFG_SC17));
+	VIP_SET_MMR_ADB_HDR(port, csc_hdr, csc_regs,
+			    GET_OFFSET_TOP(port, port->dev->csc, CSC_CSC00));
+
+};
+
+static void vip_module_toggle(struct vip_dev *dev, uint32_t module, bool on)
+{
+	u32 val = 0;
+
+	val = reg_read(dev, VIP_CLK_RESET);
+
+	if (dev->slice_id == VIP_SLICE2)
+		module <<= 1;
+
+	if (on)
+		val |= module;
+	else
+		val &= ~module;
+
+	reg_write(dev, VIP_CLK_RESET, val);
+}
+
+/*
+ * Enable or disable the VIP clocks
+ */
+static void vip_set_clock_enable(struct vip_dev *dev, bool on)
+{
+	u32 val = 0;
+
+	val = reg_read(dev, VIP_CLK_ENABLE);
+	if (on) {
+		val |= VIP_VPDMA_CLK_ENABLE;
+		if (dev->slice_id == VIP_SLICE1)
+			val |= VIP_VIP1_DATA_PATH_CLK_ENABLE;
+		else
+			val |= VIP_VIP2_DATA_PATH_CLK_ENABLE;
+	} else {
+		if (dev->slice_id == VIP_SLICE1)
+			val &= ~VIP_VIP1_DATA_PATH_CLK_ENABLE;
+		else
+			val &= ~VIP_VIP2_DATA_PATH_CLK_ENABLE;
+
+		/* Both VIP are disabled then shutdown VPDMA also */
+		if (!(val & (VIP_VIP1_DATA_PATH_CLK_ENABLE |
+			     VIP_VIP2_DATA_PATH_CLK_ENABLE)))
+			val = 0;
+	}
+
+	reg_write(dev, VIP_CLK_ENABLE, val);
+}
+
+/* This helper function is used to enable the clock early on to
+ * enable vpdma firmware loading before the slice device are created
+ */
+static void vip_shared_set_clock_enable(struct vip_shared *shared, bool on)
+{
+	u32 val = 0;
+
+	val = VIP_VIP1_DATA_PATH_CLK_ENABLE | VIP_VPDMA_CLK_ENABLE;
+
+	reg_write(shared, VIP_CLK_ENABLE, val);
+}
+
+static void vip_top_reset(struct vip_dev *dev)
+{
+	u32 val = 0;
+
+	val = reg_read(dev, VIP_CLK_RESET);
+
+	if (dev->slice_id == VIP_SLICE1)
+		insert_field(&val, 1, VIP_DATA_PATH_CLK_RESET_MASK,
+			     VIP_VIP1_DATA_PATH_RESET_SHIFT);
+	else
+		insert_field(&val, 1, VIP_DATA_PATH_CLK_RESET_MASK,
+			     VIP_VIP2_DATA_PATH_RESET_SHIFT);
+
+	reg_write(dev, VIP_CLK_RESET, val);
+
+	usleep_range(200, 250);
+
+	val = reg_read(dev, VIP_CLK_RESET);
+
+	if (dev->slice_id == VIP_SLICE1)
+		insert_field(&val, 0, VIP_DATA_PATH_CLK_RESET_MASK,
+			     VIP_VIP1_DATA_PATH_RESET_SHIFT);
+	else
+		insert_field(&val, 0, VIP_DATA_PATH_CLK_RESET_MASK,
+			     VIP_VIP2_DATA_PATH_RESET_SHIFT);
+	reg_write(dev, VIP_CLK_RESET, val);
+}
+
+static void vip_top_vpdma_reset(struct vip_shared *shared)
+{
+	u32 val;
+
+	val = reg_read(shared, VIP_CLK_RESET);
+	insert_field(&val, 1, VIP_VPDMA_CLK_RESET_MASK,
+		     VIP_VPDMA_CLK_RESET_SHIFT);
+	reg_write(shared, VIP_CLK_RESET, val);
+
+	usleep_range(200, 250);
+
+	val = reg_read(shared, VIP_CLK_RESET);
+	insert_field(&val, 0, VIP_VPDMA_CLK_RESET_MASK,
+		     VIP_VPDMA_CLK_RESET_SHIFT);
+	reg_write(shared, VIP_CLK_RESET, val);
+}
+
+static void vip_set_pclk_invert(struct vip_port *port)
+{
+	struct vip_ctrl_module *ctrl = port->dev->syscon;
+	struct vip_dev *dev = port->dev;
+	u32 index;
+	/*
+	 * When the VIP parser is configured to so that the pixel clock
+	 * is to be sampled at falling edge, the pixel clock needs to be
+	 * inverted before it is given to the VIP module. This is done
+	 * by setting a bit in the CTRL_CORE_SMA_SW1 register.
+	 */
+
+	index = 2 * port->dev->slice_id + port->port_id;
+
+	v4l2_dbg(3, debug, &dev->v4l2_dev, "%s: slice%d:port%d -> index: %d\n", __func__,
+		 port->dev->slice_id, port->port_id, index);
+
+	if (ctrl->syscon_pol)
+		regmap_update_bits(ctrl->syscon_pol,
+				   ctrl->syscon_offset,
+				   ctrl->syscon_bit_field[index],
+				   ctrl->syscon_bit_field[index]);
+}
+
+static void vip_set_data_interface(struct vip_port *port,
+				   enum data_interface_modes mode)
+{
+	u32 val = 0;
+
+	insert_field(&val, mode, VIP_DATA_INTERFACE_MODE_MASK,
+		     VIP_DATA_INTERFACE_MODE_SHFT);
+
+	reg_write(port->dev->parser, VIP_PARSER_MAIN_CFG, val);
+}
+
+static void vip_set_slice_path(struct vip_dev *dev,
+			       enum data_path_select data_path, u32 path_val)
+{
+	u32 val = 0;
+	int data_path_reg;
+
+	data_path_reg = VIP_VIP1_DATA_PATH_SELECT + 4 * dev->slice_id;
+
+	switch (data_path) {
+	case ALL_FIELDS_DATA_SELECT:
+		val |= path_val;
+		break;
+	case VIP_CSC_SRC_DATA_SELECT:
+		insert_field(&val, path_val, VIP_CSC_SRC_SELECT_MASK,
+			     VIP_CSC_SRC_SELECT_SHFT);
+		break;
+	case VIP_SC_SRC_DATA_SELECT:
+		insert_field(&val, path_val, VIP_SC_SRC_SELECT_MASK,
+			     VIP_SC_SRC_SELECT_SHFT);
+		break;
+	case VIP_RGB_SRC_DATA_SELECT:
+		val |= (path_val) ? VIP_RGB_SRC_SELECT : 0;
+		break;
+	case VIP_RGB_OUT_LO_DATA_SELECT:
+		val |= (path_val) ? VIP_RGB_OUT_LO_SRC_SELECT : 0;
+		break;
+	case VIP_RGB_OUT_HI_DATA_SELECT:
+		val |= (path_val) ? VIP_RGB_OUT_HI_SRC_SELECT : 0;
+		break;
+	case VIP_CHR_DS_1_SRC_DATA_SELECT:
+		insert_field(&val, path_val, VIP_DS1_SRC_SELECT_MASK,
+			     VIP_DS1_SRC_SELECT_SHFT);
+		break;
+	case VIP_CHR_DS_2_SRC_DATA_SELECT:
+		insert_field(&val, path_val, VIP_DS2_SRC_SELECT_MASK,
+			     VIP_DS2_SRC_SELECT_SHFT);
+		break;
+	case VIP_MULTI_CHANNEL_DATA_SELECT:
+		val |= (path_val) ? VIP_MULTI_CHANNEL_SELECT : 0;
+		break;
+	case VIP_CHR_DS_1_DATA_BYPASS:
+		val |= (path_val) ? VIP_DS1_BYPASS : 0;
+		break;
+	case VIP_CHR_DS_2_DATA_BYPASS:
+		val |= (path_val) ? VIP_DS2_BYPASS : 0;
+		break;
+	default:
+		v4l2_err(&dev->v4l2_dev, "%s: data_path 0x%x is not valid\n",
+			 __func__, data_path);
+		return;
+	}
+	insert_field(&val, data_path, VIP_DATAPATH_SELECT_MASK,
+		     VIP_DATAPATH_SELECT_SHFT);
+	reg_write(dev, data_path_reg, val);
+	v4l2_dbg(3, debug, &dev->v4l2_dev, "%s: DATA_PATH_SELECT(%08X): %08X\n", __func__,
+		 data_path_reg, reg_read(dev, data_path_reg));
+}
+
+/*
+ * Return the vip_stream structure for a given struct file
+ */
+static inline struct vip_stream *file2stream(struct file *file)
+{
+	return video_drvdata(file);
+}
+
+/*
+ * Append a destination descriptor to the current descriptor list,
+ * setting up dma to the given srce.
+ */
+static int add_out_dtd(struct vip_stream *stream, int srce_type)
+{
+	struct vip_port *port = stream->port;
+	struct vip_dev *dev = port->dev;
+	struct vip_srce_info *sinfo = &srce_info[srce_type];
+	struct v4l2_rect *c_rect = &port->c_rect;
+	struct vip_fmt *fmt = port->fmt;
+	int channel, plane = 0;
+	int max_width, max_height;
+	dma_addr_t dma_addr = 0;
+	u32 flags;
+	u32 width = stream->width;
+
+	channel = sinfo->base_channel;
+
+	switch (srce_type) {
+	case VIP_SRCE_MULT_PORT:
+	case VIP_SRCE_MULT_ANC:
+		if (port->port_id == VIP_PORTB)
+			channel += VIP_CHAN_MULT_PORTB_OFFSET;
+		channel += stream->stream_id;
+		flags = 0;
+		break;
+	case VIP_SRCE_CHROMA:
+		plane = 1;
+		fallthrough;
+	case VIP_SRCE_LUMA:
+		if (port->port_id == VIP_PORTB) {
+			if (port->scaler && !port->fmt->coplanar)
+				/*
+				 * In this case Port A Chroma channel
+				 * is used to carry Port B scaled YUV422
+				 */
+				channel += 1;
+			else
+				channel += VIP_CHAN_YUV_PORTB_OFFSET;
+		}
+		flags = port->flags;
+		break;
+	case VIP_SRCE_RGB:
+		if (port->port_id == VIP_PORTB ||
+		    (port->port_id == VIP_PORTA &&
+		     port->csc == VIP_CSC_NA &&
+		     v4l2_is_format_rgb(port->fmt->finfo)))
+			/*
+			 * RGB sensor only connect to Y_LO
+			 * channel i.e. port B channel.
+			 */
+			channel += VIP_CHAN_RGB_PORTB_OFFSET;
+		flags = port->flags;
+		break;
+	default:
+		v4l2_err(&dev->v4l2_dev, "%s: srce_type 0x%x is not valid\n",
+			 __func__, srce_type);
+		return -1;
+	}
+
+	if (dev->slice_id == VIP_SLICE2)
+		channel += VIP_CHAN_VIP2_OFFSET;
+
+	if (port->fmt->vpdma_fmt[0] == &vpdma_raw_fmts[VPDMA_DATA_FMT_RAW8]) {
+		/*
+		 * Special case since we are faking a YUV422 16bit format
+		 * to have the vpdma perform the needed byte swap
+		 * we need to adjust the pixel width accordingly
+		 * otherwise the parser will attempt to collect more pixels
+		 * then available and the vpdma transfer will exceed the
+		 * allocated frame buffer.
+		 */
+		width >>= 1;
+		v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: 8 bit raw detected, adjusting width to %d\n",
+			 __func__, width);
+	}
+
+	/*
+	 * Use VPDMA_MAX_SIZE1 or VPDMA_MAX_SIZE2 register for slice0/1
+	 */
+
+	if (dev->slice_id == VIP_SLICE1) {
+		vpdma_set_max_size(dev->shared->vpdma, VPDMA_MAX_SIZE1,
+				   width, stream->height);
+
+		max_width = MAX_OUT_WIDTH_REG1;
+		max_height = MAX_OUT_HEIGHT_REG1;
+	} else if (dev->slice_id == VIP_SLICE2) {
+		vpdma_set_max_size(dev->shared->vpdma, VPDMA_MAX_SIZE2,
+				   width, stream->height);
+
+		max_width = MAX_OUT_WIDTH_REG2;
+		max_height = MAX_OUT_HEIGHT_REG2;
+	}
+
+	/*
+	 * Mark this channel to be cleared while cleaning up resources
+	 * This will make sure that an abort descriptor for this channel
+	 * would be submitted to VPDMA causing any ongoing  transaction to be
+	 * aborted and cleanup the VPDMA FSM for this channel
+	 */
+	stream->vpdma_channels[channel] = 1;
+
+	vpdma_rawchan_add_out_dtd(&stream->desc_list, c_rect->width,
+				  stream->bytesperline, c_rect,
+				  fmt->vpdma_fmt[plane], dma_addr,
+				  max_width, max_height, channel, flags);
+	return 0;
+}
+
+/*
+ * add_stream_dtds - prepares and starts DMA for pending transfers
+ */
+static void add_stream_dtds(struct vip_stream *stream)
+{
+	struct vip_port *port = stream->port;
+	int srce_type;
+
+	if (port->flags & FLAG_MULT_PORT)
+		srce_type = VIP_SRCE_MULT_PORT;
+	else if (port->flags & FLAG_MULT_ANC)
+		srce_type = VIP_SRCE_MULT_ANC;
+	else if (v4l2_is_format_rgb(port->fmt->finfo))
+		srce_type = VIP_SRCE_RGB;
+	else
+		srce_type = VIP_SRCE_LUMA;
+
+	add_out_dtd(stream, srce_type);
+
+	if (srce_type == VIP_SRCE_LUMA && port->fmt->coplanar)
+		add_out_dtd(stream, VIP_SRCE_CHROMA);
+}
+
+static void enable_irqs(struct vip_dev *dev, int irq_num, int list_num)
+{
+	struct vip_parser_data *parser = dev->parser;
+	u32 reg_addr = VIP_INT0_ENABLE0_SET +
+			VIP_INTC_INTX_OFFSET * irq_num;
+	u32 irq_val = (1 << (list_num * 2)) |
+		      (VIP_VIP1_PARSER_INT << (irq_num * 1));
+
+	/* Enable Parser Interrupt */
+	reg_write(parser, VIP_PARSER_FIQ_MASK, ~PARSER_IRQ_MASK);
+
+	reg_write(dev->shared, reg_addr, irq_val);
+
+	vpdma_enable_list_complete_irq(dev->shared->vpdma,
+				       irq_num, list_num, true);
+}
+
+static void disable_irqs(struct vip_dev *dev, int irq_num, int list_num)
+{
+	struct vip_parser_data *parser = dev->parser;
+	u32 reg_addr = VIP_INT0_ENABLE0_CLR +
+			VIP_INTC_INTX_OFFSET * irq_num;
+	u32 irq_val = (1 << (list_num * 2)) |
+		      (VIP_VIP1_PARSER_INT << (irq_num * 1));
+
+	/* Disable all Parser Interrupt */
+	reg_write(parser, VIP_PARSER_FIQ_MASK, 0xffffffff);
+
+	reg_write(dev->shared, reg_addr, irq_val);
+
+	vpdma_enable_list_complete_irq(dev->shared->vpdma,
+				       irq_num, list_num, false);
+}
+
+static void clear_irqs(struct vip_dev *dev, int irq_num, int list_num)
+{
+	struct vip_parser_data *parser = dev->parser;
+	u32 reg_addr = VIP_INT0_STATUS0_CLR +
+			VIP_INTC_INTX_OFFSET * irq_num;
+	u32 irq_val = (1 << (list_num * 2)) |
+		      (VIP_VIP1_PARSER_INT << (irq_num * 1));
+
+	/* Clear all Parser Interrupt */
+	reg_write(parser, VIP_PARSER_FIQ_CLR, 0xffffffff);
+	reg_write(parser, VIP_PARSER_FIQ_CLR, 0x0);
+
+	reg_write(dev->shared, reg_addr, irq_val);
+
+	vpdma_clear_list_stat(dev->shared->vpdma, irq_num, dev->slice_id);
+}
+
+static void populate_desc_list(struct vip_stream *stream)
+{
+	struct vip_port *port = stream->port;
+	struct vip_dev *dev = port->dev;
+	unsigned int list_length;
+
+	stream->desc_next = stream->desc_list.buf.addr;
+	add_stream_dtds(stream);
+
+	list_length = stream->desc_next - stream->desc_list.buf.addr;
+	vpdma_map_desc_buf(dev->shared->vpdma, &stream->desc_list.buf);
+}
+
+/*
+ * start_dma - adds descriptors to the dma list and submits them.
+ * Should be called after a new vb is queued and on a vpdma list
+ * completion interrupt.
+ */
+static void start_dma(struct vip_stream *stream, struct vip_buffer *buf)
+{
+	struct vip_dev *dev = stream->port->dev;
+	struct vpdma_data *vpdma = dev->shared->vpdma;
+	int list_num = stream->list_num;
+	dma_addr_t dma_addr;
+	int drop_data;
+
+	if (vpdma_list_busy(vpdma, list_num)) {
+		v4l2_err(&dev->v4l2_dev, "vpdma list busy, cannot post\n");
+		return;				/* nothing to do */
+	}
+
+	if (buf) {
+		dma_addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
+		drop_data = 0;
+		v4l2_dbg(4, debug, &dev->v4l2_dev, "%s: vb2 buf idx:%d, dma_addr:%pad\n",
+			 __func__, buf->vb.vb2_buf.index, &dma_addr);
+	} else {
+		dma_addr = 0;
+		drop_data = 1;
+		v4l2_dbg(4, debug, &dev->v4l2_dev, "%s: dropped\n", __func__);
+	}
+
+	vpdma_update_dma_addr(dev->shared->vpdma, &stream->desc_list,
+			      dma_addr, stream->write_desc, drop_data, 0);
+
+	if (stream->port->fmt->coplanar) {
+		dma_addr += stream->bytesperline * stream->height;
+		vpdma_update_dma_addr(dev->shared->vpdma, &stream->desc_list,
+				      dma_addr, stream->write_desc + 1,
+				      drop_data, 1);
+	}
+
+	vpdma_submit_descs(dev->shared->vpdma,
+			   &stream->desc_list, stream->list_num);
+}
+
+static void vip_schedule_next_buffer(struct vip_stream *stream)
+{
+	struct vip_dev *dev = stream->port->dev;
+	struct vip_buffer *buf;
+	unsigned long flags;
+
+	spin_lock_irqsave(&dev->slock, flags);
+	if (list_empty(&stream->vidq)) {
+		v4l2_dbg(4, debug, &dev->v4l2_dev, "Dropping frame\n");
+		if (list_empty(&stream->dropq)) {
+			v4l2_err(&dev->v4l2_dev, "No dropq buffer left!");
+			spin_unlock_irqrestore(&dev->slock, flags);
+			return;
+		}
+		buf = list_entry(stream->dropq.next,
+				 struct vip_buffer, list);
+
+		buf->drop = true;
+		list_move_tail(&buf->list, &stream->post_bufs);
+		buf = NULL;
+	} else {
+		buf = list_entry(stream->vidq.next,
+				 struct vip_buffer, list);
+		buf->drop = false;
+		list_move_tail(&buf->list, &stream->post_bufs);
+		v4l2_dbg(4, debug, &dev->v4l2_dev, "added next buffer\n");
+	}
+
+	spin_unlock_irqrestore(&dev->slock, flags);
+	start_dma(stream, buf);
+}
+
+static void vip_process_buffer_complete(struct vip_stream *stream)
+{
+	struct vip_dev *dev = stream->port->dev;
+	struct vip_buffer *buf;
+	struct vb2_v4l2_buffer *vb = NULL;
+	unsigned long flags, fld;
+
+	buf = list_first_entry(&stream->post_bufs, struct vip_buffer, list);
+
+	if (stream->port->flags & FLAG_INTERLACED) {
+		vpdma_unmap_desc_buf(dev->shared->vpdma,
+				     &stream->desc_list.buf);
+
+		fld = dtd_get_field(stream->write_desc);
+		stream->field = fld ? V4L2_FIELD_BOTTOM : V4L2_FIELD_TOP;
+
+		vpdma_map_desc_buf(dev->shared->vpdma, &stream->desc_list.buf);
+	}
+
+	if (buf) {
+		v4l2_dbg(4, debug, &dev->v4l2_dev, "vip buffer complete 0x%x, 0x%x\n",
+			 (unsigned int)buf, buf->drop);
+
+		vb = &buf->vb;
+		vb->sequence = stream->sequence;
+		vb->vb2_buf.timestamp = ktime_get_ns();
+		vb->field = V4L2_FIELD_NONE;
+
+		if (buf->drop) {
+			spin_lock_irqsave(&dev->slock, flags);
+			list_move_tail(&buf->list, &stream->dropq);
+			spin_unlock_irqrestore(&dev->slock, flags);
+		} else {
+			spin_lock_irqsave(&dev->slock, flags);
+			list_del(&buf->list);
+			spin_unlock_irqrestore(&dev->slock, flags);
+			vb2_buffer_done(&vb->vb2_buf, VB2_BUF_STATE_DONE);
+		}
+	} else {
+		v4l2_err(&dev->v4l2_dev, "%s: buf is null!!!\n", __func__);
+		return;
+	}
+
+	stream->sequence++;
+}
+
+static int vip_reset_vpdma(struct vip_stream *stream)
+{
+	struct vip_port *port = stream->port;
+	struct vip_dev *dev = port->dev;
+	struct vip_buffer *buf;
+	unsigned long flags;
+
+	stop_dma(stream, false);
+
+	spin_lock_irqsave(&dev->slock, flags);
+	/* requeue all active buffers in the opposite order */
+	while (!list_empty(&stream->post_bufs)) {
+		buf = list_last_entry(&stream->post_bufs,
+				      struct vip_buffer, list);
+		list_del(&buf->list);
+		if (buf->drop == 1) {
+			list_add_tail(&buf->list, &stream->dropq);
+			v4l2_dbg(4, debug, &dev->v4l2_dev, "requeueing drop buffer on dropq\n");
+		} else {
+			list_add(&buf->list, &stream->vidq);
+			v4l2_dbg(4, debug, &dev->v4l2_dev, "requeueing vb2 buf idx:%d on vidq\n",
+				 buf->vb.vb2_buf.index);
+		}
+	}
+	spin_unlock_irqrestore(&dev->slock, flags);
+
+	/* Make sure the desc_list is unmapped */
+	vpdma_unmap_desc_buf(dev->shared->vpdma, &stream->desc_list.buf);
+
+	return 0;
+}
+
+static void vip_overflow_recovery_work(struct work_struct *work)
+{
+	struct vip_stream *stream = container_of(work, struct vip_stream,
+						 recovery_work);
+	struct vip_port *port = stream->port;
+	struct vip_dev *dev = port->dev;
+
+	v4l2_err(&dev->v4l2_dev, "%s: Port %c\n", __func__,
+		 port->port_id == VIP_PORTA ? 'A' : 'B');
+
+	disable_irqs(dev, dev->slice_id, stream->list_num);
+	clear_irqs(dev, dev->slice_id, stream->list_num);
+
+	/* 1.	Set VIP_XTRA6_PORT_A[31:16] YUV_SRCNUM_STOP_IMMEDIATELY */
+	/* 2.	Set VIP_XTRA6_PORT_A[15:0] ANC_SRCNUM_STOP_IMMEDIATELY */
+	vip_parser_stop_imm(port, 1);
+
+	/* 3.	Clear VIP_PORT_A[8] ENABLE */
+	/*
+	 * 4.	Set VIP_PORT_A[7] CLR_ASYNC_FIFO_RD
+	 *      Set VIP_PORT_A[6] CLR_ASYNC_FIFO_WR
+	 */
+	vip_enable_parser(port, false);
+
+	/* 5.	Set VIP_PORT_A[23] SW_RESET */
+	vip_reset_parser(port, 1);
+
+	/*
+	 * 6.	Reset other VIP modules
+	 *	For each module used downstream of VIP_PARSER, write 1 to the
+	 *      bit location of the VIP_CLKC_RST register which is connected
+	 *      to VIP_PARSER
+	 */
+	vip_module_toggle(dev, VIP_DP_RST, true);
+
+	usleep_range(200, 250);
+
+	/*
+	 * 7.	Abort VPDMA channels
+	 *	Write to list attribute to stop list 0
+	 *	Write to list address register location of abort list
+	 *	Write to list attribute register list 0 and size of abort list
+	 */
+	vip_reset_vpdma(stream);
+
+	/* 8.	Clear VIP_PORT_A[23] SW_RESET */
+	vip_reset_parser(port, 0);
+
+	/*
+	 * 9.	Un-reset other VIP modules
+	 *	For each module used downstream of VIP_PARSER, write 0 to
+	 *	the bit location of the VIP_CLKC_RST register which is
+	 *	connected to VIP_PARSER
+	 */
+	vip_module_toggle(dev, VIP_DP_RST, false);
+
+	/* 10.	(Delay) */
+	/* 11.	SC coeff downloaded (if VIP_SCALER is being used) */
+	vip_setup_scaler(stream);
+
+	/* 12.	(Delay) */
+		/* the above are not needed here yet */
+
+	populate_desc_list(stream);
+	stream->num_recovery++;
+	if (stream->num_recovery < 5) {
+		/* Reload the vpdma */
+		vip_load_vpdma_list_fifo(stream);
+
+		enable_irqs(dev, dev->slice_id, stream->list_num);
+		vip_schedule_next_buffer(stream);
+
+		/* 13.	Clear VIP_XTRA6_PORT_A[31:16] YUV_SRCNUM_STOP_IMM */
+		/* 14.	Clear VIP_XTRA6_PORT_A[15:0] ANC_SRCNUM_STOP_IMM */
+
+		vip_parser_stop_imm(port, 0);
+
+		/* 15.	Set VIP_PORT_A[8] ENABLE */
+		/*
+		 * 16.	Clear VIP_PORT_A[7] CLR_ASYNC_FIFO_RD
+		 *	Clear VIP_PORT_A[6] CLR_ASYNC_FIFO_WR
+		 */
+		vip_enable_parser(port, true);
+	} else {
+		v4l2_err(&dev->v4l2_dev, "%s: num_recovery limit exceeded leaving disabled\n",
+			 __func__);
+	}
+}
+
+static void handle_parser_irqs(struct vip_dev *dev)
+{
+	struct vip_parser_data *parser = dev->parser;
+	struct vip_port *porta = dev->ports[VIP_PORTA];
+	struct vip_port *portb = dev->ports[VIP_PORTB];
+	struct vip_stream *stream = NULL;
+	u32 irq_stat = reg_read(parser, VIP_PARSER_FIQ_STATUS);
+	int i;
+
+	v4l2_dbg(3, debug, &dev->v4l2_dev, "%s: FIQ_STATUS: 0x%08x\n", __func__, irq_stat);
+
+	/* Clear all Parser Interrupt */
+	reg_write(parser, VIP_PARSER_FIQ_CLR, irq_stat);
+	reg_write(parser, VIP_PARSER_FIQ_CLR, 0x0);
+
+	#ifdef DEBUG
+	if (irq_stat & VIP_PORTA_VDET)
+		v4l2_dbg(3, debug, &dev->v4l2_dev, "VIP_PORTA_VDET\n");
+	if (irq_stat & VIP_PORTB_VDET)
+		v4l2_dbg(3, debug, &dev->v4l2_dev, "VIP_PORTB_VDET\n");
+	if (irq_stat & VIP_PORTA_ASYNC_FIFO_OF)
+		v4l2_err(&dev->v4l2_dev, "VIP_PORTA_ASYNC_FIFO_OF\n");
+	if (irq_stat & VIP_PORTB_ASYNC_FIFO_OF)
+		v4l2_err(&dev->v4l2_dev, "VIP_PORTB_ASYNC_FIFO_OF\n");
+	if (irq_stat & VIP_PORTA_OUTPUT_FIFO_YUV)
+		v4l2_err(&dev->v4l2_dev, "VIP_PORTA_OUTPUT_FIFO_YUV\n");
+	if (irq_stat & VIP_PORTA_OUTPUT_FIFO_ANC)
+		v4l2_err(&dev->v4l2_dev, "VIP_PORTA_OUTPUT_FIFO_ANC\n");
+	if (irq_stat & VIP_PORTB_OUTPUT_FIFO_YUV)
+		v4l2_err(&dev->v4l2_dev, "VIP_PORTB_OUTPUT_FIFO_YUV\n");
+	if (irq_stat & VIP_PORTB_OUTPUT_FIFO_ANC)
+		v4l2_err(&dev->v4l2_dev, "VIP_PORTB_OUTPUT_FIFO_ANC\n");
+	if (irq_stat & VIP_PORTA_CONN)
+		v4l2_dbg(3, debug, &dev->v4l2_dev, "VIP_PORTA_CONN\n");
+	if (irq_stat & VIP_PORTA_DISCONN)
+		v4l2_dbg(3, debug, &dev->v4l2_dev, "VIP_PORTA_DISCONN\n");
+	if (irq_stat & VIP_PORTB_CONN)
+		v4l2_dbg(3, debug, &dev->v4l2_dev, "VIP_PORTB_CONN\n");
+	if (irq_stat & VIP_PORTB_DISCONN)
+		v4l2_dbg(3, debug, &dev->v4l2_dev, "VIP_PORTB_DISCONN\n");
+	if (irq_stat & VIP_PORTA_SRC0_SIZE)
+		v4l2_dbg(3, debug, &dev->v4l2_dev, "VIP_PORTA_SRC0_SIZE\n");
+	if (irq_stat & VIP_PORTB_SRC0_SIZE)
+		v4l2_dbg(3, debug, &dev->v4l2_dev, "VIP_PORTB_SRC0_SIZE\n");
+	if (irq_stat & VIP_PORTA_YUV_PROTO_VIOLATION)
+		v4l2_dbg(3, debug, &dev->v4l2_dev, "VIP_PORTA_YUV_PROTO_VIOLATION\n");
+	if (irq_stat & VIP_PORTA_ANC_PROTO_VIOLATION)
+		v4l2_dbg(3, debug, &dev->v4l2_dev, "VIP_PORTA_ANC_PROTO_VIOLATION\n");
+	if (irq_stat & VIP_PORTB_YUV_PROTO_VIOLATION)
+		v4l2_dbg(3, debug, &dev->v4l2_dev, "VIP_PORTB_YUV_PROTO_VIOLATION\n");
+	if (irq_stat & VIP_PORTB_ANC_PROTO_VIOLATION)
+		v4l2_dbg(3, debug, &dev->v4l2_dev, "VIP_PORTB_ANC_PROTO_VIOLATION\n");
+	if (irq_stat & VIP_PORTA_CFG_DISABLE_COMPLETE)
+		v4l2_dbg(3, debug, &dev->v4l2_dev, "VIP_PORTA_CFG_DISABLE_COMPLETE\n");
+	if (irq_stat & VIP_PORTB_CFG_DISABLE_COMPLETE)
+		v4l2_dbg(3, debug, &dev->v4l2_dev, "VIP_PORTB_CFG_DISABLE_COMPLETE\n");
+	#endif
+
+	if (irq_stat & (VIP_PORTA_ASYNC_FIFO_OF |
+			VIP_PORTA_OUTPUT_FIFO_YUV |
+			VIP_PORTA_OUTPUT_FIFO_ANC)) {
+		for (i = 0; i < VIP_CAP_STREAMS_PER_PORT; i++) {
+			if (porta->cap_streams[i] &&
+			    porta->cap_streams[i]->port->port_id ==
+			    porta->port_id) {
+				stream = porta->cap_streams[i];
+				break;
+			}
+		}
+		if (stream) {
+			disable_irqs(dev, dev->slice_id,
+				     stream->list_num);
+			schedule_work(&stream->recovery_work);
+			return;
+		}
+	}
+	if (irq_stat & (VIP_PORTB_ASYNC_FIFO_OF |
+			VIP_PORTB_OUTPUT_FIFO_YUV |
+			VIP_PORTB_OUTPUT_FIFO_ANC)) {
+		for (i = 0; i < VIP_CAP_STREAMS_PER_PORT; i++) {
+			if (portb->cap_streams[i] &&
+			    portb->cap_streams[i]->port->port_id ==
+			    portb->port_id) {
+				stream = portb->cap_streams[i];
+				break;
+			}
+		}
+		if (stream) {
+			disable_irqs(dev, dev->slice_id,
+				     stream->list_num);
+			schedule_work(&stream->recovery_work);
+			return;
+		}
+	}
+}
+
+static irqreturn_t vip_irq(int irq_vip, void *data)
+{
+	struct vip_dev *dev = (struct vip_dev *)data;
+	struct vpdma_data *vpdma;
+	struct vip_stream *stream;
+	int list_num;
+	int irq_num = dev->slice_id;
+	u32 irqst, irqst_saved, reg_addr;
+
+	if (!dev->shared)
+		return IRQ_HANDLED;
+
+	vpdma = dev->shared->vpdma;
+	reg_addr = VIP_INT0_STATUS0 +
+			VIP_INTC_INTX_OFFSET * irq_num;
+	irqst_saved = reg_read(dev->shared, reg_addr);
+	irqst = irqst_saved;
+
+	v4l2_dbg(8, debug, &dev->v4l2_dev, "IRQ %d VIP_INT%d_STATUS0 0x%x\n",
+		 irq_vip, irq_num, irqst);
+	if (irqst) {
+		if (irqst & (VIP_VIP1_PARSER_INT << (irq_num * 1))) {
+			irqst &= ~(VIP_VIP1_PARSER_INT << (irq_num * 1));
+			handle_parser_irqs(dev);
+		}
+
+		for (list_num = 0; irqst && (list_num < 8);  list_num++) {
+			/* Check for LIST_COMPLETE IRQ */
+			if (!(irqst & (1 << list_num * 2)))
+				continue;
+
+			v4l2_dbg(8, debug, &dev->v4l2_dev, "IRQ %d: handling LIST%d_COMPLETE\n",
+				 irq_num, list_num);
+
+			stream = vpdma_hwlist_get_priv(vpdma, list_num);
+			if (!stream || stream->list_num != list_num) {
+				v4l2_err(&dev->v4l2_dev, "IRQ occurred for unused list");
+				continue;
+			}
+
+			vpdma_clear_list_stat(vpdma, irq_num, list_num);
+
+			vip_process_buffer_complete(stream);
+
+			vip_schedule_next_buffer(stream);
+
+			irqst &= ~((1 << list_num * 2));
+		}
+	}
+
+	/* Acknowledge that we are done with all interrupts */
+	reg_write(dev->shared, VIP_INTC_E0I, 1 << irq_num);
+
+	/* Clear handled events from status register */
+	reg_addr = VIP_INT0_STATUS0_CLR +
+		   VIP_INTC_INTX_OFFSET * irq_num;
+	reg_write(dev->shared, reg_addr, irqst_saved);
+
+	return IRQ_HANDLED;
+}
+
+/*
+ * video ioctls
+ */
+static int vip_querycap(struct file *file, void *priv,
+			struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, VIP_MODULE_NAME, sizeof(cap->driver));
+	strscpy(cap->card, VIP_MODULE_NAME, sizeof(cap->card));
+	return 0;
+}
+
+static int vip_enuminput(struct file *file, void *priv,
+			 struct v4l2_input *inp)
+{
+	struct vip_stream *stream = file2stream(file);
+
+	if (inp->index)
+		return -EINVAL;
+
+	inp->type = V4L2_INPUT_TYPE_CAMERA;
+	inp->std = stream->vfd->tvnorms;
+	sprintf(inp->name, "Camera %u", stream->vfd->num);
+
+	return 0;
+}
+
+static int vip_g_input(struct file *file, void *priv, unsigned int *i)
+{
+	*i = 0;
+	return 0;
+}
+
+static int vip_s_input(struct file *file, void *priv, unsigned int i)
+{
+	if (i != 0)
+		return -EINVAL;
+	return 0;
+}
+
+static int vip_querystd(struct file *file, void *fh, v4l2_std_id *std)
+{
+	struct vip_stream *stream = file2stream(file);
+	struct vip_port *port = stream->port;
+
+	*std = stream->vfd->tvnorms;
+	v4l2_subdev_call(port->subdev, video, querystd, std);
+	return 0;
+}
+
+static int vip_g_std(struct file *file, void *fh, v4l2_std_id *std)
+{
+	struct vip_stream *stream = file2stream(file);
+	struct vip_port *port = stream->port;
+
+	*std = stream->vfd->tvnorms;
+	v4l2_subdev_call(port->subdev, video, g_std, std);
+
+	return 0;
+}
+
+static int vip_s_std(struct file *file, void *fh, v4l2_std_id std)
+{
+	struct vip_stream *stream = file2stream(file);
+	struct vip_port *port = stream->port;
+
+	if (stream->vfd->tvnorms == std)
+		return 0;
+
+	if (vb2_is_busy(&stream->vb_vidq))
+		return -EBUSY;
+
+	if (!(std & stream->vfd->tvnorms))
+		return -EINVAL;
+
+	v4l2_subdev_call(port->subdev, video, s_std, std);
+	return 0;
+}
+
+static int vip_enum_fmt_vid_cap(struct file *file, void *priv,
+				struct v4l2_fmtdesc *f)
+{
+	struct vip_stream *stream = file2stream(file);
+	struct vip_port *port = stream->port;
+	struct vip_fmt *fmt;
+
+	if (f->index >= port->num_active_fmt)
+		return -EINVAL;
+
+	fmt = port->active_fmt[f->index];
+	f->pixelformat = fmt->fourcc;
+
+	return 0;
+}
+
+static int vip_enum_framesizes(struct file *file, void *priv,
+			       struct v4l2_frmsizeenum *f)
+{
+	struct vip_stream *stream = file2stream(file);
+	struct vip_port *port = stream->port;
+	struct vip_dev *dev = port->dev;
+	struct vip_fmt *fmt;
+	int ret;
+	struct v4l2_subdev_frame_size_enum fse = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = 0,
+	};
+
+	fmt = find_port_format_by_pix(port, f->pixel_format);
+	if (!fmt)
+		return -EINVAL;
+
+	fse.index = f->index;
+	fse.code = fmt->code;
+	ret = v4l2_subdev_call(port->subdev, pad, enum_frame_size, NULL, &fse);
+	if (ret)
+		return -EINVAL;
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: index: %d code: %x W:[%d,%d] H:[%d,%d]\n",
+		 __func__, fse.index, fse.code, fse.min_width, fse.max_width,
+		 fse.min_height, fse.max_height);
+
+	f->type = V4L2_FRMSIZE_TYPE_DISCRETE;
+	f->discrete.width = fse.max_width;
+	f->discrete.height = fse.max_height;
+
+	return 0;
+}
+
+static int vip_enum_frameintervals(struct file *file, void *priv,
+				   struct v4l2_frmivalenum *f)
+{
+	struct vip_stream *stream = file2stream(file);
+	struct vip_port *port = stream->port;
+	struct vip_fmt *fmt;
+	struct v4l2_subdev_frame_interval_enum fie = {
+		.index = f->index,
+		.width = f->width,
+		.height = f->height,
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	int ret;
+
+	fmt = find_port_format_by_pix(port, f->pixel_format);
+	if (!fmt)
+		return -EINVAL;
+
+	fie.code = fmt->code;
+	ret = v4l2_subdev_call(port->subdev, pad, enum_frame_interval,
+			       NULL, &fie);
+	if (ret)
+		return ret;
+	f->type = V4L2_FRMIVAL_TYPE_DISCRETE;
+	f->discrete = fie.interval;
+
+	return 0;
+}
+
+static int vip_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+{
+	struct vip_stream *stream = video_drvdata(file);
+	struct vip_port *port = stream->port;
+
+	return v4l2_g_parm_cap(video_devdata(file), port->subdev, a);
+}
+
+static int vip_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+{
+	struct vip_stream *stream = video_drvdata(file);
+	struct vip_port *port = stream->port;
+
+	return v4l2_s_parm_cap(video_devdata(file), port->subdev, a);
+}
+
+static int vip_calc_format_size(struct vip_port *port,
+				struct vip_fmt *fmt,
+				struct v4l2_format *f)
+{
+	enum v4l2_field *field;
+	unsigned int stride;
+	struct vip_dev *dev = port->dev;
+
+	if (!fmt) {
+		v4l2_dbg(2, debug, &dev->v4l2_dev,
+			 "no vip_fmt format provided!\n");
+		return -EINVAL;
+	}
+
+	field = &f->fmt.pix.field;
+	if (*field == V4L2_FIELD_ANY)
+		*field = V4L2_FIELD_NONE;
+	else if (V4L2_FIELD_NONE != *field && V4L2_FIELD_ALTERNATE != *field)
+		return -EINVAL;
+
+	v4l_bound_align_image(&f->fmt.pix.width, MIN_W, MAX_W, W_ALIGN,
+			      &f->fmt.pix.height, MIN_H, MAX_H, H_ALIGN,
+			      S_ALIGN);
+
+	stride = f->fmt.pix.width * (fmt->vpdma_fmt[0]->depth >> 3);
+	f->fmt.pix.bytesperline = ALIGN(stride, VPDMA_STRIDE_ALIGN);
+
+	f->fmt.pix.sizeimage = f->fmt.pix.height * f->fmt.pix.bytesperline;
+	if (fmt->coplanar) {
+		f->fmt.pix.sizeimage += f->fmt.pix.height *
+					f->fmt.pix.bytesperline *
+					fmt->vpdma_fmt[VIP_CHROMA]->depth >> 3;
+	}
+
+	f->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
+
+	v4l2_dbg(3, debug, &dev->v4l2_dev, "calc_format_size: fourcc:%s size: %dx%d bpl:%d img_size:%d\n",
+		 fourcc_to_str(f->fmt.pix.pixelformat),
+		 f->fmt.pix.width, f->fmt.pix.height,
+		 f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
+
+	return 0;
+}
+
+static inline bool vip_is_size_dma_aligned(u32 bpp, u32 width)
+{
+	return ((width * bpp) == ALIGN(width * bpp, VPDMA_STRIDE_ALIGN));
+}
+
+static int vip_try_fmt_vid_cap(struct file *file, void *priv,
+			       struct v4l2_format *f)
+{
+	struct vip_stream *stream = file2stream(file);
+	struct vip_port *port = stream->port;
+	struct vip_dev *dev = port->dev;
+	struct vip_fmt *fmt;
+	u32 best_width, best_height, largest_width, largest_height;
+	int ret, found;
+	enum vip_csc_state csc_direction;
+	struct v4l2_subdev_frame_size_enum fse = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = 0,
+	};
+
+	fmt = find_port_format_by_pix(port, f->fmt.pix.pixelformat);
+	if (!fmt) {
+		/* Just get the first one enumerated */
+		fmt = port->active_fmt[0];
+		f->fmt.pix.pixelformat = fmt->fourcc;
+	}
+
+	csc_direction =  vip_csc_direction(fmt->code, fmt->finfo);
+	if (csc_direction != VIP_CSC_NA) {
+		if (!is_csc_available(port)) {
+			v4l2_dbg(2, debug, &dev->v4l2_dev,
+				 "CSC not available for Fourcc format (0x%08x).\n",
+				 f->fmt.pix.pixelformat);
+
+			/* Just get the first one enumerated */
+			fmt = port->active_fmt[0];
+			f->fmt.pix.pixelformat = fmt->fourcc;
+			/* re-evaluate the csc_direction here */
+			csc_direction =  vip_csc_direction(fmt->code,
+							   fmt->finfo);
+		} else {
+			v4l2_dbg(3, debug, &dev->v4l2_dev, "CSC active on Port %c: going %s\n",
+				 port->port_id == VIP_PORTA ? 'A' : 'B',
+				 (csc_direction == VIP_CSC_Y2R) ? "Y2R" : "R2Y");
+		}
+	}
+
+	/*
+	 * Given that sensors might support multiple mbus code we need
+	 * to use the one that matches the requested pixel format
+	 */
+	port->try_mbus_framefmt = port->mbus_framefmt;
+	port->try_mbus_framefmt.code = fmt->code;
+
+	/* check for/find a valid width/height */
+	ret = 0;
+	found = false;
+	best_width = 0;
+	best_height = 0;
+	largest_width = 0;
+	largest_height = 0;
+
+	fse.code = fmt->code;
+	for (fse.index = 0; ; fse.index++) {
+		u32 bpp = fmt->vpdma_fmt[0]->depth >> 3;
+
+		ret = v4l2_subdev_call(port->subdev, pad,
+				       enum_frame_size, NULL, &fse);
+		if (ret)
+			break;
+
+		if (!vip_is_size_dma_aligned(bpp, fse.max_width))
+			continue;
+
+		if (fse.max_width >= largest_width &&
+		    fse.max_height >= largest_height) {
+			v4l2_dbg(3, debug, &dev->v4l2_dev, "try_fmt loop:%d found new larger: %dx%d\n",
+				 fse.index, fse.max_width, fse.max_height);
+			largest_width = fse.max_width;
+			largest_height = fse.max_height;
+		}
+
+		if (fse.max_width >= f->fmt.pix.width &&
+		    fse.max_height >= f->fmt.pix.height) {
+			v4l2_dbg(3, debug, &dev->v4l2_dev, "try_fmt loop:%d found at least larger: %dx%d\n",
+				 fse.index, fse.max_width, fse.max_height);
+
+			if (!best_width ||
+			    ((abs(best_width - f->fmt.pix.width) >=
+			      abs(fse.max_width - f->fmt.pix.width)) &&
+			     (abs(best_height - f->fmt.pix.height) >=
+			      abs(fse.max_height - f->fmt.pix.height)))) {
+				best_width = fse.max_width;
+				best_height = fse.max_height;
+				v4l2_dbg(3, debug, &dev->v4l2_dev, "try_fmt loop:%d found new best: %dx%d\n",
+					 fse.index, fse.max_width,
+					 fse.max_height);
+			}
+		}
+
+		if (f->fmt.pix.width == fse.max_width &&
+		    f->fmt.pix.height == fse.max_height) {
+			found = true;
+			v4l2_dbg(3, debug, &dev->v4l2_dev, "try_fmt loop:%d found direct match: %dx%d\n",
+				 fse.index, fse.max_width,
+				 fse.max_height);
+			break;
+		}
+
+		if (f->fmt.pix.width >= fse.min_width &&
+		    f->fmt.pix.width <= fse.max_width &&
+		    f->fmt.pix.height >= fse.min_height &&
+		    f->fmt.pix.height <= fse.max_height) {
+			found = true;
+			v4l2_dbg(3, debug, &dev->v4l2_dev, "try_fmt loop:%d found direct range match: %dx%d\n",
+				 fse.index, fse.max_width,
+				 fse.max_height);
+			break;
+		}
+	}
+
+	if (found) {
+		port->try_mbus_framefmt.width = f->fmt.pix.width;
+		port->try_mbus_framefmt.height = f->fmt.pix.height;
+		/* No need to check for scaling */
+		goto calc_size;
+	} else if (f->fmt.pix.width > largest_width) {
+		port->try_mbus_framefmt.width = largest_width;
+		port->try_mbus_framefmt.height = largest_height;
+	} else if (best_width) {
+		port->try_mbus_framefmt.width = best_width;
+		port->try_mbus_framefmt.height = best_height;
+	} else {
+		/* use existing values as default */
+	}
+
+	v4l2_dbg(3, debug, &dev->v4l2_dev, "try_fmt best subdev size: %dx%d\n",
+		 port->try_mbus_framefmt.width,
+		 port->try_mbus_framefmt.height);
+
+	if (is_scaler_available(port) &&
+	    csc_direction != VIP_CSC_Y2R &&
+	    !vip_is_mbuscode_raw(fmt->code) &&
+	    f->fmt.pix.height <= port->try_mbus_framefmt.height &&
+	    port->try_mbus_framefmt.height <= SC_MAX_PIXEL_HEIGHT &&
+	    port->try_mbus_framefmt.width <= SC_MAX_PIXEL_WIDTH) {
+		/*
+		 * Scaler is only accessible if the dst colorspace is YUV.
+		 * As the input to the scaler must be in YUV mode only.
+		 *
+		 * Scaling up is allowed only horizontally.
+		 */
+		unsigned int hratio, vratio, width_align, height_align;
+		u32 bpp = fmt->vpdma_fmt[0]->depth >> 3;
+
+		v4l2_dbg(3, debug, &dev->v4l2_dev, "Scaler active on Port %c: requesting %dx%d\n",
+			 port->port_id == VIP_PORTA ? 'A' : 'B',
+			 f->fmt.pix.width, f->fmt.pix.height);
+
+		/* Just make sure everything is properly aligned */
+		width_align = ALIGN(f->fmt.pix.width * bpp, VPDMA_STRIDE_ALIGN);
+		width_align /= bpp;
+		height_align = ALIGN(f->fmt.pix.height, 2);
+
+		f->fmt.pix.width = width_align;
+		f->fmt.pix.height = height_align;
+
+		hratio = f->fmt.pix.width * 1000 /
+			 port->try_mbus_framefmt.width;
+		vratio = f->fmt.pix.height * 1000 /
+			 port->try_mbus_framefmt.height;
+		if (hratio < 125) {
+			f->fmt.pix.width = port->try_mbus_framefmt.width / 8;
+			v4l2_dbg(3, debug, &dev->v4l2_dev, "Horizontal scaling ratio out of range adjusting -> %d\n",
+				 f->fmt.pix.width);
+		}
+
+		if (vratio < 188) {
+			f->fmt.pix.height = port->try_mbus_framefmt.height / 4;
+			v4l2_dbg(3, debug, &dev->v4l2_dev, "Vertical scaling ratio out of range adjusting -> %d\n",
+				 f->fmt.pix.height);
+		}
+		v4l2_dbg(3, debug, &dev->v4l2_dev, "Scaler: got %dx%d\n",
+			 f->fmt.pix.width, f->fmt.pix.height);
+	} else {
+		/* use existing values as default */
+		f->fmt.pix.width = port->try_mbus_framefmt.width;
+		f->fmt.pix.height = port->try_mbus_framefmt.height;
+	}
+
+calc_size:
+	/* That we have a fmt calculate imagesize and bytesperline */
+	return vip_calc_format_size(port, fmt, f);
+}
+
+static int vip_g_fmt_vid_cap(struct file *file, void *priv,
+			     struct v4l2_format *f)
+{
+	struct vip_stream *stream = file2stream(file);
+	struct vip_port *port = stream->port;
+
+	/* Use last known values or defaults */
+	f->fmt.pix.width	= stream->width;
+	f->fmt.pix.height	= stream->height;
+	f->fmt.pix.pixelformat	= port->fmt->fourcc;
+	f->fmt.pix.field	= stream->sup_field;
+	f->fmt.pix.colorspace   = V4L2_COLORSPACE_SRGB;
+	f->fmt.pix.bytesperline	= stream->bytesperline;
+	f->fmt.pix.sizeimage	= stream->sizeimage;
+
+	return 0;
+}
+
+static int vip_s_fmt_vid_cap(struct file *file, void *priv,
+			     struct v4l2_format *f)
+{
+	struct vip_stream *stream = file2stream(file);
+	struct vip_port *port = stream->port;
+	struct vip_dev *dev = port->dev;
+	struct v4l2_subdev_format sfmt;
+	struct v4l2_mbus_framefmt *mf;
+	enum vip_csc_state csc_direction;
+	int ret;
+
+	if (vb2_is_busy(&stream->vb_vidq)) {
+		v4l2_err(&dev->v4l2_dev, "%s queue busy\n", __func__);
+		return -EBUSY;
+	}
+
+	ret = vip_try_fmt_vid_cap(file, priv, f);
+	if (ret)
+		return ret;
+
+	/*
+	 * Check if we need the scaler or not
+	 *
+	 * Since on previous S_FMT call the scaler might have been
+	 * allocated if it is not needed in this instance we will
+	 * attempt to free it just in case.
+	 *
+	 * free_scaler() is harmless unless the current port
+	 * allocated it.
+	 */
+	if (f->fmt.pix.width == port->try_mbus_framefmt.width &&
+	    f->fmt.pix.height == port->try_mbus_framefmt.height)
+		free_scaler(port);
+	else
+		allocate_scaler(port);
+
+	port->fmt = find_port_format_by_pix(port,
+					    f->fmt.pix.pixelformat);
+	stream->width		= f->fmt.pix.width;
+	stream->height		= f->fmt.pix.height;
+	stream->bytesperline	= f->fmt.pix.bytesperline;
+	stream->sizeimage	= f->fmt.pix.sizeimage;
+	stream->sup_field	= f->fmt.pix.field;
+	stream->field		= f->fmt.pix.field;
+
+	port->c_rect.left	= 0;
+	port->c_rect.top	= 0;
+	port->c_rect.width	= stream->width;
+	port->c_rect.height	= stream->height;
+
+	/*
+	 * Check if we need the csc unit or not
+	 *
+	 * Since on previous S_FMT call, the csc might have been
+	 * allocated if it is not needed in this instance we will
+	 * attempt to free it just in case.
+	 *
+	 * free_csc() is harmless unless the current port
+	 * allocated it.
+	 */
+	csc_direction =  vip_csc_direction(port->fmt->code, port->fmt->finfo);
+	if (csc_direction == VIP_CSC_NA)
+		free_csc(port);
+	else
+		allocate_csc(port, csc_direction);
+
+	if (stream->sup_field == V4L2_FIELD_ALTERNATE)
+		port->flags |= FLAG_INTERLACED;
+	else
+		port->flags &= ~FLAG_INTERLACED;
+
+	memset(&sfmt, 0, sizeof(sfmt));
+	mf = &sfmt.format;
+	v4l2_fill_mbus_format(mf, &f->fmt.pix, port->fmt->code);
+	/* Make sure to use the subdev size found in the try_fmt */
+	mf->width = port->try_mbus_framefmt.width;
+	mf->height = port->try_mbus_framefmt.height;
+
+	sfmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	sfmt.pad = 0;
+	ret = v4l2_subdev_call(port->subdev, pad, set_fmt, NULL, &sfmt);
+	if (ret) {
+		v4l2_dbg(1, debug, &dev->v4l2_dev, "set_fmt failed in subdev\n");
+		return ret;
+	}
+
+	/* Save it */
+	port->mbus_framefmt = *mf;
+
+	v4l2_dbg(3, debug, &dev->v4l2_dev, "s_fmt subdev fmt mbus_code: %04X size: %dx%d\n",
+		 port->mbus_framefmt.code,
+		 port->mbus_framefmt.width, port->mbus_framefmt.height);
+
+	return 0;
+}
+
+/*
+ * Does the exact opposite of set_fmt_params
+ * It makes sure the DataPath register is sane after tear down
+ */
+static void unset_fmt_params(struct vip_stream *stream)
+{
+	struct vip_dev *dev = stream->port->dev;
+	struct vip_port *port = stream->port;
+
+	stream->sequence = 0;
+	stream->field = V4L2_FIELD_TOP;
+
+	if (port->csc == VIP_CSC_Y2R) {
+		if (port->port_id == VIP_PORTA) {
+			vip_set_slice_path(dev, VIP_CSC_SRC_DATA_SELECT, 0);
+			vip_set_slice_path(dev,
+					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
+			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
+			vip_set_slice_path(dev, VIP_RGB_SRC_DATA_SELECT, 0);
+		} else {
+			vip_set_slice_path(dev, VIP_CSC_SRC_DATA_SELECT, 0);
+			vip_set_slice_path(dev,
+					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
+			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
+		}
+		/* We are done */
+		return;
+	} else if (port->csc == VIP_CSC_R2Y) {
+		if (port->scaler && port->fmt->coplanar) {
+			if (port->port_id == VIP_PORTA) {
+				vip_set_slice_path(dev,
+						   VIP_CSC_SRC_DATA_SELECT, 0);
+				vip_set_slice_path(dev,
+						   VIP_SC_SRC_DATA_SELECT, 0);
+				vip_set_slice_path(dev,
+						   VIP_CHR_DS_1_SRC_DATA_SELECT,
+						   0);
+				vip_set_slice_path(dev,
+						   VIP_CHR_DS_1_DATA_BYPASS, 0);
+				vip_set_slice_path(dev,
+						   VIP_RGB_OUT_HI_DATA_SELECT,
+						   0);
+			}
+		} else if (port->scaler) {
+			if (port->port_id == VIP_PORTA) {
+				vip_set_slice_path(dev,
+						   VIP_CSC_SRC_DATA_SELECT, 0);
+				vip_set_slice_path(dev,
+						   VIP_SC_SRC_DATA_SELECT, 0);
+				vip_set_slice_path(dev,
+						   VIP_CHR_DS_1_SRC_DATA_SELECT,
+						   0);
+				vip_set_slice_path(dev,
+						   VIP_CHR_DS_1_DATA_BYPASS, 0);
+				vip_set_slice_path(dev,
+						   VIP_RGB_OUT_HI_DATA_SELECT,
+						   0);
+			}
+		} else if (port->fmt->coplanar) {
+			if (port->port_id == VIP_PORTA) {
+				vip_set_slice_path(dev,
+						   VIP_CSC_SRC_DATA_SELECT, 0);
+				vip_set_slice_path(dev,
+						   VIP_CHR_DS_1_SRC_DATA_SELECT,
+						   0);
+				vip_set_slice_path(dev,
+						   VIP_CHR_DS_1_DATA_BYPASS, 0);
+				vip_set_slice_path(dev,
+						   VIP_RGB_OUT_HI_DATA_SELECT,
+						   0);
+			}
+		} else {
+			if (port->port_id == VIP_PORTA) {
+				vip_set_slice_path(dev,
+						   VIP_CSC_SRC_DATA_SELECT, 0);
+				vip_set_slice_path(dev,
+						   VIP_CHR_DS_1_SRC_DATA_SELECT,
+						   0);
+				vip_set_slice_path(dev,
+						   VIP_CHR_DS_1_DATA_BYPASS, 0);
+				vip_set_slice_path(dev,
+						   VIP_RGB_OUT_HI_DATA_SELECT,
+						   0);
+			}
+		}
+		/* We are done */
+		return;
+	} else if (v4l2_is_format_rgb(port->fmt->finfo)) {
+		if (port->port_id == VIP_PORTA) {
+			vip_set_slice_path(dev,
+					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
+			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
+		}
+		/* We are done */
+		return;
+	}
+
+	if (port->scaler && port->fmt->coplanar) {
+		if (port->port_id == VIP_PORTA) {
+			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 0);
+			vip_set_slice_path(dev,
+					   VIP_CHR_DS_1_SRC_DATA_SELECT, 0);
+			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
+			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
+		} else {
+			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 0);
+			vip_set_slice_path(dev,
+					   VIP_CHR_DS_2_SRC_DATA_SELECT, 0);
+			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
+			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
+			vip_set_slice_path(dev,
+					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
+		}
+	} else if (port->scaler) {
+		if (port->port_id == VIP_PORTA) {
+			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 0);
+			vip_set_slice_path(dev,
+					   VIP_CHR_DS_1_SRC_DATA_SELECT, 0);
+			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
+			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
+		} else {
+			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 0);
+			vip_set_slice_path(dev,
+					   VIP_CHR_DS_2_SRC_DATA_SELECT, 0);
+			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
+			vip_set_slice_path(dev, VIP_CHR_DS_2_DATA_BYPASS, 0);
+			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
+		}
+	} else if (port->fmt->coplanar) {
+		if (port->port_id == VIP_PORTA) {
+			vip_set_slice_path(dev,
+					   VIP_CHR_DS_1_SRC_DATA_SELECT, 0);
+			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
+			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
+		} else {
+			vip_set_slice_path(dev,
+					   VIP_CHR_DS_2_SRC_DATA_SELECT, 0);
+			vip_set_slice_path(dev, VIP_CHR_DS_2_DATA_BYPASS, 0);
+			vip_set_slice_path(dev,
+					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
+			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
+		}
+	} else {
+		/*
+		 * We undo all data path setting except for the multi
+		 * stream case.
+		 * Because we cannot disrupt other on-going capture if only
+		 * one stream is terminated the other might still be going
+		 */
+		vip_set_slice_path(dev, VIP_MULTI_CHANNEL_DATA_SELECT, 1);
+		vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
+	}
+}
+
+/*
+ * Set the registers that are modified when the video format changes.
+ */
+static void set_fmt_params(struct vip_stream *stream)
+{
+	struct vip_dev *dev = stream->port->dev;
+	struct vip_port *port = stream->port;
+
+	stream->sequence = 0;
+	stream->field = V4L2_FIELD_TOP;
+
+	if (port->csc == VIP_CSC_Y2R) {
+		port->flags &= ~FLAG_MULT_PORT;
+		/* Set alpha component in background color */
+		vpdma_set_bg_color(dev->shared->vpdma,
+				   (struct vpdma_data_format *)
+				   port->fmt->vpdma_fmt[0],
+				   0xff);
+		if (port->port_id == VIP_PORTA) {
+			vip_set_slice_path(dev, VIP_CSC_SRC_DATA_SELECT, 1);
+			vip_set_slice_path(dev,
+					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
+			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 1);
+			vip_set_slice_path(dev, VIP_RGB_SRC_DATA_SELECT, 1);
+		} else {
+			vip_set_slice_path(dev, VIP_CSC_SRC_DATA_SELECT, 2);
+			vip_set_slice_path(dev,
+					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
+			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 1);
+		}
+		/* We are done */
+		return;
+	} else if (port->csc == VIP_CSC_R2Y) {
+		port->flags &= ~FLAG_MULT_PORT;
+		if (port->scaler && port->fmt->coplanar) {
+			if (port->port_id == VIP_PORTA) {
+				vip_set_slice_path(dev,
+						   VIP_CSC_SRC_DATA_SELECT, 4);
+				vip_set_slice_path(dev,
+						   VIP_SC_SRC_DATA_SELECT, 1);
+				vip_set_slice_path(dev,
+						   VIP_CHR_DS_1_SRC_DATA_SELECT,
+						   1);
+				vip_set_slice_path(dev,
+						   VIP_CHR_DS_1_DATA_BYPASS, 0);
+				vip_set_slice_path(dev,
+						   VIP_RGB_OUT_HI_DATA_SELECT,
+						   0);
+			} else {
+				v4l2_err(&dev->v4l2_dev, "RGB sensor can only be on Port A\n");
+			}
+		} else if (port->scaler) {
+			if (port->port_id == VIP_PORTA) {
+				vip_set_slice_path(dev,
+						   VIP_CSC_SRC_DATA_SELECT, 4);
+				vip_set_slice_path(dev,
+						   VIP_SC_SRC_DATA_SELECT, 1);
+				vip_set_slice_path(dev,
+						   VIP_CHR_DS_1_SRC_DATA_SELECT,
+						   1);
+				vip_set_slice_path(dev,
+						   VIP_CHR_DS_1_DATA_BYPASS, 1);
+				vip_set_slice_path(dev,
+						   VIP_RGB_OUT_HI_DATA_SELECT,
+						   0);
+			} else {
+				v4l2_err(&dev->v4l2_dev, "RGB sensor can only be on Port A\n");
+			}
+		} else if (port->fmt->coplanar) {
+			if (port->port_id == VIP_PORTA) {
+				vip_set_slice_path(dev,
+						   VIP_CSC_SRC_DATA_SELECT, 4);
+				vip_set_slice_path(dev,
+						   VIP_CHR_DS_1_SRC_DATA_SELECT,
+						   2);
+				vip_set_slice_path(dev,
+						   VIP_CHR_DS_1_DATA_BYPASS, 0);
+				vip_set_slice_path(dev,
+						   VIP_RGB_OUT_HI_DATA_SELECT,
+						   0);
+			} else {
+				v4l2_err(&dev->v4l2_dev, "RGB sensor can only be on Port A\n");
+			}
+		} else {
+			if (port->port_id == VIP_PORTA) {
+				vip_set_slice_path(dev,
+						   VIP_CSC_SRC_DATA_SELECT, 4);
+				vip_set_slice_path(dev,
+						   VIP_CHR_DS_1_SRC_DATA_SELECT,
+						   2);
+				vip_set_slice_path(dev,
+						   VIP_CHR_DS_1_DATA_BYPASS, 1);
+				vip_set_slice_path(dev,
+						   VIP_RGB_OUT_HI_DATA_SELECT,
+						   0);
+			} else {
+				v4l2_err(&dev->v4l2_dev, "RGB sensor can only be on Port A\n");
+			}
+		}
+		/* We are done */
+		return;
+	} else if (v4l2_is_format_rgb(port->fmt->finfo)) {
+		port->flags &= ~FLAG_MULT_PORT;
+		/* Set alpha component in background color */
+		vpdma_set_bg_color(dev->shared->vpdma,
+				   (struct vpdma_data_format *)
+				   port->fmt->vpdma_fmt[0],
+				   0xff);
+		if (port->port_id == VIP_PORTA) {
+			vip_set_slice_path(dev,
+					   VIP_MULTI_CHANNEL_DATA_SELECT, 1);
+			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 1);
+		} else {
+			v4l2_err(&dev->v4l2_dev, "RGB sensor can only be on Port A\n");
+		}
+		/* We are done */
+		return;
+	}
+
+	if (port->scaler && port->fmt->coplanar) {
+		port->flags &= ~FLAG_MULT_PORT;
+		if (port->port_id == VIP_PORTA) {
+			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 2);
+			vip_set_slice_path(dev,
+					   VIP_CHR_DS_1_SRC_DATA_SELECT, 1);
+			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
+			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
+		} else {
+			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 3);
+			vip_set_slice_path(dev,
+					   VIP_CHR_DS_2_SRC_DATA_SELECT, 1);
+			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
+			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
+			vip_set_slice_path(dev,
+					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
+		}
+	} else if (port->scaler) {
+		port->flags &= ~FLAG_MULT_PORT;
+		if (port->port_id == VIP_PORTA) {
+			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 2);
+			vip_set_slice_path(dev,
+					   VIP_CHR_DS_1_SRC_DATA_SELECT, 1);
+			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 1);
+			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
+		} else {
+			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 3);
+			vip_set_slice_path(dev,
+					   VIP_CHR_DS_2_SRC_DATA_SELECT, 1);
+			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 1);
+			vip_set_slice_path(dev, VIP_CHR_DS_2_DATA_BYPASS, 1);
+			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
+		}
+	} else if (port->fmt->coplanar) {
+		port->flags &= ~FLAG_MULT_PORT;
+		if (port->port_id == VIP_PORTA) {
+			vip_set_slice_path(dev,
+					   VIP_CHR_DS_1_SRC_DATA_SELECT, 3);
+			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
+			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
+		} else {
+			vip_set_slice_path(dev,
+					   VIP_CHR_DS_2_SRC_DATA_SELECT, 4);
+			vip_set_slice_path(dev, VIP_CHR_DS_2_DATA_BYPASS, 0);
+			vip_set_slice_path(dev,
+					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
+			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
+		}
+	} else {
+		port->flags |= FLAG_MULT_PORT;
+		vip_set_slice_path(dev, VIP_MULTI_CHANNEL_DATA_SELECT, 1);
+		vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
+	}
+}
+
+static int vip_g_selection(struct file *file, void *fh,
+			   struct v4l2_selection *s)
+{
+	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	struct vip_stream *stream = file2stream(file);
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = stream->width;
+		s->r.height = stream->height;
+		return 0;
+
+	case V4L2_SEL_TGT_CROP:
+		s->r = stream->port->c_rect;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int enclosed_rectangle(struct v4l2_rect *a, struct v4l2_rect *b)
+{
+	if (a->left < b->left || a->top < b->top)
+		return 0;
+	if (a->left + a->width > b->left + b->width)
+		return 0;
+	if (a->top + a->height > b->top + b->height)
+		return 0;
+
+	return 1;
+}
+
+static int vip_s_selection(struct file *file, void *fh,
+			   struct v4l2_selection *s)
+{
+	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	if (s->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	struct vip_stream *stream = file2stream(file);
+	struct vip_port *port = stream->port;
+	struct vip_dev *dev = port->dev;
+	struct v4l2_rect r = s->r;
+
+	v4l_bound_align_image(&r.width, 0, stream->width, 0,
+			      &r.height, 0, stream->height, 0, 0);
+
+	r.left = clamp_t(unsigned int, r.left, 0, stream->width - r.width);
+	r.top  = clamp_t(unsigned int, r.top, 0, stream->height - r.height);
+
+	if (s->flags & V4L2_SEL_FLAG_LE && !enclosed_rectangle(&r, &s->r))
+		return -ERANGE;
+
+	if (s->flags & V4L2_SEL_FLAG_GE && !enclosed_rectangle(&s->r, &r))
+		return -ERANGE;
+
+	s->r = r;
+	stream->port->c_rect = r;
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev, "cropped (%d,%d)/%dx%d of %dx%d\n",
+		 r.left, r.top, r.width, r.height,
+		 stream->width, stream->height);
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops vip_ioctl_ops = {
+	.vidioc_querycap	= vip_querycap,
+	.vidioc_enum_input	= vip_enuminput,
+	.vidioc_g_input		= vip_g_input,
+	.vidioc_s_input		= vip_s_input,
+
+	.vidioc_querystd	= vip_querystd,
+	.vidioc_g_std		= vip_g_std,
+	.vidioc_s_std		= vip_s_std,
+
+	.vidioc_enum_fmt_vid_cap = vip_enum_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap	= vip_g_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap	= vip_try_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap	= vip_s_fmt_vid_cap,
+
+	.vidioc_enum_frameintervals	= vip_enum_frameintervals,
+	.vidioc_enum_framesizes		= vip_enum_framesizes,
+	.vidioc_s_parm			= vip_s_parm,
+	.vidioc_g_parm			= vip_g_parm,
+	.vidioc_g_selection	= vip_g_selection,
+	.vidioc_s_selection	= vip_s_selection,
+	.vidioc_reqbufs		= vb2_ioctl_reqbufs,
+	.vidioc_create_bufs	= vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf	= vb2_ioctl_prepare_buf,
+	.vidioc_querybuf	= vb2_ioctl_querybuf,
+	.vidioc_qbuf		= vb2_ioctl_qbuf,
+	.vidioc_dqbuf		= vb2_ioctl_dqbuf,
+	.vidioc_expbuf		= vb2_ioctl_expbuf,
+
+	.vidioc_streamon	= vb2_ioctl_streamon,
+	.vidioc_streamoff	= vb2_ioctl_streamoff,
+	.vidioc_log_status	= v4l2_ctrl_log_status,
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+/*
+ * Videobuf operations
+ */
+static int vip_queue_setup(struct vb2_queue *vq,
+			   unsigned int *nbuffers, unsigned int *nplanes,
+			   unsigned int sizes[], struct device *alloc_devs[])
+{
+	struct vip_stream *stream = vb2_get_drv_priv(vq);
+	struct vip_port *port = stream->port;
+	struct vip_dev *dev = port->dev;
+	unsigned int size = stream->sizeimage;
+
+	if (vq->max_num_buffers + *nbuffers < 3)
+		*nbuffers = 3 - vq->max_num_buffers;
+
+	if (*nplanes) {
+		if (sizes[0] < size)
+			return -EINVAL;
+		size = sizes[0];
+	}
+
+	*nplanes = 1;
+	sizes[0] = size;
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev, "get %d buffer(s) of size %d each.\n",
+		 *nbuffers, sizes[0]);
+
+	return 0;
+}
+
+static int vip_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vip_stream *stream = vb2_get_drv_priv(vb->vb2_queue);
+	struct vip_port *port = stream->port;
+	struct vip_dev *dev = port->dev;
+
+	if (vb2_plane_size(vb, 0) < stream->sizeimage) {
+		v4l2_dbg(1, debug, &dev->v4l2_dev,
+			 "%s data will not fit into plane (%lu < %lu)\n",
+			 __func__, vb2_plane_size(vb, 0),
+			(long)stream->sizeimage);
+		return -EINVAL;
+	}
+
+	vb2_set_plane_payload(vb, 0, stream->sizeimage);
+
+	return 0;
+}
+
+static void vip_buf_queue(struct vb2_buffer *vb)
+{
+	struct vip_stream *stream = vb2_get_drv_priv(vb->vb2_queue);
+	struct vip_dev *dev = stream->port->dev;
+	struct vip_buffer *buf = container_of(vb, struct vip_buffer,
+					      vb.vb2_buf);
+	unsigned long flags;
+
+	spin_lock_irqsave(&dev->slock, flags);
+	list_add_tail(&buf->list, &stream->vidq);
+	spin_unlock_irqrestore(&dev->slock, flags);
+}
+
+static void return_buffers(struct vb2_queue *vq, int state)
+{
+	struct vip_stream *stream = vb2_get_drv_priv(vq);
+	struct vip_dev *dev = stream->port->dev;
+	struct vip_buffer *buf;
+	unsigned long flags;
+
+	spin_lock_irqsave(&dev->slock, flags);
+
+	/* release all active buffers */
+	while (!list_empty(&stream->post_bufs)) {
+		buf = list_entry(stream->post_bufs.next,
+				 struct vip_buffer, list);
+		list_del(&buf->list);
+		if (buf->drop == 1)
+			list_add_tail(&buf->list, &stream->dropq);
+		else
+			vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
+	while (!list_empty(&stream->vidq)) {
+		buf = list_entry(stream->vidq.next, struct vip_buffer, list);
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
+
+	INIT_LIST_HEAD(&stream->post_bufs);
+	INIT_LIST_HEAD(&stream->vidq);
+
+	spin_unlock_irqrestore(&dev->slock, flags);
+}
+
+static int vip_setup_scaler(struct vip_stream *stream)
+{
+	struct vip_port *port = stream->port;
+	struct vip_dev *dev = port->dev;
+	struct sc_data *sc = dev->sc;
+	struct csc_data *csc = dev->csc;
+	struct vpdma_data *vpdma = dev->shared->vpdma;
+	struct vip_mmr_adb *mmr_adb = port->mmr_adb.addr;
+	int list_num = stream->list_num;
+	int timeout = 500;
+	struct v4l2_format dst_f;
+	struct v4l2_format src_f;
+
+	memset(&src_f, 0, sizeof(src_f));
+	src_f.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	v4l2_fill_pix_format(&src_f.fmt.pix, &port->mbus_framefmt);
+	src_f.fmt.pix.pixelformat = vip_mbus_code_to_fourcc(port->fmt->code);
+
+	dst_f = src_f;
+	dst_f.fmt.pix.pixelformat = port->fmt->fourcc;
+	dst_f.fmt.pix.width = stream->width;
+	dst_f.fmt.pix.height = stream->height;
+
+	/* if scaler not associated with this port then skip */
+	if (port->scaler) {
+		sc_set_hs_coeffs(sc, port->sc_coeff_h.addr,
+				 port->mbus_framefmt.width,
+				 port->c_rect.width);
+		sc_set_vs_coeffs(sc, port->sc_coeff_v.addr,
+				 port->mbus_framefmt.height,
+				 port->c_rect.height);
+		sc_config_scaler(sc, &mmr_adb->sc_regs0[0],
+				 &mmr_adb->sc_regs8[0], &mmr_adb->sc_regs17[0],
+				 port->mbus_framefmt.width,
+				 port->mbus_framefmt.height,
+				 port->c_rect.width,
+				 port->c_rect.height);
+		port->load_mmrs = true;
+	}
+
+	/* if csc not associated with this port then skip */
+	if (port->csc) {
+		csc_set_coeff(csc, &mmr_adb->csc_regs[0],
+			      &src_f, &dst_f);
+
+		port->load_mmrs = true;
+	}
+
+	/* If coeff are already loaded then skip */
+	if (!sc->load_coeff_v && !sc->load_coeff_h && !port->load_mmrs)
+		return 0;
+
+	if (vpdma_list_busy(vpdma, list_num)) {
+		v4l2_dbg(3, debug, &dev->v4l2_dev, "%s: List %d is busy\n",
+			 __func__, list_num);
+	}
+
+	/* Make sure we start with a clean list */
+	vpdma_reset_desc_list(&stream->desc_list);
+
+	/* config descriptors */
+	if (port->load_mmrs) {
+		vpdma_map_desc_buf(vpdma, &port->mmr_adb);
+		vpdma_add_cfd_adb(&stream->desc_list, CFD_MMR_CLIENT,
+				  &port->mmr_adb);
+
+		port->load_mmrs = false;
+		v4l2_dbg(3, debug, &dev->v4l2_dev, "Added mmr_adb config desc\n");
+	}
+
+	if (sc->loaded_coeff_h != port->sc_coeff_h.dma_addr ||
+	    sc->load_coeff_h) {
+		vpdma_map_desc_buf(vpdma, &port->sc_coeff_h);
+		vpdma_add_cfd_block(&stream->desc_list,
+				    VIP_SLICE1_CFD_SC_CLIENT + dev->slice_id,
+				    &port->sc_coeff_h, 0);
+
+		sc->loaded_coeff_h = port->sc_coeff_h.dma_addr;
+		sc->load_coeff_h = false;
+		v4l2_dbg(3, debug, &dev->v4l2_dev, "Added sc_coeff_h config desc\n");
+	}
+
+	if (sc->loaded_coeff_v != port->sc_coeff_v.dma_addr ||
+	    sc->load_coeff_v) {
+		vpdma_map_desc_buf(vpdma, &port->sc_coeff_v);
+		vpdma_add_cfd_block(&stream->desc_list,
+				    VIP_SLICE1_CFD_SC_CLIENT + dev->slice_id,
+				    &port->sc_coeff_v, SC_COEF_SRAM_SIZE >> 4);
+
+		sc->loaded_coeff_v = port->sc_coeff_v.dma_addr;
+		sc->load_coeff_v = false;
+		v4l2_dbg(3, debug, &dev->v4l2_dev, "Added sc_coeff_v config desc\n");
+	}
+	v4l2_dbg(3, debug, stream, "CFD_SC_CLIENT %d slice_id: %d\n",
+		 VIP_SLICE1_CFD_SC_CLIENT + dev->slice_id, dev->slice_id);
+
+	vpdma_map_desc_buf(vpdma, &stream->desc_list.buf);
+	v4l2_dbg(3, debug, &dev->v4l2_dev, "Submitting desc on list# %d\n", list_num);
+	vpdma_submit_descs(vpdma, &stream->desc_list, list_num);
+
+	while (vpdma_list_busy(vpdma, list_num) && timeout--)
+		usleep_range(1000, 1100);
+
+	vpdma_unmap_desc_buf(dev->shared->vpdma, &port->mmr_adb);
+	vpdma_unmap_desc_buf(dev->shared->vpdma, &port->sc_coeff_h);
+	vpdma_unmap_desc_buf(dev->shared->vpdma, &port->sc_coeff_v);
+	vpdma_unmap_desc_buf(dev->shared->vpdma, &stream->desc_list.buf);
+
+	vpdma_reset_desc_list(&stream->desc_list);
+
+	if (timeout <= 0) {
+		v4l2_err(&dev->v4l2_dev, "Timed out setting up scaler through VPDMA list\n");
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
+static int vip_load_vpdma_list_fifo(struct vip_stream *stream)
+{
+	struct vip_port *port = stream->port;
+	struct vip_dev *dev = port->dev;
+	struct vpdma_data *vpdma = dev->shared->vpdma;
+	int list_num = stream->list_num;
+	struct vip_buffer *buf;
+	unsigned long flags;
+	int timeout, i;
+
+	if (vpdma_list_busy(dev->shared->vpdma, stream->list_num))
+		return -EBUSY;
+
+	for (i = 0; i < VIP_VPDMA_FIFO_SIZE; i++) {
+		spin_lock_irqsave(&dev->slock, flags);
+		if (list_empty(&stream->vidq)) {
+			v4l2_err(&dev->v4l2_dev, "No buffer left!");
+			spin_unlock_irqrestore(&dev->slock, flags);
+			return -EINVAL;
+		}
+
+		buf = list_entry(stream->vidq.next,
+				 struct vip_buffer, list);
+		buf->drop = false;
+
+		list_move_tail(&buf->list, &stream->post_bufs);
+		spin_unlock_irqrestore(&dev->slock, flags);
+
+		v4l2_dbg(2, debug, &dev->v4l2_dev, "%s: start_dma vb2 buf idx:%d\n",
+			 __func__, buf->vb.vb2_buf.index);
+		start_dma(stream, buf);
+
+		timeout = 500;
+		while (vpdma_list_busy(vpdma, list_num) && timeout--)
+			usleep_range(1000, 1100);
+
+		if (timeout <= 0) {
+			v4l2_err(&dev->v4l2_dev, "Timed out loading VPDMA list fifo\n");
+			return -EBUSY;
+		}
+	}
+	return 0;
+}
+
+static int vip_start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct vip_stream *stream = vb2_get_drv_priv(vq);
+	struct vip_port *port = stream->port;
+	struct vip_dev *dev = port->dev;
+	int ret;
+
+	ret = vip_setup_scaler(stream);
+	if (ret)
+		goto err;
+
+	/*
+	 * Make sure the scaler is configured before the datapath is
+	 * enabled. The scaler can only load the coefficient
+	 * parameters when it is idle. If the scaler path is enabled
+	 * and video data is being received then the VPDMA transfer will
+	 * stall indefinetely.
+	 */
+	set_fmt_params(stream);
+	ret = vip_setup_parser(port);
+	if (ret)
+		goto err;
+
+	if (port->subdev) {
+		ret = v4l2_subdev_call(port->subdev, video, s_stream, 1);
+		if (ret) {
+			v4l2_err(&dev->v4l2_dev, "stream on failed in subdev\n");
+			goto err;
+		}
+	}
+
+	stream->sequence = 0;
+	stream->field = V4L2_FIELD_TOP;
+	populate_desc_list(stream);
+
+	ret = vip_load_vpdma_list_fifo(stream);
+	if (ret)
+		goto err;
+
+	stream->num_recovery = 0;
+
+	clear_irqs(dev, dev->slice_id, stream->list_num);
+	enable_irqs(dev, dev->slice_id, stream->list_num);
+	vip_schedule_next_buffer(stream);
+	vip_parser_stop_imm(port, false);
+	vip_enable_parser(port, true);
+
+	return 0;
+
+err:
+	return_buffers(vq, VB2_BUF_STATE_QUEUED);
+	return ret;
+}
+
+/*
+ * Abort streaming and wait for last buffer
+ */
+static void vip_stop_streaming(struct vb2_queue *vq)
+{
+	struct vip_stream *stream = vb2_get_drv_priv(vq);
+	struct vip_port *port = stream->port;
+	struct vip_dev *dev = port->dev;
+	int ret;
+
+	vip_parser_stop_imm(port, true);
+	vip_enable_parser(port, false);
+	unset_fmt_params(stream);
+
+	disable_irqs(dev, dev->slice_id, stream->list_num);
+	clear_irqs(dev, dev->slice_id, stream->list_num);
+
+	if (port->subdev) {
+		ret = v4l2_subdev_call(port->subdev, video, s_stream, 0);
+		if (ret)
+			v4l2_err(&dev->v4l2_dev, "Failed to stop subdev stream");
+	}
+
+	stop_dma(stream, true);
+
+	return_buffers(vq, VB2_BUF_STATE_ERROR);
+
+	vpdma_unmap_desc_buf(dev->shared->vpdma, &stream->desc_list.buf);
+	vpdma_reset_desc_list(&stream->desc_list);
+}
+
+static const struct vb2_ops vip_video_qops = {
+	.queue_setup		= vip_queue_setup,
+	.buf_prepare		= vip_buf_prepare,
+	.buf_queue		= vip_buf_queue,
+	.start_streaming	= vip_start_streaming,
+	.stop_streaming		= vip_stop_streaming,
+};
+
+static int vip_init_dev(struct vip_dev *dev)
+{
+	if (dev->num_ports != 0)
+		goto done;
+
+	vip_set_clock_enable(dev, 1);
+	vip_module_toggle(dev, VIP_SC_RST, false);
+	vip_module_toggle(dev, VIP_CSC_RST, false);
+done:
+	dev->num_ports++;
+
+	return 0;
+}
+
+static inline bool is_scaler_available(struct vip_port *port)
+{
+	if (port->endpoint.bus_type == V4L2_MBUS_PARALLEL)
+		if (port->dev->sc_assigned == VIP_NOT_ASSIGNED ||
+		    port->dev->sc_assigned == port->port_id)
+			return true;
+	return false;
+}
+
+static inline bool allocate_scaler(struct vip_port *port)
+{
+	if (is_scaler_available(port)) {
+		if (port->dev->sc_assigned == VIP_NOT_ASSIGNED ||
+		    port->dev->sc_assigned == port->port_id) {
+			port->dev->sc_assigned = port->port_id;
+			port->scaler = true;
+			return true;
+		}
+	}
+	return false;
+}
+
+static inline void free_scaler(struct vip_port *port)
+{
+	if (port->dev->sc_assigned == port->port_id) {
+		port->dev->sc_assigned = VIP_NOT_ASSIGNED;
+		port->scaler = false;
+	}
+}
+
+static bool is_csc_available(struct vip_port *port)
+{
+	if (port->endpoint.bus_type == V4L2_MBUS_PARALLEL)
+		if (port->dev->csc_assigned == VIP_NOT_ASSIGNED ||
+		    port->dev->csc_assigned == port->port_id)
+			return true;
+	return false;
+}
+
+static bool allocate_csc(struct vip_port *port,
+			 enum vip_csc_state csc_direction)
+{
+	struct vip_dev *dev = port->dev;
+	/* Is CSC needed? */
+	if (csc_direction != VIP_CSC_NA) {
+		if (is_csc_available(port)) {
+			port->dev->csc_assigned = port->port_id;
+			port->csc = csc_direction;
+			v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: csc allocated: dir: %d\n",
+				 __func__, csc_direction);
+			return true;
+		}
+	}
+	return false;
+}
+
+static void free_csc(struct vip_port *port)
+{
+	struct vip_dev *dev = port->dev;
+
+	if (port->dev->csc_assigned == port->port_id) {
+		port->dev->csc_assigned = VIP_NOT_ASSIGNED;
+		port->csc = VIP_CSC_NA;
+		v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: csc freed\n",
+			 __func__);
+	}
+}
+
+static int vip_init_port(struct vip_port *port)
+{
+	struct vip_dev *dev = port->dev;
+	int ret;
+	struct vip_fmt *fmt;
+	struct v4l2_subdev_format sd_fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = 0,
+	};
+	struct v4l2_mbus_framefmt *mbus_fmt = &sd_fmt.format;
+
+	if (port->num_streams != 0)
+		goto done;
+
+	ret = vip_init_dev(port->dev);
+	if (ret)
+		goto done;
+
+	/* Get subdevice current frame format */
+	ret = v4l2_subdev_call(port->subdev, pad, get_fmt, NULL, &sd_fmt);
+	if (ret)
+		v4l2_dbg(1, debug, &dev->v4l2_dev, "init_port get_fmt failed in subdev: (%d)\n",
+			 ret);
+
+	/* try to find one that matches */
+	fmt = find_port_format_by_code(port, mbus_fmt->code);
+	if (!fmt) {
+		v4l2_dbg(1, debug, &dev->v4l2_dev, "subdev default mbus_fmt %04x is not matched.\n",
+			 mbus_fmt->code);
+		/* if all else fails just pick the first one */
+		fmt = port->active_fmt[0];
+
+		mbus_fmt->code = fmt->code;
+		sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+		sd_fmt.pad = 0;
+		ret = v4l2_subdev_call(port->subdev, pad, set_fmt,
+				       NULL, &sd_fmt);
+		if (ret)
+			v4l2_dbg(1, debug, &dev->v4l2_dev, "init_port set_fmt failed in subdev: (%d)\n",
+				 ret);
+	}
+
+	/* Assign current format */
+	port->fmt = fmt;
+	port->mbus_framefmt = *mbus_fmt;
+
+	v4l2_dbg(3, debug, &dev->v4l2_dev, "%s: g_mbus_fmt subdev mbus_code: %04X fourcc:%s size: %dx%d\n",
+		 __func__, fmt->code,
+		fourcc_to_str(fmt->fourcc),
+		mbus_fmt->width, mbus_fmt->height);
+
+	if (mbus_fmt->field == V4L2_FIELD_ALTERNATE)
+		port->flags |= FLAG_INTERLACED;
+	else
+		port->flags &= ~FLAG_INTERLACED;
+
+	port->c_rect.left	= 0;
+	port->c_rect.top	= 0;
+	port->c_rect.width	= mbus_fmt->width;
+	port->c_rect.height	= mbus_fmt->height;
+
+	ret = vpdma_alloc_desc_buf(&port->sc_coeff_h, SC_COEF_SRAM_SIZE);
+	if (ret != 0)
+		return ret;
+
+	ret = vpdma_alloc_desc_buf(&port->sc_coeff_v, SC_COEF_SRAM_SIZE);
+	if (ret != 0)
+		goto free_sc_h;
+
+	ret = vpdma_alloc_desc_buf(&port->mmr_adb, sizeof(struct vip_mmr_adb));
+	if (ret != 0)
+		goto free_sc_v;
+
+	init_adb_hdrs(port);
+
+	vip_enable_parser(port, false);
+done:
+	port->num_streams++;
+	return 0;
+
+free_sc_v:
+	vpdma_free_desc_buf(&port->sc_coeff_v);
+free_sc_h:
+	vpdma_free_desc_buf(&port->sc_coeff_h);
+	return ret;
+}
+
+static int vip_init_stream(struct vip_stream *stream)
+{
+	struct vip_port *port = stream->port;
+	struct vip_dev *dev = port->dev;
+	struct vip_fmt *fmt;
+	struct v4l2_mbus_framefmt *mbus_fmt;
+	struct v4l2_format f;
+	int ret;
+
+	ret = vip_init_port(port);
+	if (ret != 0)
+		return ret;
+
+	fmt = port->fmt;
+	mbus_fmt = &port->mbus_framefmt;
+
+	memset(&f, 0, sizeof(f));
+
+	/* Properly calculate the sizeimage and bytesperline values. */
+	v4l2_fill_pix_format(&f.fmt.pix, mbus_fmt);
+	f.fmt.pix.pixelformat = fmt->fourcc;
+	ret = vip_calc_format_size(port, fmt, &f);
+	if (ret)
+		return ret;
+
+	stream->width = f.fmt.pix.width;
+	stream->height = f.fmt.pix.height;
+	stream->sup_field = f.fmt.pix.field;
+	stream->bytesperline = f.fmt.pix.bytesperline;
+	stream->sizeimage = f.fmt.pix.sizeimage;
+
+	v4l2_dbg(3, debug, &dev->v4l2_dev, "init_stream fourcc:%s size: %dx%d bpl:%d img_size:%d\n",
+		 fourcc_to_str(f.fmt.pix.pixelformat),
+		 f.fmt.pix.width, f.fmt.pix.height,
+		 f.fmt.pix.bytesperline, f.fmt.pix.sizeimage);
+	v4l2_dbg(3, debug, &dev->v4l2_dev, "init_stream vpdma data type: 0x%02X\n",
+		 port->fmt->vpdma_fmt[0]->data_type);
+
+	ret = vpdma_create_desc_list(&stream->desc_list, VIP_DESC_LIST_SIZE,
+				     VPDMA_LIST_TYPE_NORMAL);
+
+	if (ret != 0)
+		return ret;
+
+	stream->write_desc = (struct vpdma_dtd *)stream->desc_list.buf.addr
+				+ 15;
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: stream instance %pa\n",
+		 __func__, &stream);
+
+	return 0;
+}
+
+static void vip_release_dev(struct vip_dev *dev)
+{
+	/*
+	 * On last close, disable clocks to conserve power
+	 */
+
+	if (--dev->num_ports == 0) {
+		/* reset the scaler module */
+		vip_module_toggle(dev, VIP_SC_RST, true);
+		vip_module_toggle(dev, VIP_CSC_RST, true);
+		vip_set_clock_enable(dev, 0);
+	}
+}
+
+static int vip_set_crop_parser(struct vip_port *port)
+{
+	struct vip_dev *dev = port->dev;
+	struct vip_parser_data *parser = dev->parser;
+	u32 hcrop = 0, vcrop = 0;
+	u32 width = port->mbus_framefmt.width;
+
+	if (port->fmt->vpdma_fmt[0] == &vpdma_raw_fmts[VPDMA_DATA_FMT_RAW8]) {
+		/*
+		 * Special case since we are faking a YUV422 16bit format
+		 * to have the vpdma perform the needed byte swap
+		 * we need to adjust the pixel width accordingly
+		 * otherwise the parser will attempt to collect more pixels
+		 * then available and the vpdma transfer will exceed the
+		 * allocated frame buffer.
+		 */
+		width >>= 1;
+		v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: 8 bit raw detected, adjusting width to %d\n",
+			 __func__, width);
+	}
+
+	/*
+	 * Set Parser Crop parameters to source size otherwise
+	 * scaler and colorspace converter will yield garbage.
+	 */
+	hcrop = VIP_ACT_BYPASS;
+	insert_field(&hcrop, 0, VIP_ACT_SKIP_NUMPIX_MASK,
+		     VIP_ACT_SKIP_NUMPIX_SHFT);
+	insert_field(&hcrop, width,
+		     VIP_ACT_USE_NUMPIX_MASK, VIP_ACT_USE_NUMPIX_SHFT);
+	reg_write(parser, VIP_PARSER_CROP_H_PORT(port->port_id), hcrop);
+
+	insert_field(&vcrop, 0, VIP_ACT_SKIP_NUMLINES_MASK,
+		     VIP_ACT_SKIP_NUMLINES_SHFT);
+	insert_field(&vcrop, port->mbus_framefmt.height,
+		     VIP_ACT_USE_NUMLINES_MASK, VIP_ACT_USE_NUMLINES_SHFT);
+	reg_write(parser, VIP_PARSER_CROP_V_PORT(port->port_id), vcrop);
+
+	return 0;
+}
+
+static int vip_setup_parser(struct vip_port *port)
+{
+	struct vip_dev *dev = port->dev;
+	struct vip_parser_data *parser = dev->parser;
+	struct v4l2_fwnode_endpoint *endpoint = &port->endpoint;
+	int iface, sync_type;
+	u32 flags = 0, config0;
+
+	/* Reset the port */
+	vip_reset_parser(port, true);
+	usleep_range(200, 250);
+	vip_reset_parser(port, false);
+
+	config0 = reg_read(parser, VIP_PARSER_PORT(port->port_id));
+
+	if (endpoint->bus_type == V4L2_MBUS_BT656) {
+		flags = endpoint->bus.parallel.flags;
+		iface = DUAL_8B_INTERFACE;
+
+		/*
+		 * Ideally, this should come from subdev
+		 * port->fmt can be anything once CSC is enabled
+		 */
+		if (vip_is_mbuscode_rgb(port->fmt->code))
+			sync_type = EMBEDDED_SYNC_SINGLE_RGB_OR_YUV444;
+		else
+			sync_type = EMBEDDED_SYNC_LINE_MULTIPLEXED_YUV422;
+
+	} else if (endpoint->bus_type == V4L2_MBUS_PARALLEL) {
+		flags = endpoint->bus.parallel.flags;
+
+		switch (endpoint->bus.parallel.bus_width) {
+		case 24:
+			iface = SINGLE_24B_INTERFACE;
+		break;
+		case 16:
+			iface = SINGLE_16B_INTERFACE;
+		break;
+		case 8:
+		default:
+			iface = DUAL_8B_INTERFACE;
+		}
+
+		if (vip_is_mbuscode_rgb(port->fmt->code))
+			sync_type = DISCRETE_SYNC_SINGLE_RGB_24B;
+		else
+			sync_type = DISCRETE_SYNC_SINGLE_YUV422;
+
+		if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
+			config0 |= VIP_HSYNC_POLARITY;
+		else if (flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
+			config0 &= ~VIP_HSYNC_POLARITY;
+
+		if (flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
+			config0 |= VIP_VSYNC_POLARITY;
+		else if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
+			config0 &= ~VIP_VSYNC_POLARITY;
+
+		config0 &= ~VIP_USE_ACTVID_HSYNC_ONLY;
+		config0 |= VIP_ACTVID_POLARITY;
+		config0 |= VIP_DISCRETE_BASIC_MODE;
+
+	} else {
+		v4l2_err(&dev->v4l2_dev, "Device doesn't support CSI2");
+		return -EINVAL;
+	}
+
+	if (flags & V4L2_MBUS_PCLK_SAMPLE_FALLING) {
+		vip_set_pclk_invert(port);
+		config0 |= VIP_PIXCLK_EDGE_POLARITY;
+	} else {
+		config0 &= ~VIP_PIXCLK_EDGE_POLARITY;
+	}
+
+	config0 |= ((sync_type & VIP_SYNC_TYPE_MASK) << VIP_SYNC_TYPE_SHFT);
+
+	reg_write(parser, VIP_PARSER_PORT(port->port_id), config0);
+
+	vip_set_data_interface(port, iface);
+	vip_set_crop_parser(port);
+
+	return 0;
+}
+
+static void vip_enable_parser(struct vip_port *port, bool on)
+{
+	u32 config0;
+	struct vip_dev *dev = port->dev;
+	struct vip_parser_data *parser = dev->parser;
+
+	config0 = reg_read(parser, VIP_PARSER_PORT(port->port_id));
+
+	if (on) {
+		config0 |= VIP_PORT_ENABLE;
+		config0 &= ~(VIP_ASYNC_FIFO_RD | VIP_ASYNC_FIFO_WR);
+	} else {
+		config0 &= ~VIP_PORT_ENABLE;
+		config0 |= (VIP_ASYNC_FIFO_RD | VIP_ASYNC_FIFO_WR);
+	}
+	reg_write(parser, VIP_PARSER_PORT(port->port_id), config0);
+}
+
+static void vip_reset_parser(struct vip_port *port, bool on)
+{
+	u32 config0;
+	struct vip_dev *dev = port->dev;
+	struct vip_parser_data *parser = dev->parser;
+
+	config0 = reg_read(parser, VIP_PARSER_PORT(port->port_id));
+
+	if (on)
+		config0 |= VIP_SW_RESET;
+	else
+		config0 &= ~VIP_SW_RESET;
+
+	reg_write(parser, VIP_PARSER_PORT(port->port_id), config0);
+}
+
+static void vip_parser_stop_imm(struct vip_port *port, bool on)
+{
+	u32 config0;
+	struct vip_dev *dev = port->dev;
+	struct vip_parser_data *parser = dev->parser;
+
+	config0 = reg_read(parser, VIP_PARSER_STOP_IMM_PORT(port->port_id));
+
+	if (on)
+		config0 = 0xffffffff;
+	else
+		config0 = 0;
+
+	reg_write(parser, VIP_PARSER_STOP_IMM_PORT(port->port_id), config0);
+}
+
+static void vip_release_stream(struct vip_stream *stream)
+{
+	struct vip_dev *dev = stream->port->dev;
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: stream instance %pa\n",
+		 __func__, &stream);
+
+	vpdma_unmap_desc_buf(dev->shared->vpdma, &stream->desc_list.buf);
+	vpdma_free_desc_buf(&stream->desc_list.buf);
+	vpdma_free_desc_list(&stream->desc_list);
+}
+
+static void vip_release_port(struct vip_port *port)
+{
+	struct vip_dev *dev = port->dev;
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: port instance %pa\n",
+		 __func__, &port);
+
+	vpdma_free_desc_buf(&port->mmr_adb);
+	vpdma_free_desc_buf(&port->sc_coeff_h);
+	vpdma_free_desc_buf(&port->sc_coeff_v);
+}
+
+static void stop_dma(struct vip_stream *stream, bool clear_list)
+{
+	struct vip_dev *dev = stream->port->dev;
+	int ch, size = 0;
+
+	/* Create a list of channels to be cleared */
+	for (ch = 0; ch < VPDMA_MAX_CHANNELS; ch++) {
+		if (stream->vpdma_channels[ch] == 1) {
+			stream->vpdma_channels_to_abort[size++] = ch;
+			v4l2_dbg(2, debug, &dev->v4l2_dev, "Clear channel no: %d\n", ch);
+		}
+	}
+
+	/* Clear all the used channels for the list */
+	vpdma_list_cleanup(dev->shared->vpdma, stream->list_num,
+			   stream->vpdma_channels_to_abort, size);
+
+	if (clear_list)
+		for (ch = 0; ch < VPDMA_MAX_CHANNELS; ch++)
+			stream->vpdma_channels[ch] = 0;
+}
+
+static int vip_open(struct file *file)
+{
+	struct vip_stream *stream = video_drvdata(file);
+	struct vip_port *port = stream->port;
+	struct vip_dev *dev = port->dev;
+	int ret = 0;
+
+	mutex_lock(&dev->mutex);
+
+	ret = v4l2_fh_open(file);
+	if (ret) {
+		v4l2_err(&dev->v4l2_dev, "v4l2_fh_open failed\n");
+		goto unlock;
+	}
+
+	/*
+	 * If this is the first open file.
+	 * Then initialize hw module.
+	 */
+	if (!v4l2_fh_is_singular_file(file))
+		goto unlock;
+
+	if (vip_init_stream(stream))
+		ret = -ENODEV;
+unlock:
+	mutex_unlock(&dev->mutex);
+	return ret;
+}
+
+static int vip_release(struct file *file)
+{
+	struct vip_stream *stream = video_drvdata(file);
+	struct vip_port *port = stream->port;
+	struct vip_dev *dev = port->dev;
+	bool fh_singular;
+	int ret;
+
+	mutex_lock(&dev->mutex);
+
+	/* Save the singular status before we call the clean-up helper */
+	fh_singular = v4l2_fh_is_singular_file(file);
+
+	/* the release helper will cleanup any on-going streaming */
+	ret = _vb2_fop_release(file, NULL);
+
+	free_csc(port);
+	free_scaler(port);
+
+	/*
+	 * If this is the last open file.
+	 * Then de-initialize hw module.
+	 */
+	if (fh_singular) {
+		vip_release_stream(stream);
+
+		if (--port->num_streams == 0) {
+			vip_release_port(port);
+			vip_release_dev(port->dev);
+		}
+	}
+
+	mutex_unlock(&dev->mutex);
+
+	return ret;
+}
+
+/*
+ * File operations
+ */
+static const struct v4l2_file_operations vip_fops = {
+	.owner		= THIS_MODULE,
+	.open		= vip_open,
+	.release	= vip_release,
+	.read		= vb2_fop_read,
+	.poll		= vb2_fop_poll,
+	.unlocked_ioctl	= video_ioctl2,
+	.mmap		= vb2_fop_mmap,
+};
+
+static struct video_device vip_videodev = {
+	.name		= VIP_MODULE_NAME,
+	.fops		= &vip_fops,
+	.ioctl_ops	= &vip_ioctl_ops,
+	.minor		= -1,
+	.release	= video_device_release,
+	.tvnorms	= V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM,
+	.device_caps	= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE |
+			  V4L2_CAP_READWRITE,
+};
+
+static int alloc_stream(struct vip_port *port, int stream_id, int vfl_type)
+{
+	struct vip_stream *stream;
+	struct vip_dev *dev = port->dev;
+	struct vb2_queue *q;
+	struct video_device *vfd;
+	struct vip_buffer *buf;
+	struct list_head *pos, *tmp;
+	int ret, i;
+
+	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+	if (!stream)
+		return -ENOMEM;
+
+	stream->port = port;
+	stream->stream_id = stream_id;
+	stream->vfl_type = vfl_type;
+	port->cap_streams[stream_id] = stream;
+
+	stream->list_num = vpdma_hwlist_alloc(dev->shared->vpdma, stream);
+	if (stream->list_num < 0) {
+		v4l2_err(&dev->v4l2_dev, "Could not get VPDMA hwlist");
+		ret = -ENODEV;
+		goto do_free_stream;
+	}
+
+	INIT_LIST_HEAD(&stream->post_bufs);
+
+	/*
+	 * Initialize queue
+	 */
+	q = &stream->vb_vidq;
+	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_READ;
+	q->drv_priv = stream;
+	q->buf_struct_size = sizeof(struct vip_buffer);
+	q->ops = &vip_video_qops;
+	q->mem_ops = &vb2_dma_contig_memops;
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->lock = &dev->mutex;
+	q->min_queued_buffers = 2;
+	q->dev = dev->v4l2_dev.dev;
+
+	ret = vb2_queue_init(q);
+	if (ret)
+		goto do_free_hwlist;
+
+	INIT_WORK(&stream->recovery_work, vip_overflow_recovery_work);
+
+	INIT_LIST_HEAD(&stream->vidq);
+
+	/* Allocate/populate Drop queue entries */
+	INIT_LIST_HEAD(&stream->dropq);
+	for (i = 0; i < VIP_DROPQ_SIZE; i++) {
+		buf = kzalloc(sizeof(*buf), GFP_ATOMIC);
+		if (!buf) {
+			ret = -ENOMEM;
+			goto do_free_dropq;
+		}
+		buf->drop = true;
+		list_add(&buf->list, &stream->dropq);
+	}
+
+	vfd = video_device_alloc();
+	if (!vfd)
+		goto do_free_dropq;
+	*vfd = vip_videodev;
+	vfd->v4l2_dev = &dev->v4l2_dev;
+	vfd->queue = q;
+
+	vfd->lock = &dev->mutex;
+	video_set_drvdata(vfd, stream);
+	stream->vfd = vfd;
+
+	ret = video_register_device(vfd, vfl_type, -1);
+	if (ret) {
+		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
+		goto do_free_vfd;
+	}
+
+	v4l2_info(&dev->v4l2_dev, "device registered as %s\n",
+		  video_device_node_name(vfd));
+	return 0;
+
+do_free_vfd:
+	video_device_release(vfd);
+do_free_dropq:
+	list_for_each_safe(pos, tmp, &stream->dropq) {
+		buf = list_entry(pos,
+				 struct vip_buffer, list);
+		v4l2_dbg(1, debug, &dev->v4l2_dev, "dropq buffer\n");
+		list_del(pos);
+		kfree(buf);
+	}
+do_free_hwlist:
+	vpdma_hwlist_release(dev->shared->vpdma, stream->list_num);
+do_free_stream:
+	kfree(stream);
+	return ret;
+}
+
+static void free_stream(struct vip_stream *stream)
+{
+	struct vip_dev *dev;
+	struct vip_buffer *buf;
+	struct list_head *pos, *q;
+
+	if (!stream)
+		return;
+
+	dev = stream->port->dev;
+	/* Free up the Drop queue */
+	list_for_each_safe(pos, q, &stream->dropq) {
+		buf = list_entry(pos,
+				 struct vip_buffer, list);
+		v4l2_dbg(1, debug, &dev->v4l2_dev, "dropq buffer\n");
+		list_del(pos);
+		kfree(buf);
+	}
+
+	video_unregister_device(stream->vfd);
+	vpdma_hwlist_release(dev->shared->vpdma, stream->list_num);
+	stream->port->cap_streams[stream->stream_id] = NULL;
+	kfree(stream);
+}
+
+static int get_subdev_active_format(struct vip_port *port,
+				    struct v4l2_subdev *subdev)
+{
+	struct vip_fmt *fmt;
+	struct vip_dev *dev = port->dev;
+	struct v4l2_subdev_mbus_code_enum mbus_code;
+	int ret = 0;
+	unsigned int k, i, j;
+	enum vip_csc_state csc;
+
+	/* Enumerate sub device formats and enable all matching local formats */
+	port->num_active_fmt = 0;
+	for (k = 0, i = 0; (ret != -EINVAL); k++) {
+		memset(&mbus_code, 0, sizeof(mbus_code));
+		mbus_code.index = k;
+		mbus_code.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+		ret = v4l2_subdev_call(subdev, pad, enum_mbus_code,
+				       NULL, &mbus_code);
+		if (ret)
+			continue;
+
+		v4l2_dbg(2, debug, &dev->v4l2_dev,
+			 "subdev %s: code: %04x idx: %d\n",
+			 subdev->name, mbus_code.code, k);
+
+		for (j = 0; j < ARRAY_SIZE(vip_formats); j++) {
+			fmt = &vip_formats[j];
+			if (mbus_code.code != fmt->code)
+				continue;
+
+			/*
+			 * When the port is configured for BT656
+			 * then none of the downstream unit can be used.
+			 * So here we need to skip all format requiring
+			 * either CSC or CHR_DS
+			 */
+			csc = vip_csc_direction(fmt->code, fmt->finfo);
+			if (port->endpoint.bus_type == V4L2_MBUS_BT656 &&
+			    (csc != VIP_CSC_NA || fmt->coplanar))
+				continue;
+
+			port->active_fmt[i] = fmt;
+			v4l2_dbg(2, debug, &dev->v4l2_dev,
+				 "matched fourcc: %s: code: %04x idx: %d\n",
+				 fourcc_to_str(fmt->fourcc), fmt->code, i);
+			port->num_active_fmt = ++i;
+		}
+	}
+
+	if (i == 0) {
+		v4l2_err(&dev->v4l2_dev, "No suitable format reported by subdev %s\n",
+			 subdev->name);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int alloc_port(struct vip_dev *dev, int id)
+{
+	struct vip_port *port;
+
+	if (dev->ports[id])
+		return -EINVAL;
+
+	port = devm_kzalloc(&dev->pdev->dev, sizeof(*port), GFP_KERNEL);
+	if (!port)
+		return -ENOMEM;
+
+	dev->ports[id] = port;
+	port->dev = dev;
+	port->port_id = id;
+	port->num_streams = 0;
+	return 0;
+}
+
+static void free_port(struct vip_port *port)
+{
+	if (!port)
+		return;
+
+	v4l2_async_nf_unregister(&port->notifier);
+	v4l2_async_nf_cleanup(&port->notifier);
+	free_stream(port->cap_streams[0]);
+}
+
+static int get_field(u32 value, u32 mask, int shift)
+{
+	return (value & (mask << shift)) >> shift;
+}
+
+static int vip_probe_complete(struct platform_device *pdev);
+static void vip_vpdma_fw_cb(struct platform_device *pdev)
+{
+	dev_info(&pdev->dev, "VPDMA firmware loaded\n");
+
+	if (pdev->dev.of_node)
+		vip_probe_complete(pdev);
+}
+
+static int vip_create_streams(struct vip_port *port,
+			      struct v4l2_subdev *subdev)
+{
+	struct v4l2_mbus_config_parallel *bus;
+	int i;
+
+	for (i = 0; i < VIP_CAP_STREAMS_PER_PORT; i++)
+		free_stream(port->cap_streams[i]);
+
+	if (get_subdev_active_format(port, subdev))
+		return -ENODEV;
+
+	port->subdev = subdev;
+
+	if (port->endpoint.bus_type == V4L2_MBUS_PARALLEL) {
+		port->flags |= FLAG_MULT_PORT;
+		port->num_streams_configured = 1;
+		alloc_stream(port, 0, VFL_TYPE_VIDEO);
+	} else if (port->endpoint.bus_type == V4L2_MBUS_BT656) {
+		port->flags |= FLAG_MULT_PORT;
+		bus = &port->endpoint.bus.parallel;
+		port->num_streams_configured = 1;
+		alloc_stream(port, 0, VFL_TYPE_VIDEO);
+	}
+	return 0;
+}
+
+static int vip_async_bound(struct v4l2_async_notifier *notifier,
+			   struct v4l2_subdev *subdev,
+			   struct v4l2_async_connection *asd)
+{
+	struct vip_port *port = notifier_to_vip_port(notifier);
+	int ret;
+
+	if (port->subdev) {
+		v4l2_info(&port->dev->v4l2_dev, "Rejecting subdev %s (Already set!!)",
+			  subdev->name);
+		return 0;
+	}
+
+	v4l2_info(&port->dev->v4l2_dev, "Port %c: Using subdev %s for capture\n",
+		  port->port_id == VIP_PORTA ? 'A' : 'B', subdev->name);
+
+	ret = vip_create_streams(port, subdev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int vip_async_complete(struct v4l2_async_notifier *notifier)
+{
+	return 0;
+}
+
+static const struct v4l2_async_notifier_operations vip_async_ops = {
+	.bound = vip_async_bound,
+	.complete = vip_async_complete,
+};
+
+static struct fwnode_handle *
+fwnode_graph_get_next_endpoint_by_regs(const struct fwnode_handle *fwnode,
+				       int port_reg, int reg)
+{
+	return of_fwnode_handle(of_graph_get_endpoint_by_regs(to_of_node(fwnode),
+							      port_reg, reg));
+}
+
+static int vip_register_subdev_notif(struct vip_port *port,
+				     struct fwnode_handle *ep)
+{
+	struct v4l2_async_notifier *notifier = &port->notifier;
+	struct fwnode_handle *subdev;
+	struct v4l2_fwnode_endpoint *vep;
+	struct v4l2_async_connection *asd;
+	int ret, rval;
+	struct vip_dev *dev = port->dev;
+
+	vep = &port->endpoint;
+
+	subdev = fwnode_graph_get_remote_port_parent(ep);
+	if (!subdev) {
+		v4l2_dbg(3, debug, &dev->v4l2_dev, "can't get remote parent\n");
+		return -EINVAL;
+	}
+
+	ret = v4l2_fwnode_endpoint_parse(ep, vep);
+	if (ret) {
+		v4l2_dbg(3, debug, &dev->v4l2_dev, "Failed to parse endpoint:\n");
+		fwnode_handle_put(subdev);
+		return -EINVAL;
+	}
+
+	v4l2_async_nf_init(notifier, &port->dev->shared->v4l2_dev);
+
+	asd = v4l2_async_nf_add_fwnode(notifier, subdev, struct v4l2_async_connection);
+	if (IS_ERR(asd)) {
+		v4l2_dbg(1, debug, &dev->v4l2_dev, "Error adding asd\n");
+		fwnode_handle_put(subdev);
+		v4l2_async_nf_cleanup(notifier);
+		return -EINVAL;
+	}
+
+	notifier->ops = &vip_async_ops;
+	ret = v4l2_async_nf_register(notifier);
+	if (ret) {
+		v4l2_dbg(1, debug, &dev->v4l2_dev, "Error registering async notifier\n");
+		v4l2_async_nf_cleanup(notifier);
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int vip_endpoint_scan(struct platform_device *pdev)
+{
+	struct device_node *parent = pdev->dev.of_node;
+	struct device_node *ep = NULL;
+	int count = 0, p;
+
+	for (p = 0; p < (VIP_NUM_PORTS * VIP_NUM_SLICES); p++) {
+		ep = of_graph_get_endpoint_by_regs(parent, p, 0);
+		if (!ep)
+			continue;
+
+		count++;
+		of_node_put(ep);
+	}
+
+	return count;
+}
+
+static int vip_probe_complete(struct platform_device *pdev)
+{
+	struct vip_shared *shared = platform_get_drvdata(pdev);
+	struct vip_ctrl_module *ctrl = NULL;
+	struct vip_port *port;
+	struct vip_dev *dev;
+	struct device_node *parent = pdev->dev.of_node;
+	struct fwnode_handle *ep = NULL;
+	struct of_phandle_args args;
+	int ret, i, slice_id, port_id, p;
+
+	/* Allocate ctrl before using it */
+	ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
+	if (parent && of_property_present(parent, "ti,ctrl-module")) {
+		ctrl->syscon_pol = syscon_regmap_lookup_by_phandle(parent,
+								   "ti,ctrl-module");
+		if (IS_ERR(ctrl->syscon_pol))
+			return dev_err_probe(&pdev->dev, PTR_ERR(ctrl->syscon_pol),
+				     "Failed to get ti,ctrl-module regmap\n");
+	}
+
+	ret = of_parse_phandle_with_fixed_args(parent, "ti,ctrl-module",
+					       5, 0, &args);
+
+	if (ret) {
+		dev_err(&pdev->dev, "failed to parse ti,ctrl-module\n");
+		return ret;
+	}
+
+	ctrl->syscon_offset = args.args[0];
+
+	for (i = 0; i < ARRAY_SIZE(ctrl->syscon_bit_field); i++)
+		ctrl->syscon_bit_field[i] = args.args[i + 1];
+
+	for (p = 0; p < (VIP_NUM_PORTS * VIP_NUM_SLICES); p++) {
+		ep = fwnode_graph_get_next_endpoint_by_regs(of_fwnode_handle(parent),
+							    p, 0);
+		if (!ep)
+			continue;
+
+		switch (p) {
+		case 0:
+			slice_id = VIP_SLICE1;	port_id = VIP_PORTA;
+			break;
+		case 1:
+			slice_id = VIP_SLICE2;	port_id = VIP_PORTA;
+			break;
+		case 2:
+			slice_id = VIP_SLICE1;	port_id = VIP_PORTB;
+			break;
+		case 3:
+			slice_id = VIP_SLICE2;	port_id = VIP_PORTB;
+			break;
+		default:
+			dev_err(&pdev->dev, "Unknown port reg=<%d>\n", p);
+			continue;
+		}
+
+		ret = alloc_port(shared->devs[slice_id], port_id);
+		if (ret < 0)
+			continue;
+
+		dev = shared->devs[slice_id];
+		dev->syscon = ctrl;
+		port = dev->ports[port_id];
+
+		vip_register_subdev_notif(port, ep);
+		fwnode_handle_put(ep);
+	}
+	return 0;
+}
+
+static int vip_probe_slice(struct platform_device *pdev, int slice)
+{
+	struct vip_shared *shared = platform_get_drvdata(pdev);
+	struct vip_dev *dev;
+	struct vip_parser_data *parser;
+	struct sc_data *sc;
+	struct csc_data *csc;
+	int ret;
+
+	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	dev->irq = platform_get_irq(pdev, slice);
+	if (dev->irq < 0)
+		return dev->irq;
+
+	ret = devm_request_irq(&pdev->dev, dev->irq, vip_irq,
+			       0, VIP_MODULE_NAME, dev);
+	if (ret < 0)
+		return -ENOMEM;
+
+	spin_lock_init(&dev->slock);
+	mutex_init(&dev->mutex);
+
+	dev->slice_id = slice;
+	dev->pdev = pdev;
+	dev->res = shared->res;
+	dev->base = shared->base;
+	dev->v4l2_dev = shared->v4l2_dev;
+
+	dev->shared = shared;
+	shared->devs[slice] = dev;
+
+	vip_top_reset(dev);
+	vip_set_slice_path(dev, VIP_MULTI_CHANNEL_DATA_SELECT, 1);
+
+	parser = devm_kzalloc(&pdev->dev, sizeof(*dev->parser), GFP_KERNEL);
+	if (!parser)
+		return PTR_ERR(parser);
+
+	parser->base = dev->base + (slice ? VIP_SLICE1_PARSER : VIP_SLICE0_PARSER);
+	if (IS_ERR(parser->base))
+		return PTR_ERR(parser->base);
+
+	parser->pdev = pdev;
+	dev->parser = parser;
+
+	dev->sc_assigned = VIP_NOT_ASSIGNED;
+	sc = devm_kzalloc(&pdev->dev, sizeof(*dev->sc), GFP_KERNEL);
+	if (!sc)
+		return PTR_ERR(sc);
+
+	sc->base = dev->base + (slice ? VIP_SLICE1_SC : VIP_SLICE0_SC);
+	if (IS_ERR(sc->base))
+		return PTR_ERR(sc->base);
+
+	sc->pdev = pdev;
+	dev->sc = sc;
+
+	dev->csc_assigned = VIP_NOT_ASSIGNED;
+	csc = devm_kzalloc(&pdev->dev, sizeof(*dev->csc), GFP_KERNEL);
+	if (!csc)
+		return PTR_ERR(csc);
+
+	csc->base = dev->base + (slice ? VIP_SLICE1_CSC : VIP_SLICE0_CSC);
+	if (IS_ERR(csc->base))
+		return PTR_ERR(csc->base);
+
+	csc->pdev = pdev;
+	dev->csc = csc;
+
+	return 0;
+}
+
+static int vip_probe(struct platform_device *pdev)
+{
+	struct vip_shared *shared;
+	struct pinctrl *pinctrl;
+	int ret, slice = VIP_SLICE1;
+	u32 tmp, pid;
+
+	/* If there are no endpoint defined there is nothing to do */
+	if (!vip_endpoint_scan(pdev)) {
+		dev_err(&pdev->dev, "%s: No sensor", __func__);
+		return -ENODEV;
+	}
+
+	ret = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(&pdev->dev,
+			"32-bit consistent DMA enable failed\n");
+		return ret;
+	}
+
+	shared = devm_kzalloc(&pdev->dev, sizeof(*shared), GFP_KERNEL);
+	if (!shared)
+		return -ENOMEM;
+
+	shared->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	shared->base = devm_ioremap_resource(&pdev->dev, shared->res);
+	if (IS_ERR(shared->base))
+		return PTR_ERR(shared->base);
+
+	vip_init_format_info(&pdev->dev);
+
+	pinctrl = devm_pinctrl_get_select_default(&pdev->dev);
+
+	pm_runtime_enable(&pdev->dev);
+
+	ret = pm_runtime_get_sync(&pdev->dev);
+	if (ret)
+		goto err_runtime_disable;
+
+	/* Make sure H/W module has the right functionality */
+	pid = reg_read(shared, VIP_PID);
+	tmp = get_field(pid, VIP_PID_FUNC_MASK, VIP_PID_FUNC_SHIFT);
+
+	if (tmp != VIP_PID_FUNC) {
+		dev_info(&pdev->dev, "vip: unexpected PID function: 0x%x\n",
+			 tmp);
+		ret = -ENODEV;
+		goto err_runtime_put;
+	}
+
+	ret = v4l2_device_register(&pdev->dev, &shared->v4l2_dev);
+	if (ret)
+		goto err_runtime_put;
+
+	/* enable clocks, so the firmware will load properly */
+	vip_shared_set_clock_enable(shared, 1);
+	vip_top_vpdma_reset(shared);
+
+	platform_set_drvdata(pdev, shared);
+
+	v4l2_ctrl_handler_init(&shared->ctrl_handler, 11);
+	shared->v4l2_dev.ctrl_handler = &shared->ctrl_handler;
+
+	for (slice = VIP_SLICE1; slice < VIP_NUM_SLICES; slice++) {
+		ret = vip_probe_slice(pdev, slice);
+		if (ret) {
+			dev_err(&pdev->dev, "Creating slice failed");
+			goto err_dev_unreg;
+		}
+	}
+
+	shared->vpdma = &shared->vpdma_data;
+
+	shared->vpdma->pdev = pdev;
+	shared->vpdma->cb = vip_vpdma_fw_cb;
+	spin_lock_init(&shared->vpdma->lock);
+
+	shared->vpdma->base = shared->base + VIP_VPDMA_BASE;
+	if (!shared->vpdma->base) {
+		dev_err(&pdev->dev, "failed to ioremap\n");
+		return -ENOMEM;
+	}
+
+	ret = vpdma_load_firmware(shared->vpdma);
+	if (ret) {
+		dev_err(&pdev->dev, "Creating VPDMA failed");
+		goto err_dev_unreg;
+	}
+
+	return 0;
+
+err_dev_unreg:
+	v4l2_ctrl_handler_free(&shared->ctrl_handler);
+	v4l2_device_unregister(&shared->v4l2_dev);
+err_runtime_put:
+	pm_runtime_put_sync(&pdev->dev);
+err_runtime_disable:
+	pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static void vip_remove(struct platform_device *pdev)
+{
+	struct vip_shared *shared = platform_get_drvdata(pdev);
+	struct vip_dev *dev;
+	int slice;
+
+	for (slice = 0; slice < VIP_NUM_SLICES; slice++) {
+		dev = shared->devs[slice];
+		if (!dev)
+			continue;
+
+		free_port(dev->ports[VIP_PORTA]);
+		free_port(dev->ports[VIP_PORTB]);
+	}
+
+	v4l2_ctrl_handler_free(&shared->ctrl_handler);
+
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+}
+
+#if defined(CONFIG_OF)
+static const struct of_device_id vip_of_match[] = {
+	{
+		.compatible = "ti,dra7-vip",
+	},
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, vip_of_match);
+#endif
+
+static struct platform_driver vip_pdrv = {
+	.probe		= vip_probe,
+	.remove		= vip_remove,
+	.driver		= {
+		.name	= VIP_MODULE_NAME,
+		.of_match_table = of_match_ptr(vip_of_match),
+	},
+};
+
+module_platform_driver(vip_pdrv);
+
+MODULE_DESCRIPTION("TI VIP driver");
+MODULE_AUTHOR("Texas Instruments");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/ti/vpe/vip.h b/drivers/media/platform/ti/vpe/vip.h
new file mode 100644
index 000000000000..3f29686d8960
--- /dev/null
+++ b/drivers/media/platform/ti/vpe/vip.h
@@ -0,0 +1,721 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * TI VIP capture driver
+ *
+ * Copyright (C) 2025 Texas Instruments Incorpated - http://www.ti.com/
+ * David Griego, <dagriego@biglakesoftware.com>
+ * Dale Farnsworth, <dale@farnsworth.org>
+ * Yemike Abhilash Chandra, <y-abhilashchandra@ti.com>
+ */
+
+#ifndef __TI_VIP_H
+#define __TI_VIP_H
+
+#include <linux/videodev2.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/videobuf2-memops.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-async.h>
+
+#include "vpdma.h"
+#include "vpdma_priv.h"
+#include "sc.h"
+#include "csc.h"
+
+#define VIP_INSTANCE1	1
+#define VIP_INSTANCE2	2
+#define VIP_INSTANCE3	3
+
+#define VIP_SLICE1	0
+#define VIP_SLICE2	1
+#define VIP_NUM_SLICES	2
+
+/*
+ * Additional client identifiers used for VPDMA configuration descriptors
+ */
+#define VIP_SLICE1_CFD_SC_CLIENT	7
+#define VIP_SLICE2_CFD_SC_CLIENT	8
+
+#define VIP_PORTA	0
+#define VIP_PORTB	1
+#define VIP_NUM_PORTS	2
+
+#define VIP_MAX_PLANES	2
+#define	VIP_LUMA	0
+#define VIP_CHROMA	1
+
+#define VIP_CAP_STREAMS_PER_PORT	16
+#define VIP_VBI_STREAMS_PER_PORT	16
+
+#define VIP_MAX_SUBDEV			5
+
+#define VPDMA_FIRMWARE	"vpdma-1b8.bin"
+
+/*
+ * This value needs to be at least as large as the number of entry in
+ * vip_formats[].
+ * When vip_formats[] is modified make sure to adjust this value also.
+ */
+#define VIP_MAX_ACTIVE_FMT		16
+/*
+ * Colorspace conversion unit can be in one of 3 modes:
+ * NA  - Not Available on this port
+ * Y2R - Needed for YUV to RGB on this port
+ * R2Y - Needed for RGB to YUV on this port
+ */
+enum vip_csc_state {
+	VIP_CSC_NA = 0,
+	VIP_CSC_Y2R,
+	VIP_CSC_R2Y,
+};
+
+/* buffer for one video frame */
+struct vip_buffer {
+	/* common v4l buffer stuff */
+	struct vb2_v4l2_buffer	vb;
+	struct list_head	list;
+	bool			drop;
+};
+
+/*
+ * struct vip_fmt - VIP media bus format information
+ * @fourcc: V4L2 pixel format FCC identifier
+ * @code: V4L2 media bus format code
+ * @colorspace: V4L2 colorspace identifier
+ * @coplanar: 1 if unpacked Luma and Chroma, 0 otherwise (packed/interleaved)
+ * @vpdma_fmt: VPDMA data format per plane.
+ * @finfo: Cache v4l2_format_info for associated fourcc
+ */
+struct vip_fmt {
+	u32	fourcc;
+	u32	code;
+	u32	colorspace;
+	u8	coplanar;
+	const struct vpdma_data_format *vpdma_fmt[VIP_MAX_PLANES];
+	const struct v4l2_format_info *finfo;
+};
+
+/*
+ * The vip_parser_data structures contains the memory mapped
+ * info to access the parser registers.
+ */
+struct vip_parser_data {
+	void __iomem		*base;
+	struct resource		*res;
+
+	struct platform_device *pdev;
+};
+
+/*
+ * The vip_shared structure contains data that is shared by both
+ * the VIP1 and VIP2 slices.
+ */
+struct vip_shared {
+	struct list_head	list;
+	struct resource		*res;
+	void __iomem		*base;
+	struct vpdma_data	vpdma_data;
+	struct vpdma_data	*vpdma;
+	struct v4l2_device	v4l2_dev;
+	struct vip_dev		*devs[VIP_NUM_SLICES];
+	struct v4l2_ctrl_handler ctrl_handler;
+};
+
+struct vip_ctrl_module {
+	struct regmap	*syscon_pol;
+	u32		syscon_offset;
+	u32		syscon_bit_field[4];
+};
+
+/*
+ * There are two vip_dev structure, one for each vip slice: VIP1 & VIP2.
+ */
+struct vip_dev {
+	struct v4l2_device	v4l2_dev;
+	struct platform_device	*pdev;
+	struct vip_shared	*shared;
+	struct resource		*res;
+	struct vip_ctrl_module	*syscon;
+	int			instance_id;
+	int			slice_id;
+	int			num_ports;	/* count of open ports */
+	struct mutex		mutex;
+	/* protects access to stream buffer queues */
+	spinlock_t		slock;
+
+	int			irq;
+	void __iomem		*base;
+
+	struct vip_port		*ports[VIP_NUM_PORTS];
+
+	char			name[16];
+	/* parser data handle */
+	struct vip_parser_data	*parser;
+	/* scaler data handle */
+	struct sc_data		*sc;
+	/* scaler port assignation */
+	int			sc_assigned;
+	/* csc data handle */
+	struct csc_data		*csc;
+	/* csc port assignation */
+	int			csc_assigned;
+};
+
+/*
+ * There are two vip_port structures for each vip_dev, one for port A
+ * and one for port B.
+ */
+struct vip_port {
+	struct vip_dev		*dev;
+	int			port_id;
+
+	unsigned int		flags;
+	struct v4l2_rect	c_rect;		/* crop rectangle */
+	struct v4l2_mbus_framefmt mbus_framefmt;
+	struct v4l2_mbus_framefmt try_mbus_framefmt;
+
+	char			name[16];
+	struct vip_fmt		*fmt;		/* current format info */
+	/* Number of channels/streams configured */
+	int			num_streams_configured;
+	int			num_streams;	/* count of open streams */
+	struct vip_stream	*cap_streams[VIP_CAP_STREAMS_PER_PORT];
+
+	struct v4l2_async_notifier notifier;
+	struct v4l2_subdev	*subdev;
+	struct v4l2_fwnode_endpoint endpoint;
+	struct vip_bt656_bus	bt656_endpoint;
+	struct vip_fmt		*active_fmt[VIP_MAX_ACTIVE_FMT];
+	int			num_active_fmt;
+	/* have new shadow reg values */
+	bool			load_mmrs;
+	/* shadow reg addr/data block */
+	struct vpdma_buf	mmr_adb;
+	/* h coeff buffer */
+	struct vpdma_buf	sc_coeff_h;
+	/* v coeff buffer */
+	struct vpdma_buf	sc_coeff_v;
+	/* Show if scaler resource is available on this port */
+	bool			scaler;
+	/* Show the csc resource state on this port */
+	enum vip_csc_state	csc;
+};
+
+/*
+ * When handling multiplexed video, there can be multiple streams for each
+ * port.  The vip_stream structure holds per-stream data.
+ */
+struct vip_stream {
+	struct video_device	*vfd;
+	struct vip_port		*port;
+	int			stream_id;
+	int			list_num;
+	int			vfl_type;
+	char			name[16];
+	struct work_struct	recovery_work;
+	int			num_recovery;
+	enum v4l2_field		field;		/* current field */
+	unsigned int		sequence;	/* current frame/field seq */
+	enum v4l2_field		sup_field;	/* supported field value */
+	unsigned int		width;		/* frame width */
+	unsigned int		height;		/* frame height */
+	unsigned int		bytesperline;	/* bytes per line in memory */
+	unsigned int		sizeimage;	/* image size in memory */
+	struct list_head	vidq;		/* incoming vip_bufs queue */
+	struct list_head	dropq;		/* drop vip_bufs queue */
+	struct list_head	post_bufs;	/* vip_bufs to be DMAed */
+	/* Maintain a list of used channels - Needed for VPDMA cleanup */
+	int			vpdma_channels[VPDMA_MAX_CHANNELS];
+	int			vpdma_channels_to_abort[VPDMA_MAX_CHANNELS];
+	struct vpdma_desc_list	desc_list;	/* DMA descriptor list */
+	struct vpdma_dtd	*write_desc;
+	/* next unused desc_list addr */
+	void			*desc_next;
+	struct vb2_queue	vb_vidq;
+};
+
+/*
+ * VIP Enumerations
+ */
+enum data_path_select {
+	ALL_FIELDS_DATA_SELECT = 0,
+	VIP_CSC_SRC_DATA_SELECT,
+	VIP_SC_SRC_DATA_SELECT,
+	VIP_RGB_SRC_DATA_SELECT,
+	VIP_RGB_OUT_LO_DATA_SELECT,
+	VIP_RGB_OUT_HI_DATA_SELECT,
+	VIP_CHR_DS_1_SRC_DATA_SELECT,
+	VIP_CHR_DS_2_SRC_DATA_SELECT,
+	VIP_MULTI_CHANNEL_DATA_SELECT,
+	VIP_CHR_DS_1_DATA_BYPASS,
+	VIP_CHR_DS_2_DATA_BYPASS,
+};
+
+enum data_interface_modes {
+	SINGLE_24B_INTERFACE = 0,
+	SINGLE_16B_INTERFACE = 1,
+	DUAL_8B_INTERFACE = 2,
+};
+
+enum sync_types {
+	EMBEDDED_SYNC_SINGLE_YUV422 = 0,
+	EMBEDDED_SYNC_2X_MULTIPLEXED_YUV422 = 1,
+	EMBEDDED_SYNC_4X_MULTIPLEXED_YUV422 = 2,
+	EMBEDDED_SYNC_LINE_MULTIPLEXED_YUV422 = 3,
+	DISCRETE_SYNC_SINGLE_YUV422 = 4,
+	EMBEDDED_SYNC_SINGLE_RGB_OR_YUV444 = 5,
+	DISCRETE_SYNC_SINGLE_RGB_24B = 10,
+};
+
+#define VIP_NOT_ASSIGNED	-1
+
+/*
+ * Register offsets and field selectors
+ */
+#define VIP_PID_FUNC			0xf02
+
+#define VIP_PID				0x0000
+#define VIP_PID_MINOR_MASK              0x3f
+#define VIP_PID_MINOR_SHIFT             0
+#define VIP_PID_CUSTOM_MASK             0x03
+#define VIP_PID_CUSTOM_SHIFT            6
+#define VIP_PID_MAJOR_MASK              0x07
+#define VIP_PID_MAJOR_SHIFT             8
+#define VIP_PID_RTL_MASK                0x1f
+#define VIP_PID_RTL_SHIFT               11
+#define VIP_PID_FUNC_MASK               0xfff
+#define VIP_PID_FUNC_SHIFT              16
+#define VIP_PID_SCHEME_MASK             0x03
+#define VIP_PID_SCHEME_SHIFT            30
+
+#define VIP_SYSCONFIG			0x0010
+#define VIP_SYSCONFIG_IDLE_MASK         0x03
+#define VIP_SYSCONFIG_IDLE_SHIFT        2
+#define VIP_SYSCONFIG_STANDBY_MASK      0x03
+#define VIP_SYSCONFIG_STANDBY_SHIFT     4
+#define VIP_FORCE_IDLE_MODE             0
+#define VIP_NO_IDLE_MODE                1
+#define VIP_SMART_IDLE_MODE             2
+#define VIP_SMART_IDLE_WAKEUP_MODE      3
+#define VIP_FORCE_STANDBY_MODE          0
+#define VIP_NO_STANDBY_MODE             1
+#define VIP_SMART_STANDBY_MODE          2
+#define VIP_SMART_STANDBY_WAKEUP_MODE   3
+
+#define VIP_INTC_INTX_OFFSET		0x0020
+
+#define VIP_INT0_STATUS0_RAW_SET	0x0020
+#define VIP_INT0_STATUS0_RAW		VIP_INT0_STATUS0_RAW_SET
+#define VIP_INT0_STATUS0_CLR		0x0028
+#define VIP_INT0_STATUS0		VIP_INT0_STATUS0_CLR
+#define VIP_INT0_ENABLE0_SET		0x0030
+#define VIP_INT0_ENABLE0		VIP_INT0_ENABLE0_SET
+#define VIP_INT0_ENABLE0_CLR		0x0038
+#define VIP_INT0_LIST0_COMPLETE         BIT(0)
+#define VIP_INT0_LIST0_NOTIFY           BIT(1)
+#define VIP_INT0_LIST1_COMPLETE         BIT(2)
+#define VIP_INT0_LIST1_NOTIFY           BIT(3)
+#define VIP_INT0_LIST2_COMPLETE         BIT(4)
+#define VIP_INT0_LIST2_NOTIFY           BIT(5)
+#define VIP_INT0_LIST3_COMPLETE         BIT(6)
+#define VIP_INT0_LIST3_NOTIFY           BIT(7)
+#define VIP_INT0_LIST4_COMPLETE         BIT(8)
+#define VIP_INT0_LIST4_NOTIFY           BIT(9)
+#define VIP_INT0_LIST5_COMPLETE         BIT(10)
+#define VIP_INT0_LIST5_NOTIFY           BIT(11)
+#define VIP_INT0_LIST6_COMPLETE         BIT(12)
+#define VIP_INT0_LIST6_NOTIFY           BIT(13)
+#define VIP_INT0_LIST7_COMPLETE         BIT(14)
+#define VIP_INT0_LIST7_NOTIFY           BIT(15)
+#define VIP_INT0_DESCRIPTOR             BIT(16)
+#define VIP_VIP1_PARSER_INT		BIT(20)
+#define VIP_VIP2_PARSER_INT		BIT(21)
+
+#define VIP_INT0_STATUS1_RAW_SET        0x0024
+#define VIP_INT0_STATUS1_RAW            VIP_INT0_STATUS0_RAW_SET
+#define VIP_INT0_STATUS1_CLR            0x002c
+#define VIP_INT0_STATUS1                VIP_INT0_STATUS0_CLR
+#define VIP_INT0_ENABLE1_SET            0x0034
+#define VIP_INT0_ENABLE1                VIP_INT0_ENABLE0_SET
+#define VIP_INT0_ENABLE1_CLR            0x003c
+#define VIP_INT0_ENABLE1_STAT		0x004c
+#define VIP_INT0_CHANNEL_GROUP0		BIT(0)
+#define VIP_INT0_CHANNEL_GROUP1		BIT(1)
+#define VIP_INT0_CHANNEL_GROUP2		BIT(2)
+#define VIP_INT0_CHANNEL_GROUP3		BIT(3)
+#define VIP_INT0_CHANNEL_GROUP4		BIT(4)
+#define VIP_INT0_CHANNEL_GROUP5		BIT(5)
+#define VIP_INT0_CLIENT			BIT(7)
+#define VIP_VIP1_DS1_UV_ERROR_INT	BIT(22)
+#define VIP_VIP1_DS2_UV_ERROR_INT	BIT(23)
+#define VIP_VIP2_DS1_UV_ERROR_INT	BIT(24)
+#define VIP_VIP2_DS2_UV_ERROR_INT	BIT(25)
+
+#define VIP_INTC_E0I			0x00a0
+
+#define VIP_CLK_ENABLE			0x0100
+#define VIP_VPDMA_CLK_ENABLE		BIT(0)
+#define VIP_VIP1_DATA_PATH_CLK_ENABLE	BIT(16)
+#define VIP_VIP2_DATA_PATH_CLK_ENABLE	BIT(17)
+
+#define VIP_CLK_RESET			0x0104
+#define VIP_VPDMA_RESET			BIT(0)
+#define VIP_VPDMA_CLK_RESET_MASK	0x1
+#define VIP_VPDMA_CLK_RESET_SHIFT	0
+#define VIP_DATA_PATH_CLK_RESET_MASK	0x1
+#define VIP_VIP1_DATA_PATH_RESET_SHIFT	16
+#define VIP_VIP2_DATA_PATH_RESET_SHIFT	17
+#define VIP_VIP1_DATA_PATH_RESET	BIT(16)
+#define VIP_VIP2_DATA_PATH_RESET	BIT(17)
+#define VIP_VIP1_PARSER_RESET		BIT(18)
+#define VIP_VIP2_PARSER_RESET		BIT(19)
+#define VIP_VIP1_CSC_RESET		BIT(20)
+#define VIP_VIP2_CSC_RESET		BIT(21)
+#define VIP_VIP1_SC_RESET		BIT(22)
+#define VIP_VIP2_SC_RESET		BIT(23)
+#define VIP_VIP1_DS1_RESET		BIT(25)
+#define VIP_VIP2_DS1_RESET		BIT(26)
+#define VIP_VIP1_DS2_RESET		BIT(27)
+#define VIP_VIP2_DS2_RESET		BIT(28)
+#define VIP_MAIN_RESET			BIT(31)
+
+#define VIP_VIP1_DATA_PATH_SELECT	0x010c
+#define VIP_VIP2_DATA_PATH_SELECT	0x0110
+#define VIP_CSC_SRC_SELECT_MASK		0x07
+#define VIP_CSC_SRC_SELECT_SHFT		0
+#define VIP_SC_SRC_SELECT_MASK		0x07
+#define VIP_SC_SRC_SELECT_SHFT		3
+#define VIP_RGB_SRC_SELECT		BIT(6)
+#define VIP_RGB_OUT_LO_SRC_SELECT	BIT(7)
+#define VIP_RGB_OUT_HI_SRC_SELECT	BIT(8)
+#define VIP_DS1_SRC_SELECT_MASK		0x07
+#define VIP_DS1_SRC_SELECT_SHFT		9
+#define VIP_DS2_SRC_SELECT_MASK		0x07
+#define VIP_DS2_SRC_SELECT_SHFT		12
+#define VIP_MULTI_CHANNEL_SELECT	BIT(15)
+#define VIP_DS1_BYPASS			BIT(16)
+#define VIP_DS2_BYPASS			BIT(17)
+#define VIP_TESTPORT_B_SELECT		BIT(26)
+#define VIP_TESTPORT_A_SELECT		BIT(27)
+#define VIP_DATAPATH_SELECT_MASK	0x0f
+#define VIP_DATAPATH_SELECT_SHFT	28
+
+#define VIP_PARSER_MAIN_CFG		0x0000
+#define VIP_DATA_INTERFACE_MODE_MASK	0x03
+#define VIP_DATA_INTERFACE_MODE_SHFT	0
+#define VIP_CLIP_BLANK			BIT(4)
+#define VIP_CLIP_ACTIVE			BIT(5)
+
+#define VIP_SLICE0_PARSER		0x5500
+#define VIP_SLICE1_PARSER		0x5a00
+#define VIP_PARSER_PORTA_0		0x0004
+#define VIP_PARSER_PORTB_0		0x000c
+#define VIP_SYNC_TYPE_MASK		0x0f
+#define VIP_SYNC_TYPE_SHFT		0
+#define VIP_CTRL_CHANNEL_SEL_MASK	0x03
+#define VIP_CTRL_CHANNEL_SEL_SHFT	4
+#define VIP_ASYNC_FIFO_WR		BIT(6)
+#define VIP_ASYNC_FIFO_RD		BIT(7)
+#define VIP_PORT_ENABLE			BIT(8)
+#define VIP_FID_POLARITY		BIT(9)
+#define VIP_PIXCLK_EDGE_POLARITY	BIT(10)
+#define VIP_HSYNC_POLARITY		BIT(11)
+#define VIP_VSYNC_POLARITY		BIT(12)
+#define VIP_ACTVID_POLARITY		BIT(13)
+#define VIP_FID_DETECT_MODE		BIT(14)
+#define VIP_USE_ACTVID_HSYNC_ONLY	BIT(15)
+#define VIP_FID_SKEW_PRECOUNT_MASK	0x3f
+#define VIP_FID_SKEW_PRECOUNT_SHFT	16
+#define VIP_DISCRETE_BASIC_MODE		BIT(22)
+#define VIP_SW_RESET			BIT(23)
+#define VIP_FID_SKEW_POSTCOUNT_MASK	0x3f
+#define VIP_FID_SKEW_POSTCOUNT_SHFT	24
+#define VIP_ANALYZER_2X4X_SRCNUM_POS	BIT(30)
+#define VIP_ANALYZER_FVH_ERR_COR_EN	BIT(31)
+
+#define VIP_PARSER_PORTA_1		0x0008
+#define VIP_PARSER_PORTB_1		0x0010
+#define VIP_SRC0_NUMLINES_MASK		0x0fff
+#define VIP_SRC0_NUMLINES_SHFT		0
+#define VIP_ANC_CHAN_SEL_8B_MASK	0x03
+#define VIP_ANC_CHAN_SEL_8B_SHFT	13
+#define VIP_SRC0_NUMPIX_MASK		0x0fff
+#define VIP_SRC0_NUMPIX_SHFT		16
+#define VIP_REPACK_SEL_MASK		0x07
+#define VIP_REPACK_SEL_SHFT		28
+
+#define VIP_PARSER_FIQ_MASK		0x0014
+#define VIP_PARSER_FIQ_CLR		0x0018
+#define VIP_PARSER_FIQ_STATUS		0x001c
+#define VIP_PORTA_VDET			BIT(0)
+#define VIP_PORTB_VDET			BIT(1)
+#define VIP_PORTA_ASYNC_FIFO_OF		BIT(2)
+#define VIP_PORTB_ASYNC_FIFO_OF		BIT(3)
+#define VIP_PORTA_OUTPUT_FIFO_YUV	BIT(4)
+#define VIP_PORTA_OUTPUT_FIFO_ANC	BIT(6)
+#define VIP_PORTB_OUTPUT_FIFO_YUV	BIT(7)
+#define VIP_PORTB_OUTPUT_FIFO_ANC	BIT(9)
+#define VIP_PORTA_CONN			BIT(10)
+#define VIP_PORTA_DISCONN		BIT(11)
+#define VIP_PORTB_CONN			BIT(12)
+#define VIP_PORTB_DISCONN		BIT(13)
+#define VIP_PORTA_SRC0_SIZE		BIT(14)
+#define VIP_PORTB_SRC0_SIZE		BIT(15)
+#define VIP_PORTA_YUV_PROTO_VIOLATION	BIT(16)
+#define VIP_PORTA_ANC_PROTO_VIOLATION	BIT(17)
+#define VIP_PORTB_YUV_PROTO_VIOLATION	BIT(18)
+#define VIP_PORTB_ANC_PROTO_VIOLATION	BIT(19)
+#define VIP_PORTA_CFG_DISABLE_COMPLETE	BIT(20)
+#define VIP_PORTB_CFG_DISABLE_COMPLETE	BIT(21)
+
+#define VIP_PARSER_PORTA_SOURCE_FID	0x0020
+#define VIP_PARSER_PORTA_ENCODER_FID	0x0024
+#define VIP_PARSER_PORTB_SOURCE_FID	0x0028
+#define VIP_PARSER_PORTB_ENCODER_FID	0x002c
+
+#define VIP_PARSER_PORTA_SRC0_SIZE	0x0030
+#define VIP_PARSER_PORTB_SRC0_SIZE	0x0070
+#define VIP_SOURCE_HEIGHT_MASK		0x0fff
+#define VIP_SOURCE_HEIGHT_SHFT		0
+#define VIP_SOURCE_WIDTH_MASK		0x0fff
+#define VIP_SOURCE_WIDTH_SHFT		16
+
+#define VIP_PARSER_PORTA_VDET_VEC	0x00b0
+#define VIP_PARSER_PORTB_VDET_VEC	0x00b4
+
+#define VIP_PARSER_PORTA_EXTRA2		0x00b8
+#define VIP_PARSER_PORTB_EXTRA2		0x00c8
+#define VIP_ANC_SKIP_NUMPIX_MASK	0x0fff
+#define VIP_ANC_SKIP_NUMPIX_SHFT	0
+#define VIP_ANC_BYPASS			BIT(15)
+#define VIP_ANC_USE_NUMPIX_MASK		0x0fff
+#define VIP_ANC_USE_NUMPIX_SHFT		16
+#define VIP_ANC_TARGET_SRCNUM_MASK	0x0f
+#define VIP_ANC_TARGET_SRCNUM_SHFT	28
+
+#define VIP_PARSER_PORTA_EXTRA3		0x00bc
+#define VIP_PARSER_PORTB_EXTRA3		0x00cc
+#define VIP_ANC_SKIP_NUMLINES_MASK	0x0fff
+#define VIP_ANC_SKIP_NUMLINES_SHFT	0
+#define VIP_ANC_USE_NUMLINES_MASK	0x0fff
+#define VIP_ANC_USE_NUMLINES_SHFT	16
+
+#define VIP_PARSER_PORTA_EXTRA4		0x00c0
+#define VIP_PARSER_PORTB_EXTRA4		0x00d0
+#define VIP_ACT_SKIP_NUMPIX_MASK	0x0fff
+#define VIP_ACT_SKIP_NUMPIX_SHFT	0
+#define VIP_ACT_BYPASS			BIT(15)
+#define VIP_ACT_USE_NUMPIX_MASK		0x0fff
+#define VIP_ACT_USE_NUMPIX_SHFT		16
+#define VIP_ACT_TARGET_SRCNUM_MASK	0x0f
+#define VIP_ACT_TARGET_SRCNUM_SHFT	28
+
+#define VIP_PARSER_PORTA_EXTRA5		0x00c4
+#define VIP_PARSER_PORTB_EXTRA5		0x00d4
+#define VIP_ACT_SKIP_NUMLINES_MASK	0x0fff
+#define VIP_ACT_SKIP_NUMLINES_SHFT	0
+#define VIP_ACT_USE_NUMLINES_MASK	0x0fff
+#define VIP_ACT_USE_NUMLINES_SHFT	16
+
+#define VIP_PARSER_PORTA_EXTRA6		0x00d8
+#define VIP_PARSER_PORTB_EXTRA6		0x00dc
+#define VIP_ANC_SRCNUM_STOP_IMM_SHFT	0
+#define VIP_YUV_SRCNUM_STOP_IMM_SHFT	16
+
+#define VIP_SLICE0_CSC			0x5700
+#define VIP_SLICE1_CSC			0x5c00
+#define VIP_CSC_CSC00			0x0200
+#define VIP_CSC_A0_MASK			0x1fff
+#define VIP_CSC_A0_SHFT			0
+#define VIP_CSC_B0_MASK			0x1fff
+#define VIP_CSC_B0_SHFT			16
+
+#define VIP_CSC_CSC01			0x0204
+#define VIP_CSC_C0_MASK			0x1fff
+#define VIP_CSC_C0_SHFT			0
+#define VIP_CSC_A1_MASK			0x1fff
+#define VIP_CSC_A1_SHFT			16
+
+#define VIP_CSC_CSC02			0x0208
+#define VIP_CSC_B1_MASK			0x1fff
+#define VIP_CSC_B1_SHFT			0
+#define VIP_CSC_C1_MASK			0x1fff
+#define VIP_CSC_C1_SHFT			16
+
+#define VIP_CSC_CSC03			0x020c
+#define VIP_CSC_A2_MASK			0x1fff
+#define VIP_CSC_A2_SHFT			0
+#define VIP_CSC_B2_MASK			0x1fff
+#define VIP_CSC_B2_SHFT			16
+
+#define VIP_CSC_CSC04			0x0210
+#define VIP_CSC_C2_MASK			0x1fff
+#define VIP_CSC_C2_SHFT			0
+#define VIP_CSC_D0_MASK			0x0fff
+#define VIP_CSC_D0_SHFT			16
+
+#define VIP_CSC_CSC05			0x0214
+#define VIP_CSC_D1_MASK			0x0fff
+#define VIP_CSC_D1_SHFT			0
+#define VIP_CSC_D2_MASK			0x0fff
+#define VIP_CSC_D2_SHFT			16
+#define VIP_CSC_BYPASS			BIT(28)
+
+#define VIP_SLICE0_SC			0x5800
+#define VIP_SLICE1_SC			0x5d00
+#define VIP_SC_MP_SC0			0x0300
+#define VIP_INTERLACE_O			BIT(0)
+#define VIP_LINEAR			BIT(1)
+#define VIP_SC_BYPASS			BIT(2)
+#define VIP_INVT_FID			BIT(3)
+#define VIP_USE_RAV			BIT(4)
+#define VIP_ENABLE_EV			BIT(5)
+#define VIP_AUTH_HS			BIT(6)
+#define VIP_DCM_2X			BIT(7)
+#define VIP_DCM_4X			BIT(8)
+#define VIP_HP_BYPASS			BIT(9)
+#define VIP_INTERLACE_I			BIT(10)
+#define VIP_ENABLE_SIN2_VER_INTP	BIT(11)
+#define VIP_Y_PK_EN			BIT(14)
+#define VIP_TRIM			BIT(15)
+#define VIP_SELFGEN_FID			BIT(16)
+
+#define VIP_SC_MP_SC1			0x0304
+#define VIP_ROW_ACC_INC_MASK		0x07ffffff
+#define VIP_ROW_ACC_INC_SHFT		0
+
+#define VIP_SC_MP_SC2			0x0308
+#define VIP_ROW_ACC_OFFSET_MASK		0x0fffffff
+#define VIP_ROW_ACC_OFFSET_SHFT		0
+
+#define VIP_SC_MP_SC3			0x030c
+#define VIP_ROW_ACC_OFFSET_B_MASK	0x0fffffff
+#define VIP_ROW_ACC_OFFSET_B_SHFT	0
+
+#define VIP_SC_MP_SC4			0x0310
+#define VIP_TAR_H_MASK			0x07ff
+#define VIP_TAR_H_SHFT			0
+#define VIP_TAR_W_MASK			0x07ff
+#define VIP_TAR_W_SHFT			12
+#define VIP_LIN_ACC_INC_U_MASK		0x07
+#define VIP_LIN_ACC_INC_U_SHFT		24
+#define VIP_NLIN_ACC_INIT_U_MASK	0x07
+#define VIP_NLIN_ACC_INIT_U_SHFT	28
+
+#define VIP_SC_MP_SC5			0x0314
+#define VIP_SRC_H_MASK			0x03ff
+#define VIP_SRC_H_SHFT			0
+#define VIP_SRC_W_MASK			0x07ff
+#define VIP_SRC_W_SHFT			12
+#define VIP_NLIN_ACC_INC_U_MASK		0x07
+#define VIP_NLIN_ACC_INC_U_SHFT		24
+
+#define VIP_SC_MP_SC6			0x0318
+#define VIP_ROW_ACC_INIT_RAV_MASK	0x03ff
+#define VIP_ROW_ACC_INIT_RAV_SHFT	0
+#define VIP_ROW_ACC_INIT_RAV_B_MASK	0x03ff
+#define VIP_ROW_ACC_INIT_RAV_B_SHFT	10
+
+#define VIP_SC_MP_SC8			0x0320
+#define VIP_NLIN_LEFT_MASK		0x07ff
+#define VIP_NLIN_LEFT_SHFT		0
+#define VIP_NLIN_RIGHT_MASK		0x07ff
+#define VIP_NLIN_RIGHT_SHFT		12
+
+#define VIP_SC_MP_SC9			0x0324
+#define VIP_LIN_ACC_INC			VIP_SC_MP_SC9
+
+#define VIP_SC_MP_SC10			0x0328
+#define VIP_NLIN_ACC_INIT		VIP_SC_MP_SC10
+
+#define VIP_SC_MP_SC11			0x032c
+#define VIP_NLIN_ACC_INC		VIP_SC_MP_SC11
+
+#define VIP_SC_MP_SC12			0x0330
+#define VIP_COL_ACC_OFFSET_MASK		0x01ffffff
+#define VIP_COL_ACC_OFFSET_SHFT		0
+
+#define VIP_SC_MP_SC13			0x0334
+#define VIP_SC_FACTOR_RAV_MASK		0x03ff
+#define VIP_SC_FACTOR_RAV_SHFT		0
+#define VIP_CHROMA_INTP_THR_MASK	0x03ff
+#define VIP_CHROMA_INTP_THR_SHFT	12
+#define VIP_DELTA_CHROMA_THR_MASK	0x0f
+#define VIP_DELTA_CHROMA_THR_SHFT	24
+
+#define VIP_SC_MP_SC17			0x0344
+#define VIP_EV_THR_MASK			0x03ff
+#define VIP_EV_THR_SHFT			12
+#define VIP_DELTA_LUMA_THR_MASK		0x0f
+#define VIP_DELTA_LUMA_THR_SHFT		24
+#define VIP_DELTA_EV_THR_MASK		0x0f
+#define VIP_DELTA_EV_THR_SHFT		28
+
+#define VIP_SC_MP_SC18			0x0348
+#define VIP_HS_FACTOR_MASK		0x03ff
+#define VIP_HS_FACTOR_SHFT		0
+#define VIP_CONF_DEFAULT_MASK		0x01ff
+#define VIP_CONF_DEFAULT_SHFT		16
+
+#define VIP_SC_MP_SC19			0x034c
+#define VIP_HPF_COEFF0_MASK		0xff
+#define VIP_HPF_COEFF0_SHFT		0
+#define VIP_HPF_COEFF1_MASK		0xff
+#define VIP_HPF_COEFF1_SHFT		8
+#define VIP_HPF_COEFF2_MASK		0xff
+#define VIP_HPF_COEFF2_SHFT		16
+#define VIP_HPF_COEFF3_MASK		0xff
+#define VIP_HPF_COEFF3_SHFT		23
+
+#define VIP_SC_MP_SC20			0x0350
+#define VIP_HPF_COEFF4_MASK		0xff
+#define VIP_HPF_COEFF4_SHFT		0
+#define VIP_HPF_COEFF5_MASK		0xff
+#define VIP_HPF_COEFF5_SHFT		8
+#define VIP_HPF_NORM_SHFT_MASK		0x07
+#define VIP_HPF_NORM_SHFT_SHFT		16
+#define VIP_NL_LIMIT_MASK		0x1ff
+#define VIP_NL_LIMIT_SHFT		20
+
+#define VIP_SC_MP_SC21			0x0354
+#define VIP_NL_LO_THR_MASK		0x01ff
+#define VIP_NL_LO_THR_SHFT		0
+#define VIP_NL_LO_SLOPE_MASK		0xff
+#define VIP_NL_LO_SLOPE_SHFT		16
+
+#define VIP_SC_MP_SC22			0x0358
+#define VIP_NL_HI_THR_MASK		0x01ff
+#define VIP_NL_HI_THR_SHFT		0
+#define VIP_NL_HI_SLOPE_SH_MASK		0x07
+#define VIP_NL_HI_SLOPE_SH_SHFT		16
+
+#define VIP_SC_MP_SC23			0x035c
+#define VIP_GRADIENT_THR_MASK		0x07ff
+#define VIP_GRADIENT_THR_SHFT		0
+#define VIP_GRADIENT_THR_RANGE_MASK	0x0f
+#define VIP_GRADIENT_THR_RANGE_SHFT	12
+#define VIP_MIN_GY_THR_MASK		0xff
+#define VIP_MIN_GY_THR_SHFT		16
+#define VIP_MIN_GY_THR_RANGE_MASK	0x0f
+#define VIP_MIN_GY_THR_RANGE_SHFT	28
+
+#define VIP_SC_MP_SC24			0x0360
+#define VIP_ORG_H_MASK			0x07ff
+#define VIP_ORG_H_SHFT			0
+#define VIP_ORG_W_MASK			0x07ff
+#define VIP_ORG_W_SHFT			16
+
+#define VIP_SC_MP_SC25			0x0364
+#define VIP_OFF_H_MASK			0x07ff
+#define VIP_OFF_H_SHFT			0
+#define VIP_OFF_W_MASK			0x07ff
+#define VIP_OFF_W_SHFT			16
+
+#define VIP_VPDMA_BASE			0xd000
+
+#endif
-- 
2.34.1


