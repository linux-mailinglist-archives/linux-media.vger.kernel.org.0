Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE6EC430B70
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 20:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344182AbhJQS03 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 14:26:29 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:53361 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344139AbhJQS02 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 14:26:28 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 9E06F200009;
        Sun, 17 Oct 2021 18:24:16 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        kieran.bingham@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 04/13] media: max9286: Use routes to configure link order
Date:   Sun, 17 Oct 2021 20:24:40 +0200
Message-Id: <20211017182449.64192-5-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
References: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the routing table to configure the link output order and link
masking.

The link output order defines the CSI-2 virtual channel a GSML stream
is output on. Configure ordering at stream start time and at chip
setup time. This last step requires to move the chip initialization
function after the V4L2 setup phase as it requires the subdev state from
where the routing table is retrieved from to be initialized.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 103 ++++++++++++++++++++++--------------
 1 file changed, 64 insertions(+), 39 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 2e635179aec0..3485478f08a5 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -500,6 +500,61 @@ static int max9286_check_config_link(struct max9286_priv *priv,
 	return 0;
 }
 
+/*
+ * Configure the links output order (which defines on which CSI-2 VC a
+ * link is output on) and configure link masking.
+ */
+static void max9286_config_links(struct max9286_priv *priv)
+{
+	const struct v4l2_subdev_krouting *routing;
+	struct v4l2_subdev_state *state;
+	u8 link_order = 0;
+	u8 vc_mask = 0xf;
+	unsigned int i;
+
+	state = v4l2_subdev_lock_active_state(&priv->sd);
+	routing = &state->routing;
+
+	for (i = 0; i < routing->num_routes; ++i) {
+		struct v4l2_subdev_route *route = &routing->routes[i];
+
+		if (!(priv->route_mask & BIT(i)))
+			continue;
+
+		/* Assign the CSI-2 VC using the source stream number. */
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
+		/* ffs() counts from 1. */
+		vc = ffs(vc_mask) - 1;
+		link_order |= vc << (2 * i);
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
+	max9286_write(priv, 0x69, 0xf & ~priv->route_mask);
+
+	v4l2_subdev_unlock_state(state);
+}
+
 /* -----------------------------------------------------------------------------
  * V4L2 Subdev
  */
@@ -701,6 +756,8 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 	int ret;
 
 	if (enable) {
+		max9286_config_links(priv);
+
 		/*
 		 * The frame sync between cameras is transmitted across the
 		 * reverse channel as GPIO. We must open all channels while
@@ -1109,32 +1166,6 @@ static void max9286_v4l2_unregister(struct max9286_priv *priv)
 
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
-
 	/*
 	 * Set the I2C bus speed.
 	 *
@@ -1144,13 +1175,7 @@ static int max9286_setup(struct max9286_priv *priv)
 	max9286_configure_i2c(priv, true);
 	max9286_reverse_channel_setup(priv, priv->init_rev_chan_mv);
 
-	/*
-	 * Enable GMSL links, mask unused ones and autodetect link
-	 * used as CSI clock source.
-	 */
-	max9286_write(priv, 0x00, MAX9286_MSTLINKSEL_AUTO | priv->route_mask);
-	max9286_write(priv, 0x0b, link_order[priv->route_mask]);
-	max9286_write(priv, 0x69, (0xf & ~priv->route_mask));
+	max9286_config_links(priv);
 
 	/*
 	 * Video format setup:
@@ -1324,12 +1349,6 @@ static int max9286_init(struct device *dev)
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
@@ -1340,6 +1359,12 @@ static int max9286_init(struct device *dev)
 		goto err_poc_disable;
 	}
 
+	ret = max9286_setup(priv);
+	if (ret) {
+		dev_err(dev, "Unable to setup max9286\n");
+		goto err_poc_disable;
+	}
+
 	ret = max9286_i2c_mux_init(priv);
 	if (ret) {
 		dev_err(dev, "Unable to initialize I2C multiplexer\n");
-- 
2.33.0

