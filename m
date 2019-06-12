Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5884042116
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 11:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437586AbfFLJjX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 05:39:23 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33943 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437578AbfFLJjX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 05:39:23 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1haziz-00053v-FH; Wed, 12 Jun 2019 11:39:21 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH v5 09/10] media: hantro: add initial i.MX8MQ support
Date:   Wed, 12 Jun 2019 11:39:14 +0200
Message-Id: <20190612093915.18973-10-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612093915.18973-1-p.zabel@pengutronix.de>
References: <20190612093915.18973-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For now this just enables MPEG-2 decoding on the Hantro G1 on i.MX8MQ.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
--
Changes since v4 [1]:
 - Fix duplicated num_irqs initializer

[1] https://patchwork.linuxtv.org/patch/56802/
---
 drivers/staging/media/hantro/Kconfig        |  16 +-
 drivers/staging/media/hantro/Makefile       |   3 +
 drivers/staging/media/hantro/hantro_drv.c   |   3 +
 drivers/staging/media/hantro/hantro_hw.h    |   1 +
 drivers/staging/media/hantro/imx8m_vpu_hw.c | 171 ++++++++++++++++++++
 5 files changed, 190 insertions(+), 4 deletions(-)
 create mode 100644 drivers/staging/media/hantro/imx8m_vpu_hw.c

diff --git a/drivers/staging/media/hantro/Kconfig b/drivers/staging/media/hantro/Kconfig
index be133bbaa68a..e0627ce454fc 100644
--- a/drivers/staging/media/hantro/Kconfig
+++ b/drivers/staging/media/hantro/Kconfig
@@ -1,19 +1,27 @@
 # SPDX-License-Identifier: GPL-2.0
 config VIDEO_HANTRO
 	tristate "Hantro VPU driver"
-	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	depends on ARCH_MXC || ARCH_ROCKCHIP || COMPILE_TEST
 	depends on VIDEO_DEV && VIDEO_V4L2 && MEDIA_CONTROLLER
 	depends on MEDIA_CONTROLLER_REQUEST_API
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_VMALLOC
 	select V4L2_MEM2MEM_DEV
 	help
-	  Support for the Hantro IP based Video Processing Unit present on
-	  Rockchip SoC, which accelerates video and image encoding and
-	  decoding.
+	  Support for the Hantro IP based Video Processing Units present on
+	  Rockchip and NXP i.MX8M SoCs, which accelerate video and image
+	  encoding and decoding.
 	  To compile this driver as a module, choose M here: the module
 	  will be called hantro-vpu.
 
+config VIDEO_HANTRO_IMX8M
+	bool "Hantro VPU i.MX8M support"
+	depends on VIDEO_HANTRO
+	depends on ARCH_MXC || COMPILE_TEST
+	default y
+	help
+	  Enable support for i.MX8M SoCs.
+
 config VIDEO_HANTRO_ROCKCHIP
 	bool "Hantro VPU Rockchip support"
 	depends on VIDEO_HANTRO
diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
index 1584acdbf4a3..b63dbccece75 100644
--- a/drivers/staging/media/hantro/Makefile
+++ b/drivers/staging/media/hantro/Makefile
@@ -10,6 +10,9 @@ hantro-vpu-y += \
 		hantro_jpeg.o \
 		hantro_mpeg2.o
 
+hantro-vpu-$(CONFIG_VIDEO_HANTRO_IMX8M) += \
+		imx8m_vpu_hw.o
+
 hantro-vpu-$(CONFIG_VIDEO_HANTRO_ROCKCHIP) += \
 		rk3288_vpu_hw.o \
 		rk3399_vpu_hw.o
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 1d3af881d088..8049fd9ce07a 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -418,6 +418,9 @@ static const struct of_device_id of_hantro_match[] = {
 #ifdef CONFIG_VIDEO_HANTRO_ROCKCHIP
 	{ .compatible = "rockchip,rk3399-vpu", .data = &rk3399_vpu_variant, },
 	{ .compatible = "rockchip,rk3288-vpu", .data = &rk3288_vpu_variant, },
+#endif
+#ifdef CONFIG_VIDEO_HANTRO_IMX8M
+	{ .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
 #endif
 	{ /* sentinel */ }
 };
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 3c361c2e9b88..fd6ad017a1cf 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -81,6 +81,7 @@ enum hantro_enc_fmt {
 extern const struct hantro_variant rk3399_vpu_variant;
 extern const struct hantro_variant rk3328_vpu_variant;
 extern const struct hantro_variant rk3288_vpu_variant;
+extern const struct hantro_variant imx8mq_vpu_variant;
 
 void hantro_watchdog(struct work_struct *work);
 void hantro_run(struct hantro_ctx *ctx);
diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
new file mode 100644
index 000000000000..7377e8c7c6eb
--- /dev/null
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hantro VPU codec driver
+ *
+ * Copyright (C) 2019 Pengutronix, Philipp Zabel <kernel@pengutronix.de>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+
+#include "hantro.h"
+#include "hantro_jpeg.h"
+#include "hantro_g1_regs.h"
+
+#define CTRL_SOFT_RESET		0x00
+#define RESET_G1		BIT(1)
+#define RESET_G2		BIT(0)
+
+#define CTRL_CLOCK_ENABLE	0x04
+#define CLOCK_G1		BIT(1)
+#define CLOCK_G2		BIT(0)
+
+#define CTRL_G1_DEC_FUSE	0x08
+#define CTRL_G1_PP_FUSE		0x0c
+#define CTRL_G2_DEC_FUSE	0x10
+
+static void imx8m_soft_reset(struct hantro_dev *vpu, u32 reset_bits)
+{
+	u32 val;
+
+	/* Assert */
+	val = readl(vpu->ctrl_base + CTRL_SOFT_RESET);
+	val &= ~reset_bits;
+	writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
+
+	udelay(2);
+
+	/* Release */
+	val = readl(vpu->ctrl_base + CTRL_SOFT_RESET);
+	val |= reset_bits;
+	writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
+}
+
+static void imx8m_clk_enable(struct hantro_dev *vpu, u32 clock_bits)
+{
+	u32 val;
+
+	val = readl(vpu->ctrl_base + CTRL_CLOCK_ENABLE);
+	val |= clock_bits;
+	writel(val, vpu->ctrl_base + CTRL_CLOCK_ENABLE);
+}
+
+static int imx8mq_runtime_resume(struct hantro_dev *vpu)
+{
+	int ret;
+
+	ret = clk_bulk_prepare_enable(vpu->variant->num_clocks, vpu->clocks);
+	if (ret) {
+		dev_err(vpu->dev, "Failed to enable clocks\n");
+		return ret;
+	}
+
+	imx8m_soft_reset(vpu, RESET_G1 | RESET_G2);
+	imx8m_clk_enable(vpu, CLOCK_G1 | CLOCK_G2);
+
+	/* Set values of the fuse registers */
+	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_DEC_FUSE);
+	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_PP_FUSE);
+	writel(0xffffffff, vpu->ctrl_base + CTRL_G2_DEC_FUSE);
+
+	clk_bulk_disable_unprepare(vpu->variant->num_clocks, vpu->clocks);
+
+	return 0;
+}
+
+/*
+ * Supported formats.
+ */
+
+static const struct hantro_fmt imx8m_vpu_dec_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.codec_mode = HANTRO_MODE_NONE,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
+		.codec_mode = HANTRO_MODE_MPEG2_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = 48,
+			.max_width = 1920,
+			.step_width = MPEG2_MB_DIM,
+			.min_height = 48,
+			.max_height = 1088,
+			.step_height = MPEG2_MB_DIM,
+		},
+	},
+};
+
+static irqreturn_t imx8m_vpu_g1_irq(int irq, void *dev_id)
+{
+	struct hantro_dev *vpu = dev_id;
+	enum vb2_buffer_state state;
+	u32 status;
+
+	status = vdpu_read(vpu, G1_REG_INTERRUPT);
+	state = (status & G1_REG_INTERRUPT_DEC_RDY_INT) ?
+		 VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
+
+	vdpu_write(vpu, 0, G1_REG_INTERRUPT);
+	vdpu_write(vpu, G1_REG_CONFIG_DEC_CLK_GATE_E, G1_REG_CONFIG);
+
+	hantro_irq_done(vpu, 0, state);
+
+	return IRQ_HANDLED;
+}
+
+static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
+{
+	vpu->dec_base = vpu->reg_bases[0];
+	vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
+
+	return 0;
+}
+
+static void imx8m_vpu_g1_reset(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+
+	imx8m_soft_reset(vpu, RESET_G1);
+}
+
+/*
+ * Supported codec ops.
+ */
+
+static const struct hantro_codec_ops imx8mq_vpu_codec_ops[] = {
+	[HANTRO_MODE_MPEG2_DEC] = {
+		.run = hantro_g1_mpeg2_dec_run,
+		.reset = imx8m_vpu_g1_reset,
+		.init = hantro_mpeg2_dec_init,
+		.exit = hantro_mpeg2_dec_exit,
+	},
+};
+
+/*
+ * VPU variants.
+ */
+
+static const struct hantro_irq imx8mq_irqs[] = {
+	{ "g1", imx8m_vpu_g1_irq },
+	{ "g2", NULL /* TODO: imx8m_vpu_g2_irq */ },
+};
+
+static const char * const imx8mq_clk_names[] = { "g1", "g2", "bus" };
+static const char * const imx8mq_reg_names[] = { "g1", "g2", "ctrl" };
+
+const struct hantro_variant imx8mq_vpu_variant = {
+	.dec_fmts = imx8m_vpu_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_dec_fmts),
+	.codec = HANTRO_MPEG2_DECODER,
+	.codec_ops = imx8mq_vpu_codec_ops,
+	.init = imx8mq_vpu_hw_init,
+	.runtime_resume = imx8mq_runtime_resume,
+	.irqs = imx8mq_irqs,
+	.num_irqs = ARRAY_SIZE(imx8mq_irqs),
+	.clk_names = imx8mq_clk_names,
+	.num_clocks = ARRAY_SIZE(imx8mq_clk_names),
+	.reg_names = imx8mq_reg_names,
+	.num_regs = ARRAY_SIZE(imx8mq_reg_names)
+};
-- 
2.20.1

