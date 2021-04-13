Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1801935D54D
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 04:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343630AbhDMCbm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 22:31:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35890 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343539AbhDMCbl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 22:31:41 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCA788AF;
        Tue, 13 Apr 2021 04:31:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618281082;
        bh=XxqrVdeLQLW3M7ATDxLvLXeSubA4qYb6HDkhSspAruY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZM1ivtY4t8zDif8eofjVyGkYTUf3BolaRu+/8BqIXd16Obxqk004Q68ldlf2cN92e
         fPB1Y+yRArsOpjLPTcGRUyGRop2gR8Ss8rlrwPI7++XSh9cBABGbhjVLgGfodoislY
         KVoJNkXIAg9CEkchf8IJQ1+hgC3ttOFFhD5ANKTU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>
Subject: [PATCH 20/23] media: imx: imx7_mipi_csis: Reorganize mipi_csis_probe()
Date:   Tue, 13 Apr 2021 05:30:11 +0300
Message-Id: <20210413023014.28797-21-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Group the operations performed in mipi_csis_probe() logically to improve
readability.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 30 ++++++++++++++--------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 61da4db292ef..07b331667db7 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -1298,22 +1298,21 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	if (!state)
 		return -ENOMEM;
 
+	mutex_init(&state->lock);
 	spin_lock_init(&state->slock);
 
 	state->dev = dev;
 
+	memcpy(state->events, mipi_csis_events, sizeof(state->events));
+
+	/* Parse DT properties. */
 	ret = mipi_csis_parse_dt(state);
 	if (ret < 0) {
 		dev_err(dev, "Failed to parse device tree: %d\n", ret);
 		return ret;
 	}
 
-	ret = mipi_csis_phy_init(state);
-	if (ret < 0)
-		return ret;
-
-	mipi_csis_phy_reset(state);
-
+	/* Acquire resources. */
 	state->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(state->regs))
 		return PTR_ERR(state->regs);
@@ -1322,16 +1321,24 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	ret = mipi_csis_phy_init(state);
+	if (ret < 0)
+		return ret;
+
 	ret = mipi_csis_clk_get(state);
 	if (ret < 0)
 		return ret;
 
+	/* Reset PHY and enable the clocks. */
+	mipi_csis_phy_reset(state);
+
 	ret = mipi_csis_clk_enable(state);
 	if (ret < 0) {
 		dev_err(state->dev, "failed to enable clocks: %d\n", ret);
 		return ret;
 	}
 
+	/* Now that the hardware is initialized, request the interrupt. */
 	ret = devm_request_irq(dev, irq, mipi_csis_irq_handler, 0,
 			       dev_name(dev), state);
 	if (ret) {
@@ -1339,22 +1346,23 @@ static int mipi_csis_probe(struct platform_device *pdev)
 		goto disable_clock;
 	}
 
-	platform_set_drvdata(pdev, &state->sd);
-
-	mutex_init(&state->lock);
+	/* Initialize and register the subdev. */
 	ret = mipi_csis_subdev_init(state);
 	if (ret < 0)
 		goto disable_clock;
 
+	platform_set_drvdata(pdev, &state->sd);
+
 	ret = mipi_csis_async_register(state);
 	if (ret < 0) {
 		dev_err(dev, "async register failed: %d\n", ret);
 		goto cleanup;
 	}
 
-	memcpy(state->events, mipi_csis_events, sizeof(state->events));
-
+	/* Initialize debugfs. */
 	mipi_csis_debugfs_init(state);
+
+	/* Enable runtime PM. */
 	pm_runtime_enable(dev);
 	if (!pm_runtime_enabled(dev)) {
 		ret = mipi_csis_pm_resume(dev, true);
-- 
Regards,

Laurent Pinchart

