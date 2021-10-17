Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36FC8430B6C
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 20:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344134AbhJQS02 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 14:26:28 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:52575 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344093AbhJQS0Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 14:26:25 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 64800200007;
        Sun, 17 Oct 2021 18:24:13 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        kieran.bingham@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 02/13] media: max9286: Implement set_routing
Date:   Sun, 17 Oct 2021 20:24:38 +0200
Message-Id: <20211017182449.64192-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
References: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the set_routing() subdev operation to allow userspace to configure
routing on the max9286 deserializer.

Implement route verification but do not take routing into consideration
when configuring the CSI-2 output and pixel rate yet.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 88 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 86 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 5997fe40509f..54b4067168df 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -833,6 +833,90 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int max9286_routing_verify(struct max9286_priv *priv,
+				  struct v4l2_subdev_krouting *routing)
+{
+	unsigned int i;
+	int ret;
+
+	ret = v4l2_routing_simple_verify(routing);
+	if (ret)
+		return ret;
+
+	/*
+	 * Make sure all routes points to the single source pad which can have
+	 * up to 4 streams. All routes shall start from a sink pad and shall not
+	 * have more than one sink stream. The GMSL link for the sink has to be
+	 * enabled.
+	 */
+	for (i = 0; i < routing->num_routes; ++i) {
+		const struct v4l2_subdev_route *route = &routing->routes[i];
+		struct max9286_source *source = &priv->sources[i];
+
+		if (route->source_pad != MAX9286_SRC_PAD ||
+		    route->source_stream > 4) {
+			dev_err(&priv->client->dev,
+				"Invalid (%u,%u) source in route %u\n",
+				route->source_pad, route->source_stream, i);
+			return -EINVAL;
+		}
+
+		if (route->sink_pad >= MAX9286_N_SINKS ||
+		    route->sink_stream != 0) {
+			dev_err(&priv->client->dev,
+				"Invalid (%u,%u) sink in route %u\n",
+				route->sink_pad, route->sink_stream, i);
+			return -EINVAL;
+		}
+
+		source = &priv->sources[route->sink_pad];
+		if (!source->fwnode) {
+			dev_err(&priv->client->dev,
+				"Cannot set route for non-active source %u\n",
+				route->sink_pad);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int _max9286_set_routing(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_krouting *routing)
+{
+	struct max9286_priv *priv = sd_to_max9286(sd);
+	int ret;
+
+	ret = max9286_routing_verify(priv, routing);
+	if (ret)
+		return ret;
+
+	/* Re-initialize the format on a routing change. */
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing,
+					       &max9286_default_format);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int max9286_set_routing(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *state,
+			       enum v4l2_subdev_format_whence which,
+			       struct v4l2_subdev_krouting *routing)
+{
+	struct max9286_priv *priv = sd_to_max9286(sd);
+	unsigned int i;
+	int ret;
+
+	state = v4l2_subdev_validate_and_lock_state(sd, state);
+	ret = _max9286_set_routing(sd, state, routing);
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
 static int max9286_init_cfg(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *state)
 {
@@ -859,8 +943,7 @@ static int max9286_init_cfg(struct v4l2_subdev *sd,
 	routing.routes = routes;
 
 	state = v4l2_subdev_validate_and_lock_state(sd, state);
-	ret = v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
-					       &max9286_default_format);
+	ret = _max9286_set_routing(sd, state, &routing);
 	v4l2_subdev_unlock_state(state);
 
 	return ret;
@@ -875,6 +958,7 @@ static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
 	.enum_mbus_code = max9286_enum_mbus_code,
 	.get_fmt	= max9286_get_fmt,
 	.set_fmt	= max9286_set_fmt,
+	.set_routing	= max9286_set_routing,
 };
 
 static const struct v4l2_subdev_ops max9286_subdev_ops = {
-- 
2.33.0

