Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE5F628F6A4
	for <lists+linux-media@lfdr.de>; Thu, 15 Oct 2020 18:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389893AbgJOQ1v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Oct 2020 12:27:51 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:36583 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389841AbgJOQ1p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Oct 2020 12:27:45 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D3DF5FF809;
        Thu, 15 Oct 2020 16:27:41 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 5/7] media: i2c: max9286: Configure reverse channel amplitude
Date:   Thu, 15 Oct 2020 20:27:08 +0200
Message-Id: <20201015182710.54795-6-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015182710.54795-1-jacopo+renesas@jmondi.org>
References: <20201015182710.54795-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adjust reverse channel amplitude according to the presence of
the 'high-threshold" DTS property.

If no high threshold compensation is required, start with a low
amplitude (100mV) and increase it after the remote serializers
have probed and have enabled noise immunity on their reverse
channels.

If high threshold compensation is required, configure the reverse
channel with a 170mV amplitude before the remote serializers have
probed.

This change is required for both rdacm20 and rdacm21 camera modules
to be correctly probed when used in combination with the max9286
deserializer.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 74 +++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 27 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 163e102199e3..4b59a9e0228a 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -163,6 +163,8 @@ struct max9286_priv {
 	unsigned int mux_channel;
 	bool mux_open;
 
+	bool high_threshold;
+
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *pixelrate;
 
@@ -436,6 +438,32 @@ static int max9286_check_config_link(struct max9286_priv *priv,
 	return 0;
 }
 
+static void max9286_reverse_channel_setup(struct max9286_priv *priv,
+					  unsigned int chan_amplitude)
+{
+	/* Reverse channel transmission time: default to 1. */
+	u8 chan_config = MAX9286_REV_TRF(1);
+
+	/*
+	 * Reverse channel setup.
+	 *
+	 * - Enable custom reverse channel configuration (through register 0x3f)
+	 *   and set the first pulse length to 35 clock cycles.
+	 * - Adjust reverse channel amplitude: values > 130 are programmed
+	 *   using the additional +100mV REV_AMP_X boost flag
+	 */
+	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
+
+	if (chan_amplitude > 100) {
+		/* It is not possible express values (100 < x < 130) */
+		chan_amplitude = chan_amplitude < 130
+			       ? 30 : chan_amplitude - 100;
+		chan_config |= MAX9286_REV_AMP_X;
+	}
+	max9286_write(priv, 0x3b, chan_config | MAX9286_REV_AMP(chan_amplitude));
+	usleep_range(2000, 2500);
+}
+
 /* -----------------------------------------------------------------------------
  * V4L2 Subdev
  */
@@ -531,10 +559,14 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
 	 * All enabled sources have probed and enabled their reverse control
 	 * channels:
 	 *
+	 * - Increase the reverse channel amplitude to compensate for the
+	 *   remote ends high threshold, if not done already
 	 * - Verify all configuration links are properly detected
 	 * - Disable auto-ack as communication on the control channel are now
 	 *   stable.
 	 */
+	if (!priv->high_threshold)
+		max9286_reverse_channel_setup(priv, 170);
 	max9286_check_config_link(priv, priv->source_mask);
 
 	/*
@@ -906,32 +938,6 @@ static void max9286_v4l2_unregister(struct max9286_priv *priv)
  * Probe/Remove
  */
 
-static void max9286_reverse_channel_setup(struct max9286_priv *priv,
-					  unsigned int chan_amplitude)
-{
-	/* Reverse channel transmission time: default to 1. */
-	u8 chan_config = MAX9286_REV_TRF(1);
-
-	/*
-	 * Reverse channel setup.
-	 *
-	 * - Enable custom reverse channel configuration (through register 0x3f)
-	 *   and set the first pulse length to 35 clock cycles.
-	 * - Adjust reverse channel amplitude: values > 130 are programmed
-	 *   using the additional +100mV REV_AMP_X boost flag
-	 */
-	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
-
-	if (chan_amplitude > 100) {
-		/* It is not possible express values (100 < x < 130) */
-		chan_amplitude = chan_amplitude < 130
-			       ? 30 : chan_amplitude - 100;
-		chan_config |= MAX9286_REV_AMP_X;
-	}
-	max9286_write(priv, 0x3b, chan_config | MAX9286_REV_AMP(chan_amplitude));
-	usleep_range(2000, 2500);
-}
-
 static int max9286_setup(struct max9286_priv *priv)
 {
 	/*
@@ -967,7 +973,15 @@ static int max9286_setup(struct max9286_priv *priv)
 	 * only. This should be disabled after the mux is initialised.
 	 */
 	max9286_configure_i2c(priv, true);
-	max9286_reverse_channel_setup(priv, 170);
+
+	/*
+	 * Compensate the remote end high threshold with a larger channel
+	 * amplitude if necessary.
+	 */
+	if (priv->high_threshold)
+		max9286_reverse_channel_setup(priv, 170);
+	else
+		max9286_reverse_channel_setup(priv, 100);
 
 	/*
 	 * Enable GMSL links, mask unused ones and autodetect link
@@ -1235,6 +1249,12 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 	}
 	of_node_put(node);
 
+	/*
+	 * Parse 'high_threshold' property to configure the reverse channel
+	 * amplitude.
+	 */
+	priv->high_threshold = device_property_present(dev, "high_threshold");
+
 	priv->route_mask = priv->source_mask;
 
 	return 0;
-- 
2.28.0

