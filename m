Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB4464D39C
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 00:39:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbiLNXjG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Dec 2022 18:39:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiLNXiv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Dec 2022 18:38:51 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D6E831EEA;
        Wed, 14 Dec 2022 15:38:49 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27D4751E;
        Thu, 15 Dec 2022 00:38:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671061127;
        bh=HfH023P9iYH/yvUdmpHAUXCQ/uSzg7GNNthgLdl1Cfg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ragdCsYs+zUvceXhhM1GWBLhYl1V+hrlOuvOLPmi/mna0JQjzjAAsAR8hvC02EXS/
         YVX3kJc0VZx4cQoE9Le6hcLoxVV3Yzl7ThyVOVdRdwpor3FQHWPcxC0iU71uSXmorz
         X540mcCA9QNv42AU2gQ3IZlrkvp5j5q1btVmZNAE=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
Subject: [PATCH v3 12/12] media: i2c: max9286: Print power-up GMSL link configuration
Date:   Thu, 15 Dec 2022 01:38:25 +0200
Message-Id: <20221214233825.13050-13-laurent.pinchart+renesas@ideasonboard.com>
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

The power-up GMSL link configuration is controlled by the HIM and BWS
pins, whose state is reflected in register 0x1c. Print the detected
power-up config in a debug message to help debugging.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 58cd2ff49e08..34a59a7d3ab4 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1156,6 +1156,7 @@ static int max9286_setup(struct max9286_priv *priv)
 		(2 << 6) | (1 << 4) | (0 << 2) | (3 << 0), /* 210x */
 		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* 3210 */
 	};
+	int cfg;
 
 	/*
 	 * Set the I2C bus speed.
@@ -1177,21 +1178,23 @@ static int max9286_setup(struct max9286_priv *priv)
 	max9286_set_video_format(priv, &max9286_default_format);
 	max9286_set_fsync_period(priv);
 
+	cfg = max9286_read(priv, 0x1c);
+	if (cfg < 0)
+		return cfg;
+
+	dev_dbg(&priv->client->dev, "power-up config: %s immunity, %u-bit bus\n",
+		cfg & MAX9286_HIGHIMM(0) ? "high" : "legacy",
+		cfg & MAX9286_BWS ? 32 : cfg & MAX9286_HIBW ? 27 : 24);
+
 	if (priv->bus_width) {
-		int val;
-
-		val = max9286_read(priv, 0x1c);
-		if (val < 0)
-			return val;
-
-		val &= ~(MAX9286_HIBW | MAX9286_BWS);
+		cfg &= ~(MAX9286_HIBW | MAX9286_BWS);
 
 		if (priv->bus_width == 27)
-			val |= MAX9286_HIBW;
+			cfg |= MAX9286_HIBW;
 		else if (priv->bus_width == 32)
-			val |= MAX9286_BWS;
+			cfg |= MAX9286_BWS;
 
-		max9286_write(priv, 0x1c, val);
+		max9286_write(priv, 0x1c, cfg);
 	}
 
 	/*
-- 
Regards,

Laurent Pinchart

