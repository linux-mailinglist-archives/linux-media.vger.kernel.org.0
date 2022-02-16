Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7FC44B92E2
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 22:04:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234338AbiBPVEj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Feb 2022 16:04:39 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234189AbiBPVEI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Feb 2022 16:04:08 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E52DF2AFE9D;
        Wed, 16 Feb 2022 13:03:54 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 567B81BF204;
        Wed, 16 Feb 2022 21:03:52 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 06/10] media: rcar-csi2: Add support for multiplexed streams
Date:   Wed, 16 Feb 2022 22:04:43 +0100
Message-Id: <20220216210447.481006-7-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220216210447.481006-1-jacopo+renesas@jmondi.org>
References: <20220216210447.481006-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Create and initialize the v4l2_subdev_state for the R-Car CSI-2 receiver
in order to prepare to support multiplexed transmitters.

Create the subdevice state with v4l2_subdev_init_finalize() and
implement the init_cfg() operation to guarantee the state is initialized
correctly with a set of default routes.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 74 ++++++++++++++++++++-
 1 file changed, 72 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index b8c56d248454..e8a79a30cc49 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -875,11 +875,73 @@ static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int rcsi2_init_cfg(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *state)
+{
+	/*
+	 * Routing is fixed for this device: which stream goes to the next
+	 * processing block (VIN) is controlled by link enablement between the
+	 * CSI-2 and the VIN itself.
+	 *
+	 * In example, to route VC 3 to VIN1, as an example: "csi2:3 -> vin1:0"
+	 *
+	 * The routing table is then fixed as streams transmitted on VC x will
+	 * be directed to csi:0/x and will be transmitted to VINs on media link
+	 * csi2:x->vin:0.
+	 */
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
+	int ret = v4l2_subdev_routing_validate_1_to_1(&routing);
+	if (ret)
+		return ret;
+
+	v4l2_subdev_lock_state(state);
+	ret = v4l2_subdev_set_routing(sd, state, &routing);
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
@@ -1494,7 +1556,8 @@ static int rcsi2_probe(struct platform_device *pdev)
 	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
 	snprintf(priv->subdev.name, V4L2_SUBDEV_NAME_SIZE, "%s %s",
 		 KBUILD_MODNAME, dev_name(&pdev->dev));
-	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
+			     V4L2_SUBDEV_FL_MULTIPLEXED;
 
 	priv->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 	priv->subdev.entity.ops = &rcar_csi2_entity_ops;
@@ -1515,14 +1578,20 @@ static int rcsi2_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
+	ret = v4l2_subdev_init_finalize(&priv->subdev);
+	if (ret)
+		goto error_async;
+
 	ret = v4l2_async_register_subdev(&priv->subdev);
 	if (ret < 0)
-		goto error_async;
+		goto error_subdev;
 
 	dev_info(priv->dev, "%d lanes found\n", priv->lanes);
 
 	return 0;
 
+error_subdev:
+	v4l2_subdev_cleanup(&priv->subdev);
 error_async:
 	v4l2_async_nf_unregister(&priv->notifier);
 	v4l2_async_nf_cleanup(&priv->notifier);
@@ -1539,6 +1608,7 @@ static int rcsi2_remove(struct platform_device *pdev)
 	v4l2_async_nf_unregister(&priv->notifier);
 	v4l2_async_nf_cleanup(&priv->notifier);
 	v4l2_async_unregister_subdev(&priv->subdev);
+	v4l2_subdev_cleanup(&priv->subdev);
 
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.35.0

