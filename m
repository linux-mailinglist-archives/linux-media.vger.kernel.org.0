Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC267281E36
	for <lists+linux-media@lfdr.de>; Sat,  3 Oct 2020 00:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725794AbgJBWXj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 18:23:39 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:56531 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725782AbgJBWXi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Oct 2020 18:23:38 -0400
X-IronPort-AV: E=Sophos;i="5.77,329,1596466800"; 
   d="scan'208";a="58790188"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Oct 2020 07:23:37 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8185A4007F4B;
        Sat,  3 Oct 2020 07:23:35 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 2/3] media: i2c: ov772x: Add support for BT.656 mode
Date:   Fri,  2 Oct 2020 23:23:22 +0100
Message-Id: <20201002222323.21736-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002222323.21736-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20201002222323.21736-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support to read the bus-type for V4L2_MBUS_BT656 and enable BT.656
mode in the sensor if needed.

For backward compatibility with older DTS where the bus-type property was
not mandatory, assume V4L2_MBUS_PARALLEL as it was the only supported bus
at the time. v4l2_fwnode_endpoint_alloc_parse() will not fail if
'bus-type' is not specified.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/ov772x.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index afe2446dfb68..86e542b77ee5 100644
--- a/drivers/media/i2c/ov772x.c
+++ b/drivers/media/i2c/ov772x.c
@@ -583,6 +583,14 @@ static int ov772x_s_stream(struct v4l2_subdev *sd, int enable)
 	if (priv->streaming == enable)
 		goto done;
 
+	if (priv->bus_type == V4L2_MBUS_BT656) {
+		ret = regmap_update_bits(priv->regmap, COM7, ITU656_ON_OFF,
+					 enable ?
+					 ITU656_ON_OFF : ~ITU656_ON_OFF);
+		if (ret)
+			goto done;
+	}
+
 	ret = regmap_update_bits(priv->regmap, COM2, SOFT_SLEEP_MODE,
 				 enable ? 0 : SOFT_SLEEP_MODE);
 	if (ret)
@@ -1365,9 +1373,21 @@ static int ov772x_parse_dt(struct i2c_client *client,
 		return -EINVAL;
 	}
 
+	/*
+	 * For backward compatibility with older DTS where the
+	 * bus-type property was not mandatory, assume
+	 * V4L2_MBUS_PARALLEL as it was the only supported bus at the
+	 * time. v4l2_fwnode_endpoint_alloc_parse() will not fail if
+	 * 'bus-type' is not specified.
+	 */
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
-	if (ret)
-		goto error_fwnode_put;
+	if (ret) {
+		bus_cfg = (struct v4l2_fwnode_endpoint)
+			  { .bus_type = V4L2_MBUS_BT656 };
+		ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+		if (ret)
+			goto error_fwnode_put;
+	}
 
 	priv->bus_type = bus_cfg.bus_type;
 	v4l2_fwnode_endpoint_free(&bus_cfg);
-- 
2.17.1

