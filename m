Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC574779EF
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 18:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239924AbhLPRDD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 12:03:03 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:50347 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239907AbhLPRDB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 12:03:01 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id BC04C1BF208;
        Thu, 16 Dec 2021 17:02:57 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        kieran.bingham@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 5/5] media: adv748x: Implement set_routing
Date:   Thu, 16 Dec 2021 18:03:23 +0100
Message-Id: <20211216170323.141321-6-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211216170323.141321-1-jacopo+renesas@jmondi.org>
References: <20211216170323.141321-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the set_routing() subdev operation to allow userspace to configure
the CSI-2 virtual channel.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c | 73 ++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 9824ebe44eb1..bf927898b918 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -340,12 +340,85 @@ static int adv748x_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	return ret;
 }
 
+static int adv748x_csi2_routing_validate(struct adv748x_csi2 *tx,
+					 struct v4l2_subdev_krouting *routing)
+{
+	struct v4l2_subdev_route *route;
+
+	if (routing->num_routes != 1) {
+		dev_err(tx->state->dev, "Unsupported number of routes %u",
+			routing->num_routes);
+		return -EINVAL;
+	}
+
+	route = &routing->routes[0];
+
+	if (route->sink_pad != ADV748X_CSI2_SINK ||
+	    route->source_pad != ADV748X_CSI2_SOURCE) {
+		dev_err(tx->state->dev,
+			"Routes should go from the sink to the source pads.\n");
+		return -EINVAL;
+	}
+
+	if (route->source_stream > 4) {
+		dev_err(tx->state->dev, "Unsupported source stream %u\n",
+			route->source_stream);
+		return -EINVAL;
+	}
+
+	if (route->sink_stream != 0) {
+		dev_err(tx->state->dev, "Unsupported sink stream %u\n",
+			route->sink_stream);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int adv748x_csi2_set_vc_with_routing(struct adv748x_csi2 *tx,
+					    struct v4l2_subdev_krouting *routing)
+{
+	struct v4l2_subdev_route *route = &routing->routes[0];
+
+	return adv748x_csi2_set_virtual_channel(tx, route->source_stream);
+}
+
+static int adv748x_csi2_set_routing(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    enum v4l2_subdev_format_whence which,
+				    struct v4l2_subdev_krouting *routing)
+{
+	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
+	int ret;
+
+	v4l2_subdev_lock_state(state);
+
+	ret = adv748x_csi2_routing_validate(tx, routing);
+	if (ret)
+		goto out;
+
+	ret = v4l2_subdev_set_routing(sd, state, routing);
+	if (ret)
+		goto out;
+
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		goto out;
+
+	ret = adv748x_csi2_set_vc_with_routing(tx, routing);
+
+out:
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
 static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
 	.init_cfg = adv748x_csi2_init_cfg,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = adv748x_csi2_set_format,
 	.get_mbus_config = adv748x_csi2_get_mbus_config,
 	.get_frame_desc = adv748x_csi2_get_frame_desc,
+	.set_routing = adv748x_csi2_set_routing,
 };
 
 /* -----------------------------------------------------------------------------
-- 
2.33.1

