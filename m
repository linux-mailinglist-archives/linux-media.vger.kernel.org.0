Return-Path: <linux-media+bounces-36702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6065EAF8008
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 20:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A81E917F1FF
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 18:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA6D2F2C76;
	Thu,  3 Jul 2025 18:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j0opY7Ro"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFE51D5CE5;
	Thu,  3 Jul 2025 18:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751567593; cv=none; b=KJdMSUdk0hf8zO74E/f5JMs6fRcFft3bAbl497d0t48QMVmrdBYn1cKwpWPYhZ1RTy5VjT42PulPiUsoeKbFtoGdxOToHGQBPdHWtnTgrCEmUOG3UYIw+LDyYl1ka+uqTEPS856fE2Rwg3SbqK4eO7W1vcZj4kLI01NOmljslS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751567593; c=relaxed/simple;
	bh=UvF1XDzd6J3giIA0gcLirQGgjIINbh1GEIgY9UB/pWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QNgG1xRlmE9NezvOj53j9f434mgczCzy9Q8505XmU8dI8EiaoDpFPlZ2sHr+GzOsPC7YVDKsjNVqdbWvk7WZoFx/yes1wmyzV1Plx7u4z+gxH3xBqM391GvPyXtfVr6ZcXCNVOwzs0ELhS03nNgjS2a1asbfgul6QrFbCtjD+wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j0opY7Ro; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1028C4CEEB;
	Thu,  3 Jul 2025 18:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751567592;
	bh=UvF1XDzd6J3giIA0gcLirQGgjIINbh1GEIgY9UB/pWA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=j0opY7RoBChHFmi0Pk8s9wXx4g9bonoZTOBESAP71L3pQHHr5sE3dGo6faqVPfMS5
	 4WXnmwXpjHqUYjbZpBfrMi1bzggvZixIf7b+WqGS4A4ISVreFjKLrql7pYVfT6QP70
	 yO1DdJ+Vxrn+g09rHcoBs68xXLvrdjNtsPCyo+qAYirXDn8yH1HaXqgvDve09JGPLL
	 KyF7FfI6+KNyCp90yVEEttfS3vsLj9y0cuUZIIhSBY/RCFJIMRuiTrBRl4O8Jz52BA
	 TifB1m0AmnbZq/8HWneoiggsh6FUHYkBwe+NjeQH02QCxPJLqO469cJfNmm2vSD22V
	 lXdsuP0BDbCBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0529C83F07;
	Thu,  3 Jul 2025 18:33:12 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Thu, 03 Jul 2025 14:33:07 -0400
Subject: [PATCH v2 2/4] media: nxp: add V4L2 subdev driver for parallel CSI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-imx8qxp_pcam-v2-2-188be85f06f1@nxp.com>
References: <20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com>
In-Reply-To: <20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Robert Chiras <robert.chiras@nxp.com>, 
 Zhipeng Wang <zhipeng.wang_1@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751567591; l=30642;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=WSJM4SnlZSBhwQs4OQdFPt2E+/xiOhaAr8PLvKbllPg=;
 b=C6g2zPo/j/KLIc/CCXB7HYziu645t/Tph42u1okGynAhbBPJx2JuqiOpbSSXrA5Ncx+TSmDdp
 5AQih77GNdHAZNMthxO+1XO0qraQPTZ3SZPBKWhtVjW9hWhPjcM00pX
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
Reply-To: Frank.Li@nxp.com

From: Alice Yuan <alice.yuan@nxp.com>

Add a V4L2 sub-device driver for the parallel CSI controller found on
i.MX8QXP, i.MX8QM, and i.MX93 SoCs. This controller supports parallel
camera sensors and enables image data capture through a parallel interface.

Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- remove MODULE_ALIAS
- use devm_pm_runtime_enable() and cleanup remove function
- change output format to 1x16. controller convert 2x8 to 1x16 format
---
 MAINTAINERS                                   |   1 +
 drivers/media/platform/nxp/Kconfig            |  11 +
 drivers/media/platform/nxp/Makefile           |   1 +
 drivers/media/platform/nxp/imx-parallel-csi.c | 944 ++++++++++++++++++++++++++
 4 files changed, 957 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8ae0667d2bb41fb6a1549bd3b2b33f326cbd1303..d936d15269344023afbc36ecadf77d66655bbac0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15112,6 +15112,7 @@ F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
 F:	drivers/media/platform/nxp/imx-mipi-csis.c
+F:	drivers/media/platform/nxp/imx-parallel-csi.c
 F:	drivers/media/platform/nxp/imx7-media-csi.c
 F:	drivers/media/platform/nxp/imx8mq-mipi-csi2.c
 
diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index 40e3436669e213fdc5da70821dc0b420e1821f4f..5df6f97d16f294875e40716985bae0d893345bdd 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -39,6 +39,17 @@ config VIDEO_IMX_MIPI_CSIS
 	  Video4Linux2 sub-device driver for the MIPI CSI-2 CSIS receiver
 	  v3.3/v3.6.3 found on some i.MX7 and i.MX8 SoCs.
 
+config VIDEO_IMX_PARALLEL_CSI
+	tristate "NXP i.MX9/i.MX8 Parallel CSI Driver"
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  Video4Linux2 sub-device driver for PARALLEL CSI receiver found
+	  on some iMX8 and iMX9 SoCs.
+
 source "drivers/media/platform/nxp/imx8-isi/Kconfig"
 
 # mem2mem drivers
diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
index 4d90eb71365259ebdda84ea58483e1c4131d3ac7..076592c58575cb6550ba824f2a10fed4410cb8cf 100644
--- a/drivers/media/platform/nxp/Makefile
+++ b/drivers/media/platform/nxp/Makefile
@@ -7,5 +7,6 @@ obj-y += imx8-isi/
 obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
 obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
 obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
+obj-$(CONFIG_VIDEO_IMX_PARALLEL_CSI) += imx-parallel-csi.o
 obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
 obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
diff --git a/drivers/media/platform/nxp/imx-parallel-csi.c b/drivers/media/platform/nxp/imx-parallel-csi.c
new file mode 100644
index 0000000000000000000000000000000000000000..1567739e68a2a8afc58b42e836c5b9a936af1cf5
--- /dev/null
+++ b/drivers/media/platform/nxp/imx-parallel-csi.c
@@ -0,0 +1,944 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * i.MX Parallel CSI receiver driver.
+ *
+ * Copyright 2019-2025 NXP
+ *
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+#include <linux/spinlock.h>
+
+#include <media/v4l2-common.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
+#define PARALLEL_CSI_DEF_MBUS_CODE		MEDIA_BUS_FMT_UYVY8_2X8
+#define PARALLEL_CSI_DEF_PIX_WIDTH		1920
+#define PARALLEL_CSI_DEF_PIX_HEIGHT		1080
+
+#define PARALLEL_CSI_MAX_PIX_WIDTH		0xffff
+#define PARALLEL_CSI_MAX_PIX_HEIGHT		0xffff
+
+#define CI_PI_BASE_OFFSET			0x0
+
+#define PARALLEL_CSI_PAD_SINK			0
+#define PARALLEL_CSI_PAD_SOURCE			1
+#define PARALLEL_CSI_PADS_NUM			2
+
+/* CI_PI INTERFACE Control */
+#define IF_CTRL_REG_PL_ENABLE			BIT(0)
+#define IF_CTRL_REG_PL_VALID			BIT(1)
+#define IF_CTRL_REG_DATA_TYPE_SEL		BIT(8)
+#define IF_CTRL_REG_DATA_TYPE(x)		FIELD_PREP(GENMASK(13, 9), (x))
+
+#define DATA_TYPE_OUT_NULL			0x00
+#define DATA_TYPE_OUT_RGB			0x04
+#define DATA_TYPE_OUT_YUV444			0x08
+#define DATA_TYPE_OUT_YYU420_ODD		0x10
+#define DATA_TYPE_OUT_YYU420_EVEN		0x12
+#define DATA_TYPE_OUT_YYY_ODD			0x18
+#define DATA_TYPE_OUT_UYVY_EVEN			0x1a
+#define DATA_TYPE_OUT_RAW			0x1c
+
+#define IF_CTRL_REG_IF_FORCE_HSYNV_OVERRIDE	0x4
+#define IF_CTRL_REG_IF_FORCE_VSYNV_OVERRIDE	0x2
+#define IF_CTRL_REG_IF_FORCE_DATA_ENABLE_OVERRIDE	0x1
+
+/* CSI INTERFACE CONTROL REG */
+#define CSI_CTRL_REG_CSI_EN			BIT(0)
+#define CSI_CTRL_REG_PIXEL_CLK_POL		BIT(1)
+#define CSI_CTRL_REG_HSYNC_POL			BIT(2)
+#define CSI_CTRL_REG_VSYNC_POL			BIT(3)
+#define CSI_CTRL_REG_DE_POL			BIT(4)
+#define CSI_CTRL_REG_PIXEL_DATA_POL		BIT(5)
+#define CSI_CTRL_REG_CCIR_EXT_VSYNC_EN		BIT(6)
+#define CSI_CTRL_REG_CCIR_EN			BIT(7)
+#define CSI_CTRL_REG_CCIR_VIDEO_MODE		BIT(8)
+#define CSI_CTRL_REG_CCIR_NTSC_EN		BIT(9)
+#define CSI_CTRL_REG_CCIR_VSYNC_RESET_EN	BIT(10)
+#define CSI_CTRL_REG_CCIR_ECC_ERR_CORRECT_EN	BIT(11)
+#define CSI_CTRL_REG_HSYNC_FORCE_EN		BIT(12)
+#define CSI_CTRL_REG_VSYNC_FORCE_EN		BIT(13)
+#define CSI_CTRL_REG_GCLK_MODE_EN		BIT(14)
+#define CSI_CTRL_REG_VALID_SEL			BIT(15)
+#define CSI_CTRL_REG_RAW_OUT_SEL		BIT(16)
+#define CSI_CTRL_REG_HSYNC_OUT_SEL		BIT(17)
+#define CSI_CTRL_REG_HSYNC_PULSE(x)		FIELD_PREP(GENMASK(21, 19), (x))
+#define CSI_CTRL_REG_UV_SWAP_EN			BIT(22)
+#define CSI_CTRL_REG_DATA_TYPE_IN(x)		FIELD_PREP(GENMASK(26, 23), (x))
+#define CSI_CTRL_REG_MASK_VSYNC_COUNTER(x)	FIELD_PREP(GENMASK(28, 27), (x))
+#define CSI_CTRL_REG_SOFTRST			BIT(31)
+
+/* CSI interface Status */
+#define CSI_STATUS_FIELD_TOGGLE			BIT(0)
+#define CSI_STATUS_ECC_ERROR			BIT(1)
+
+/* CSI INTERFACE CONTROL REG1 */
+#define CSI_CTRL_REG1_PIXEL_WIDTH(v)		FIELD_PREP(GENMASK(15, 0), (v))
+#define CSI_CTRL_REG1_VSYNC_PULSE(v)		FIELD_PREP(GENMASK(31, 16), (v))
+
+/* Need match field DATA_TYPE_IN definition at CSI CTRL register */
+enum csi_in_data_type {
+	CSI_IN_DT_UYVY_BT656_8 = 0x0,
+	CSI_IN_DT_UYVY_BT656_10,
+	CSI_IN_DT_RGB_8,
+	CSI_IN_DT_BGR_8,
+	CSI_IN_DT_YVYU_8 = 0x5,
+	CSI_IN_DT_YUV_8,
+	CSI_IN_DT_RAW_8 = 0x9,
+	CSI_IN_DT_RAW_10,
+};
+
+enum {
+	PI_MODE_INIT,
+	PI_GATE_CLOCK_MODE,
+	PI_CCIR_MODE,
+};
+
+enum {
+	PI_V1,
+	PI_V2,
+};
+
+static const char *const parallel_csi_clk_id[] = {
+	"pixel",
+	"ipg",
+};
+
+#define PCSIDEV_NUM_CLKS   ARRAY_SIZE(parallel_csi_clk_id)
+
+struct parallel_csi_plat_data {
+	u32 version;
+	u32 if_ctrl_reg;
+	u32 interface_status;
+	u32 interface_ctrl_reg;
+	u32 interface_ctrl_reg1;
+	u8 def_hsync_pol;
+	u8 def_vsync_pol;
+	u8 def_pixel_clk_pol;
+	u8 def_csi_in_data_type;
+};
+
+struct csi_pm_domain {
+	struct device *dev;
+	struct device_link *link;
+};
+
+struct parallel_csi_device {
+	struct device *dev;
+	void __iomem *regs;
+	struct reset_control *mrst;
+	struct regulator *pcsi_phy_regulator;
+	struct clk_bulk_data clks[PCSIDEV_NUM_CLKS];
+
+	struct v4l2_subdev sd;
+	struct media_pad pads[PARALLEL_CSI_PADS_NUM];
+	struct v4l2_async_notifier notifier;
+
+	struct v4l2_mbus_framefmt format;
+	const struct parallel_csi_plat_data *pdata;
+	struct parallel_csi_pix_format const *pcsidev_fmt;
+
+	struct {
+		struct v4l2_subdev *sd;
+		const struct media_pad *pad;
+	} source;
+
+	struct csi_pm_domain pm_domains[2];
+
+	u8 mode;
+	u8 uv_swap;
+};
+
+struct parallel_csi_pix_format {
+	u32 code;
+	u32 output;
+	u32 data_type;
+	u8 width;
+};
+
+static const struct parallel_csi_pix_format parallel_csi_formats[] = {
+	/* YUV formats. */
+	{
+		.code = MEDIA_BUS_FMT_UYVY8_2X8,
+		.output = MEDIA_BUS_FMT_UYVY8_1X16,
+		.data_type = CSI_IN_DT_YVYU_8,
+		.width = 16,
+	}, {
+		.code = MEDIA_BUS_FMT_YUYV8_2X8,
+		.output = MEDIA_BUS_FMT_YUYV8_1X16,
+		.data_type = CSI_IN_DT_YVYU_8,
+		.width = 16,
+	},
+};
+
+static const struct parallel_csi_plat_data imx8qxp_pdata = {
+	.version = PI_V1,
+	.if_ctrl_reg = 0x0,
+	.interface_status = 0x20,
+	.interface_ctrl_reg = 0x10,
+	.interface_ctrl_reg1 = 0x30,
+	.def_hsync_pol = 1,
+	.def_vsync_pol = 0,
+	.def_pixel_clk_pol = 0,
+	.def_csi_in_data_type = CSI_IN_DT_UYVY_BT656_8,
+};
+
+static const struct parallel_csi_plat_data imx93_pdata = {
+	.version = PI_V2,
+	.if_ctrl_reg = 0x0,
+	.interface_status = 0x4,
+	.interface_ctrl_reg = 0x8,
+	.interface_ctrl_reg1 = 0xc,
+	.def_hsync_pol = 0,
+	.def_vsync_pol = 1,
+	.def_pixel_clk_pol = 0,
+	.def_csi_in_data_type = CSI_IN_DT_YVYU_8,
+};
+
+static const struct parallel_csi_plat_data imx91_pdata = {
+	.version = PI_V2,
+	.if_ctrl_reg = 0x0,
+	.interface_status = 0x4,
+	.interface_ctrl_reg = 0x8,
+	.interface_ctrl_reg1 = 0xc,
+	.def_hsync_pol = 0,
+	.def_vsync_pol = 1,
+	.def_pixel_clk_pol = 0,
+	.def_csi_in_data_type = CSI_IN_DT_YVYU_8,
+};
+
+static void parallel_csi_regs_dump(struct parallel_csi_device *pcsidev)
+{
+	struct device *dev = pcsidev->dev;
+	const struct parallel_csi_plat_data *pdata = pcsidev->pdata;
+	u32 i;
+
+	struct {
+		u32 offset;
+		const char *const name;
+	} registers[] = {
+		{ pdata->if_ctrl_reg, "HW_IF_CTRL_REG" },
+		{ pdata->interface_ctrl_reg, "HW_CSI_CTRL_REG" },
+		{ pdata->interface_status, "HW_CSI_STATUS" },
+		{ pdata->interface_ctrl_reg1, "HW_CSI_CTRL_REG1" },
+
+	};
+
+	for (i = 0; i < ARRAY_SIZE(registers); i++) {
+		u32 reg = readl(pcsidev->regs + registers[i].offset);
+
+		dev_dbg(dev, "%20s[0x%.2x]: 0x%.8x\n",
+			registers[i].name, registers[i].offset, reg);
+	}
+}
+
+static const struct parallel_csi_pix_format *find_parallel_csi_format(u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(parallel_csi_formats); i++)
+		if (code == parallel_csi_formats[i].code)
+			return &parallel_csi_formats[i];
+
+	return NULL;
+}
+
+static void parallel_csi_sw_reset(struct parallel_csi_device *pcsidev)
+{
+	const struct parallel_csi_plat_data *pdata = pcsidev->pdata;
+	u32 val;
+
+	/* Softwaret Reset */
+	val = readl(pcsidev->regs + pdata->interface_ctrl_reg);
+	val |= CSI_CTRL_REG_SOFTRST;
+	writel(val, pcsidev->regs + pdata->interface_ctrl_reg);
+
+	usleep_range(500, 1000);
+	val = readl(pcsidev->regs + pdata->interface_ctrl_reg);
+	val &= ~CSI_CTRL_REG_SOFTRST;
+	writel(val, pcsidev->regs + pdata->interface_ctrl_reg);
+}
+
+static void parallel_csi_hw_config(struct parallel_csi_device *pcsidev)
+{
+	const struct parallel_csi_plat_data *pdata = pcsidev->pdata;
+	u32 val;
+
+	/* Software Reset */
+	parallel_csi_sw_reset(pcsidev);
+
+	/* Config PL Data Type */
+	val = readl(pcsidev->regs + pdata->if_ctrl_reg);
+	val |= IF_CTRL_REG_DATA_TYPE(DATA_TYPE_OUT_YUV444);
+	writel(val, pcsidev->regs + pdata->if_ctrl_reg);
+
+	/* Enable sync Force */
+	val = readl(pcsidev->regs + pdata->interface_ctrl_reg);
+	val |= (CSI_CTRL_REG_HSYNC_FORCE_EN | CSI_CTRL_REG_VSYNC_FORCE_EN);
+	writel(val, pcsidev->regs + pdata->interface_ctrl_reg);
+
+	/* Enable Pixel Link */
+	val = readl(pcsidev->regs + pdata->if_ctrl_reg);
+	val |= IF_CTRL_REG_PL_ENABLE;
+	writel(val, pcsidev->regs + pdata->if_ctrl_reg);
+
+	/* Enable Pixel Link */
+	val = readl(pcsidev->regs + pdata->if_ctrl_reg);
+	val |= IF_CTRL_REG_PL_VALID;
+	writel(val, pcsidev->regs + pdata->if_ctrl_reg);
+
+	/* Config CTRL REG */
+	val = readl(pcsidev->regs + pdata->interface_ctrl_reg);
+
+	val |= (CSI_CTRL_REG_DATA_TYPE_IN(pdata->def_csi_in_data_type) |
+		FIELD_PREP(CSI_CTRL_REG_HSYNC_POL, pdata->def_hsync_pol) |
+		FIELD_PREP(CSI_CTRL_REG_VSYNC_POL, pdata->def_vsync_pol) |
+		FIELD_PREP(CSI_CTRL_REG_PIXEL_CLK_POL, pdata->def_pixel_clk_pol) |
+		CSI_CTRL_REG_MASK_VSYNC_COUNTER(3) |
+		CSI_CTRL_REG_HSYNC_PULSE(2));
+
+	if (pcsidev->uv_swap)
+		val |= CSI_CTRL_REG_UV_SWAP_EN;
+
+	if (pcsidev->mode & PI_GATE_CLOCK_MODE) {
+		val |= CSI_CTRL_REG_GCLK_MODE_EN;
+	} else if (pcsidev->mode & PI_CCIR_MODE) {
+		val |= (CSI_CTRL_REG_CCIR_EN |
+			CSI_CTRL_REG_CCIR_VSYNC_RESET_EN |
+			CSI_CTRL_REG_CCIR_EXT_VSYNC_EN |
+			CSI_CTRL_REG_CCIR_ECC_ERR_CORRECT_EN);
+	}
+
+	writel(val, pcsidev->regs + pdata->interface_ctrl_reg);
+}
+
+static int get_interface_ctrl_reg1_param(struct parallel_csi_device *pcsidev,
+					 u32 *pixel_width, u32 *vsync_pulse,
+					 const struct v4l2_mbus_framefmt *format)
+{
+	u32 version = pcsidev->pdata->version;
+
+	switch (version) {
+	case PI_V1:
+		*pixel_width = format->width - 1;
+		*vsync_pulse = format->width << 1;
+		break;
+	case PI_V2:
+		*pixel_width = format->width << 3;
+		*vsync_pulse = format->width - 1;
+		break;
+	default:
+		dev_err(pcsidev->dev, "Not support PI version %d\n", version);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void parallel_csi_config_ctrl_reg1(struct parallel_csi_device *pcsidev,
+					  const struct v4l2_mbus_framefmt *format)
+{
+	const struct parallel_csi_plat_data *pdata = pcsidev->pdata;
+	struct device *dev = pcsidev->dev;
+	u32 pixel_width;
+	u32 vsync_pulse;
+	u32 val;
+	int ret;
+
+	dev_dbg(dev, "%s %dx%d, fmt->code:0x%0x\n", __func__,
+		format->width, format->height, format->code);
+
+	if (format->width <= 0 || format->height <= 0) {
+		dev_err(dev, "%s width/height invalid\n", __func__);
+		return;
+	}
+
+	ret = get_interface_ctrl_reg1_param(pcsidev, &pixel_width,
+					    &vsync_pulse, format);
+	if (ret < 0)
+		return;
+
+	val = (CSI_CTRL_REG1_PIXEL_WIDTH(pixel_width) |
+	       CSI_CTRL_REG1_VSYNC_PULSE(vsync_pulse));
+	writel(val, pcsidev->regs + pdata->interface_ctrl_reg1);
+}
+
+static void parallel_csi_enable(struct parallel_csi_device *pcsidev)
+{
+	const struct parallel_csi_plat_data *pdata = pcsidev->pdata;
+	u32 val;
+
+	/* Enable CSI */
+	val = readl(pcsidev->regs + pdata->interface_ctrl_reg);
+	val |= CSI_CTRL_REG_CSI_EN;
+	writel(val, pcsidev->regs + pdata->interface_ctrl_reg);
+
+	/* Disable SYNC Force */
+	val = readl(pcsidev->regs + pdata->interface_ctrl_reg);
+	val &= ~(CSI_CTRL_REG_HSYNC_FORCE_EN | CSI_CTRL_REG_VSYNC_FORCE_EN);
+	writel(val, pcsidev->regs + pdata->interface_ctrl_reg);
+}
+
+static void parallel_csi_disable(struct parallel_csi_device *pcsidev)
+{
+	const struct parallel_csi_plat_data *pdata = pcsidev->pdata;
+	u32 val;
+
+	/* Enable Sync Force */
+	val = readl(pcsidev->regs + pdata->interface_ctrl_reg);
+	val |= (CSI_CTRL_REG_HSYNC_FORCE_EN | CSI_CTRL_REG_VSYNC_FORCE_EN);
+	writel(val, pcsidev->regs + pdata->interface_ctrl_reg);
+
+	/* Disable CSI */
+	val = readl(pcsidev->regs + pdata->interface_ctrl_reg);
+	val &= ~CSI_CTRL_REG_CSI_EN;
+	writel(val, pcsidev->regs + pdata->interface_ctrl_reg);
+
+	/* Disable Pixel Link */
+	val = readl(pcsidev->regs + pdata->if_ctrl_reg);
+	val &= ~(IF_CTRL_REG_PL_VALID | IF_CTRL_REG_PL_ENABLE);
+	writel(val, pcsidev->regs + pdata->if_ctrl_reg);
+}
+
+static void parallel_csi_start_stream(struct parallel_csi_device *pcsidev,
+				      const struct v4l2_mbus_framefmt *format,
+				      const struct parallel_csi_pix_format *pcsidev_fmt)
+{
+	if (pcsidev_fmt->code == MEDIA_BUS_FMT_YUYV8_2X8 ||
+	    pcsidev_fmt->code == MEDIA_BUS_FMT_UYVY8_2X8)
+		pcsidev->uv_swap = 1;
+
+	parallel_csi_hw_config(pcsidev);
+	parallel_csi_config_ctrl_reg1(pcsidev, format);
+	parallel_csi_enable(pcsidev);
+	parallel_csi_regs_dump(pcsidev);
+}
+
+static void parallel_csi_stop_stream(struct parallel_csi_device *pcsidev)
+{
+	parallel_csi_regs_dump(pcsidev);
+	parallel_csi_disable(pcsidev);
+}
+
+/* -----------------------------------------------------------------------------
+ * Async subdev notifier
+ */
+
+static struct parallel_csi_device *
+notifier_to_parallel_csi_device(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct parallel_csi_device, notifier);
+}
+
+static struct parallel_csi_device *
+sd_to_parallel_csi_device(struct v4l2_subdev *sdev)
+{
+	return container_of(sdev, struct parallel_csi_device, sd);
+}
+
+static int parallel_csi_notify_bound(struct v4l2_async_notifier *notifier,
+				     struct v4l2_subdev *sd,
+				     struct v4l2_async_connection *asd)
+{
+	struct parallel_csi_device *pcsidev = notifier_to_parallel_csi_device(notifier);
+	struct media_pad *sink = &pcsidev->sd.entity.pads[PARALLEL_CSI_PAD_SINK];
+
+	return v4l2_create_fwnode_links_to_pad(sd, sink, 0);
+}
+
+static const struct v4l2_async_notifier_operations parallel_csi_notify_ops = {
+	.bound = parallel_csi_notify_bound,
+};
+
+static int parallel_csi_async_register(struct parallel_csi_device *pcsidev)
+{
+	struct v4l2_fwnode_endpoint vep = {
+		.bus_type = V4L2_MBUS_PARALLEL,
+	};
+	struct v4l2_async_connection *asd;
+	struct fwnode_handle *ep;
+	int ret;
+
+	v4l2_async_subdev_nf_init(&pcsidev->notifier, &pcsidev->sd);
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(pcsidev->dev), 0, 0,
+					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return -ENOTCONN;
+
+	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+	if (ret)
+		goto err_parse;
+
+	asd = v4l2_async_nf_add_fwnode_remote(&pcsidev->notifier, ep,
+					      struct v4l2_async_connection);
+	if (IS_ERR(asd)) {
+		ret = PTR_ERR(asd);
+		goto err_parse;
+	}
+
+	fwnode_handle_put(ep);
+
+	pcsidev->notifier.ops = &parallel_csi_notify_ops;
+	ret = v4l2_async_nf_register(&pcsidev->notifier);
+	if (ret)
+		return ret;
+
+	return v4l2_async_register_subdev(&pcsidev->sd);
+
+err_parse:
+	fwnode_handle_put(ep);
+
+	return ret;
+}
+
+/* -----------------------------------------------------------------------------
+ * Media entity operations
+ */
+
+static int parallel_csi_link_setup(struct media_entity *entity,
+				   const struct media_pad *local_pad,
+				   const struct media_pad *remote_pad,
+				   u32 flags)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct parallel_csi_device *pcsidev = sd_to_parallel_csi_device(sd);
+	struct v4l2_subdev *remote_sd;
+
+	dev_dbg(pcsidev->dev, "link setup %s -> %s", remote_pad->entity->name,
+		local_pad->entity->name);
+
+	/* We only care about the link to the source. */
+	if (!(local_pad->flags & MEDIA_PAD_FL_SINK))
+		return 0;
+
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+	if (flags & MEDIA_LNK_FL_ENABLED) {
+		if (pcsidev->source.sd)
+			return -EBUSY;
+
+		pcsidev->source.sd = remote_sd;
+		pcsidev->source.pad = remote_pad;
+	} else {
+		pcsidev->source.sd = NULL;
+		pcsidev->source.pad = NULL;
+	}
+
+	return 0;
+}
+
+static const struct media_entity_operations parallel_csi_entity_ops = {
+	.link_setup = parallel_csi_link_setup,
+	.link_validate = v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
+};
+
+static int parallel_csi_set_fmt(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_format *sdformat)
+{
+	struct parallel_csi_pix_format const *pcsidev_fmt;
+	struct parallel_csi_device *pcsidev = sd_to_parallel_csi_device(sd);
+	struct device *dev = pcsidev->dev;
+	struct v4l2_mbus_framefmt *fmt;
+	unsigned int align;
+
+	/*
+	 * The Parallel csi can't transcode in any way, the source format
+	 * can't be modified.
+	 */
+	if (sdformat->pad == PARALLEL_CSI_PAD_SOURCE)
+		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
+
+	/*
+	 * Validate the media bus code and clamp and align the size.
+	 *
+	 * The total number of bits per line must be a multiple of 8. We thus
+	 * need to align the width for formats that are not multiples of 8
+	 * bits.
+	 */
+	pcsidev_fmt = find_parallel_csi_format(sdformat->format.code);
+	if (!pcsidev_fmt)
+		pcsidev_fmt = &parallel_csi_formats[0];
+
+	switch (pcsidev_fmt->width % 8) {
+	case 0:
+		align = 0;
+		break;
+	case 4:
+		align = 1;
+		break;
+	case 2:
+	case 6:
+		align = 2;
+		break;
+	default:
+		/* 1, 3, 5, 7 */
+		align = 3;
+		break;
+	}
+
+	v4l_bound_align_image(&sdformat->format.width, 1,
+			      PARALLEL_CSI_MAX_PIX_WIDTH, align,
+			      &sdformat->format.height, 1,
+			      PARALLEL_CSI_MAX_PIX_HEIGHT, 0, 0);
+
+	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
+	if (!fmt)
+		return -EINVAL;
+
+	fmt->code = pcsidev_fmt->code;
+	fmt->width = sdformat->format.width;
+	fmt->height = sdformat->format.height;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = sdformat->format.colorspace;
+	fmt->quantization = sdformat->format.quantization;
+	fmt->xfer_func = sdformat->format.xfer_func;
+	fmt->ycbcr_enc = sdformat->format.ycbcr_enc;
+
+	sdformat->format = *fmt;
+
+	/* Propagate the format from sink to source. */
+	fmt = v4l2_subdev_state_get_format(sd_state, PARALLEL_CSI_PAD_SOURCE);
+	*fmt = sdformat->format;
+
+	/* The format on the source pad might change due to unpacking. */
+	fmt->code = pcsidev_fmt->output;
+
+	dev_dbg(dev, "%s: fmt_code:0x%0x, %dx%d\n", __func__,
+		fmt->code, fmt->width, fmt->height);
+	return 0;
+}
+
+static const struct v4l2_mbus_framefmt parallel_csi_default_fmt = {
+	.code = PARALLEL_CSI_DEF_MBUS_CODE,
+	.width = PARALLEL_CSI_DEF_PIX_WIDTH,
+	.height = PARALLEL_CSI_DEF_PIX_HEIGHT,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_SMPTE170M,
+	.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
+	.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
+	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+};
+
+static int parallel_csi_init_state(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_subdev_format fmt = {
+		.pad = PARALLEL_CSI_PAD_SINK,
+	};
+
+	fmt.format.code = parallel_csi_formats[0].code;
+	fmt.format.width = PARALLEL_CSI_DEF_PIX_WIDTH;
+	fmt.format.height = PARALLEL_CSI_DEF_PIX_HEIGHT;
+
+	fmt.format.colorspace = V4L2_COLORSPACE_SMPTE170M;
+	fmt.format.xfer_func =
+	    V4L2_MAP_XFER_FUNC_DEFAULT(fmt.format.colorspace);
+	fmt.format.ycbcr_enc =
+	    V4L2_MAP_YCBCR_ENC_DEFAULT(fmt.format.colorspace);
+	fmt.format.quantization =
+	    V4L2_MAP_QUANTIZATION_DEFAULT(false,
+					  fmt.format.colorspace,
+					  fmt.format.ycbcr_enc);
+
+	return parallel_csi_set_fmt(sd, sd_state, &fmt);
+}
+
+static int parallel_csi_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct parallel_csi_device *pcsidev = sd_to_parallel_csi_device(sd);
+	const struct v4l2_mbus_framefmt *format;
+	const struct parallel_csi_pix_format *pcsidev_fmt;
+	struct v4l2_subdev_state *state;
+	int ret;
+
+	if (!enable) {
+		v4l2_subdev_disable_streams(pcsidev->source.sd,
+					    pcsidev->source.pad->index, BIT(0));
+
+		parallel_csi_stop_stream(pcsidev);
+
+		pm_runtime_put(pcsidev->dev);
+
+		return 0;
+	}
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	format = v4l2_subdev_state_get_format(state, PARALLEL_CSI_PAD_SINK);
+	pcsidev_fmt = find_parallel_csi_format(format->code);
+
+	ret = pm_runtime_resume_and_get(pcsidev->dev);
+	if (ret < 0)
+		goto err_unlock;
+
+	parallel_csi_start_stream(pcsidev, format, pcsidev_fmt);
+
+	ret = v4l2_subdev_enable_streams(pcsidev->source.sd,
+					 pcsidev->source.pad->index, BIT(0));
+	if (ret < 0)
+		goto err_stop;
+
+	v4l2_subdev_unlock_state(state);
+
+	return 0;
+
+err_stop:
+	parallel_csi_stop_stream(pcsidev);
+	pm_runtime_put(pcsidev->dev);
+err_unlock:
+	v4l2_subdev_unlock_state(state);
+	return ret;
+}
+
+static int parallel_csi_enum_mbus_code(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *sd_state,
+				       struct v4l2_subdev_mbus_code_enum *code)
+{
+	/*
+	 * The PARALLEL CSI can't transcode in any way, the source format
+	 * is identical to the sink format.
+	 */
+	if (code->pad == PARALLEL_CSI_PAD_SOURCE) {
+		struct v4l2_mbus_framefmt *fmt;
+
+		if (code->index > 0)
+			return -EINVAL;
+
+		fmt = v4l2_subdev_state_get_format(sd_state, code->pad);
+		code->code = fmt->code;
+		return 0;
+	}
+
+	if (code->pad != PARALLEL_CSI_PAD_SINK)
+		return -EINVAL;
+
+	if (code->index >= ARRAY_SIZE(parallel_csi_formats))
+		return -EINVAL;
+
+	code->code = parallel_csi_formats[code->index].code;
+
+	return 0;
+}
+
+static int parallel_csi_get_frame_desc(struct v4l2_subdev *sd,
+				       unsigned int pad,
+				       struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[0];
+	const struct parallel_csi_pix_format *pcsidev_fmt;
+	const struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
+
+	if (pad != PARALLEL_CSI_PAD_SOURCE)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	fmt = v4l2_subdev_state_get_format(state, PARALLEL_CSI_PAD_SOURCE);
+	pcsidev_fmt = find_parallel_csi_format(fmt->code);
+	v4l2_subdev_unlock_state(state);
+
+	if (!pcsidev_fmt)
+		return -EPIPE;
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
+	fd->num_entries = 1;
+
+	entry->flags = 0;
+	entry->pixelcode = pcsidev_fmt->code;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops parallel_csi_video_ops = {
+	.s_stream = parallel_csi_s_stream,
+};
+
+static const struct v4l2_subdev_pad_ops parallel_csi_pad_ops = {
+	.enum_mbus_code = parallel_csi_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = parallel_csi_set_fmt,
+	.get_frame_desc = parallel_csi_get_frame_desc,
+};
+
+static const struct v4l2_subdev_ops parallel_csi_subdev_ops = {
+	.pad = &parallel_csi_pad_ops,
+	.video = &parallel_csi_video_ops,
+};
+
+static const struct v4l2_subdev_internal_ops parallel_csi_internal_ops = {
+	.init_state = parallel_csi_init_state,
+};
+
+static int parallel_csi_clk_get(struct parallel_csi_device *pcsidev)
+{
+	unsigned int i;
+	int ret = 0;
+
+	for (i = 0; i < PCSIDEV_NUM_CLKS; i++)
+		pcsidev->clks[i].id = parallel_csi_clk_id[i];
+
+	ret = devm_clk_bulk_get(pcsidev->dev, PCSIDEV_NUM_CLKS, pcsidev->clks);
+
+	return ret;
+}
+
+/* ----------------------------------------------------------------------
+ * Suspend/resume
+ */
+static int __maybe_unused parallel_csi_runtime_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct parallel_csi_device *pcsidev = sd_to_parallel_csi_device(sd);
+
+	clk_bulk_disable_unprepare(PCSIDEV_NUM_CLKS, pcsidev->clks);
+
+	return 0;
+}
+
+static int __maybe_unused parallel_csi_runtime_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct parallel_csi_device *pcsidev = sd_to_parallel_csi_device(sd);
+
+	return clk_bulk_prepare_enable(PCSIDEV_NUM_CLKS, pcsidev->clks);
+}
+
+static const struct dev_pm_ops parallel_csi_pm_ops = {
+	RUNTIME_PM_OPS(parallel_csi_runtime_suspend, parallel_csi_runtime_resume, NULL)
+};
+
+static int parallel_csi_subdev_init(struct parallel_csi_device *pcsidev)
+{
+	struct v4l2_subdev *sd = &pcsidev->sd;
+	int ret;
+
+	v4l2_subdev_init(sd, &parallel_csi_subdev_ops);
+
+	sd->internal_ops = &parallel_csi_internal_ops;
+	sd->owner = THIS_MODULE;
+	snprintf(sd->name, sizeof(sd->name), "parallel-%s",
+		 dev_name(pcsidev->dev));
+
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->ctrl_handler = NULL;
+
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->entity.ops = &parallel_csi_entity_ops;
+
+	sd->dev = pcsidev->dev;
+
+	pcsidev->pads[PARALLEL_CSI_PAD_SINK].flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
+	pcsidev->pads[PARALLEL_CSI_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE |
+						       MEDIA_PAD_FL_MUST_CONNECT;
+
+	ret = media_entity_pads_init(&sd->entity, PARALLEL_CSI_PADS_NUM, pcsidev->pads);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		media_entity_cleanup(&sd->entity);
+
+	return ret;
+}
+
+static void parallel_csi_cleanup(void *data)
+{
+	struct parallel_csi_device *pcsidev = data;
+
+	v4l2_subdev_cleanup(&pcsidev->sd);
+	media_entity_cleanup(&pcsidev->sd.entity);
+	v4l2_async_nf_unregister(&pcsidev->notifier);
+	v4l2_async_nf_cleanup(&pcsidev->notifier);
+	v4l2_async_unregister_subdev(&pcsidev->sd);
+}
+
+static int parallel_csi_probe(struct platform_device *pdev)
+{
+	struct parallel_csi_device *pcsidev;
+	struct device *dev = &pdev->dev;
+	int ret = 0;
+
+	pcsidev = devm_kzalloc(dev, sizeof(*pcsidev), GFP_KERNEL);
+	if (!pcsidev)
+		return -ENOMEM;
+
+	pcsidev->dev = dev;
+	platform_set_drvdata(pdev, pcsidev);
+
+	pcsidev->pdata = of_device_get_match_data(dev);
+
+	pcsidev->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pcsidev->regs))
+		return dev_err_probe(dev, PTR_ERR(pcsidev->regs),
+				     "Failed to get regs\n");
+
+	ret = parallel_csi_clk_get(pcsidev);
+	if (ret < 0)
+		return ret;
+
+	ret = parallel_csi_subdev_init(pcsidev);
+	if (ret < 0)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, parallel_csi_cleanup, pcsidev);
+	if (ret)
+		return ret;
+
+	pcsidev->mode = PI_GATE_CLOCK_MODE;
+
+	platform_set_drvdata(pdev, &pcsidev->sd);
+
+	ret = parallel_csi_async_register(pcsidev);
+	if (ret < 0)
+		return ret;
+
+	devm_pm_runtime_enable(dev);
+
+	return 0;
+}
+
+static const struct of_device_id _of_match[] = {
+	{.compatible = "fsl,imx8qxp-pcif", .data = &imx8qxp_pdata },
+	{.compatible = "fsl,imx91-pcif", .data = &imx91_pdata },
+	{.compatible = "fsl,imx93-pcif", .data = &imx93_pdata },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, _of_match);
+
+static struct platform_driver _driver = {
+	.probe = parallel_csi_probe,
+	.driver = {
+		.of_match_table = _of_match,
+		.name = "imx-parallel-csi",
+		.pm = pm_ptr(&parallel_csi_pm_ops),
+	},
+};
+
+module_platform_driver(_driver);
+
+MODULE_DESCRIPTION("i.MX9 Parallel CSI receiver driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1



