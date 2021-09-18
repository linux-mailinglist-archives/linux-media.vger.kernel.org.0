Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1DDC410740
	for <lists+linux-media@lfdr.de>; Sat, 18 Sep 2021 17:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239604AbhIRPGM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Sep 2021 11:06:12 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:41733 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239564AbhIRPGM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Sep 2021 11:06:12 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id BB3CC40006;
        Sat, 18 Sep 2021 15:04:45 +0000 (UTC)
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
Subject: [PATCH 2/5] media: max9286: Apply routing configuration
Date:   Sat, 18 Sep 2021 17:05:04 +0200
Message-Id: <20210918150507.987294-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210918150507.987294-1-jacopo+renesas@jmondi.org>
References: <20210918150507.987294-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the routing table to configure the CSI-2 output.

Assing to each enabled GMSL link a CSI-2 Virtual Channel identifier and
mask links with not route associated. Update the pixel rate control
according to the active routes.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 189 +++++++++++++++++++++++++-----------
 1 file changed, 133 insertions(+), 56 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index baff86a4dcec..79af880147d0 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -189,8 +189,11 @@ struct max9286_priv {
 	struct v4l2_async_notifier notifier;
 };

+#define to_index(priv, source) ((source) - &(priv)->sources[0])
+
 static struct max9286_source *next_source(struct max9286_priv *priv,
-					  struct max9286_source *source)
+					  struct max9286_source *source,
+					  bool routed)
 {
 	if (!source)
 		source = &priv->sources[0];
@@ -198,17 +201,27 @@ static struct max9286_source *next_source(struct max9286_priv *priv,
 		source++;

 	for (; source < &priv->sources[MAX9286_NUM_GMSL]; source++) {
-		if (source->fwnode)
+		unsigned int index = to_index(priv, source);
+
+		if (!source->fwnode)
+			continue;
+
+		/*
+		 * Careful here! A very unfortunate call to set_routing() can
+		 * change priv->route_mask behind our back!
+		 */
+		if (!routed || priv->route_mask & BIT(index))
 			return source;
 	}

 	return NULL;
 }

-#define for_each_source(priv, source) \
-	for ((source) = NULL; ((source) = next_source((priv), (source))); )
+#define for_each_route(priv, source) \
+	for ((source) = NULL; ((source) = next_source((priv), (source), true)); )

-#define to_index(priv, source) ((source) - &(priv)->sources[0])
+#define for_each_source(priv, source) \
+	for ((source) = NULL; ((source) = next_source((priv), (source), false)); )

 static inline struct max9286_priv *sd_to_max9286(struct v4l2_subdev *sd)
 {
@@ -399,7 +412,7 @@ static int max9286_check_video_links(struct max9286_priv *priv)
 		if (ret < 0)
 			return -EIO;

-		if ((ret & MAX9286_VIDEO_DETECT_MASK) == priv->source_mask)
+		if ((ret & MAX9286_VIDEO_DETECT_MASK) == priv->route_mask)
 			break;

 		usleep_range(350, 500);
@@ -476,6 +489,67 @@ static int max9286_check_config_link(struct max9286_priv *priv,
 	return 0;
 }

+/*
+ * Configure the links output order (aka CSI-2 VC) and update the enabled routes
+ * mask according to the routing configuration.
+ */
+static void max9286_config_routes(struct max9286_priv *priv,
+				  struct v4l2_subdev_state *state)
+{
+	const struct v4l2_subdev_krouting *routing;
+	u8 link_order = 0;
+	u8 vc_mask = 0xf;
+	unsigned int i;
+
+	routing = &state->routing;
+	priv->route_mask = 0;
+
+	for (i = 0; i < routing->num_routes; ++i) {
+		struct v4l2_subdev_route *route = &routing->routes[i];
+
+		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+			continue;
+
+		/*
+		 * Mark the route enabled and assign the CSI-2 VC using the
+		 * source stream number.
+		 */
+		priv->route_mask |= BIT(route->sink_pad);
+		link_order |= route->source_stream << (2 * route->sink_pad);
+		vc_mask &= ~BIT(route->source_stream);
+	}
+
+	/*
+	 * This might look rather silly, but now that we have assigned a
+	 * VC to the enabled routes, we have to assign one to the disabled
+	 * routes as well, as there cannot be two sources with the same VC.
+	 */
+	for (i = 0; i < MAX9286_NUM_GMSL; ++i) {
+		unsigned int vc;
+
+		if (priv->route_mask & BIT(i))
+			continue;
+
+		/*
+		 * ffs() counts from 1; assign it here to avoid subtracting 1
+		 * from 0.
+		 */
+		vc = ffs(vc_mask) - 1;
+		link_order |= vc << 2 * i;
+		vc_mask &= ~BIT(vc);
+	}
+
+	/*
+	 * Use the enabled routes to enable GMSL links, configure the CSI-2
+	 * output order, mask unused links and autodetect link used as CSI
+	 * clock source.
+	 */
+	max9286_write(priv, 0x00, MAX9286_MSTLINKSEL_AUTO | priv->route_mask);
+	max9286_write(priv, 0x0b, link_order);
+	max9286_write(priv, 0x14, link_order);
+	max9286_write(priv, 0x69, 0xf & ~priv->route_mask);
+}
+
 static void max9286_init_format(struct v4l2_mbus_framefmt *fmt)
 {
 	fmt->width		= 1280;
@@ -495,9 +569,10 @@ static void max9286_init_format(struct v4l2_mbus_framefmt *fmt)
 static int max9286_set_pixelrate(struct max9286_priv *priv)
 {
 	struct max9286_source *source = NULL;
+	unsigned int num_routes = 0;
 	u64 pixelrate = 0;

-	for_each_source(priv, source) {
+	for_each_route(priv, source) {
 		struct v4l2_ctrl *ctrl;
 		u64 source_rate = 0;

@@ -518,6 +593,8 @@ static int max9286_set_pixelrate(struct max9286_priv *priv)
 				"Unable to calculate pixel rate\n");
 			return -EINVAL;
 		}
+
+		num_routes++;
 	}

 	if (!pixelrate) {
@@ -531,7 +608,7 @@ static int max9286_set_pixelrate(struct max9286_priv *priv)
 	 * by the number of available sources.
 	 */
 	return v4l2_ctrl_s_ctrl_int64(priv->pixelrate,
-				      pixelrate * priv->nsources);
+				      pixelrate * num_routes);
 }

 static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
@@ -693,8 +770,8 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 		 */
 		max9286_i2c_mux_open(priv);

-		/* Start all cameras. */
-		for_each_source(priv, source) {
+		/* Start cameras. */
+		for_each_route(priv, source) {
 			ret = v4l2_subdev_call(source->sd, video, s_stream, 1);
 			if (ret)
 				return ret;
@@ -735,8 +812,8 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 	} else {
 		max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);

-		/* Stop all cameras. */
-		for_each_source(priv, source)
+		/* Stop cameras. */
+		for_each_route(priv, source)
 			v4l2_subdev_call(source->sd, video, s_stream, 0);

 		max9286_i2c_mux_close(priv);
@@ -865,10 +942,11 @@ static int max9286_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	return ret;
 }

-static int max9286_set_routing(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_state *state,
-			       struct v4l2_subdev_krouting *routing)
+static int __max9286_set_routing(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 struct v4l2_subdev_krouting *routing)
 {
+	struct max9286_priv *priv = sd_to_max9286(sd);
 	struct v4l2_mbus_framefmt format;
 	int ret;

@@ -884,11 +962,33 @@ static int max9286_set_routing(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;

-	state = v4l2_subdev_validate_and_lock_state(sd, state);
-
 	max9286_init_format(&format);
 	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
+	if (ret)
+		return ret;
+
+	if (state->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		max9286_config_routes(priv, state);
+
+	return 0;
+}
+
+static int max9286_set_routing(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *state,
+			       struct v4l2_subdev_krouting *routing)
+{
+	struct max9286_priv *priv = sd_to_max9286(sd);
+	int ret;
+
+	state = v4l2_subdev_validate_and_lock_state(sd, state);
+	ret = __max9286_set_routing(sd, state, routing);
+	if (ret)
+		goto out;

+	if (state->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		max9286_set_pixelrate(priv);
+
+out:
 	v4l2_subdev_unlock_state(state);

 	return ret;
@@ -903,6 +1003,7 @@ static int max9286_init_cfg(struct v4l2_subdev *sd,
 	struct max9286_source *source;
 	unsigned int num_routes = 0;
 	u32 which = state->which;
+	int ret;

 	/* Create a route for each enable source. */
 	for_each_source(priv, source) {
@@ -920,7 +1021,11 @@ static int max9286_init_cfg(struct v4l2_subdev *sd,
 	routing.num_routes = num_routes;
 	routing.routes = routes;

-	return max9286_set_routing(sd, state, &routing);
+	state = v4l2_subdev_validate_and_lock_state(sd, state);
+	ret = __max9286_set_routing(sd, state, &routing);
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
 }

 static const struct v4l2_subdev_video_ops max9286_video_ops = {
@@ -1047,31 +1152,7 @@ static void max9286_v4l2_unregister(struct max9286_priv *priv)

 static int max9286_setup(struct max9286_priv *priv)
 {
-	/*
-	 * Link ordering values for all enabled links combinations. Orders must
-	 * be assigned sequentially from 0 to the number of enabled links
-	 * without leaving any hole for disabled links. We thus assign orders to
-	 * enabled links first, and use the remaining order values for disabled
-	 * links are all links must have a different order value;
-	 */
-	static const u8 link_order[] = {
-		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* xxxx */
-		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* xxx0 */
-		(3 << 6) | (2 << 4) | (0 << 2) | (1 << 0), /* xx0x */
-		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* xx10 */
-		(3 << 6) | (0 << 4) | (2 << 2) | (1 << 0), /* x0xx */
-		(3 << 6) | (1 << 4) | (2 << 2) | (0 << 0), /* x1x0 */
-		(3 << 6) | (1 << 4) | (0 << 2) | (2 << 0), /* x10x */
-		(3 << 6) | (1 << 4) | (1 << 2) | (0 << 0), /* x210 */
-		(0 << 6) | (3 << 4) | (2 << 2) | (1 << 0), /* 0xxx */
-		(1 << 6) | (3 << 4) | (2 << 2) | (0 << 0), /* 1xx0 */
-		(1 << 6) | (3 << 4) | (0 << 2) | (2 << 0), /* 1x0x */
-		(2 << 6) | (3 << 4) | (1 << 2) | (0 << 0), /* 2x10 */
-		(1 << 6) | (0 << 4) | (3 << 2) | (2 << 0), /* 10xx */
-		(2 << 6) | (1 << 4) | (3 << 2) | (0 << 0), /* 21x0 */
-		(2 << 6) | (1 << 4) | (0 << 2) | (3 << 0), /* 210x */
-		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* 3210 */
-	};
+	struct v4l2_subdev_state *state;

 	/*
 	 * Set the I2C bus speed.
@@ -1082,13 +1163,9 @@ static int max9286_setup(struct max9286_priv *priv)
 	max9286_configure_i2c(priv, true);
 	max9286_reverse_channel_setup(priv, priv->init_rev_chan_mv);

-	/*
-	 * Enable GMSL links, mask unused ones and autodetect link
-	 * used as CSI clock source.
-	 */
-	max9286_write(priv, 0x00, MAX9286_MSTLINKSEL_AUTO | priv->route_mask);
-	max9286_write(priv, 0x0b, link_order[priv->route_mask]);
-	max9286_write(priv, 0x69, (0xf & ~priv->route_mask));
+	state = v4l2_subdev_lock_active_state(&priv->sd);
+	max9286_config_routes(priv, state);
+	v4l2_subdev_unlock_state(state);

 	/*
 	 * Video format setup:
@@ -1262,12 +1339,6 @@ static int max9286_init(struct device *dev)
 	if (ret)
 		return ret;

-	ret = max9286_setup(priv);
-	if (ret) {
-		dev_err(dev, "Unable to setup max9286\n");
-		goto err_poc_disable;
-	}
-
 	/*
 	 * Register all V4L2 interactions for the MAX9286 and notifiers for
 	 * any subdevices connected.
@@ -1278,6 +1349,12 @@ static int max9286_init(struct device *dev)
 		goto err_poc_disable;
 	}

+	ret = max9286_setup(priv);
+	if (ret) {
+		dev_err(dev, "Unable to setup max9286\n");
+		goto err_v4l2_register;
+	}
+
 	ret = max9286_i2c_mux_init(priv);
 	if (ret) {
 		dev_err(dev, "Unable to initialize I2C multiplexer\n");
--
2.32.0

