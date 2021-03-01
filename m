Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9531328243
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 16:19:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237175AbhCAPT0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 10:19:26 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60464 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237154AbhCAPSv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 10:18:51 -0500
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:39a1:f0e7:a696:18c8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9CD811F44E73;
        Mon,  1 Mar 2021 15:18:08 +0000 (GMT)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, ezequiel@collabora.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        kernel@collabora.com, benjamin.gaignard@collabora.com
Subject: [PATCH v3 3/5] reset: Add reset driver for IMX8MQ VPU block
Date:   Mon,  1 Mar 2021 16:17:52 +0100
Message-Id: <20210301151754.104749-4-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210301151754.104749-1-benjamin.gaignard@collabora.com>
References: <20210301151754.104749-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

IMX8MQ SoC got a dedicated hardware block to reset the video processor
units (G1 and G2).

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/reset/Kconfig            |   8 ++
 drivers/reset/Makefile           |   1 +
 drivers/reset/reset-imx8mq-vpu.c | 169 +++++++++++++++++++++++++++++++
 3 files changed, 178 insertions(+)
 create mode 100644 drivers/reset/reset-imx8mq-vpu.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 71ab75a46491..fa95380b271a 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -80,6 +80,14 @@ config RESET_IMX7
 	help
 	  This enables the reset controller driver for i.MX7 SoCs.
 
+config RESET_VPU_IMX8MQ
+	tristate "i.MX8MQ VPU Reset Driver"
+	depends on HAS_IOMEM
+	depends on (ARM64 && ARCH_MXC) || COMPILE_TEST
+	select MFD_SYSCON
+	help
+	  This enables the VPU reset controller driver for i.MX8MQ SoCs.
+
 config RESET_INTEL_GW
 	bool "Intel Reset Controller Driver"
 	depends on OF && HAS_IOMEM
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 1054123fd187..6007e0cdfc05 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_RESET_BRCMSTB) += reset-brcmstb.o
 obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
 obj-$(CONFIG_RESET_HSDK) += reset-hsdk.o
 obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
+obj-$(CONFIG_RESET_VPU_IMX8MQ) += reset-imx8mq-vpu.o
 obj-$(CONFIG_RESET_INTEL_GW) += reset-intel-gw.o
 obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
 obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
diff --git a/drivers/reset/reset-imx8mq-vpu.c b/drivers/reset/reset-imx8mq-vpu.c
new file mode 100644
index 000000000000..14c589f19266
--- /dev/null
+++ b/drivers/reset/reset-imx8mq-vpu.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021, Collabora
+ *
+ * i.MX8MQ VPU Reset Controller driver
+ *
+ * Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <linux/regmap.h>
+#include <dt-bindings/reset/imx8mq-vpu-reset.h>
+
+#define CTRL_SOFT_RESET		0x00
+#define RESET_G1		((u32)BIT(1))
+#define RESET_G2		((u32)BIT(0))
+
+#define CTRL_ENABLE		0x04
+#define ENABLE_G1		BIT(1)
+#define ENABLE_G2		BIT(0)
+
+#define CTRL_G1_DEC_FUSE	0x08
+#define CTRL_G1_PP_FUSE		0x0c
+#define CTRL_G2_DEC_FUSE	0x10
+
+struct imx8mq_vpu_reset {
+	struct reset_controller_dev rcdev;
+	struct regmap *regmap;
+	struct clk_bulk_data *clocks;
+	int num_clocks;
+	struct device *dev;
+};
+
+static inline struct imx8mq_vpu_reset *to_imx8mq_vpu_reset(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct imx8mq_vpu_reset, rcdev);
+}
+
+static int imx8mq_vpu_reset_assert(struct reset_controller_dev *rcdev,
+				   unsigned long id)
+{
+	struct imx8mq_vpu_reset *reset = to_imx8mq_vpu_reset(rcdev);
+	int ret = -EINVAL;
+
+	ret = clk_bulk_prepare_enable(reset->num_clocks, reset->clocks);
+	if (ret) {
+		dev_err(reset->dev, "Failed to prepare clocks\n");
+		return ret;
+	}
+
+	switch (id) {
+	case IMX8MQ_RESET_VPU_RESET_G1:
+		ret = regmap_update_bits(reset->regmap, CTRL_SOFT_RESET, RESET_G1, ~RESET_G1);
+		ret |= regmap_update_bits(reset->regmap, CTRL_ENABLE, ENABLE_G1, ENABLE_G1);
+		break;
+	case IMX8MQ_RESET_VPU_RESET_G2:
+		ret = regmap_update_bits(reset->regmap, CTRL_SOFT_RESET, RESET_G2, ~RESET_G2);
+		ret |= regmap_update_bits(reset->regmap, CTRL_ENABLE, ENABLE_G2, ENABLE_G2);
+		break;
+	}
+
+	/* Set values of the fuse registers */
+	ret |= regmap_write(reset->regmap, CTRL_G1_DEC_FUSE, 0xffffffff);
+	ret |= regmap_write(reset->regmap, CTRL_G1_PP_FUSE, 0xffffffff);
+	ret |= regmap_write(reset->regmap, CTRL_G2_DEC_FUSE, 0xffffffff);
+
+	clk_bulk_disable_unprepare(reset->num_clocks, reset->clocks);
+
+	return ret;
+}
+
+static int imx8mq_vpu_reset_deassert(struct reset_controller_dev *rcdev,
+				     unsigned long id)
+{
+	struct imx8mq_vpu_reset *reset = to_imx8mq_vpu_reset(rcdev);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(reset->num_clocks, reset->clocks);
+	if (ret) {
+		dev_err(reset->dev, "Failed to prepare clocks\n");
+		return ret;
+	}
+
+	switch (id) {
+	case IMX8MQ_RESET_VPU_RESET_G1:
+		return regmap_update_bits(reset->regmap, CTRL_SOFT_RESET, RESET_G1, RESET_G1);
+	case IMX8MQ_RESET_VPU_RESET_G2:
+		return regmap_update_bits(reset->regmap, CTRL_SOFT_RESET, RESET_G2, RESET_G2);
+	}
+
+	clk_bulk_disable_unprepare(reset->num_clocks, reset->clocks);
+
+	return -EINVAL;
+}
+
+static int imx8mq_vpu_reset_dev(struct reset_controller_dev *rcdev,
+				unsigned long id)
+{
+	int ret;
+
+	ret = imx8mq_vpu_reset_assert(rcdev, id);
+	if (ret)
+		return ret;
+
+	udelay(2);
+
+	return imx8mq_vpu_reset_deassert(rcdev, id);
+}
+
+static const struct reset_control_ops imx8mq_vpu_reset_ops = {
+	.reset		= imx8mq_vpu_reset_dev,
+	.assert		= imx8mq_vpu_reset_assert,
+	.deassert	= imx8mq_vpu_reset_deassert,
+};
+
+static int imx8mq_vpu_reset_probe(struct platform_device *pdev)
+{
+	struct imx8mq_vpu_reset *reset;
+	struct device *dev = &pdev->dev;
+	struct regmap_config config = { .name = "vpu-reset" };
+
+	reset = devm_kzalloc(dev, sizeof(*reset), GFP_KERNEL);
+	if (!reset)
+		return -ENOMEM;
+
+	reset->regmap = device_node_to_regmap(dev->of_node);
+	if (IS_ERR(reset->regmap)) {
+		dev_err(dev, "Unable to get imx8mq-vpu-reset regmap");
+		return PTR_ERR(reset->regmap);
+	}
+	regmap_attach_dev(dev, reset->regmap, &config);
+
+	reset->num_clocks = devm_clk_bulk_get_all(dev, &reset->clocks);
+	if (!reset->num_clocks)
+		return -EINVAL;
+
+	reset->rcdev.owner     = THIS_MODULE;
+	reset->rcdev.nr_resets = 2;
+	reset->rcdev.ops       = &imx8mq_vpu_reset_ops;
+	reset->rcdev.of_node   = dev->of_node;
+	reset->dev = dev;
+
+	return devm_reset_controller_register(dev, &reset->rcdev);
+}
+
+static const struct of_device_id imx8mq_vpu_reset_dt_ids[] = {
+	{ .compatible = "fsl,imx8mq-vpu-reset",},
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, imx8mq_vpu_reset_dt_ids);
+
+static struct platform_driver imx8mq_vpu_reset_driver = {
+	.probe	= imx8mq_vpu_reset_probe,
+	.driver = {
+		.name		= KBUILD_MODNAME,
+		.of_match_table	= imx8mq_vpu_reset_dt_ids,
+	},
+};
+module_platform_driver(imx8mq_vpu_reset_driver);
+
+MODULE_AUTHOR("Benjamin Gaignard <benjamin.gaignard@collabora.com>");
+MODULE_DESCRIPTION("NXP i.MX8MQ VPU reset driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

