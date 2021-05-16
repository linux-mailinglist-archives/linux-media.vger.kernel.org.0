Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4C5381BFC
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 04:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232267AbhEPCPl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 22:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232046AbhEPCMx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 22:12:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D505C061345
        for <linux-media@vger.kernel.org>; Sat, 15 May 2021 19:10:21 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF17921A4;
        Sun, 16 May 2021 03:45:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621129511;
        bh=Tt1dtEkJgHoipDqKSOpEmHKwlLmqsyj15YXaCSvBxlI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HPk7z0+g80gJ/WR94Lrc2Qvl8SvfG0VHvyB2EuWOtSwSAMKtMIwfixm0HH9qRu7Bm
         ysc3oycZZbeDWeMG1Oj6sb1LDi/G33i2TVBBTUc7ww5UZJIm3njMh9XKuux0zRM3U1
         GS24j/2hF73b74/UcFMSDTXH25nsmlks1Tbt/lz8=
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
Subject: [PATCH v2 15/25] media: imx: imx7_mipi_csis: Don't pass pdev to mipi_csis_parse_dt()
Date:   Sun, 16 May 2021 04:44:31 +0300
Message-Id: <20210516014441.5508-16-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
References: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The mipi_csis_parse_dt() function is called with a pointer to the
csi_state, which contains all the information necessary. Don't pass the
platform device pointer as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
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

