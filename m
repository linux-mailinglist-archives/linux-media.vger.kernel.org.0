Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28AE9381C07
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 04:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232314AbhEPCQe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 22:16:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35528 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232112AbhEPCNE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 22:13:04 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B564A29BB;
        Sun, 16 May 2021 03:45:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621129520;
        bh=Y+YhviJrOrgHlOhNZBeCprdGnYfa4Ke4zYbbEh9d/UA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fcUpdxaCY6+ozagNK/vjNVaQ8jgNgHhVclDuraWkwkWvkLDsnTXeEKrq55r0h7DuM
         HnARcHlNFQC8oF3YEPQ9gBm3J0j5LWBl/1GTMkeG+MB8zdP6EXej3uLG/oLynyb2pB
         NEzGHW0pRdBm3Q1c9bcjGNGguUx79j8G2VIyd+QM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2 24/25] media: imx: imx7_mipi_csis: Add i.MX8MM support
Date:   Sun, 16 May 2021 04:44:40 +0300
Message-Id: <20210516014441.5508-25-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
References: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSI-2 receiver in the i.MX8MM is a newer version of the one found in
the i.MX7. Differences are minimal, support it in the imx7_mipi_csis
driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
Changes since v1:

- Moved .num_clks from csi_state to mipi_csis_info
- Rebased on top of "media: imx: imx7_mipi_csis: Move PHY control to
  dedicated functions"
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 59 ++++++++++++++++++----
 1 file changed, 49 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index a8da8d6ddb7d..136e21984bbd 100644
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
@@ -283,21 +284,33 @@ enum mipi_csis_clk {
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
+	unsigned int num_clocks;
 };
 
 struct csi_state {
 	struct device *dev;
 	void __iomem *regs;
-	unsigned int num_clks;
 	struct clk_bulk_data *clks;
 	struct reset_control *mrst;
 	struct regulator *mipi_phy_regulator;
+	const struct mipi_csis_info *info;
 	u8 index;
 
 	struct v4l2_subdev sd;
@@ -539,7 +552,8 @@ static void mipi_csis_set_params(struct csi_state *state)
 	val = mipi_csis_read(state, MIPI_CSIS_CMN_CTRL);
 	val &= ~MIPI_CSIS_CMN_CTRL_LANE_NR_MASK;
 	val |= (lanes - 1) << MIPI_CSIS_CMN_CTRL_LANE_NR_OFFSET;
-	val |= MIPI_CSIS_CMN_CTRL_INTER_MODE;
+	if (state->info->version == MIPI_CSIS_V3_3)
+		val |= MIPI_CSIS_CMN_CTRL_INTER_MODE;
 	mipi_csis_write(state, MIPI_CSIS_CMN_CTRL, val);
 
 	__mipi_csis_set_format(state);
@@ -578,12 +592,12 @@ static void mipi_csis_set_params(struct csi_state *state)
 
 static int mipi_csis_clk_enable(struct csi_state *state)
 {
-	return clk_bulk_prepare_enable(state->num_clks, state->clks);
+	return clk_bulk_prepare_enable(state->info->num_clocks, state->clks);
 }
 
 static void mipi_csis_clk_disable(struct csi_state *state)
 {
-	clk_bulk_disable_unprepare(state->num_clks, state->clks);
+	clk_bulk_disable_unprepare(state->info->num_clocks, state->clks);
 }
 
 static int mipi_csis_clk_get(struct csi_state *state)
@@ -591,17 +605,17 @@ static int mipi_csis_clk_get(struct csi_state *state)
 	unsigned int i;
 	int ret;
 
-	state->num_clks = ARRAY_SIZE(mipi_csis_clk_id);
-	state->clks = devm_kcalloc(state->dev, state->num_clks,
+	state->clks = devm_kcalloc(state->dev, state->info->num_clocks,
 				   sizeof(*state->clks), GFP_KERNEL);
 
 	if (!state->clks)
 		return -ENOMEM;
 
-	for (i = 0; i < state->num_clks; i++)
+	for (i = 0; i < state->info->num_clocks; i++)
 		state->clks[i].id = mipi_csis_clk_id[i];
 
-	ret = devm_clk_bulk_get(state->dev, state->num_clks, state->clks);
+	ret = devm_clk_bulk_get(state->dev, state->info->num_clocks,
+				state->clks);
 	if (ret < 0)
 		return ret;
 
@@ -666,16 +680,25 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
 
 static int mipi_csis_phy_enable(struct csi_state *state)
 {
+	if (state->info->version != MIPI_CSIS_V3_3)
+		return 0;
+
 	return regulator_enable(state->mipi_phy_regulator);
 }
 
 static int mipi_csis_phy_disable(struct csi_state *state)
 {
+	if (state->info->version != MIPI_CSIS_V3_3)
+		return 0;
+
 	return regulator_disable(state->mipi_phy_regulator);
 }
 
 static void mipi_csis_phy_reset(struct csi_state *state)
 {
+	if (state->info->version != MIPI_CSIS_V3_3)
+		return;
+
 	reset_control_assert(state->mrst);
 	msleep(20);
 	reset_control_deassert(state->mrst);
@@ -683,6 +706,9 @@ static void mipi_csis_phy_reset(struct csi_state *state)
 
 static int mipi_csis_phy_init(struct csi_state *state)
 {
+	if (state->info->version != MIPI_CSIS_V3_3)
+		return 0;
+
 	/* Get MIPI PHY reset and regulator. */
 	state->mrst = devm_reset_control_get_exclusive(state->dev, NULL);
 	if (IS_ERR(state->mrst))
@@ -1323,6 +1349,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	spin_lock_init(&state->slock);
 
 	state->dev = dev;
+	state->info = of_device_get_match_data(dev);
 
 	memcpy(state->events, mipi_csis_events, sizeof(state->events));
 
@@ -1431,7 +1458,19 @@ static int mipi_csis_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id mipi_csis_of_match[] = {
-	{ .compatible = "fsl,imx7-mipi-csi2", },
+	{
+		.compatible = "fsl,imx7-mipi-csi2",
+		.data = &(const struct mipi_csis_info){
+			.version = MIPI_CSIS_V3_3,
+			.num_clocks = 3,
+		},
+	}, {
+		.compatible = "fsl,imx8mm-mipi-csi2",
+		.data = &(const struct mipi_csis_info){
+			.version = MIPI_CSIS_V3_6_3,
+			.num_clocks = 4,
+		},
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mipi_csis_of_match);
@@ -1448,6 +1487,6 @@ static struct platform_driver mipi_csis_driver = {
 
 module_platform_driver(mipi_csis_driver);
 
-MODULE_DESCRIPTION("i.MX7 MIPI CSI-2 Receiver driver");
+MODULE_DESCRIPTION("i.MX7 & i.MX8 MIPI CSI-2 receiver driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:imx7-mipi-csi2");
-- 
Regards,

Laurent Pinchart

