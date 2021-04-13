Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFA035D551
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 04:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343739AbhDMCbr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 22:31:47 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35892 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343678AbhDMCbo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 22:31:44 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33B3D1163;
        Tue, 13 Apr 2021 04:31:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618281084;
        bh=MtryaoMc0lBM2mhGwGzblsfMbD+CVM3hvOelJIg1EyA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CnNSzF1pPaV66r7iX8Px6esg9lURX8Ul0h8mOYQHHE7+62EddQ/ObTRaHfbs7w64S
         lixZ1ytrhBLAB022ZHj8w22d7259xsGWiWLNJ4Cm7aRbviuLL6JPmNJPKSQa7b+tBo
         1oR2jGlEcS6JoMR8NweiSEmm9vsy3tqNr0YU+RDs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>
Subject: [PATCH 23/23] media: imx: imx7_mipi_csis: Add i.MX8MM support
Date:   Tue, 13 Apr 2021 05:30:14 +0300
Message-Id: <20210413023014.28797-24-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSI-2 receiver in the i.MX8MM is a newer version of the one found in
the i.MX7. Differences are minimal, support it in the imx7_mipi_csis
driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 70 ++++++++++++++++------
 1 file changed, 52 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 6e235c86e0aa..0444b784c1ec 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
@@ -283,12 +284,23 @@ enum mipi_csis_clk {
 	MIPI_CSIS_CLK_PCLK,
 	MIPI_CSIS_CLK_WRAP,
 	MIPI_CSIS_CLK_PHY,
+	MIPI_CSIS_CLK_AXI,
 };
 
 static const char * const mipi_csis_clk_id[] = {
 	"pclk",
 	"wrap",
 	"phy",
+	"axi",
+};
+
+enum mipi_csis_version {
+	MIPI_CSIS_V3_3,
+	MIPI_CSIS_V3_6_3,
+};
+
+struct mipi_csis_info {
+	enum mipi_csis_version version;
 };
 
 struct csi_state {
@@ -298,6 +310,7 @@ struct csi_state {
 	struct clk_bulk_data *clks;
 	struct reset_control *mrst;
 	struct regulator *mipi_phy_regulator;
+	const struct mipi_csis_info *info;
 	u8 index;
 
 	struct v4l2_subdev sd;
@@ -459,6 +472,9 @@ static void mipi_csis_sw_reset(struct csi_state *state)
 
 static int mipi_csis_phy_init(struct csi_state *state)
 {
+	if (state->info->version != MIPI_CSIS_V3_3)
+		return 0;
+
 	state->mipi_phy_regulator = devm_regulator_get(state->dev, "phy");
 	if (IS_ERR(state->mipi_phy_regulator))
 		return PTR_ERR(state->mipi_phy_regulator);
@@ -469,11 +485,11 @@ static int mipi_csis_phy_init(struct csi_state *state)
 
 static void mipi_csis_phy_reset(struct csi_state *state)
 {
-	reset_control_assert(state->mrst);
-
-	msleep(20);
-
-	reset_control_deassert(state->mrst);
+	if (state->info->version == MIPI_CSIS_V3_3) {
+		reset_control_assert(state->mrst);
+		msleep(20);
+		reset_control_deassert(state->mrst);
+	}
 }
 
 static void mipi_csis_system_enable(struct csi_state *state, int on)
@@ -558,7 +574,8 @@ static void mipi_csis_set_params(struct csi_state *state)
 	val = mipi_csis_read(state, MIPI_CSIS_CMN_CTRL);
 	val &= ~MIPI_CSIS_CMN_CTRL_LANE_NR_MASK;
 	val |= (lanes - 1) << MIPI_CSIS_CMN_CTRL_LANE_NR_OFFSET;
-	val |= MIPI_CSIS_CMN_CTRL_INTER_MODE;
+	if (state->info->version == MIPI_CSIS_V3_3)
+		val |= MIPI_CSIS_CMN_CTRL_INTER_MODE;
 	mipi_csis_write(state, MIPI_CSIS_CMN_CTRL, val);
 
 	__mipi_csis_set_format(state);
@@ -610,7 +627,7 @@ static int mipi_csis_clk_get(struct csi_state *state)
 	unsigned int i;
 	int ret;
 
-	state->num_clks = ARRAY_SIZE(mipi_csis_clk_id);
+	state->num_clks = state->info->version == MIPI_CSIS_V3_3 ? 3 : 4;
 	state->clks = devm_kcalloc(state->dev, state->num_clks,
 				   sizeof(*state->clks), GFP_KERNEL);
 
@@ -1178,9 +1195,11 @@ static int mipi_csis_pm_suspend(struct device *dev, bool runtime)
 	mutex_lock(&state->lock);
 	if (state->state & ST_POWERED) {
 		mipi_csis_stop_stream(state);
-		ret = regulator_disable(state->mipi_phy_regulator);
-		if (ret)
-			goto unlock;
+		if (state->info->version == MIPI_CSIS_V3_3) {
+			ret = regulator_disable(state->mipi_phy_regulator);
+			if (ret)
+				goto unlock;
+		}
 		mipi_csis_clk_disable(state);
 		state->state &= ~ST_POWERED;
 		if (!runtime)
@@ -1204,9 +1223,11 @@ static int mipi_csis_pm_resume(struct device *dev, bool runtime)
 		goto unlock;
 
 	if (!(state->state & ST_POWERED)) {
-		ret = regulator_enable(state->mipi_phy_regulator);
-		if (ret)
-			goto unlock;
+		if (state->info->version == MIPI_CSIS_V3_3) {
+			ret = regulator_enable(state->mipi_phy_regulator);
+			if (ret)
+				goto unlock;
+		}
 
 		state->state |= ST_POWERED;
 		mipi_csis_clk_enable(state);
@@ -1289,9 +1310,11 @@ static int mipi_csis_parse_dt(struct csi_state *state)
 		state->clk_frequency = DEFAULT_SCLK_CSIS_FREQ;
 
 	/* Get MIPI PHY resets */
-	state->mrst = devm_reset_control_get_exclusive(state->dev, NULL);
-	if (IS_ERR(state->mrst))
-		return PTR_ERR(state->mrst);
+	if (state->info->version == MIPI_CSIS_V3_3) {
+		state->mrst = devm_reset_control_get_exclusive(state->dev, NULL);
+		if (IS_ERR(state->mrst))
+			return PTR_ERR(state->mrst);
+	}
 
 	return 0;
 }
@@ -1311,6 +1334,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	spin_lock_init(&state->slock);
 
 	state->dev = dev;
+	state->info = of_device_get_match_data(dev);
 
 	memcpy(state->events, mipi_csis_events, sizeof(state->events));
 
@@ -1419,7 +1443,17 @@ static int mipi_csis_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id mipi_csis_of_match[] = {
-	{ .compatible = "fsl,imx7-mipi-csi2", },
+	{
+		.compatible = "fsl,imx7-mipi-csi2",
+		.data = &(const struct mipi_csis_info){
+			.version = MIPI_CSIS_V3_3,
+		},
+	}, {
+		.compatible = "fsl,imx8mm-mipi-csi2",
+		.data = &(const struct mipi_csis_info){
+			.version = MIPI_CSIS_V3_6_3,
+		},
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mipi_csis_of_match);
@@ -1436,6 +1470,6 @@ static struct platform_driver mipi_csis_driver = {
 
 module_platform_driver(mipi_csis_driver);
 
-MODULE_DESCRIPTION("i.MX7 MIPI CSI-2 Receiver driver");
+MODULE_DESCRIPTION("i.MX7 & i.MX8 MIPI CSI-2 receiver driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:imx7-mipi-csi2");
-- 
Regards,

Laurent Pinchart

