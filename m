Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BBCF2DB242
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 18:14:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730154AbgLORMM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 12:12:12 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:54677 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729483AbgLORKs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 12:10:48 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 410FF1C0009;
        Tue, 15 Dec 2020 17:10:04 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
Subject: [PATCH v6 5/5] media: i2c: max9286: Configure reverse channel amplitude
Date:   Tue, 15 Dec 2020 18:09:57 +0100
Message-Id: <20201215170957.92761-6-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215170957.92761-1-jacopo+renesas@jmondi.org>
References: <20201215170957.92761-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adjust the initial reverse channel amplitude parsing from
firmware interface the 'maxim,reverse-channel-microvolt'
property.

This change is required for both rdacm20 and rdacm21 camera
modules to be correctly probed when used in combination with
the max9286 deserializer.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 021309c6dd6f..9b40a4890c4d 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -163,6 +163,8 @@ struct max9286_priv {
 	unsigned int mux_channel;
 	bool mux_open;
 
+	u32 reverse_channel_mv;
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
+	if (priv->reverse_channel_mv < 170)
+		max9286_reverse_channel_setup(priv, 170);
 	max9286_check_config_link(priv, priv->source_mask);
 
 	/*
@@ -967,7 +973,7 @@ static int max9286_setup(struct max9286_priv *priv)
 	 * only. This should be disabled after the mux is initialised.
 	 */
 	max9286_configure_i2c(priv, true);
-	max9286_reverse_channel_setup(priv, 170);
+	max9286_reverse_channel_setup(priv, priv->reverse_channel_mv);
 
 	/*
 	 * Enable GMSL links, mask unused ones and autodetect link
@@ -1131,6 +1137,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 	struct device_node *i2c_mux;
 	struct device_node *node = NULL;
 	unsigned int i2c_mux_mask = 0;
+	u32 reverse_channel_microvolt;
 
 	/* Balance the of_node_put() performed by of_find_node_by_name(). */
 	of_node_get(dev->of_node);
@@ -1221,6 +1228,20 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 	}
 	of_node_put(node);
 
+	/*
+	 * Parse the initial value of the reverse channel amplitude from
+	 * the firmware interface and convert it to millivolts.
+	 *
+	 * Default it to 170mV for backward compatibility with DTBs that do not
+	 * provide the property.
+	 */
+	if (of_property_read_u32(dev->of_node,
+				 "maxim,reverse-channel-microvolt",
+				 &reverse_channel_microvolt))
+		priv->reverse_channel_mv = 170;
+	else
+		priv->reverse_channel_mv = reverse_channel_microvolt / 1000U;
+
 	priv->route_mask = priv->source_mask;
 
 	return 0;
-- 
2.29.2

