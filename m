Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA01381BFF
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 04:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232263AbhEPCQW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 22:16:22 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35528 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbhEPCND (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 22:13:03 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A554F2461;
        Sun, 16 May 2021 03:45:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621129512;
        bh=cXOX98ReXCZc1pZx6cT/cM4vBVvwiC0lUcy+Vfl5K00=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YCgyi+24Qwf4+wTWzPozbsECnDRbKYvfdFXmc3/Dr/818afhSejcR0USMvQSaI8DN
         89iIUiw8kQEeSJqeB++h1hqbuMHcEQ5rY4EpTZk7yuzOGMBiXs0sshBRioT9laIP/l
         UGcdSI/c049Lcb09EgehLCIBD87wZSJLfhyhD3KQ=
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
Subject: [PATCH v2 16/25] media: imx: imx7_mipi_csis: Pass csi_state to mipi_csis_subdev_init()
Date:   Sun, 16 May 2021 04:44:32 +0300
Message-Id: <20210516014441.5508-17-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
References: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Pass the csi_state pointer to the mipi_csis_subdev_init() function,
instead of miscellaneous information scattered in different arguments.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 19fa4891737d..2548f6442619 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -1253,13 +1253,11 @@ static const struct dev_pm_ops mipi_csis_pm_ops = {
  * Probe/remove & platform driver
  */
 
-static int mipi_csis_subdev_init(struct v4l2_subdev *sd,
-				 struct platform_device *pdev,
-				 const struct v4l2_subdev_ops *ops)
+static int mipi_csis_subdev_init(struct csi_state *state)
 {
-	struct csi_state *state = mipi_sd_to_csis_state(sd);
+	struct v4l2_subdev *sd = &state->sd;
 
-	v4l2_subdev_init(sd, ops);
+	v4l2_subdev_init(sd, &mipi_csis_subdev_ops);
 	sd->owner = THIS_MODULE;
 	snprintf(sd->name, sizeof(sd->name), "%s.%d",
 		 CSIS_SUBDEV_NAME, state->index);
@@ -1270,7 +1268,7 @@ static int mipi_csis_subdev_init(struct v4l2_subdev *sd,
 	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	sd->entity.ops = &mipi_csis_entity_ops;
 
-	sd->dev = &pdev->dev;
+	sd->dev = state->dev;
 
 	state->csis_fmt = &mipi_csis_formats[0];
 	mipi_csis_init_cfg(sd, NULL);
@@ -1355,8 +1353,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, &state->sd);
 
 	mutex_init(&state->lock);
-	ret = mipi_csis_subdev_init(&state->sd, pdev,
-				    &mipi_csis_subdev_ops);
+	ret = mipi_csis_subdev_init(state);
 	if (ret < 0)
 		goto disable_clock;
 
-- 
Regards,

Laurent Pinchart

