Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 736644D62AF
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 14:56:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349004AbiCKN5D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 08:57:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344749AbiCKN5C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 08:57:02 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD9961C4B2A
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 05:55:59 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9709D488;
        Fri, 11 Mar 2022 14:55:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647006957;
        bh=J+AB8EiazSnRhLfMxfa5C/SShBIEDTlbjblIHA3VX5g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XOw76p/RdoTC2EIPQqcQw25VHL8o2+JoGFmixhJ90olUdeN05QCdbfJZJPzp9sZOg
         8Zqk54moAopaEWRiZjyyRdJgHSSADt/0jQ5B94FVecn2S7jrIB5KzgEpa7L/3jATKu
         nMqeeX4lDf1QwXbppRu2RZcUJQTpxjMdp+2QXk/Q=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, Jacopo Mondi <jacopo@jmondi.org>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 2/4] media: imx: imx-mipi-csis: Drop unneeded system PM implementation
Date:   Fri, 11 Mar 2022 15:55:33 +0200
Message-Id: <20220311135535.30108-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220311135535.30108-1-laurent.pinchart@ideasonboard.com>
References: <20220311135535.30108-1-laurent.pinchart@ideasonboard.com>
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

There's no need to implement system suspend/resume manually, as video
pipelines are supposed to be suspended in a controlled and ordered
manner by the data sink driver at system suspend time (and similarly at
resume time). Drop the system suspend/resume handlers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/imx/imx-mipi-csis.c | 48 +++-------------------
 1 file changed, 5 insertions(+), 43 deletions(-)

diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
index 6e06d19c1334..3bdfe05a6c54 100644
--- a/drivers/media/platform/imx/imx-mipi-csis.c
+++ b/drivers/media/platform/imx/imx-mipi-csis.c
@@ -250,8 +250,6 @@
 
 enum {
 	ST_POWERED	= 1,
-	ST_STREAMING	= 2,
-	ST_SUSPENDED	= 4,
 };
 
 struct mipi_csis_event {
@@ -954,24 +952,17 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 	mutex_lock(&csis->lock);
 
 	if (enable) {
-		if (csis->state & ST_SUSPENDED) {
-			ret = -EBUSY;
-			goto unlock;
-		}
-
 		mipi_csis_start_stream(csis);
 		ret = v4l2_subdev_call(csis->src_sd, video, s_stream, 1);
 		if (ret < 0)
 			goto unlock;
 
 		mipi_csis_log_counters(csis, true);
-
-		csis->state |= ST_STREAMING;
 	} else {
 		v4l2_subdev_call(csis->src_sd, video, s_stream, 0);
 
 		mipi_csis_stop_stream(csis);
-		csis->state &= ~ST_STREAMING;
+
 		if (csis->debug.enable)
 			mipi_csis_log_counters(csis, true);
 	}
@@ -1356,7 +1347,7 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
  * Suspend/resume
  */
 
-static int mipi_csis_pm_suspend(struct device *dev, bool runtime)
+static int __maybe_unused mipi_csis_runtime_suspend(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
@@ -1370,8 +1361,6 @@ static int mipi_csis_pm_suspend(struct device *dev, bool runtime)
 			goto unlock;
 		mipi_csis_clk_disable(csis);
 		csis->state &= ~ST_POWERED;
-		if (!runtime)
-			csis->state |= ST_SUSPENDED;
 	}
 
 unlock:
@@ -1380,15 +1369,13 @@ static int mipi_csis_pm_suspend(struct device *dev, bool runtime)
 	return ret ? -EAGAIN : 0;
 }
 
-static int mipi_csis_pm_resume(struct device *dev, bool runtime)
+static int __maybe_unused mipi_csis_runtime_resume(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
 	int ret = 0;
 
 	mutex_lock(&csis->lock);
-	if (!runtime && !(csis->state & ST_SUSPENDED))
-		goto unlock;
 
 	if (!(csis->state & ST_POWERED)) {
 		ret = mipi_csis_phy_enable(csis);
@@ -1398,10 +1385,6 @@ static int mipi_csis_pm_resume(struct device *dev, bool runtime)
 		csis->state |= ST_POWERED;
 		mipi_csis_clk_enable(csis);
 	}
-	if (csis->state & ST_STREAMING)
-		mipi_csis_start_stream(csis);
-
-	csis->state &= ~ST_SUSPENDED;
 
 unlock:
 	mutex_unlock(&csis->lock);
@@ -1409,30 +1392,9 @@ static int mipi_csis_pm_resume(struct device *dev, bool runtime)
 	return ret ? -EAGAIN : 0;
 }
 
-static int __maybe_unused mipi_csis_suspend(struct device *dev)
-{
-	return mipi_csis_pm_suspend(dev, false);
-}
-
-static int __maybe_unused mipi_csis_resume(struct device *dev)
-{
-	return mipi_csis_pm_resume(dev, false);
-}
-
-static int __maybe_unused mipi_csis_runtime_suspend(struct device *dev)
-{
-	return mipi_csis_pm_suspend(dev, true);
-}
-
-static int __maybe_unused mipi_csis_runtime_resume(struct device *dev)
-{
-	return mipi_csis_pm_resume(dev, true);
-}
-
 static const struct dev_pm_ops mipi_csis_pm_ops = {
 	SET_RUNTIME_PM_OPS(mipi_csis_runtime_suspend, mipi_csis_runtime_resume,
 			   NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(mipi_csis_suspend, mipi_csis_resume)
 };
 
 /* -----------------------------------------------------------------------------
@@ -1557,7 +1519,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	/* Enable runtime PM. */
 	pm_runtime_enable(dev);
 	if (!pm_runtime_enabled(dev)) {
-		ret = mipi_csis_pm_resume(dev, true);
+		ret = mipi_csis_runtime_resume(dev);
 		if (ret < 0)
 			goto unregister_all;
 	}
@@ -1592,7 +1554,7 @@ static int mipi_csis_remove(struct platform_device *pdev)
 	v4l2_async_unregister_subdev(&csis->sd);
 
 	pm_runtime_disable(&pdev->dev);
-	mipi_csis_pm_suspend(&pdev->dev, true);
+	mipi_csis_runtime_suspend(&pdev->dev);
 	mipi_csis_clk_disable(csis);
 	media_entity_cleanup(&csis->sd.entity);
 	mutex_destroy(&csis->lock);
-- 
Regards,

Laurent Pinchart

