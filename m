Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF1D664D398
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 00:39:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbiLNXjA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Dec 2022 18:39:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbiLNXis (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Dec 2022 18:38:48 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FAAD36D53;
        Wed, 14 Dec 2022 15:38:45 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F40D1837;
        Thu, 15 Dec 2022 00:38:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671061124;
        bh=mywXsr2SJsM5CqnmsoIiP/jc4A/TXZldwm+c0iXKt3c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=I6d+jeIt6eZF8N3Uigwn+S9FjUC6VYKOLzqfgOZI91FcOIhweKG3JVm/CQ/hQ104/
         nJWstC2KpLIUzxSu/A3CKqvBBIPpGs2/oNLRjPgQ3oRfnFyEdU7CAyzvdmkygmVlmq
         s2UG7RXdyS5bIwqng71GQsT07aKq2Sl3J3Y2LwQg=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
Subject: [PATCH v3 10/12] media: i2c: max9286: Configure bus width from device tree
Date:   Thu, 15 Dec 2022 01:38:23 +0200
Message-Id: <20221214233825.13050-11-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221214233825.13050-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20221214233825.13050-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The GMSL serial data bus width is normally selected through the BWS pin.
On some systems, the pin may not be wired to the correct value. Support
overriding the bus width by software, using the value specified in the
device tree.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
Changes since v1:

- Add comment about the bus_width == 0 case
---
 drivers/media/i2c/max9286.c | 40 +++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index fffb0d2da416..125b4d434f57 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -91,6 +91,11 @@
 /* Register 0x1b */
 #define MAX9286_SWITCHIN(n)		(1 << ((n) + 4))
 #define MAX9286_ENEQ(n)			(1 << (n))
+/* Register 0x1c */
+#define MAX9286_HIGHIMM(n)		BIT((n) + 4)
+#define MAX9286_I2CSEL			BIT(2)
+#define MAX9286_HIBW			BIT(1)
+#define MAX9286_BWS			BIT(0)
 /* Register 0x27 */
 #define MAX9286_LOCKED			BIT(7)
 /* Register 0x31 */
@@ -183,6 +188,7 @@ struct max9286_priv {
 	u32 init_rev_chan_mv;
 	u32 rev_chan_mv;
 	u8 i2c_mstbt;
+	u32 bus_width;
 
 	bool use_gpio_poc;
 	u32 gpio_poc[2];
@@ -1168,6 +1174,23 @@ static int max9286_setup(struct max9286_priv *priv)
 	max9286_set_video_format(priv, &max9286_default_format);
 	max9286_set_fsync_period(priv);
 
+	if (priv->bus_width) {
+		int val;
+
+		val = max9286_read(priv, 0x1c);
+		if (val < 0)
+			return val;
+
+		val &= ~(MAX9286_HIBW | MAX9286_BWS);
+
+		if (priv->bus_width == 27)
+			val |= MAX9286_HIBW;
+		else if (priv->bus_width == 32)
+			val |= MAX9286_BWS;
+
+		max9286_write(priv, 0x1c, val);
+	}
+
 	/*
 	 * The overlap window seems to provide additional validation by tracking
 	 * the delay between vsync and frame sync, generating an error if the
@@ -1496,6 +1519,23 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 	}
 	of_node_put(node);
 
+	of_property_read_u32(dev->of_node, "maxim,bus-width", &priv->bus_width);
+	switch (priv->bus_width) {
+	case 0:
+		/*
+		 * The property isn't specified in the device tree, the driver
+		 * will keep the default value selected by the BWS pin.
+		 */
+	case 24:
+	case 27:
+	case 32:
+		break;
+	default:
+		dev_err(dev, "Invalid %s value %u\n", "maxim,bus-width",
+			priv->bus_width);
+		return -EINVAL;
+	}
+
 	of_property_read_u32(dev->of_node, "maxim,i2c-remote-bus-hz",
 			     &i2c_clk_freq);
 	for (i = 0; i < ARRAY_SIZE(max9286_i2c_speeds); ++i) {
-- 
Regards,

Laurent Pinchart

