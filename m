Return-Path: <linux-media+bounces-8782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ADB89A505
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 21:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD6701C20E1D
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 19:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C229173349;
	Fri,  5 Apr 2024 19:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gA4r/4VT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD92C17333A;
	Fri,  5 Apr 2024 19:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712345650; cv=none; b=dDXm8XkRczkqL8l8Wq1inaBS7OtcJE3L/4KMWFgajBA2AR000inFohLTcBjYP1nihv+M7df1dkuGSI+Liw3W/V0/J3IgEA0sBIktAuvK5wYaGWMCzfZb06+BqXkfyEnnuO24q0SPHKvx3ikuUCcvmxrpzI0IfxSUB1kj4qbe+j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712345650; c=relaxed/simple;
	bh=nINwy4nNneEUgbl/hpdwOFmLyLpPfQTOs5iOcdaaD+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YzfN2KsJ276qpovVBQyCuMJqFcZtXs0YEc21EM70/N++0As1YwBRMhY5up+w6ugCpXVSrTI7ja/JVHB6VzoO30NtX9KX1Uw37dnUjv6dtoYiLnaxegS8qLIc7SpAMxKKSVxM8xyJLaOCr7SFmG6LmzTS0jG0Tm09TQ53pSUmsJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gA4r/4VT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14658FAD;
	Fri,  5 Apr 2024 21:33:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712345602;
	bh=nINwy4nNneEUgbl/hpdwOFmLyLpPfQTOs5iOcdaaD+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gA4r/4VT+Ng3q81hUqolKFCiMAQXTQyuXR9rhsVdw3hWwqgwPAxiYiTGejphByb/9
	 P8k3WC4ROXoKIfX2F2BYwqj/EfxodDAqa+AJhWlcNNijOsYAEhQPvLgI8eUKpQDj9N
	 PfmAVuNPJ/FvSKkTGTqXchUjCpQ6QM8dlyfc086c=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com,
	linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v10 4/5] media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface
Date: Fri,  5 Apr 2024 22:33:42 +0300
Message-ID: <20240405193344.15297-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240405193344.15297-1-laurent.pinchart@ideasonboard.com>
References: <20240405193344.15297-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Add a driver for the Unicam camera receiver block on BCM283x processors.
It is represented as two video device nodes: unicam-image and
unicam-embedded which are connected to an internal subdev (named
unicam-subdev) in order to manage streams routing.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v8:

- Use MIPI_CSI2_DT_* macros
- Disable image stream on start error
- Move hardware configuration to unicam_sd_enable_streams()
- Get VC and DT from frame descriptor
- Don't cache fmtinfo in unicam_node
- Calculate line_int_freq based on subdev format
- Fix try_fmt_meta regression from v5
- Replace streaming flag with vb2_start_streaming_called()
- Use vb2_video_unregister_device()

Changes since v7:

- Indentation, line wrap and white space fixes
- Add copyright notice for Ideas on Board
- Use unsigned values for shifts in macro
- Replace condition and assignment with max()
- Don't set the serial to an empty string manually
- Don't use loop for lane clocks setting
- Store PUM value in struct unicam_format_info

Changes since v6:

- Fix typos in comments
- Drop outdated comment
- Indentation fixes
- Turn UNICAM_SD_PAD_* into an enum
- Drop unicam_format_info.metadata_fmt
- Remove unneeded dev_dbg()
- Report meta frame sizes as V4L2_FRMSIZE_TYPE_STEPWISE
- Drop stray semicolons
- Set V4L2_FMT_FLAG_META_LINE_BASED for metadata format
- Rename error label
- Use .get_mbus_config() to get number of data lanes
- Drop minimum of 3 buffers in .queue_setup()
- Merge locks for the two video nodes
- Rework start/stop to avoid race conditions

Changes since v5:

- Move to drivers/media/platform/broadcom/
- Port to the upstream V4L2 streams API
- Rebase on latest metadata API proposal
- Add missing error message
- Drop unneeded documentation block for unicam_isr()
- Drop unneeded dev_dbg() and dev_err() messages
- Drop unneeded streams_mask and fmt checks
- Drop unused unicam_sd_pad_is_sink()
- Drop unneeded includes
- Drop v4l2_ctrl_subscribe_event() call
- Use pm_runtime_resume_and_get()
- Indentation and line wrap fixes
- Let the framework set bus_info
- Use v4l2_fwnode_endpoint_parse()
- Fix media device cleanup
- Drop lane reordering checks
- Fix subdev state locking
- Drop extra debug messages
- Move clock handling to runtime PM handlers
- Reorder functions
- Rename init functions for more clarity
- Initialize runtime PM earlier
- Clarify error messages
- Simplify subdev init with local variable
- Fix subdev cleanup
- Fix typos and indentation
- Don't initialize local variables needlessly
- Simplify num lanes check
- Fix metadata handling in subdev set_fmt
- Drop manual fallback to .s_stream()
- Pass v4l2_pix_format to unicam_calc_format_size_bpl()
- Simplify unicam_set_default_format()
- Fix default format settings
- Add busy check in unicam_s_fmt_meta()
- Add missing \n at end of format strings
- Fix metadata handling in subdev set_fmt
- Fix locking when starting streaming
- Return buffers from start streaming fails
- Fix format validation for metadata node
- Use video_device_pipeline_{start,stop}() helpers
- Simplify format enumeration
- Drop unset variable
- Update MAINTAINERS entry
- Update to the upstream v4l2_async_nf API
- Update to the latest subdev routing API
- Update to the latest subdev state API
- Move from subdev .init_cfg() to .init_state()
- Update to the latest videobuf2 API
- Fix v4l2_subdev_enable_streams() error check
- Use correct pad for the connected subdev
- Return buffers to vb2 when start streaming fails
- Improve debugging in start streaming handler
- Simplify DMA address management
- Drop comment about bcm2835-camera driver
- Clarify comments that explain min/max sizes
- Pass v4l2_pix_format to unicam_try_fmt()
- Drop unneeded local variables
- Rename image-related constants and functions
- Turn unicam_fmt.metadata_fmt into bool
- Rename unicam_fmt to unicam_format_info
- Rename unicam_format_info variables to fmtinfo
- Rename unicam_node.v_fmt to fmt
- Add metadata formats for RAW10, RAW12 and RAW14
- Make metadata formats line-based
- Validate format on metadata video device
- Add Co-devlopped-by tags

Changes since v3:

- Add the vendor prefix for DT name
- Use the reg-names in DT parsing
- Remove MAINTAINERS entry

Changes since v2:

- Change code organization
- Remove unused variables
- Correct the fmt_meta functions
- Rewrite the start/stop streaming
  - You can now start the image node alone, but not the metadata one
  - The buffers are allocated per-node
  - only the required stream is started, if the route exists and is
    enabled
- Prefix the macros with UNICAM_ to not have too generic names
- Drop colorspace support

Changes since v1:

- Replace the unicam_{info,debug,error} macros with dev_*()
---
 MAINTAINERS                                   |    1 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/broadcom/Kconfig       |   23 +
 drivers/media/platform/broadcom/Makefile      |    3 +
 .../platform/broadcom/bcm2835-unicam-regs.h   |  246 ++
 .../media/platform/broadcom/bcm2835-unicam.c  | 2741 +++++++++++++++++
 7 files changed, 3016 insertions(+)
 create mode 100644 drivers/media/platform/broadcom/Kconfig
 create mode 100644 drivers/media/platform/broadcom/Makefile
 create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam-regs.h
 create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 91420f602eb9..037d065fb8bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4039,6 +4039,7 @@ M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
+F:	drivers/media/platform/bcm2835/
 
 BROADCOM BCM47XX MIPS ARCHITECTURE
 M:	Hauke Mehrtens <hauke@hauke-m.de>
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 91e54215de3a..2d79bfc68c15 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -67,6 +67,7 @@ source "drivers/media/platform/amlogic/Kconfig"
 source "drivers/media/platform/amphion/Kconfig"
 source "drivers/media/platform/aspeed/Kconfig"
 source "drivers/media/platform/atmel/Kconfig"
+source "drivers/media/platform/broadcom/Kconfig"
 source "drivers/media/platform/cadence/Kconfig"
 source "drivers/media/platform/chips-media/Kconfig"
 source "drivers/media/platform/intel/Kconfig"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 3296ec1ebe16..da17301f7439 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -10,6 +10,7 @@ obj-y += amlogic/
 obj-y += amphion/
 obj-y += aspeed/
 obj-y += atmel/
+obj-y += broadcom/
 obj-y += cadence/
 obj-y += chips-media/
 obj-y += intel/
diff --git a/drivers/media/platform/broadcom/Kconfig b/drivers/media/platform/broadcom/Kconfig
new file mode 100644
index 000000000000..cc2c9afcc948
--- /dev/null
+++ b/drivers/media/platform/broadcom/Kconfig
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config VIDEO_BCM2835_UNICAM
+	tristate "Broadcom BCM283x/BCM271x Unicam video capture driver"
+	depends on ARCH_BCM2835 || COMPILE_TEST
+	depends on PM
+	depends on VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_DMA_CONTIG
+	help
+	  Say Y here to enable support for the BCM283x/BCM271x CSI-2 receiver.
+	  This is a V4L2 driver that controls the CSI-2 receiver directly,
+	  independently from the VC4 firmware.
+
+	  This driver is mutually exclusive with the use of bcm2835-camera. The
+	  firmware will disable all access to the peripheral from within the
+	  firmware if it finds a DT node using it, and bcm2835-camera will
+	  therefore fail to probe.
+
+	  To compile this driver as a module, choose M here. The module will be
+	  called bcm2835-unicam.
diff --git a/drivers/media/platform/broadcom/Makefile b/drivers/media/platform/broadcom/Makefile
new file mode 100644
index 000000000000..03d2045aba2e
--- /dev/null
+++ b/drivers/media/platform/broadcom/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_VIDEO_BCM2835_UNICAM) += bcm2835-unicam.o
diff --git a/drivers/media/platform/broadcom/bcm2835-unicam-regs.h b/drivers/media/platform/broadcom/bcm2835-unicam-regs.h
new file mode 100644
index 000000000000..fce6fa92707c
--- /dev/null
+++ b/drivers/media/platform/broadcom/bcm2835-unicam-regs.h
@@ -0,0 +1,246 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/*
+ * Copyright (C) 2017-2020 Raspberry Pi Trading.
+ * Dave Stevenson <dave.stevenson@raspberrypi.com>
+ */
+
+#ifndef VC4_REGS_UNICAM_H
+#define VC4_REGS_UNICAM_H
+
+#include <linux/bits.h>
+
+/*
+ * The following values are taken from files found within the code drop
+ * made by Broadcom for the BCM21553 Graphics Driver, predominantly in
+ * brcm_usrlib/dag/vmcsx/vcinclude/hardware_vc4.h.
+ * They have been modified to be only the register offset.
+ */
+#define UNICAM_CTRL		0x000
+#define UNICAM_STA		0x004
+#define UNICAM_ANA		0x008
+#define UNICAM_PRI		0x00c
+#define UNICAM_CLK		0x010
+#define UNICAM_CLT		0x014
+#define UNICAM_DAT0		0x018
+#define UNICAM_DAT1		0x01c
+#define UNICAM_DAT2		0x020
+#define UNICAM_DAT3		0x024
+#define UNICAM_DLT		0x028
+#define UNICAM_CMP0		0x02c
+#define UNICAM_CMP1		0x030
+#define UNICAM_CAP0		0x034
+#define UNICAM_CAP1		0x038
+#define UNICAM_ICTL		0x100
+#define UNICAM_ISTA		0x104
+#define UNICAM_IDI0		0x108
+#define UNICAM_IPIPE		0x10c
+#define UNICAM_IBSA0		0x110
+#define UNICAM_IBEA0		0x114
+#define UNICAM_IBLS		0x118
+#define UNICAM_IBWP		0x11c
+#define UNICAM_IHWIN		0x120
+#define UNICAM_IHSTA		0x124
+#define UNICAM_IVWIN		0x128
+#define UNICAM_IVSTA		0x12c
+#define UNICAM_ICC		0x130
+#define UNICAM_ICS		0x134
+#define UNICAM_IDC		0x138
+#define UNICAM_IDPO		0x13c
+#define UNICAM_IDCA		0x140
+#define UNICAM_IDCD		0x144
+#define UNICAM_IDS		0x148
+#define UNICAM_DCS		0x200
+#define UNICAM_DBSA0		0x204
+#define UNICAM_DBEA0		0x208
+#define UNICAM_DBWP		0x20c
+#define UNICAM_DBCTL		0x300
+#define UNICAM_IBSA1		0x304
+#define UNICAM_IBEA1		0x308
+#define UNICAM_IDI1		0x30c
+#define UNICAM_DBSA1		0x310
+#define UNICAM_DBEA1		0x314
+#define UNICAM_MISC		0x400
+
+/*
+ * The following bitmasks are from the kernel released by Broadcom
+ * for Android - https://android.googlesource.com/kernel/bcm/
+ * The Rhea, Hawaii, and Java chips all contain the same VideoCore4
+ * Unicam block as BCM2835, as defined in eg
+ * arch/arm/mach-rhea/include/mach/rdb_A0/brcm_rdb_cam.h and similar.
+ * Values reworked to use the kernel BIT and GENMASK macros.
+ *
+ * Some of the bit mnenomics have been amended to match the datasheet.
+ */
+/* UNICAM_CTRL Register */
+#define UNICAM_CPE		BIT(0)
+#define UNICAM_MEM		BIT(1)
+#define UNICAM_CPR		BIT(2)
+#define UNICAM_CPM_MASK		GENMASK(3, 3)
+#define UNICAM_CPM_CSI2		0
+#define UNICAM_CPM_CCP2		1
+#define UNICAM_SOE		BIT(4)
+#define UNICAM_DCM_MASK		GENMASK(5, 5)
+#define UNICAM_DCM_STROBE	0
+#define UNICAM_DCM_DATA		1
+#define UNICAM_SLS		BIT(6)
+#define UNICAM_PFT_MASK		GENMASK(11, 8)
+#define UNICAM_OET_MASK		GENMASK(20, 12)
+
+/* UNICAM_STA Register */
+#define UNICAM_SYN		BIT(0)
+#define UNICAM_CS		BIT(1)
+#define UNICAM_SBE		BIT(2)
+#define UNICAM_PBE		BIT(3)
+#define UNICAM_HOE		BIT(4)
+#define UNICAM_PLE		BIT(5)
+#define UNICAM_SSC		BIT(6)
+#define UNICAM_CRCE		BIT(7)
+#define UNICAM_OES		BIT(8)
+#define UNICAM_IFO		BIT(9)
+#define UNICAM_OFO		BIT(10)
+#define UNICAM_BFO		BIT(11)
+#define UNICAM_DL		BIT(12)
+#define UNICAM_PS		BIT(13)
+#define UNICAM_IS		BIT(14)
+#define UNICAM_PI0		BIT(15)
+#define UNICAM_PI1		BIT(16)
+#define UNICAM_FSI_S		BIT(17)
+#define UNICAM_FEI_S		BIT(18)
+#define UNICAM_LCI_S		BIT(19)
+#define UNICAM_BUF0_RDY		BIT(20)
+#define UNICAM_BUF0_NO		BIT(21)
+#define UNICAM_BUF1_RDY		BIT(22)
+#define UNICAM_BUF1_NO		BIT(23)
+#define UNICAM_DI		BIT(24)
+
+#define UNICAM_STA_MASK_ALL \
+	(UNICAM_SBE  | UNICAM_PBE | UNICAM_HOE | UNICAM_PLE | UNICAM_SSC | \
+	 UNICAM_CRCE | UNICAM_IFO | UNICAM_OFO | UNICAM_DL  | UNICAM_PS  | \
+	 UNICAM_PI0  | UNICAM_PI1)
+
+/* UNICAM_ANA Register */
+#define UNICAM_APD		BIT(0)
+#define UNICAM_BPD		BIT(1)
+#define UNICAM_AR		BIT(2)
+#define UNICAM_DDL		BIT(3)
+#define UNICAM_CTATADJ_MASK	GENMASK(7, 4)
+#define UNICAM_PTATADJ_MASK	GENMASK(11, 8)
+
+/* UNICAM_PRI Register */
+#define UNICAM_PE		BIT(0)
+#define UNICAM_PT_MASK		GENMASK(2, 1)
+#define UNICAM_NP_MASK		GENMASK(7, 4)
+#define UNICAM_PP_MASK		GENMASK(11, 8)
+#define UNICAM_BS_MASK		GENMASK(15, 12)
+#define UNICAM_BL_MASK		GENMASK(17, 16)
+
+/* UNICAM_CLK Register */
+#define UNICAM_CLE		BIT(0)
+#define UNICAM_CLPD		BIT(1)
+#define UNICAM_CLLPE		BIT(2)
+#define UNICAM_CLHSE		BIT(3)
+#define UNICAM_CLTRE		BIT(4)
+#define UNICAM_CLAC_MASK	GENMASK(8, 5)
+#define UNICAM_CLSTE		BIT(29)
+
+/* UNICAM_CLT Register */
+#define UNICAM_CLT1_MASK	GENMASK(7, 0)
+#define UNICAM_CLT2_MASK	GENMASK(15, 8)
+
+/* UNICAM_DATn Registers */
+#define UNICAM_DLE		BIT(0)
+#define UNICAM_DLPD		BIT(1)
+#define UNICAM_DLLPE		BIT(2)
+#define UNICAM_DLHSE		BIT(3)
+#define UNICAM_DLTRE		BIT(4)
+#define UNICAM_DLSM		BIT(5)
+#define UNICAM_DLFO		BIT(28)
+#define UNICAM_DLSTE		BIT(29)
+
+#define UNICAM_DAT_MASK_ALL	(UNICAM_DLSTE | UNICAM_DLFO)
+
+/* UNICAM_DLT Register */
+#define UNICAM_DLT1_MASK	GENMASK(7, 0)
+#define UNICAM_DLT2_MASK	GENMASK(15, 8)
+#define UNICAM_DLT3_MASK	GENMASK(23, 16)
+
+/* UNICAM_ICTL Register */
+#define UNICAM_FSIE		BIT(0)
+#define UNICAM_FEIE		BIT(1)
+#define UNICAM_IBOB		BIT(2)
+#define UNICAM_FCM		BIT(3)
+#define UNICAM_TFC		BIT(4)
+#define UNICAM_LIP_MASK		GENMASK(6, 5)
+#define UNICAM_LCIE_MASK	GENMASK(28, 16)
+
+/* UNICAM_IDI0/1 Register */
+#define UNICAM_ID0_MASK		GENMASK(7, 0)
+#define UNICAM_ID1_MASK		GENMASK(15, 8)
+#define UNICAM_ID2_MASK		GENMASK(23, 16)
+#define UNICAM_ID3_MASK		GENMASK(31, 24)
+
+/* UNICAM_ISTA Register */
+#define UNICAM_FSI		BIT(0)
+#define UNICAM_FEI		BIT(1)
+#define UNICAM_LCI		BIT(2)
+
+#define UNICAM_ISTA_MASK_ALL	(UNICAM_FSI | UNICAM_FEI | UNICAM_LCI)
+
+/* UNICAM_IPIPE Register */
+#define UNICAM_PUM_MASK		GENMASK(2, 0)
+/* Unpacking modes */
+#define UNICAM_PUM_NONE		0
+#define UNICAM_PUM_UNPACK6	1
+#define UNICAM_PUM_UNPACK7	2
+#define UNICAM_PUM_UNPACK8	3
+#define UNICAM_PUM_UNPACK10	4
+#define UNICAM_PUM_UNPACK12	5
+#define UNICAM_PUM_UNPACK14	6
+#define UNICAM_PUM_UNPACK16	7
+#define UNICAM_DDM_MASK		GENMASK(6, 3)
+#define UNICAM_PPM_MASK		GENMASK(9, 7)
+/* Packing modes */
+#define UNICAM_PPM_NONE		0
+#define UNICAM_PPM_PACK8	1
+#define UNICAM_PPM_PACK10	2
+#define UNICAM_PPM_PACK12	3
+#define UNICAM_PPM_PACK14	4
+#define UNICAM_PPM_PACK16	5
+#define UNICAM_DEM_MASK		GENMASK(11, 10)
+#define UNICAM_DEBL_MASK	GENMASK(14, 12)
+#define UNICAM_ICM_MASK		GENMASK(16, 15)
+#define UNICAM_IDM_MASK		GENMASK(17, 17)
+
+/* UNICAM_ICC Register */
+#define UNICAM_ICFL_MASK	GENMASK(4, 0)
+#define UNICAM_ICFH_MASK	GENMASK(9, 5)
+#define UNICAM_ICST_MASK	GENMASK(12, 10)
+#define UNICAM_ICLT_MASK	GENMASK(15, 13)
+#define UNICAM_ICLL_MASK	GENMASK(31, 16)
+
+/* UNICAM_DCS Register */
+#define UNICAM_DIE		BIT(0)
+#define UNICAM_DIM		BIT(1)
+#define UNICAM_DBOB		BIT(3)
+#define UNICAM_FDE		BIT(4)
+#define UNICAM_LDP		BIT(5)
+#define UNICAM_EDL_MASK		GENMASK(15, 8)
+
+/* UNICAM_DBCTL Register */
+#define UNICAM_DBEN		BIT(0)
+#define UNICAM_BUF0_IE		BIT(1)
+#define UNICAM_BUF1_IE		BIT(2)
+
+/* UNICAM_CMP[0,1] register */
+#define UNICAM_PCE		BIT(31)
+#define UNICAM_GI		BIT(9)
+#define UNICAM_CPH		BIT(8)
+#define UNICAM_PCVC_MASK	GENMASK(7, 6)
+#define UNICAM_PCDT_MASK	GENMASK(5, 0)
+
+/* UNICAM_MISC register */
+#define UNICAM_FL0		BIT(6)
+#define UNICAM_FL1		BIT(9)
+
+#endif
diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
new file mode 100644
index 000000000000..e91d02a64770
--- /dev/null
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -0,0 +1,2741 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * BCM283x / BCM271x Unicam Capture Driver
+ *
+ * Copyright (C) 2017-2020 - Raspberry Pi (Trading) Ltd.
+ * Copyright (C) 2024 - Ideas on Board
+ *
+ * Dave Stevenson <dave.stevenson@raspberrypi.com>
+ *
+ * Based on TI am437x driver by
+ *   Benoit Parrot <bparrot@ti.com>
+ *   Lad, Prabhakar <prabhakar.csengg@gmail.com>
+ *
+ * and TI CAL camera interface driver by
+ *    Benoit Parrot <bparrot@ti.com>
+ *
+ *
+ * There are two camera drivers in the kernel for BCM283x - this one and
+ * bcm2835-camera (currently in staging).
+ *
+ * This driver directly controls the Unicam peripheral - there is no
+ * involvement with the VideoCore firmware. Unicam receives CSI-2 or CCP2 data
+ * and writes it into SDRAM. The only potential processing options are to
+ * repack Bayer data into an alternate format, and applying windowing. The
+ * repacking does not shift the data, so can repack V4L2_PIX_FMT_Sxxxx10P to
+ * V4L2_PIX_FMT_Sxxxx10, or V4L2_PIX_FMT_Sxxxx12P to V4L2_PIX_FMT_Sxxxx12, but
+ * not generically up to V4L2_PIX_FMT_Sxxxx16. Support for windowing may be
+ * added later.
+ *
+ * It should be possible to connect this driver to any sensor with a suitable
+ * output interface and V4L2 subdevice driver.
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/videodev2.h>
+
+#include <media/mipi-csi2.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "bcm2835-unicam-regs.h"
+
+#define UNICAM_MODULE_NAME		"unicam"
+
+/*
+ * Unicam must request a minimum of 250Mhz from the VPU clock.
+ * Otherwise the input FIFOs overrun and cause image corruption.
+ */
+#define UNICAM_MIN_VPU_CLOCK_RATE	(250 * 1000 * 1000)
+
+/* Unicam has an internal DMA alignment constraint of 16 bytes for each line. */
+#define UNICAM_DMA_BPL_ALIGNMENT	16
+
+/*
+ * The image stride is stored in a 16 bit register, and needs to be aligned to
+ * the DMA constraint. As the ISP in the same SoC has a 32 bytes alignment
+ * constraint on its input, set the image stride alignment to 32 bytes here as
+ * well to avoid incompatible configurations.
+ */
+#define UNICAM_IMAGE_BPL_ALIGNMENT	32
+#define UNICAM_IMAGE_MAX_BPL		((1U << 16) - UNICAM_IMAGE_BPL_ALIGNMENT)
+
+/*
+ * Max width is therefore determined by the max stride divided by the number of
+ * bits per pixel. Take 32bpp as a worst case. No imposed limit on the height,
+ * so adopt a square image for want of anything better.
+ */
+#define UNICAM_IMAGE_MIN_WIDTH		16
+#define UNICAM_IMAGE_MIN_HEIGHT		16
+#define UNICAM_IMAGE_MAX_WIDTH		(UNICAM_IMAGE_MAX_BPL / 4)
+#define UNICAM_IMAGE_MAX_HEIGHT		UNICAM_IMAGE_MAX_WIDTH
+
+/*
+ * There's no intrinsic limits on the width and height for embedded data. Use
+ * the same maximum values as for the image, to avoid overflows in the image
+ * size computation.
+ */
+#define UNICAM_META_MIN_WIDTH		1
+#define UNICAM_META_MIN_HEIGHT		1
+#define UNICAM_META_MAX_WIDTH		UNICAM_IMAGE_MAX_WIDTH
+#define UNICAM_META_MAX_HEIGHT		UNICAM_IMAGE_MAX_HEIGHT
+
+/*
+ * Size of the dummy buffer. Can be any size really, but the DMA
+ * allocation works in units of page sizes.
+ */
+#define UNICAM_DUMMY_BUF_SIZE		PAGE_SIZE
+
+enum unicam_pad {
+	UNICAM_SD_PAD_SINK,
+	UNICAM_SD_PAD_SOURCE_IMAGE,
+	UNICAM_SD_PAD_SOURCE_METADATA,
+	UNICAM_SD_NUM_PADS
+};
+
+enum unicam_node_type {
+	UNICAM_IMAGE_NODE,
+	UNICAM_METADATA_NODE,
+	UNICAM_MAX_NODES
+};
+
+/*
+ * struct unicam_format_info - Unicam media bus format information
+ * @fourcc: V4L2 pixel format FCC identifier. 0 if n/a.
+ * @unpacked_fourcc: V4L2 pixel format FCC identifier if the data is expanded
+ * out to 16bpp. 0 if n/a.
+ * @code: V4L2 media bus format code.
+ * @depth: Bits per pixel as delivered from the source.
+ * @csi_dt: CSI data type.
+ * @unpack: PUM value when unpacking to @unpacked_fourcc
+ */
+struct unicam_format_info {
+	u32	fourcc;
+	u32	unpacked_fourcc;
+	u32	code;
+	u8	depth;
+	u8	csi_dt;
+	u8	unpack;
+};
+
+struct unicam_buffer {
+	struct vb2_v4l2_buffer vb;
+	struct list_head list;
+	dma_addr_t dma_addr;
+	unsigned int size;
+};
+
+static inline struct unicam_buffer *to_unicam_buffer(struct vb2_buffer *vb)
+{
+	return container_of(vb, struct unicam_buffer, vb.vb2_buf);
+}
+
+struct unicam_node {
+	bool registered;
+	unsigned int id;
+
+	/* Pointer to the current v4l2_buffer */
+	struct unicam_buffer *cur_frm;
+	/* Pointer to the next v4l2_buffer */
+	struct unicam_buffer *next_frm;
+	/* Used to store current pixel format */
+	struct v4l2_format fmt;
+	/* Buffer queue used in video-buf */
+	struct vb2_queue buffer_queue;
+	/* Queue of filled frames */
+	struct list_head dma_queue;
+	/* IRQ lock for DMA queue */
+	spinlock_t dma_queue_lock;
+	/* Identifies video device for this channel */
+	struct video_device video_dev;
+	/* Pointer to the parent handle */
+	struct unicam_device *dev;
+	struct media_pad pad;
+	/*
+	 * Dummy buffer intended to be used by unicam
+	 * if we have no other queued buffers to swap to.
+	 */
+	struct unicam_buffer dummy_buf;
+	void *dummy_buf_cpu_addr;
+};
+
+struct unicam_device {
+	struct kref kref;
+
+	/* peripheral base address */
+	void __iomem *base;
+	/* clock gating base address */
+	void __iomem *clk_gate_base;
+	/* lp clock handle */
+	struct clk *clock;
+	/* vpu clock handle */
+	struct clk *vpu_clock;
+	/* V4l2 device */
+	struct v4l2_device v4l2_dev;
+	struct media_device mdev;
+
+	/* parent device */
+	struct device *dev;
+	/* subdevice async notifier */
+	struct v4l2_async_notifier notifier;
+	unsigned int sequence;
+
+	/* Sensor node */
+	struct {
+		struct v4l2_subdev *subdev;
+		struct media_pad *pad;
+	} sensor;
+
+	/* Internal subdev */
+	struct {
+		struct v4l2_subdev sd;
+		struct media_pad pads[UNICAM_SD_NUM_PADS];
+		unsigned int enabled_streams;
+	} subdev;
+
+	enum v4l2_mbus_type bus_type;
+	/*
+	 * Stores bus.mipi_csi2.flags for CSI2 sensors, or
+	 * bus.mipi_csi1.strobe for CCP2.
+	 */
+	unsigned int bus_flags;
+	unsigned int max_data_lanes;
+
+	struct {
+		struct media_pipeline pipe;
+		unsigned int num_data_lanes;
+		unsigned int nodes;
+	} pipe;
+
+	/* Lock used for the video devices of both nodes */
+	struct mutex lock;
+	struct unicam_node node[UNICAM_MAX_NODES];
+};
+
+static inline struct unicam_device *
+notifier_to_unicam_device(struct v4l2_async_notifier *notifier)
+{
+	return container_of(notifier, struct unicam_device, notifier);
+}
+
+static inline struct unicam_device *
+sd_to_unicam_device(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct unicam_device, subdev.sd);
+}
+
+static void unicam_release(struct kref *kref)
+{
+	struct unicam_device *unicam =
+		container_of(kref, struct unicam_device, kref);
+
+	if (unicam->mdev.dev)
+		media_device_cleanup(&unicam->mdev);
+
+	mutex_destroy(&unicam->lock);
+	kfree(unicam);
+}
+
+static struct unicam_device *unicam_get(struct unicam_device *unicam)
+{
+	kref_get(&unicam->kref);
+
+	return unicam;
+}
+
+static void unicam_put(struct unicam_device *unicam)
+{
+	kref_put(&unicam->kref, unicam_release);
+}
+
+/* -----------------------------------------------------------------------------
+ * Misc helper functions
+ */
+
+static inline bool unicam_sd_pad_is_source(u32 pad)
+{
+	/* Camera RX has 1 sink pad, and N source pads */
+	return pad != UNICAM_SD_PAD_SINK;
+}
+
+static inline bool is_metadata_node(struct unicam_node *node)
+{
+	return node->video_dev.device_caps & V4L2_CAP_META_CAPTURE;
+}
+
+static inline bool is_image_node(struct unicam_node *node)
+{
+	return node->video_dev.device_caps & V4L2_CAP_VIDEO_CAPTURE;
+}
+
+/* -----------------------------------------------------------------------------
+ * Format data table and helper functions
+ */
+
+static const struct v4l2_mbus_framefmt unicam_default_image_format = {
+	.width = 640,
+	.height = 480,
+	.code = MEDIA_BUS_FMT_UYVY8_1X16,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_SRGB,
+	.ycbcr_enc = V4L2_YCBCR_ENC_601,
+	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+	.xfer_func = V4L2_XFER_FUNC_SRGB,
+	.flags = 0,
+};
+
+static const struct v4l2_mbus_framefmt unicam_default_meta_format = {
+	.width = 640,
+	.height = 2,
+	.code = MEDIA_BUS_FMT_META_8,
+	.field = V4L2_FIELD_NONE,
+};
+
+static const struct unicam_format_info unicam_image_formats[] = {
+	/* YUV Formats */
+	{
+		.fourcc		= V4L2_PIX_FMT_YUYV,
+		.code		= MEDIA_BUS_FMT_YUYV8_1X16,
+		.depth		= 16,
+		.csi_dt		= MIPI_CSI2_DT_YUV422_8B,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_UYVY,
+		.code		= MEDIA_BUS_FMT_UYVY8_1X16,
+		.depth		= 16,
+		.csi_dt		= MIPI_CSI2_DT_YUV422_8B,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_YVYU,
+		.code		= MEDIA_BUS_FMT_YVYU8_1X16,
+		.depth		= 16,
+		.csi_dt		= MIPI_CSI2_DT_YUV422_8B,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_VYUY,
+		.code		= MEDIA_BUS_FMT_VYUY8_1X16,
+		.depth		= 16,
+		.csi_dt		= MIPI_CSI2_DT_YUV422_8B,
+	}, {
+	/* RGB Formats */
+		.fourcc		= V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */
+		.code		= MEDIA_BUS_FMT_RGB565_1X16,
+		.depth		= 16,
+		.csi_dt		= MIPI_CSI2_DT_RGB565,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_RGB24, /* rgb */
+		.code		= MEDIA_BUS_FMT_RGB888_1X24,
+		.depth		= 24,
+		.csi_dt		= MIPI_CSI2_DT_RGB888,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_BGR24, /* bgr */
+		.code		= MEDIA_BUS_FMT_BGR888_1X24,
+		.depth		= 24,
+		.csi_dt		= MIPI_CSI2_DT_RGB888,
+	}, {
+	/* Bayer Formats */
+		.fourcc		= V4L2_PIX_FMT_SBGGR8,
+		.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
+		.depth		= 8,
+		.csi_dt		= MIPI_CSI2_DT_RAW8,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGBRG8,
+		.code		= MEDIA_BUS_FMT_SGBRG8_1X8,
+		.depth		= 8,
+		.csi_dt		= MIPI_CSI2_DT_RAW8,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGRBG8,
+		.code		= MEDIA_BUS_FMT_SGRBG8_1X8,
+		.depth		= 8,
+		.csi_dt		= MIPI_CSI2_DT_RAW8,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SRGGB8,
+		.code		= MEDIA_BUS_FMT_SRGGB8_1X8,
+		.depth		= 8,
+		.csi_dt		= MIPI_CSI2_DT_RAW8,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SBGGR10P,
+		.unpacked_fourcc = V4L2_PIX_FMT_SBGGR10,
+		.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
+		.depth		= 10,
+		.csi_dt		= MIPI_CSI2_DT_RAW10,
+		.unpack		= UNICAM_PUM_UNPACK10,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGBRG10P,
+		.unpacked_fourcc = V4L2_PIX_FMT_SGBRG10,
+		.code		= MEDIA_BUS_FMT_SGBRG10_1X10,
+		.depth		= 10,
+		.csi_dt		= MIPI_CSI2_DT_RAW10,
+		.unpack		= UNICAM_PUM_UNPACK10,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGRBG10P,
+		.unpacked_fourcc = V4L2_PIX_FMT_SGRBG10,
+		.code		= MEDIA_BUS_FMT_SGRBG10_1X10,
+		.depth		= 10,
+		.csi_dt		= MIPI_CSI2_DT_RAW10,
+		.unpack		= UNICAM_PUM_UNPACK10,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SRGGB10P,
+		.unpacked_fourcc = V4L2_PIX_FMT_SRGGB10,
+		.code		= MEDIA_BUS_FMT_SRGGB10_1X10,
+		.depth		= 10,
+		.csi_dt		= MIPI_CSI2_DT_RAW10,
+		.unpack		= UNICAM_PUM_UNPACK10,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SBGGR12P,
+		.unpacked_fourcc = V4L2_PIX_FMT_SBGGR12,
+		.code		= MEDIA_BUS_FMT_SBGGR12_1X12,
+		.depth		= 12,
+		.csi_dt		= MIPI_CSI2_DT_RAW12,
+		.unpack		= UNICAM_PUM_UNPACK12,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGBRG12P,
+		.unpacked_fourcc = V4L2_PIX_FMT_SGBRG12,
+		.code		= MEDIA_BUS_FMT_SGBRG12_1X12,
+		.depth		= 12,
+		.csi_dt		= MIPI_CSI2_DT_RAW12,
+		.unpack		= UNICAM_PUM_UNPACK12,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGRBG12P,
+		.unpacked_fourcc = V4L2_PIX_FMT_SGRBG12,
+		.code		= MEDIA_BUS_FMT_SGRBG12_1X12,
+		.depth		= 12,
+		.csi_dt		= MIPI_CSI2_DT_RAW12,
+		.unpack		= UNICAM_PUM_UNPACK12,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SRGGB12P,
+		.unpacked_fourcc = V4L2_PIX_FMT_SRGGB12,
+		.code		= MEDIA_BUS_FMT_SRGGB12_1X12,
+		.depth		= 12,
+		.csi_dt		= MIPI_CSI2_DT_RAW12,
+		.unpack		= UNICAM_PUM_UNPACK12,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SBGGR14P,
+		.unpacked_fourcc = V4L2_PIX_FMT_SBGGR14,
+		.code		= MEDIA_BUS_FMT_SBGGR14_1X14,
+		.depth		= 14,
+		.csi_dt		= MIPI_CSI2_DT_RAW14,
+		.unpack		= UNICAM_PUM_UNPACK14,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGBRG14P,
+		.unpacked_fourcc = V4L2_PIX_FMT_SGBRG14,
+		.code		= MEDIA_BUS_FMT_SGBRG14_1X14,
+		.depth		= 14,
+		.csi_dt		= MIPI_CSI2_DT_RAW14,
+		.unpack		= UNICAM_PUM_UNPACK14,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGRBG14P,
+		.unpacked_fourcc = V4L2_PIX_FMT_SGRBG14,
+		.code		= MEDIA_BUS_FMT_SGRBG14_1X14,
+		.depth		= 14,
+		.csi_dt		= MIPI_CSI2_DT_RAW14,
+		.unpack		= UNICAM_PUM_UNPACK14,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SRGGB14P,
+		.unpacked_fourcc = V4L2_PIX_FMT_SRGGB14,
+		.code		= MEDIA_BUS_FMT_SRGGB14_1X14,
+		.depth		= 14,
+		.csi_dt		= MIPI_CSI2_DT_RAW14,
+		.unpack		= UNICAM_PUM_UNPACK14,
+	}, {
+	/* 16 bit Bayer formats could be supported. */
+
+	/* Greyscale formats */
+		.fourcc		= V4L2_PIX_FMT_GREY,
+		.code		= MEDIA_BUS_FMT_Y8_1X8,
+		.depth		= 8,
+		.csi_dt		= MIPI_CSI2_DT_RAW8,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_Y10P,
+		.unpacked_fourcc = V4L2_PIX_FMT_Y10,
+		.code		= MEDIA_BUS_FMT_Y10_1X10,
+		.depth		= 10,
+		.csi_dt		= MIPI_CSI2_DT_RAW10,
+		.unpack		= UNICAM_PUM_UNPACK10,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_Y12P,
+		.unpacked_fourcc = V4L2_PIX_FMT_Y12,
+		.code		= MEDIA_BUS_FMT_Y12_1X12,
+		.depth		= 12,
+		.csi_dt		= MIPI_CSI2_DT_RAW12,
+		.unpack		= UNICAM_PUM_UNPACK12,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_Y14P,
+		.unpacked_fourcc = V4L2_PIX_FMT_Y14,
+		.code		= MEDIA_BUS_FMT_Y14_1X14,
+		.depth		= 14,
+		.csi_dt		= MIPI_CSI2_DT_RAW14,
+		.unpack		= UNICAM_PUM_UNPACK14,
+	},
+};
+
+static const struct unicam_format_info unicam_meta_formats[] = {
+	{
+		.fourcc		= V4L2_META_FMT_GENERIC_8,
+		.code		= MEDIA_BUS_FMT_META_8,
+		.depth		= 8,
+	}, {
+		.fourcc		= V4L2_META_FMT_GENERIC_CSI2_10,
+		.code		= MEDIA_BUS_FMT_META_10,
+		.depth		= 10,
+	}, {
+		.fourcc		= V4L2_META_FMT_GENERIC_CSI2_12,
+		.code		= MEDIA_BUS_FMT_META_12,
+		.depth		= 12,
+	}, {
+		.fourcc		= V4L2_META_FMT_GENERIC_CSI2_14,
+		.code		= MEDIA_BUS_FMT_META_14,
+		.depth		= 14,
+	},
+};
+
+/* Format setup functions */
+static const struct unicam_format_info *
+unicam_find_format_by_code(u32 code, u32 pad)
+{
+	const struct unicam_format_info *formats;
+	unsigned int num_formats;
+	unsigned int i;
+
+	if (pad == UNICAM_SD_PAD_SOURCE_IMAGE) {
+		formats = unicam_image_formats;
+		num_formats = ARRAY_SIZE(unicam_image_formats);
+	} else {
+		formats = unicam_meta_formats;
+		num_formats = ARRAY_SIZE(unicam_meta_formats);
+	}
+
+	for (i = 0; i < num_formats; i++) {
+		if (formats[i].code == code)
+			return &formats[i];
+	}
+
+	return NULL;
+}
+
+static const struct unicam_format_info *
+unicam_find_format_by_fourcc(u32 fourcc, u32 pad)
+{
+	const struct unicam_format_info *formats;
+	unsigned int num_formats;
+	unsigned int i;
+
+	if (pad == UNICAM_SD_PAD_SOURCE_IMAGE) {
+		formats = unicam_image_formats;
+		num_formats = ARRAY_SIZE(unicam_image_formats);
+	} else {
+		formats = unicam_meta_formats;
+		num_formats = ARRAY_SIZE(unicam_meta_formats);
+	}
+
+	for (i = 0; i < num_formats; ++i) {
+		if (formats[i].fourcc == fourcc)
+			return &formats[i];
+	}
+
+	return NULL;
+}
+
+static void unicam_calc_image_size_bpl(struct unicam_device *unicam,
+				       const struct unicam_format_info *fmtinfo,
+				       struct v4l2_pix_format *pix)
+{
+	u32 min_bpl;
+
+	v4l_bound_align_image(&pix->width, UNICAM_IMAGE_MIN_WIDTH,
+			      UNICAM_IMAGE_MAX_WIDTH, 2,
+			      &pix->height, UNICAM_IMAGE_MIN_HEIGHT,
+			      UNICAM_IMAGE_MAX_HEIGHT, 0, 0);
+
+	/* Unpacking always goes to 16bpp */
+	if (pix->pixelformat == fmtinfo->unpacked_fourcc)
+		min_bpl = pix->width * 2;
+	else
+		min_bpl = pix->width * fmtinfo->depth / 8;
+	min_bpl = ALIGN(min_bpl, UNICAM_IMAGE_BPL_ALIGNMENT);
+
+	pix->bytesperline = ALIGN(pix->bytesperline, UNICAM_IMAGE_BPL_ALIGNMENT);
+	pix->bytesperline = clamp_t(unsigned int, pix->bytesperline, min_bpl,
+				    UNICAM_IMAGE_MAX_BPL);
+
+	pix->sizeimage = pix->height * pix->bytesperline;
+}
+
+static void unicam_calc_meta_size_bpl(struct unicam_device *unicam,
+				      const struct unicam_format_info *fmtinfo,
+				      struct v4l2_meta_format *meta)
+{
+	v4l_bound_align_image(&meta->width, UNICAM_META_MIN_WIDTH,
+			      UNICAM_META_MAX_WIDTH, 0,
+			      &meta->height, UNICAM_META_MIN_HEIGHT,
+			      UNICAM_META_MAX_HEIGHT, 0, 0);
+
+	meta->bytesperline = ALIGN(meta->width * fmtinfo->depth / 8,
+				   UNICAM_DMA_BPL_ALIGNMENT);
+	meta->buffersize = meta->height * meta->bytesperline;
+}
+
+/* -----------------------------------------------------------------------------
+ * Hardware handling
+ */
+
+static inline void unicam_clk_write(struct unicam_device *unicam, u32 val)
+{
+	/* Pass the CM_PASSWORD along with the value. */
+	writel(val | 0x5a000000, unicam->clk_gate_base);
+}
+
+static inline u32 unicam_reg_read(struct unicam_device *unicam, u32 offset)
+{
+	return readl(unicam->base + offset);
+}
+
+static inline void unicam_reg_write(struct unicam_device *unicam, u32 offset, u32 val)
+{
+	writel(val, unicam->base + offset);
+}
+
+static inline int unicam_get_field(u32 value, u32 mask)
+{
+	return (value & mask) >> __ffs(mask);
+}
+
+static inline void unicam_set_field(u32 *valp, u32 field, u32 mask)
+{
+	u32 val = *valp;
+
+	val &= ~mask;
+	val |= (field << __ffs(mask)) & mask;
+	*valp = val;
+}
+
+static inline void unicam_reg_write_field(struct unicam_device *unicam, u32 offset,
+					  u32 field, u32 mask)
+{
+	u32 val = unicam_reg_read(unicam, offset);
+
+	unicam_set_field(&val, field, mask);
+	unicam_reg_write(unicam, offset, val);
+}
+
+static void unicam_wr_dma_addr(struct unicam_node *node,
+			       struct unicam_buffer *buf)
+{
+	dma_addr_t endaddr = buf->dma_addr + buf->size;
+
+	if (node->id == UNICAM_IMAGE_NODE) {
+		unicam_reg_write(node->dev, UNICAM_IBSA0, buf->dma_addr);
+		unicam_reg_write(node->dev, UNICAM_IBEA0, endaddr);
+	} else {
+		unicam_reg_write(node->dev, UNICAM_DBSA0, buf->dma_addr);
+		unicam_reg_write(node->dev, UNICAM_DBEA0, endaddr);
+	}
+}
+
+static unsigned int unicam_get_lines_done(struct unicam_device *unicam)
+{
+	struct unicam_node *node = &unicam->node[UNICAM_IMAGE_NODE];
+	unsigned int stride = node->fmt.fmt.pix.bytesperline;
+	struct unicam_buffer *frm = node->cur_frm;
+	dma_addr_t cur_addr;
+
+	if (!frm)
+		return 0;
+
+	cur_addr = unicam_reg_read(unicam, UNICAM_IBWP);
+	return (unsigned int)(cur_addr - frm->dma_addr) / stride;
+}
+
+static void unicam_schedule_next_buffer(struct unicam_node *node)
+{
+	struct unicam_buffer *buf;
+
+	buf = list_first_entry(&node->dma_queue, struct unicam_buffer, list);
+	node->next_frm = buf;
+	list_del(&buf->list);
+
+	unicam_wr_dma_addr(node, buf);
+}
+
+static void unicam_schedule_dummy_buffer(struct unicam_node *node)
+{
+	int node_id = is_image_node(node) ? UNICAM_IMAGE_NODE : UNICAM_METADATA_NODE;
+
+	dev_dbg(node->dev->dev, "Scheduling dummy buffer for node %d\n", node_id);
+
+	unicam_wr_dma_addr(node, &node->dummy_buf);
+
+	node->next_frm = NULL;
+}
+
+static void unicam_process_buffer_complete(struct unicam_node *node,
+					   unsigned int sequence)
+{
+	node->cur_frm->vb.field = node->fmt.fmt.pix.field;
+	node->cur_frm->vb.sequence = sequence;
+
+	vb2_buffer_done(&node->cur_frm->vb.vb2_buf, VB2_BUF_STATE_DONE);
+}
+
+static void unicam_queue_event_sof(struct unicam_device *unicam)
+{
+	struct unicam_node *node = &unicam->node[UNICAM_IMAGE_NODE];
+	struct v4l2_event event = {
+		.type = V4L2_EVENT_FRAME_SYNC,
+		.u.frame_sync.frame_sequence = unicam->sequence,
+	};
+
+	v4l2_event_queue(&node->video_dev, &event);
+}
+
+static irqreturn_t unicam_isr(int irq, void *dev)
+{
+	struct unicam_device *unicam = dev;
+	unsigned int lines_done = unicam_get_lines_done(dev);
+	unsigned int sequence = unicam->sequence;
+	unsigned int i;
+	u32 ista, sta;
+	bool fe;
+	u64 ts;
+
+	sta = unicam_reg_read(unicam, UNICAM_STA);
+	/* Write value back to clear the interrupts */
+	unicam_reg_write(unicam, UNICAM_STA, sta);
+
+	ista = unicam_reg_read(unicam, UNICAM_ISTA);
+	/* Write value back to clear the interrupts */
+	unicam_reg_write(unicam, UNICAM_ISTA, ista);
+
+	dev_dbg(unicam->dev, "ISR: ISTA: 0x%X, STA: 0x%X, sequence %d, lines done %d\n",
+		ista, sta, sequence, lines_done);
+
+	if (!(sta & (UNICAM_IS | UNICAM_PI0)))
+		return IRQ_HANDLED;
+
+	/*
+	 * Look for either the Frame End interrupt or the Packet Capture status
+	 * to signal a frame end.
+	 */
+	fe = ista & UNICAM_FEI || sta & UNICAM_PI0;
+
+	/*
+	 * We must run the frame end handler first. If we have a valid next_frm
+	 * and we get a simultaneout FE + FS interrupt, running the FS handler
+	 * first would null out the next_frm ptr and we would have lost the
+	 * buffer forever.
+	 */
+	if (fe) {
+		/*
+		 * Ensure we have swapped buffers already as we can't
+		 * stop the peripheral. If no buffer is available, use a
+		 * dummy buffer to dump out frames until we get a new buffer
+		 * to use.
+		 */
+		for (i = 0; i < ARRAY_SIZE(unicam->node); i++) {
+			struct unicam_node *node = &unicam->node[i];
+
+			if (!vb2_start_streaming_called(&node->buffer_queue))
+				continue;
+
+			/*
+			 * If cur_frm == next_frm, it means we have not had
+			 * a chance to swap buffers, likely due to having
+			 * multiple interrupts occurring simultaneously (like FE
+			 * + FS + LS). In this case, we cannot signal the buffer
+			 * as complete, as the HW will reuse that buffer.
+			 */
+			if (node->cur_frm && node->cur_frm != node->next_frm)
+				unicam_process_buffer_complete(node, sequence);
+			node->cur_frm = node->next_frm;
+		}
+		unicam->sequence++;
+	}
+
+	if (ista & UNICAM_FSI) {
+		/*
+		 * Timestamp is to be when the first data byte was captured,
+		 * aka frame start.
+		 */
+		ts = ktime_get_ns();
+		for (i = 0; i < ARRAY_SIZE(unicam->node); i++) {
+			struct unicam_node *node = &unicam->node[i];
+
+			if (!vb2_start_streaming_called(&node->buffer_queue))
+				continue;
+
+			if (node->cur_frm)
+				node->cur_frm->vb.vb2_buf.timestamp = ts;
+			else
+				dev_dbg(unicam->v4l2_dev.dev,
+					"ISR: [%d] Dropping frame, buffer not available at FS\n",
+					i);
+			/*
+			 * Set the next frame output to go to a dummy frame
+			 * if we have not managed to obtain another frame
+			 * from the queue.
+			 */
+			unicam_schedule_dummy_buffer(node);
+		}
+
+		unicam_queue_event_sof(unicam);
+	}
+
+	/*
+	 * Cannot swap buffer at frame end, there may be a race condition
+	 * where the HW does not actually swap it if the new frame has
+	 * already started.
+	 */
+	if (ista & (UNICAM_FSI | UNICAM_LCI) && !fe) {
+		for (i = 0; i < ARRAY_SIZE(unicam->node); i++) {
+			struct unicam_node *node = &unicam->node[i];
+
+			if (!vb2_start_streaming_called(&node->buffer_queue))
+				continue;
+
+			spin_lock(&node->dma_queue_lock);
+			if (!list_empty(&node->dma_queue) && !node->next_frm)
+				unicam_schedule_next_buffer(node);
+			spin_unlock(&node->dma_queue_lock);
+		}
+	}
+
+	if (unicam_reg_read(unicam, UNICAM_ICTL) & UNICAM_FCM) {
+		/* Switch out of trigger mode if selected */
+		unicam_reg_write_field(unicam, UNICAM_ICTL, 1, UNICAM_TFC);
+		unicam_reg_write_field(unicam, UNICAM_ICTL, 0, UNICAM_FCM);
+	}
+	return IRQ_HANDLED;
+}
+
+static void unicam_set_packing_config(struct unicam_device *unicam,
+				      const struct unicam_format_info *fmtinfo)
+{
+	struct unicam_node *node = &unicam->node[UNICAM_IMAGE_NODE];
+	u32 pack, unpack;
+	u32 val;
+
+	if (node->fmt.fmt.pix.pixelformat == fmtinfo->fourcc) {
+		unpack = UNICAM_PUM_NONE;
+		pack = UNICAM_PPM_NONE;
+	} else {
+		unpack = fmtinfo->unpack;
+		/* Repacking is always to 16bpp */
+		pack = UNICAM_PPM_PACK16;
+	}
+
+	val = 0;
+	unicam_set_field(&val, unpack, UNICAM_PUM_MASK);
+	unicam_set_field(&val, pack, UNICAM_PPM_MASK);
+	unicam_reg_write(unicam, UNICAM_IPIPE, val);
+}
+
+static void unicam_cfg_image_id(struct unicam_device *unicam, u8 vc, u8 dt)
+{
+	if (unicam->bus_type == V4L2_MBUS_CSI2_DPHY) {
+		/* CSI2 mode  */
+		unicam_reg_write(unicam, UNICAM_IDI0, (vc << 6) | dt);
+	} else {
+		/* CCP2 mode */
+		unicam_reg_write(unicam, UNICAM_IDI0, 0x80 | dt);
+	}
+}
+
+static void unicam_enable_ed(struct unicam_device *unicam)
+{
+	u32 val = unicam_reg_read(unicam, UNICAM_DCS);
+
+	unicam_set_field(&val, 2, UNICAM_EDL_MASK);
+	/* Do not wrap at the end of the embedded data buffer */
+	unicam_set_field(&val, 0, UNICAM_DBOB);
+
+	unicam_reg_write(unicam, UNICAM_DCS, val);
+}
+
+static int unicam_get_image_vc_dt(struct unicam_device *unicam,
+				  struct v4l2_subdev_state *state,
+				  u8 *vc, u8 *dt)
+{
+	struct v4l2_mbus_frame_desc fd;
+	u32 stream;
+	int ret;
+
+	ret = v4l2_subdev_routing_find_opposite_end(&state->routing,
+						    UNICAM_SD_PAD_SOURCE_IMAGE,
+						    0, NULL, &stream);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_call(unicam->sensor.subdev, pad, get_frame_desc,
+			       unicam->sensor.pad->index, &fd);
+	if (ret)
+		return ret;
+
+	/* Only CSI-2 supports DTs. */
+	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
+		return -EINVAL;
+
+	for (unsigned int i = 0; i < fd.num_entries; ++i) {
+		const struct v4l2_mbus_frame_desc_entry *fde = &fd.entry[i];
+
+		if (fde->stream == stream) {
+			*vc = fde->bus.csi2.vc;
+			*dt = fde->bus.csi2.dt;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static void unicam_start_rx(struct unicam_device *unicam,
+			    struct v4l2_subdev_state *state)
+{
+	struct unicam_node *node = &unicam->node[UNICAM_IMAGE_NODE];
+	const struct unicam_format_info *fmtinfo;
+	const struct v4l2_mbus_framefmt *fmt;
+	unsigned int line_int_freq;
+	u8 vc, dt;
+	u32 val;
+	int ret;
+
+	fmt = v4l2_subdev_state_get_format(state, UNICAM_SD_PAD_SOURCE_IMAGE, 0);
+	fmtinfo = unicam_find_format_by_code(fmt->code,
+					     UNICAM_SD_PAD_SOURCE_IMAGE);
+	if (WARN_ON(!fmtinfo))
+		return;
+
+	/*
+	 * Enable lane clocks. The register is structured as follows:
+	 *
+	 * [9:8] - DAT3
+	 * [7:6] - DAT2
+	 * [5:4] - DAT1
+	 * [3:2] - DAT0
+	 * [1:0] - CLK
+	 *
+	 * Enabled lane must be set to b01, and disabled lanes to b00. The clock
+	 * lane is always enabled.
+	 */
+	val = 0x155 & GENMASK(unicam->pipe.num_data_lanes * 2 + 1, 0);
+	unicam_clk_write(unicam, val);
+
+	/* Basic init */
+	unicam_reg_write(unicam, UNICAM_CTRL, UNICAM_MEM);
+
+	/* Enable analogue control, and leave in reset. */
+	val = UNICAM_AR;
+	unicam_set_field(&val, 7, UNICAM_CTATADJ_MASK);
+	unicam_set_field(&val, 7, UNICAM_PTATADJ_MASK);
+	unicam_reg_write(unicam, UNICAM_ANA, val);
+	usleep_range(1000, 2000);
+
+	/* Come out of reset */
+	unicam_reg_write_field(unicam, UNICAM_ANA, 0, UNICAM_AR);
+
+	/* Peripheral reset */
+	unicam_reg_write_field(unicam, UNICAM_CTRL, 1, UNICAM_CPR);
+	unicam_reg_write_field(unicam, UNICAM_CTRL, 0, UNICAM_CPR);
+
+	unicam_reg_write_field(unicam, UNICAM_CTRL, 0, UNICAM_CPE);
+
+	/* Enable Rx control. */
+	val = unicam_reg_read(unicam, UNICAM_CTRL);
+	if (unicam->bus_type == V4L2_MBUS_CSI2_DPHY) {
+		unicam_set_field(&val, UNICAM_CPM_CSI2, UNICAM_CPM_MASK);
+		unicam_set_field(&val, UNICAM_DCM_STROBE, UNICAM_DCM_MASK);
+	} else {
+		unicam_set_field(&val, UNICAM_CPM_CCP2, UNICAM_CPM_MASK);
+		unicam_set_field(&val, unicam->bus_flags, UNICAM_DCM_MASK);
+	}
+	/* Packet framer timeout */
+	unicam_set_field(&val, 0xf, UNICAM_PFT_MASK);
+	unicam_set_field(&val, 128, UNICAM_OET_MASK);
+	unicam_reg_write(unicam, UNICAM_CTRL, val);
+
+	unicam_reg_write(unicam, UNICAM_IHWIN, 0);
+	unicam_reg_write(unicam, UNICAM_IVWIN, 0);
+
+	/* AXI bus access QoS setup */
+	val = unicam_reg_read(unicam, UNICAM_PRI);
+	unicam_set_field(&val, 0, UNICAM_BL_MASK);
+	unicam_set_field(&val, 0, UNICAM_BS_MASK);
+	unicam_set_field(&val, 0xe, UNICAM_PP_MASK);
+	unicam_set_field(&val, 8, UNICAM_NP_MASK);
+	unicam_set_field(&val, 2, UNICAM_PT_MASK);
+	unicam_set_field(&val, 1, UNICAM_PE);
+	unicam_reg_write(unicam, UNICAM_PRI, val);
+
+	unicam_reg_write_field(unicam, UNICAM_ANA, 0, UNICAM_DDL);
+
+	/* Always start in trigger frame capture mode (UNICAM_FCM set) */
+	val = UNICAM_FSIE | UNICAM_FEIE | UNICAM_FCM | UNICAM_IBOB;
+	line_int_freq = max(fmt->height >> 2, 128);
+	unicam_set_field(&val, line_int_freq, UNICAM_LCIE_MASK);
+	unicam_reg_write(unicam, UNICAM_ICTL, val);
+	unicam_reg_write(unicam, UNICAM_STA, UNICAM_STA_MASK_ALL);
+	unicam_reg_write(unicam, UNICAM_ISTA, UNICAM_ISTA_MASK_ALL);
+
+	/* tclk_term_en */
+	unicam_reg_write_field(unicam, UNICAM_CLT, 2, UNICAM_CLT1_MASK);
+	/* tclk_settle */
+	unicam_reg_write_field(unicam, UNICAM_CLT, 6, UNICAM_CLT2_MASK);
+	/* td_term_en */
+	unicam_reg_write_field(unicam, UNICAM_DLT, 2, UNICAM_DLT1_MASK);
+	/* ths_settle */
+	unicam_reg_write_field(unicam, UNICAM_DLT, 6, UNICAM_DLT2_MASK);
+	/* trx_enable */
+	unicam_reg_write_field(unicam, UNICAM_DLT, 0, UNICAM_DLT3_MASK);
+
+	unicam_reg_write_field(unicam, UNICAM_CTRL, 0, UNICAM_SOE);
+
+	/* Packet compare setup - required to avoid missing frame ends */
+	val = 0;
+	unicam_set_field(&val, 1, UNICAM_PCE);
+	unicam_set_field(&val, 1, UNICAM_GI);
+	unicam_set_field(&val, 1, UNICAM_CPH);
+	unicam_set_field(&val, 0, UNICAM_PCVC_MASK);
+	unicam_set_field(&val, 1, UNICAM_PCDT_MASK);
+	unicam_reg_write(unicam, UNICAM_CMP0, val);
+
+	/* Enable clock lane and set up terminations */
+	val = 0;
+	if (unicam->bus_type == V4L2_MBUS_CSI2_DPHY) {
+		/* CSI2 */
+		unicam_set_field(&val, 1, UNICAM_CLE);
+		unicam_set_field(&val, 1, UNICAM_CLLPE);
+		if (!(unicam->bus_flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK)) {
+			unicam_set_field(&val, 1, UNICAM_CLTRE);
+			unicam_set_field(&val, 1, UNICAM_CLHSE);
+		}
+	} else {
+		/* CCP2 */
+		unicam_set_field(&val, 1, UNICAM_CLE);
+		unicam_set_field(&val, 1, UNICAM_CLHSE);
+		unicam_set_field(&val, 1, UNICAM_CLTRE);
+	}
+	unicam_reg_write(unicam, UNICAM_CLK, val);
+
+	/*
+	 * Enable required data lanes with appropriate terminations.
+	 * The same value needs to be written to UNICAM_DATn registers for
+	 * the active lanes, and 0 for inactive ones.
+	 */
+	val = 0;
+	if (unicam->bus_type == V4L2_MBUS_CSI2_DPHY) {
+		/* CSI2 */
+		unicam_set_field(&val, 1, UNICAM_DLE);
+		unicam_set_field(&val, 1, UNICAM_DLLPE);
+		if (!(unicam->bus_flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK)) {
+			unicam_set_field(&val, 1, UNICAM_DLTRE);
+			unicam_set_field(&val, 1, UNICAM_DLHSE);
+		}
+	} else {
+		/* CCP2 */
+		unicam_set_field(&val, 1, UNICAM_DLE);
+		unicam_set_field(&val, 1, UNICAM_DLHSE);
+		unicam_set_field(&val, 1, UNICAM_DLTRE);
+	}
+	unicam_reg_write(unicam, UNICAM_DAT0, val);
+
+	if (unicam->pipe.num_data_lanes == 1)
+		val = 0;
+	unicam_reg_write(unicam, UNICAM_DAT1, val);
+
+	if (unicam->max_data_lanes > 2) {
+		/*
+		 * Registers UNICAM_DAT2 and UNICAM_DAT3 only valid if the
+		 * instance supports more than 2 data lanes.
+		 */
+		if (unicam->pipe.num_data_lanes == 2)
+			val = 0;
+		unicam_reg_write(unicam, UNICAM_DAT2, val);
+
+		if (unicam->pipe.num_data_lanes == 3)
+			val = 0;
+		unicam_reg_write(unicam, UNICAM_DAT3, val);
+	}
+
+	unicam_reg_write(unicam, UNICAM_IBLS,
+			 node->fmt.fmt.pix.bytesperline);
+	unicam_wr_dma_addr(node, node->cur_frm);
+	unicam_set_packing_config(unicam, fmtinfo);
+
+	ret = unicam_get_image_vc_dt(unicam, state, &vc, &dt);
+	if (ret) {
+		/*
+		 * If the source doesn't support frame descriptors, default to
+		 * VC 0 and use the DT corresponding to the format.
+		 */
+		vc = 0;
+		dt = fmtinfo->csi_dt;
+	}
+
+	unicam_cfg_image_id(unicam, vc, dt);
+
+	val = unicam_reg_read(unicam, UNICAM_MISC);
+	unicam_set_field(&val, 1, UNICAM_FL0);
+	unicam_set_field(&val, 1, UNICAM_FL1);
+	unicam_reg_write(unicam, UNICAM_MISC, val);
+
+	/* Enable peripheral */
+	unicam_reg_write_field(unicam, UNICAM_CTRL, 1, UNICAM_CPE);
+
+	/* Load image pointers */
+	unicam_reg_write_field(unicam, UNICAM_ICTL, 1, UNICAM_LIP_MASK);
+
+	/*
+	 * Enable trigger only for the first frame to
+	 * sync correctly to the FS from the source.
+	 */
+	unicam_reg_write_field(unicam, UNICAM_ICTL, 1, UNICAM_TFC);
+}
+
+static void unicam_start_metadata(struct unicam_device *unicam)
+{
+	struct unicam_node *node = &unicam->node[UNICAM_METADATA_NODE];
+
+	unicam_enable_ed(unicam);
+	unicam_wr_dma_addr(node, node->cur_frm);
+	unicam_reg_write_field(unicam, UNICAM_DCS, 1, UNICAM_LDP);
+}
+
+static void unicam_disable(struct unicam_device *unicam)
+{
+	/* Analogue lane control disable */
+	unicam_reg_write_field(unicam, UNICAM_ANA, 1, UNICAM_DDL);
+
+	/* Stop the output engine */
+	unicam_reg_write_field(unicam, UNICAM_CTRL, 1, UNICAM_SOE);
+
+	/* Disable the data lanes. */
+	unicam_reg_write(unicam, UNICAM_DAT0, 0);
+	unicam_reg_write(unicam, UNICAM_DAT1, 0);
+
+	if (unicam->max_data_lanes > 2) {
+		unicam_reg_write(unicam, UNICAM_DAT2, 0);
+		unicam_reg_write(unicam, UNICAM_DAT3, 0);
+	}
+
+	/* Peripheral reset */
+	unicam_reg_write_field(unicam, UNICAM_CTRL, 1, UNICAM_CPR);
+	usleep_range(50, 100);
+	unicam_reg_write_field(unicam, UNICAM_CTRL, 0, UNICAM_CPR);
+
+	/* Disable peripheral */
+	unicam_reg_write_field(unicam, UNICAM_CTRL, 0, UNICAM_CPE);
+
+	/* Clear ED setup */
+	unicam_reg_write(unicam, UNICAM_DCS, 0);
+
+	/* Disable all lane clocks */
+	unicam_clk_write(unicam, 0);
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2 subdev operations
+ */
+
+static int __unicam_subdev_set_routing(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state,
+				       struct v4l2_subdev_krouting *routing)
+{
+	struct v4l2_subdev_route *route;
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_set_routing(sd, state, routing);
+	if (ret)
+		return ret;
+
+	for_each_active_route(&state->routing, route) {
+		const struct v4l2_mbus_framefmt *def_fmt;
+		struct v4l2_mbus_framefmt *fmt;
+
+		if (route->source_pad == UNICAM_SD_PAD_SOURCE_IMAGE)
+			def_fmt = &unicam_default_image_format;
+		else
+			def_fmt = &unicam_default_meta_format;
+
+		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+						   route->sink_stream);
+		*fmt = *def_fmt;
+		fmt = v4l2_subdev_state_get_format(state, route->source_pad,
+						   route->source_stream);
+		*fmt = *def_fmt;
+	}
+
+	return 0;
+}
+
+static int unicam_subdev_init_state(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = UNICAM_SD_PAD_SINK,
+			.sink_stream = 0,
+			.source_pad = UNICAM_SD_PAD_SOURCE_IMAGE,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+
+	struct v4l2_subdev_krouting routing = {
+		.len_routes = ARRAY_SIZE(routes),
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	/* Initialize routing to single route to the fist source pad. */
+	return __unicam_subdev_set_routing(sd, state, &routing);
+}
+
+static int unicam_subdev_enum_mbus_code(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					struct v4l2_subdev_mbus_code_enum *code)
+{
+	u32 pad, stream;
+	int ret;
+
+	ret = v4l2_subdev_routing_find_opposite_end(&state->routing,
+						    code->pad, code->stream,
+						    &pad, &stream);
+	if (ret)
+		return ret;
+
+	if (unicam_sd_pad_is_source(code->pad)) {
+		/* No transcoding, source and sink codes must match. */
+		const struct v4l2_mbus_framefmt *fmt;
+
+		fmt = v4l2_subdev_state_get_format(state, pad, stream);
+		if (!fmt)
+			return -EINVAL;
+
+		if (code->index > 0)
+			return -EINVAL;
+
+		code->code = fmt->code;
+	} else {
+		const struct unicam_format_info *formats;
+		unsigned int num_formats;
+
+		if (pad == UNICAM_SD_PAD_SOURCE_IMAGE) {
+			formats = unicam_image_formats;
+			num_formats = ARRAY_SIZE(unicam_image_formats);
+		} else {
+			formats = unicam_meta_formats;
+			num_formats = ARRAY_SIZE(unicam_meta_formats);
+		}
+
+		if (code->index >= num_formats)
+			return -EINVAL;
+
+		code->code = formats[code->index].code;
+	}
+
+	return 0;
+}
+
+static int unicam_subdev_enum_frame_size(struct v4l2_subdev *sd,
+					 struct v4l2_subdev_state *state,
+					 struct v4l2_subdev_frame_size_enum *fse)
+{
+	u32 pad, stream;
+	int ret;
+
+	if (fse->index > 0)
+		return -EINVAL;
+
+	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, fse->pad,
+						    fse->stream, &pad,
+						    &stream);
+	if (ret)
+		return ret;
+
+	if (unicam_sd_pad_is_source(fse->pad)) {
+		/* No transcoding, source and sink formats must match. */
+		const struct v4l2_mbus_framefmt *fmt;
+
+		fmt = v4l2_subdev_state_get_format(state, pad, stream);
+		if (!fmt)
+			return -EINVAL;
+
+		if (fse->code != fmt->code)
+			return -EINVAL;
+
+		fse->min_width = fmt->width;
+		fse->max_width = fmt->width;
+		fse->min_height = fmt->height;
+		fse->max_height = fmt->height;
+	} else {
+		const struct unicam_format_info *fmtinfo;
+
+		fmtinfo = unicam_find_format_by_code(fse->code, pad);
+		if (!fmtinfo)
+			return -EINVAL;
+
+		if (pad == UNICAM_SD_PAD_SOURCE_IMAGE) {
+			fse->min_width = UNICAM_IMAGE_MIN_WIDTH;
+			fse->max_width = UNICAM_IMAGE_MAX_WIDTH;
+			fse->min_height = UNICAM_IMAGE_MIN_HEIGHT;
+			fse->max_height = UNICAM_IMAGE_MAX_HEIGHT;
+		} else {
+			fse->min_width = UNICAM_META_MIN_WIDTH;
+			fse->max_width = UNICAM_META_MAX_WIDTH;
+			fse->min_height = UNICAM_META_MIN_HEIGHT;
+			fse->max_height = UNICAM_META_MAX_HEIGHT;
+		}
+	}
+
+	return 0;
+}
+
+static int unicam_subdev_set_format(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_format *format)
+{
+	struct unicam_device *unicam = sd_to_unicam_device(sd);
+	struct v4l2_mbus_framefmt *sink_format, *source_format;
+	const struct unicam_format_info *fmtinfo;
+	u32 source_pad, source_stream;
+	int ret;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    unicam->subdev.enabled_streams)
+		return -EBUSY;
+
+	/* No transcoding, source and sink formats must match. */
+	if (unicam_sd_pad_is_source(format->pad))
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	/*
+	 * Allowed formats for the stream on the sink pad depend on what source
+	 * pad the stream is routed to. Find the corresponding source pad and
+	 * use it to validate the media bus code.
+	 */
+	ret = v4l2_subdev_routing_find_opposite_end(&state->routing,
+						    format->pad, format->stream,
+						    &source_pad, &source_stream);
+	if (ret)
+		return ret;
+
+	fmtinfo = unicam_find_format_by_code(format->format.code, source_pad);
+	if (!fmtinfo) {
+		fmtinfo = source_pad == UNICAM_SD_PAD_SOURCE_IMAGE
+			? &unicam_image_formats[0] : &unicam_meta_formats[0];
+		format->format.code = fmtinfo->code;
+	}
+
+	if (source_pad == UNICAM_SD_PAD_SOURCE_IMAGE) {
+		format->format.width = clamp_t(unsigned int,
+					       format->format.width,
+					       UNICAM_IMAGE_MIN_WIDTH,
+					       UNICAM_IMAGE_MAX_WIDTH);
+		format->format.height = clamp_t(unsigned int,
+						format->format.height,
+						UNICAM_IMAGE_MIN_HEIGHT,
+						UNICAM_IMAGE_MAX_HEIGHT);
+		format->format.field = V4L2_FIELD_NONE;
+	} else {
+		format->format.width = clamp_t(unsigned int,
+					       format->format.width,
+					       UNICAM_META_MIN_WIDTH,
+					       UNICAM_META_MAX_WIDTH);
+		format->format.height = clamp_t(unsigned int,
+						format->format.height,
+						UNICAM_META_MIN_HEIGHT,
+						UNICAM_META_MAX_HEIGHT);
+		format->format.field = V4L2_FIELD_NONE;
+
+		/* Colorspace don't apply to metadata. */
+		format->format.colorspace = 0;
+		format->format.ycbcr_enc = 0;
+		format->format.quantization = 0;
+		format->format.xfer_func = 0;
+	}
+
+	sink_format = v4l2_subdev_state_get_format(state, format->pad,
+						   format->stream);
+	source_format = v4l2_subdev_state_get_format(state, source_pad,
+						     source_stream);
+	*sink_format = format->format;
+	*source_format = format->format;
+
+	return 0;
+}
+
+static int unicam_subdev_set_routing(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     enum v4l2_subdev_format_whence which,
+				     struct v4l2_subdev_krouting *routing)
+{
+	struct unicam_device *unicam = sd_to_unicam_device(sd);
+
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && unicam->subdev.enabled_streams)
+		return -EBUSY;
+
+	return __unicam_subdev_set_routing(sd, state, routing);
+}
+
+static int unicam_sd_enable_streams(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state, u32 pad,
+				    u64 streams_mask)
+{
+	struct unicam_device *unicam = sd_to_unicam_device(sd);
+	u32 other_pad, other_stream;
+	int ret;
+
+	if (!unicam->subdev.enabled_streams) {
+		/* Configure and start Unicam. */
+		unicam->sequence = 0;
+
+		if (unicam->pipe.nodes & BIT(UNICAM_METADATA_NODE))
+			unicam_start_metadata(unicam);
+
+		unicam_start_rx(unicam, state);
+	}
+
+	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, pad, 0,
+						    &other_pad, &other_stream);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_enable_streams(unicam->sensor.subdev,
+					 unicam->sensor.pad->index,
+					 BIT(other_stream));
+	if (ret) {
+		dev_err(unicam->dev, "stream on failed in subdev\n");
+		return ret;
+	}
+
+	unicam->subdev.enabled_streams |= BIT(other_stream);
+
+	return 0;
+}
+
+static int unicam_sd_disable_streams(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state, u32 pad,
+				     u64 streams_mask)
+{
+	struct unicam_device *unicam = sd_to_unicam_device(sd);
+	u32 other_pad, other_stream;
+	int ret;
+
+	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, pad, 0,
+						    &other_pad, &other_stream);
+	if (ret)
+		return ret;
+
+	v4l2_subdev_disable_streams(unicam->sensor.subdev,
+				    unicam->sensor.pad->index,
+				    BIT(other_stream));
+
+	unicam->subdev.enabled_streams &= ~BIT(other_stream);
+
+	if (!unicam->subdev.enabled_streams)
+		unicam_disable(unicam);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops unicam_subdev_pad_ops = {
+	.enum_mbus_code		= unicam_subdev_enum_mbus_code,
+	.enum_frame_size	= unicam_subdev_enum_frame_size,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= unicam_subdev_set_format,
+	.set_routing		= unicam_subdev_set_routing,
+	.enable_streams		= unicam_sd_enable_streams,
+	.disable_streams	= unicam_sd_disable_streams,
+};
+
+static const struct v4l2_subdev_ops unicam_subdev_ops = {
+	.pad			= &unicam_subdev_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops unicam_subdev_internal_ops = {
+	.init_state		= unicam_subdev_init_state,
+};
+
+static const struct media_entity_operations unicam_subdev_media_ops = {
+	.link_validate		= v4l2_subdev_link_validate,
+	.has_pad_interdep	= v4l2_subdev_has_pad_interdep,
+};
+
+static int unicam_subdev_init(struct unicam_device *unicam)
+{
+	struct v4l2_subdev *sd = &unicam->subdev.sd;
+	int ret;
+
+	v4l2_subdev_init(sd, &unicam_subdev_ops);
+	sd->internal_ops = &unicam_subdev_internal_ops;
+	v4l2_set_subdevdata(sd, unicam);
+
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->entity.ops = &unicam_subdev_media_ops;
+	sd->dev = unicam->dev;
+	sd->owner = THIS_MODULE;
+	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
+
+	strscpy(sd->name, "unicam", sizeof(sd->name));
+
+	unicam->subdev.pads[UNICAM_SD_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	unicam->subdev.pads[UNICAM_SD_PAD_SOURCE_IMAGE].flags = MEDIA_PAD_FL_SOURCE;
+	unicam->subdev.pads[UNICAM_SD_PAD_SOURCE_METADATA].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(unicam->subdev.pads),
+				     unicam->subdev.pads);
+	if (ret) {
+		dev_err(unicam->dev, "Failed to initialize media entity: %d\n",
+			ret);
+		return ret;
+	}
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret) {
+		dev_err(unicam->dev, "Failed to initialize subdev: %d\n", ret);
+		goto err_entity;
+	}
+
+	ret = v4l2_device_register_subdev(&unicam->v4l2_dev, sd);
+	if (ret) {
+		dev_err(unicam->dev, "Failed to register subdev: %d\n", ret);
+		goto err_subdev;
+	}
+
+	return 0;
+
+err_subdev:
+	v4l2_subdev_cleanup(sd);
+err_entity:
+	media_entity_cleanup(&sd->entity);
+	return ret;
+}
+
+static void unicam_subdev_cleanup(struct unicam_device *unicam)
+{
+	v4l2_subdev_cleanup(&unicam->subdev.sd);
+	media_entity_cleanup(&unicam->subdev.sd.entity);
+}
+
+/* -----------------------------------------------------------------------------
+ * Videobuf2 queue operations
+ */
+
+static int unicam_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
+			      unsigned int *nplanes, unsigned int sizes[],
+			      struct device *alloc_devs[])
+{
+	struct unicam_node *node = vb2_get_drv_priv(vq);
+	u32 size = is_image_node(node) ? node->fmt.fmt.pix.sizeimage
+		 : node->fmt.fmt.meta.buffersize;
+
+	if (*nplanes) {
+		if (sizes[0] < size) {
+			dev_dbg(node->dev->dev, "sizes[0] %i < size %u\n",
+				sizes[0], size);
+			return -EINVAL;
+		}
+		size = sizes[0];
+	}
+
+	*nplanes = 1;
+	sizes[0] = size;
+
+	return 0;
+}
+
+static int unicam_buffer_prepare(struct vb2_buffer *vb)
+{
+	struct unicam_node *node = vb2_get_drv_priv(vb->vb2_queue);
+	struct unicam_buffer *buf = to_unicam_buffer(vb);
+	u32 size = is_image_node(node) ? node->fmt.fmt.pix.sizeimage
+		 : node->fmt.fmt.meta.buffersize;
+
+	if (vb2_plane_size(vb, 0) < size) {
+		dev_dbg(node->dev->dev,
+			"data will not fit into plane (%lu < %u)\n",
+			vb2_plane_size(vb, 0), size);
+		return -EINVAL;
+	}
+
+	buf->dma_addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
+	buf->size = size;
+
+	vb2_set_plane_payload(&buf->vb.vb2_buf, 0, size);
+
+	return 0;
+}
+
+static void unicam_return_buffers(struct unicam_node *node,
+				  enum vb2_buffer_state state)
+{
+	struct unicam_buffer *buf, *tmp;
+
+	list_for_each_entry_safe(buf, tmp, &node->dma_queue, list) {
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
+
+	if (node->cur_frm)
+		vb2_buffer_done(&node->cur_frm->vb.vb2_buf,
+				state);
+	if (node->next_frm && node->cur_frm != node->next_frm)
+		vb2_buffer_done(&node->next_frm->vb.vb2_buf,
+				state);
+
+	node->cur_frm = NULL;
+	node->next_frm = NULL;
+}
+
+static int unicam_num_data_lanes(struct unicam_device *unicam)
+{
+	struct v4l2_mbus_config mbus_config = { 0 };
+	unsigned int num_data_lanes;
+	int ret;
+
+	if (unicam->bus_type != V4L2_MBUS_CSI2_DPHY)
+		return unicam->max_data_lanes;
+
+	ret = v4l2_subdev_call(unicam->sensor.subdev, pad, get_mbus_config,
+			       unicam->sensor.pad->index, &mbus_config);
+	if (ret == -ENOIOCTLCMD)
+		return unicam->max_data_lanes;
+
+	if (ret < 0) {
+		dev_err(unicam->dev, "Failed to get mbus config: %d\n", ret);
+		return ret;
+	}
+
+	num_data_lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
+
+	if (num_data_lanes != 1 && num_data_lanes != 2 && num_data_lanes != 4) {
+		dev_err(unicam->dev,
+			"Device %s has requested %u data lanes, invalid\n",
+			unicam->sensor.subdev->name, num_data_lanes);
+		return -EINVAL;
+	}
+
+	if (num_data_lanes > unicam->max_data_lanes) {
+		dev_err(unicam->dev,
+			"Device %s has requested %u data lanes, >%u configured in DT\n",
+			unicam->sensor.subdev->name, num_data_lanes,
+			unicam->max_data_lanes);
+		return -EINVAL;
+	}
+
+	return num_data_lanes;
+}
+
+static int unicam_start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct unicam_node *node = vb2_get_drv_priv(vq);
+	struct unicam_device *unicam = node->dev;
+	struct unicam_buffer *buf;
+	struct media_pipeline_pad_iter iter;
+	struct media_pad *pad;
+	unsigned long flags;
+	int ret;
+
+	dev_dbg(unicam->dev, "Starting stream on %s device\n",
+		is_metadata_node(node) ? "metadata" : "image");
+
+	/*
+	 * Start the pipeline. This validates all links, and populates the
+	 * pipeline structure.
+	 */
+	ret = video_device_pipeline_start(&node->video_dev, &unicam->pipe.pipe);
+	if (ret < 0) {
+		dev_dbg(unicam->dev, "Failed to start media pipeline: %d\n", ret);
+		goto err_buffers;
+	}
+
+	/*
+	 * Determine which video nodes are included in the pipeline, and get the
+	 * number of data lanes.
+	 */
+	if (unicam->pipe.pipe.start_count == 1) {
+		unicam->pipe.nodes = 0;
+
+		media_pipeline_for_each_pad(&unicam->pipe.pipe, &iter, pad) {
+			if (pad->entity != &unicam->subdev.sd.entity)
+				continue;
+
+			if (pad->index == UNICAM_SD_PAD_SOURCE_IMAGE)
+				unicam->pipe.nodes |= BIT(UNICAM_IMAGE_NODE);
+			else if (pad->index == UNICAM_SD_PAD_SOURCE_METADATA)
+				unicam->pipe.nodes |= BIT(UNICAM_METADATA_NODE);
+		}
+
+		if (!(unicam->pipe.nodes & BIT(UNICAM_IMAGE_NODE))) {
+			dev_dbg(unicam->dev,
+				"Pipeline does not include image node\n");
+			ret = -EPIPE;
+			goto err_pipeline;
+		}
+
+		ret = unicam_num_data_lanes(unicam);
+		if (ret < 0)
+			goto err_pipeline;
+
+		unicam->pipe.num_data_lanes = ret;
+
+		dev_dbg(unicam->dev, "Running with %u data lanes, nodes %u\n",
+			unicam->pipe.num_data_lanes, unicam->pipe.nodes);
+	}
+
+	/* Arm the node with the first buffer from the DMA queue. */
+	spin_lock_irqsave(&node->dma_queue_lock, flags);
+	buf = list_first_entry(&node->dma_queue, struct unicam_buffer, list);
+	node->cur_frm = buf;
+	node->next_frm = buf;
+	list_del(&buf->list);
+	spin_unlock_irqrestore(&node->dma_queue_lock, flags);
+
+	/*
+	 * Wait for all the video devices in the pipeline to have been started
+	 * before starting the hardware. In the general case, this would
+	 * prevent capturing multiple streams independently. However, the
+	 * Unicam DMA engines are not generic, they have been designed to
+	 * capture image data and embedded data from the same camera sensor.
+	 * Not only does the main use case not benefit from independent
+	 * capture, it requires proper synchronization of the streams at start
+	 * time.
+	 */
+	if (unicam->pipe.pipe.start_count < hweight32(unicam->pipe.nodes))
+		return 0;
+
+	ret = pm_runtime_resume_and_get(unicam->dev);
+	if (ret < 0) {
+		dev_err(unicam->dev, "PM runtime resume failed: %d\n", ret);
+		goto err_pipeline;
+	}
+
+	/* Enable the streams on the source. */
+	ret = v4l2_subdev_enable_streams(&unicam->subdev.sd,
+					 UNICAM_SD_PAD_SOURCE_IMAGE,
+					 BIT(0));
+	if (ret < 0) {
+		dev_err(unicam->dev, "stream on failed in subdev\n");
+		goto err_pm_put;
+	}
+
+	if (unicam->pipe.nodes & BIT(UNICAM_METADATA_NODE)) {
+		ret = v4l2_subdev_enable_streams(&unicam->subdev.sd,
+						 UNICAM_SD_PAD_SOURCE_METADATA,
+						 BIT(0));
+		if (ret < 0) {
+			dev_err(unicam->dev, "stream on failed in subdev\n");
+			goto err_disable_streams;
+		}
+	}
+
+	return 0;
+
+err_disable_streams:
+	v4l2_subdev_disable_streams(&unicam->subdev.sd,
+				    UNICAM_SD_PAD_SOURCE_IMAGE, BIT(0));
+err_pm_put:
+	pm_runtime_put_sync(unicam->dev);
+err_pipeline:
+	video_device_pipeline_stop(&node->video_dev);
+err_buffers:
+	unicam_return_buffers(node, VB2_BUF_STATE_QUEUED);
+	return ret;
+}
+
+static void unicam_stop_streaming(struct vb2_queue *vq)
+{
+	struct unicam_node *node = vb2_get_drv_priv(vq);
+	struct unicam_device *unicam = node->dev;
+
+	/* Stop the hardware when the first video device gets stopped. */
+	if (unicam->pipe.pipe.start_count == hweight32(unicam->pipe.nodes)) {
+		if (unicam->pipe.nodes & BIT(UNICAM_METADATA_NODE))
+			v4l2_subdev_disable_streams(&unicam->subdev.sd,
+						    UNICAM_SD_PAD_SOURCE_METADATA,
+						    BIT(0));
+
+		v4l2_subdev_disable_streams(&unicam->subdev.sd,
+					    UNICAM_SD_PAD_SOURCE_IMAGE,
+					    BIT(0));
+
+		pm_runtime_put(unicam->dev);
+	}
+
+	video_device_pipeline_stop(&node->video_dev);
+
+	/* Clear all queued buffers for the node */
+	unicam_return_buffers(node, VB2_BUF_STATE_ERROR);
+}
+
+static void unicam_buffer_queue(struct vb2_buffer *vb)
+{
+	struct unicam_node *node = vb2_get_drv_priv(vb->vb2_queue);
+	struct unicam_buffer *buf = to_unicam_buffer(vb);
+
+	spin_lock_irq(&node->dma_queue_lock);
+	list_add_tail(&buf->list, &node->dma_queue);
+	spin_unlock_irq(&node->dma_queue_lock);
+}
+
+static const struct vb2_ops unicam_video_qops = {
+	.queue_setup		= unicam_queue_setup,
+	.wait_prepare		= vb2_ops_wait_prepare,
+	.wait_finish		= vb2_ops_wait_finish,
+	.buf_prepare		= unicam_buffer_prepare,
+	.start_streaming	= unicam_start_streaming,
+	.stop_streaming		= unicam_stop_streaming,
+	.buf_queue		= unicam_buffer_queue,
+};
+
+/* -----------------------------------------------------------------------------
+ *  V4L2 video device operations
+ */
+
+static int unicam_querycap(struct file *file, void *priv,
+			   struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, UNICAM_MODULE_NAME, sizeof(cap->driver));
+	strscpy(cap->card, UNICAM_MODULE_NAME, sizeof(cap->card));
+
+	cap->capabilities |= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_META_CAPTURE;
+
+	return 0;
+}
+
+static int unicam_enum_fmt_vid(struct file *file, void  *priv,
+			       struct v4l2_fmtdesc *f)
+{
+	unsigned int index;
+	unsigned int i;
+
+	for (i = 0, index = 0; i < ARRAY_SIZE(unicam_image_formats); i++) {
+		if (f->mbus_code && unicam_image_formats[i].code != f->mbus_code)
+			continue;
+
+		if (index == f->index) {
+			f->pixelformat = unicam_image_formats[i].fourcc;
+			return 0;
+		}
+
+		index++;
+
+		if (!unicam_image_formats[i].unpacked_fourcc)
+			continue;
+
+		if (index == f->index) {
+			f->pixelformat = unicam_image_formats[i].unpacked_fourcc;
+			return 0;
+		}
+
+		index++;
+	}
+
+	return -EINVAL;
+}
+
+static int unicam_g_fmt_vid(struct file *file, void *priv,
+			    struct v4l2_format *f)
+{
+	struct unicam_node *node = video_drvdata(file);
+
+	*f = node->fmt;
+
+	return 0;
+}
+
+static void __unicam_try_fmt_vid(struct unicam_node *node,
+				 struct v4l2_pix_format *pix)
+{
+	const struct unicam_format_info *fmtinfo;
+
+	/*
+	 * Default to the first format if the requested pixel format code isn't
+	 * supported.
+	 */
+	fmtinfo = unicam_find_format_by_fourcc(pix->pixelformat,
+					       UNICAM_SD_PAD_SOURCE_IMAGE);
+	if (!fmtinfo) {
+		fmtinfo = &unicam_image_formats[0];
+		pix->pixelformat = fmtinfo->fourcc;
+	}
+
+	unicam_calc_image_size_bpl(node->dev, fmtinfo, pix);
+
+	if (pix->field == V4L2_FIELD_ANY)
+		pix->field = V4L2_FIELD_NONE;
+}
+
+static int unicam_try_fmt_vid(struct file *file, void *priv,
+			      struct v4l2_format *f)
+{
+	struct unicam_node *node = video_drvdata(file);
+
+	__unicam_try_fmt_vid(node, &f->fmt.pix);
+	return 0;
+}
+
+static int unicam_s_fmt_vid(struct file *file, void *priv,
+			    struct v4l2_format *f)
+{
+	struct unicam_node *node = video_drvdata(file);
+
+	if (vb2_is_busy(&node->buffer_queue))
+		return -EBUSY;
+
+	__unicam_try_fmt_vid(node, &f->fmt.pix);
+	node->fmt = *f;
+
+	return 0;
+}
+
+static int unicam_enum_fmt_meta(struct file *file, void *priv,
+				struct v4l2_fmtdesc *f)
+{
+	unsigned int i, index;
+
+	for (i = 0, index = 0; i < ARRAY_SIZE(unicam_meta_formats); i++) {
+		if (f->mbus_code && unicam_meta_formats[i].code != f->mbus_code)
+			continue;
+
+		if (index == f->index) {
+			f->pixelformat = unicam_meta_formats[i].fourcc;
+			f->type = V4L2_BUF_TYPE_META_CAPTURE;
+			f->flags = V4L2_FMT_FLAG_META_LINE_BASED;
+			return 0;
+		}
+
+		index++;
+	}
+
+	return -EINVAL;
+}
+
+static int unicam_g_fmt_meta(struct file *file, void *priv,
+			     struct v4l2_format *f)
+{
+	struct unicam_node *node = video_drvdata(file);
+
+	f->fmt.meta = node->fmt.fmt.meta;
+
+	return 0;
+}
+
+static const struct unicam_format_info *
+__unicam_try_fmt_meta(struct unicam_node *node, struct v4l2_meta_format *meta)
+{
+	const struct unicam_format_info *fmtinfo;
+
+	/*
+	 * Default to the first format if the requested pixel format code isn't
+	 * supported.
+	 */
+	fmtinfo = unicam_find_format_by_fourcc(meta->dataformat,
+					       UNICAM_SD_PAD_SOURCE_METADATA);
+	if (!fmtinfo) {
+		fmtinfo = &unicam_meta_formats[0];
+		meta->dataformat = fmtinfo->fourcc;
+	}
+
+	unicam_calc_meta_size_bpl(node->dev, fmtinfo, meta);
+
+	return fmtinfo;
+}
+
+static int unicam_try_fmt_meta(struct file *file, void *priv,
+			       struct v4l2_format *f)
+{
+	struct unicam_node *node = video_drvdata(file);
+
+	__unicam_try_fmt_meta(node, &f->fmt.meta);
+	return 0;
+}
+
+static int unicam_s_fmt_meta(struct file *file, void *priv,
+			     struct v4l2_format *f)
+{
+	struct unicam_node *node = video_drvdata(file);
+
+	if (vb2_is_busy(&node->buffer_queue))
+		return -EBUSY;
+
+	__unicam_try_fmt_meta(node, &f->fmt.meta);
+	node->fmt = *f;
+
+	return 0;
+}
+
+static int unicam_enum_framesizes(struct file *file, void *fh,
+				  struct v4l2_frmsizeenum *fsize)
+{
+	struct unicam_node *node = video_drvdata(file);
+	int ret = -EINVAL;
+
+	if (fsize->index > 0)
+		return ret;
+
+	if (is_image_node(node)) {
+		if (!unicam_find_format_by_fourcc(fsize->pixel_format,
+						  UNICAM_SD_PAD_SOURCE_IMAGE))
+			return ret;
+
+		fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+		fsize->stepwise.min_width = UNICAM_IMAGE_MIN_WIDTH;
+		fsize->stepwise.max_width = UNICAM_IMAGE_MAX_WIDTH;
+		fsize->stepwise.step_width = 1;
+		fsize->stepwise.min_height = UNICAM_IMAGE_MIN_HEIGHT;
+		fsize->stepwise.max_height = UNICAM_IMAGE_MAX_HEIGHT;
+		fsize->stepwise.step_height = 1;
+	} else {
+		if (!unicam_find_format_by_fourcc(fsize->pixel_format,
+						  UNICAM_SD_PAD_SOURCE_METADATA))
+			return ret;
+
+		fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+		fsize->stepwise.min_width = UNICAM_META_MIN_WIDTH;
+		fsize->stepwise.max_width = UNICAM_META_MAX_WIDTH;
+		fsize->stepwise.step_width = 1;
+		fsize->stepwise.min_height = UNICAM_META_MIN_HEIGHT;
+		fsize->stepwise.max_height = UNICAM_META_MAX_HEIGHT;
+		fsize->stepwise.step_height = 1;
+	}
+
+	return 0;
+}
+
+static int unicam_log_status(struct file *file, void *fh)
+{
+	struct unicam_node *node = video_drvdata(file);
+	struct unicam_device *unicam = node->dev;
+	u32 reg;
+
+	/* status for sub devices */
+	v4l2_device_call_all(&unicam->v4l2_dev, 0, core, log_status);
+
+	dev_info(unicam->dev, "-----Receiver status-----\n");
+	dev_info(unicam->dev, "V4L2 width/height:   %ux%u\n",
+		 node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
+	dev_info(unicam->dev, "V4L2 format:         %08x\n",
+		 node->fmt.fmt.pix.pixelformat);
+	reg = unicam_reg_read(unicam, UNICAM_IPIPE);
+	dev_info(unicam->dev, "Unpacking/packing:   %u / %u\n",
+		 unicam_get_field(reg, UNICAM_PUM_MASK),
+		 unicam_get_field(reg, UNICAM_PPM_MASK));
+	dev_info(unicam->dev, "----Live data----\n");
+	dev_info(unicam->dev, "Programmed stride:   %4u\n",
+		 unicam_reg_read(unicam, UNICAM_IBLS));
+	dev_info(unicam->dev, "Detected resolution: %ux%u\n",
+		 unicam_reg_read(unicam, UNICAM_IHSTA),
+		 unicam_reg_read(unicam, UNICAM_IVSTA));
+	dev_info(unicam->dev, "Write pointer:       %08x\n",
+		 unicam_reg_read(unicam, UNICAM_IBWP));
+
+	return 0;
+}
+
+static int unicam_subscribe_event(struct v4l2_fh *fh,
+				  const struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_FRAME_SYNC:
+		return v4l2_event_subscribe(fh, sub, 2, NULL);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct v4l2_ioctl_ops unicam_ioctl_ops = {
+	.vidioc_querycap		= unicam_querycap,
+
+	.vidioc_enum_fmt_vid_cap	= unicam_enum_fmt_vid,
+	.vidioc_g_fmt_vid_cap		= unicam_g_fmt_vid,
+	.vidioc_try_fmt_vid_cap		= unicam_try_fmt_vid,
+	.vidioc_s_fmt_vid_cap		= unicam_s_fmt_vid,
+
+	.vidioc_enum_fmt_meta_cap	= unicam_enum_fmt_meta,
+	.vidioc_g_fmt_meta_cap		= unicam_g_fmt_meta,
+	.vidioc_try_fmt_meta_cap	= unicam_try_fmt_meta,
+	.vidioc_s_fmt_meta_cap		= unicam_s_fmt_meta,
+
+	.vidioc_enum_framesizes		= unicam_enum_framesizes,
+
+	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
+	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
+	.vidioc_querybuf		= vb2_ioctl_querybuf,
+	.vidioc_qbuf			= vb2_ioctl_qbuf,
+	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
+	.vidioc_expbuf			= vb2_ioctl_expbuf,
+	.vidioc_streamon		= vb2_ioctl_streamon,
+	.vidioc_streamoff		= vb2_ioctl_streamoff,
+
+	.vidioc_log_status		= unicam_log_status,
+	.vidioc_subscribe_event		= unicam_subscribe_event,
+	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
+};
+
+/* unicam capture driver file operations */
+static const struct v4l2_file_operations unicam_fops = {
+	.owner		= THIS_MODULE,
+	.open           = v4l2_fh_open,
+	.release        = vb2_fop_release,
+	.poll		= vb2_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap           = vb2_fop_mmap,
+};
+
+static int unicam_video_link_validate(struct media_link *link)
+{
+	struct video_device *vdev =
+		media_entity_to_video_device(link->sink->entity);
+	struct v4l2_subdev *sd =
+		media_entity_to_v4l2_subdev(link->source->entity);
+	struct unicam_node *node = video_get_drvdata(vdev);
+	const u32 pad = is_image_node(node) ? UNICAM_SD_PAD_SOURCE_IMAGE
+		      : UNICAM_SD_PAD_SOURCE_METADATA;
+	const struct v4l2_mbus_framefmt *format;
+	struct v4l2_subdev_state *state;
+	int ret = 0;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	format = v4l2_subdev_state_get_format(state, pad, 0);
+	if (!format) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (is_image_node(node)) {
+		const struct v4l2_pix_format *fmt = &node->fmt.fmt.pix;
+		const struct unicam_format_info *fmtinfo;
+
+		fmtinfo = unicam_find_format_by_fourcc(fmt->pixelformat,
+						       UNICAM_SD_PAD_SOURCE_IMAGE);
+		if (WARN_ON(!fmtinfo)) {
+			ret = -EPIPE;
+			goto out;
+		}
+
+		if (fmtinfo->code != format->code ||
+		    fmt->height != format->height ||
+		    fmt->width != format->width ||
+		    fmt->field != format->field) {
+			dev_dbg(node->dev->dev,
+				"image: (%u x %u) 0x%08x %s != (%u x %u) 0x%08x %s\n",
+				fmt->width, fmt->height, fmtinfo->code,
+				v4l2_field_names[fmt->field],
+				format->width, format->height, format->code,
+				v4l2_field_names[format->field]);
+			ret = -EPIPE;
+		}
+	} else {
+		const struct v4l2_meta_format *fmt = &node->fmt.fmt.meta;
+
+		const struct unicam_format_info *fmtinfo;
+
+		fmtinfo = unicam_find_format_by_fourcc(fmt->dataformat,
+						       UNICAM_SD_PAD_SOURCE_METADATA);
+		if (WARN_ON(!fmtinfo)) {
+			ret = -EPIPE;
+			goto out;
+		}
+
+		if (fmtinfo->code != format->code ||
+		    fmt->height != format->height ||
+		    fmt->width != format->width) {
+			dev_dbg(node->dev->dev,
+				"meta: (%u x %u) 0x%04x != (%u x %u) 0x%04x\n",
+				fmt->width, fmt->height, fmtinfo->code,
+				format->width, format->height, format->code);
+			ret = -EPIPE;
+		}
+	}
+
+out:
+	v4l2_subdev_unlock_state(state);
+	return ret;
+}
+
+static const struct media_entity_operations unicam_video_media_ops = {
+	.link_validate = unicam_video_link_validate,
+};
+
+static void unicam_node_release(struct video_device *vdev)
+{
+	struct unicam_node *node = video_get_drvdata(vdev);
+
+	unicam_put(node->dev);
+}
+
+static void unicam_set_default_format(struct unicam_node *node)
+{
+	if (is_image_node(node)) {
+		struct v4l2_pix_format *fmt = &node->fmt.fmt.pix;
+		const struct unicam_format_info *fmtinfo =
+			&unicam_image_formats[0];
+
+		node->fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+
+		v4l2_fill_pix_format(fmt, &unicam_default_image_format);
+		fmt->pixelformat = fmtinfo->fourcc;
+		unicam_calc_image_size_bpl(node->dev, fmtinfo, fmt);
+	} else {
+		struct v4l2_meta_format *fmt = &node->fmt.fmt.meta;
+		const struct unicam_format_info *fmtinfo =
+			&unicam_meta_formats[0];
+
+		node->fmt.type = V4L2_BUF_TYPE_META_CAPTURE;
+
+		fmt->dataformat = fmtinfo->fourcc;
+		fmt->width = unicam_default_meta_format.width;
+		fmt->height = unicam_default_meta_format.height;
+		unicam_calc_meta_size_bpl(node->dev, fmtinfo, fmt);
+	}
+}
+
+static int unicam_register_node(struct unicam_device *unicam,
+				enum unicam_node_type type)
+{
+	const u32 pad_index = type == UNICAM_IMAGE_NODE
+			    ? UNICAM_SD_PAD_SOURCE_IMAGE
+			    : UNICAM_SD_PAD_SOURCE_METADATA;
+	struct unicam_node *node = &unicam->node[type];
+	struct video_device *vdev = &node->video_dev;
+	struct vb2_queue *q = &node->buffer_queue;
+	int ret;
+
+	node->dev = unicam_get(unicam);
+	node->id = type;
+
+	spin_lock_init(&node->dma_queue_lock);
+
+	INIT_LIST_HEAD(&node->dma_queue);
+
+	/* Initialize the videobuf2 queue. */
+	q->type = type == UNICAM_IMAGE_NODE ? V4L2_BUF_TYPE_VIDEO_CAPTURE
+					    : V4L2_BUF_TYPE_META_CAPTURE;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
+	q->drv_priv = node;
+	q->ops = &unicam_video_qops;
+	q->mem_ops = &vb2_dma_contig_memops;
+	q->buf_struct_size = sizeof(struct unicam_buffer);
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->lock = &unicam->lock;
+	q->min_queued_buffers = 1;
+	q->dev = unicam->dev;
+
+	ret = vb2_queue_init(q);
+	if (ret) {
+		dev_err(unicam->dev, "vb2_queue_init() failed\n");
+		goto err_unicam_put;
+	}
+
+	/* Initialize the video device. */
+	vdev->release = unicam_node_release;
+	vdev->fops = &unicam_fops;
+	vdev->ioctl_ops = &unicam_ioctl_ops;
+	vdev->v4l2_dev = &unicam->v4l2_dev;
+	vdev->vfl_dir = VFL_DIR_RX;
+	vdev->queue = q;
+	vdev->lock = &unicam->lock;
+	vdev->device_caps = type == UNICAM_IMAGE_NODE
+			  ? V4L2_CAP_VIDEO_CAPTURE : V4L2_CAP_META_CAPTURE;
+	vdev->device_caps |= V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
+	vdev->entity.ops = &unicam_video_media_ops;
+
+	snprintf(vdev->name, sizeof(vdev->name), "%s-%s", UNICAM_MODULE_NAME,
+		 type == UNICAM_IMAGE_NODE ? "image" : "embedded");
+
+	video_set_drvdata(vdev, node);
+
+	if (type == UNICAM_IMAGE_NODE)
+		vdev->entity.flags |= MEDIA_ENT_FL_DEFAULT;
+
+	node->pad.flags = MEDIA_PAD_FL_SINK;
+
+	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
+	if (ret)
+		goto err_unicam_put;
+
+	node->dummy_buf.size = UNICAM_DUMMY_BUF_SIZE;
+	node->dummy_buf_cpu_addr = dma_alloc_coherent(unicam->dev,
+						      node->dummy_buf.size,
+						      &node->dummy_buf.dma_addr,
+						      GFP_KERNEL);
+	if (!node->dummy_buf_cpu_addr) {
+		dev_err(unicam->dev, "Unable to allocate dummy buffer.\n");
+		ret = -ENOMEM;
+		goto err_entity_cleanup;
+	}
+
+	unicam_set_default_format(node);
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(unicam->dev, "Unable to register video device %s\n",
+			vdev->name);
+		goto err_dma_free;
+	}
+
+	node->registered = true;
+
+	ret = media_create_pad_link(&unicam->subdev.sd.entity,
+				    pad_index,
+				    &node->video_dev.entity,
+				    0,
+				    MEDIA_LNK_FL_ENABLED |
+				    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret) {
+		/*
+		 * No need for cleanup, the caller will unregister the
+		 * video device, which will drop the reference on the
+		 * device and trigger the cleanup.
+		 */
+		dev_err(unicam->dev, "Unable to create pad link for %s\n",
+			unicam->sensor.subdev->name);
+		return ret;
+	}
+
+	return 0;
+
+err_dma_free:
+	dma_free_coherent(unicam->dev, node->dummy_buf.size,
+			  node->dummy_buf_cpu_addr,
+			  node->dummy_buf.dma_addr);
+err_entity_cleanup:
+	media_entity_cleanup(&vdev->entity);
+err_unicam_put:
+	unicam_put(unicam);
+	return ret;
+}
+
+static void unicam_unregister_nodes(struct unicam_device *unicam)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(unicam->node); i++) {
+		struct unicam_node *node = &unicam->node[i];
+
+		if (node->registered) {
+			vb2_video_unregister_device(&node->video_dev);
+			node->registered = false;
+		}
+
+		if (node->dummy_buf_cpu_addr)
+			dma_free_coherent(unicam->dev, node->dummy_buf.size,
+					  node->dummy_buf_cpu_addr,
+					  node->dummy_buf.dma_addr);
+	}
+}
+
+/* -----------------------------------------------------------------------------
+ * Power management
+ */
+
+static int unicam_runtime_resume(struct device *dev)
+{
+	struct unicam_device *unicam = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_set_min_rate(unicam->vpu_clock, UNICAM_MIN_VPU_CLOCK_RATE);
+	if (ret) {
+		dev_err(unicam->dev, "failed to set up VPU clock\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(unicam->vpu_clock);
+	if (ret) {
+		dev_err(unicam->dev, "Failed to enable VPU clock: %d\n", ret);
+		goto err_vpu_clock;
+	}
+
+	ret = clk_set_rate(unicam->clock, 100 * 1000 * 1000);
+	if (ret) {
+		dev_err(unicam->dev, "failed to set up CSI clock\n");
+		goto err_vpu_prepare;
+	}
+
+	ret = clk_prepare_enable(unicam->clock);
+	if (ret) {
+		dev_err(unicam->dev, "Failed to enable CSI clock: %d\n", ret);
+		goto err_vpu_prepare;
+	}
+
+	return 0;
+
+err_vpu_prepare:
+	clk_disable_unprepare(unicam->vpu_clock);
+err_vpu_clock:
+	if (clk_set_min_rate(unicam->vpu_clock, 0))
+		dev_err(unicam->dev, "failed to reset the VPU clock\n");
+
+	return ret;
+}
+
+static int unicam_runtime_suspend(struct device *dev)
+{
+	struct unicam_device *unicam = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(unicam->clock);
+
+	if (clk_set_min_rate(unicam->vpu_clock, 0))
+		dev_err(unicam->dev, "failed to reset the VPU clock\n");
+
+	clk_disable_unprepare(unicam->vpu_clock);
+
+	return 0;
+}
+
+static const struct dev_pm_ops unicam_pm_ops = {
+	RUNTIME_PM_OPS(unicam_runtime_suspend, unicam_runtime_resume, NULL)
+};
+
+/* -----------------------------------------------------------------------------
+ * V4L2 async notifier
+ */
+
+static int unicam_async_bound(struct v4l2_async_notifier *notifier,
+			      struct v4l2_subdev *subdev,
+			      struct v4l2_async_connection *asc)
+{
+	struct unicam_device *unicam = notifier_to_unicam_device(notifier);
+	struct media_pad *sink = &unicam->subdev.pads[UNICAM_SD_PAD_SINK];
+	struct media_pad *source;
+	int ret;
+
+	dev_dbg(unicam->dev, "Using sensor %s for capture\n",
+		subdev->name);
+
+	ret = v4l2_create_fwnode_links_to_pad(subdev, sink, MEDIA_LNK_FL_ENABLED |
+					      MEDIA_LNK_FL_IMMUTABLE);
+	if (ret)
+		return ret;
+
+	source = media_pad_remote_pad_unique(sink);
+	if (!source) {
+		dev_err(unicam->dev, "No connected sensor pad\n");
+		return -ENOTCONN;
+	}
+
+	unicam->sensor.subdev = subdev;
+	unicam->sensor.pad = source;
+
+	return 0;
+}
+
+static int unicam_async_complete(struct v4l2_async_notifier *notifier)
+{
+	struct unicam_device *unicam = notifier_to_unicam_device(notifier);
+	int ret;
+
+	ret = unicam_register_node(unicam, UNICAM_IMAGE_NODE);
+	if (ret) {
+		dev_err(unicam->dev, "Unable to register image video device.\n");
+		goto unregister;
+	}
+
+	ret = unicam_register_node(unicam, UNICAM_METADATA_NODE);
+	if (ret) {
+		dev_err(unicam->dev, "Unable to register metadata video device.\n");
+		goto unregister;
+	}
+
+	ret = v4l2_device_register_subdev_nodes(&unicam->v4l2_dev);
+	if (ret) {
+		dev_err(unicam->dev, "Unable to register subdev nodes.\n");
+		goto unregister;
+	}
+
+	return 0;
+
+unregister:
+	unicam_unregister_nodes(unicam);
+	unicam_put(unicam);
+
+	return ret;
+}
+
+static const struct v4l2_async_notifier_operations unicam_async_ops = {
+	.bound = unicam_async_bound,
+	.complete = unicam_async_complete,
+};
+
+static int unicam_async_nf_init(struct unicam_device *unicam)
+{
+	struct v4l2_fwnode_endpoint ep = { };
+	struct fwnode_handle *ep_handle;
+	struct v4l2_async_connection *asc;
+	int ret;
+
+	ret = of_property_read_u32(unicam->dev->of_node, "brcm,num-data-lanes",
+				   &unicam->max_data_lanes);
+	if (ret < 0) {
+		dev_err(unicam->dev, "Missing %s DT property\n",
+			"brcm,num-data-lanes");
+		return -EINVAL;
+	}
+
+	/* Get and parse the local endpoint. */
+	ep_handle = fwnode_graph_get_endpoint_by_id(dev_fwnode(unicam->dev), 0, 0,
+						    FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep_handle) {
+		dev_err(unicam->dev, "No endpoint found\n");
+		return -ENODEV;
+	}
+
+	ret = v4l2_fwnode_endpoint_parse(ep_handle, &ep);
+	if (ret) {
+		dev_err(unicam->dev, "Failed to parse endpoint: %d\n", ret);
+		goto error;
+	}
+
+	unicam->bus_type = ep.bus_type;
+
+	switch (ep.bus_type) {
+	case V4L2_MBUS_CSI2_DPHY: {
+		unsigned int num_data_lanes = ep.bus.mipi_csi2.num_data_lanes;
+
+		if (num_data_lanes != 1 && num_data_lanes != 2 &&
+		    num_data_lanes != 4) {
+			dev_err(unicam->dev, "%u data lanes not supported\n",
+				num_data_lanes);
+			goto error;
+		}
+
+		if (num_data_lanes > unicam->max_data_lanes) {
+			dev_err(unicam->dev,
+				"Endpoint uses %u data lanes when %u are supported\n",
+				num_data_lanes, unicam->max_data_lanes);
+			goto error;
+		}
+
+		unicam->max_data_lanes = num_data_lanes;
+		unicam->bus_flags = ep.bus.mipi_csi2.flags;
+		break;
+	}
+
+	case V4L2_MBUS_CCP2:
+		unicam->max_data_lanes = 1;
+		unicam->bus_flags = ep.bus.mipi_csi1.strobe;
+		break;
+
+	default:
+		/* Unsupported bus type */
+		dev_err(unicam->dev, "Unsupported bus type %u\n", ep.bus_type);
+		goto error;
+	}
+
+	/* Initialize and register the async notifier. */
+	v4l2_async_nf_init(&unicam->notifier, &unicam->v4l2_dev);
+
+	asc = v4l2_async_nf_add_fwnode_remote(&unicam->notifier, ep_handle,
+					      struct v4l2_async_connection);
+	fwnode_handle_put(ep_handle);
+	ep_handle = NULL;
+
+	if (IS_ERR(asc)) {
+		ret = PTR_ERR(asc);
+		dev_err(unicam->dev, "Failed to add entry to notifier: %d\n",
+			ret);
+		goto error;
+	}
+
+	unicam->notifier.ops = &unicam_async_ops;
+
+	ret = v4l2_async_nf_register(&unicam->notifier);
+	if (ret) {
+		dev_err(unicam->dev, "Error registering device notifier: %d\n",
+			ret);
+		goto error;
+	}
+
+	return 0;
+
+error:
+	fwnode_handle_put(ep_handle);
+	return ret;
+}
+
+/* -----------------------------------------------------------------------------
+ * Probe & remove
+ */
+
+static int unicam_media_init(struct unicam_device *unicam)
+{
+	int ret;
+
+	unicam->mdev.dev = unicam->dev;
+	strscpy(unicam->mdev.model, UNICAM_MODULE_NAME,
+		sizeof(unicam->mdev.model));
+	unicam->mdev.hw_revision = 0;
+
+	media_device_init(&unicam->mdev);
+
+	unicam->v4l2_dev.mdev = &unicam->mdev;
+
+	ret = v4l2_device_register(unicam->dev, &unicam->v4l2_dev);
+	if (ret < 0) {
+		dev_err(unicam->dev, "Unable to register v4l2 device\n");
+		goto err_media_cleanup;
+	}
+
+	ret = media_device_register(&unicam->mdev);
+	if (ret < 0) {
+		dev_err(unicam->dev,
+			"Unable to register media-controller device\n");
+		goto err_v4l2_unregister;
+	}
+
+	return 0;
+
+err_v4l2_unregister:
+	v4l2_device_unregister(&unicam->v4l2_dev);
+err_media_cleanup:
+	media_device_cleanup(&unicam->mdev);
+	return ret;
+}
+
+static int unicam_probe(struct platform_device *pdev)
+{
+	struct unicam_device *unicam;
+	int ret;
+
+	unicam = kzalloc(sizeof(*unicam), GFP_KERNEL);
+	if (!unicam)
+		return -ENOMEM;
+
+	kref_init(&unicam->kref);
+	mutex_init(&unicam->lock);
+
+	unicam->dev = &pdev->dev;
+	platform_set_drvdata(pdev, unicam);
+
+	unicam->base = devm_platform_ioremap_resource_byname(pdev, "unicam");
+	if (IS_ERR(unicam->base)) {
+		ret = PTR_ERR(unicam->base);
+		goto err_unicam_put;
+	}
+
+	unicam->clk_gate_base = devm_platform_ioremap_resource_byname(pdev, "cmi");
+	if (IS_ERR(unicam->clk_gate_base)) {
+		ret = PTR_ERR(unicam->clk_gate_base);
+		goto err_unicam_put;
+	}
+
+	unicam->clock = devm_clk_get(&pdev->dev, "lp");
+	if (IS_ERR(unicam->clock)) {
+		dev_err(unicam->dev, "Failed to get lp clock\n");
+		ret = PTR_ERR(unicam->clock);
+		goto err_unicam_put;
+	}
+
+	unicam->vpu_clock = devm_clk_get(&pdev->dev, "vpu");
+	if (IS_ERR(unicam->vpu_clock)) {
+		dev_err(unicam->dev, "Failed to get vpu clock\n");
+		ret = PTR_ERR(unicam->vpu_clock);
+		goto err_unicam_put;
+	}
+
+	ret = platform_get_irq(pdev, 0);
+	if (ret <= 0) {
+		dev_err(&pdev->dev, "No IRQ resource\n");
+		ret = -EINVAL;
+		goto err_unicam_put;
+	}
+
+	ret = devm_request_irq(&pdev->dev, ret, unicam_isr, 0,
+			       "unicam_capture0", unicam);
+	if (ret) {
+		dev_err(&pdev->dev, "Unable to request interrupt\n");
+		ret = -EINVAL;
+		goto err_unicam_put;
+	}
+
+	/* Enable the block power domain. */
+	pm_runtime_enable(&pdev->dev);
+
+	ret = unicam_media_init(unicam);
+	if (ret)
+		goto err_pm_runtime;
+
+	ret = unicam_subdev_init(unicam);
+	if (ret)
+		goto err_media_unregister;
+
+	ret = unicam_async_nf_init(unicam);
+	if (ret)
+		goto err_subdev_unregister;
+
+	return 0;
+
+err_subdev_unregister:
+	unicam_subdev_cleanup(unicam);
+err_media_unregister:
+	media_device_unregister(&unicam->mdev);
+err_pm_runtime:
+	pm_runtime_disable(&pdev->dev);
+err_unicam_put:
+	unicam_put(unicam);
+
+	return ret;
+}
+
+static int unicam_remove(struct platform_device *pdev)
+{
+	struct unicam_device *unicam = platform_get_drvdata(pdev);
+
+	unicam_unregister_nodes(unicam);
+	v4l2_device_unregister(&unicam->v4l2_dev);
+	media_device_unregister(&unicam->mdev);
+	v4l2_async_nf_unregister(&unicam->notifier);
+
+	unicam_subdev_cleanup(unicam);
+
+	unicam_put(unicam);
+
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static const struct of_device_id unicam_of_match[] = {
+	{ .compatible = "brcm,bcm2835-unicam", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, unicam_of_match);
+
+static struct platform_driver unicam_driver = {
+	.probe		= unicam_probe,
+	.remove		= unicam_remove,
+	.driver = {
+		.name	= UNICAM_MODULE_NAME,
+		.pm	= pm_ptr(&unicam_pm_ops),
+		.of_match_table = of_match_ptr(unicam_of_match),
+	},
+};
+
+module_platform_driver(unicam_driver);
+
+MODULE_AUTHOR("Dave Stevenson <dave.stevenson@raspberrypi.com>");
+MODULE_DESCRIPTION("BCM2835 Unicam driver");
+MODULE_LICENSE("GPL");
-- 
Regards,

Laurent Pinchart


