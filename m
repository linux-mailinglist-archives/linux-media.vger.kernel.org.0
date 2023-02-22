Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41FF469F4F5
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 13:57:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbjBVM5B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 07:57:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231657AbjBVM47 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 07:56:59 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1298B38E97
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 04:56:55 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3605C1E7C;
        Wed, 22 Feb 2023 13:56:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677070612;
        bh=S/H2mM8jBRIiKdDMPV1F3FRPuLZw/JZQ8QzaE6XeDEg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lG0WEZryTNrbMggsVUKPkjr4g4HcciXJyLMtwAP7I/xE2d5DVcS7XKrd7m++0rgRR
         9OUk+Oe1CwkM747T+0Q9FoOhcn8sVlz7TqCDdsLpxXlpbLhoTJ4sWV89g22ZGEgLgA
         +54sMem+m+auiGDek/L6UEGKr5v5KYaFnu0wpGRw=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v1 3/3] media: ti: cal: add multiplexed streams support
Date:   Wed, 22 Feb 2023 14:56:30 +0200
Message-Id: <20230222125630.421020-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222125630.421020-1-tomi.valkeinen@ideasonboard.com>
References: <20230222125630.421020-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add routing and stream_config support to CAL driver.

Add multiplexed streams support. CAL has 8 dma-engines and can capture 8
separate streams at the same time.

Add 8 video device nodes, each representing a single dma-engine, and set
the number of source pads on camerarx to 8. Each video node can be
connected to any of the source pads on either of the camerarx instances
using media links. Camerarx internal routing is used to route the
incoming CSI-2 streams to one of the 8 source pads.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti/cal/cal-camerarx.c | 233 ++++++++++++++-----
 drivers/media/platform/ti/cal/cal-video.c    | 146 +++++++++---
 drivers/media/platform/ti/cal/cal.c          |  65 ++++--
 drivers/media/platform/ti/cal/cal.h          |   4 +-
 4 files changed, 342 insertions(+), 106 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
index faafbd0e9240..49ae29065cd1 100644
--- a/drivers/media/platform/ti/cal/cal-camerarx.c
+++ b/drivers/media/platform/ti/cal/cal-camerarx.c
@@ -49,21 +49,41 @@ static s64 cal_camerarx_get_ext_link_freq(struct cal_camerarx *phy)
 {
 	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2 = &phy->endpoint.bus.mipi_csi2;
 	u32 num_lanes = mipi_csi2->num_data_lanes;
-	const struct cal_format_info *fmtinfo;
 	struct v4l2_subdev_state *state;
-	struct v4l2_mbus_framefmt *fmt;
 	u32 bpp;
 	s64 freq;
 
-	state = v4l2_subdev_get_locked_active_state(&phy->subdev);
+	/*
+	 * v4l2_get_link_freq() uses V4L2_CID_LINK_FREQ first, and falls back
+	 * to V4L2_CID_PIXEL_RATE if V4L2_CID_LINK_FREQ is not available.
+	 *
+	 * With multistream input there is no single pixel rate, and thus we
+	 * cannot use V4L2_CID_PIXEL_RATE, so we pass 0 as the bpp which
+	 * causes v4l2_get_link_freq() to return an error if it falls back to
+	 * V4L2_CID_PIXEL_RATE.
+	 */
 
-	fmt = v4l2_subdev_get_pad_format(&phy->subdev, state, CAL_CAMERARX_PAD_SINK);
+	state = v4l2_subdev_get_locked_active_state(&phy->subdev);
 
-	fmtinfo = cal_format_by_code(fmt->code);
-	if (!fmtinfo)
+	if (state->routing.num_routes == 0)
 		return -EINVAL;
 
-	bpp = fmtinfo->bpp;
+	if (state->routing.num_routes > 1) {
+		bpp = 0;
+	} else {
+		const struct cal_format_info *fmtinfo;
+		struct v4l2_subdev_route *route = &state->routing.routes[0];
+		struct v4l2_mbus_framefmt *fmt;
+
+		fmt = v4l2_subdev_state_get_stream_format(
+			state, route->sink_pad, route->sink_stream);
+
+		fmtinfo = cal_format_by_code(fmt->code);
+		if (!fmtinfo)
+			return -EINVAL;
+
+		bpp = fmtinfo->bpp;
+	}
 
 	freq = v4l2_get_link_freq(phy->source->ctrl_handler, bpp, 2 * num_lanes);
 	if (freq < 0) {
@@ -284,15 +304,28 @@ static void cal_camerarx_ppi_disable(struct cal_camerarx *phy)
 			0, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
 }
 
-static int cal_camerarx_start(struct cal_camerarx *phy)
+static int cal_camerarx_start(struct cal_camerarx *phy, u32 pad, u32 stream)
 {
+	struct media_pad *remote_pad;
 	s64 link_freq;
 	u32 sscounter;
 	u32 val;
 	int ret;
 
+	remote_pad = media_pad_remote_pad_first(&phy->pads[pad]);
+
 	if (phy->enable_count > 0) {
 		phy->enable_count++;
+
+		ret = v4l2_subdev_enable_streams(phy->source, remote_pad->index,
+						 BIT(stream));
+		if (ret) {
+			phy->enable_count--;
+
+			phy_err(phy, "enable streams failed in source: %d\n", ret);
+			return ret;
+		}
+
 		return 0;
 	}
 
@@ -394,7 +427,9 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
 	 * Start the source to enable the CSI-2 HS clock. We can now wait for
 	 * CSI-2 PHY reset to complete.
 	 */
-	ret = v4l2_subdev_call(phy->source, video, s_stream, 1);
+
+	ret = v4l2_subdev_enable_streams(phy->source, remote_pad->index,
+					 BIT(stream));
 	if (ret) {
 		v4l2_subdev_call(phy->source, core, s_power, 0);
 		cal_camerarx_disable_irqs(phy);
@@ -425,12 +460,22 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
 	return 0;
 }
 
-static void cal_camerarx_stop(struct cal_camerarx *phy)
+static void cal_camerarx_stop(struct cal_camerarx *phy, u32 pad, u32 stream)
 {
+	struct media_pad *remote_pad;
 	int ret;
 
-	if (--phy->enable_count > 0)
+	remote_pad = media_pad_remote_pad_first(&phy->pads[pad]);
+
+	if (--phy->enable_count > 0) {
+		ret = v4l2_subdev_disable_streams(phy->source,
+						  remote_pad->index,
+						  BIT(stream));
+		if (ret)
+			phy_err(phy, "stream off failed in subdev\n");
+
 		return;
+	}
 
 	cal_camerarx_ppi_disable(phy);
 
@@ -450,7 +495,9 @@ static void cal_camerarx_stop(struct cal_camerarx *phy)
 	/* Disable the phy */
 	cal_camerarx_disable(phy);
 
-	if (v4l2_subdev_call(phy->source, video, s_stream, 0))
+	ret = v4l2_subdev_disable_streams(phy->source, remote_pad->index,
+					  BIT(stream));
+	if (ret)
 		phy_err(phy, "stream off failed in subdev\n");
 
 	ret = v4l2_subdev_call(phy->source, core, s_power, 0);
@@ -626,30 +673,62 @@ static inline struct cal_camerarx *to_cal_camerarx(struct v4l2_subdev *sd)
 	return container_of(sd, struct cal_camerarx, subdev);
 }
 
-static int cal_camerarx_sd_s_stream(struct v4l2_subdev *sd, int enable)
+struct cal_camerarx *
+cal_camerarx_get_phy_from_entity(struct media_entity *entity)
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
+static int cal_camerarx_sd_enable_streams(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *state,
+					  u32 pad, u64 streams_mask)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
-	struct v4l2_subdev_state *state;
-	int ret = 0;
+	u32 other_pad, other_stream;
+	int ret;
 
-	state = v4l2_subdev_lock_and_get_active_state(sd);
+	if (WARN_ON(streams_mask != 1))
+		return -EINVAL;
 
-	if (enable)
-		ret = cal_camerarx_start(phy);
-	else
-		cal_camerarx_stop(phy);
+	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, pad, 0,
+						    &other_pad, &other_stream);
+	if (ret)
+		return ret;
 
-	v4l2_subdev_unlock_state(state);
+	return cal_camerarx_start(phy, other_pad, other_stream);
+}
 
-	return ret;
+static int cal_camerarx_sd_disable_streams(struct v4l2_subdev *sd,
+					   struct v4l2_subdev_state *state,
+					   u32 pad, u64 streams_mask)
+{
+	struct cal_camerarx *phy = to_cal_camerarx(sd);
+	u32 other_pad, other_stream;
+	int ret;
+
+	if (WARN_ON(streams_mask != 1))
+		return -EINVAL;
+
+	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, pad, 0,
+						    &other_pad, &other_stream);
+	if (ret)
+		return ret;
+
+	cal_camerarx_stop(phy, other_pad, other_stream);
+
+	return 0;
 }
 
 static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
 					  struct v4l2_subdev_state *state,
 					  struct v4l2_subdev_mbus_code_enum *code)
 {
-	struct cal_camerarx *phy = to_cal_camerarx(sd);
-
 	/* No transcoding, source and sink codes must match. */
 	if (cal_rx_pad_is_source(code->pad)) {
 		struct v4l2_mbus_framefmt *fmt;
@@ -657,8 +736,12 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
 		if (code->index > 0)
 			return -EINVAL;
 
-		fmt = v4l2_subdev_get_pad_format(&phy->subdev, state,
-						 CAL_CAMERARX_PAD_SINK);
+		fmt = v4l2_subdev_state_get_opposite_stream_format(state,
+								   code->pad,
+								   code->stream);
+		if (!fmt)
+			return -EINVAL;
+
 		code->code = fmt->code;
 	} else {
 		if (code->index >= cal_num_formats)
@@ -683,8 +766,12 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
 	if (cal_rx_pad_is_source(fse->pad)) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = v4l2_subdev_get_pad_format(sd, state,
-						 CAL_CAMERARX_PAD_SINK);
+		fmt = v4l2_subdev_state_get_opposite_stream_format(state,
+								   fse->pad,
+								   fse->stream);
+		if (!fmt)
+			return -EINVAL;
+
 		if (fse->code != fmt->code)
 			return -EINVAL;
 
@@ -740,57 +827,96 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 
 	/* Store the format and propagate it to the source pad. */
 
-	fmt = v4l2_subdev_get_pad_format(sd, state, CAL_CAMERARX_PAD_SINK);
+	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
+						  format->stream);
+	if (!fmt)
+		return -EINVAL;
+
 	*fmt = format->format;
 
-	fmt = v4l2_subdev_get_pad_format(sd, state,
-					 CAL_CAMERARX_PAD_FIRST_SOURCE);
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt)
+		return -EINVAL;
+
 	*fmt = format->format;
 
 	return 0;
 }
 
+static int _cal_camerarx_sd_set_routing(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					struct v4l2_subdev_krouting *routing)
+{
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
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing, V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int cal_camerarx_sd_set_routing(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state,
+				       enum v4l2_subdev_format_whence which,
+				       struct v4l2_subdev_krouting *routing)
+{
+	return _cal_camerarx_sd_set_routing(sd, state, routing);
+}
+
 static int cal_camerarx_sd_init_cfg(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_state *state)
 {
-	struct v4l2_subdev_format format = {
-		.which = state ? V4L2_SUBDEV_FORMAT_TRY
-		: V4L2_SUBDEV_FORMAT_ACTIVE,
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
+	struct v4l2_subdev_route routes[] = { {
+		.sink_pad = 0,
+		.sink_stream = 0,
+		.source_pad = 1,
+		.source_stream = 0,
+		.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+	} };
+
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = 1,
+		.routes = routes,
 	};
 
-	return cal_camerarx_sd_set_fmt(sd, state, &format);
+	/* Initialize routing to single route to the fist source pad */
+	return _cal_camerarx_sd_set_routing(sd, state, &routing);
 }
 
-static const struct v4l2_subdev_video_ops cal_camerarx_video_ops = {
-	.s_stream = cal_camerarx_sd_s_stream,
-};
-
 static const struct v4l2_subdev_pad_ops cal_camerarx_pad_ops = {
+	.enable_streams = cal_camerarx_sd_enable_streams,
+	.disable_streams = cal_camerarx_sd_disable_streams,
 	.init_cfg = cal_camerarx_sd_init_cfg,
 	.enum_mbus_code = cal_camerarx_sd_enum_mbus_code,
 	.enum_frame_size = cal_camerarx_sd_enum_frame_size,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = cal_camerarx_sd_set_fmt,
+	.set_routing = cal_camerarx_sd_set_routing,
 };
 
 static const struct v4l2_subdev_ops cal_camerarx_subdev_ops = {
-	.video = &cal_camerarx_video_ops,
 	.pad = &cal_camerarx_pad_ops,
 };
 
 static struct media_entity_operations cal_camerarx_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
+	.has_pad_interdep = v4l2_subdev_has_pad_interdep,
 };
 
 /* ------------------------------------------------------------------
@@ -842,11 +968,12 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	sd = &phy->subdev;
 	v4l2_subdev_init(sd, &cal_camerarx_subdev_ops);
 	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
-	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
 	snprintf(sd->name, sizeof(sd->name), "CAMERARX%u", instance);
 	sd->dev = cal->dev;
 
 	phy->pads[CAL_CAMERARX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+
 	for (i = CAL_CAMERARX_PAD_FIRST_SOURCE; i < CAL_CAMERARX_NUM_PADS; ++i)
 		phy->pads[i].flags = MEDIA_PAD_FL_SOURCE;
 	sd->entity.ops = &cal_camerarx_media_ops;
@@ -879,7 +1006,9 @@ void cal_camerarx_destroy(struct cal_camerarx *phy)
 		return;
 
 	v4l2_device_unregister_subdev(&phy->subdev);
+
 	v4l2_subdev_cleanup(&phy->subdev);
+
 	media_entity_cleanup(&phy->subdev.entity);
 	of_node_put(phy->source_ep_node);
 	of_node_put(phy->source_node);
diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index d363e123d4bb..71578bfc97ba 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -119,12 +119,13 @@ static int __subdev_get_format(struct cal_ctx *ctx,
 {
 	struct v4l2_subdev_format sd_fmt;
 	struct v4l2_mbus_framefmt *mbus_fmt = &sd_fmt.format;
+	struct v4l2_subdev *sd = ctx->phy->source;
 	int ret;
 
 	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	sd_fmt.pad = 0;
 
-	ret = v4l2_subdev_call(ctx->phy->source, pad, get_fmt, NULL, &sd_fmt);
+	ret = v4l2_subdev_call_state_active(sd, pad, get_fmt, &sd_fmt);
 	if (ret)
 		return ret;
 
@@ -141,13 +142,14 @@ static int __subdev_set_format(struct cal_ctx *ctx,
 {
 	struct v4l2_subdev_format sd_fmt;
 	struct v4l2_mbus_framefmt *mbus_fmt = &sd_fmt.format;
+	struct v4l2_subdev *sd = ctx->phy->source;
 	int ret;
 
 	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	sd_fmt.pad = 0;
 	*mbus_fmt = *fmt;
 
-	ret = v4l2_subdev_call(ctx->phy->source, pad, set_fmt, NULL, &sd_fmt);
+	ret = v4l2_subdev_call_state_active(sd, pad, set_fmt, &sd_fmt);
 	if (ret)
 		return ret;
 
@@ -189,6 +191,7 @@ static int cal_legacy_try_fmt_vid_cap(struct file *file, void *priv,
 				      struct v4l2_format *f)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
+	struct v4l2_subdev *sd = ctx->phy->source;
 	const struct cal_format_info *fmtinfo;
 	struct v4l2_subdev_frame_size_enum fse;
 	int found;
@@ -213,8 +216,8 @@ static int cal_legacy_try_fmt_vid_cap(struct file *file, void *priv,
 	for (fse.index = 0; ; fse.index++) {
 		int ret;
 
-		ret = v4l2_subdev_call(ctx->phy->source, pad, enum_frame_size,
-				       NULL, &fse);
+		ret = v4l2_subdev_call_state_active(sd, pad, enum_frame_size,
+						    &fse);
 		if (ret)
 			break;
 
@@ -250,6 +253,7 @@ static int cal_legacy_s_fmt_vid_cap(struct file *file, void *priv,
 				    struct v4l2_format *f)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
+	struct v4l2_subdev *sd = &ctx->phy->subdev;
 	struct vb2_queue *q = &ctx->vb_vidq;
 	struct v4l2_subdev_format sd_fmt = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
@@ -289,7 +293,7 @@ static int cal_legacy_s_fmt_vid_cap(struct file *file, void *priv,
 	ctx->v_fmt.fmt.pix.field = sd_fmt.format.field;
 	cal_calc_format_size(ctx, fmtinfo, &ctx->v_fmt);
 
-	v4l2_subdev_call(&ctx->phy->subdev, pad, set_fmt, NULL, &sd_fmt);
+	v4l2_subdev_call_state_active(sd, pad, set_fmt, &sd_fmt);
 
 	ctx->fmtinfo = fmtinfo;
 	*f = ctx->v_fmt;
@@ -301,6 +305,7 @@ static int cal_legacy_enum_framesizes(struct file *file, void *fh,
 				      struct v4l2_frmsizeenum *fsize)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
+	struct v4l2_subdev *sd = ctx->phy->source;
 	const struct cal_format_info *fmtinfo;
 	struct v4l2_subdev_frame_size_enum fse;
 	int ret;
@@ -318,8 +323,7 @@ static int cal_legacy_enum_framesizes(struct file *file, void *fh,
 	fse.code = fmtinfo->code;
 	fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 
-	ret = v4l2_subdev_call(ctx->phy->source, pad, enum_frame_size, NULL,
-			       &fse);
+	ret = v4l2_subdev_call_state_active(sd, pad, enum_frame_size, &fse);
 	if (ret)
 		return ret;
 
@@ -361,6 +365,7 @@ static int cal_legacy_enum_frameintervals(struct file *file, void *priv,
 					  struct v4l2_frmivalenum *fival)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
+	struct v4l2_subdev *sd = ctx->phy->source;
 	const struct cal_format_info *fmtinfo;
 	struct v4l2_subdev_frame_interval_enum fie = {
 		.index = fival->index,
@@ -375,8 +380,8 @@ static int cal_legacy_enum_frameintervals(struct file *file, void *priv,
 		return -EINVAL;
 
 	fie.code = fmtinfo->code;
-	ret = v4l2_subdev_call(ctx->phy->source, pad, enum_frame_interval,
-			       NULL, &fie);
+
+	ret = v4l2_subdev_call_state_active(sd, pad, enum_frame_interval, &fie);
 	if (ret)
 		return ret;
 	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
@@ -694,8 +699,8 @@ static int cal_video_check_format(struct cal_ctx *ctx)
 {
 	const struct cal_format_info *rx_fmtinfo;
 	const struct v4l2_mbus_framefmt *format;
-	struct v4l2_subdev_state *state;
 	struct media_pad *remote_pad;
+	struct v4l2_subdev_state *state;
 	int ret = 0;
 
 	remote_pad = media_pad_remote_pad_first(&ctx->pad);
@@ -704,7 +709,8 @@ static int cal_video_check_format(struct cal_ctx *ctx)
 
 	state = v4l2_subdev_lock_and_get_active_state(&ctx->phy->subdev);
 
-	format = v4l2_subdev_get_pad_format(&ctx->phy->subdev, state, remote_pad->index);
+	format = v4l2_subdev_state_get_stream_format(state, remote_pad->index,
+						     0);
 	if (!format) {
 		ret = -EINVAL;
 		goto out;
@@ -733,10 +739,52 @@ static int cal_video_check_format(struct cal_ctx *ctx)
 static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
+	struct media_pad *remote_pad;
 	struct cal_buffer *buf;
 	dma_addr_t addr;
 	int ret;
 
+	remote_pad = media_pad_remote_pad_first(&ctx->pad);
+	if (!remote_pad) {
+		ctx_err(ctx, "Context not connected\n");
+		ret = -ENODEV;
+		goto error_release_buffers;
+	}
+
+	if (cal_mc_api) {
+		struct v4l2_subdev_route *route = NULL;
+		struct v4l2_subdev_route *r;
+		struct v4l2_subdev_state *state;
+
+		/* Find the PHY connected to this video device */
+
+		ctx->phy = cal_camerarx_get_phy_from_entity(remote_pad->entity);
+
+		state = v4l2_subdev_lock_and_get_active_state(&ctx->phy->subdev);
+
+		/* Find the stream */
+
+		for_each_active_route(&state->routing, r) {
+			if (r->source_pad != remote_pad->index)
+				continue;
+
+			route = r;
+
+			break;
+		}
+
+		if (!route) {
+			v4l2_subdev_unlock_state(state);
+			ctx_err(ctx, "Failed to find route\n");
+			ret = -ENODEV;
+			goto error_release_buffers;
+		}
+
+		ctx->stream = route->sink_stream;
+
+		v4l2_subdev_unlock_state(state);
+	}
+
 	ret = video_device_pipeline_alloc_start(&ctx->vdev);
 	if (ret < 0) {
 		ctx_err(ctx, "Failed to start media pipeline: %d\n", ret);
@@ -775,7 +823,8 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	cal_ctx_set_dma_addr(ctx, addr);
 	cal_ctx_start(ctx);
 
-	ret = v4l2_subdev_call(&ctx->phy->subdev, video, s_stream, 1);
+	ret = v4l2_subdev_enable_streams(&ctx->phy->subdev, remote_pad->index,
+					 BIT(0));
 	if (ret)
 		goto error_stop;
 
@@ -800,10 +849,14 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 static void cal_stop_streaming(struct vb2_queue *vq)
 {
 	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
+	struct media_pad *remote_pad;
 
 	cal_ctx_stop(ctx);
 
-	v4l2_subdev_call(&ctx->phy->subdev, video, s_stream, 0);
+	remote_pad = media_pad_remote_pad_first(&ctx->pad);
+
+	v4l2_subdev_disable_streams(&ctx->phy->subdev, remote_pad->index,
+				    BIT(0));
 
 	pm_runtime_put_sync(ctx->cal->dev);
 
@@ -812,6 +865,9 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 	cal_release_buffers(ctx, VB2_BUF_STATE_ERROR);
 
 	video_device_pipeline_stop(&ctx->vdev);
+
+	if (cal_mc_api)
+		ctx->phy = NULL;
 }
 
 static const struct vb2_ops cal_video_qops = {
@@ -845,6 +901,7 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 	const struct cal_format_info *fmtinfo;
 	unsigned int i, j, k;
 	int ret = 0;
+	struct v4l2_subdev *sd = ctx->phy->source;
 
 	/* Enumerate sub device formats and enable all matching local formats */
 	ctx->active_fmt = devm_kcalloc(ctx->cal->dev, cal_num_formats,
@@ -859,20 +916,20 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 		memset(&mbus_code, 0, sizeof(mbus_code));
 		mbus_code.index = j;
 		mbus_code.which = V4L2_SUBDEV_FORMAT_ACTIVE;
-		ret = v4l2_subdev_call(ctx->phy->source, pad, enum_mbus_code,
-				       NULL, &mbus_code);
+		ret = v4l2_subdev_call_state_active(sd, pad, enum_mbus_code,
+						    &mbus_code);
 		if (ret == -EINVAL)
 			break;
 
 		if (ret) {
 			ctx_err(ctx, "Error enumerating mbus codes in subdev %s: %d\n",
-				ctx->phy->source->name, ret);
+				sd->name, ret);
 			return ret;
 		}
 
 		ctx_dbg(2, ctx,
 			"subdev %s: code: %04x idx: %u\n",
-			ctx->phy->source->name, mbus_code.code, j);
+			sd->name, mbus_code.code, j);
 
 		for (k = 0; k < cal_num_formats; k++) {
 			fmtinfo = &cal_formats[k];
@@ -890,7 +947,7 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 
 	if (i == 0) {
 		ctx_err(ctx, "No suitable format reported by subdev %s\n",
-			ctx->phy->source->name);
+			sd->name);
 		return -EINVAL;
 	}
 
@@ -976,16 +1033,49 @@ int cal_ctx_v4l2_register(struct cal_ctx *ctx)
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
+		for (phy_idx = 0; phy_idx < ctx->cal->data->num_csi2_phy;
+		     ++phy_idx) {
+			for (pad_idx = 1; pad_idx < CAL_CAMERARX_NUM_PADS;
+			     ++pad_idx) {
+				/*
+				 * Enable only links from video0 to PHY0 pad 1,
+				 * and video1 to PHY1 pad 1.
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
+		ret = media_create_pad_link(&ctx->phy->subdev.entity,
+			CAL_CAMERARX_PAD_FIRST_SOURCE, &vfd->entity, 0,
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
diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index 053bf1030af0..074bf33c3697 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -495,10 +495,11 @@ static bool cal_ctx_wr_dma_stopped(struct cal_ctx *ctx)
 }
 
 static int
-cal_get_remote_frame_desc_entry(struct cal_camerarx *phy,
+cal_get_remote_frame_desc_entry(struct cal_camerarx *phy, u32 stream,
 				struct v4l2_mbus_frame_desc_entry *entry)
 {
 	struct v4l2_mbus_frame_desc fd;
+	unsigned int i;
 	int ret;
 
 	ret = cal_camerarx_get_remote_frame_desc(phy, &fd);
@@ -509,20 +510,18 @@ cal_get_remote_frame_desc_entry(struct cal_camerarx *phy,
 		return ret;
 	}
 
-	if (fd.num_entries == 0) {
-		dev_err(phy->cal->dev,
-			"No streams found in the remote frame descriptor\n");
-
-		return -ENODEV;
+	for (i = 0; i < fd.num_entries; i++) {
+		if (stream == fd.entry[i].stream) {
+			*entry = fd.entry[i];
+			return 0;
+		}
 	}
 
-	if (fd.num_entries > 1)
-		dev_dbg(phy->cal->dev,
-			"Multiple streams not supported in remote frame descriptor, using the first one\n");
+	dev_err(phy->cal->dev,
+		"Failed to find stream %u from remote frame descriptor\n",
+		stream);
 
-	*entry = fd.entry[0];
-
-	return 0;
+	return -ENODEV;
 }
 
 int cal_ctx_prepare(struct cal_ctx *ctx)
@@ -530,14 +529,15 @@ int cal_ctx_prepare(struct cal_ctx *ctx)
 	struct v4l2_mbus_frame_desc_entry entry;
 	int ret;
 
-	ret = cal_get_remote_frame_desc_entry(ctx->phy, &entry);
+	ret = cal_get_remote_frame_desc_entry(ctx->phy, ctx->stream, &entry);
 
 	if (ret == -ENOIOCTLCMD) {
 		ctx->vc = 0;
 		ctx->datatype = CAL_CSI2_CTX_DT_ANY;
 	} else if (!ret) {
-		ctx_dbg(2, ctx, "Framedesc: len %u, vc %u, dt %#x\n",
-			entry.length, entry.bus.csi2.vc, entry.bus.csi2.dt);
+		ctx_dbg(2, ctx, "Framedesc: stream %u, len %u, vc %u, dt %#x\n",
+			entry.stream, entry.length, entry.bus.csi2.vc,
+			entry.bus.csi2.dt);
 
 		ctx->vc = entry.bus.csi2.vc;
 		ctx->datatype = entry.bus.csi2.dt;
@@ -1069,10 +1069,10 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 		return NULL;
 
 	ctx->cal = cal;
-	ctx->phy = cal->phy[inst];
 	ctx->dma_ctx = inst;
 	ctx->csi2_ctx = inst;
 	ctx->cport = inst;
+	ctx->stream = 0;
 
 	ret = cal_ctx_v4l2_init(ctx);
 	if (ret) {
@@ -1281,18 +1281,33 @@ static int cal_probe(struct platform_device *pdev)
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
+			cal->ctx[cal->num_contexts] = cal_ctx_create(cal, i);
+			if (!cal->ctx[cal->num_contexts]) {
+				cal_err(cal, "Failed to create context %u\n", cal->num_contexts);
+				ret = -ENODEV;
+				goto error_context;
+			}
+
+			cal->ctx[cal->num_contexts]->phy = cal->phy[i];
 
-		cal->ctx[cal->num_contexts] = cal_ctx_create(cal, i);
-		if (!cal->ctx[cal->num_contexts]) {
-			cal_err(cal, "Failed to create context %u\n", cal->num_contexts);
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
diff --git a/drivers/media/platform/ti/cal/cal.h b/drivers/media/platform/ti/cal/cal.h
index 79cd0171e701..e1f693bbeb07 100644
--- a/drivers/media/platform/ti/cal/cal.h
+++ b/drivers/media/platform/ti/cal/cal.h
@@ -45,7 +45,7 @@
 
 #define CAL_CAMERARX_PAD_SINK		0
 #define CAL_CAMERARX_PAD_FIRST_SOURCE	1
-#define CAL_CAMERARX_NUM_SOURCE_PADS	1
+#define CAL_CAMERARX_NUM_SOURCE_PADS	8
 #define CAL_CAMERARX_NUM_PADS		(1 + CAL_CAMERARX_NUM_SOURCE_PADS)
 
 static inline bool cal_rx_pad_is_sink(u32 pad)
@@ -247,6 +247,7 @@ struct cal_ctx {
 	u8			pix_proc;
 	u8			vc;
 	u8			datatype;
+	u32			stream;
 
 	bool			use_pix_proc;
 };
@@ -322,6 +323,7 @@ void cal_quickdump_regs(struct cal_dev *cal);
 
 int cal_camerarx_get_remote_frame_desc(struct cal_camerarx *phy,
 				       struct v4l2_mbus_frame_desc *desc);
+struct cal_camerarx *cal_camerarx_get_phy_from_entity(struct media_entity *entity);
 void cal_camerarx_disable(struct cal_camerarx *phy);
 void cal_camerarx_i913_errata(struct cal_camerarx *phy);
 struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
-- 
2.34.1

