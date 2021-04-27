Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1161936C6EB
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 15:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236911AbhD0NVW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 09:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236399AbhD0NVW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 09:21:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E165C061574
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 06:20:39 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3996AE9;
        Tue, 27 Apr 2021 15:20:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619529637;
        bh=StDxTumkkJ83pwMT+ROHXpK802emeFhScx4W2wRej4E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O2nbtxV4hQ94WVk+jjo93qBZdWkQ19vEm+AusgGWde/9FA8+2pz/Ay97Eh0JzkOp5
         4SOgQq2oWuJaw+PMrPiRT+Z8S5j5VoBmKqXBvZBfZ4DiA0NmsVCls390IMi4ikecL2
         wztAXeHe6NNUoICqd23HHh9OfKUZ/JEl2E3JvPas=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 4/4] media: ti-vpe: cal: add multiplexed streams support
Date:   Tue, 27 Apr 2021 16:20:28 +0300
Message-Id: <20210427132028.1005757-5-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210427132028.1005757-1-tomi.valkeinen@ideasonboard.com>
References: <20210427132028.1005757-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add multiplexed streams support. CAL has 8 dma-engines and can capture 8
separate streams at the same time.

Add 8 video device nodes, each representing a single dma-engine, and set
the number of source pads on camerarx to 8. Each video node can be
connected to any of the source pads on either of the camerarx instances
using media links. Camerarx internal routing is used to route the
incoming CSI-2 streams to one of the 8 source pads.

As multiplexed streams changes how the media entity pads behave, and
there's no simple way to decide if the driver should use the multiplexed
streams behavior or the non-multiplexed streams behavior, a new
'cal_streams_api' module parameter is added, which needs to be set to
use the multiplexed streams.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 144 +++++++++++++++----
 drivers/media/platform/ti-vpe/cal-video.c    |  95 ++++++++++--
 drivers/media/platform/ti-vpe/cal.c          |  40 ++++--
 drivers/media/platform/ti-vpe/cal.h          |   4 +-
 4 files changed, 232 insertions(+), 51 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index 3470f6dc0ec1..40adf0b1f37a 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -49,15 +49,25 @@ static s64 cal_camerarx_get_ext_link_freq(struct cal_camerarx *phy)
 {
 	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 = &phy->endpoint.bus.mipi_csi2;
 	u32 num_lanes = mipi_csi2->num_data_lanes;
-	const struct cal_format_info *fmtinfo;
 	u32 bpp;
 	s64 freq;
 
-	fmtinfo = cal_format_by_code(phy->formats[CAL_CAMERARX_PAD_SINK].code);
-	if (!fmtinfo)
-		return -EINVAL;
+	/*
+	 * With multistream input we don't have bpp, and cannot use
+	 * V4L2_CID_PIXEL_RATE. Passing 0 as bpp causes v4l2_get_link_freq()
+	 * to return an error if it falls back to V4L2_CID_PIXEL_RATE.
+	 */
+	if (cal_streams_api) {
+		bpp = 0;
+	} else {
+		const struct cal_format_info *fmtinfo;
 
-	bpp = fmtinfo->bpp;
+		fmtinfo = cal_format_by_code(phy->formats[CAL_CAMERARX_PAD_SINK].code);
+		if (!fmtinfo)
+			return -EINVAL;
+
+		bpp = fmtinfo->bpp;
+	}
 
 	freq = v4l2_get_link_freq(phy->source->ctrl_handler, bpp, 2 * num_lanes);
 	if (freq < 0) {
@@ -619,6 +629,17 @@ static inline struct cal_camerarx *to_cal_camerarx(struct v4l2_subdev *sd)
 	return container_of(sd, struct cal_camerarx, subdev);
 }
 
+struct cal_camerarx *cal_camerarx_get_phy_from_entity(struct media_entity *entity)
+{
+	struct v4l2_subdev *sd;
+
+	sd = media_entity_to_v4l2_subdev(entity);
+	if (!sd)
+		return NULL;
+
+	return to_cal_camerarx(sd);
+}
+
 static struct v4l2_mbus_framefmt *
 cal_camerarx_get_pad_format(struct cal_camerarx *phy,
 			    struct v4l2_subdev_pad_config *cfg,
@@ -658,6 +679,18 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
 	int r = 0;
 
+	if (cal_streams_api) {
+		if (cal_rx_pad_is_sink(code->pad))
+			return -ENOIOCTLCMD;
+
+		if (code->index >= cal_num_formats)
+			return -EINVAL;
+
+		code->code = cal_formats[code->index].code;
+
+		return 0;
+	}
+
 	mutex_lock(&phy->mutex);
 
 	/* No transcoding, source and sink codes must match. */
@@ -699,6 +732,22 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index > 0)
 		return -EINVAL;
 
+	if (cal_streams_api) {
+		if (cal_rx_pad_is_sink(fse->pad))
+			return -ENOIOCTLCMD;
+
+		fmtinfo = cal_format_by_code(fse->code);
+		if (!fmtinfo)
+			return -EINVAL;
+
+		fse->min_width = CAL_MIN_WIDTH_BYTES * 8 / ALIGN(fmtinfo->bpp, 8);
+		fse->max_width = CAL_MAX_WIDTH_BYTES * 8 / ALIGN(fmtinfo->bpp, 8);
+		fse->min_height = CAL_MIN_HEIGHT_LINES;
+		fse->max_height = CAL_MAX_HEIGHT_LINES;
+
+		return 0;
+	}
+
 	mutex_lock(&phy->mutex);
 
 	/* No transcoding, source and sink formats must match. */
@@ -745,6 +794,9 @@ static int cal_camerarx_sd_get_fmt(struct v4l2_subdev *sd,
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
 	struct v4l2_mbus_framefmt *fmt;
 
+	if (cal_streams_api && cal_rx_pad_is_sink(format->pad))
+		return -ENOIOCTLCMD;
+
 	mutex_lock(&phy->mutex);
 
 	fmt = cal_camerarx_get_pad_format(phy, cfg, format->pad, format->which);
@@ -764,8 +816,11 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *fmt;
 	unsigned int bpp;
 
+	if (cal_streams_api && cal_rx_pad_is_sink(format->pad))
+		return -ENOIOCTLCMD;
+
 	/* No transcoding, source and sink formats must match. */
-	if (cal_rx_pad_is_source(format->pad))
+	if (!cal_streams_api && cal_rx_pad_is_source(format->pad))
 		return cal_camerarx_sd_get_fmt(sd, cfg, format);
 
 	/*
@@ -788,17 +843,27 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 	format->format.code = fmtinfo->code;
 	format->format.field = V4L2_FIELD_NONE;
 
-	/* Store the format and propagate it to the source pad. */
-
 	mutex_lock(&phy->mutex);
 
-	fmt = cal_camerarx_get_pad_format(phy, cfg, CAL_CAMERARX_PAD_SINK,
-					  format->which);
-	*fmt = format->format;
+	if (!cal_streams_api) {
+		unsigned int i;
+
+		/* Store the format and propagate it to the source pads. */
 
-	fmt = cal_camerarx_get_pad_format(phy, cfg, CAL_CAMERARX_PAD_FIRST_SOURCE,
-					  format->which);
-	*fmt = format->format;
+		fmt = cal_camerarx_get_pad_format(phy, cfg, CAL_CAMERARX_PAD_SINK,
+						  format->which);
+		*fmt = format->format;
+
+		for (i = CAL_CAMERARX_PAD_FIRST_SOURCE; i < CAL_CAMERARX_NUM_PADS; ++i) {
+			fmt = cal_camerarx_get_pad_format(phy, cfg, i, format->which);
+			*fmt = format->format;
+		}
+	} else {
+		/* Store the format */
+
+		fmt = cal_camerarx_get_pad_format(phy, cfg, format->pad, format->which);
+		*fmt = format->format;
+	}
 
 	mutex_unlock(&phy->mutex);
 
@@ -839,23 +904,38 @@ static int cal_camerarx_sd_set_routing(struct v4l2_subdev *sd,
 static int cal_camerarx_sd_init_cfg(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_pad_config *cfg)
 {
-	struct v4l2_subdev_format format = {
-		.which = cfg ? V4L2_SUBDEV_FORMAT_TRY
-		       : V4L2_SUBDEV_FORMAT_ACTIVE,
-		.pad = CAL_CAMERARX_PAD_SINK,
-		.format = {
-			.width = 640,
-			.height = 480,
-			.code = MEDIA_BUS_FMT_UYVY8_2X8,
-			.field = V4L2_FIELD_NONE,
-			.colorspace = V4L2_COLORSPACE_SRGB,
-			.ycbcr_enc = V4L2_YCBCR_ENC_601,
-			.quantization = V4L2_QUANTIZATION_LIM_RANGE,
-			.xfer_func = V4L2_XFER_FUNC_SRGB,
-		},
-	};
+	int i;
+	int ret;
+	u32 which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
+
+	for (i = 0; i < CAL_CAMERARX_NUM_PADS; ++i) {
+		struct v4l2_subdev_format format = {
+			.which = which,
+			.pad = i,
+			.format = {
+				.width = 640,
+				.height = 480,
+				.code = MEDIA_BUS_FMT_UYVY8_2X8,
+				.field = V4L2_FIELD_NONE,
+				.colorspace = V4L2_COLORSPACE_SRGB,
+				.ycbcr_enc = V4L2_YCBCR_ENC_601,
+				.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+				.xfer_func = V4L2_XFER_FUNC_SRGB,
+			},
+		};
+
+		if (!cal_streams_api && cal_rx_pad_is_source(i))
+			continue;
 
-	return cal_camerarx_sd_set_fmt(sd, cfg, &format);
+		if (cal_streams_api && cal_rx_pad_is_sink(i))
+			continue;
+
+		ret = cal_camerarx_sd_set_fmt(sd, cfg, &format);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static const struct v4l2_subdev_video_ops cal_camerarx_video_ops = {
@@ -959,6 +1039,10 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	sd->dev = cal->dev;
 
 	phy->pads[CAL_CAMERARX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+
+	if (cal_streams_api)
+		phy->pads[CAL_CAMERARX_PAD_SINK].flags |= MEDIA_PAD_FL_MULTIPLEXED;
+
 	for (i = CAL_CAMERARX_PAD_FIRST_SOURCE; i < CAL_CAMERARX_NUM_PADS; ++i)
 		phy->pads[i].flags = MEDIA_PAD_FL_SOURCE;
 	sd->entity.ops = &cal_camerarx_media_ops;
diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 8ecae7dc2774..097ebd1bfb2f 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -711,6 +711,46 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	dma_addr_t addr;
 	int ret;
 
+	if (cal_mc_api) {
+		struct v4l2_subdev_route *route = NULL;
+		struct media_pad *remote_pad;
+		unsigned int i;
+
+		/* Find the PHY connected to this video device */
+
+		remote_pad = media_entity_remote_pad(&ctx->pad);
+		if (!remote_pad) {
+			ctx_err(ctx, "Context not connected\n");
+			return -ENODEV;
+		}
+
+		ctx->phy = cal_camerarx_get_phy_from_entity(remote_pad->entity);
+
+		/* Find the stream */
+
+		for (i = 0; i < ctx->phy->routing.num_routes; ++i) {
+			struct v4l2_subdev_route *r =
+				&ctx->phy->routing.routes[i];
+
+			if (!(r->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+				continue;
+
+			if (r->source_pad != remote_pad->index)
+				continue;
+
+			route = r;
+
+			break;
+		}
+
+		if (!route) {
+			ctx_err(ctx, "Failed to find route\n");
+			return -ENODEV;
+		}
+
+		ctx->stream = route->sink_stream;
+	}
+
 	ret = media_pipeline_start(ctx->vdev.entity.pads, &ctx->phy->pipe);
 	if (ret < 0) {
 		ctx_err(ctx, "Failed to start media pipeline: %d\n", ret);
@@ -784,6 +824,9 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 	cal_release_buffers(ctx, VB2_BUF_STATE_ERROR);
 
 	media_pipeline_stop(ctx->vdev.entity.pads);
+
+	if (cal_mc_api)
+		ctx->phy = NULL;
 }
 
 static const struct vb2_ops cal_video_qops = {
@@ -945,16 +988,48 @@ int cal_ctx_v4l2_register(struct cal_ctx *ctx)
 		return ret;
 	}
 
-	ret = media_create_pad_link(&ctx->phy->subdev.entity,
-				    CAL_CAMERARX_PAD_FIRST_SOURCE,
-				    &vfd->entity, 0,
-				    MEDIA_LNK_FL_IMMUTABLE |
-				    MEDIA_LNK_FL_ENABLED);
-	if (ret) {
-		ctx_err(ctx, "Failed to create media link for context %u\n",
-			ctx->dma_ctx);
-		video_unregister_device(vfd);
-		return ret;
+	if (cal_mc_api) {
+		u16 phy_idx;
+		u16 pad_idx;
+
+		/* Create links from all video nodes to all PHYs */
+
+		for (phy_idx = 0; phy_idx < ctx->cal->data->num_csi2_phy; ++phy_idx) {
+			for (pad_idx = 1; pad_idx < CAL_CAMERARX_NUM_PADS; ++pad_idx) {
+				/*
+				 * Enable only links from video0 to PHY0 pad 1, and
+				 * video1 to PHY1 pad 1.
+				 */
+				bool enable = (ctx->dma_ctx == 0 &&
+					       phy_idx == 0 && pad_idx == 1) ||
+					      (ctx->dma_ctx == 1 &&
+					       phy_idx == 1 && pad_idx == 1);
+
+				ret = media_create_pad_link(
+					&ctx->cal->phy[phy_idx]->subdev.entity,
+					pad_idx, &vfd->entity, 0,
+					enable ? MEDIA_LNK_FL_ENABLED : 0);
+				if (ret) {
+					ctx_err(ctx,
+						"Failed to create media link for context %u\n",
+						ctx->dma_ctx);
+					video_unregister_device(vfd);
+					return ret;
+				}
+			}
+		}
+	} else {
+		ret = media_create_pad_link(
+			&ctx->phy->subdev.entity, CAL_CAMERARX_PAD_FIRST_SOURCE,
+			&vfd->entity, 0,
+			MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
+		if (ret) {
+			ctx_err(ctx,
+				"Failed to create media link for context %u\n",
+				ctx->dma_ctx);
+			video_unregister_device(vfd);
+			return ret;
+		}
 	}
 
 	ctx_info(ctx, "V4L2 device registered as %s\n",
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 7975bb449acd..42ad3ade64c1 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -53,6 +53,12 @@ bool cal_mc_api = CAL_MC_API_DEFAULT;
 module_param_named(mc_api, cal_mc_api, bool, 0444);
 MODULE_PARM_DESC(mc_api, "activates the MC API");
 
+bool cal_streams_api;
+module_param_named(streams_api, cal_streams_api, bool, 0444);
+MODULE_PARM_DESC(streams_api, "activates the multiplexed streams API");
+
+static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst);
+
 /* ------------------------------------------------------------------
  *	Format Handling
  * ------------------------------------------------------------------
@@ -967,7 +973,6 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 		return NULL;
 
 	ctx->cal = cal;
-	ctx->phy = cal->phy[inst];
 	ctx->dma_ctx = inst;
 	ctx->csi2_ctx = inst;
 	ctx->cport = inst;
@@ -1178,18 +1183,33 @@ static int cal_probe(struct platform_device *pdev)
 	}
 
 	/* Create contexts. */
-	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
-		if (!cal->phy[i]->source_node)
-			continue;
+	if (!cal_mc_api) {
+		for (i = 0; i < cal->data->num_csi2_phy; ++i) {
+			if (!cal->phy[i]->source_node)
+				continue;
+
+			cal->ctx[i] = cal_ctx_create(cal, i);
+			if (!cal->ctx[i]) {
+				cal_err(cal, "Failed to create context %u\n", i);
+				ret = -ENODEV;
+				goto error_context;
+			}
+
+			cal->ctx[i]->phy = cal->phy[i];
 
-		cal->ctx[i] = cal_ctx_create(cal, i);
-		if (!cal->ctx[i]) {
-			cal_err(cal, "Failed to create context %u\n", i);
-			ret = -ENODEV;
-			goto error_context;
+			cal->num_contexts++;
 		}
+	} else {
+		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
+			cal->ctx[i] = cal_ctx_create(cal, i);
+			if (!cal->ctx[i]) {
+				cal_err(cal, "Failed to create context %u\n", i);
+				ret = -ENODEV;
+				goto error_context;
+			}
 
-		cal->num_contexts++;
+			cal->num_contexts++;
+		}
 	}
 
 	/* Register the media device. */
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index c96364eb0930..fc6d68195367 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -45,7 +45,7 @@
 
 #define CAL_CAMERARX_PAD_SINK		0
 #define CAL_CAMERARX_PAD_FIRST_SOURCE	1
-#define CAL_CAMERARX_NUM_SOURCE_PADS	1
+#define CAL_CAMERARX_NUM_SOURCE_PADS	8
 #define CAL_CAMERARX_NUM_PADS		(1 + CAL_CAMERARX_NUM_SOURCE_PADS)
 
 static inline bool cal_rx_pad_is_sink(u32 pad)
@@ -255,6 +255,7 @@ struct cal_ctx {
 extern unsigned int cal_debug;
 extern int cal_video_nr;
 extern bool cal_mc_api;
+extern bool cal_streams_api;
 
 #define cal_dbg(level, cal, fmt, arg...)				\
 	do {								\
@@ -323,6 +324,7 @@ void cal_quickdump_regs(struct cal_dev *cal);
 
 int cal_camerarx_get_remote_frame_desc(struct cal_camerarx *phy,
 				       struct v4l2_mbus_frame_desc *fd);
+struct cal_camerarx *cal_camerarx_get_phy_from_entity(struct media_entity *entity);
 void cal_camerarx_disable(struct cal_camerarx *phy);
 void cal_camerarx_i913_errata(struct cal_camerarx *phy);
 struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
-- 
2.25.1

