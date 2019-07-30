Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4EE7B24D
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2019 20:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388291AbfG3SpC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jul 2019 14:45:02 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42702 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729968AbfG3SpB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jul 2019 14:45:01 -0400
Received: from floko.floko.floko (unknown [IPv6:2804:431:c7f1:ce2f:ec1:e6e6:2e9f:e76e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5215228B914;
        Tue, 30 Jul 2019 19:44:54 +0100 (BST)
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-rockchip@lists.infradead.org
Cc:     devicetree@vger.kernel.org, eddie.cai.linux@gmail.com,
        mchehab@kernel.org, heiko@sntech.de, jacob2.chen@rock-chips.com,
        jeffy.chen@rock-chips.com, zyc@rock-chips.com,
        linux-kernel@vger.kernel.org, tfiga@chromium.org,
        hans.verkuil@cisco.com, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com, kernel@collabora.com,
        ezequiel@collabora.com, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, zhengsq@rock-chips.com,
        Helen Koike <helen.koike@collabora.com>
Subject: [PATCH v8 04/14] media: rkisp1: add Rockchip MIPI Synopsys DPHY driver
Date:   Tue, 30 Jul 2019 15:42:46 -0300
Message-Id: <20190730184256.30338-5-helen.koike@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190730184256.30338-1-helen.koike@collabora.com>
References: <20190730184256.30338-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacob Chen <jacob2.chen@rock-chips.com>

This commit adds a subdev driver for Rockchip MIPI Synopsys DPHY driver

Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
Signed-off-by: Tomasz Figa <tfiga@chromium.org>
[migrate to phy framework]
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
[update for upstream]
Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

Changes in v8:
- Remove boiler plate license text

Changes in v7:
- Migrate dphy specific code from
drivers/media/platform/rockchip/isp1/mipi_dphy_sy.c
to drivers/phy/rockchip/phy-rockchip-dphy.c
- Drop support for rk3288
- Drop support for dphy txrx
- code styling and checkpatch fixes

 drivers/phy/rockchip/Kconfig             |   8 +
 drivers/phy/rockchip/Makefile            |   1 +
 drivers/phy/rockchip/phy-rockchip-dphy.c | 408 +++++++++++++++++++++++
 3 files changed, 417 insertions(+)
 create mode 100644 drivers/phy/rockchip/phy-rockchip-dphy.c

diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
index c454c90cd99e..afd072f135e6 100644
--- a/drivers/phy/rockchip/Kconfig
+++ b/drivers/phy/rockchip/Kconfig
@@ -9,6 +9,14 @@ config PHY_ROCKCHIP_DP
 	help
 	  Enable this to support the Rockchip Display Port PHY.
 
+config PHY_ROCKCHIP_DPHY
+	tristate "Rockchip MIPI Synopsys DPHY driver"
+	depends on ARCH_ROCKCHIP && OF
+	select GENERIC_PHY_MIPI_DPHY
+	select GENERIC_PHY
+	help
+	  Enable this to support the Rockchip MIPI Synopsys DPHY.
+
 config PHY_ROCKCHIP_EMMC
 	tristate "Rockchip EMMC PHY Driver"
 	depends on ARCH_ROCKCHIP && OF
diff --git a/drivers/phy/rockchip/Makefile b/drivers/phy/rockchip/Makefile
index fd21cbaf40dd..f62e9010bcaf 100644
--- a/drivers/phy/rockchip/Makefile
+++ b/drivers/phy/rockchip/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_PHY_ROCKCHIP_DP)		+= phy-rockchip-dp.o
+obj-$(CONFIG_PHY_ROCKCHIP_DPHY)		+= phy-rockchip-dphy.o
 obj-$(CONFIG_PHY_ROCKCHIP_EMMC)		+= phy-rockchip-emmc.o
 obj-$(CONFIG_PHY_ROCKCHIP_INNO_HDMI)	+= phy-rockchip-inno-hdmi.o
 obj-$(CONFIG_PHY_ROCKCHIP_INNO_USB2)	+= phy-rockchip-inno-usb2.o
diff --git a/drivers/phy/rockchip/phy-rockchip-dphy.c b/drivers/phy/rockchip/phy-rockchip-dphy.c
new file mode 100644
index 000000000000..3a29976c2dff
--- /dev/null
+++ b/drivers/phy/rockchip/phy-rockchip-dphy.c
@@ -0,0 +1,408 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Rockchip MIPI Synopsys DPHY driver
+ *
+ * Based on:
+ *
+ * Copyright (C) 2016 FuZhou Rockchip Co., Ltd.
+ * Author: Yakir Yang <ykk@@rock-chips.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/phy/phy.h>
+#include <linux/phy/phy-mipi-dphy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define RK3399_GRF_SOC_CON9	0x6224
+#define RK3399_GRF_SOC_CON21	0x6254
+#define RK3399_GRF_SOC_CON22	0x6258
+#define RK3399_GRF_SOC_CON23	0x625c
+#define RK3399_GRF_SOC_CON24	0x6260
+#define RK3399_GRF_SOC_CON25	0x6264
+#define RK3399_GRF_SOC_STATUS1	0xe2a4
+
+#define CLOCK_LANE_HS_RX_CONTROL		0x34
+#define LANE0_HS_RX_CONTROL			0x44
+#define LANE1_HS_RX_CONTROL			0x54
+#define LANE2_HS_RX_CONTROL			0x84
+#define LANE3_HS_RX_CONTROL			0x94
+#define HS_RX_DATA_LANES_THS_SETTLE_CONTROL	0x75
+
+#define MAX_DPHY_CLK 8
+
+#define PHY_TESTEN_ADDR			(0x1 << 16)
+#define PHY_TESTEN_DATA			(0x0 << 16)
+#define PHY_TESTCLK			(0x1 << 1)
+#define PHY_TESTCLR			(0x1 << 0)
+#define THS_SETTLE_COUNTER_THRESHOLD	0x04
+
+#define HIWORD_UPDATE(val, mask, shift) \
+	((val) << (shift) | (mask) << ((shift) + 16))
+
+#define GRF_SOC_CON12                           0x0274
+
+#define GRF_EDP_REF_CLK_SEL_INTER_HIWORD_MASK   BIT(20)
+#define GRF_EDP_REF_CLK_SEL_INTER               BIT(4)
+
+#define GRF_EDP_PHY_SIDDQ_HIWORD_MASK           BIT(21)
+#define GRF_EDP_PHY_SIDDQ_ON                    0
+#define GRF_EDP_PHY_SIDDQ_OFF                   BIT(5)
+
+struct hsfreq_range {
+	u32 range_h;
+	u8 cfg_bit;
+};
+
+static const struct hsfreq_range rk3399_mipidphy_hsfreq_ranges[] = {
+	{  89, 0x00}, {  99, 0x10}, { 109, 0x20}, { 129, 0x01},
+	{ 139, 0x11}, { 149, 0x21}, { 169, 0x02}, { 179, 0x12},
+	{ 199, 0x22}, { 219, 0x03}, { 239, 0x13}, { 249, 0x23},
+	{ 269, 0x04}, { 299, 0x14}, { 329, 0x05}, { 359, 0x15},
+	{ 399, 0x25}, { 449, 0x06}, { 499, 0x16}, { 549, 0x07},
+	{ 599, 0x17}, { 649, 0x08}, { 699, 0x18}, { 749, 0x09},
+	{ 799, 0x19}, { 849, 0x29}, { 899, 0x39}, { 949, 0x0a},
+	{ 999, 0x1a}, {1049, 0x2a}, {1099, 0x3a}, {1149, 0x0b},
+	{1199, 0x1b}, {1249, 0x2b}, {1299, 0x3b}, {1349, 0x0c},
+	{1399, 0x1c}, {1449, 0x2c}, {1500, 0x3c}
+};
+
+static const char * const rk3399_mipidphy_clks[] = {
+	"dphy-ref",
+	"dphy-cfg",
+	"grf",
+};
+
+enum dphy_reg_id {
+	GRF_DPHY_RX0_TURNDISABLE = 0,
+	GRF_DPHY_RX0_FORCERXMODE,
+	GRF_DPHY_RX0_FORCETXSTOPMODE,
+	GRF_DPHY_RX0_ENABLE,
+	GRF_DPHY_RX0_TESTCLR,
+	GRF_DPHY_RX0_TESTCLK,
+	GRF_DPHY_RX0_TESTEN,
+	GRF_DPHY_RX0_TESTDIN,
+	GRF_DPHY_RX0_TURNREQUEST,
+	GRF_DPHY_RX0_TESTDOUT,
+	GRF_DPHY_TX0_TURNDISABLE,
+	GRF_DPHY_TX0_FORCERXMODE,
+	GRF_DPHY_TX0_FORCETXSTOPMODE,
+	GRF_DPHY_TX0_TURNREQUEST,
+	GRF_DPHY_TX1RX1_TURNDISABLE,
+	GRF_DPHY_TX1RX1_FORCERXMODE,
+	GRF_DPHY_TX1RX1_FORCETXSTOPMODE,
+	GRF_DPHY_TX1RX1_ENABLE,
+	GRF_DPHY_TX1RX1_MASTERSLAVEZ,
+	GRF_DPHY_TX1RX1_BASEDIR,
+	GRF_DPHY_TX1RX1_ENABLECLK,
+	GRF_DPHY_TX1RX1_TURNREQUEST,
+	GRF_DPHY_RX1_SRC_SEL,
+	/* rk3288 only */
+	GRF_CON_DISABLE_ISP,
+	GRF_CON_ISP_DPHY_SEL,
+	GRF_DSI_CSI_TESTBUS_SEL,
+	GRF_DVP_V18SEL,
+	/* below is for rk3399 only */
+	GRF_DPHY_RX0_CLK_INV_SEL,
+	GRF_DPHY_RX1_CLK_INV_SEL,
+};
+
+struct dphy_reg {
+	u32 offset;
+	u32 mask;
+	u32 shift;
+};
+
+#define PHY_REG(_offset, _width, _shift) \
+	{ .offset = _offset, .mask = BIT(_width) - 1, .shift = _shift, }
+
+static const struct dphy_reg rk3399_grf_dphy_regs[] = {
+	[GRF_DPHY_RX0_TURNREQUEST] = PHY_REG(RK3399_GRF_SOC_CON9, 4, 0),
+	[GRF_DPHY_RX0_CLK_INV_SEL] = PHY_REG(RK3399_GRF_SOC_CON9, 1, 10),
+	[GRF_DPHY_RX1_CLK_INV_SEL] = PHY_REG(RK3399_GRF_SOC_CON9, 1, 11),
+	[GRF_DPHY_RX0_ENABLE] = PHY_REG(RK3399_GRF_SOC_CON21, 4, 0),
+	[GRF_DPHY_RX0_FORCERXMODE] = PHY_REG(RK3399_GRF_SOC_CON21, 4, 4),
+	[GRF_DPHY_RX0_FORCETXSTOPMODE] = PHY_REG(RK3399_GRF_SOC_CON21, 4, 8),
+	[GRF_DPHY_RX0_TURNDISABLE] = PHY_REG(RK3399_GRF_SOC_CON21, 4, 12),
+	[GRF_DPHY_TX0_FORCERXMODE] = PHY_REG(RK3399_GRF_SOC_CON22, 4, 0),
+	[GRF_DPHY_TX0_FORCETXSTOPMODE] = PHY_REG(RK3399_GRF_SOC_CON22, 4, 4),
+	[GRF_DPHY_TX0_TURNDISABLE] = PHY_REG(RK3399_GRF_SOC_CON22, 4, 8),
+	[GRF_DPHY_TX0_TURNREQUEST] = PHY_REG(RK3399_GRF_SOC_CON22, 4, 12),
+	[GRF_DPHY_TX1RX1_ENABLE] = PHY_REG(RK3399_GRF_SOC_CON23, 4, 0),
+	[GRF_DPHY_TX1RX1_FORCERXMODE] = PHY_REG(RK3399_GRF_SOC_CON23, 4, 4),
+	[GRF_DPHY_TX1RX1_FORCETXSTOPMODE] = PHY_REG(RK3399_GRF_SOC_CON23, 4, 8),
+	[GRF_DPHY_TX1RX1_TURNDISABLE] = PHY_REG(RK3399_GRF_SOC_CON23, 4, 12),
+	[GRF_DPHY_TX1RX1_TURNREQUEST] = PHY_REG(RK3399_GRF_SOC_CON24, 4, 0),
+	[GRF_DPHY_RX1_SRC_SEL] = PHY_REG(RK3399_GRF_SOC_CON24, 1, 4),
+	[GRF_DPHY_TX1RX1_BASEDIR] = PHY_REG(RK3399_GRF_SOC_CON24, 1, 5),
+	[GRF_DPHY_TX1RX1_ENABLECLK] = PHY_REG(RK3399_GRF_SOC_CON24, 1, 6),
+	[GRF_DPHY_TX1RX1_MASTERSLAVEZ] = PHY_REG(RK3399_GRF_SOC_CON24, 1, 7),
+	[GRF_DPHY_RX0_TESTDIN] = PHY_REG(RK3399_GRF_SOC_CON25, 8, 0),
+	[GRF_DPHY_RX0_TESTEN] = PHY_REG(RK3399_GRF_SOC_CON25, 1, 8),
+	[GRF_DPHY_RX0_TESTCLK] = PHY_REG(RK3399_GRF_SOC_CON25, 1, 9),
+	[GRF_DPHY_RX0_TESTCLR] = PHY_REG(RK3399_GRF_SOC_CON25, 1, 10),
+	[GRF_DPHY_RX0_TESTDOUT] = PHY_REG(RK3399_GRF_SOC_STATUS1, 8, 0),
+};
+
+struct dphy_drv_data {
+	const char * const *clks;
+	int num_clks;
+	const struct hsfreq_range *hsfreq_ranges;
+	int num_hsfreq_ranges;
+	const struct dphy_reg *regs;
+};
+
+struct rockchip_dphy {
+	struct device *dev;
+	struct regmap *grf;
+	const struct dphy_reg *grf_regs;
+	struct clk_bulk_data clks[MAX_DPHY_CLK];
+
+	const struct dphy_drv_data *drv_data;
+	struct phy_configure_opts_mipi_dphy config;
+};
+
+static inline void write_grf_reg(struct rockchip_dphy *priv,
+				 int index, u8 value)
+{
+	const struct dphy_reg *reg = &priv->grf_regs[index];
+	unsigned int val = HIWORD_UPDATE(value, reg->mask, reg->shift);
+
+	WARN_ON(!reg->offset);
+	regmap_write(priv->grf, reg->offset, val);
+}
+
+static void mipidphy0_wr_reg(struct rockchip_dphy *priv,
+			     u8 test_code, u8 test_data)
+{
+	/*
+	 * With the falling edge on TESTCLK, the TESTDIN[7:0] signal content
+	 * is latched internally as the current test code. Test data is
+	 * programmed internally by rising edge on TESTCLK.
+	 */
+	write_grf_reg(priv, GRF_DPHY_RX0_TESTCLK, 1);
+	write_grf_reg(priv, GRF_DPHY_RX0_TESTDIN, test_code);
+	write_grf_reg(priv, GRF_DPHY_RX0_TESTEN, 1);
+	write_grf_reg(priv, GRF_DPHY_RX0_TESTCLK, 0);
+	write_grf_reg(priv, GRF_DPHY_RX0_TESTEN, 0);
+	write_grf_reg(priv, GRF_DPHY_RX0_TESTDIN, test_data);
+	write_grf_reg(priv, GRF_DPHY_RX0_TESTCLK, 1);
+}
+
+/* should be move to power_on */
+static int mipidphy_rx_stream_on(struct rockchip_dphy *priv)
+{
+	const struct dphy_drv_data *drv_data = priv->drv_data;
+	const struct hsfreq_range *hsfreq_ranges = drv_data->hsfreq_ranges;
+	struct phy_configure_opts_mipi_dphy *config = &priv->config;
+	unsigned int i, hsfreq = 0, data_rate_mbps = config->hs_clk_rate;
+	int num_hsfreq_ranges = drv_data->num_hsfreq_ranges;
+
+	do_div(data_rate_mbps, 1000 * 1000);
+
+	dev_dbg(priv->dev, "%s: lanes %d - data_rate_mbps %u\n",
+		__func__, config->lanes, data_rate_mbps);
+
+	for (i = 0; i < num_hsfreq_ranges; i++) {
+		if (hsfreq_ranges[i].range_h >= data_rate_mbps) {
+			hsfreq = hsfreq_ranges[i].cfg_bit;
+			break;
+		}
+	}
+
+	write_grf_reg(priv, GRF_DPHY_RX0_FORCERXMODE, 0);
+	write_grf_reg(priv, GRF_DPHY_RX0_FORCETXSTOPMODE, 0);
+
+	/* Disable lan turn around, which is ignored in receive mode */
+	write_grf_reg(priv, GRF_DPHY_RX0_TURNREQUEST, 0);
+	write_grf_reg(priv, GRF_DPHY_RX0_TURNDISABLE, 0xf);
+
+	write_grf_reg(priv, GRF_DPHY_RX0_ENABLE, GENMASK(config->lanes - 1, 0));
+
+	/* dphy start */
+	write_grf_reg(priv, GRF_DPHY_RX0_TESTCLK, 1);
+	write_grf_reg(priv, GRF_DPHY_RX0_TESTCLR, 1);
+	usleep_range(100, 150);
+	write_grf_reg(priv, GRF_DPHY_RX0_TESTCLR, 0);
+	usleep_range(100, 150);
+
+	/* set clock lane */
+	/* HS hsfreq_range & lane 0  settle bypass */
+	mipidphy0_wr_reg(priv, CLOCK_LANE_HS_RX_CONTROL, 0);
+	/* HS RX Control of lane0 */
+	mipidphy0_wr_reg(priv, LANE0_HS_RX_CONTROL, hsfreq << 1);
+	/* HS RX Control of lane1 */
+	mipidphy0_wr_reg(priv, LANE1_HS_RX_CONTROL, 0);
+	/* HS RX Control of lane2 */
+	mipidphy0_wr_reg(priv, LANE2_HS_RX_CONTROL, 0);
+	/* HS RX Control of lane3 */
+	mipidphy0_wr_reg(priv, LANE3_HS_RX_CONTROL, 0);
+	/* HS RX Data Lanes Settle State Time Control */
+	mipidphy0_wr_reg(priv, HS_RX_DATA_LANES_THS_SETTLE_CONTROL,
+			 THS_SETTLE_COUNTER_THRESHOLD);
+
+	/* Normal operation */
+	mipidphy0_wr_reg(priv, 0x0, 0);
+
+	return 0;
+}
+
+static int rockchip_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	struct rockchip_dphy *priv = phy_get_drvdata(phy);
+	int ret;
+
+	/* pass with phy_mipi_dphy_get_default_config (with pixel rate?) */
+	ret = phy_mipi_dphy_config_validate(&opts->mipi_dphy);
+	if (ret)
+		return ret;
+
+	memcpy(&priv->config, opts, sizeof(priv->config));
+
+	return 0;
+}
+
+static int rockchip_dphy_power_on(struct phy *phy)
+{
+	struct rockchip_dphy *priv = phy_get_drvdata(phy);
+	int ret;
+
+	ret = clk_bulk_enable(priv->drv_data->num_clks, priv->clks);
+	if (ret)
+		return ret;
+
+	return mipidphy_rx_stream_on(priv);
+}
+
+static int rockchip_dphy_power_off(struct phy *phy)
+{
+	struct rockchip_dphy *priv = phy_get_drvdata(phy);
+
+	clk_bulk_disable(priv->drv_data->num_clks, priv->clks);
+	return 0;
+}
+
+static int rockchip_dphy_init(struct phy *phy)
+{
+	struct rockchip_dphy *priv = phy_get_drvdata(phy);
+	int ret;
+
+	ret = clk_bulk_prepare(priv->drv_data->num_clks, priv->clks);
+	if (ret)
+		return ret;
+	return 0;
+}
+
+static int rockchip_dphy_exit(struct phy *phy)
+{
+	struct rockchip_dphy *priv = phy_get_drvdata(phy);
+
+	clk_bulk_unprepare(priv->drv_data->num_clks, priv->clks);
+	return 0;
+}
+
+static const struct phy_ops rockchip_dphy_ops = {
+	.power_on	= rockchip_dphy_power_on,
+	.power_off	= rockchip_dphy_power_off,
+	.init		= rockchip_dphy_init,
+	.exit		= rockchip_dphy_exit,
+	.configure	= rockchip_dphy_configure,
+	.owner		= THIS_MODULE,
+};
+
+static const struct dphy_drv_data rk3399_mipidphy_drv_data = {
+	.clks = rk3399_mipidphy_clks,
+	.num_clks = ARRAY_SIZE(rk3399_mipidphy_clks),
+	.hsfreq_ranges = rk3399_mipidphy_hsfreq_ranges,
+	.num_hsfreq_ranges = ARRAY_SIZE(rk3399_mipidphy_hsfreq_ranges),
+	.regs = rk3399_grf_dphy_regs,
+};
+
+static const struct of_device_id rockchip_dphy_dt_ids[] = {
+	{
+		.compatible = "rockchip,rk3399-mipi-dphy",
+		.data = &rk3399_mipidphy_drv_data,
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, rockchip_dphy_dt_ids);
+
+static int rockchip_dphy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	const struct dphy_drv_data *drv_data;
+	struct phy_provider *phy_provider;
+	const struct of_device_id *of_id;
+	struct rockchip_dphy *priv;
+	struct regmap *grf;
+	struct phy *phy;
+	unsigned int i;
+	int ret;
+
+	if (!dev->parent || !dev->parent->of_node)
+		return -ENODEV;
+
+	if (platform_get_resource(pdev, IORESOURCE_MEM, 0)) {
+		dev_err(&pdev->dev, "Rockchip DPHY driver only suports rx\n");
+		return -EINVAL;
+	}
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	priv->dev = dev;
+
+	grf = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(grf)) {
+		grf = syscon_regmap_lookup_by_phandle(dev->of_node,
+						      "rockchip,grf");
+		if (IS_ERR(grf)) {
+			dev_err(dev, "Can't find GRF syscon\n");
+			return -ENODEV;
+		}
+	}
+	priv->grf = grf;
+
+	of_id = of_match_device(rockchip_dphy_dt_ids, dev);
+	if (!of_id)
+		return -EINVAL;
+
+	drv_data = of_id->data;
+	priv->grf_regs = drv_data->regs;
+	priv->drv_data = drv_data;
+	for (i = 0; i < drv_data->num_clks; i++)
+		priv->clks[i].id = drv_data->clks[i];
+	ret = devm_clk_bulk_get(&pdev->dev, drv_data->num_clks, priv->clks);
+	if (ret)
+		return ret;
+
+	phy = devm_phy_create(dev, np, &rockchip_dphy_ops);
+	if (IS_ERR(phy)) {
+		dev_err(dev, "failed to create phy\n");
+		return PTR_ERR(phy);
+	}
+	phy_set_drvdata(phy, priv);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static struct platform_driver rockchip_dphy_driver = {
+	.probe = rockchip_dphy_probe,
+	.driver = {
+		.name	= "rockchip-mipi-dphy",
+		.of_match_table = rockchip_dphy_dt_ids,
+	},
+};
+module_platform_driver(rockchip_dphy_driver);
+
+MODULE_AUTHOR("Ezequiel Garcia <ezequiel@collabora.com>");
+MODULE_DESCRIPTION("Rockchip MIPI Synopsys DPHY driver");
+MODULE_LICENSE("Dual MIT/GPL");
-- 
2.22.0

