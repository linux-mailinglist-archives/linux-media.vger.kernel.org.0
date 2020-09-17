Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81B4526E2E2
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 19:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgIQRu2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 13:50:28 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:34197 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726547AbgIQRnQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 13:43:16 -0400
X-IronPort-AV: E=Sophos;i="5.77,271,1596466800"; 
   d="scan'208";a="57335094"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 18 Sep 2020 02:42:33 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2240B40BC9F5;
        Fri, 18 Sep 2020 02:42:30 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: [PATCH v6 1/3] media: i2c: ov772x: Parse endpoint properties
Date:   Thu, 17 Sep 2020 18:42:22 +0100
Message-Id: <20200917174224.11430-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917174224.11430-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200917174224.11430-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Parse endpoint properties using v4l2_fwnode_endpoint_alloc_parse()
to determine the bus type and store it in the driver structure.

Set bus_type to V4L2_MBUS_PARALLEL as it's the only supported one

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/ov772x.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index 2cc6a678069a..f61a3f09ad64 100644
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
@@ -1348,6 +1350,34 @@ static const struct v4l2_subdev_ops ov772x_subdev_ops = {
 	.pad	= &ov772x_subdev_pad_ops,
 };
 
+static int ov772x_parse_dt(struct i2c_client *client,
+			   struct ov772x_priv *priv)
+{
+	struct v4l2_fwnode_endpoint bus_cfg;
+	struct fwnode_handle *ep;
+	int ret;
+
+	ep = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
+					    NULL);
+	if (!ep) {
+		dev_err(&client->dev, "Endpoint node not found\n");
+		return -EINVAL;
+	}
+
+	bus_cfg.bus_type = V4L2_MBUS_PARALLEL;
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	if (ret)
+		goto error_fwnode_put;
+
+	priv->bus_type = bus_cfg.bus_type;
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+
+error_fwnode_put:
+	fwnode_handle_put(ep);
+
+	return ret;
+}
+
 /*
  * i2c_driver function
  */
@@ -1415,6 +1445,10 @@ static int ov772x_probe(struct i2c_client *client)
 		goto error_clk_put;
 	}
 
+	ret = ov772x_parse_dt(client, priv);
+	if (ret)
+		goto error_clk_put;
+
 	ret = ov772x_video_probe(priv);
 	if (ret < 0)
 		goto error_gpio_put;
-- 
2.17.1

