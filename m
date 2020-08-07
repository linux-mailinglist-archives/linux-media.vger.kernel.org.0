Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A62D323EC38
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 13:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgHGLQm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 07:16:42 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:13318 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728091AbgHGLQm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 07:16:42 -0400
X-Halon-ID: 76e1ce19-d89f-11ea-a39b-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p54ac52a8.dip0.t-ipconnect.de [84.172.82.168])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 76e1ce19-d89f-11ea-a39b-005056917f90;
        Fri, 07 Aug 2020 13:16:39 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] rcar-csi2: Use V4L2 async helpers to create the notifier
Date:   Fri,  7 Aug 2020 13:16:19 +0200
Message-Id: <20200807111619.3664763-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200807111619.3664763-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200807111619.3664763-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2 async framework helpers now populates the async notifier with
endpoint matching information and there is no need to do this manually
in the R-Car CSI-2 driver, switch to using the provided helper.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 48 +++++----------------
 1 file changed, 11 insertions(+), 37 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index c6cc4f473a077899..f0067ff21d5d9d33 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -362,7 +362,6 @@ struct rcar_csi2 {
 	struct media_pad pads[NR_OF_RCAR_CSI2_PAD];
 
 	struct v4l2_async_notifier notifier;
-	struct v4l2_async_subdev asd;
 	struct v4l2_subdev *remote;
 
 	struct v4l2_mbus_framefmt mf;
@@ -774,9 +773,11 @@ static const struct v4l2_async_notifier_operations rcar_csi2_notify_ops = {
 	.unbind = rcsi2_notify_unbind,
 };
 
-static int rcsi2_parse_v4l2(struct rcar_csi2 *priv,
-			    struct v4l2_fwnode_endpoint *vep)
+static int rcar_csi2_parse_v4l2(struct device *dev,
+				struct v4l2_fwnode_endpoint *vep,
+				struct v4l2_async_subdev *asd)
 {
+	struct rcar_csi2 *priv = dev_get_drvdata(dev);
 	unsigned int i;
 
 	/* Only port 0 endpoint 0 is valid. */
@@ -806,53 +807,26 @@ static int rcsi2_parse_v4l2(struct rcar_csi2 *priv,
 		}
 	}
 
+	dev_dbg(priv->dev, "Found '%pOF'\n", to_of_node(asd->match.fwnode));
+
 	return 0;
 }
 
 static int rcsi2_parse_dt(struct rcar_csi2 *priv)
 {
-	struct device_node *ep;
-	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
 	int ret;
 
-	ep = of_graph_get_endpoint_by_regs(priv->dev->of_node, 0, 0);
-	if (!ep) {
-		dev_err(priv->dev, "Not connected to subdevice\n");
-		return -EINVAL;
-	}
-
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &v4l2_ep);
-	if (ret) {
-		dev_err(priv->dev, "Could not parse v4l2 endpoint\n");
-		of_node_put(ep);
-		return -EINVAL;
-	}
-
-	ret = rcsi2_parse_v4l2(priv, &v4l2_ep);
-	if (ret) {
-		of_node_put(ep);
-		return ret;
-	}
-
-	priv->asd.match.fwnode =
-		fwnode_graph_get_remote_endpoint(of_fwnode_handle(ep));
-	priv->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
-
-	of_node_put(ep);
-
 	v4l2_async_notifier_init(&priv->notifier);
 
-	ret = v4l2_async_notifier_add_subdev(&priv->notifier, &priv->asd);
-	if (ret) {
-		fwnode_handle_put(priv->asd.match.fwnode);
+	ret = v4l2_async_notifier_parse_fwnode_endpoints_by_port(
+			priv->dev, &priv->notifier,
+			sizeof(struct v4l2_async_subdev), 0,
+			rcar_csi2_parse_v4l2);
+	if (ret)
 		return ret;
-	}
 
 	priv->notifier.ops = &rcar_csi2_notify_ops;
 
-	dev_dbg(priv->dev, "Found '%pOF'\n",
-		to_of_node(priv->asd.match.fwnode));
-
 	ret = v4l2_async_subdev_notifier_register(&priv->subdev,
 						  &priv->notifier);
 	if (ret)
-- 
2.28.0

