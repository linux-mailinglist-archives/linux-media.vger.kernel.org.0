Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0B2826AAF8
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 19:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbgIORpH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 13:45:07 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:28656 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727895AbgIORoQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 13:44:16 -0400
X-IronPort-AV: E=Sophos;i="5.76,430,1592838000"; 
   d="scan'208";a="57128208"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 16 Sep 2020 02:44:14 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id CA9E6400753C;
        Wed, 16 Sep 2020 02:44:12 +0900 (JST)
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
Subject: [PATCH v5 1/3] media: i2c: ov772x: Parse endpoint properties
Date:   Tue, 15 Sep 2020 18:42:33 +0100
Message-Id: <20200915174235.1229-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200915174235.1229-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200915174235.1229-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Parse endpoint properties using v4l2_fwnode_endpoint_alloc_parse()
to determine bus-type and store it locally in priv data.

v4l2_fwnode_endpoint_alloc_parse() with bus_type set to
V4L2_MBUS_PARALLEL falls back to V4L2_MBUS_PARALLEL thus handling
backward compatibility with existing DT where bus-type isn't specified.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/ov772x.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index 2cc6a678069a..4ab4b3c883d0 100644
--- a/drivers/media/i2c/ov772x.c
+++ b/drivers/media/i2c/ov772x.c
@@ -31,6 +31,7 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
 #include <media/v4l2-image-sizes.h>
 #include <media/v4l2-subdev.h>
 
@@ -434,6 +435,7 @@ struct ov772x_priv {
 #ifdef CONFIG_MEDIA_CONTROLLER
 	struct media_pad pad;
 #endif
+	enum v4l2_mbus_type		  bus_type;
 };
 
 /*
@@ -1354,6 +1356,8 @@ static const struct v4l2_subdev_ops ov772x_subdev_ops = {
 
 static int ov772x_probe(struct i2c_client *client)
 {
+	struct v4l2_fwnode_endpoint bus_cfg;
+	struct fwnode_handle	*ep;
 	struct ov772x_priv	*priv;
 	int			ret;
 	static const struct regmap_config ov772x_regmap_config = {
@@ -1415,6 +1419,27 @@ static int ov772x_probe(struct i2c_client *client)
 		goto error_clk_put;
 	}
 
+	ep = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
+					    NULL);
+	if (!ep) {
+		dev_err(&client->dev, "endpoint node not found\n");
+		ret = -EINVAL;
+		goto error_clk_put;
+	}
+
+	/* For backward compatibility with the existing DT where
+	 * bus-type isn't specified v4l2_fwnode_endpoint_alloc_parse()
+	 * with bus_type set to V4L2_MBUS_PARALLEL falls back to
+	 * V4L2_MBUS_PARALLEL
+	 */
+	bus_cfg.bus_type = V4L2_MBUS_PARALLEL;
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	priv->bus_type = bus_cfg.bus_type;
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		goto error_clk_put;
+
 	ret = ov772x_video_probe(priv);
 	if (ret < 0)
 		goto error_gpio_put;
-- 
2.17.1

