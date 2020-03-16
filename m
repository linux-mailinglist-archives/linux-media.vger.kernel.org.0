Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 556A3187404
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 21:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732546AbgCPUZY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 16:25:24 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:53291 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732556AbgCPUZX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 16:25:23 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 44635FF804;
        Mon, 16 Mar 2020 20:25:21 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, hyunk@xilinx.com,
        manivannan.sadhasivam@linaro.org,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 5/5] media: i2c: max9286: Parse channel amplitude
Date:   Mon, 16 Mar 2020 21:27:57 +0100
Message-Id: <20200316202757.529740-6-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316202757.529740-1-jacopo+renesas@jmondi.org>
References: <20200316202757.529740-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Parse the 'maxim,reverse-channel-amplitude' property value and cache its
content to later program the initial reverse channel amplitude.

Only support 100mV and 170mV values for the moment. The property could
be easily expanded to support more values.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 39 ++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 0357515860b2..24af8002535e 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -168,6 +168,7 @@ struct max9286_priv {
 	struct max9286_source sources[MAX9286_NUM_GMSL];
 	struct v4l2_async_notifier notifier;
 
+	u32 reverse_chan_amp;
 	u32 overlap_window;
 };
 
@@ -479,10 +480,15 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
 	 * All enabled sources have probed and enabled their reverse control
 	 * channels:
 	 *
-	 * - Verify all configuration links are properly detected
+	 * - Increase reverse channel amplitude to 170mV if not initially
+	 *   compensated
 	 * - Disable auto-ack as communication on the control channel are now
 	 *   stable.
 	 */
+	if (priv->reverse_chan_amp == 100)
+		max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) |
+			      MAX9286_REV_AMP(70) | MAX9286_REV_AMP_X);
+
 	max9286_check_config_link(priv, priv->source_mask);
 
 	/*
@@ -830,6 +836,8 @@ static void max9286_v4l2_unregister(struct max9286_priv *priv)
 
 static int max9286_setup(struct max9286_priv *priv)
 {
+	u8 chan_amp = MAX9286_REV_TRF(1);
+
 	/*
 	 * Link ordering values for all enabled links combinations. Orders must
 	 * be assigned sequentially from 0 to the number of enabled links
@@ -869,12 +877,18 @@ static int max9286_setup(struct max9286_priv *priv)
 	 *
 	 * - Enable custom reverse channel configuration (through register 0x3f)
 	 *   and set the first pulse length to 35 clock cycles.
-	 * - Increase the reverse channel amplitude to 170mV to accommodate the
-	 *   high threshold enabled by the serializer driver.
+	 * - Set initial reverse channel amplitude according the DTS property.
+	 *   If the initial channel amplitude is 100mV it should be increase
+	 *   later after the serializers high threshold have been enabled.
+	 *   If the initial value is 170mV the serializer has been
+	 *   pre-programmed and we can compensate immediately.
 	 */
 	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
-	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(70) |
-		      MAX9286_REV_AMP_X);
+	if (priv->reverse_chan_amp == 100)
+		chan_amp |= MAX9286_REV_AMP(100);
+	else
+		chan_amp |= MAX9286_REV_AMP(70) | MAX9286_REV_AMP_X;
+	max9286_write(priv, 0x3b, chan_amp);
 	usleep_range(2000, 2500);
 
 	/*
@@ -1069,6 +1083,21 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 		return -EINVAL;
 	}
 
+	ret = of_property_read_u32(dev->of_node, "maxim,reverse-channel-amplitude",
+				   &priv->reverse_chan_amp);
+	if (ret) {
+		dev_err(dev,
+			"Missing property \"maxim,reverse-channel-amplitude\"\n");
+		of_node_put(dev->of_node);
+		return -EINVAL;
+	}
+	if (priv->reverse_chan_amp != 100 && priv->reverse_chan_amp != 170) {
+		dev_err(dev, "Unsupported  channel amplitude %umV\n",
+			priv->reverse_chan_amp);
+		of_node_put(dev->of_node);
+		return -EINVAL;
+	}
+
 	i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
 	if (!i2c_mux) {
 		dev_err(dev, "Failed to find i2c-mux node\n");
-- 
2.25.1

