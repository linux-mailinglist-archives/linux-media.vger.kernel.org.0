Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A640A37654C
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 14:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236829AbhEGMiI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 May 2021 08:38:08 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59830 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236825AbhEGMiH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 May 2021 08:38:07 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07C948A1;
        Fri,  7 May 2021 14:37:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620391026;
        bh=zUd3j8s03e3L+pLIAwivakx8Qe56qIE1R++bB3Nv+4c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=E3w+hXCX6IHGRej8qJDM39cCGLUMWP2Rly2BhJYIkp6nddTejbSP1xUTLkdSPgg6R
         HlHNC9BfNfb2rHcm6uwRLOYFYg4TmuNywBQPhvS7EvikPgmN7Wg+E+u2KPPKUmPIHy
         XxnaAQtb5AttcBaeyXK+zuFNrSY0p815Jyng8a9M=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>, john.wei@mediatek.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [RFC 11/11] media: ti-vpe: cal: add multistream support
Date:   Fri,  7 May 2021 15:35:58 +0300
Message-Id: <20210507123558.146948-12-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210507123558.146948-1-tomi.valkeinen@ideasonboard.com>
References: <20210507123558.146948-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add routing and stream_config support to CAL driver.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 322 ++++++++++++++++---
 drivers/media/platform/ti-vpe/cal-video.c    | 103 +++++-
 drivers/media/platform/ti-vpe/cal.c          |  34 +-
 drivers/media/platform/ti-vpe/cal.h          |  12 +-
 4 files changed, 399 insertions(+), 72 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index 5b41ba493599..39a2250a2789 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -49,15 +49,33 @@ static s64 cal_camerarx_get_ext_link_freq(struct cal_camerarx *phy)
 {
 	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 = &phy->endpoint.bus.mipi_csi2;
 	u32 num_lanes = mipi_csi2->num_data_lanes;
-	const struct cal_format_info *fmtinfo;
 	u32 bpp;
 	s64 freq;
 
-	fmtinfo = cal_format_by_code(phy->formats[CAL_CAMERARX_PAD_SINK].code);
-	if (!fmtinfo)
+	/*
+	 * With multistream input we don't have bpp, and cannot use
+	 * V4L2_CID_PIXEL_RATE. Passing 0 as bpp causes v4l2_get_link_freq()
+	 * to return an error if it falls back to V4L2_CID_PIXEL_RATE.
+	 */
+
+	if (phy->stream_configs.num_configs == 0)
 		return -EINVAL;
 
-	bpp = fmtinfo->bpp;
+	if (phy->stream_configs.num_configs > 2) {
+		bpp = 0;
+	} else {
+		const struct cal_format_info *fmtinfo;
+		struct v4l2_mbus_framefmt *fmt;
+
+		/* The first format is for the sink */
+		fmt = &phy->stream_configs.configs[0].fmt;
+
+		fmtinfo = cal_format_by_code(fmt->code);
+		if (!fmtinfo)
+			return -EINVAL;
+
+		bpp = fmtinfo->bpp;
+	}
 
 	freq = v4l2_get_link_freq(phy->source->ctrl_handler, bpp, 2 * num_lanes);
 	if (freq < 0) {
@@ -619,19 +637,104 @@ static inline struct cal_camerarx *to_cal_camerarx(struct v4l2_subdev *sd)
 	return container_of(sd, struct cal_camerarx, subdev);
 }
 
-static struct v4l2_mbus_framefmt *
-cal_camerarx_get_pad_format(struct cal_camerarx *phy,
-			    struct v4l2_subdev_state *cfg,
-			    unsigned int pad, u32 which)
-{
-	switch (which) {
-	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&phy->subdev, cfg, pad);
-	case V4L2_SUBDEV_FORMAT_ACTIVE:
-		return &phy->formats[pad];
-	default:
+struct cal_camerarx *
+cal_camerarx_get_phy_from_entity(struct media_entity *entity)
+{
+	struct v4l2_subdev *sd;
+
+	sd = media_entity_to_v4l2_subdev(entity);
+	if (!sd)
 		return NULL;
+
+	return to_cal_camerarx(sd);
+}
+
+static struct v4l2_subdev_krouting *
+cal_camerarx_get_routing_table(struct cal_camerarx *phy,
+			       struct v4l2_subdev_state *state, u32 which)
+{
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		return &phy->routing;
+	else
+		return &state->routing;
+}
+
+static struct v4l2_subdev_stream_configs *
+cal_camerarx_get_stream_configs(struct cal_camerarx *phy,
+				struct v4l2_subdev_state *state, u32 which)
+{
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		return &phy->stream_configs;
+	else
+		return &state->stream_configs;
+}
+
+struct v4l2_mbus_framefmt *
+cal_camerarx_get_stream_format(struct cal_camerarx *phy,
+			       struct v4l2_subdev_state *state,
+			       unsigned int pad, u32 stream, u32 which)
+{
+	struct v4l2_subdev_stream_configs *stream_configs;
+	unsigned int i;
+
+	stream_configs = cal_camerarx_get_stream_configs(phy, state, which);
+
+	for (i = 0; i < stream_configs->num_configs; ++i) {
+		if (stream_configs->configs[i].pad == pad &&
+		    stream_configs->configs[i].stream == stream)
+			return &stream_configs->configs[i].fmt;
+	}
+
+	return NULL;
+}
+
+static int cal_camerarx_find_opposite_end(struct v4l2_subdev_krouting *routing,
+					  u32 pad, u32 stream, u32 *other_pad,
+					  u32 *other_stream)
+{
+	unsigned int i;
+
+	for (i = 0; i < routing->num_routes; ++i) {
+		struct v4l2_subdev_route *route = &routing->routes[i];
+
+		if (cal_rx_pad_is_source(pad)) {
+			if (route->source_pad == pad &&
+			    route->source_stream == stream) {
+				*other_pad = route->sink_pad;
+				*other_stream = route->sink_stream;
+				return 0;
+			}
+		} else {
+			if (route->sink_pad == pad &&
+			    route->sink_stream == stream) {
+				*other_pad = route->source_pad;
+				*other_stream = route->source_stream;
+				return 0;
+			}
+		}
 	}
+
+	return -EINVAL;
+}
+
+static struct v4l2_mbus_framefmt *
+cal_camerarx_get_opposite_stream_format(struct cal_camerarx *phy,
+					struct v4l2_subdev_state *state,
+					u32 pad, u32 stream, u32 which)
+{
+	struct v4l2_subdev_krouting *routing;
+	u32 other_pad, other_stream;
+	int ret;
+
+	routing = cal_camerarx_get_routing_table(phy, state, which);
+
+	ret = cal_camerarx_find_opposite_end(routing, pad, stream, &other_pad,
+					     &other_stream);
+	if (ret)
+		return NULL;
+
+	return cal_camerarx_get_stream_format(phy, state, other_pad,
+					      other_stream, which);
 }
 
 static int cal_camerarx_sd_s_stream(struct v4l2_subdev *sd, int enable)
@@ -652,7 +755,7 @@ static int cal_camerarx_sd_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
-					  struct v4l2_subdev_state *cfg,
+					  struct v4l2_subdev_state *state,
 					  struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
@@ -669,9 +772,15 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
 			goto out;
 		}
 
-		fmt = cal_camerarx_get_pad_format(phy, cfg,
-						  CAL_CAMERARX_PAD_SINK,
-						  code->which);
+		fmt = cal_camerarx_get_opposite_stream_format(phy, state,
+					code->pad, code->stream,
+					code->which);
+
+		if (!fmt) {
+			r = -EINVAL;
+			goto out;
+		}
+
 		code->code = fmt->code;
 	} else {
 		if (code->index >= cal_num_formats) {
@@ -689,7 +798,7 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
-					   struct v4l2_subdev_state *cfg,
+					   struct v4l2_subdev_state *state,
 					   struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
@@ -705,9 +814,14 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
 	if (cal_rx_pad_is_source(fse->pad)) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = cal_camerarx_get_pad_format(phy, cfg,
-						  CAL_CAMERARX_PAD_SINK,
-						  fse->which);
+		fmt = cal_camerarx_get_opposite_stream_format(
+			phy, state, fse->pad, fse->stream, fse->which);
+
+		if (!fmt) {
+			r = -EINVAL;
+			goto out;
+		}
+
 		if (fse->code != fmt->code) {
 			r = -EINVAL;
 			goto out;
@@ -739,7 +853,7 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int cal_camerarx_sd_get_fmt(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_state *cfg,
+				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_format *format)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
@@ -747,7 +861,14 @@ static int cal_camerarx_sd_get_fmt(struct v4l2_subdev *sd,
 
 	mutex_lock(&phy->mutex);
 
-	fmt = cal_camerarx_get_pad_format(phy, cfg, format->pad, format->which);
+	fmt = cal_camerarx_get_stream_format(phy, state, format->pad,
+					     format->stream, format->which);
+
+	if (!fmt) {
+		mutex_unlock(&phy->mutex);
+		return -EINVAL;
+	}
+
 	format->format = *fmt;
 
 	mutex_unlock(&phy->mutex);
@@ -756,17 +877,18 @@ static int cal_camerarx_sd_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_state *cfg,
+				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_format *format)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
 	const struct cal_format_info *fmtinfo;
 	struct v4l2_mbus_framefmt *fmt;
 	unsigned int bpp;
+	int ret = 0;
 
 	/* No transcoding, source and sink formats must match. */
 	if (cal_rx_pad_is_source(format->pad))
-		return cal_camerarx_sd_get_fmt(sd, cfg, format);
+		return cal_camerarx_sd_get_fmt(sd, state, format);
 
 	/*
 	 * Default to the first format if the requested media bus code isn't
@@ -792,39 +914,124 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 
 	mutex_lock(&phy->mutex);
 
-	fmt = cal_camerarx_get_pad_format(phy, cfg, CAL_CAMERARX_PAD_SINK,
-					  format->which);
+	fmt = cal_camerarx_get_stream_format(phy, state, format->pad,
+					     format->stream, format->which);
+	if (!fmt) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	*fmt = format->format;
 
-	fmt = cal_camerarx_get_pad_format(phy, cfg, CAL_CAMERARX_PAD_FIRST_SOURCE,
-					  format->which);
+	fmt = cal_camerarx_get_opposite_stream_format(phy, state, format->pad,
+						      format->stream,
+						      format->which);
+	if (!fmt) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	*fmt = format->format;
 
+out:
 	mutex_unlock(&phy->mutex);
 
+	return ret;
+}
+
+static int cal_camerarx_sd_get_routing(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state,
+				       struct v4l2_subdev_krouting *routing)
+{
+	struct cal_camerarx *phy = to_cal_camerarx(sd);
+	struct v4l2_subdev_krouting *src;
+
+	src = cal_camerarx_get_routing_table(phy, state, routing->which);
+
+	if (routing->num_routes < src->num_routes) {
+		routing->num_routes = src->num_routes;
+		return -ENOSPC;
+	}
+
+	v4l2_subdev_cpy_routing(routing, src);
+
+	return 0;
+}
+
+static void cal_camerarx_init_formats(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      u32 which)
+{
+	struct cal_camerarx *phy = to_cal_camerarx(sd);
+
+	static const struct v4l2_mbus_framefmt format = {
+		.width = 640,
+		.height = 480,
+		.code = MEDIA_BUS_FMT_UYVY8_2X8,
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.ycbcr_enc = V4L2_YCBCR_ENC_601,
+		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+		.xfer_func = V4L2_XFER_FUNC_SRGB,
+	};
+
+	struct v4l2_subdev_stream_configs *stream_configs;
+	unsigned int i;
+
+	stream_configs = cal_camerarx_get_stream_configs(phy, state, which);
+
+	for (i = 0; i < stream_configs->num_configs; ++i)
+		stream_configs->configs[i].fmt = format;
+}
+
+static int cal_camerarx_sd_set_routing(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state,
+				       struct v4l2_subdev_krouting *routing)
+{
+	struct cal_camerarx *phy = to_cal_camerarx(sd);
+	int ret;
+	struct v4l2_subdev_krouting *dst;
+	struct v4l2_subdev_stream_configs *stream_configs;
+
+	dst = cal_camerarx_get_routing_table(phy, state, routing->which);
+	stream_configs =
+		cal_camerarx_get_stream_configs(phy, state, routing->which);
+
+	ret = v4l2_subdev_dup_routing(dst, routing);
+	if (ret)
+		return ret;
+
+	ret = v4l2_alloc_stream_configs(stream_configs, dst);
+	if (ret)
+		return ret;
+
+	/* Initialize stream formats */
+	cal_camerarx_init_formats(sd, state, routing->which);
+
 	return 0;
 }
 
 static int cal_camerarx_sd_init_cfg(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_state *cfg)
-{
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
+				    struct v4l2_subdev_state *state)
+{
+	u32 which = state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
+
+	struct v4l2_subdev_route routes[] = { {
+		.sink_pad = 0,
+		.sink_stream = 0,
+		.source_pad = 1,
+		.source_stream = 0,
+		.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+	} };
+
+	struct v4l2_subdev_krouting routing = {
+		.which = which,
+		.num_routes = 1,
+		.routes = routes,
 	};
 
-	return cal_camerarx_sd_set_fmt(sd, cfg, &format);
+	/* Initialize routing to single route to the fist source pad */
+	return cal_camerarx_sd_set_routing(sd, state, &routing);
 }
 
 static const struct v4l2_subdev_video_ops cal_camerarx_video_ops = {
@@ -837,6 +1044,8 @@ static const struct v4l2_subdev_pad_ops cal_camerarx_pad_ops = {
 	.enum_frame_size = cal_camerarx_sd_enum_frame_size,
 	.get_fmt = cal_camerarx_sd_get_fmt,
 	.set_fmt = cal_camerarx_sd_set_fmt,
+	.get_routing = cal_camerarx_sd_get_routing,
+	.set_routing = cal_camerarx_sd_set_routing,
 };
 
 static const struct v4l2_subdev_ops cal_camerarx_subdev_ops = {
@@ -844,8 +1053,18 @@ static const struct v4l2_subdev_ops cal_camerarx_subdev_ops = {
 	.pad = &cal_camerarx_pad_ops,
 };
 
+static bool cal_camerarx_has_route(struct media_entity *entity, unsigned int pad0,
+			  unsigned int pad1)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct cal_camerarx *phy = to_cal_camerarx(sd);
+
+	return v4l2_subdev_has_route(&phy->routing, pad0, pad1);
+}
+
 static struct media_entity_operations cal_camerarx_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
+	.has_route = cal_camerarx_has_route,
 };
 
 /* ------------------------------------------------------------------
@@ -897,11 +1116,12 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	sd = &phy->subdev;
 	v4l2_subdev_init(sd, &cal_camerarx_subdev_ops);
 	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
-	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_MULTIPLEXED;
 	snprintf(sd->name, sizeof(sd->name), "CAMERARX%u", instance);
 	sd->dev = cal->dev;
 
 	phy->pads[CAL_CAMERARX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+
 	for (i = CAL_CAMERARX_PAD_FIRST_SOURCE; i < CAL_CAMERARX_NUM_PADS; ++i)
 		phy->pads[i].flags = MEDIA_PAD_FL_SOURCE;
 	sd->entity.ops = &cal_camerarx_media_ops;
@@ -921,6 +1141,8 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	return phy;
 
 error:
+	v4l2_subdev_free_routing(&phy->routing);
+	v4l2_free_stream_configs(&phy->stream_configs);
 	media_entity_cleanup(&phy->subdev.entity);
 	kfree(phy);
 	return ERR_PTR(ret);
@@ -932,6 +1154,8 @@ void cal_camerarx_destroy(struct cal_camerarx *phy)
 		return;
 
 	v4l2_device_unregister_subdev(&phy->subdev);
+	v4l2_subdev_free_routing(&phy->routing);
+	v4l2_free_stream_configs(&phy->stream_configs);
 	media_entity_cleanup(&phy->subdev.entity);
 	of_node_put(phy->source_ep_node);
 	of_node_put(phy->source_node);
diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 8ecae7dc2774..234af40a24fa 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -693,7 +693,11 @@ static int cal_video_check_format(struct cal_ctx *ctx)
 	if (!remote_pad)
 		return -ENODEV;
 
-	format = &ctx->phy->formats[remote_pad->index];
+	format = cal_camerarx_get_stream_format(ctx->phy, NULL,
+						remote_pad->index, 0,
+						V4L2_SUBDEV_FORMAT_ACTIVE);
+	if (!format)
+		return -EINVAL;
 
 	if (ctx->fmtinfo->code != format->code ||
 	    ctx->v_fmt.fmt.pix.height != format->height ||
@@ -711,6 +715,48 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
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
+			ret = -ENODEV;
+			goto error_release_buffers;
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
+			ret = -ENODEV;
+			goto error_release_buffers;
+		}
+
+		ctx->stream = route->sink_stream;
+	}
+
 	ret = media_pipeline_start(ctx->vdev.entity.pads, &ctx->phy->pipe);
 	if (ret < 0) {
 		ctx_err(ctx, "Failed to start media pipeline: %d\n", ret);
@@ -784,6 +830,9 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 	cal_release_buffers(ctx, VB2_BUF_STATE_ERROR);
 
 	media_pipeline_stop(ctx->vdev.entity.pads);
+
+	if (cal_mc_api)
+		ctx->phy = NULL;
 }
 
 static const struct vb2_ops cal_video_qops = {
@@ -945,16 +994,48 @@ int cal_ctx_v4l2_register(struct cal_ctx *ctx)
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
index 07386c42574e..c0159637dfdf 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -977,7 +977,6 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 		return NULL;
 
 	ctx->cal = cal;
-	ctx->phy = cal->phy[inst];
 	ctx->dma_ctx = inst;
 	ctx->csi2_ctx = inst;
 	ctx->cport = inst;
@@ -1188,18 +1187,33 @@ static int cal_probe(struct platform_device *pdev)
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
 
-		cal->ctx[i] = cal_ctx_create(cal, i);
-		if (!cal->ctx[i]) {
-			cal_err(cal, "Failed to create context %u\n", i);
-			ret = -ENODEV;
-			goto error_context;
+			cal->ctx[i]->phy = cal->phy[i];
+
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
index 3aea444f8bf8..6626c2a59fc2 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -45,7 +45,7 @@
 
 #define CAL_CAMERARX_PAD_SINK		0
 #define CAL_CAMERARX_PAD_FIRST_SOURCE	1
-#define CAL_CAMERARX_NUM_SOURCE_PADS	1
+#define CAL_CAMERARX_NUM_SOURCE_PADS	8
 #define CAL_CAMERARX_NUM_PADS		(1 + CAL_CAMERARX_NUM_SOURCE_PADS)
 
 static inline bool cal_rx_pad_is_sink(u32 pad)
@@ -178,12 +178,14 @@ struct cal_camerarx {
 
 	struct v4l2_subdev	subdev;
 	struct media_pad	pads[CAL_CAMERARX_NUM_PADS];
-	struct v4l2_mbus_framefmt	formats[CAL_CAMERARX_NUM_PADS];
 
 	/* mutex for camerarx ops */
 	struct mutex		mutex;
 
 	unsigned int enable_count;
+
+	struct v4l2_subdev_krouting routing;
+	struct v4l2_subdev_stream_configs stream_configs;
 };
 
 struct cal_dev {
@@ -321,6 +323,7 @@ void cal_quickdump_regs(struct cal_dev *cal);
 
 int cal_camerarx_get_remote_frame_desc(struct cal_camerarx *phy,
 				       struct v4l2_mbus_frame_desc *fd);
+struct cal_camerarx *cal_camerarx_get_phy_from_entity(struct media_entity *entity);
 void cal_camerarx_disable(struct cal_camerarx *phy);
 void cal_camerarx_i913_errata(struct cal_camerarx *phy);
 struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
@@ -338,4 +341,9 @@ void cal_ctx_v4l2_unregister(struct cal_ctx *ctx);
 int cal_ctx_v4l2_init(struct cal_ctx *ctx);
 void cal_ctx_v4l2_cleanup(struct cal_ctx *ctx);
 
+struct v4l2_mbus_framefmt *
+cal_camerarx_get_stream_format(struct cal_camerarx *phy,
+			       struct v4l2_subdev_state *state,
+			       unsigned int pad, u32 stream, u32 which);
+
 #endif /* __TI_CAL_H__ */
-- 
2.25.1

