Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 704F941073E
	for <lists+linux-media@lfdr.de>; Sat, 18 Sep 2021 17:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239538AbhIRPGK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Sep 2021 11:06:10 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:54619 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231336AbhIRPGK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Sep 2021 11:06:10 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id BB2A840009;
        Sat, 18 Sep 2021 15:04:43 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        kieran.bingham@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Thomas NIZAN <tnizan@witekio.com>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/5] media: max9286: Implement multiplexed support
Date:   Sat, 18 Sep 2021 17:05:03 +0200
Message-Id: <20210918150507.987294-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210918150507.987294-1-jacopo+renesas@jmondi.org>
References: <20210918150507.987294-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement support for multiplexed streams to the max9286 driver.

Add support for the init_cfg, get_frame_desc and set_routing operations
and move format handling to the subdevice state.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 235 ++++++++++++++++++++++++------------
 1 file changed, 160 insertions(+), 75 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 1b92d18a1f94..baff86a4dcec 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -476,6 +476,18 @@ static int max9286_check_config_link(struct max9286_priv *priv,
 	return 0;
 }
 
+static void max9286_init_format(struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->width		= 1280;
+	fmt->height		= 800;
+	fmt->code		= MEDIA_BUS_FMT_UYVY8_1X16;
+	fmt->colorspace		= V4L2_COLORSPACE_SRGB;
+	fmt->field		= V4L2_FIELD_NONE;
+	fmt->ycbcr_enc		= V4L2_YCBCR_ENC_DEFAULT;
+	fmt->quantization	= V4L2_QUANTIZATION_DEFAULT;
+	fmt->xfer_func		= V4L2_XFER_FUNC_DEFAULT;
+}
+
 /* -----------------------------------------------------------------------------
  * V4L2 Subdev
  */
@@ -745,28 +757,18 @@ static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static struct v4l2_mbus_framefmt *
-max9286_get_pad_format(struct max9286_priv *priv,
-		       struct v4l2_subdev_state *sd_state,
-		       unsigned int pad, u32 which)
-{
-	switch (which) {
-	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&priv->sd, sd_state, pad);
-	case V4L2_SUBDEV_FORMAT_ACTIVE:
-		return &priv->fmt[pad];
-	default:
-		return NULL;
-	}
-}
-
 static int max9286_set_fmt(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
-	struct max9286_priv *priv = sd_to_max9286(sd);
-	struct v4l2_mbus_framefmt *cfg_fmt;
+	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
+	int ret = 0;
 
+	/*
+	 * Refuse to set format on the multiplexed source pad.
+	 * Format is propagated from sinks streams to source streams.
+	 */
 	if (format->pad == MAX9286_SRC_PAD)
 		return -EINVAL;
 
@@ -782,44 +784,143 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
 		break;
 	}
 
-	cfg_fmt = max9286_get_pad_format(priv, sd_state, format->pad,
-					 format->which);
-	if (!cfg_fmt)
+	state = v4l2_subdev_validate_and_lock_state(sd, sd_state);
+	fmt = v4l2_state_get_stream_format(state, format->pad,
+					   format->stream);
+	if (!fmt) {
+		ret = -EINVAL;
+		goto out;
+	}
+	*fmt = format->format;
+
+	/* Propagate format to the other end of the route. */
+	fmt = v4l2_state_get_opposite_stream_format(state, format->pad,
+						    format->stream);
+	if (!fmt) {
+		ret = -EINVAL;
+		goto out;
+	}
+	*fmt = format->format;
+
+out:
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
+static int max9286_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				  struct v4l2_mbus_frame_desc *fd)
+{
+	const struct v4l2_subdev_krouting *routing;
+	struct v4l2_subdev_state *state;
+	unsigned int i;
+	int ret = 0;
+
+	if (pad != MAX9286_SRC_PAD)
 		return -EINVAL;
 
-	mutex_lock(&priv->mutex);
-	*cfg_fmt = format->format;
-	mutex_unlock(&priv->mutex);
+	state = v4l2_subdev_lock_active_state(sd);
+	routing = &state->routing;
 
-	return 0;
+	/* One stream per each connected route. */
+	memset(fd, 0, sizeof(*fd));
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+	for (i = 0; i < routing->num_routes; ++i) {
+		const struct v4l2_subdev_route *route = &routing->routes[i];
+		unsigned int idx = fd->num_entries;
+		struct v4l2_mbus_framefmt *fmt;
+
+		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+			continue;
+
+		if (route->source_pad != pad)
+			continue;
+
+		fmt = v4l2_state_get_stream_format(state, pad,
+						   route->source_stream);
+		if (!fmt) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		/*
+		 * Assume a YUYV format (0x1e DT) and 16 bpp: we only support
+		 * these formats at the moment.
+		 */
+		fd->entry[idx].stream = idx;
+		fd->entry[idx].flags = V4L2_MBUS_FRAME_DESC_FL_LEN_MAX;
+		fd->entry[idx].length = fmt->width * fmt->height * 16 / 8;
+		fd->entry[idx].pixelcode = fmt->code;
+
+		fd->entry[idx].bus.csi2.vc = route->source_stream;
+		fd->entry[idx].bus.csi2.dt = 0x1e;
+
+		fd->num_entries++;
+	}
+
+out:
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
 }
 
-static int max9286_get_fmt(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_state *sd_state,
-			   struct v4l2_subdev_format *format)
+static int max9286_set_routing(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *state,
+			       struct v4l2_subdev_krouting *routing)
 {
-	struct max9286_priv *priv = sd_to_max9286(sd);
-	struct v4l2_mbus_framefmt *cfg_fmt;
-	unsigned int pad = format->pad;
+	struct v4l2_mbus_framefmt format;
+	int ret;
 
 	/*
-	 * Multiplexed Stream Support: Support link validation by returning the
-	 * format of the first bound link. All links must have the same format,
-	 * as we do not support mixing and matching of cameras connected to the
-	 * max9286.
+	 * Note: we can only support up to V4L2_FRAME_DESC_ENTRY_MAX, until
+	 * frame desc is made dynamically allocated.
 	 */
-	if (pad == MAX9286_SRC_PAD)
-		pad = __ffs(priv->bound_sources);
 
-	cfg_fmt = max9286_get_pad_format(priv, sd_state, pad, format->which);
-	if (!cfg_fmt)
+	if (routing->num_routes >= V4L2_FRAME_DESC_ENTRY_MAX)
 		return -EINVAL;
 
-	mutex_lock(&priv->mutex);
-	format->format = *cfg_fmt;
-	mutex_unlock(&priv->mutex);
+	ret = v4l2_routing_simple_verify(routing);
+	if (ret)
+		return ret;
 
-	return 0;
+	state = v4l2_subdev_validate_and_lock_state(sd, state);
+
+	max9286_init_format(&format);
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
+
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
+static int max9286_init_cfg(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes[MAX9286_NUM_GMSL];
+	struct max9286_priv *priv = sd_to_max9286(sd);
+	struct v4l2_subdev_krouting routing;
+	struct max9286_source *source;
+	unsigned int num_routes = 0;
+	u32 which = state->which;
+
+	/* Create a route for each enable source. */
+	for_each_source(priv, source) {
+		struct v4l2_subdev_route *route = &routes[num_routes++];
+		unsigned int idx = to_index(priv, source);
+
+		route->sink_pad = idx;
+		route->sink_stream = 0;
+		route->source_pad = MAX9286_SRC_PAD;
+		route->source_stream = idx;
+		route->flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
+	}
+
+	routing.which = which;
+	routing.num_routes = num_routes;
+	routing.routes = routes;
+
+	return max9286_set_routing(sd, state, &routing);
 }
 
 static const struct v4l2_subdev_video_ops max9286_video_ops = {
@@ -827,9 +928,12 @@ static const struct v4l2_subdev_video_ops max9286_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
+	.init_cfg	= max9286_init_cfg,
 	.enum_mbus_code = max9286_enum_mbus_code,
-	.get_fmt	= max9286_get_fmt,
+	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= max9286_set_fmt,
+	.get_frame_desc = max9286_get_frame_desc,
+	.set_routing	= max9286_set_routing,
 };
 
 static const struct v4l2_subdev_ops max9286_subdev_ops = {
@@ -837,35 +941,6 @@ static const struct v4l2_subdev_ops max9286_subdev_ops = {
 	.pad		= &max9286_pad_ops,
 };
 
-static void max9286_init_format(struct v4l2_mbus_framefmt *fmt)
-{
-	fmt->width		= 1280;
-	fmt->height		= 800;
-	fmt->code		= MEDIA_BUS_FMT_UYVY8_1X16;
-	fmt->colorspace		= V4L2_COLORSPACE_SRGB;
-	fmt->field		= V4L2_FIELD_NONE;
-	fmt->ycbcr_enc		= V4L2_YCBCR_ENC_DEFAULT;
-	fmt->quantization	= V4L2_QUANTIZATION_DEFAULT;
-	fmt->xfer_func		= V4L2_XFER_FUNC_DEFAULT;
-}
-
-static int max9286_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
-{
-	struct v4l2_mbus_framefmt *format;
-	unsigned int i;
-
-	for (i = 0; i < MAX9286_N_SINKS; i++) {
-		format = v4l2_subdev_get_try_format(subdev, fh->state, i);
-		max9286_init_format(format);
-	}
-
-	return 0;
-}
-
-static const struct v4l2_subdev_internal_ops max9286_subdev_internal_ops = {
-	.open = max9286_open,
-};
-
 static int max9286_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	switch (ctrl->id) {
@@ -900,8 +975,8 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
 		max9286_init_format(&priv->fmt[i]);
 
 	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max9286_subdev_ops);
-	priv->sd.internal_ops = &max9286_subdev_internal_ops;
-	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			  V4L2_SUBDEV_FL_MULTIPLEXED;
 
 	v4l2_ctrl_handler_init(&priv->ctrls, 1);
 	priv->pixelrate = v4l2_ctrl_new_std(&priv->ctrls,
@@ -933,14 +1008,23 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
 	}
 	priv->sd.fwnode = ep;
 
+	ret = v4l2_subdev_alloc_state(&priv->sd);
+	if (ret) {
+		dev_err(dev, "Unable to allocate subdevice state/\n");
+		ret = -ENOENT;
+		goto err_put_node;
+	}
+
 	ret = v4l2_async_register_subdev(&priv->sd);
 	if (ret < 0) {
 		dev_err(dev, "Unable to register subdevice\n");
-		goto err_put_node;
+		goto err_free_state;
 	}
 
 	return 0;
 
+err_free_state:
+	v4l2_subdev_free_state(&priv->sd);
 err_put_node:
 	fwnode_handle_put(ep);
 err_async:
@@ -952,6 +1036,7 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
 static void max9286_v4l2_unregister(struct max9286_priv *priv)
 {
 	fwnode_handle_put(priv->sd.fwnode);
+	v4l2_subdev_free_state(&priv->sd);
 	v4l2_async_unregister_subdev(&priv->sd);
 	max9286_v4l2_notifier_unregister(priv);
 }
-- 
2.32.0

