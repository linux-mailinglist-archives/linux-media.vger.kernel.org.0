Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 382AD34EF9B
	for <lists+linux-media@lfdr.de>; Tue, 30 Mar 2021 19:35:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232433AbhC3Rem (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Mar 2021 13:34:42 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:59550 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232307AbhC3Re2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Mar 2021 13:34:28 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12UHY80Y057005;
        Tue, 30 Mar 2021 12:34:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1617125648;
        bh=al0qmsNw4qGGrS+IvvHucR10n/i1H5Cqvddimz3Fllo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=hRH4ppKTtspbs7IgkAuV20kiT3OtQ9wAACBZ01sx0r37zYB25zbpiFKrjtg+aZESH
         qx6n6E/L9xhi4JRLVi5HXGnf7yBtrJNY3L2w23vSP/iQXfu0oztu3EFMBp9zir/5+B
         k0RvzX57vE2tmhw+X5CT/UQrO8x9cyjmBcqEt4rU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12UHY8lc067690
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 30 Mar 2021 12:34:08 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 30
 Mar 2021 12:34:08 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 30 Mar 2021 12:34:08 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12UHXmgj125244;
        Tue, 30 Mar 2021 12:34:02 -0500
From:   Pratyush Yadav <p.yadav@ti.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Benoit Parrot <bparrot@ti.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Helen Koike <helen.koike@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Peter Chen <peter.chen@nxp.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <dmaengine@vger.kernel.org>
CC:     Pratyush Yadav <p.yadav@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 02/16] phy: cdns-dphy: Prepare for Rx support
Date:   Tue, 30 Mar 2021 23:03:34 +0530
Message-ID: <20210330173348.30135-3-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210330173348.30135-1-p.yadav@ti.com>
References: <20210330173348.30135-1-p.yadav@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Rx programming sequence differs from the Tx programming sequence.
Currently only Tx mode is supported. Move all the Tx related parts into
a set of Tx-specific hooks that are then called by the main PHY
framework hooks. This way when Rx support is added all that is needed to
be done is to plug in the Rx hooks.

The clocks "psm" and "pll_ref" are not used by the Rx path so make them
optional in the probe and then check if they exist in the power_on()
hook.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/phy/cadence/cdns-dphy.c | 140 ++++++++++++++++++++++++--------
 1 file changed, 104 insertions(+), 36 deletions(-)

diff --git a/drivers/phy/cadence/cdns-dphy.c b/drivers/phy/cadence/cdns-dphy.c
index ba042e39cfaf..8656f2102a91 100644
--- a/drivers/phy/cadence/cdns-dphy.c
+++ b/drivers/phy/cadence/cdns-dphy.c
@@ -75,6 +75,11 @@ struct cdns_dphy;
 struct cdns_dphy_ops {
 	int (*probe)(struct cdns_dphy *dphy);
 	void (*remove)(struct cdns_dphy *dphy);
+	int (*power_on)(struct cdns_dphy *dphy);
+	int (*power_off)(struct cdns_dphy *dphy);
+	int (*validate)(struct cdns_dphy *dphy, enum phy_mode mode, int submode,
+			union phy_configure_opts *opts);
+	int (*configure)(struct cdns_dphy *dphy, union phy_configure_opts *opts);
 	void (*set_psm_div)(struct cdns_dphy *dphy, u8 div);
 	void (*set_clk_lane_cfg)(struct cdns_dphy *dphy,
 				 enum cdns_dphy_clk_lane_cfg cfg);
@@ -86,12 +91,18 @@ struct cdns_dphy_ops {
 struct cdns_dphy {
 	struct cdns_dphy_cfg cfg;
 	void __iomem *regs;
+	struct device *dev;
 	struct clk *psm_clk;
 	struct clk *pll_ref_clk;
 	const struct cdns_dphy_ops *ops;
 	struct phy *phy;
 };
 
+struct cdns_dphy_driver_data {
+	const struct cdns_dphy_ops *tx;
+	const struct cdns_dphy_ops *rx;
+};
+
 static int cdns_dsi_get_dphy_pll_cfg(struct cdns_dphy *dphy,
 				     struct cdns_dphy_cfg *cfg,
 				     struct phy_configure_opts_mipi_dphy *opts,
@@ -199,20 +210,9 @@ static void cdns_dphy_ref_set_psm_div(struct cdns_dphy *dphy, u8 div)
 	       dphy->regs + DPHY_PSM_CFG);
 }
 
-/*
- * This is the reference implementation of DPHY hooks. Specific integration of
- * this IP may have to re-implement some of them depending on how they decided
- * to wire things in the SoC.
- */
-static const struct cdns_dphy_ops ref_dphy_ops = {
-	.get_wakeup_time_ns = cdns_dphy_ref_get_wakeup_time_ns,
-	.set_pll_cfg = cdns_dphy_ref_set_pll_cfg,
-	.set_psm_div = cdns_dphy_ref_set_psm_div,
-};
-
-static int cdns_dphy_config_from_opts(struct phy *phy,
-				      struct phy_configure_opts_mipi_dphy *opts,
-				      struct cdns_dphy_cfg *cfg)
+static int cdns_dphy_tx_config_from_opts(struct phy *phy,
+					 struct phy_configure_opts_mipi_dphy *opts,
+					 struct cdns_dphy_cfg *cfg)
 {
 	struct cdns_dphy *dphy = phy_get_drvdata(phy);
 	unsigned int dsi_hfp_ext = 0;
@@ -232,24 +232,13 @@ static int cdns_dphy_config_from_opts(struct phy *phy,
 	return 0;
 }
 
-static int cdns_dphy_validate(struct phy *phy, enum phy_mode mode, int submode,
-			      union phy_configure_opts *opts)
+static int cdns_dphy_tx_configure(struct cdns_dphy *dphy,
+				  union phy_configure_opts *opts)
 {
 	struct cdns_dphy_cfg cfg = { 0 };
-
-	if (mode != PHY_MODE_MIPI_DPHY)
-		return -EINVAL;
-
-	return cdns_dphy_config_from_opts(phy, &opts->mipi_dphy, &cfg);
-}
-
-static int cdns_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
-{
-	struct cdns_dphy *dphy = phy_get_drvdata(phy);
-	struct cdns_dphy_cfg cfg = { 0 };
 	int ret;
 
-	ret = cdns_dphy_config_from_opts(phy, &opts->mipi_dphy, &cfg);
+	ret = cdns_dphy_tx_config_from_opts(dphy->phy, &opts->mipi_dphy, &cfg);
 	if (ret)
 		return ret;
 
@@ -279,9 +268,21 @@ static int cdns_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
 	return 0;
 }
 
-static int cdns_dphy_power_on(struct phy *phy)
+static int cdns_dphy_tx_validate(struct cdns_dphy *dphy, enum phy_mode mode,
+				 int submode, union phy_configure_opts *opts)
 {
-	struct cdns_dphy *dphy = phy_get_drvdata(phy);
+	struct cdns_dphy_cfg cfg = { 0 };
+
+	if (submode != PHY_MIPI_DPHY_SUBMODE_TX)
+		return -EINVAL;
+
+	return cdns_dphy_tx_config_from_opts(dphy->phy, &opts->mipi_dphy, &cfg);
+}
+
+static int cdns_dphy_tx_power_on(struct cdns_dphy *dphy)
+{
+	if (!dphy->psm_clk || !dphy->pll_ref_clk)
+		return -EINVAL;
 
 	clk_prepare_enable(dphy->psm_clk);
 	clk_prepare_enable(dphy->pll_ref_clk);
@@ -293,16 +294,77 @@ static int cdns_dphy_power_on(struct phy *phy)
 	return 0;
 }
 
-static int cdns_dphy_power_off(struct phy *phy)
+static int cdns_dphy_tx_power_off(struct cdns_dphy *dphy)
 {
-	struct cdns_dphy *dphy = phy_get_drvdata(phy);
-
 	clk_disable_unprepare(dphy->pll_ref_clk);
 	clk_disable_unprepare(dphy->psm_clk);
 
 	return 0;
 }
 
+static const struct cdns_dphy_ops tx_ref_dphy_ops = {
+	.power_on = cdns_dphy_tx_power_on,
+	.power_off = cdns_dphy_tx_power_off,
+	.validate = cdns_dphy_tx_validate,
+	.configure = cdns_dphy_tx_configure,
+	.get_wakeup_time_ns = cdns_dphy_ref_get_wakeup_time_ns,
+	.set_pll_cfg = cdns_dphy_ref_set_pll_cfg,
+	.set_psm_div = cdns_dphy_ref_set_psm_div,
+};
+
+/*
+ * This is the reference implementation of DPHY hooks. Specific integration of
+ * this IP may have to re-implement some of them depending on how they decided
+ * to wire things in the SoC.
+ */
+static const struct cdns_dphy_driver_data ref_dphy_ops = {
+	.tx = &tx_ref_dphy_ops,
+};
+
+static int cdns_dphy_validate(struct phy *phy, enum phy_mode mode, int submode,
+			      union phy_configure_opts *opts)
+{
+	struct cdns_dphy *dphy = phy_get_drvdata(phy);
+
+	if (mode != PHY_MODE_MIPI_DPHY)
+		return -EINVAL;
+
+	if (dphy->ops->validate)
+		return dphy->ops->validate(dphy, mode, submode, opts);
+
+	return 0;
+}
+
+static int cdns_dphy_power_on(struct phy *phy)
+{
+	struct cdns_dphy *dphy = phy_get_drvdata(phy);
+
+	if (dphy->ops->power_on)
+		return dphy->ops->power_on(dphy);
+
+	return 0;
+}
+
+static int cdns_dphy_power_off(struct phy *phy)
+{
+	struct cdns_dphy *dphy = phy_get_drvdata(phy);
+
+	if (dphy->ops->power_off)
+		return dphy->ops->power_off(dphy);
+
+	return 0;
+}
+
+static int cdns_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	struct cdns_dphy *dphy = phy_get_drvdata(phy);
+
+	if (dphy->ops->configure)
+		return dphy->ops->configure(dphy, opts);
+
+	return 0;
+}
+
 static const struct phy_ops cdns_dphy_ops = {
 	.configure	= cdns_dphy_configure,
 	.validate	= cdns_dphy_validate,
@@ -314,14 +376,20 @@ static int cdns_dphy_probe(struct platform_device *pdev)
 {
 	struct phy_provider *phy_provider;
 	struct cdns_dphy *dphy;
+	const struct cdns_dphy_driver_data *ddata;
 	int ret;
 
 	dphy = devm_kzalloc(&pdev->dev, sizeof(*dphy), GFP_KERNEL);
 	if (!dphy)
 		return -ENOMEM;
 	dev_set_drvdata(&pdev->dev, dphy);
+	dphy->dev = &pdev->dev;
 
-	dphy->ops = of_device_get_match_data(&pdev->dev);
+	ddata = of_device_get_match_data(&pdev->dev);
+	if (!ddata)
+		return -EINVAL;
+
+	dphy->ops = ddata->tx;
 	if (!dphy->ops)
 		return -EINVAL;
 
@@ -329,11 +397,11 @@ static int cdns_dphy_probe(struct platform_device *pdev)
 	if (IS_ERR(dphy->regs))
 		return PTR_ERR(dphy->regs);
 
-	dphy->psm_clk = devm_clk_get(&pdev->dev, "psm");
+	dphy->psm_clk = devm_clk_get_optional(dphy->dev, "psm");
 	if (IS_ERR(dphy->psm_clk))
 		return PTR_ERR(dphy->psm_clk);
 
-	dphy->pll_ref_clk = devm_clk_get(&pdev->dev, "pll_ref");
+	dphy->pll_ref_clk = devm_clk_get_optional(dphy->dev, "pll_ref");
 	if (IS_ERR(dphy->pll_ref_clk))
 		return PTR_ERR(dphy->pll_ref_clk);
 
-- 
2.30.0

