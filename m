Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83084410742
	for <lists+linux-media@lfdr.de>; Sat, 18 Sep 2021 17:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239654AbhIRPGO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Sep 2021 11:06:14 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:51125 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239611AbhIRPGO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Sep 2021 11:06:14 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B7A304000C;
        Sat, 18 Sep 2021 15:04:47 +0000 (UTC)
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
Subject: [PATCH 3/5] media: max9286: Implement routing validation
Date:   Sat, 18 Sep 2021 17:05:05 +0200
Message-Id: <20210918150507.987294-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210918150507.987294-1-jacopo+renesas@jmondi.org>
References: <20210918150507.987294-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Validate the routing table by making sure all the routes start from a
sink pad and end in a source pad and that the stream numbers are
correct.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 50 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 79af880147d0..931c4f542c77 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -942,6 +942,54 @@ static int max9286_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	return ret;
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
 static int __max9286_set_routing(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *state,
 				 struct v4l2_subdev_krouting *routing)
@@ -958,7 +1006,7 @@ static int __max9286_set_routing(struct v4l2_subdev *sd,
 	if (routing->num_routes >= V4L2_FRAME_DESC_ENTRY_MAX)
 		return -EINVAL;
 
-	ret = v4l2_routing_simple_verify(routing);
+	ret = max9286_routing_verify(priv, routing);
 	if (ret)
 		return ret;
 
-- 
2.32.0

