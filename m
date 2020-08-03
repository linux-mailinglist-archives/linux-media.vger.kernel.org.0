Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAE7223A370
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 13:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgHCLkP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 07:40:15 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:27969 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726533AbgHCLj5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Aug 2020 07:39:57 -0400
X-IronPort-AV: E=Sophos;i="5.75,429,1589209200"; 
   d="scan'208";a="53742349"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Aug 2020 20:39:37 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8FBC142385FF;
        Mon,  3 Aug 2020 20:39:34 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/3] media: i2c: ov772x: Add support for BT656 mode
Date:   Mon,  3 Aug 2020 12:39:12 +0100
Message-Id: <1596454753-13612-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596454753-13612-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1596454753-13612-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support to read the bus-type and enable BT656 mode if needed.

The driver defaults to parallel mode if bus-type is not specified in DT.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/media/i2c/ov772x.c | 40 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index 2cc6a678069a..2de9248e3689 100644
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
+	struct v4l2_fwnode_endpoint ep;
 };
 
 /*
@@ -574,6 +576,7 @@ static int ov772x_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov772x_priv *priv = to_ov772x(sd);
+	unsigned int val;
 	int ret = 0;
 
 	mutex_lock(&priv->lock);
@@ -581,6 +584,22 @@ static int ov772x_s_stream(struct v4l2_subdev *sd, int enable)
 	if (priv->streaming == enable)
 		goto done;
 
+	if (priv->ep.bus_type == V4L2_MBUS_BT656 && enable) {
+		ret = regmap_read(priv->regmap, COM7, &val);
+		if (ret)
+			goto done;
+		val |= ITU656_ON_OFF;
+		ret = regmap_write(priv->regmap, COM7, val);
+	} else if (priv->ep.bus_type == V4L2_MBUS_BT656 && !enable) {
+		ret = regmap_read(priv->regmap, COM7, &val);
+		if (ret)
+			goto done;
+		val &= ~ITU656_ON_OFF;
+		ret = regmap_write(priv->regmap, COM7, val);
+	}
+	if (ret)
+		goto done;
+
 	ret = regmap_update_bits(priv->regmap, COM2, SOFT_SLEEP_MODE,
 				 enable ? 0 : SOFT_SLEEP_MODE);
 	if (ret)
@@ -1354,6 +1373,7 @@ static const struct v4l2_subdev_ops ov772x_subdev_ops = {
 
 static int ov772x_probe(struct i2c_client *client)
 {
+	struct fwnode_handle *endpoint;
 	struct ov772x_priv	*priv;
 	int			ret;
 	static const struct regmap_config ov772x_regmap_config = {
@@ -1415,6 +1435,26 @@ static int ov772x_probe(struct i2c_client *client)
 		goto error_clk_put;
 	}
 
+	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
+						  NULL);
+	if (!endpoint) {
+		dev_err(&client->dev, "endpoint node not found\n");
+		ret = -EINVAL;
+		goto error_clk_put;
+	}
+
+	ret = v4l2_fwnode_endpoint_parse(endpoint, &priv->ep);
+	fwnode_handle_put(endpoint);
+	if (ret) {
+		dev_err(&client->dev, "Could not parse endpoint\n");
+		goto error_clk_put;
+	}
+
+	/* fallback to parallel mode */
+	if (priv->ep.bus_type != V4L2_MBUS_PARALLEL &&
+	    priv->ep.bus_type != V4L2_MBUS_BT656)
+		priv->ep.bus_type = V4L2_MBUS_PARALLEL;
+
 	ret = ov772x_video_probe(priv);
 	if (ret < 0)
 		goto error_gpio_put;
-- 
2.17.1

