Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 625C02B4522
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 14:56:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729471AbgKPNxh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 08:53:37 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:49921 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729572AbgKPNxh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 08:53:37 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 85AE84001C;
        Mon, 16 Nov 2020 13:53:33 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
Subject: [PATCH v5 5/8] media: i2c: max9286: Configure reverse channel amplitude
Date:   Mon, 16 Nov 2020 14:53:02 +0100
Message-Id: <20201116135305.81319-6-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201116135305.81319-1-jacopo+renesas@jmondi.org>
References: <20201116135305.81319-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adjust the initial reverse channel amplitude parsing from
firmware interface the 'maxim,initial-reverse-channel-mV'
property.

This change is required for both rdacm20 and rdacm21 camera
modules to be correctly probed when used in combination with
the max9286 deserializer.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 31e27d0f34f1..11ba047f3793 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -163,6 +163,8 @@ struct max9286_priv {
 	unsigned int mux_channel;
 	bool mux_open;
 
+	u32 reverse_channel_mV;
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
+	if (priv->reverse_channel_mV < 170)
+		max9286_reverse_channel_setup(priv, 170);
 	max9286_check_config_link(priv, priv->source_mask);
 
 	/*
@@ -967,7 +973,7 @@ static int max9286_setup(struct max9286_priv *priv)
 	 * only. This should be disabled after the mux is initialised.
 	 */
 	max9286_configure_i2c(priv, true);
-	max9286_reverse_channel_setup(priv, 170);
+	max9286_reverse_channel_setup(priv, priv->reverse_channel_mV);
 
 	/*
 	 * Enable GMSL links, mask unused ones and autodetect link
@@ -1235,6 +1241,18 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 	}
 	of_node_put(node);
 
+	/*
+	 * Parse the initial value of the reverse channel amplitude from
+	 * the firmware interface.
+	 *
+	 * Default it to 170mV for backward compatibility with DTB that do not
+	 * provide the property.
+	 */
+	if (of_property_read_u32(dev->of_node,
+				 "maxim,initial-reverse-channel-mV",
+				 &priv->reverse_channel_mV))
+		priv->reverse_channel_mV = 170;
+
 	priv->route_mask = priv->source_mask;
 
 	return 0;
-- 
2.29.1

