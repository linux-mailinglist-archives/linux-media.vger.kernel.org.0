Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4AC2680D5
	for <lists+linux-media@lfdr.de>; Sun, 13 Sep 2020 20:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726001AbgIMSnR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Sep 2020 14:43:17 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:58490 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725970AbgIMSnA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Sep 2020 14:43:00 -0400
X-IronPort-AV: E=Sophos;i="5.76,423,1592838000"; 
   d="scan'208";a="56925266"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 14 Sep 2020 03:42:58 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5608B40078B7;
        Mon, 14 Sep 2020 03:42:56 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v4 2/3] media: i2c: ov772x: Add support for BT656 mode
Date:   Sun, 13 Sep 2020 19:42:46 +0100
Message-Id: <20200913184247.618-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200913184247.618-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200913184247.618-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support to read the bus-type for V4L2_MBUS_BT656 and
enable BT656 mode in the sensor if needed.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/media/i2c/ov772x.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index 551082aa7026..edd7c4c22225 100644
--- a/drivers/media/i2c/ov772x.c
+++ b/drivers/media/i2c/ov772x.c
@@ -583,6 +583,13 @@ static int ov772x_s_stream(struct v4l2_subdev *sd, int enable)
 	if (priv->streaming == enable)
 		goto done;
 
+	if (priv->bus_type == V4L2_MBUS_BT656) {
+		ret = regmap_update_bits(priv->regmap, COM7, ITU656_ON_OFF,
+					 enable ? ITU656_ON_OFF : ~ITU656_ON_OFF);
+		if (ret)
+			goto done;
+	}
+
 	ret = regmap_update_bits(priv->regmap, COM2, SOFT_SLEEP_MODE,
 				 enable ? 0 : SOFT_SLEEP_MODE);
 	if (ret)
@@ -1427,16 +1434,24 @@ static int ov772x_probe(struct i2c_client *client)
 		goto error_clk_put;
 	}
 
-	bus_cfg.bus_type = V4L2_MBUS_PARALLEL;
+	bus_cfg = (struct v4l2_fwnode_endpoint)
+		  { .bus_type = V4L2_MBUS_BT656 };
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	priv->bus_type = bus_cfg.bus_type;
 	v4l2_fwnode_endpoint_free(&bus_cfg);
 	if (ret) {
-		/* For backward compatibility with the existing DT where
-		 * bus-type isnt specified fallback to V4L2_MBUS_PARALLEL
-		 */
-		priv->bus_type = V4L2_MBUS_PARALLEL;
-		dev_notice(&client->dev, "Falling back to V4L2_MBUS_PARALLEL mode\n");
+		bus_cfg.bus_type = V4L2_MBUS_PARALLEL;
+		ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+		priv->bus_type = bus_cfg.bus_type;
+		v4l2_fwnode_endpoint_free(&bus_cfg);
+		if (ret) {
+			/* For backward compatibility with the existing DT where
+			 * bus-type isnt specified fallback to V4L2_MBUS_PARALLEL
+			 */
+			priv->bus_type = V4L2_MBUS_PARALLEL;
+			dev_notice(&client->dev,
+				   "Falling back to V4L2_MBUS_PARALLEL mode\n");
+		}
 	}
 
 	ret = ov772x_video_probe(priv);
-- 
2.17.1

