Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E39CB381C0B
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 04:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232339AbhEPCQl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 22:16:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35528 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232093AbhEPCND (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 22:13:03 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D895E2945;
        Sun, 16 May 2021 03:45:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621129518;
        bh=GXnbcCxqIq8U6YIpH1o8Ea0yn5/fXKQ/8bblxYX+iT4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=etOWEYt7TwFd22VURWENVJR4bJXvu3lCgtGwmXfYS8kyYd0hWApp4XYaCYPp2CUoO
         XIMjKqjv/s5RpoXtOjpP7iOmodUMYq8rBlxE4eu5eG0XeIspfGjnUMpKb1y3ToO6R6
         Nu67V3nDxFNS0njo9v1Q0c1TMlkDxABY4lFnWXjE=
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
Subject: [PATCH v2 22/25] media: imx: imx7_mipi_csis: Move PHY control to dedicated functions
Date:   Sun, 16 May 2021 04:44:38 +0300
Message-Id: <20210516014441.5508-23-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
References: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the PHY regulator and reset handling to dedicated functions. This
groups all related code together, and prepares for i.MX8 support that
doesn't require control of the PHY regulator and reset.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 64 +++++++++++++---------
 1 file changed, 38 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 6e235c86e0aa..a8da8d6ddb7d 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -457,25 +457,6 @@ static void mipi_csis_sw_reset(struct csi_state *state)
 	usleep_range(10, 20);
 }
 
-static int mipi_csis_phy_init(struct csi_state *state)
-{
-	state->mipi_phy_regulator = devm_regulator_get(state->dev, "phy");
-	if (IS_ERR(state->mipi_phy_regulator))
-		return PTR_ERR(state->mipi_phy_regulator);
-
-	return regulator_set_voltage(state->mipi_phy_regulator, 1000000,
-				     1000000);
-}
-
-static void mipi_csis_phy_reset(struct csi_state *state)
-{
-	reset_control_assert(state->mrst);
-
-	msleep(20);
-
-	reset_control_deassert(state->mrst);
-}
-
 static void mipi_csis_system_enable(struct csi_state *state, int on)
 {
 	u32 val, mask;
@@ -679,6 +660,42 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+/* -----------------------------------------------------------------------------
+ * PHY regulator and reset
+ */
+
+static int mipi_csis_phy_enable(struct csi_state *state)
+{
+	return regulator_enable(state->mipi_phy_regulator);
+}
+
+static int mipi_csis_phy_disable(struct csi_state *state)
+{
+	return regulator_disable(state->mipi_phy_regulator);
+}
+
+static void mipi_csis_phy_reset(struct csi_state *state)
+{
+	reset_control_assert(state->mrst);
+	msleep(20);
+	reset_control_deassert(state->mrst);
+}
+
+static int mipi_csis_phy_init(struct csi_state *state)
+{
+	/* Get MIPI PHY reset and regulator. */
+	state->mrst = devm_reset_control_get_exclusive(state->dev, NULL);
+	if (IS_ERR(state->mrst))
+		return PTR_ERR(state->mrst);
+
+	state->mipi_phy_regulator = devm_regulator_get(state->dev, "phy");
+	if (IS_ERR(state->mipi_phy_regulator))
+		return PTR_ERR(state->mipi_phy_regulator);
+
+	return regulator_set_voltage(state->mipi_phy_regulator, 1000000,
+				     1000000);
+}
+
 /* -----------------------------------------------------------------------------
  * Debug
  */
@@ -1178,7 +1195,7 @@ static int mipi_csis_pm_suspend(struct device *dev, bool runtime)
 	mutex_lock(&state->lock);
 	if (state->state & ST_POWERED) {
 		mipi_csis_stop_stream(state);
-		ret = regulator_disable(state->mipi_phy_regulator);
+		ret = mipi_csis_phy_disable(state);
 		if (ret)
 			goto unlock;
 		mipi_csis_clk_disable(state);
@@ -1204,7 +1221,7 @@ static int mipi_csis_pm_resume(struct device *dev, bool runtime)
 		goto unlock;
 
 	if (!(state->state & ST_POWERED)) {
-		ret = regulator_enable(state->mipi_phy_regulator);
+		ret = mipi_csis_phy_enable(state);
 		if (ret)
 			goto unlock;
 
@@ -1288,11 +1305,6 @@ static int mipi_csis_parse_dt(struct csi_state *state)
 				 &state->clk_frequency))
 		state->clk_frequency = DEFAULT_SCLK_CSIS_FREQ;
 
-	/* Get MIPI PHY resets */
-	state->mrst = devm_reset_control_get_exclusive(state->dev, NULL);
-	if (IS_ERR(state->mrst))
-		return PTR_ERR(state->mrst);
-
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart

