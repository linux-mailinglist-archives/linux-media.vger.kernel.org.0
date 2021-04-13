Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4C0035D54A
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 04:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343585AbhDMCbk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 22:31:40 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35892 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343551AbhDMCbj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 22:31:39 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99BEFACC;
        Tue, 13 Apr 2021 04:31:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618281080;
        bh=IMIAIt7sZIv6xZY4PZxY+ntJfOAk3liPPGD8NNn1kWU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KEzYKpvXHTMNyPSHPxG9wkvOeLV6VHDYG3bOfQImCXV92xt+Ung+G7+c7Pwzd/FeM
         dxK8u2ttUGkXmsr4rvp5DstRMbCc+9D1mEXUFCMuU84gANsLlB7wSOcerbVKCOv7vq
         z+e0EUg13m6mfHnWv7+rIJKRhFZsfEFHt/TqvrgM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>
Subject: [PATCH 17/23] media: imx: imx7_mipi_csis: Drop csi_state pdev field
Date:   Tue, 13 Apr 2021 05:30:08 +0300
Message-Id: <20210413023014.28797-18-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pdev field of the csi_state structure is only used to access the
device pointer, which is stored in a separate field. Drop the pdev
field, as well as a few local dev variables.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 32 ++++++++++------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 2548f6442619..1cb8eeb2fdac 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -303,7 +303,6 @@ struct csi_state {
 	struct v4l2_subdev *src_sd;
 
 	u8 index;
-	struct platform_device *pdev;
 	void __iomem *regs;
 	u32 state;
 
@@ -615,13 +614,12 @@ static void mipi_csis_clk_disable(struct csi_state *state)
 
 static int mipi_csis_clk_get(struct csi_state *state)
 {
-	struct device *dev = &state->pdev->dev;
 	unsigned int i;
 	int ret;
 
 	state->num_clks = ARRAY_SIZE(mipi_csis_clk_id);
-	state->clks = devm_kcalloc(dev, state->num_clks, sizeof(*state->clks),
-				   GFP_KERNEL);
+	state->clks = devm_kcalloc(state->dev, state->num_clks,
+				   sizeof(*state->clks), GFP_KERNEL);
 
 	if (!state->clks)
 		return -ENOMEM;
@@ -629,7 +627,7 @@ static int mipi_csis_clk_get(struct csi_state *state)
 	for (i = 0; i < state->num_clks; i++)
 		state->clks[i].id = mipi_csis_clk_id[i];
 
-	ret = devm_clk_bulk_get(dev, state->num_clks, state->clks);
+	ret = devm_clk_bulk_get(state->dev, state->num_clks, state->clks);
 	if (ret < 0)
 		return ret;
 
@@ -637,8 +635,8 @@ static int mipi_csis_clk_get(struct csi_state *state)
 	ret = clk_set_rate(state->clks[MIPI_CSIS_CLK_WRAP].clk,
 			   state->clk_frequency);
 	if (ret < 0)
-		dev_err(dev, "set rate=%d failed: %d\n", state->clk_frequency,
-			ret);
+		dev_err(state->dev, "set rate=%d failed: %d\n",
+			state->clk_frequency, ret);
 
 	return ret;
 }
@@ -707,7 +705,6 @@ static void mipi_csis_log_counters(struct csi_state *state, bool non_errors)
 {
 	unsigned int num_events = non_errors ? MIPI_CSIS_NUM_EVENTS
 				: MIPI_CSIS_NUM_EVENTS - 8;
-	struct device *dev = &state->pdev->dev;
 	unsigned long flags;
 	unsigned int i;
 
@@ -715,7 +712,8 @@ static void mipi_csis_log_counters(struct csi_state *state, bool non_errors)
 
 	for (i = 0; i < num_events; ++i) {
 		if (state->events[i].counter > 0 || state->debug)
-			dev_info(dev, "%s events: %d\n", state->events[i].name,
+			dev_info(state->dev, "%s events: %d\n",
+				 state->events[i].name,
 				 state->events[i].counter);
 	}
 	spin_unlock_irqrestore(&state->slock, flags);
@@ -741,15 +739,14 @@ static int mipi_csis_dump_regs(struct csi_state *state)
 		{ MIPI_CSIS_DBG_CTRL, "DBG_CTRL" },
 	};
 
-	struct device *dev = &state->pdev->dev;
 	unsigned int i;
 	u32 cfg;
 
-	dev_info(dev, "--- REGISTERS ---\n");
+	dev_info(state->dev, "--- REGISTERS ---\n");
 
 	for (i = 0; i < ARRAY_SIZE(registers); i++) {
 		cfg = mipi_csis_read(state, registers[i].offset);
-		dev_info(dev, "%14s: 0x%08x\n", registers[i].name, cfg);
+		dev_info(state->dev, "%14s: 0x%08x\n", registers[i].name, cfg);
 	}
 
 	return 0;
@@ -799,9 +796,9 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 
 		mipi_csis_clear_counters(state);
 
-		ret = pm_runtime_get_sync(&state->pdev->dev);
+		ret = pm_runtime_get_sync(state->dev);
 		if (ret < 0) {
-			pm_runtime_put_noidle(&state->pdev->dev);
+			pm_runtime_put_noidle(state->dev);
 			return ret;
 		}
 		ret = v4l2_subdev_call(state->src_sd, core, s_power, 1);
@@ -841,7 +838,7 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 
 done:
 	if (!enable || ret < 0)
-		pm_runtime_put(&state->pdev->dev);
+		pm_runtime_put(state->dev);
 
 	return ret;
 }
@@ -1310,7 +1307,6 @@ static int mipi_csis_probe(struct platform_device *pdev)
 
 	spin_lock_init(&state->slock);
 
-	state->pdev = pdev;
 	state->dev = dev;
 
 	ret = mipi_csis_parse_dt(state);
@@ -1359,7 +1355,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
 
 	ret = mipi_csis_async_register(state);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "async register failed: %d\n", ret);
+		dev_err(dev, "async register failed: %d\n", ret);
 		goto cleanup;
 	}
 
@@ -1373,7 +1369,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
 			goto unregister_all;
 	}
 
-	dev_info(&pdev->dev, "lanes: %d, freq: %u\n",
+	dev_info(dev, "lanes: %d, freq: %u\n",
 		 state->bus.num_data_lanes, state->clk_frequency);
 
 	return 0;
-- 
Regards,

Laurent Pinchart

