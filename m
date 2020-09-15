Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D67A26AB0B
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 19:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727993AbgIORqr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 13:46:47 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:53823 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727915AbgIORoX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 13:44:23 -0400
X-IronPort-AV: E=Sophos;i="5.76,430,1592838000"; 
   d="scan'208";a="57345684"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 Sep 2020 02:44:17 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3F28A400753C;
        Wed, 16 Sep 2020 02:44:15 +0900 (JST)
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
Subject: [PATCH v5 2/3] media: i2c: ov772x: Add support for BT.656 mode
Date:   Tue, 15 Sep 2020 18:42:34 +0100
Message-Id: <20200915174235.1229-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200915174235.1229-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200915174235.1229-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support to read the bus-type for V4L2_MBUS_BT656 and
enable BT.656 mode in the sensor if needed.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/media/i2c/ov772x.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index 4ab4b3c883d0..869f2d94faec 100644
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
@@ -1436,9 +1443,17 @@ static int ov772x_probe(struct i2c_client *client)
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	priv->bus_type = bus_cfg.bus_type;
 	v4l2_fwnode_endpoint_free(&bus_cfg);
+	if (ret) {
+		bus_cfg = (struct v4l2_fwnode_endpoint)
+			  { .bus_type = V4L2_MBUS_BT656 };
+		ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+		if (ret) {
+			fwnode_handle_put(ep);
+			goto error_clk_put;
+		}
+		priv->bus_type = bus_cfg.bus_type;
+	}
 	fwnode_handle_put(ep);
-	if (ret)
-		goto error_clk_put;
 
 	ret = ov772x_video_probe(priv);
 	if (ret < 0)
-- 
2.17.1

