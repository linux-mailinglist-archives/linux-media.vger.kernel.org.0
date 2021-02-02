Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01B5930C099
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 15:03:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233384AbhBBOCg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 09:02:36 -0500
Received: from retiisi.eu ([95.216.213.190]:45566 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233518AbhBBOBh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 09:01:37 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 53738634CA9;
        Tue,  2 Feb 2021 15:56:09 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v5 09/13] media: pxa-camera: Use v4l2_async_notifier_add_*_subdev
Date:   Tue,  2 Feb 2021 15:56:07 +0200
Message-Id: <20210202135611.13920-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202135611.13920-1-sakari.ailus@linux.intel.com>
References: <20210202135611.13920-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ezequiel Garcia <ezequiel@collabora.com>

The use of v4l2_async_notifier_add_subdev will be discouraged.
Drivers are instead encouraged to use a helper such as
v4l2_async_notifier_add_fwnode_remote_subdev.

This fixes a misuse of the API, as v4l2_async_notifier_add_subdev
should get a kmalloc'ed struct v4l2_async_subdev.

Use the appropriate helper: v4l2_async_notifier_add_i2c_subdev
or v4l2_async_notifier_add_fwnode_remote_subdev, which handles
the needed setup, instead of open-coding it.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/pxa_camera.c | 57 ++++++++++++-----------------
 1 file changed, 23 insertions(+), 34 deletions(-)

diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
index 75fad9689c90..b579ce2e93b6 100644
--- a/drivers/media/platform/pxa_camera.c
+++ b/drivers/media/platform/pxa_camera.c
@@ -656,8 +656,6 @@ struct pxa_camera_dev {
 	const struct pxa_camera_format_xlate *current_fmt;
 	struct v4l2_pix_format	current_pix;
 
-	struct v4l2_async_subdev asd;
-
 	/*
 	 * PXA27x is only supposed to handle one camera on its Quick Capture
 	 * interface. If anyone ever builds hardware to enable more than
@@ -2202,11 +2200,11 @@ static int pxa_camera_resume(struct device *dev)
 }
 
 static int pxa_camera_pdata_from_dt(struct device *dev,
-				    struct pxa_camera_dev *pcdev,
-				    struct v4l2_async_subdev *asd)
+				    struct pxa_camera_dev *pcdev)
 {
 	u32 mclk_rate;
-	struct device_node *remote, *np = dev->of_node;
+	struct v4l2_async_subdev *asd;
+	struct device_node *np = dev->of_node;
 	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
 	int err = of_property_read_u32(np, "clock-frequency",
 				       &mclk_rate);
@@ -2258,13 +2256,12 @@ static int pxa_camera_pdata_from_dt(struct device *dev,
 	if (ep.bus.parallel.flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
 		pcdev->platform_flags |= PXA_CAMERA_PCLK_EN;
 
-	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
-	remote = of_graph_get_remote_port_parent(np);
-	if (remote)
-		asd->match.fwnode = of_fwnode_handle(remote);
-	else
-		dev_notice(dev, "no remote for %pOF\n", np);
-
+	asd = v4l2_async_notifier_add_fwnode_remote_subdev(
+				&pcdev->notifier,
+				of_fwnode_handle(np),
+				sizeof(*asd));
+	if (IS_ERR(asd))
+		err = PTR_ERR(asd);
 out:
 	of_node_put(np);
 
@@ -2300,18 +2297,23 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	if (IS_ERR(pcdev->clk))
 		return PTR_ERR(pcdev->clk);
 
+	v4l2_async_notifier_init(&pcdev->notifier);
 	pcdev->res = res;
-
 	pcdev->pdata = pdev->dev.platform_data;
 	if (pcdev->pdata) {
+		struct v4l2_async_subdev *asd;
+
 		pcdev->platform_flags = pcdev->pdata->flags;
 		pcdev->mclk = pcdev->pdata->mclk_10khz * 10000;
-		pcdev->asd.match_type = V4L2_ASYNC_MATCH_I2C;
-		pcdev->asd.match.i2c.adapter_id =
-			pcdev->pdata->sensor_i2c_adapter_id;
-		pcdev->asd.match.i2c.address = pcdev->pdata->sensor_i2c_address;
+		asd = v4l2_async_notifier_add_i2c_subdev(
+				&pcdev->notifier,
+				pcdev->pdata->sensor_i2c_adapter_id,
+				pcdev->pdata->sensor_i2c_address,
+				sizeof(*asd));
+		if (IS_ERR(asd))
+			err = PTR_ERR(asd);
 	} else if (pdev->dev.of_node) {
-		err = pxa_camera_pdata_from_dt(&pdev->dev, pcdev, &pcdev->asd);
+		err = pxa_camera_pdata_from_dt(&pdev->dev, pcdev);
 	} else {
 		return -ENODEV;
 	}
@@ -2403,27 +2405,15 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	if (err)
 		goto exit_deactivate;
 
-	v4l2_async_notifier_init(&pcdev->notifier);
-
-	err = v4l2_async_notifier_add_subdev(&pcdev->notifier, &pcdev->asd);
-	if (err) {
-		fwnode_handle_put(pcdev->asd.match.fwnode);
-		goto exit_free_v4l2dev;
-	}
-
-	pcdev->notifier.ops = &pxa_camera_sensor_ops;
-
-	if (!of_have_populated_dt())
-		pcdev->asd.match_type = V4L2_ASYNC_MATCH_I2C;
-
 	err = pxa_camera_init_videobuf2(pcdev);
 	if (err)
 		goto exit_notifier_cleanup;
 
 	v4l2_clk_name_i2c(clk_name, sizeof(clk_name),
-			  pcdev->asd.match.i2c.adapter_id,
-			  pcdev->asd.match.i2c.address);
+			  pcdev->pdata->sensor_i2c_adapter_id,
+			  pcdev->pdata->sensor_i2c_address);
 
+	pcdev->notifier.ops = &pxa_camera_sensor_ops;
 	pcdev->mclk_clk = v4l2_clk_register(&pxa_camera_mclk_ops, clk_name, NULL);
 	if (IS_ERR(pcdev->mclk_clk)) {
 		err = PTR_ERR(pcdev->mclk_clk);
@@ -2439,7 +2429,6 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	v4l2_clk_unregister(pcdev->mclk_clk);
 exit_notifier_cleanup:
 	v4l2_async_notifier_cleanup(&pcdev->notifier);
-exit_free_v4l2dev:
 	v4l2_device_unregister(&pcdev->v4l2_dev);
 exit_deactivate:
 	pxa_camera_deactivate(pcdev);
-- 
2.29.2

