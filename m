Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD4EB3A651A
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236549AbhFNLdg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235547AbhFNLbe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:31:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D0A7C06114C
        for <linux-media@vger.kernel.org>; Mon, 14 Jun 2021 04:26:07 -0700 (PDT)
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12C1621AA;
        Mon, 14 Jun 2021 13:24:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669843;
        bh=cqBJNRiCh1KisRXYeQzvfy60Px5qWjIFJvVO75jYHtU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cry/M3s8irLZRxc4mNcrJqonFiqzpWLBxkOwbamrg7fBD1PDSy7HyXAM2PhoJkA2p
         9OCMkCOb6/7TGrIeJwyxKx8EZFQsKJjf1P2qUTWk2S32yeyhQcptTgMAe4/iRvPdo8
         4jUdnw4vcKcS7f0dC8C1tCS1G1dXs/Wxh7MrEkHE=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 04/35] media: ti-vpe: cal: rename "sensor" to "source"
Date:   Mon, 14 Jun 2021 14:23:14 +0300
Message-Id: <20210614112345.2032435-5-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CAL driver uses "sensor" name to refer to the subdev connected to CAL.
As the subdev can also be a bridge, the naming is misleading and might
cause the reader to think it refers to the actual sensor at the end of
the pipeline.

Rename "sensor" to "source".

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 34 ++++++++++----------
 drivers/media/platform/ti-vpe/cal-video.c    | 26 +++++++--------
 drivers/media/platform/ti-vpe/cal.c          | 20 ++++++------
 drivers/media/platform/ti-vpe/cal.h          |  6 ++--
 4 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index e2e384a887ac..92d39ef45625 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -50,15 +50,15 @@ static s64 cal_camerarx_get_external_rate(struct cal_camerarx *phy)
 	struct v4l2_ctrl *ctrl;
 	s64 rate;
 
-	ctrl = v4l2_ctrl_find(phy->sensor->ctrl_handler, V4L2_CID_PIXEL_RATE);
+	ctrl = v4l2_ctrl_find(phy->source->ctrl_handler, V4L2_CID_PIXEL_RATE);
 	if (!ctrl) {
 		phy_err(phy, "no pixel rate control in subdev: %s\n",
-			phy->sensor->name);
+			phy->source->name);
 		return -EPIPE;
 	}
 
 	rate = v4l2_ctrl_g_ctrl_int64(ctrl);
-	phy_dbg(3, phy, "sensor Pixel Rate: %llu\n", rate);
+	phy_dbg(3, phy, "Source Pixel Rate: %llu\n", rate);
 
 	return rate;
 }
@@ -279,7 +279,7 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
 	if (external_rate < 0)
 		return external_rate;
 
-	ret = v4l2_subdev_call(phy->sensor, core, s_power, 1);
+	ret = v4l2_subdev_call(phy->source, core, s_power, 1);
 	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV) {
 		phy_err(phy, "power on failed in subdev\n");
 		return ret;
@@ -311,7 +311,7 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
 	 * 2. CSI PHY and link initialization sequence.
 	 *
 	 *    a. Deassert the CSI-2 PHY reset. Do not wait for reset completion
-	 *       at this point, as it requires the external sensor to send the
+	 *       at this point, as it requires the external source to send the
 	 *       CSI-2 HS clock.
 	 */
 	cal_write_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
@@ -370,12 +370,12 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
 	cal_camerarx_power(phy, true);
 
 	/*
-	 * Start the sensor to enable the CSI-2 HS clock. We can now wait for
+	 * Start the source to enable the CSI-2 HS clock. We can now wait for
 	 * CSI-2 PHY reset to complete.
 	 */
-	ret = v4l2_subdev_call(phy->sensor, video, s_stream, 1);
+	ret = v4l2_subdev_call(phy->source, video, s_stream, 1);
 	if (ret) {
-		v4l2_subdev_call(phy->sensor, core, s_power, 0);
+		v4l2_subdev_call(phy->source, core, s_power, 0);
 		cal_camerarx_disable_irqs(phy);
 		phy_err(phy, "stream on failed in subdev\n");
 		return ret;
@@ -435,10 +435,10 @@ static void cal_camerarx_stop(struct cal_camerarx *phy)
 	/* Disable the phy */
 	cal_camerarx_disable(phy);
 
-	if (v4l2_subdev_call(phy->sensor, video, s_stream, 0))
+	if (v4l2_subdev_call(phy->source, video, s_stream, 0))
 		phy_err(phy, "stream off failed in subdev\n");
 
-	ret = v4l2_subdev_call(phy->sensor, core, s_power, 0);
+	ret = v4l2_subdev_call(phy->source, core, s_power, 0);
 	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV)
 		phy_err(phy, "power off failed in subdev\n");
 }
@@ -558,16 +558,16 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
 		endpoint->bus.mipi_csi2.flags);
 
 	/* Retrieve the connected device and store it for later use. */
-	phy->sensor_ep_node = of_graph_get_remote_endpoint(ep_node);
-	phy->sensor_node = of_graph_get_port_parent(phy->sensor_ep_node);
-	if (!phy->sensor_node) {
+	phy->source_ep_node = of_graph_get_remote_endpoint(ep_node);
+	phy->source_node = of_graph_get_port_parent(phy->source_ep_node);
+	if (!phy->source_node) {
 		phy_dbg(3, phy, "Can't get remote parent\n");
-		of_node_put(phy->sensor_ep_node);
+		of_node_put(phy->source_ep_node);
 		ret = -EINVAL;
 		goto done;
 	}
 
-	phy_dbg(1, phy, "Found connected device %pOFn\n", phy->sensor_node);
+	phy_dbg(1, phy, "Found connected device %pOFn\n", phy->source_node);
 
 done:
 	of_node_put(ep_node);
@@ -868,7 +868,7 @@ void cal_camerarx_destroy(struct cal_camerarx *phy)
 
 	v4l2_device_unregister_subdev(&phy->subdev);
 	media_entity_cleanup(&phy->subdev.entity);
-	of_node_put(phy->sensor_ep_node);
-	of_node_put(phy->sensor_node);
+	of_node_put(phy->source_ep_node);
+	of_node_put(phy->source_node);
 	kfree(phy);
 }
diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 57b3a592f823..9d0b515f013e 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -128,7 +128,7 @@ static int __subdev_get_format(struct cal_ctx *ctx,
 	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	sd_fmt.pad = 0;
 
-	ret = v4l2_subdev_call(ctx->phy->sensor, pad, get_fmt, NULL, &sd_fmt);
+	ret = v4l2_subdev_call(ctx->phy->source, pad, get_fmt, NULL, &sd_fmt);
 	if (ret)
 		return ret;
 
@@ -151,7 +151,7 @@ static int __subdev_set_format(struct cal_ctx *ctx,
 	sd_fmt.pad = 0;
 	*mbus_fmt = *fmt;
 
-	ret = v4l2_subdev_call(ctx->phy->sensor, pad, set_fmt, NULL, &sd_fmt);
+	ret = v4l2_subdev_call(ctx->phy->source, pad, set_fmt, NULL, &sd_fmt);
 	if (ret)
 		return ret;
 
@@ -216,7 +216,7 @@ static int cal_try_fmt_vid_cap(struct file *file, void *priv,
 	fse.code = fmtinfo->code;
 	fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	for (fse.index = 0; ; fse.index++) {
-		ret = v4l2_subdev_call(ctx->phy->sensor, pad, enum_frame_size,
+		ret = v4l2_subdev_call(ctx->phy->source, pad, enum_frame_size,
 				       NULL, &fse);
 		if (ret)
 			break;
@@ -321,7 +321,7 @@ static int cal_enum_framesizes(struct file *file, void *fh,
 	fse.code = fmtinfo->code;
 	fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 
-	ret = v4l2_subdev_call(ctx->phy->sensor, pad, enum_frame_size, NULL,
+	ret = v4l2_subdev_call(ctx->phy->source, pad, enum_frame_size, NULL,
 			       &fse);
 	if (ret)
 		return ret;
@@ -378,7 +378,7 @@ static int cal_enum_frameintervals(struct file *file, void *priv,
 		return -EINVAL;
 
 	fie.code = fmtinfo->code;
-	ret = v4l2_subdev_call(ctx->phy->sensor, pad, enum_frame_interval,
+	ret = v4l2_subdev_call(ctx->phy->source, pad, enum_frame_interval,
 			       NULL, &fie);
 	if (ret)
 		return ret;
@@ -392,14 +392,14 @@ static int cal_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
 
-	return v4l2_g_parm_cap(video_devdata(file), ctx->phy->sensor, a);
+	return v4l2_g_parm_cap(video_devdata(file), ctx->phy->source, a);
 }
 
 static int cal_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
 
-	return v4l2_s_parm_cap(video_devdata(file), ctx->phy->sensor, a);
+	return v4l2_s_parm_cap(video_devdata(file), ctx->phy->source, a);
 }
 
 static const struct v4l2_ioctl_ops cal_ioctl_video_ops = {
@@ -801,20 +801,20 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 		memset(&mbus_code, 0, sizeof(mbus_code));
 		mbus_code.index = j;
 		mbus_code.which = V4L2_SUBDEV_FORMAT_ACTIVE;
-		ret = v4l2_subdev_call(ctx->phy->sensor, pad, enum_mbus_code,
+		ret = v4l2_subdev_call(ctx->phy->source, pad, enum_mbus_code,
 				       NULL, &mbus_code);
 		if (ret == -EINVAL)
 			break;
 
 		if (ret) {
 			ctx_err(ctx, "Error enumerating mbus codes in subdev %s: %d\n",
-				ctx->phy->sensor->name, ret);
+				ctx->phy->source->name, ret);
 			return ret;
 		}
 
 		ctx_dbg(2, ctx,
 			"subdev %s: code: %04x idx: %u\n",
-			ctx->phy->sensor->name, mbus_code.code, j);
+			ctx->phy->source->name, mbus_code.code, j);
 
 		for (k = 0; k < cal_num_formats; k++) {
 			fmtinfo = &cal_formats[k];
@@ -832,7 +832,7 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 
 	if (i == 0) {
 		ctx_err(ctx, "No suitable format reported by subdev %s\n",
-			ctx->phy->sensor->name);
+			ctx->phy->source->name);
 		return -EINVAL;
 	}
 
@@ -869,10 +869,10 @@ int cal_ctx_v4l2_register(struct cal_ctx *ctx)
 	if (!cal_mc_api) {
 		struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
 
-		ret = v4l2_ctrl_add_handler(hdl, ctx->phy->sensor->ctrl_handler,
+		ret = v4l2_ctrl_add_handler(hdl, ctx->phy->source->ctrl_handler,
 					    NULL, true);
 		if (ret < 0) {
-			ctx_err(ctx, "Failed to add sensor ctrl handler\n");
+			ctx_err(ctx, "Failed to add source ctrl handler\n");
 			return ret;
 		}
 	}
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 76fe7a8b33f6..9446933b9189 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -635,20 +635,20 @@ static int cal_async_notifier_bound(struct v4l2_async_notifier *notifier,
 	int pad;
 	int ret;
 
-	if (phy->sensor) {
+	if (phy->source) {
 		phy_info(phy, "Rejecting subdev %s (Already set!!)",
 			 subdev->name);
 		return 0;
 	}
 
-	phy->sensor = subdev;
-	phy_dbg(1, phy, "Using sensor %s for capture\n", subdev->name);
+	phy->source = subdev;
+	phy_dbg(1, phy, "Using source %s for capture\n", subdev->name);
 
 	pad = media_entity_get_fwnode_pad(&subdev->entity,
-					  of_fwnode_handle(phy->sensor_ep_node),
+					  of_fwnode_handle(phy->source_ep_node),
 					  MEDIA_PAD_FL_SOURCE);
 	if (pad < 0) {
-		phy_err(phy, "Sensor %s has no connected source pad\n",
+		phy_err(phy, "Source %s has no connected source pad\n",
 			subdev->name);
 		return pad;
 	}
@@ -658,7 +658,7 @@ static int cal_async_notifier_bound(struct v4l2_async_notifier *notifier,
 				    MEDIA_LNK_FL_IMMUTABLE |
 				    MEDIA_LNK_FL_ENABLED);
 	if (ret) {
-		phy_err(phy, "Failed to create media link for sensor %s\n",
+		phy_err(phy, "Failed to create media link for source %s\n",
 			subdev->name);
 		return ret;
 	}
@@ -701,10 +701,10 @@ static int cal_async_notifier_register(struct cal_dev *cal)
 		struct cal_v4l2_async_subdev *casd;
 		struct fwnode_handle *fwnode;
 
-		if (!phy->sensor_node)
+		if (!phy->source_node)
 			continue;
 
-		fwnode = of_fwnode_handle(phy->sensor_node);
+		fwnode = of_fwnode_handle(phy->source_node);
 		casd = v4l2_async_notifier_add_fwnode_subdev(&cal->notifier,
 							     fwnode,
 							     struct cal_v4l2_async_subdev);
@@ -1045,7 +1045,7 @@ static int cal_probe(struct platform_device *pdev)
 			goto error_camerarx;
 		}
 
-		if (cal->phy[i]->sensor_node)
+		if (cal->phy[i]->source_node)
 			connected = true;
 	}
 
@@ -1057,7 +1057,7 @@ static int cal_probe(struct platform_device *pdev)
 
 	/* Create contexts. */
 	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
-		if (!cal->phy[i]->sensor_node)
+		if (!cal->phy[i]->source_node)
 			continue;
 
 		cal->ctx[i] = cal_ctx_create(cal, i);
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index e079c6a9f93f..af46084580bd 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -155,9 +155,9 @@ struct cal_camerarx {
 	unsigned int		instance;
 
 	struct v4l2_fwnode_endpoint	endpoint;
-	struct device_node	*sensor_ep_node;
-	struct device_node	*sensor_node;
-	struct v4l2_subdev	*sensor;
+	struct device_node	*source_ep_node;
+	struct device_node	*source_node;
+	struct v4l2_subdev	*source;
 	struct media_pipeline	pipe;
 
 	struct v4l2_subdev	subdev;
-- 
2.25.1

