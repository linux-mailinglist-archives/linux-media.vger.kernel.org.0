Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01B0C54D18F
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 21:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346321AbiFOT00 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 15:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346274AbiFOT0Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 15:26:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F6B39801
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 12:26:24 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93B096BC;
        Wed, 15 Jun 2022 21:26:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655321182;
        bh=hVXytw8wuY+3GcvhQq2l0Wum1ciTw6phOszMwSDXyZc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MdCffjft1cI0YmIV1ngdjQIVgiHmKHjIp8+C6R6uv684N6C7bUGAiW2neHMtuYKPS
         3CjjIFMTYsEqt27tnUKbs3TUfFufZnykGgEj5AnoMvpLkKlZtP/c4XexFW7J2tiGWN
         wqwRTN7TlchIcedbhD4aeMXgi+qgEEabjHGDquus=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH 1/4] media: imx: imx-mipi-csis: Set the subdev fwnode for endpoint matching
Date:   Wed, 15 Jun 2022 22:25:59 +0300
Message-Id: <20220615192602.25472-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615192602.25472-1-laurent.pinchart@ideasonboard.com>
References: <20220615192602.25472-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Endpoint matching is preferred over device matching with the async
notifier framework. Set the fwnode in the v4l2_subdev for the CSIS to
the endpoint connected to the next device.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 80b1c021d14a..09a220c1bfe8 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1378,6 +1378,13 @@ static int mipi_csis_subdev_init(struct mipi_csis_device *csis)
 
 	sd->dev = csis->dev;
 
+	sd->fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev),
+						     1, 0, 0);
+	if (!sd->fwnode) {
+		dev_err(csis->dev, "Unable to retrieve endpoint for port@1\n");
+		return -ENOENT;
+	}
+
 	csis->csis_fmt = &mipi_csis_formats[0];
 	mipi_csis_init_cfg(sd, NULL);
 
@@ -1498,6 +1505,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	v4l2_async_unregister_subdev(&csis->sd);
 disable_clock:
 	mipi_csis_clk_disable(csis);
+	fwnode_handle_put(csis->sd.fwnode);
 	mutex_destroy(&csis->lock);
 
 	return ret;
@@ -1517,6 +1525,7 @@ static int mipi_csis_remove(struct platform_device *pdev)
 	mipi_csis_runtime_suspend(&pdev->dev);
 	mipi_csis_clk_disable(csis);
 	media_entity_cleanup(&csis->sd.entity);
+	fwnode_handle_put(csis->sd.fwnode);
 	mutex_destroy(&csis->lock);
 	pm_runtime_set_suspended(&pdev->dev);
 
-- 
Regards,

Laurent Pinchart

