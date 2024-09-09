Return-Path: <linux-media+bounces-17939-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2C2970FBA
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 09:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05A8028329C
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 07:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E151B3B32;
	Mon,  9 Sep 2024 07:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UTdjQdiy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2391B14E9;
	Mon,  9 Sep 2024 07:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725866680; cv=none; b=dGgcey0tmQ9HyguqaICqkOFZrOnHJ8ASMcHeuhK5mTtczDE+orvLUmGU2yAvZZxvDyI1dE1AU917Z3DUwrV4MUqyrjkZgf7tLtQNPyuAr+gYkoDb16UsE+yijkoKx0HYCUJhYQs9JO9W2fJuH4/deT4j8hLkk1OAKlkRkSWj86I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725866680; c=relaxed/simple;
	bh=dXkJ08FrrJHlUXCZHv1hMQ6eeIOgGPA6045dot6sviI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nrNlED/U+vYUJQVxlOFssrutkBgz8BFnRqVv1vXNsH+Pff5KJQk3jMg7wvwHpMfYLrNBv2J3zCln9AgmohBTOG+ocp2NveDwCw4z42lVSb80VzT5hKhElwaodwhMKKJhA00psEjJ1kcr5O9K8ndNV9I7c0G15AGfRMYrsFHQFt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UTdjQdiy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9F93C4CECD;
	Mon,  9 Sep 2024 07:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725866679;
	bh=dXkJ08FrrJHlUXCZHv1hMQ6eeIOgGPA6045dot6sviI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UTdjQdiySPvn51sw/K2O5Dg1eoaos7zd4i/DGVgQns36oL+gILxMNZDbemu5bM5iX
	 aRFdEcBEcRELB/xl6JaDDU1K/rqUO+bPpcQ1ns0rDJYOa8vgdKN99bmg2bmp8UIo/H
	 mBzgknOJ0579IIXfoHMcfvDIhNpigajrvsio2gCmKKmJaPvSQkTSpXjsQbszLvJvY/
	 gqK3WCeD+WMCmeEC+w2tSuraA6MOLf1kuT/1Bem74OvRSgV7e3C/9pSdCChDgw5Zey
	 YQYrx+Ut9M/LNec7RfC/ApQhHYbE1l+uU1YrSr1gqnxsVOqrn/Agycjz4oV77HaL2G
	 n0JECoy+ZNN9A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E77E6FE2D;
	Mon,  9 Sep 2024 07:24:39 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Mon, 09 Sep 2024 15:24:14 +0800
Subject: [PATCH v2 4/9] media: platform: Add c3 mipi adapter driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-c3isp-v2-4-3c866a1cea56@amlogic.com>
References: <20240909-c3isp-v2-0-3c866a1cea56@amlogic.com>
In-Reply-To: <20240909-c3isp-v2-0-3c866a1cea56@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Keke Li <keke.li@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725866660; l=32613;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=0/XLl7rsV3RA8G7YxUQjNPm7hq05fyPG/H7qlLte9DM=;
 b=qiu2FVmRuvz5B3ob+B7IV6r1pnoJT3kXpjqtdhhtWJ7F1GNZe4yomo5mN7X5PWmeg3xFPA9G0
 LpfsNMaydREDKMPDCbfxy04AqNEgxGgYfJVPUXTAhxuC9f3OMNNfOw5
X-Developer-Key: i=keke.li@amlogic.com; a=ed25519;
 pk=XxNPTsQ0YqMJLLekV456eoKV5gbSlxnViB1k1DhfRmU=
X-Endpoint-Received: by B4 Relay for keke.li@amlogic.com/20240902 with
 auth_id=204
X-Original-From: Keke Li <keke.li@amlogic.com>
Reply-To: keke.li@amlogic.com

From: Keke Li <keke.li@amlogic.com>

This driver mainly responsible for organizing
MIPI data and sending raw data to ISP pipeline.

Signed-off-by: Keke Li <keke.li@amlogic.com>
---
 MAINTAINERS                                        |   7 +
 drivers/media/platform/amlogic/Kconfig             |   1 +
 drivers/media/platform/amlogic/Makefile            |   1 +
 .../media/platform/amlogic/c3-mipi-adapter/Kconfig |  16 +
 .../platform/amlogic/c3-mipi-adapter/Makefile      |   3 +
 .../amlogic/c3-mipi-adapter/c3-mipi-adap.c         | 949 +++++++++++++++++++++
 6 files changed, 977 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index de6e25b0eb09..c682e83dff31 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4887,6 +4887,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
 F:	drivers/net/can/bxcan.c
 
+C3 MIPI ADAPTER DRIVER FOR AMLOGIC
+M:	Keke Li <keke.li@amlogic.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml
+F:	drivers/media/platform/amlogic/c3-mipi-adapter/
+
 C3 MIPI CSI2 DRIVER FOR AMLOGIC
 M:	Keke Li <keke.li@amlogic.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/media/platform/amlogic/Kconfig b/drivers/media/platform/amlogic/Kconfig
index b7c2de14848b..df09717b28d0 100644
--- a/drivers/media/platform/amlogic/Kconfig
+++ b/drivers/media/platform/amlogic/Kconfig
@@ -2,5 +2,6 @@
 
 comment "Amlogic media platform drivers"
 
+source "drivers/media/platform/amlogic/c3-mipi-adapter/Kconfig"
 source "drivers/media/platform/amlogic/c3-mipi-csi2/Kconfig"
 source "drivers/media/platform/amlogic/meson-ge2d/Kconfig"
diff --git a/drivers/media/platform/amlogic/Makefile b/drivers/media/platform/amlogic/Makefile
index 4f571ce5d13e..b370154b090c 100644
--- a/drivers/media/platform/amlogic/Makefile
+++ b/drivers/media/platform/amlogic/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+obj-y += c3-mipi-adapter/
 obj-y += c3-mipi-csi2/
 obj-y += meson-ge2d/
diff --git a/drivers/media/platform/amlogic/c3-mipi-adapter/Kconfig b/drivers/media/platform/amlogic/c3-mipi-adapter/Kconfig
new file mode 100644
index 000000000000..bf19059b3543
--- /dev/null
+++ b/drivers/media/platform/amlogic/c3-mipi-adapter/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config VIDEO_C3_MIPI_ADAPTER
+	tristate "Amlogic C3 MIPI adapter"
+	depends on ARCH_MESON || COMPILE_TEST
+	depends on VIDEO_DEV
+	depends on OF
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  Video4Linux2 driver for Amlogic C3 MIPI adapter.
+	  C3 MIPI adapter mainly responsible for organizing
+	  MIPI data and sending raw data to ISP pipeline.
+
+	  To compile this driver as a module choose m here.
diff --git a/drivers/media/platform/amlogic/c3-mipi-adapter/Makefile b/drivers/media/platform/amlogic/c3-mipi-adapter/Makefile
new file mode 100644
index 000000000000..216fc310c5b4
--- /dev/null
+++ b/drivers/media/platform/amlogic/c3-mipi-adapter/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_VIDEO_C3_MIPI_ADAPTER) += c3-mipi-adap.o
diff --git a/drivers/media/platform/amlogic/c3-mipi-adapter/c3-mipi-adap.c b/drivers/media/platform/amlogic/c3-mipi-adapter/c3-mipi-adap.c
new file mode 100644
index 000000000000..d02b80c88359
--- /dev/null
+++ b/drivers/media/platform/amlogic/c3-mipi-adapter/c3-mipi-adap.c
@@ -0,0 +1,949 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Copyright (C) 2024 Amlogic, Inc. All rights reserved
+ */
+
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-async.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
+/* C3 adapter submodule definition */
+enum {
+	SUBMD_TOP,
+	SUBMD_FD,
+	SUBMD_RD,
+};
+
+#define ADAP_SUBMD_MASK             GENMASK(17, 16)
+#define ADAP_SUBMD_SHIFT            16
+#define ADAP_SUBMD(x)               (((x) & (ADAP_SUBMD_MASK)) >> (ADAP_SUBMD_SHIFT))
+#define ADAP_REG_ADDR_MASK          GENMASK(15, 0)
+#define ADAP_REG_ADDR(x)            ((x) & (ADAP_REG_ADDR_MASK))
+#define ADAP_REG_T(x)               ((SUBMD_TOP << ADAP_SUBMD_SHIFT) | (x))
+#define ADAP_REG_F(x)               ((SUBMD_FD << ADAP_SUBMD_SHIFT) | (x))
+#define ADAP_REG_R(x)               ((SUBMD_RD << ADAP_SUBMD_SHIFT) | (x))
+
+#define MIPI_ADAP_CLOCK_NUM_MAX     3
+#define MIPI_ADAP_SUBDEV_NAME       "mipi-adapter"
+
+/* C3 MIPI adapter TOP register */
+#define MIPI_ADAPT_DE_CTRL0         ADAP_REG_T(0x40)
+#define ADAP_DE_READ_BYPASS         BIT(3)
+#define ADAP_DE_WRITE_BYPASS        BIT(7)
+
+/* C3 MIPI adapter FRONTEND register */
+#define CSI2_CLK_RESET              ADAP_REG_F(0x00)
+#define ADAP_FD_APPLY_RESET         BIT(0)
+#define ADAP_FD_ENABLE              BIT(1)
+
+#define CSI2_GEN_CTRL0              ADAP_REG_F(0x04)
+#define ADAP_FD_VIRTUAL_CHN0_EN     BIT(0)
+#define ADAP_FD_VIRTUAL_CHN1_EN     BIT(1)
+#define ADAP_FD_VIRTUAL_CHN2_EN     BIT(2)
+#define ADAP_FD_VIRTUAL_CHN3_EN     BIT(3)
+#define ADAP_FD_ENABLE_PACKETS      GENMASK(20, 16)
+#define ADAP_FD_ENABLE_RAW          BIT(16)
+
+#define CSI2_X_START_END_ISP        ADAP_REG_F(0x0c)
+#define ADAP_FD_X_END_MASK          GENMASK(31, 16)
+#define ADAP_FD_X_END_SHIFT         16
+#define ADAP_FD_X_END(x)            ((x) - 1)
+
+#define CSI2_Y_START_END_ISP        ADAP_REG_F(0x10)
+#define ADAP_FD_Y_END_MASK          GENMASK(31, 16)
+#define ADAP_FD_Y_END_SHIFT         16
+#define ADAP_FD_Y_END(x)            ((x) - 1)
+
+#define CSI2_VC_MODE                ADAP_REG_F(0x1c)
+#define ADAP_FD_VS_SEL_VC_MASK      GENMASK(19, 16)
+#define ADAP_FD_VS_DIRECT_PATH      BIT(16)
+#define ADAP_FD_HS_SEL_VC_MASK      GENMASK(23, 20)
+#define ADAP_FD_HS_DIRECT_PATH      BIT(20)
+
+/* C3 MIPI adapter READER register */
+#define MIPI_ADAPT_DDR_RD0_CNTL0    ADAP_REG_R(0x00)
+#define ADAP_RD0_MODULE_ENABLE      BIT(0)
+#define ADAP_RD0_LINE_STRIDE_MASK   GENMASK(13, 4)
+#define ADAP_RD0_LINE_STRIDE_SHIFT  4
+#define ADAP_RD0_SAMPLE_SEL_MASK    GENMASK(27, 26)
+#define ADAP_RD0_DATA_IN_VSYNC      BIT(26)
+#define ADAP_RD0_BURST_TYPE_MASK    GENMASK(29, 28)
+#define ADAP_RD0_BURST_TYPE_SHIFT   28
+#define ADAP_RD0_BURST_TYPE_INRC8   3
+#define ADAP_RD0_FRAME_RD_START     BIT(31)
+
+#define MIPI_ADAPT_DDR_RD0_CNTL1    ADAP_REG_R(0x04)
+#define ADAP_RD0_LINE_SIZE_MASK     GENMASK(9, 0)
+#define ADAP_RD0_LINE_NUM_MASK      GENMASK(28, 16)
+#define ADAP_RD0_LINE_NUM_SHIFT     16
+
+#define MIPI_ADAPT_PIXEL0_CNTL0     ADAP_REG_R(0x80)
+#define ADAP_PIXEL0_WORK_MODE_MASK  GENMASK(17, 16)
+#define ADAP_PIXEL0_DIRECT_PATH     BIT(16)
+#define ADAP_PIXEL0_DATA_TYPE_MASK  GENMASK(25, 20)
+#define ADAP_PIXEL0_DATA_TYPE_SHIFT 20
+#define ADAP_PIXEL0_DATA_TYPE_10BITS 0x2b
+#define ADAP_PIXEL0_DATA_TYPE_12BITS 0x2c
+#define ADAP_PIXEL0_START_ENABLE    BIT(31)
+
+#define MIPI_ADAPT_PIXEL0_CNTL1     ADAP_REG_R(0x84)
+#define ADAP_PIXEL0_X_END_MASK      GENMASK(15, 0)
+#define ADAP_PIXEL0_X_END(x)        ((x) - 1)
+
+#define MIPI_ADAPT_PIXEL0_CNTL2     ADAP_REG_R(0x88)
+#define ADAP_PIXEL0_FIFO_SIZE_MASK  GENMASK(9, 0)
+#define ADAP_PIXEL0_PIXEL_NUM_MASK  GENMASK(27, 15)
+#define ADAP_PIXEL0_PIXEL_NUM_SHIFT 15
+
+#define MIPI_ADAPT_ALIG_CNTL0       ADAP_REG_R(0x100)
+#define ADAP_ALIG_V_TOTAL_NUM_MASK  GENMASK(15, 0)
+/* Need to add a default blank */
+#define ADAP_ALIG_V_TOTAL_NUM(x)    ((x) + 64)
+#define ADAP_ALIG_H_TOTAL_NUM_MASK  GENMASK(31, 16)
+#define ADAP_ALIG_H_TOTAL_NUM_SHIFT 16
+/* Need to add a default blank */
+#define ADAP_ALIG_H_TOTAL_NUM(x)    ((x) + 64)
+
+#define MIPI_ADAPT_ALIG_CNTL1       ADAP_REG_R(0x104)
+#define ADAP_ALIG_HPE_NUM_MASK      GENMASK(31, 16)
+#define ADAP_ALIG_HPE_NUM_SHIFT     16
+
+#define MIPI_ADAPT_ALIG_CNTL2       ADAP_REG_R(0x108)
+#define ADAP_ALIG_VPE_NUM_MASK      GENMASK(31, 16)
+#define ADAP_ALIG_VPE_NUM_SHIFT     16
+
+#define MIPI_ADAPT_ALIG_CNTL3       ADAP_REG_R(0x10c)
+#define ADAP_ALIG_FRM_ST_PIXEL_MASK GENMASK(15, 0)
+
+#define MIPI_ADAPT_ALIG_CNTL6       ADAP_REG_R(0x118)
+#define ADAP_ALIG_LANE0_ENABLE      BIT(0)
+#define ADAP_ALIG_DATA_MODE0_MASK   BIT(4)
+#define ADAP_ALIG_DIRECT_MODE       BIT(4)
+#define ADAP_ALIG_VDATA0_ENABLE     BIT(12)
+#define ADAP_ALIG_VDATA1_ENABLE     BIT(13)
+#define ADAP_ALIG_VDATA2_ENABLE     BIT(14)
+#define ADAP_ALIG_VDATA3_ENABLE     BIT(15)
+
+#define MIPI_ADAPT_ALIG_CNTL8       ADAP_REG_R(0x120)
+#define ADAP_ALIG_FRAME_CONTINUE    BIT(5)
+#define ADAP_ALIG_EXC_MASK_DIS      BIT(12)
+#define ADAP_ALIG_START_ENABLE      BIT(31)
+
+#define MIPI_ADAP_MAX_WIDTH         2888
+#define MIPI_ADAP_MIN_WIDTH         160
+#define MIPI_ADAP_MAX_HEIGHT        2240
+#define MIPI_ADAP_MIN_HEIGHT        120
+#define MIPI_ADAP_DEFAULT_WIDTH     1920
+#define MIPI_ADAP_DEFAULT_HEIGHT    1080
+#define MIPI_ADAP_DEFAULT_FMT       MEDIA_BUS_FMT_SRGGB10_1X10
+
+/* C3 MIPI adapter pad list */
+enum {
+	MIPI_ADAP_PAD_SINK,
+	MIPI_ADAP_PAD_SRC,
+	MIPI_ADAP_PAD_MAX
+};
+
+/*
+ * struct adap_info - mipi adapter information
+ *
+ * @clocks: array of mipi adapter clock names
+ * @clock_rates: array of mipi adapter clock rate
+ * @clock_num: actual clock number
+ */
+struct adap_info {
+	char *clocks[MIPI_ADAP_CLOCK_NUM_MAX];
+	u32 clock_rates[MIPI_ADAP_CLOCK_NUM_MAX];
+	u32 clock_num;
+};
+
+/**
+ * struct adap_device - mipi adapter platform device
+ *
+ * @dev: pointer to the struct device
+ * @top: mipi adapter top register address
+ * @fd: mipi adapter frontend register address
+ * @rd: mipi adapter reader register address
+ * @clks: array of MIPI adapter clocks
+ * @sd: mipi adapter sub-device
+ * @pads: mipi adapter sub-device pads
+ * @notifier: notifier to register on the v4l2-async API
+ * @format: save sub-device format
+ * @src_sd: source sub-device
+ * @src_sd_pad: source sub-device pad
+ * @lock: protect mipi adapter device
+ * @info: version-specific MIPI adapter information
+ */
+struct adap_device {
+	struct device *dev;
+	void __iomem *top;
+	void __iomem *fd;
+	void __iomem *rd;
+	struct clk_bulk_data clks[MIPI_ADAP_CLOCK_NUM_MAX];
+
+	struct v4l2_subdev sd;
+	struct media_pad pads[MIPI_ADAP_PAD_MAX];
+	struct v4l2_async_notifier notifier;
+	struct v4l2_subdev_format format;
+	struct v4l2_subdev *src_sd;
+
+	u16 src_sd_pad;
+	struct mutex lock; /* Protect adapter device */
+	const struct adap_info *info;
+};
+
+/* Format helpers */
+
+struct adap_pix_format {
+	u32 code;
+	u8 width;
+};
+
+static const struct adap_pix_format c3_mipi_adap_formats[] = {
+	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10 },
+	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10 },
+	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10 },
+	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10 },
+	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12 },
+	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12 },
+	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12 },
+	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12 },
+};
+
+static const struct adap_pix_format
+*c3_mipi_adap_find_format(u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(c3_mipi_adap_formats); i++)
+		if (code == c3_mipi_adap_formats[i].code)
+			return &c3_mipi_adap_formats[i];
+
+	return NULL;
+}
+
+/* Hardware configuration */
+
+static int c3_mipi_adap_update_bits(struct adap_device *adap, u32 reg,
+				    u32 mask, u32 val)
+{
+	void __iomem *addr;
+	u32 orig, tmp;
+
+	switch (ADAP_SUBMD(reg)) {
+	case SUBMD_TOP:
+		addr = adap->top + ADAP_REG_ADDR(reg);
+		break;
+	case SUBMD_FD:
+		addr = adap->fd + ADAP_REG_ADDR(reg);
+		break;
+	case SUBMD_RD:
+		addr = adap->rd + ADAP_REG_ADDR(reg);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	orig = readl(addr);
+	tmp = orig & ~mask;
+	tmp |= val & mask;
+
+	if (tmp != orig)
+		writel(tmp, addr);
+
+	return 0;
+}
+
+/* Configure adapter top sub module */
+static void c3_mipi_adap_cfg_top(struct adap_device *adap)
+{
+	/* Bypass decompress */
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_DE_CTRL0,
+				 ADAP_DE_READ_BYPASS, ADAP_DE_READ_BYPASS);
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_DE_CTRL0,
+				 ADAP_DE_WRITE_BYPASS, ADAP_DE_WRITE_BYPASS);
+}
+
+/* Configure adapter frontend sub module */
+static void c3_mipi_adap_cfg_frontend(struct adap_device *adap,
+				      struct v4l2_mbus_framefmt *fmt)
+{
+	/* The default value of BIT_0 is 1, so need release reset firstly. */
+	c3_mipi_adap_update_bits(adap, CSI2_CLK_RESET, ADAP_FD_APPLY_RESET, 0);
+
+	c3_mipi_adap_update_bits(adap, CSI2_X_START_END_ISP,
+				 ADAP_FD_X_END_MASK,
+				 ADAP_FD_X_END(fmt->width) << ADAP_FD_X_END_SHIFT);
+	c3_mipi_adap_update_bits(adap, CSI2_Y_START_END_ISP,
+				 ADAP_FD_Y_END_MASK,
+				 ADAP_FD_Y_END(fmt->height) << ADAP_FD_Y_END_SHIFT);
+
+	/* Select VS and HS signal to direct path */
+	c3_mipi_adap_update_bits(adap, CSI2_VC_MODE,
+				 ADAP_FD_VS_SEL_VC_MASK,
+				 ADAP_FD_VS_DIRECT_PATH);
+	c3_mipi_adap_update_bits(adap, CSI2_VC_MODE,
+				 ADAP_FD_HS_SEL_VC_MASK,
+				 ADAP_FD_HS_DIRECT_PATH);
+
+	/* Enable to receive RAW image */
+	c3_mipi_adap_update_bits(adap, CSI2_GEN_CTRL0,
+				 ADAP_FD_ENABLE_PACKETS,
+				 ADAP_FD_ENABLE_RAW);
+
+	/* Enable virtual channel 0~3 */
+	c3_mipi_adap_update_bits(adap, CSI2_GEN_CTRL0,
+				 ADAP_FD_VIRTUAL_CHN0_EN,
+				 ADAP_FD_VIRTUAL_CHN0_EN);
+	c3_mipi_adap_update_bits(adap, CSI2_GEN_CTRL0,
+				 ADAP_FD_VIRTUAL_CHN1_EN,
+				 ADAP_FD_VIRTUAL_CHN1_EN);
+	c3_mipi_adap_update_bits(adap, CSI2_GEN_CTRL0,
+				 ADAP_FD_VIRTUAL_CHN2_EN,
+				 ADAP_FD_VIRTUAL_CHN2_EN);
+	c3_mipi_adap_update_bits(adap, CSI2_GEN_CTRL0,
+				 ADAP_FD_VIRTUAL_CHN3_EN,
+				 ADAP_FD_VIRTUAL_CHN3_EN);
+}
+
+/* Configure adapter reader sub module */
+static void c3_mipi_adap_cfg_reader(struct adap_device *adap,
+				    struct v4l2_mbus_framefmt *fmt)
+{
+	const struct adap_pix_format *pix_format;
+	u32 line_size;
+	u8 data_type;
+
+	/* Data size for a line, unit: 128 bits */
+	pix_format = c3_mipi_adap_find_format(fmt->code);
+	line_size = fmt->width * pix_format->width;
+	line_size = DIV_ROUND_UP(line_size, 128);
+
+	if (pix_format->width == 10) {
+		data_type = ADAP_PIXEL0_DATA_TYPE_10BITS;
+	} else if (pix_format->width == 12) {
+		data_type = ADAP_PIXEL0_DATA_TYPE_12BITS;
+	} else {
+		dev_err(adap->dev, "Invalid raw format width: %u\n", pix_format->width);
+		return;
+	}
+
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_DDR_RD0_CNTL1,
+				 ADAP_RD0_LINE_SIZE_MASK, line_size);
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_DDR_RD0_CNTL1,
+				 ADAP_RD0_LINE_NUM_MASK,
+				 fmt->height << ADAP_RD0_LINE_NUM_SHIFT);
+
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_DDR_RD0_CNTL0,
+				 ADAP_RD0_MODULE_ENABLE,
+				 ADAP_RD0_MODULE_ENABLE);
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_DDR_RD0_CNTL0,
+				 ADAP_RD0_LINE_STRIDE_MASK,
+				 line_size << ADAP_RD0_LINE_STRIDE_SHIFT);
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_DDR_RD0_CNTL0,
+				 ADAP_RD0_SAMPLE_SEL_MASK,
+				 ADAP_RD0_DATA_IN_VSYNC);
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_DDR_RD0_CNTL0,
+				 ADAP_RD0_BURST_TYPE_MASK,
+				 ADAP_RD0_BURST_TYPE_INRC8 << ADAP_RD0_BURST_TYPE_SHIFT);
+
+	/* Set data type and work mode */
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_PIXEL0_CNTL0,
+				 ADAP_PIXEL0_WORK_MODE_MASK,
+				 ADAP_PIXEL0_DIRECT_PATH);
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_PIXEL0_CNTL0,
+				 ADAP_PIXEL0_DATA_TYPE_MASK,
+				 data_type << ADAP_PIXEL0_DATA_TYPE_SHIFT);
+
+	/* Set pixel end number */
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_PIXEL0_CNTL1,
+				 ADAP_PIXEL0_X_END_MASK,
+				 ADAP_PIXEL0_X_END(fmt->width));
+
+	/* Set line pixel number and reader fifo size */
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_PIXEL0_CNTL2,
+				 ADAP_PIXEL0_FIFO_SIZE_MASK, line_size);
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_PIXEL0_CNTL2,
+				 ADAP_PIXEL0_PIXEL_NUM_MASK,
+				 fmt->width << ADAP_PIXEL0_PIXEL_NUM_SHIFT);
+
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL0,
+				 ADAP_ALIG_V_TOTAL_NUM_MASK,
+				 ADAP_ALIG_V_TOTAL_NUM(fmt->width));
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL0,
+				 ADAP_ALIG_H_TOTAL_NUM_MASK,
+				 ADAP_ALIG_H_TOTAL_NUM(fmt->height)
+				 << ADAP_ALIG_H_TOTAL_NUM_SHIFT);
+
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL1,
+				 ADAP_ALIG_HPE_NUM_MASK,
+				 fmt->width << ADAP_ALIG_HPE_NUM_SHIFT);
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL2,
+				 ADAP_ALIG_VPE_NUM_MASK,
+				 fmt->height << ADAP_ALIG_VPE_NUM_SHIFT);
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL3,
+				 ADAP_ALIG_FRM_ST_PIXEL_MASK, fmt->width);
+
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL6,
+				 ADAP_ALIG_LANE0_ENABLE,
+				 ADAP_ALIG_LANE0_ENABLE);
+
+	/* Select direct mode */
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL6,
+				 ADAP_ALIG_DATA_MODE0_MASK,
+				 ADAP_ALIG_DIRECT_MODE);
+
+	/* Enable vdata 0~3 */
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL6,
+				 ADAP_ALIG_VDATA0_ENABLE,
+				 ADAP_ALIG_VDATA0_ENABLE);
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL6,
+				 ADAP_ALIG_VDATA1_ENABLE,
+				 ADAP_ALIG_VDATA1_ENABLE);
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL6,
+				 ADAP_ALIG_VDATA2_ENABLE,
+				 ADAP_ALIG_VDATA2_ENABLE);
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL6,
+				 ADAP_ALIG_VDATA3_ENABLE,
+				 ADAP_ALIG_VDATA2_ENABLE);
+
+	/* continue mode and disable hold counter */
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL8,
+				 ADAP_ALIG_FRAME_CONTINUE,
+				 ADAP_ALIG_FRAME_CONTINUE);
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL8,
+				 ADAP_ALIG_EXC_MASK_DIS,
+				 ADAP_ALIG_EXC_MASK_DIS);
+}
+
+static void c3_mipi_adap_start_stream(struct adap_device *adap)
+{
+	/* Enable to start and will auto clear to 0 */
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL8,
+				 ADAP_ALIG_START_ENABLE,
+				 ADAP_ALIG_START_ENABLE);
+
+	/* Enable to start and will auto clear to 0 */
+	c3_mipi_adap_update_bits(adap, MIPI_ADAPT_PIXEL0_CNTL0,
+				 ADAP_PIXEL0_START_ENABLE,
+				 ADAP_PIXEL0_START_ENABLE);
+
+	/* Enable frontend */
+	c3_mipi_adap_update_bits(adap, CSI2_CLK_RESET,
+				 ADAP_FD_ENABLE, ADAP_FD_ENABLE);
+}
+
+static void c3_mipi_adap_cfg_format(struct adap_device *adap)
+{
+	struct v4l2_subdev_format *format = &adap->format;
+
+	c3_mipi_adap_cfg_top(adap);
+	c3_mipi_adap_cfg_frontend(adap, &format->format);
+	c3_mipi_adap_cfg_reader(adap, &format->format);
+}
+
+/* V4L2 subdev operations */
+
+static int c3_mipi_adap_enable_streams(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state,
+				       u32 pad, u64 streams_mask)
+{
+	struct adap_device *adap = v4l2_get_subdevdata(sd);
+	u64 sink_streams;
+	int ret;
+
+	guard(mutex)(&adap->lock);
+
+	pm_runtime_resume_and_get(adap->dev);
+
+	c3_mipi_adap_cfg_format(adap);
+	c3_mipi_adap_start_stream(adap);
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       MIPI_ADAP_PAD_SINK,
+						       &streams_mask);
+	ret = v4l2_subdev_enable_streams(adap->src_sd,
+					 adap->src_sd_pad,
+					 sink_streams);
+	if (ret) {
+		pm_runtime_put(adap->dev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int c3_mipi_adap_disable_streams(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					u32 pad, u64 streams_mask)
+{
+	struct adap_device *adap = v4l2_get_subdevdata(sd);
+	u64 sink_streams;
+	int ret;
+
+	guard(mutex)(&adap->lock);
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       MIPI_ADAP_PAD_SINK,
+						       &streams_mask);
+	ret = v4l2_subdev_disable_streams(adap->src_sd,
+					  adap->src_sd_pad,
+					  sink_streams);
+	if (ret)
+		dev_err(adap->dev, "Failed to disable %s\n", adap->src_sd->name);
+
+	pm_runtime_put(adap->dev);
+
+	return ret;
+}
+
+static int c3_mipi_adap_cfg_routing(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_krouting *routing)
+{
+	static const struct v4l2_mbus_framefmt format = {
+		.width = MIPI_ADAP_DEFAULT_WIDTH,
+		.height = MIPI_ADAP_DEFAULT_HEIGHT,
+		.code = MIPI_ADAP_DEFAULT_FMT,
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_RAW,
+		.ycbcr_enc = V4L2_YCBCR_ENC_601,
+		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+		.xfer_func = V4L2_XFER_FUNC_NONE,
+	};
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int c3_mipi_adap_init_routing(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes;
+	struct v4l2_subdev_krouting routing;
+
+	routes.sink_pad = MIPI_ADAP_PAD_SINK;
+	routes.sink_stream = 0;
+	routes.source_pad = MIPI_ADAP_PAD_SRC;
+	routes.source_stream = 0;
+	routes.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
+
+	routing.num_routes = 1;
+	routing.routes = &routes;
+
+	return c3_mipi_adap_cfg_routing(sd, state, &routing);
+}
+
+static int c3_mipi_adap_set_routing(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    enum v4l2_subdev_format_whence which,
+				    struct v4l2_subdev_krouting *routing)
+{
+	bool is_streaming = v4l2_subdev_is_streaming(sd);
+
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && is_streaming)
+		return -EBUSY;
+
+	return c3_mipi_adap_cfg_routing(sd, state, routing);
+}
+
+static int c3_mipi_adap_enum_mbus_code(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state,
+				       struct v4l2_subdev_mbus_code_enum *code)
+{
+	switch (code->pad) {
+	case MIPI_ADAP_PAD_SINK:
+		if (code->index >= ARRAY_SIZE(c3_mipi_adap_formats))
+			return -EINVAL;
+
+		code->code = c3_mipi_adap_formats[code->index].code;
+		break;
+	case MIPI_ADAP_PAD_SRC:
+		struct v4l2_mbus_framefmt *fmt;
+
+		if (code->index > 0)
+			return -EINVAL;
+
+		fmt = v4l2_subdev_state_get_format(state, code->pad);
+		code->code = fmt->code;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int c3_mipi_adap_set_fmt(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_format *format)
+{
+	struct adap_device *adap = v4l2_get_subdevdata(sd);
+	struct v4l2_mbus_framefmt *fmt;
+	const struct adap_pix_format *pix_format;
+
+	if (format->pad == MIPI_ADAP_PAD_SRC)
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	if (format->pad != MIPI_ADAP_PAD_SINK)
+		return -EINVAL;
+
+	pix_format = c3_mipi_adap_find_format(format->format.code);
+	if (!pix_format)
+		pix_format = &c3_mipi_adap_formats[0];
+
+	fmt = v4l2_subdev_state_get_format(state, format->pad);
+	fmt->code = pix_format->code;
+	fmt->width = clamp_t(u32, format->format.width,
+			     MIPI_ADAP_MIN_WIDTH, MIPI_ADAP_MAX_WIDTH);
+	fmt->height = clamp_t(u32, format->format.height,
+			      MIPI_ADAP_MIN_HEIGHT, MIPI_ADAP_MAX_HEIGHT);
+
+	format->format = *fmt;
+
+	/* Synchronize the format to source pad */
+	fmt = v4l2_subdev_state_get_format(state, MIPI_ADAP_PAD_SRC);
+	*fmt = format->format;
+
+	adap->format = *format;
+
+	return 0;
+}
+
+static int c3_mipi_adap_init_state(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_mbus_framefmt *src_fmt;
+
+	sink_fmt = v4l2_subdev_state_get_format(state, MIPI_ADAP_PAD_SINK);
+	src_fmt = v4l2_subdev_state_get_format(state, MIPI_ADAP_PAD_SRC);
+
+	sink_fmt->width = MIPI_ADAP_DEFAULT_WIDTH;
+	sink_fmt->height = MIPI_ADAP_DEFAULT_HEIGHT;
+	sink_fmt->field = V4L2_FIELD_NONE;
+	sink_fmt->code = MIPI_ADAP_DEFAULT_FMT;
+	sink_fmt->colorspace = V4L2_COLORSPACE_RAW;
+	sink_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(sink_fmt->colorspace);
+	sink_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(sink_fmt->colorspace);
+	sink_fmt->quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(false, sink_fmt->colorspace,
+					      sink_fmt->ycbcr_enc);
+	*src_fmt = *sink_fmt;
+
+	return c3_mipi_adap_init_routing(sd, state);
+}
+
+static const struct v4l2_subdev_pad_ops c3_mipi_adap_pad_ops = {
+	.enum_mbus_code = c3_mipi_adap_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = c3_mipi_adap_set_fmt,
+	.set_routing = c3_mipi_adap_set_routing,
+	.enable_streams = c3_mipi_adap_enable_streams,
+	.disable_streams = c3_mipi_adap_disable_streams,
+};
+
+static const struct v4l2_subdev_ops c3_mipi_adap_subdev_ops = {
+	.pad = &c3_mipi_adap_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops c3_mipi_adap_internal_ops = {
+	.init_state = c3_mipi_adap_init_state,
+};
+
+/* Media entity operations */
+static const struct media_entity_operations c3_mipi_adap_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+/* PM runtime */
+
+static int __maybe_unused c3_mipi_adap_runtime_suspend(struct device *dev)
+{
+	struct adap_device *adap = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(adap->info->clock_num, adap->clks);
+
+	return 0;
+}
+
+static int __maybe_unused c3_mipi_adap_runtime_resume(struct device *dev)
+{
+	struct adap_device *adap = dev_get_drvdata(dev);
+
+	return clk_bulk_prepare_enable(adap->info->clock_num, adap->clks);
+}
+
+static const struct dev_pm_ops c3_mipi_adap_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(c3_mipi_adap_runtime_suspend,
+			   c3_mipi_adap_runtime_resume, NULL)
+};
+
+/* Probe/remove & platform driver */
+
+static int c3_mipi_adap_subdev_init(struct adap_device *adap)
+{
+	struct v4l2_subdev *sd = &adap->sd;
+	int ret;
+
+	v4l2_subdev_init(sd, &c3_mipi_adap_subdev_ops);
+	sd->owner = THIS_MODULE;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->internal_ops = &c3_mipi_adap_internal_ops;
+	snprintf(sd->name, sizeof(sd->name), "%s", MIPI_ADAP_SUBDEV_NAME);
+
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->entity.ops = &c3_mipi_adap_entity_ops;
+
+	sd->dev = adap->dev;
+	v4l2_set_subdevdata(sd, adap);
+
+	adap->pads[MIPI_ADAP_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	adap->pads[MIPI_ADAP_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&sd->entity, MIPI_ADAP_PAD_MAX, adap->pads);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret) {
+		media_entity_cleanup(&sd->entity);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void c3_mipi_adap_subdev_deinit(struct adap_device *adap)
+{
+	v4l2_subdev_cleanup(&adap->sd);
+	media_entity_cleanup(&adap->sd.entity);
+}
+
+/* Subdev notifier register */
+static int c3_mipi_adap_notify_bound(struct v4l2_async_notifier *notifier,
+				     struct v4l2_subdev *sd,
+				     struct v4l2_async_connection *asc)
+{
+	struct adap_device *adap = v4l2_get_subdevdata(notifier->sd);
+	struct media_pad *sink = &adap->sd.entity.pads[MIPI_ADAP_PAD_SINK];
+	int ret;
+
+	ret = media_entity_get_fwnode_pad(&sd->entity,
+					  sd->fwnode, MEDIA_PAD_FL_SOURCE);
+	if (ret < 0) {
+		dev_err(adap->dev, "Failed to find pad for %s\n", sd->name);
+		return ret;
+	}
+
+	adap->src_sd = sd;
+	adap->src_sd_pad = ret;
+
+	return v4l2_create_fwnode_links_to_pad(sd, sink, MEDIA_LNK_FL_ENABLED |
+					       MEDIA_LNK_FL_IMMUTABLE);
+}
+
+static const struct v4l2_async_notifier_operations c3_mipi_adap_notify_ops = {
+	.bound = c3_mipi_adap_notify_bound,
+};
+
+static int c3_mipi_adap_async_register(struct adap_device *adap)
+{
+	struct v4l2_async_connection *asc;
+	struct fwnode_handle *ep;
+	int ret;
+
+	v4l2_async_subdev_nf_init(&adap->notifier, &adap->sd);
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(adap->dev), 0, 0,
+					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return -ENOTCONN;
+
+	asc = v4l2_async_nf_add_fwnode_remote(&adap->notifier, ep,
+					      struct v4l2_async_connection);
+	if (IS_ERR(asc)) {
+		ret = PTR_ERR(asc);
+		goto err_put_handle;
+	}
+
+	adap->notifier.ops = &c3_mipi_adap_notify_ops;
+	ret = v4l2_async_nf_register(&adap->notifier);
+	if (ret)
+		goto err_cleanup_nf;
+
+	ret = v4l2_async_register_subdev(&adap->sd);
+	if (ret)
+		goto err_unregister_nf;
+
+	fwnode_handle_put(ep);
+
+	return 0;
+
+err_unregister_nf:
+	v4l2_async_nf_unregister(&adap->notifier);
+err_cleanup_nf:
+	v4l2_async_nf_cleanup(&adap->notifier);
+err_put_handle:
+	fwnode_handle_put(ep);
+	return ret;
+}
+
+static void c3_mipi_adap_async_unregister(struct adap_device *adap)
+{
+	v4l2_async_unregister_subdev(&adap->sd);
+	v4l2_async_nf_unregister(&adap->notifier);
+	v4l2_async_nf_cleanup(&adap->notifier);
+}
+
+static int c3_mipi_adap_ioremap_resource(struct adap_device *adap)
+{
+	struct device *dev = adap->dev;
+	struct platform_device *pdev = to_platform_device(dev);
+
+	adap->top = devm_platform_ioremap_resource_byname(pdev, "top");
+	if (IS_ERR(adap->top))
+		return PTR_ERR(adap->top);
+
+	adap->fd = devm_platform_ioremap_resource_byname(pdev, "fd");
+	if (IS_ERR(adap->fd))
+		return PTR_ERR(adap->fd);
+
+	adap->rd = devm_platform_ioremap_resource_byname(pdev, "rd");
+	if (IS_ERR(adap->rd))
+		return PTR_ERR(adap->rd);
+
+	return 0;
+}
+
+static int c3_mipi_adap_configure_clocks(struct adap_device *adap)
+{
+	const struct adap_info *info = adap->info;
+	int ret;
+	u32 i;
+
+	for (i = 0; i < info->clock_num; i++)
+		adap->clks[i].id = info->clocks[i];
+
+	ret = devm_clk_bulk_get(adap->dev, info->clock_num, adap->clks);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < info->clock_num; i++) {
+		if (!info->clock_rates[i])
+			continue;
+		ret = clk_set_rate(adap->clks[i].clk, info->clock_rates[i]);
+		if (ret) {
+			dev_err(adap->dev, "Failed to set %s rate %u\n", info->clocks[i],
+				info->clock_rates[i]);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int c3_mipi_adap_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct adap_device *adap;
+	int ret;
+
+	adap = devm_kzalloc(dev, sizeof(*adap), GFP_KERNEL);
+	if (!adap)
+		return -ENOMEM;
+
+	adap->info = of_device_get_match_data(dev);
+	adap->dev = dev;
+
+	ret = c3_mipi_adap_ioremap_resource(adap);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to ioremap resource\n");
+
+	ret = c3_mipi_adap_configure_clocks(adap);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to configure clocks\n");
+
+	platform_set_drvdata(pdev, adap);
+
+	mutex_init(&adap->lock);
+	pm_runtime_enable(dev);
+
+	ret = c3_mipi_adap_subdev_init(adap);
+	if (ret < 0)
+		goto err_disable_runtime_pm;
+
+	ret = c3_mipi_adap_async_register(adap);
+	if (ret < 0)
+		goto err_deinit_subdev;
+
+	return 0;
+
+err_deinit_subdev:
+	c3_mipi_adap_subdev_deinit(adap);
+err_disable_runtime_pm:
+	pm_runtime_disable(dev);
+	mutex_destroy(&adap->lock);
+	return ret;
+};
+
+static void c3_mipi_adap_remove(struct platform_device *pdev)
+{
+	struct adap_device *adap = platform_get_drvdata(pdev);
+
+	c3_mipi_adap_async_unregister(adap);
+	c3_mipi_adap_subdev_deinit(adap);
+
+	pm_runtime_disable(&pdev->dev);
+	mutex_destroy(&adap->lock);
+};
+
+static const struct adap_info c3_mipi_adap_info = {
+	.clocks = {"vapb", "isp0"},
+	.clock_rates = {0, 400000000},
+	.clock_num = 2
+};
+
+static const struct of_device_id c3_mipi_adap_of_match[] = {
+	{ .compatible = "amlogic,c3-mipi-adapter",
+	  .data = &c3_mipi_adap_info },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, c3_mipi_adap_of_match);
+
+static struct platform_driver c3_mipi_adap_driver = {
+	.probe = c3_mipi_adap_probe,
+	.remove_new = c3_mipi_adap_remove,
+	.driver = {
+		.name = "c3-mipi-adapter",
+		.of_match_table = c3_mipi_adap_of_match,
+		.pm = &c3_mipi_adap_pm_ops,
+	},
+};
+
+module_platform_driver(c3_mipi_adap_driver);
+
+MODULE_AUTHOR("Keke Li <keke.li@amlogic.com>");
+MODULE_DESCRIPTION("Amlogic C3 MIPI adapter");
+MODULE_LICENSE("GPL");

-- 
2.46.0



