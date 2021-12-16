Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BCA6476CCC
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 10:04:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbhLPJEA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 04:04:00 -0500
Received: from comms.puri.sm ([159.203.221.185]:54802 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230245AbhLPJEA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 04:04:00 -0500
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 71E16DFFDB;
        Thu, 16 Dec 2021 01:04:00 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vOthJcWufrZh; Thu, 16 Dec 2021 01:03:59 -0800 (PST)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     martin.kepplinger@puri.sm, festevam@gmail.com,
        laurent.pinchart@ideasonboard.com, p.zabel@pengutronix.de
Cc:     kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
        linux-imx@nxp.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        mchehab@kernel.org, slongerbeam@gmail.com, kernel@puri.sm
Subject: [PATCH v2 2/2] media: imx: imx8mq-mipi_csi2: fix system resume
Date:   Thu, 16 Dec 2021 10:03:36 +0100
Message-Id: <20211216090336.451665-3-martin.kepplinger@puri.sm>
In-Reply-To: <20211216090336.451665-1-martin.kepplinger@puri.sm>
References: <20211216090336.451665-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

during system resume, interconnect bandwidth would currently be requested
even though the device is runtime suspended. This leaves the system in an
unbalanced state.

Fix that by only doing that in runtimem pm and splitting up runtime and
system suspend to be a more readable:
imx8mq_mipi_csi_pm_*() does the generic things called from system- and
runtime functions that each do specific things on top.

Fixes: f33fd8d77dd0 ("media: imx: add a driver for i.MX8MQ mipi csi rx phy and controller")
Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 drivers/staging/media/imx/imx8mq-mipi-csi2.c | 71 +++++++++++++-------
 1 file changed, 47 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
index 8f3cc138c52c..3b9fa75efac6 100644
--- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
@@ -693,7 +693,7 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
  * Suspend/resume
  */
 
-static int imx8mq_mipi_csi_pm_suspend(struct device *dev, bool runtime)
+static int imx8mq_mipi_csi_pm_suspend(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct csi_state *state = mipi_sd_to_csi2_state(sd);
@@ -705,36 +705,21 @@ static int imx8mq_mipi_csi_pm_suspend(struct device *dev, bool runtime)
 		imx8mq_mipi_csi_stop_stream(state);
 		imx8mq_mipi_csi_clk_disable(state);
 		state->state &= ~ST_POWERED;
-		if (!runtime)
-			state->state |= ST_SUSPENDED;
 	}
 
 	mutex_unlock(&state->lock);
 
-	ret = icc_set_bw(state->icc_path, 0, 0);
-	if (ret)
-		dev_err(dev, "icc_set_bw failed with %d\n", ret);
-
 	return ret ? -EAGAIN : 0;
 }
 
-static int imx8mq_mipi_csi_pm_resume(struct device *dev, bool runtime)
+static int imx8mq_mipi_csi_pm_resume(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct csi_state *state = mipi_sd_to_csi2_state(sd);
 	int ret = 0;
 
-	ret = icc_set_bw(state->icc_path, 0, state->icc_path_bw);
-	if (ret) {
-		dev_err(dev, "icc_set_bw failed with %d\n", ret);
-		return ret;
-	}
-
 	mutex_lock(&state->lock);
 
-	if (!runtime && !(state->state & ST_SUSPENDED))
-		goto unlock;
-
 	if (!(state->state & ST_POWERED)) {
 		state->state |= ST_POWERED;
 		ret = imx8mq_mipi_csi_clk_enable(state);
@@ -755,22 +740,60 @@ static int imx8mq_mipi_csi_pm_resume(struct device *dev, bool runtime)
 
 static int __maybe_unused imx8mq_mipi_csi_suspend(struct device *dev)
 {
-	return imx8mq_mipi_csi_pm_suspend(dev, false);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct csi_state *state = mipi_sd_to_csi2_state(sd);
+	int ret;
+
+	ret = imx8mq_mipi_csi_pm_suspend(dev);
+	if (ret)
+		return ret;
+
+	state->state |= ST_SUSPENDED;
+
+	return ret;
 }
 
 static int __maybe_unused imx8mq_mipi_csi_resume(struct device *dev)
 {
-	return imx8mq_mipi_csi_pm_resume(dev, false);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct csi_state *state = mipi_sd_to_csi2_state(sd);
+
+	if (!(state->state & ST_SUSPENDED))
+		return 0;
+
+	return imx8mq_mipi_csi_pm_resume(dev);
 }
 
 static int __maybe_unused imx8mq_mipi_csi_runtime_suspend(struct device *dev)
 {
-	return imx8mq_mipi_csi_pm_suspend(dev, true);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct csi_state *state = mipi_sd_to_csi2_state(sd);
+	int ret;
+
+	ret = imx8mq_mipi_csi_pm_suspend(dev);
+	if (ret)
+		return ret;
+
+	ret = icc_set_bw(state->icc_path, 0, 0);
+	if (ret)
+		dev_err(dev, "icc_set_bw failed with %d\n", ret);
+
+	return ret;
 }
 
 static int __maybe_unused imx8mq_mipi_csi_runtime_resume(struct device *dev)
 {
-	return imx8mq_mipi_csi_pm_resume(dev, true);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct csi_state *state = mipi_sd_to_csi2_state(sd);
+	int ret;
+
+	ret = icc_set_bw(state->icc_path, 0, state->icc_path_bw);
+	if (ret) {
+		dev_err(dev, "icc_set_bw failed with %d\n", ret);
+		return ret;
+	}
+
+	return imx8mq_mipi_csi_pm_resume(dev);
 }
 
 static const struct dev_pm_ops imx8mq_mipi_csi_pm_ops = {
@@ -918,7 +941,7 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 	/* Enable runtime PM. */
 	pm_runtime_enable(dev);
 	if (!pm_runtime_enabled(dev)) {
-		ret = imx8mq_mipi_csi_pm_resume(dev, true);
+		ret = imx8mq_mipi_csi_runtime_resume(dev);
 		if (ret < 0)
 			goto icc;
 	}
@@ -931,7 +954,7 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 
 cleanup:
 	pm_runtime_disable(&pdev->dev);
-	imx8mq_mipi_csi_pm_suspend(&pdev->dev, true);
+	imx8mq_mipi_csi_runtime_suspend(&pdev->dev);
 
 	media_entity_cleanup(&state->sd.entity);
 	v4l2_async_nf_unregister(&state->notifier);
@@ -955,7 +978,7 @@ static int imx8mq_mipi_csi_remove(struct platform_device *pdev)
 	v4l2_async_unregister_subdev(&state->sd);
 
 	pm_runtime_disable(&pdev->dev);
-	imx8mq_mipi_csi_pm_suspend(&pdev->dev, true);
+	imx8mq_mipi_csi_runtime_suspend(&pdev->dev);
 	media_entity_cleanup(&state->sd.entity);
 	mutex_destroy(&state->lock);
 	pm_runtime_set_suspended(&pdev->dev);
-- 
2.30.2

