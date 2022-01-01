Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15D624828C1
	for <lists+linux-media@lfdr.de>; Sun,  2 Jan 2022 00:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232770AbiAAX0q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jan 2022 18:26:46 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42772 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232731AbiAAX0p (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jan 2022 18:26:45 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6B4ECC;
        Sun,  2 Jan 2022 00:26:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641079604;
        bh=JhDsZtKrxBpxD0eT0NwG04iESg/HP1kho30u6fGWlO4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RVoMZSafmdIpATu8VmLDzEWRkvly8/6Lrfnt0Sc1AI0rYgihypZ6EYa8jOJ8SZ9e+
         KomMa43nIaqUwcOsRJCTYTTbOL4M6jAn0/Yvje/6NNouGUzRknXpMV4OJspE1ZtqhU
         miTxLOPmaXOKepR2ckPX8/vUPynqJu12hpqgjokw=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
Subject: [PATCH v2 12/11] media: i2c: max9286: Print power-up GMSL link configuration
Date:   Sun,  2 Jan 2022 01:26:37 +0200
Message-Id: <20220101232637.32104-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The power-up GMSL link configuration is controlled by the HIM and BWS
pins, whose state is reflected in register 0x1c. Print the detected
power-up config in a debug message to help debugging.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 446fc238d642..f7cbfdde436e 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1147,6 +1147,7 @@ static int max9286_setup(struct max9286_priv *priv)
 		(2 << 6) | (1 << 4) | (0 << 2) | (3 << 0), /* 210x */
 		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* 3210 */
 	};
+	int cfg;
 
 	/*
 	 * Set the I2C bus speed.
@@ -1168,21 +1169,23 @@ static int max9286_setup(struct max9286_priv *priv)
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

