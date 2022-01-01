Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C409482836
	for <lists+linux-media@lfdr.de>; Sat,  1 Jan 2022 19:28:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232681AbiAAS2X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jan 2022 13:28:23 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41358 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232673AbiAAS2V (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jan 2022 13:28:21 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45BD923CD;
        Sat,  1 Jan 2022 19:28:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641061700;
        bh=dnGR1bEHDZqk4iWfFd2fMzIUpx2RL/NdzunIMoofj0Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RNcwjfYLqJrKn93pPTdDtnujmNOrLf5l+qS856tBHqQQLWnEfNB4BzA8P1l5wtGcA
         mJrDENPAjhGedTHEA0ibYQRswyGN8bD+9gZxPI2zrwgBWngqeL7GVVu+VwU+3C1DPs
         0Uhk6jFx8qdcZSxkbPJcJ5i3pPn5w6OP1CWo1gF4=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
Subject: [PATCH v2 10/11] media: i2c: max9286: Configure bus width from device tree
Date:   Sat,  1 Jan 2022 20:28:05 +0200
Message-Id: <20220101182806.19311-11-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The GMSL serial data bus width is normally selected through the BWS pin.
On some systems, the pin may not be wired to the correct value. Support
overriding the bus width by software, using the value specified in the
device tree.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index d88a4d8e63ab..07ebb01640a1 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -90,6 +90,11 @@
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
@@ -182,6 +187,7 @@ struct max9286_priv {
 	u32 init_rev_chan_mv;
 	u32 rev_chan_mv;
 	u8 i2c_mstbt;
+	u32 bus_width;
 
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *pixelrate_ctrl;
@@ -1159,6 +1165,23 @@ static int max9286_setup(struct max9286_priv *priv)
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
@@ -1429,6 +1452,19 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 	}
 	of_node_put(node);
 
+	of_property_read_u32(dev->of_node, "maxim,bus-width", &priv->bus_width);
+	switch (priv->bus_width) {
+	case 0:
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
 	of_property_read_u32(dev->of_node, "maxim,i2c-clock-frequency",
 			     &i2c_clk_freq);
 	for (i = 0; i < ARRAY_SIZE(max9286_i2c_speeds); ++i) {
-- 
Regards,

Laurent Pinchart

