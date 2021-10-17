Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83BF4430B6F
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 20:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344158AbhJQS02 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 14:26:28 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:47135 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344099AbhJQS01 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 14:26:27 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0C8B3200006;
        Sun, 17 Oct 2021 18:24:14 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        kieran.bingham@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 03/13] media: max9286: Use enabled routes to calculate pixelrate
Date:   Sun, 17 Oct 2021 20:24:39 +0200
Message-Id: <20211017182449.64192-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
References: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that the device supports routing, use the enabled routes instead
of the connected sources to compute the output pixel rate.

To do so, update the route_mask after a set_routing() call with the
ACTIVE format, and re-calculate the pixel rate just after.

At the same time, start and stop only the enabled routes at s_stream()
time.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 63 ++++++++++++++++++++++++++++++-------
 1 file changed, 51 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 54b4067168df..2e635179aec0 100644
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
@@ -410,7 +423,7 @@ static int max9286_check_video_links(struct max9286_priv *priv)
 		if (ret < 0)
 			return -EIO;
 
-		if ((ret & MAX9286_VIDEO_DETECT_MASK) == priv->source_mask)
+		if ((ret & MAX9286_VIDEO_DETECT_MASK) == priv->route_mask)
 			break;
 
 		usleep_range(350, 500);
@@ -494,9 +507,10 @@ static int max9286_check_config_link(struct max9286_priv *priv,
 static int max9286_set_pixelrate(struct max9286_priv *priv)
 {
 	struct max9286_source *source = NULL;
+	unsigned int num_routes = 0;
 	u64 pixelrate = 0;
 
-	for_each_source(priv, source) {
+	for_each_route(priv, source) {
 		struct v4l2_ctrl *ctrl;
 		u64 source_rate = 0;
 
@@ -517,6 +531,8 @@ static int max9286_set_pixelrate(struct max9286_priv *priv)
 				"Unable to calculate pixel rate\n");
 			return -EINVAL;
 		}
+
+		num_routes++;
 	}
 
 	if (!pixelrate) {
@@ -530,7 +546,7 @@ static int max9286_set_pixelrate(struct max9286_priv *priv)
 	 * by the number of available sources.
 	 */
 	return v4l2_ctrl_s_ctrl_int64(priv->pixelrate,
-				      pixelrate * priv->nsources);
+				      pixelrate * num_routes);
 }
 
 static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
@@ -692,8 +708,8 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 		 */
 		max9286_i2c_mux_open(priv);
 
-		/* Start all cameras. */
-		for_each_source(priv, source) {
+		/* Start cameras. */
+		for_each_route(priv, source) {
 			ret = v4l2_subdev_call(source->sd, video, s_stream, 1);
 			if (ret)
 				return ret;
@@ -734,8 +750,8 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 	} else {
 		max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);
 
-		/* Stop all cameras. */
-		for_each_source(priv, source)
+		/* Stop cameras. */
+		for_each_route(priv, source)
 			v4l2_subdev_call(source->sd, video, s_stream, 0);
 
 		max9286_i2c_mux_close(priv);
@@ -912,6 +928,29 @@ static int max9286_set_routing(struct v4l2_subdev *sd,
 
 	state = v4l2_subdev_validate_and_lock_state(sd, state);
 	ret = _max9286_set_routing(sd, state, routing);
+	if (ret)
+		goto out;
+
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		goto out;
+
+	/*
+	 * Update the active routes mask and the pixel rate according to the
+	 * routed sources.
+	 */
+	priv->route_mask = 0;
+	for (i = 0; i < routing->num_routes; ++i) {
+		struct v4l2_subdev_route *route = &routing->routes[i];
+
+		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+			continue;
+
+		priv->route_mask |= BIT(route->sink_pad);
+	}
+
+	max9286_set_pixelrate(priv);
+
+out:
 	v4l2_subdev_unlock_state(state);
 
 	return ret;
-- 
2.33.0

