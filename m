Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69E10290280
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 12:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406583AbgJPKHL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 06:07:11 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:36061 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406570AbgJPKHI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 06:07:08 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 2BC2AE0010;
        Fri, 16 Oct 2020 10:07:03 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 5/7] media: i2c: max9286: Configure reverse channel amplitude
Date:   Fri, 16 Oct 2020 14:06:23 +0200
Message-Id: <20201016120625.64337-6-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201016120625.64337-1-jacopo+renesas@jmondi.org>
References: <20201016120625.64337-1-jacopo+renesas@jmondi.org>
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
 drivers/media/i2c/max9286.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 31e27d0f34f1..4c72e1e6b27b 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -163,6 +163,8 @@ struct max9286_priv {
 	unsigned int mux_channel;
 	bool mux_open;
 
+	bool high_threshold;
+
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *pixelrate;
 
@@ -557,10 +559,14 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
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
@@ -967,7 +973,12 @@ static int max9286_setup(struct max9286_priv *priv)
 	 * only. This should be disabled after the mux is initialised.
 	 */
 	max9286_configure_i2c(priv, true);
-	max9286_reverse_channel_setup(priv, 170);
+
+	/*
+	 * Compensate the remote end high threshold with a larger channel
+	 * amplitude if necessary.
+	 */
+	max9286_reverse_channel_setup(priv, priv->high_threshold ? 170 : 100);
 
 	/*
 	 * Enable GMSL links, mask unused ones and autodetect link
@@ -1235,6 +1246,12 @@ static int max9286_parse_dt(struct max9286_priv *priv)
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

