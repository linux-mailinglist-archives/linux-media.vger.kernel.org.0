Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCC130258A
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 14:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728923AbhAYNcy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 08:32:54 -0500
Received: from retiisi.eu ([95.216.213.190]:36916 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728897AbhAYNb0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 08:31:26 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 4FA12634CCC;
        Mon, 25 Jan 2021 15:25:59 +0200 (EET)
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
Subject: [PATCH v3 09/14] media: pxa-camera: Use v4l2_async_notifier_add_*_subdev
Date:   Mon, 25 Jan 2021 15:22:25 +0200
Message-Id: <20210125132230.6600-24-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125132230.6600-1-sakari.ailus@linux.intel.com>
References: <20210125132230.6600-1-sakari.ailus@linux.intel.com>
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
 drivers/media/platform/pxa_camera.c | 53 ++++++++++++-----------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
index b664ce7558a1..5d169ff7771b 100644
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
@@ -2199,11 +2197,11 @@ static int pxa_camera_resume(struct device *dev)
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
@@ -2255,13 +2253,12 @@ static int pxa_camera_pdata_from_dt(struct device *dev,
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
 
@@ -2297,18 +2294,23 @@ static int pxa_camera_probe(struct platform_device *pdev)
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
@@ -2400,19 +2402,6 @@ static int pxa_camera_probe(struct platform_device *pdev)
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
@@ -2421,6 +2410,7 @@ static int pxa_camera_probe(struct platform_device *pdev)
 			  pcdev->asd.match.i2c.adapter_id,
 			  pcdev->asd.match.i2c.address);
 
+	pcdev->notifier.ops = &pxa_camera_sensor_ops;
 	pcdev->mclk_clk = v4l2_clk_register(&pxa_camera_mclk_ops, clk_name, NULL);
 	if (IS_ERR(pcdev->mclk_clk)) {
 		err = PTR_ERR(pcdev->mclk_clk);
@@ -2436,7 +2426,6 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	v4l2_clk_unregister(pcdev->mclk_clk);
 exit_notifier_cleanup:
 	v4l2_async_notifier_cleanup(&pcdev->notifier);
-exit_free_v4l2dev:
 	v4l2_device_unregister(&pcdev->v4l2_dev);
 exit_deactivate:
 	pxa_camera_deactivate(pcdev);
-- 
2.29.2

