Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC4F23FBB72
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 20:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238456AbhH3SJQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 14:09:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238419AbhH3SJN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 14:09:13 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ABCCC061575;
        Mon, 30 Aug 2021 11:08:18 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id j12so27341237ljg.10;
        Mon, 30 Aug 2021 11:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b/OAh8aOD3VETT+3ckdVhItSFApQc/twtaDOU9YMtuI=;
        b=Rq5lje9l8WRBpJnfFWx7PfhcZcspFl0/ajBKs+9DiME4q2c0Cie7d2i65SAmgRdm/Z
         YXqmakvI51HAMPVX6NwxIkbFRXfOrOkXgcq1zZrZpY3pSsGUj0lxrjG2lD2D4mIWBZvW
         EXiUb7vb+sLEm0SBJz5aPRw7b1i9/mDdnOqsLk2e1yj9eCLB7BYqWAGR5xEES7yW97Pm
         KsN1ixgso0sMylu5ETrzgv/Z5+tOJxL4d3trIxWkpniwATUixf2V4wm0Q5R6fjoMmbmP
         kQLJpwy/0J2aZcdk59uSApRQcPktv4r25peJMyo93uc8xd0uMveMhux/tiFRipC+vDyh
         GKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b/OAh8aOD3VETT+3ckdVhItSFApQc/twtaDOU9YMtuI=;
        b=BHwDx9/qWnyF44fSsLdU/NofpiazRKLYya1FiDYVxnc31ZoV/hlEXfTmK6QBk0e4x5
         wGrcXxYtCZgrkLCK2KvZnQoXCJPezYr2EE46cKWLRYxIF+rMiSe81g01Asdx8SPMhbwb
         zYM2Q8saLsxfUYQxGaFYqngbjrR14SvQUWZJuMVxtFeVS9yWaVTj/dkQy0s0bvrVJMkw
         MvpHHXkqKJtWSmFmOuslCKJgDmEptQoXtmT9/vNzhuvWEk/W2FXK79LdV+0d1AYPEBpR
         U3Lvplzpu78qAqOS2guBq7iN8DDi3xk1WY2/esGfRMCf2Qo7xt4FpPU306ynLWusuYyk
         f1ZA==
X-Gm-Message-State: AOAM531sk6irXwvTx+4TVTIO4Lh2khAyZGghMVgjkYxM+/pFriuLwuqB
        XqReGafdWYBI9ogVdirx6j8=
X-Google-Smtp-Source: ABdhPJxM+Eel5ZoWHJT/5HDxv0WIo7kbrH0gJR5PZy6QNvp3iXOC7vA1XjqSY8/TmP3KQL8szCNg6Q==
X-Received: by 2002:a2e:b537:: with SMTP id z23mr21942849ljm.109.1630346896621;
        Mon, 30 Aug 2021 11:08:16 -0700 (PDT)
Received: from localhost (37-145-211-218.broadband.corbina.ru. [37.145.211.218])
        by smtp.gmail.com with ESMTPSA id u11sm879448ljo.126.2021.08.30.11.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 11:08:16 -0700 (PDT)
From:   Mikhail Rudenko <mike.rudenko@gmail.com>
To:     linux-phy@lists.infradead.org
Cc:     linux-media@vger.kernel.org,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/5] phy: phy-rockchip-dphy-rx0: add support for tx1rx1 in receive mode
Date:   Mon, 30 Aug 2021 21:07:51 +0300
Message-Id: <20210830180758.251390-3-mike.rudenko@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830180758.251390-1-mike.rudenko@gmail.com>
References: <20210830180758.251390-1-mike.rudenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement RX mode of RK3399 TX1RX1 MIPI D-PHY. Unlike RX0 phy, it uses
both mmio registers and grf for configuration. Add necessary register
definitions, mmio register access functions, enable/disable functions,
rk_dphy_drv_data instance and compatible string for tx1rx1. Probe
function is adjusted accordingly.

Additionally, individual init function is implemented, since,
according to the comments in Rockchip BSP kernel, "According to the
sequence of RK3399_TXRX_DPHY, the setting of isp0 mipi will affect
txrx dphy in default state of grf_soc_con24."

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-dphy-rx0.c | 193 +++++++++++++++++--
 1 file changed, 172 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-dphy-rx0.c b/drivers/phy/rockchip/phy-rockchip-dphy-rx0.c
index 72145cdfb036..3ce307b49e51 100644
--- a/drivers/phy/rockchip/phy-rockchip-dphy-rx0.c
+++ b/drivers/phy/rockchip/phy-rockchip-dphy-rx0.c
@@ -34,6 +34,12 @@
 #define RK3399_GRF_SOC_CON24		0x6260
 #define RK3399_GRF_SOC_CON25		0x6264
 #define RK3399_GRF_SOC_STATUS1		0xe2a4
+#define RK3399_GRF_IO_VSEL			0x0900
+
+#define RK3399_PHY_TEST_CTRL0	0xb4
+#define RK3399_PHY_TEST_CTRL1	0xb8
+#define RK3399_PHY_SHUTDOWNZ	0xa0
+#define RK3399_PHY_RSTZ		0xa0
 
 #define CLOCK_LANE_HS_RX_CONTROL	0x34
 #define LANE0_HS_RX_CONTROL		0x44
@@ -43,6 +49,11 @@
 #define LANES_THS_SETTLE_CONTROL	0x75
 #define THS_SETTLE_COUNTER_THRESHOLD	0x04
 
+#define PHY_TESTEN_ADDR			(0x1 << 16)
+#define PHY_TESTEN_DATA			(0x0 << 16)
+#define PHY_TESTCLK			(0x1 << 1)
+#define PHY_TESTCLR			(0x1 << 0)
+
 struct hsfreq_range {
 	u16 range_h;
 	u8 cfg_bit;
@@ -61,12 +72,6 @@ static const struct hsfreq_range rk3399_mipidphy_hsfreq_ranges[] = {
 	{ 1399, 0x1c }, { 1449, 0x2c }, { 1500, 0x3c }
 };
 
-static const char * const rk3399_mipidphy_clks[] = {
-	"dphy-ref",
-	"dphy-cfg",
-	"grf",
-};
-
 enum dphy_reg_id {
 	GRF_DPHY_RX0_TURNDISABLE = 0,
 	GRF_DPHY_RX0_FORCERXMODE,
@@ -99,6 +104,14 @@ enum dphy_reg_id {
 	/* below is for rk3399 only */
 	GRF_DPHY_RX0_CLK_INV_SEL,
 	GRF_DPHY_RX1_CLK_INV_SEL,
+	GRF_DPHY_TX1RX1_SRC_SEL,
+};
+
+enum txrx_reg_id {
+	TXRX_PHY_TEST_CTRL0 = 0,
+	TXRX_PHY_TEST_CTRL1,
+	TXRX_PHY_SHUTDOWNZ,
+	TXRX_PHY_RSTZ,
 };
 
 struct dphy_reg {
@@ -127,7 +140,7 @@ static const struct dphy_reg rk3399_grf_dphy_regs[] = {
 	[GRF_DPHY_TX1RX1_FORCETXSTOPMODE] = PHY_REG(RK3399_GRF_SOC_CON23, 4, 8),
 	[GRF_DPHY_TX1RX1_TURNDISABLE] = PHY_REG(RK3399_GRF_SOC_CON23, 4, 12),
 	[GRF_DPHY_TX1RX1_TURNREQUEST] = PHY_REG(RK3399_GRF_SOC_CON24, 4, 0),
-	[GRF_DPHY_RX1_SRC_SEL] = PHY_REG(RK3399_GRF_SOC_CON24, 1, 4),
+	[GRF_DPHY_TX1RX1_SRC_SEL] = PHY_REG(RK3399_GRF_SOC_CON24, 1, 4),
 	[GRF_DPHY_TX1RX1_BASEDIR] = PHY_REG(RK3399_GRF_SOC_CON24, 1, 5),
 	[GRF_DPHY_TX1RX1_ENABLECLK] = PHY_REG(RK3399_GRF_SOC_CON24, 1, 6),
 	[GRF_DPHY_TX1RX1_MASTERSLAVEZ] = PHY_REG(RK3399_GRF_SOC_CON24, 1, 7),
@@ -136,6 +149,21 @@ static const struct dphy_reg rk3399_grf_dphy_regs[] = {
 	[GRF_DPHY_RX0_TESTCLK] = PHY_REG(RK3399_GRF_SOC_CON25, 1, 9),
 	[GRF_DPHY_RX0_TESTCLR] = PHY_REG(RK3399_GRF_SOC_CON25, 1, 10),
 	[GRF_DPHY_RX0_TESTDOUT] = PHY_REG(RK3399_GRF_SOC_STATUS1, 8, 0),
+	[GRF_DVP_V18SEL] = PHY_REG(RK3399_GRF_IO_VSEL, 1, 1),
+};
+
+struct txrx_reg {
+	u32 offset;
+};
+
+#define TXRX_REG(_offset) \
+	{ .offset = _offset, }
+
+static const struct txrx_reg rk3399_txrx_regs[] = {
+	[TXRX_PHY_TEST_CTRL0] = TXRX_REG(RK3399_PHY_TEST_CTRL0),
+	[TXRX_PHY_TEST_CTRL1] = TXRX_REG(RK3399_PHY_TEST_CTRL1),
+	[TXRX_PHY_SHUTDOWNZ] = TXRX_REG(RK3399_PHY_SHUTDOWNZ),
+	[TXRX_PHY_RSTZ] = TXRX_REG(RK3399_PHY_RSTZ),
 };
 
 struct rk_dphy;
@@ -146,15 +174,18 @@ struct rk_dphy_drv_data {
 	const struct hsfreq_range *hsfreq_ranges;
 	unsigned int num_hsfreq_ranges;
 	const struct dphy_reg *regs;
+	const struct txrx_reg *txrx_regs;
 
 	void (*enable)(struct rk_dphy *priv);
 	void (*disable)(struct rk_dphy *priv);
+	void (*individual_init)(struct rk_dphy *priv);
 };
 
 struct rk_dphy {
 	struct device *dev;
 	struct regmap *grf;
 	struct clk_bulk_data *clks;
+	void __iomem *txrx_base_addr;
 
 	const struct rk_dphy_drv_data *drv_data;
 	struct phy_configure_opts_mipi_dphy config;
@@ -234,6 +265,74 @@ static void rk_dphy_disable_rx(struct rk_dphy *priv)
 	rk_dphy_write_grf(priv, GRF_DPHY_RX0_ENABLE, 0);
 }
 
+static inline void rk_dphy_write_tx1rx1(struct rk_dphy *priv,
+				  int index, u32 value)
+{
+	const struct txrx_reg *reg = &priv->drv_data->txrx_regs[index];
+
+	if (reg->offset)
+		writel(value, priv->txrx_base_addr + reg->offset);
+}
+
+static void rk_dphy_write_mipi_tx1rx1(struct rk_dphy *priv, unsigned char addr,
+				 unsigned char data)
+{
+	/*
+	 * TESTEN =1,TESTDIN=addr
+	 * TESTCLK=0
+	 * TESTEN =0,TESTDIN=data
+	 * TESTCLK=1
+	 */
+	rk_dphy_write_tx1rx1(priv, TXRX_PHY_TEST_CTRL1, PHY_TESTEN_ADDR | addr);
+	rk_dphy_write_tx1rx1(priv, TXRX_PHY_TEST_CTRL0, 0x00);
+	rk_dphy_write_tx1rx1(priv, TXRX_PHY_TEST_CTRL1, PHY_TESTEN_DATA | data);
+	rk_dphy_write_tx1rx1(priv, TXRX_PHY_TEST_CTRL0, 0x02);
+}
+
+static void rk_dphy_enable_txrx(struct rk_dphy *priv)
+{
+	rk_dphy_write_tx1rx1(priv, TXRX_PHY_TEST_CTRL0, PHY_TESTCLR | PHY_TESTCLK);
+	usleep_range(100, 150);
+
+	rk_dphy_write_grf(priv, GRF_DPHY_TX1RX1_MASTERSLAVEZ, 0);
+	rk_dphy_write_grf(priv, GRF_DPHY_TX1RX1_BASEDIR, 1);
+
+	rk_dphy_write_grf(priv, GRF_DPHY_TX1RX1_FORCERXMODE, 0);
+	rk_dphy_write_grf(priv, GRF_DPHY_TX1RX1_FORCETXSTOPMODE, 0);
+	rk_dphy_write_grf(priv, GRF_DPHY_TX1RX1_TURNREQUEST, 0);
+	rk_dphy_write_grf(priv, GRF_DPHY_TX1RX1_TURNDISABLE, 0xf);
+	usleep_range(100, 150);
+
+	rk_dphy_write_tx1rx1(priv, TXRX_PHY_TEST_CTRL0, PHY_TESTCLK);
+	usleep_range(100, 150);
+
+	rk_dphy_write_mipi_tx1rx1(priv, CLOCK_LANE_HS_RX_CONTROL, 0);
+	rk_dphy_write_mipi_tx1rx1(priv, LANE0_HS_RX_CONTROL, priv->hsfreq << 1);
+	rk_dphy_write_mipi_tx1rx1(priv, LANE1_HS_RX_CONTROL, 0);
+	rk_dphy_write_mipi_tx1rx1(priv, LANE2_HS_RX_CONTROL, 0);
+	rk_dphy_write_mipi_tx1rx1(priv, LANE3_HS_RX_CONTROL, 0);
+
+	rk_dphy_write_grf(priv, GRF_DPHY_TX1RX1_ENABLE, GENMASK(priv->config.lanes - 1, 0));
+	usleep_range(100, 150);
+}
+
+static void rk_dphy_disable_txrx(struct rk_dphy *priv)
+{
+	rk_dphy_write_grf(priv, GRF_DPHY_TX1RX1_ENABLE, 0);
+}
+
+static void rk3399_mipidphy_individual_init(struct rk_dphy *priv)
+{
+	/*
+	 * According to the sequence of RK3399_TXRX_DPHY, the setting of isp0 mipi
+	 * will affect txrx dphy in default state of grf_soc_con24.
+	 */
+	rk_dphy_write_grf(priv, GRF_DPHY_TX1RX1_SRC_SEL, 0);
+	rk_dphy_write_grf(priv, GRF_DPHY_TX1RX1_MASTERSLAVEZ, 0);
+	rk_dphy_write_grf(priv, GRF_DPHY_TX1RX1_BASEDIR, 0);
+	rk_dphy_write_grf(priv, GRF_DVP_V18SEL, 0x1);
+}
+
 static int rk_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
 {
 	struct rk_dphy *priv = phy_get_drvdata(phy);
@@ -314,20 +413,50 @@ static const struct phy_ops rk_dphy_ops = {
 	.owner		= THIS_MODULE,
 };
 
-static const struct rk_dphy_drv_data rk3399_mipidphy_drv_data = {
-	.clks = rk3399_mipidphy_clks,
-	.num_clks = ARRAY_SIZE(rk3399_mipidphy_clks),
+static const char * const rk3399_mipidphy_rx_clks[] = {
+	"dphy-ref",
+	"dphy-cfg",
+	"grf",
+};
+
+static const char * const rk3399_mipidphy_txrx_clks[] = {
+	"dphy-ref",
+	"dphy-cfg",
+	"grf",
+	"dsi",
+};
+
+static const struct rk_dphy_drv_data rk3399_mipidphy_rx_drv_data = {
+	.clks = rk3399_mipidphy_rx_clks,
+	.num_clks = ARRAY_SIZE(rk3399_mipidphy_rx_clks),
 	.hsfreq_ranges = rk3399_mipidphy_hsfreq_ranges,
 	.num_hsfreq_ranges = ARRAY_SIZE(rk3399_mipidphy_hsfreq_ranges),
 	.regs = rk3399_grf_dphy_regs,
 	.enable = rk_dphy_enable_rx,
 	.disable = rk_dphy_disable_rx,
+	.individual_init = rk3399_mipidphy_individual_init,
+};
+
+static const struct rk_dphy_drv_data rk3399_mipidphy_txrx_drv_data = {
+	.clks = rk3399_mipidphy_txrx_clks,
+	.num_clks = ARRAY_SIZE(rk3399_mipidphy_txrx_clks),
+	.hsfreq_ranges = rk3399_mipidphy_hsfreq_ranges,
+	.num_hsfreq_ranges = ARRAY_SIZE(rk3399_mipidphy_hsfreq_ranges),
+	.regs = rk3399_grf_dphy_regs,
+	.txrx_regs = rk3399_txrx_regs,
+	.enable = rk_dphy_enable_txrx,
+	.disable = rk_dphy_disable_txrx,
+	.individual_init = rk3399_mipidphy_individual_init,
 };
 
 static const struct of_device_id rk_dphy_dt_ids[] = {
 	{
 		.compatible = "rockchip,rk3399-mipi-dphy-rx0",
-		.data = &rk3399_mipidphy_drv_data,
+		.data = &rk3399_mipidphy_rx_drv_data,
+	},
+	{
+		.compatible = "rockchip,rk3399-mipi-dphy-tx1rx1",
+		.data = &rk3399_mipidphy_txrx_drv_data,
 	},
 	{}
 };
@@ -345,26 +474,42 @@ static int rk_dphy_probe(struct platform_device *pdev)
 	unsigned int i;
 	int ret;
 
-	if (!dev->parent || !dev->parent->of_node)
-		return -ENODEV;
-
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 	priv->dev = dev;
 
-	priv->grf = syscon_node_to_regmap(dev->parent->of_node);
-	if (IS_ERR(priv->grf)) {
-		dev_err(dev, "Can't find GRF syscon\n");
-		return -ENODEV;
-	}
-
 	of_id = of_match_device(rk_dphy_dt_ids, dev);
 	if (!of_id)
 		return -EINVAL;
 
 	drv_data = of_id->data;
 	priv->drv_data = drv_data;
+
+	if (!drv_data->txrx_regs) {
+		if (!dev->parent || !dev->parent->of_node)
+			return -ENODEV;
+
+		priv->grf = syscon_node_to_regmap(dev->parent->of_node);
+		if (IS_ERR(priv->grf)) {
+			dev_err(dev, "Can't find GRF syscon\n");
+			return -ENODEV;
+		}
+	} else {
+		priv->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
+							    "rockchip,grf");
+		if (IS_ERR(priv->grf)) {
+			dev_err(dev, "Can't find GRF syscon\n");
+			return -ENODEV;
+		}
+
+		priv->txrx_base_addr = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(priv->txrx_base_addr)) {
+			dev_err(dev, "Failed to ioremap resource\n");
+			return PTR_ERR(priv->txrx_base_addr);
+		}
+	}
+
 	priv->clks = devm_kcalloc(&pdev->dev, drv_data->num_clks,
 				  sizeof(*priv->clks), GFP_KERNEL);
 	if (!priv->clks)
@@ -383,8 +528,14 @@ static int rk_dphy_probe(struct platform_device *pdev)
 	phy_set_drvdata(phy, priv);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider)) {
+		dev_err(dev, "failed to register phy provider\n");
+		return PTR_ERR(phy_provider);
+	}
 
-	return PTR_ERR_OR_ZERO(phy_provider);
+	drv_data->individual_init(priv);
+
+	return 0;
 }
 
 static struct platform_driver rk_dphy_driver = {
-- 
2.33.0

