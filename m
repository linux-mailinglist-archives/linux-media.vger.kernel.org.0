Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3F0431B4D1
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbhBOEjo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:39:44 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46076 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbhBOEjg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:39:36 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E7CC1BFE;
        Mon, 15 Feb 2021 05:29:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363341;
        bh=Q6z3h9gXpjPTijVBLareKJb/Swh9GmYatVa/7my3lgw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q7mHzY1noUiWWxIw0zqSjSHDQyTLy6UaQTXN6NUK0cqWnBs99hUm3d8kVYnpnrv16
         Qhse6ikbZnzGS59aWZnRbJOjqNCsAuO+2TVRmi6ehOeUcGDPXcTQE1Egw/IkWPDfN2
         6D56gHLg0Ap6ppawqlwXpLP0ZSfXLBLtzWpSZQWM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 65/77] media: imx: imx7_mipi_csis: Avoid double get of wrap clock
Date:   Mon, 15 Feb 2021 06:27:29 +0200
Message-Id: <20210215042741.28850-66-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The wrap clock is retrieved with the other clocks using
devm_clk_bulk_get(), and retrieved independently with a specific
devm_clk_get() call. The latter isn't needed, replace it with usage of
the wrap clock from the bulk array.

As the wrap clock is mandatory, simplify its usage further by removing
conditionals.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 31 +++++++++++-----------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index c153a77c3784..816650c438aa 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -206,7 +206,17 @@ static const struct mipi_csis_event mipi_csis_events[] = {
 
 #define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
 
-static const char * const mipi_csis_clk_id[] = {"pclk", "wrap", "phy"};
+enum mipi_csis_clk {
+	MIPI_CSIS_CLK_PCLK,
+	MIPI_CSIS_CLK_WRAP,
+	MIPI_CSIS_CLK_PHY,
+};
+
+static const char * const mipi_csis_clk_id[] = {
+	"pclk",
+	"wrap",
+	"phy",
+};
 
 struct csis_hw_reset {
 	struct regmap *src;
@@ -229,7 +239,6 @@ struct csi_state {
 	struct platform_device *pdev;
 	struct phy *phy;
 	void __iomem *regs;
-	struct clk *wrap_clk;
 	int irq;
 	u32 flags;
 
@@ -507,12 +516,7 @@ static void mipi_csis_set_params(struct csi_state *state)
 	mipi_csis_write(state, MIPI_CSIS_ISPSYNC_CH0, val);
 
 	val = mipi_csis_read(state, MIPI_CSIS_CLK_CTRL);
-	val &= ~MIPI_CSIS_CLK_CTRL_WCLK_SRC;
-	if (state->wrap_clk)
-		val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC;
-	else
-		val &= ~MIPI_CSIS_CLK_CTRL_WCLK_SRC;
-
+	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC;
 	val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH0(15);
 	val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MSK;
 	mipi_csis_write(state, MIPI_CSIS_CLK_CTRL, val);
@@ -557,12 +561,9 @@ static int mipi_csis_clk_get(struct csi_state *state)
 	if (ret < 0)
 		return ret;
 
-	state->wrap_clk = devm_clk_get(dev, "wrap");
-	if (IS_ERR(state->wrap_clk))
-		return PTR_ERR(state->wrap_clk);
-
 	/* Set clock rate */
-	ret = clk_set_rate(state->wrap_clk, state->clk_frequency);
+	ret = clk_set_rate(state->clks[MIPI_CSIS_CLK_WRAP].clk,
+			   state->clk_frequency);
 	if (ret < 0)
 		dev_err(dev, "set rate=%d failed: %d\n", state->clk_frequency,
 			ret);
@@ -1149,9 +1150,9 @@ static int mipi_csis_probe(struct platform_device *pdev)
 			goto unregister_all;
 	}
 
-	dev_info(&pdev->dev, "lanes: %d, hs_settle: %d, wclk: %d, freq: %u\n",
+	dev_info(&pdev->dev, "lanes: %d, hs_settle: %d, freq: %u\n",
 		 state->bus.num_data_lanes, state->hs_settle,
-		 state->wrap_clk ? 1 : 0, state->clk_frequency);
+		 state->clk_frequency);
 
 	return 0;
 
-- 
Regards,

Laurent Pinchart

