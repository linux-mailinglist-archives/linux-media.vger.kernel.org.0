Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2F0297680
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 20:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754416AbgJWSLk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 14:11:40 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:52158 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754368AbgJWSL0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 14:11:26 -0400
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id BA4B73B0054;
        Fri, 23 Oct 2020 17:46:57 +0000 (UTC)
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 5F1F11BF214;
        Fri, 23 Oct 2020 17:46:34 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Yong Deng <yong.deng@magewell.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kevin.lhopital@hotmail.com
Subject: [PATCH 12/14] media: sunxi: Add support for the A83T MIPI CSI-2 controller
Date:   Fri, 23 Oct 2020 19:45:44 +0200
Message-Id: <20201023174546.504028-13-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The A83T supports MIPI CSI-2 with a composite controller, covering both the
protocol logic and the D-PHY implementation. This controller seems to be found
on the A83T only and probably was abandonned since.

This implementation splits the protocol and D-PHY registers and uses the PHY
framework internally. The D-PHY is not registered as a standalone PHY driver
since it cannot be used with any other controller.

There are a few notable points about the controller:
- The initialisation sequence involes writing specific magic init values that
  do not seem to make any particular sense given the concerned register fields.
- Interrupts appear to be hitting regardless of the interrupt mask registers,
  which can cause a serious flood when transmission errors occur.

This work is based on the first version of the driver submitted by
Kévin L'hôpital, which was adapted to mainline from the Allwinner BSP.
This version integrates MIPI CSI-2 support as a standalone V4L2 subdev
instead of merging it in the sun6i-csi driver.

It was tested on a Banana Pi M3 board with an OV8865 sensor in a 4-lane
configuration.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/media/platform/sunxi/Kconfig          |   1 +
 drivers/media/platform/sunxi/Makefile         |   1 +
 .../sunxi/sun8i-a83t-mipi-csi2/Kconfig        |  11 +
 .../sunxi/sun8i-a83t-mipi-csi2/Makefile       |   4 +
 .../sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c    |  92 +++
 .../sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.h    |  39 +
 .../sun8i_a83t_mipi_csi2.c                    | 700 ++++++++++++++++++
 .../sun8i_a83t_mipi_csi2.h                    | 196 +++++
 8 files changed, 1044 insertions(+)
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.h
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.h

diff --git a/drivers/media/platform/sunxi/Kconfig b/drivers/media/platform/sunxi/Kconfig
index 9684e07454ad..db4c07be7e4c 100644
--- a/drivers/media/platform/sunxi/Kconfig
+++ b/drivers/media/platform/sunxi/Kconfig
@@ -3,3 +3,4 @@
 source "drivers/media/platform/sunxi/sun4i-csi/Kconfig"
 source "drivers/media/platform/sunxi/sun6i-csi/Kconfig"
 source "drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig"
+source "drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig"
diff --git a/drivers/media/platform/sunxi/Makefile b/drivers/media/platform/sunxi/Makefile
index 887a7cae8fca..9aa01cb01883 100644
--- a/drivers/media/platform/sunxi/Makefile
+++ b/drivers/media/platform/sunxi/Makefile
@@ -3,5 +3,6 @@
 obj-y		+= sun4i-csi/
 obj-y		+= sun6i-csi/
 obj-y		+= sun6i-mipi-csi2/
+obj-y		+= sun8i-a83t-mipi-csi2/
 obj-y		+= sun8i-di/
 obj-y		+= sun8i-rotate/
diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig
new file mode 100644
index 000000000000..162f5d1dc25f
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_SUN8I_A83T_MIPI_CSI2
+	tristate "Allwinner A83T MIPI CSI-2 Controller and D-PHY Driver"
+	depends on VIDEO_V4L2 && COMMON_CLK
+	depends on ARCH_SUNXI || COMPILE_TEST
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select REGMAP_MMIO
+	select V4L2_FWNODE
+	help
+	   Support for the Allwinner A83T MIPI CSI-2 Controller and D-PHY.
diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Makefile b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Makefile
new file mode 100644
index 000000000000..1427d15a879a
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+sun8i-a83t-mipi-csi2-y += sun8i_a83t_mipi_csi2.o sun8i_a83t_dphy.o
+
+obj-$(CONFIG_VIDEO_SUN8I_A83T_MIPI_CSI2) += sun8i-a83t-mipi-csi2.o
diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
new file mode 100644
index 000000000000..ebb504247956
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2020 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#include <linux/phy/phy.h>
+#include <linux/regmap.h>
+
+#include "sun8i_a83t_dphy.h"
+#include "sun8i_a83t_mipi_csi2.h"
+
+static int sun8i_a83t_dphy_set_mode(struct phy *dphy, enum phy_mode mode,
+				    int submode)
+{
+	if (mode != PHY_MODE_MIPI_DPHY ||
+	    submode != PHY_MIPI_DPHY_SUBMODE_RX)
+		return -EINVAL;
+
+	return 0;
+};
+
+static int sun8i_a83t_dphy_configure(struct phy *dphy,
+				     union phy_configure_opts *opts)
+{
+	struct sun8i_a83t_mipi_csi2_dev *cdev = phy_get_drvdata(dphy);
+	int ret;
+
+	ret = phy_mipi_dphy_config_validate(&opts->mipi_dphy);
+	if (ret)
+		return ret;
+
+	memcpy(&cdev->dphy_config, opts, sizeof(cdev->dphy_config));
+
+	return 0;
+};
+
+static int sun8i_a83t_dphy_power_on(struct phy *dphy)
+{
+	struct sun8i_a83t_mipi_csi2_dev *cdev = phy_get_drvdata(dphy);
+	struct regmap *regmap = cdev->regmap;
+
+	regmap_write(regmap, SUN8I_A83T_DPHY_CTRL_REG,
+		     SUN8I_A83T_DPHY_CTRL_RESET_N |
+		     SUN8I_A83T_DPHY_CTRL_SHUTDOWN_N);
+
+	regmap_write(regmap, SUN8I_A83T_DPHY_ANA0_REG,
+		     SUN8I_A83T_DPHY_ANA0_REXT_EN |
+		     SUN8I_A83T_DPHY_ANA0_RINT(2) |
+		     SUN8I_A83T_DPHY_ANA0_SNK(2));
+
+	return 0;
+};
+
+static int sun8i_a83t_dphy_power_off(struct phy *dphy)
+{
+	struct sun8i_a83t_mipi_csi2_dev *cdev = phy_get_drvdata(dphy);
+	struct regmap *regmap = cdev->regmap;
+
+	regmap_write(regmap, SUN8I_A83T_DPHY_CTRL_REG, 0);
+
+	return 0;
+};
+
+static struct phy_ops sun8i_a83t_dphy_ops = {
+	.set_mode	= sun8i_a83t_dphy_set_mode,
+	.configure	= sun8i_a83t_dphy_configure,
+	.power_on	= sun8i_a83t_dphy_power_on,
+	.power_off	= sun8i_a83t_dphy_power_off,
+};
+
+int sun8i_a83t_dphy_register(struct sun8i_a83t_mipi_csi2_dev *cdev)
+{
+	struct phy_provider *phy_provider;
+
+	cdev->dphy = devm_phy_create(cdev->dev, NULL, &sun8i_a83t_dphy_ops);
+	if (IS_ERR(cdev->dphy)) {
+		dev_err(cdev->dev, "failed to create D-PHY\n");
+		return PTR_ERR(cdev->dphy);
+	}
+
+	phy_set_drvdata(cdev->dphy, cdev);
+
+	phy_provider = devm_of_phy_provider_register(cdev->dev,
+						     of_phy_simple_xlate);
+	if (IS_ERR(phy_provider)) {
+		dev_err(cdev->dev, "failed to register D-PHY provider\n");
+		return PTR_ERR(phy_provider);
+	}
+
+	return 0;
+}
diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.h b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.h
new file mode 100644
index 000000000000..a4ed355e5f6f
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2020 Kévin L'hôpital <kevin.lhopital@bootlin.com>
+ * Copyright 2020 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#ifndef __SUN8I_A83T_DPHY_H__
+#define __SUN8I_A83T_DPHY_H__
+
+#include "sun8i_a83t_mipi_csi2.h"
+
+#define SUN8I_A83T_DPHY_CTRL_REG		0x10
+#define SUN8I_A83T_DPHY_CTRL_INIT_VALUE		0xb8df698e
+#define SUN8I_A83T_DPHY_CTRL_RESET_N		BIT(31)
+#define SUN8I_A83T_DPHY_CTRL_SHUTDOWN_N		BIT(15)
+#define SUN8I_A83T_DPHY_CTRL_DEBUG		BIT(8)
+#define SUN8I_A83T_DPHY_STATUS_REG		0x14
+#define SUN8I_A83T_DPHY_STATUS_CLK_STOP		BIT(10)
+#define SUN8I_A83T_DPHY_STATUS_CLK_ULPS		BIT(9)
+#define SUN8I_A83T_DPHY_STATUS_HSCLK		BIT(8)
+#define SUN8I_A83T_DPHY_STATUS_D3_STOP		BIT(7)
+#define SUN8I_A83T_DPHY_STATUS_D2_STOP		BIT(6)
+#define SUN8I_A83T_DPHY_STATUS_D1_STOP		BIT(5)
+#define SUN8I_A83T_DPHY_STATUS_D0_STOP		BIT(4)
+#define SUN8I_A83T_DPHY_STATUS_D3_ULPS		BIT(3)
+#define SUN8I_A83T_DPHY_STATUS_D2_ULPS		BIT(2)
+#define SUN8I_A83T_DPHY_STATUS_D1_ULPS		BIT(1)
+#define SUN8I_A83T_DPHY_STATUS_D0_ULPS		BIT(0)
+
+#define SUN8I_A83T_DPHY_ANA0_REG		0x30
+#define SUN8I_A83T_DPHY_ANA0_REXT_EN		BIT(31)
+#define SUN8I_A83T_DPHY_ANA0_REXT		BIT(30)
+#define SUN8I_A83T_DPHY_ANA0_RINT(v)		(((v) << 28) & GENMASK(29, 28))
+#define SUN8I_A83T_DPHY_ANA0_SNK(v)		(((v) << 20) & GENMASK(22, 20))
+
+int sun8i_a83t_dphy_register(struct sun8i_a83t_mipi_csi2_dev *cdev);
+
+#endif /* __SUN8I_A83T_DPHY_H__ */
diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
new file mode 100644
index 000000000000..1ff6f5dfd81a
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
@@ -0,0 +1,700 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2020 Kévin L'hôpital <kevin.lhopital@bootlin.com>
+ * Copyright 2020 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#include "sun8i_a83t_dphy.h"
+#include "sun8i_a83t_mipi_csi2.h"
+
+#define MODULE_NAME	"sun8i-a83t-mipi-csi2"
+
+/* Core */
+
+static irqreturn_t sun8i_a83t_mipi_csi2_isr(int irq, void *dev_id)
+{
+	struct sun8i_a83t_mipi_csi2_dev *cdev =
+		(struct sun8i_a83t_mipi_csi2_dev *)dev_id;
+	struct regmap *regmap = cdev->regmap;
+	u32 status;
+
+	WARN_ONCE(1, MODULE_NAME
+		  ": Unsolicited interrupt, an error likely occurred!\n");
+
+	regmap_read(regmap, SUN8I_A83T_MIPI_CSI2_INT_STA0_REG, &status);
+	regmap_write(regmap, SUN8I_A83T_MIPI_CSI2_INT_STA0_REG, status);
+
+	regmap_read(regmap, SUN8I_A83T_MIPI_CSI2_INT_STA1_REG, &status);
+	regmap_write(regmap, SUN8I_A83T_MIPI_CSI2_INT_STA1_REG, status);
+
+	regmap_read(regmap, SUN8I_A83T_MIPI_CSI2_INT_MSK0_REG, &status);
+	regmap_read(regmap, SUN8I_A83T_MIPI_CSI2_INT_MSK1_REG, &status);
+
+	/*
+	 * The interrupt can be used to catch transmission errors.
+	 * However, we currently lack plumbing for reporting that to the
+	 * A31 CSI controller driver.
+	 */
+
+	return IRQ_HANDLED;
+}
+
+static void sun8i_a83t_mipi_csi2_init(struct sun8i_a83t_mipi_csi2_dev *cdev)
+{
+	struct regmap *regmap = cdev->regmap;
+
+	/*
+	 * The Allwinner BSP sets various magic values on a bunch of registers.
+	 * This is apparently a necessary initialization process that will cause
+	 * the capture to fail with unsolicited interrupts hitting if skipped.
+	 *
+	 * Most of the registers are set to proper values later, except for the
+	 * two reserved registers. They are said to hold a "hardware lock"
+	 * value, without more information available.
+	 */
+
+	regmap_write(regmap, SUN8I_A83T_MIPI_CSI2_CTRL_REG, 0);
+	regmap_write(regmap, SUN8I_A83T_MIPI_CSI2_CTRL_REG,
+		     SUN8I_A83T_MIPI_CSI2_CTRL_INIT_VALUE);
+
+	regmap_write(regmap, SUN8I_A83T_MIPI_CSI2_RX_PKT_NUM_REG, 0);
+	regmap_write(regmap, SUN8I_A83T_MIPI_CSI2_RX_PKT_NUM_REG,
+		     SUN8I_A83T_MIPI_CSI2_RX_PKT_NUM_INIT_VALUE);
+
+	regmap_write(regmap, SUN8I_A83T_DPHY_CTRL_REG, 0);
+	regmap_write(regmap, SUN8I_A83T_DPHY_CTRL_REG,
+		     SUN8I_A83T_DPHY_CTRL_INIT_VALUE);
+
+	regmap_write(regmap, SUN8I_A83T_MIPI_CSI2_RSVD1_REG, 0);
+	regmap_write(regmap, SUN8I_A83T_MIPI_CSI2_RSVD1_REG,
+		     SUN8I_A83T_MIPI_CSI2_RSVD1_HW_LOCK_VALUE);
+
+	regmap_write(regmap, SUN8I_A83T_MIPI_CSI2_RSVD2_REG, 0);
+	regmap_write(regmap, SUN8I_A83T_MIPI_CSI2_RSVD2_REG,
+		     SUN8I_A83T_MIPI_CSI2_RSVD2_HW_LOCK_VALUE);
+
+	regmap_write(regmap, SUN8I_A83T_MIPI_CSI2_CFG_REG, 0);
+	regmap_write(regmap, SUN8I_A83T_MIPI_CSI2_CFG_REG,
+		     SUN8I_A83T_MIPI_CSI2_CFG_INIT_VALUE);
+}
+
+static int sun8i_a83t_mipi_csi2_s_power(struct v4l2_subdev *subdev, int on)
+{
+	struct sun8i_a83t_mipi_csi2_video *video =
+		sun8i_a83t_mipi_csi2_subdev_video(subdev);
+	struct sun8i_a83t_mipi_csi2_dev *cdev = sun8i_a83t_mipi_csi2_video_dev(video);
+	int ret;
+
+	if (!on) {
+		clk_disable_unprepare(cdev->clk_mod);
+		clk_disable_unprepare(cdev->clk_mipi);
+		clk_disable_unprepare(cdev->clk_misc);
+		reset_control_assert(cdev->reset);
+
+		return 0;
+	}
+
+	ret = clk_prepare_enable(cdev->clk_mod);
+	if (ret) {
+		dev_err(cdev->dev, "failed to enable module clock\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(cdev->clk_mipi);
+	if (ret) {
+		dev_err(cdev->dev, "failed to enable MIPI clock\n");
+		goto error_clk_mod;
+	}
+
+	ret = clk_prepare_enable(cdev->clk_misc);
+	if (ret) {
+		dev_err(cdev->dev, "failed to enable CSI misc clock\n");
+		goto error_clk_mipi;
+	}
+
+	ret = reset_control_deassert(cdev->reset);
+	if (ret) {
+		dev_err(cdev->dev, "failed to deassert reset\n");
+		goto error_clk_misc;
+	}
+
+	sun8i_a83t_mipi_csi2_init(cdev);
+
+	return 0;
+
+error_clk_misc:
+	clk_disable_unprepare(cdev->clk_misc);
+
+error_clk_mipi:
+	clk_disable_unprepare(cdev->clk_mipi);
+
+error_clk_mod:
+	clk_disable_unprepare(cdev->clk_mod);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_core_ops sun8i_a83t_mipi_csi2_subdev_core_ops = {
+	.s_power	= sun8i_a83t_mipi_csi2_s_power,
+};
+
+/* Video */
+
+static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
+{
+	struct sun8i_a83t_mipi_csi2_video *video =
+		sun8i_a83t_mipi_csi2_subdev_video(subdev);
+	struct sun8i_a83t_mipi_csi2_dev *cdev = sun8i_a83t_mipi_csi2_video_dev(video);
+	struct v4l2_subdev *remote_subdev = video->remote_subdev;
+	struct v4l2_fwnode_bus_mipi_csi2 *bus_mipi_csi2 =
+		&video->endpoint.bus.mipi_csi2;
+	union phy_configure_opts dphy_opts = { 0 };
+	struct phy_configure_opts_mipi_dphy *dphy_cfg = &dphy_opts.mipi_dphy;
+	struct regmap *regmap = cdev->regmap;
+	struct v4l2_ctrl *ctrl;
+	unsigned int lanes_count;
+	unsigned int bpp;
+	unsigned long pixel_rate;
+	u8 data_type = 0;
+	u32 version = 0;
+	/* Initialize to 0 to use both in disable label (ret != 0) and off. */
+	int ret = 0;
+
+	if (!remote_subdev)
+		return -ENODEV;
+
+	if (!on) {
+		v4l2_subdev_call(remote_subdev, video, s_stream, 0);
+
+disable:
+		regmap_update_bits(regmap, SUN8I_A83T_MIPI_CSI2_CFG_REG,
+				   SUN8I_A83T_MIPI_CSI2_CFG_SYNC_EN, 0);
+
+		regmap_write(regmap, SUN8I_A83T_MIPI_CSI2_CTRL_REG, 0);
+
+		phy_power_off(cdev->dphy);
+
+		return ret;
+	}
+
+	switch (video->mbus_code) {
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		data_type = MIPI_CSI2_DATA_TYPE_RAW8;
+		bpp = 8;
+		break;
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		data_type = MIPI_CSI2_DATA_TYPE_RAW10;
+		bpp = 10;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Sensor pixel rate */
+
+	ctrl = v4l2_ctrl_find(remote_subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
+	if (!ctrl) {
+		dev_err(cdev->dev,
+			"%s: no MIPI CSI-2 pixel rate from the sensor\n",
+			__func__);
+		return -ENODEV;
+	}
+
+	pixel_rate = (unsigned long)v4l2_ctrl_g_ctrl_int64(ctrl);
+	if (!pixel_rate) {
+		dev_err(cdev->dev,
+			"%s: zero MIPI CSI-2 pixel rate from the sensor\n",
+			__func__);
+		return -ENODEV;
+	}
+
+	/* D-PHY configuration */
+
+	lanes_count = bus_mipi_csi2->num_data_lanes;
+	phy_mipi_dphy_get_default_config(pixel_rate, bpp, lanes_count,
+					 dphy_cfg);
+
+	/*
+	 * Note that our hardware is using DDR, which is not taken in account by
+	 * phy_mipi_dphy_get_default_config when calculating hs_clk_rate from
+	 * the pixel rate, lanes count and bpp.
+	 *
+	 * The resulting clock rate is basically the symbol rate over the whole
+	 * link. The actual clock rate is calculated with division by two since
+	 * DDR samples both on rising and falling edges.
+	 */
+
+	dev_dbg(cdev->dev, "A83T MIPI CSI-2 config:\n");
+	dev_dbg(cdev->dev,
+		"%ld pixels/s, %u bits/pixel, %u lanes, %lu Hz clock\n",
+		pixel_rate, bpp, lanes_count, dphy_cfg->hs_clk_rate / 2);
+
+	ret = 0;
+	ret |= phy_reset(cdev->dphy);
+	ret |= phy_set_mode_ext(cdev->dphy, PHY_MODE_MIPI_DPHY,
+				PHY_MIPI_DPHY_SUBMODE_RX);
+	ret |= phy_configure(cdev->dphy, &dphy_opts);
+
+	if (ret) {
+		dev_err(cdev->dev, "Failed to setup MIPI D-PHY\n");
+		return ret;
+	}
+
+	ret = phy_power_on(cdev->dphy);
+	if (ret) {
+		dev_err(cdev->dev, "Failed to power on MIPI D-PHY\n");
+		return ret;
+	}
+
+	/* MIPI CSI-2 controller setup */
+
+	regmap_write(regmap, SUN8I_A83T_MIPI_CSI2_CTRL_REG,
+		     SUN8I_A83T_MIPI_CSI2_CTRL_RESET_N);
+
+	regmap_read(regmap, SUN8I_A83T_MIPI_CSI2_VERSION_REG, &version);
+
+	dev_dbg(cdev->dev, "A83T MIPI CSI-2 version: %04x\n", version);
+
+	regmap_write(regmap, SUN8I_A83T_MIPI_CSI2_CFG_REG,
+		     SUN8I_A83T_MIPI_CSI2_CFG_UNPKT_EN |
+		     SUN8I_A83T_MIPI_CSI2_CFG_SYNC_DLY_CYCLE(8) |
+		     SUN8I_A83T_MIPI_CSI2_CFG_N_CHANNEL(1) |
+		     SUN8I_A83T_MIPI_CSI2_CFG_N_LANE(lanes_count));
+
+	regmap_write(regmap, SUN8I_A83T_MIPI_CSI2_VCDT0_REG,
+		     SUN8I_A83T_MIPI_CSI2_VCDT0_CH_VC(3, 3) |
+		     SUN8I_A83T_MIPI_CSI2_VCDT0_CH_VC(2, 2) |
+		     SUN8I_A83T_MIPI_CSI2_VCDT0_CH_VC(1, 1) |
+		     SUN8I_A83T_MIPI_CSI2_VCDT0_CH_VC(0, 0) |
+		     SUN8I_A83T_MIPI_CSI2_VCDT0_CH_DT(0, data_type));
+
+	/* Start streaming. */
+	regmap_update_bits(regmap, SUN8I_A83T_MIPI_CSI2_CFG_REG,
+			   SUN8I_A83T_MIPI_CSI2_CFG_SYNC_EN,
+			   SUN8I_A83T_MIPI_CSI2_CFG_SYNC_EN);
+
+	ret = v4l2_subdev_call(remote_subdev, video, s_stream, 1);
+	if (ret)
+		goto disable;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops sun8i_a83t_mipi_csi2_subdev_video_ops = {
+	.s_stream	= sun8i_a83t_mipi_csi2_s_stream,
+};
+
+/* Pad */
+
+static int sun8i_a83t_mipi_csi2_enum_mbus_code(struct v4l2_subdev *subdev,
+					  struct v4l2_subdev_pad_config *config,
+					  struct v4l2_subdev_mbus_code_enum *code_enum)
+{
+	struct sun8i_a83t_mipi_csi2_video *video =
+		sun8i_a83t_mipi_csi2_subdev_video(subdev);
+
+	if (!video->remote_subdev)
+		return -ENODEV;
+
+	/* Forward to the sensor. */
+	code_enum->pad = video->remote_pad_index;
+
+	return v4l2_subdev_call(video->remote_subdev, pad, enum_mbus_code,
+				config, code_enum);
+}
+
+static int sun8i_a83t_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
+				   struct v4l2_subdev_pad_config *config,
+				   struct v4l2_subdev_format *format)
+{
+	struct sun8i_a83t_mipi_csi2_video *video =
+		sun8i_a83t_mipi_csi2_subdev_video(subdev);
+
+	if (!video->remote_subdev)
+		return -ENODEV;
+
+	/* Forward to the sensor. */
+	format->pad = video->remote_pad_index;
+
+	return v4l2_subdev_call(video->remote_subdev, pad, get_fmt, config,
+				format);
+}
+
+static int sun8i_a83t_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
+				   struct v4l2_subdev_pad_config *config,
+				   struct v4l2_subdev_format *format)
+{
+	struct sun8i_a83t_mipi_csi2_video *video =
+		sun8i_a83t_mipi_csi2_subdev_video(subdev);
+
+	if (!video->remote_subdev)
+		return -ENODEV;
+
+	/* Forward to the sensor. */
+	format->pad = video->remote_pad_index;
+
+	return v4l2_subdev_call(video->remote_subdev, pad, set_fmt, config,
+				format);
+}
+
+static int sun8i_a83t_mipi_csi2_enum_frame_size(struct v4l2_subdev *subdev,
+					   struct v4l2_subdev_pad_config *config,
+					   struct v4l2_subdev_frame_size_enum *size_enum)
+{
+	struct sun8i_a83t_mipi_csi2_video *video =
+		sun8i_a83t_mipi_csi2_subdev_video(subdev);
+
+	if (!video->remote_subdev)
+		return -ENODEV;
+
+	/* Forward to the sensor. */
+	size_enum->pad = video->remote_pad_index;
+
+	return v4l2_subdev_call(video->remote_subdev, pad, enum_frame_size,
+				config, size_enum);
+}
+
+static int sun8i_a83t_mipi_csi2_enum_frame_interval(struct v4l2_subdev *subdev,
+					       struct v4l2_subdev_pad_config *config,
+					       struct v4l2_subdev_frame_interval_enum *interval_enum)
+{
+	struct sun8i_a83t_mipi_csi2_video *video =
+		sun8i_a83t_mipi_csi2_subdev_video(subdev);
+
+	if (!video->remote_subdev)
+		return -ENODEV;
+
+	/* Forward to the sensor. */
+	interval_enum->pad = video->remote_pad_index;
+
+	return v4l2_subdev_call(video->remote_subdev, pad, enum_frame_interval,
+				config, interval_enum);
+}
+
+static const struct v4l2_subdev_pad_ops sun8i_a83t_mipi_csi2_subdev_pad_ops = {
+	.enum_mbus_code		= sun8i_a83t_mipi_csi2_enum_mbus_code,
+	.get_fmt		= sun8i_a83t_mipi_csi2_get_fmt,
+	.set_fmt		= sun8i_a83t_mipi_csi2_set_fmt,
+	.enum_frame_size	= sun8i_a83t_mipi_csi2_enum_frame_size,
+	.enum_frame_interval	= sun8i_a83t_mipi_csi2_enum_frame_interval,
+};
+
+/* Subdev */
+
+static const struct v4l2_subdev_ops sun8i_a83t_mipi_csi2_subdev_ops = {
+	.core		= &sun8i_a83t_mipi_csi2_subdev_core_ops,
+	.video		= &sun8i_a83t_mipi_csi2_subdev_video_ops,
+	.pad		= &sun8i_a83t_mipi_csi2_subdev_pad_ops,
+};
+
+/* Notifier */
+
+static int sun8i_a83t_mipi_csi2_notifier_bound(struct v4l2_async_notifier *notifier,
+					  struct v4l2_subdev *remote_subdev,
+					  struct v4l2_async_subdev *remote_subdev_async)
+{
+	struct v4l2_subdev *subdev = notifier->sd;
+	struct sun8i_a83t_mipi_csi2_video *video =
+		sun8i_a83t_mipi_csi2_subdev_video(subdev);
+	struct sun8i_a83t_mipi_csi2_dev *cdev = sun8i_a83t_mipi_csi2_video_dev(video);
+	int source_pad;
+	int ret;
+
+	source_pad = media_entity_get_fwnode_pad(&remote_subdev->entity,
+						 remote_subdev->fwnode,
+						 MEDIA_PAD_FL_SOURCE);
+	if (source_pad < 0)
+		return source_pad;
+
+	ret = media_create_pad_link(&remote_subdev->entity, source_pad,
+				    &subdev->entity, 0,
+				    MEDIA_LNK_FL_ENABLED |
+				    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret) {
+		dev_err(cdev->dev, "failed to create %s:%u -> %s:%u link\n",
+			remote_subdev->entity.name, source_pad,
+			subdev->entity.name, 0);
+		return ret;
+	}
+
+	video->remote_subdev = remote_subdev;
+	video->remote_pad_index = source_pad;
+
+	return 0;
+}
+
+static const struct v4l2_async_notifier_operations sun8i_a83t_mipi_csi2_notifier_ops = {
+	.bound		= sun8i_a83t_mipi_csi2_notifier_bound,
+};
+
+/* Media Entity */
+
+static int sun8i_a83t_mipi_csi2_link_validate(struct media_link *link)
+{
+	struct v4l2_subdev *subdev =
+		container_of(link->sink->entity, struct v4l2_subdev, entity);
+	struct sun8i_a83t_mipi_csi2_video *video =
+		sun8i_a83t_mipi_csi2_subdev_video(subdev);
+	struct v4l2_subdev *remote_subdev;
+	struct v4l2_subdev_format format = { 0 };
+	int ret;
+
+	if (!is_media_entity_v4l2_subdev(link->source->entity))
+		return -EINVAL;
+
+	remote_subdev = media_entity_to_v4l2_subdev(link->source->entity);
+
+	format.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	format.pad = link->source->index;
+
+	ret = v4l2_subdev_call(remote_subdev, pad, get_fmt, NULL, &format);
+	if (ret)
+		return ret;
+
+	video->mbus_code = format.format.code;
+
+	return 0;
+}
+
+static const struct media_entity_operations sun8i_a83t_mipi_csi2_entity_ops = {
+	.link_validate	= sun8i_a83t_mipi_csi2_link_validate,
+};
+
+/* Base Driver */
+
+static int sun8i_a83t_mipi_csi2_v4l2_setup(struct sun8i_a83t_mipi_csi2_dev *cdev)
+{
+	struct sun8i_a83t_mipi_csi2_video *video = &cdev->video;
+	struct v4l2_subdev *subdev = &video->subdev;
+	struct v4l2_async_notifier *notifier = &video->notifier;
+	struct fwnode_handle *handle;
+	struct v4l2_fwnode_endpoint *endpoint;
+	int ret;
+
+	/* Subdev */
+
+	v4l2_subdev_init(subdev, &sun8i_a83t_mipi_csi2_subdev_ops);
+	subdev->dev = cdev->dev;
+	strscpy(subdev->name, MODULE_NAME, sizeof(subdev->name));
+	v4l2_set_subdevdata(subdev, cdev);
+
+	/* Entity */
+
+	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	subdev->entity.ops = &sun8i_a83t_mipi_csi2_entity_ops;
+
+	/* Pads */
+
+	video->pads[0].flags = MEDIA_PAD_FL_SINK;
+	video->pads[1].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&subdev->entity, 2, video->pads);
+	if (ret)
+		return ret;
+
+	/* Endpoint */
+
+	handle = fwnode_graph_get_endpoint_by_id(dev_fwnode(cdev->dev), 0, 0,
+						 FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!handle)
+		goto error_media_entity;
+
+	endpoint = &video->endpoint;
+	endpoint->bus_type = V4L2_MBUS_CSI2_DPHY;
+
+	ret = v4l2_fwnode_endpoint_parse(handle, endpoint);
+	fwnode_handle_put(handle);
+	if (ret)
+		goto error_media_entity;
+
+	/* Notifier */
+
+	v4l2_async_notifier_init(notifier);
+
+	ret = v4l2_async_notifier_add_fwnode_remote_subdev(notifier, handle,
+							   &video->subdev_async);
+	if (ret)
+		goto error_media_entity;
+
+	video->notifier.ops = &sun8i_a83t_mipi_csi2_notifier_ops;
+
+	ret = v4l2_async_subdev_notifier_register(subdev, notifier);
+	if (ret < 0)
+		goto error_notifier;
+
+	/* Subdev */
+
+	ret = v4l2_async_register_subdev(subdev);
+	if (ret < 0)
+		goto error_notifier_registered;
+
+	return 0;
+
+error_notifier_registered:
+	v4l2_async_notifier_unregister(notifier);
+error_notifier:
+	v4l2_async_notifier_cleanup(notifier);
+error_media_entity:
+	media_entity_cleanup(&subdev->entity);
+
+	return ret;
+}
+
+static int sun8i_a83t_mipi_csi2_v4l2_teardown(struct sun8i_a83t_mipi_csi2_dev *cdev)
+{
+	struct sun8i_a83t_mipi_csi2_video *video = &cdev->video;
+	struct v4l2_subdev *subdev = &video->subdev;
+	struct v4l2_async_notifier *notifier = &video->notifier;
+
+	v4l2_async_unregister_subdev(subdev);
+	v4l2_async_notifier_unregister(notifier);
+	v4l2_async_notifier_cleanup(notifier);
+	media_entity_cleanup(&subdev->entity);
+	v4l2_device_unregister_subdev(subdev);
+
+	return 0;
+}
+
+static const struct regmap_config sun8i_a83t_mipi_csi2_regmap_config = {
+	.reg_bits       = 32,
+	.reg_stride     = 4,
+	.val_bits       = 32,
+	.max_register	= 0x120,
+};
+
+static int sun8i_a83t_mipi_csi2_resource_request(struct sun8i_a83t_mipi_csi2_dev *cdev,
+						 struct platform_device *pdev)
+{
+	struct resource *res;
+	void __iomem *io_base;
+	int irq;
+	int ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	io_base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(io_base))
+		return PTR_ERR(io_base);
+
+	cdev->regmap = devm_regmap_init_mmio_clk(&pdev->dev, "bus", io_base,
+						 &sun8i_a83t_mipi_csi2_regmap_config);
+	if (IS_ERR(cdev->regmap)) {
+		dev_err(&pdev->dev, "failed to init register map\n");
+		return PTR_ERR(cdev->regmap);
+	}
+
+	cdev->clk_mod = devm_clk_get(&pdev->dev, "mod");
+	if (IS_ERR(cdev->clk_mod)) {
+		dev_err(&pdev->dev, "failed to acquire csi clock\n");
+		return PTR_ERR(cdev->clk_mod);
+	}
+
+	cdev->clk_mipi = devm_clk_get(&pdev->dev, "mipi");
+	if (IS_ERR(cdev->clk_mod)) {
+		dev_err(&pdev->dev, "failed to acquire mipi clock\n");
+		return PTR_ERR(cdev->clk_mipi);
+	}
+
+	cdev->clk_misc = devm_clk_get(&pdev->dev, "misc");
+	if (IS_ERR(cdev->clk_mod)) {
+		dev_err(&pdev->dev, "failed to acquire misc clock\n");
+		return PTR_ERR(cdev->clk_misc);
+	}
+
+	cdev->reset = devm_reset_control_get_shared(&pdev->dev, NULL);
+	if (IS_ERR(cdev->reset)) {
+		dev_err(&pdev->dev, "failed to get reset controller\n");
+		return PTR_ERR(cdev->reset);
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return -ENXIO;
+
+	ret = devm_request_irq(&pdev->dev, irq, sun8i_a83t_mipi_csi2_isr, 0,
+			       MODULE_NAME, cdev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to request MIPI CSI-2 IRQ\n");
+		return ret;
+	}
+
+	ret = sun8i_a83t_dphy_register(cdev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to init MIPI D-PHY\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int sun8i_a83t_mipi_csi2_probe(struct platform_device *pdev)
+{
+	struct sun8i_a83t_mipi_csi2_dev *cdev;
+	int ret;
+
+	cdev = devm_kzalloc(&pdev->dev, sizeof(*cdev), GFP_KERNEL);
+	if (!cdev)
+		return -ENOMEM;
+
+	cdev->dev = &pdev->dev;
+
+	ret = sun8i_a83t_mipi_csi2_resource_request(cdev, pdev);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, cdev);
+
+	ret = sun8i_a83t_mipi_csi2_v4l2_setup(cdev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int sun8i_a83t_mipi_csi2_remove(struct platform_device *pdev)
+{
+	struct sun8i_a83t_mipi_csi2_dev *cdev = platform_get_drvdata(pdev);
+
+	phy_exit(cdev->dphy);
+
+	return sun8i_a83t_mipi_csi2_v4l2_teardown(cdev);
+}
+
+static const struct of_device_id sun8i_a83t_mipi_csi2_of_match[] = {
+	{ .compatible = "allwinner,sun8i-a83t-mipi-csi2" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, sun8i_a83t_mipi_csi2_of_match);
+
+static struct platform_driver sun8i_a83t_mipi_csi2_platform_driver = {
+	.probe = sun8i_a83t_mipi_csi2_probe,
+	.remove = sun8i_a83t_mipi_csi2_remove,
+	.driver = {
+		.name = MODULE_NAME,
+		.of_match_table = of_match_ptr(sun8i_a83t_mipi_csi2_of_match),
+	},
+};
+module_platform_driver(sun8i_a83t_mipi_csi2_platform_driver);
+
+MODULE_DESCRIPTION("Allwinner A83T MIPI CSI-2 and D-PHY Controller Driver");
+MODULE_AUTHOR("Paul Kocialkowski <paul.kocialkowski@bootlin.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.h b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.h
new file mode 100644
index 000000000000..f256c796d07c
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.h
@@ -0,0 +1,196 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2020 Kévin L'hôpital <kevin.lhopital@bootlin.com>
+ * Copyright 2020 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#ifndef __SUN8I_A83T_MIPI_CSI2_H__
+#define __SUN8I_A83T_MIPI_CSI2_H__
+
+#include <linux/phy/phy.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#define SUN8I_A83T_MIPI_CSI2_VERSION_REG			0x0
+#define SUN8I_A83T_MIPI_CSI2_CTRL_REG				0x4
+#define SUN8I_A83T_MIPI_CSI2_CTRL_INIT_VALUE			0xb8c39bec
+#define SUN8I_A83T_MIPI_CSI2_CTRL_RESET_N			BIT(31)
+#define SUN8I_A83T_MIPI_CSI2_RX_PKT_NUM_REG			0x8
+#define SUN8I_A83T_MIPI_CSI2_RX_PKT_NUM_INIT_VALUE		0xb8d257f8
+#define SUN8I_A83T_MIPI_CSI2_RSVD0_REG				0xc
+
+#define SUN8I_A83T_MIPI_CSI2_RSVD1_REG				0x18
+#define SUN8I_A83T_MIPI_CSI2_RSVD1_HW_LOCK_VALUE		0xb8c8a30c
+#define SUN8I_A83T_MIPI_CSI2_RSVD2_REG				0x1c
+#define SUN8I_A83T_MIPI_CSI2_RSVD2_HW_LOCK_VALUE		0xb8df8ad7
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_REG			0x20
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_ECC_ERR_DBL		BIT(28)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_LINE_CKSM_ERR_VC3		BIT(27)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_LINE_CKSM_ERR_VC2		BIT(26)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_LINE_CKSM_ERR_VC1		BIT(25)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_LINE_CKSM_ERR_VC0		BIT(24)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_LINE_SEQ_ERR_DT3		BIT(23)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_LINE_SEQ_ERR_DT2		BIT(22)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_LINE_SEQ_ERR_DT1		BIT(21)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_LINE_SEQ_ERR_DT0		BIT(20)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_LS_LE_ERR_DT3		BIT(19)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_LS_LE_ERR_DT2		BIT(18)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_LS_LE_ERR_DT1		BIT(17)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_LS_LE_ERR_DT0		BIT(16)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_CRC_ERR_VC3		BIT(15)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_CRC_ERR_VC2		BIT(14)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_CRC_ERR_VC1		BIT(13)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_CRC_ERR_VC0		BIT(12)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_FRM_SEQ_ERR_VC3		BIT(11)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_FRM_SEQ_ERR_VC2		BIT(10)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_FRM_SEQ_ERR_VC1		BIT(9)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_FRM_SEQ_ERR_VC0		BIT(8)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_FS_FE_ERR_VC3		BIT(7)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_FS_FE_ERR_VC2		BIT(6)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_FS_FE_ERR_VC1		BIT(5)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_FS_FE_ERR_VC0		BIT(4)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_SOT_SYNC_ERR_3		BIT(3)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_SOT_SYNC_ERR_2		BIT(2)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_SOT_SYNC_ERR_1		BIT(1)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA0_SOT_SYNC_ERR_0		BIT(0)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_REG			0x24
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_LINE_SEQ_ERR_DT7		BIT(23)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_LINE_SEQ_ERR_DT6		BIT(22)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_LINE_SEQ_ERR_DT5		BIT(21)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_LINE_SEQ_ERR_DT4		BIT(20)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_LS_LE_ERR_DT7		BIT(19)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_LS_LE_ERR_DT6		BIT(18)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_LS_LE_ERR_DT5		BIT(17)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_LS_LE_ERR_DT4		BIT(16)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_DT_ERR_VC3		BIT(15)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_DT_ERR_VC2		BIT(14)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_DT_ERR_VC1		BIT(13)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_DT_ERR_VC0		BIT(12)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_ECC_ERR1_VC3		BIT(11)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_ECC_ERR1_VC2		BIT(10)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_ECC_ERR1_VC1		BIT(9)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_ECC_ERR1_VC0		BIT(8)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_SOT_ERR_3			BIT(7)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_SOT_ERR_2			BIT(6)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_SOT_ERR_1			BIT(5)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_SOT_ERR_0			BIT(4)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_ESC_ENTRY_ERR_3		BIT(3)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_ESC_ENTRY_ERR_2		BIT(2)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_ESC_ENTRY_ERR_1		BIT(1)
+#define SUN8I_A83T_MIPI_CSI2_INT_STA1_ESC_ENTRY_ERR_0		BIT(0)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_REG			0x28
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_ECC_ERR_DBL		BIT(28)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_CKSM_ERR_VC3		BIT(27)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_CKSM_ERR_VC2		BIT(26)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_CKSM_ERR_VC1		BIT(25)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_CKSM_ERR_VC0		BIT(24)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_LINE_SEQ_ERR_DT3		BIT(23)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_LINE_SEQ_ERR_DT2		BIT(22)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_LINE_SEQ_ERR_DT1		BIT(21)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_LINE_SEQ_ERR_DT0		BIT(20)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_LS_LE_ERR_DT3		BIT(19)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_LS_LE_ERR_DT2		BIT(18)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_LS_LE_ERR_DT1		BIT(17)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_LS_LE_ERR_DT0		BIT(16)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_CRC_ERR_VC3		BIT(15)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_CRC_ERR_VC2		BIT(14)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_CRC_ERR_VC1		BIT(13)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_CRC_ERR_VC0		BIT(12)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_FRM_SEQ_ERR_VC3		BIT(11)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_FRM_SEQ_ERR_VC2		BIT(10)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_FRM_SEQ_ERR_VC1		BIT(9)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_FRM_SEQ_ERR_VC0		BIT(8)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_FS_FE_ERR_VC3		BIT(7)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_FS_FE_ERR_VC2		BIT(6)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_FS_FE_ERR_VC1		BIT(5)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_FS_FE_ERR_VC0		BIT(4)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_SOT_SYNC_ERR_3		BIT(3)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_SOT_SYNC_ERR_2		BIT(2)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_SOT_SYNC_ERR_1		BIT(1)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK0_SOT_SYNC_ERR_0		BIT(0)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK1_REG			0x2c
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK1_DT_ERR_VC3		BIT(15)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK1_DT_ERR_VC2		BIT(14)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK1_DT_ERR_VC1		BIT(13)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK1_DT_ERR_VC0		BIT(12)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK1_ECC_ERR1_VC3		BIT(11)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK1_ECC_ERR1_VC2		BIT(10)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK1_ECC_ERR1_VC1		BIT(9)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK1_ECC_ERR1_VC0		BIT(8)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK1_SOT_ERR_3			BIT(7)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK1_SOT_ERR_2			BIT(6)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK1_SOT_ERR_1			BIT(5)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK1_SOT_ERR_0			BIT(4)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK1_ESC_ENTRY_ERR_3		BIT(3)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK1_ESC_ENTRY_ERR_2		BIT(2)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK1_ESC_ENTRY_ERR_1		BIT(1)
+#define SUN8I_A83T_MIPI_CSI2_INT_MSK1_ESC_ENTRY_ERR_0		BIT(0)
+
+#define SUN8I_A83T_MIPI_CSI2_CFG_REG				0x100
+#define SUN8I_A83T_MIPI_CSI2_CFG_INIT_VALUE			0xb8c64f24
+#define SUN8I_A83T_MIPI_CSI2_CFG_SYNC_EN			BIT(31)
+#define SUN8I_A83T_MIPI_CSI2_CFG_BYPASS_ECC_EN			BIT(29)
+#define SUN8I_A83T_MIPI_CSI2_CFG_UNPKT_EN			BIT(28)
+#define SUN8I_A83T_MIPI_CSI2_CFG_NONE_UNPKT_RX_MODE		BIT(27)
+#define SUN8I_A83T_MIPI_CSI2_CFG_YC_SWAB			BIT(26)
+#define SUN8I_A83T_MIPI_CSI2_CFG_N_BYTE				BIT(24)
+#define SUN8I_A83T_MIPI_CSI2_CFG_SYNC_DLY_CYCLE(v)		(((v) << 18) & \
+								 GENMASK(22, 18))
+#define SUN8I_A83T_MIPI_CSI2_CFG_N_CHANNEL(v)			((((v) - 1) << 16) & \
+								 GENMASK(17, 16))
+#define SUN8I_A83T_MIPI_CSI2_CFG_N_LANE(v)			((((v) - 1) << 4) & \
+								 GENMASK(5, 4))
+#define SUN8I_A83T_MIPI_CSI2_VCDT0_REG				0x104
+#define SUN8I_A83T_MIPI_CSI2_VCDT0_CH_VC(ch, vc)		(((vc) & GENMASK(1, 0)) << \
+								 ((ch) * 8 + 6))
+#define SUN8I_A83T_MIPI_CSI2_VCDT0_CH_DT(ch, t)			(((t) & GENMASK(5, 0)) << \
+								 ((ch) * 8))
+#define SUN8I_A83T_MIPI_CSI2_VCDT1_REG				0x108
+#define SUN8I_A83T_MIPI_CSI2_VCDT1_CH_VC(ch, vc)		(((vc) & GENMASK(1, 0)) << \
+								 (((ch) - 4) * 8 + 6))
+#define SUN8I_A83T_MIPI_CSI2_VCDT1_CH_DT(ch, t)			(((t) & GENMASK(5, 0)) << \
+								 (((ch) - 4) * 8))
+
+enum mipi_csi2_data_type {
+	MIPI_CSI2_DATA_TYPE_RAW8	= 0x2a,
+	MIPI_CSI2_DATA_TYPE_RAW10	= 0x2b,
+	MIPI_CSI2_DATA_TYPE_RAW12	= 0x2c,
+};
+
+struct sun8i_a83t_mipi_csi2_video {
+	struct v4l2_fwnode_endpoint endpoint;
+	struct v4l2_subdev subdev;
+	struct media_pad pads[2];
+
+	struct v4l2_async_subdev subdev_async;
+	struct v4l2_async_notifier notifier;
+
+	struct v4l2_subdev *remote_subdev;
+	u32 remote_pad_index;
+	u32 mbus_code;
+};
+
+struct sun8i_a83t_mipi_csi2_dev {
+	struct device *dev;
+
+	struct regmap *regmap;
+	struct clk *clk_mod;
+	struct clk *clk_mipi;
+	struct clk *clk_misc;
+	struct reset_control *reset;
+	struct phy *dphy;
+	struct phy_configure_opts_mipi_dphy dphy_config;
+
+	struct sun8i_a83t_mipi_csi2_video video;
+};
+
+#define sun8i_a83t_mipi_csi2_subdev_video(subdev) \
+	container_of(subdev, struct sun8i_a83t_mipi_csi2_video, subdev)
+
+#define sun8i_a83t_mipi_csi2_video_dev(video) \
+	container_of(video, struct sun8i_a83t_mipi_csi2_dev, video)
+
+#endif /* __SUN8I_A83T_MIPI_CSI2_H__ */
-- 
2.28.0

