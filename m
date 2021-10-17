Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB682430B78
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 20:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344280AbhJQS0g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 14:26:36 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:42113 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344139AbhJQS0f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 14:26:35 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 479E9200003;
        Sun, 17 Oct 2021 18:24:23 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        kieran.bingham@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 08/13] media: rcar-csi2: Add support for v4l2_subdev_state
Date:   Sun, 17 Oct 2021 20:24:44 +0200
Message-Id: <20211017182449.64192-9-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
References: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Create and initialize the v4l2_subdev_state for the R-Car CSI-2 receiver
rder to prepare to support routing operations and multiplexed streams.

Create the subdevice state with v4l2_subdev_init_finalize() and
implement the init_cfg() operation to guarantee the state is initialized
correctly with a set of default routes.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 68 ++++++++++++++++++++-
 1 file changed, 66 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index e28eff039688..a74087b49e71 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -752,11 +752,65 @@ static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int rcsi2_init_cfg(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *state)
+{
+	/* Initialize 4 routes from each source pad to the single sink pad. */
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = RCAR_CSI2_SINK,
+			.sink_stream = 0,
+			.source_pad = RCAR_CSI2_SOURCE_VC0,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+		{
+			.sink_pad = RCAR_CSI2_SINK,
+			.sink_stream = 1,
+			.source_pad = RCAR_CSI2_SOURCE_VC1,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+		{
+			.sink_pad = RCAR_CSI2_SINK,
+			.sink_stream = 2,
+			.source_pad = RCAR_CSI2_SOURCE_VC2,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+		{
+			.sink_pad = RCAR_CSI2_SINK,
+			.sink_stream = 3,
+			.source_pad = RCAR_CSI2_SOURCE_VC3,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	int ret = v4l2_routing_simple_verify(&routing);
+	if (ret)
+		return ret;
+
+	state = v4l2_subdev_validate_and_lock_state(sd, state);
+
+	ret = v4l2_subdev_set_routing(sd, state, &routing);
+
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
 static const struct v4l2_subdev_video_ops rcar_csi2_video_ops = {
 	.s_stream = rcsi2_s_stream,
 };
 
 static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
+	.init_cfg = rcsi2_init_cfg,
 	.set_fmt = rcsi2_set_pad_format,
 	.get_fmt = rcsi2_get_pad_format,
 };
@@ -1260,7 +1314,8 @@ static int rcsi2_probe(struct platform_device *pdev)
 	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
 	snprintf(priv->subdev.name, V4L2_SUBDEV_NAME_SIZE, "%s %s",
 		 KBUILD_MODNAME, dev_name(&pdev->dev));
-	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
+			     V4L2_SUBDEV_FL_MULTIPLEXED;
 
 	priv->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 	priv->subdev.entity.ops = &rcar_csi2_entity_ops;
@@ -1276,14 +1331,22 @@ static int rcsi2_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
+	ret = v4l2_subdev_init_finalize(&priv->subdev);
+	if (ret)
+		goto error_pm;
+
 	ret = v4l2_async_register_subdev(&priv->subdev);
 	if (ret < 0)
-		goto error;
+		goto error_subdev;
 
 	dev_info(priv->dev, "%d lanes found\n", priv->lanes);
 
 	return 0;
 
+error_subdev:
+	v4l2_subdev_cleanup(&priv->subdev);
+error_pm:
+	pm_runtime_disable(&pdev->dev);
 error:
 	v4l2_async_notifier_unregister(&priv->notifier);
 	v4l2_async_notifier_cleanup(&priv->notifier);
@@ -1298,6 +1361,7 @@ static int rcsi2_remove(struct platform_device *pdev)
 	v4l2_async_notifier_unregister(&priv->notifier);
 	v4l2_async_notifier_cleanup(&priv->notifier);
 	v4l2_async_unregister_subdev(&priv->subdev);
+	v4l2_subdev_cleanup(&priv->subdev);
 
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.33.0

