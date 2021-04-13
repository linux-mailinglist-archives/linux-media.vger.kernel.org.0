Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 191A135D548
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 04:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343559AbhDMCbj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 22:31:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35892 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343503AbhDMCbi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 22:31:38 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31C179F0;
        Tue, 13 Apr 2021 04:31:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618281078;
        bh=0gKqO5DCoDlvsuxLaHtmuPmj5Iu6/JazpcBZjdifirw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RT0sISOpkaEIq1EYqcfc+o7CPe0HMJo3EhqJvfGwwamWwTiZeCHeIWQZzHMEkJXMe
         xnp0VrUa8Daa/DnJ0NDhzp+Fnl48j9Gm6GVr+1/oU3hOIVbrhqVMYqVh9yCpwYZMHO
         cYtYu1bQ5X0f5i5sjyreoslgbnd+FmL3xiT6D/c4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>
Subject: [PATCH 15/23] media: imx: imx7_mipi_csis: Don't pass pdev to mipi_csis_parse_dt()
Date:   Tue, 13 Apr 2021 05:30:06 +0300
Message-Id: <20210413023014.28797-16-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The mipi_csis_parse_dt() function is called with a pointer to the
csi_state, which contains all the information necessary. Don't pass the
platform device pointer as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 0b164436117c..19fa4891737d 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -1283,17 +1283,16 @@ static int mipi_csis_subdev_init(struct v4l2_subdev *sd,
 				      state->pads);
 }
 
-static int mipi_csis_parse_dt(struct platform_device *pdev,
-			      struct csi_state *state)
+static int mipi_csis_parse_dt(struct csi_state *state)
 {
-	struct device_node *node = pdev->dev.of_node;
+	struct device_node *node = state->dev->of_node;
 
 	if (of_property_read_u32(node, "clock-frequency",
 				 &state->clk_frequency))
 		state->clk_frequency = DEFAULT_SCLK_CSIS_FREQ;
 
 	/* Get MIPI PHY resets */
-	state->mrst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	state->mrst = devm_reset_control_get_exclusive(state->dev, NULL);
 	if (IS_ERR(state->mrst))
 		return PTR_ERR(state->mrst);
 
@@ -1316,7 +1315,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	state->pdev = pdev;
 	state->dev = dev;
 
-	ret = mipi_csis_parse_dt(pdev, state);
+	ret = mipi_csis_parse_dt(state);
 	if (ret < 0) {
 		dev_err(dev, "Failed to parse device tree: %d\n", ret);
 		return ret;
-- 
Regards,

Laurent Pinchart

