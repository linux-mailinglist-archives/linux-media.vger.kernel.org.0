Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4C3B24217C
	for <lists+linux-media@lfdr.de>; Tue, 11 Aug 2020 23:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgHKVAH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Aug 2020 17:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbgHKVAG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Aug 2020 17:00:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 138DAC06174A;
        Tue, 11 Aug 2020 14:00:06 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 255741285;
        Tue, 11 Aug 2020 23:00:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597179600;
        bh=mVl2DFm8p8CjEohpOnNLkUznFWzkJl+gH+0TD9L5Rgk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o3XOUKNIDgNyOKaRx+0egMKhJZMfCT4Q9VbtUSas3QivDKGHpo4FskIzJnTdnHBFA
         zjhzM5mFEiLtwRfP3KBlTCBPOWfZ+4LJ5L2OC9zqu2+yTxsWBEu2cJfl7HJBZB1j1u
         DDHAGo4NzCr1R7p3ahNIpWaVt4XCzN//xHQuBTUo=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH 4/5] media: rcar-csi2: Allocate v4l2_async_subdev dynamically
Date:   Tue, 11 Aug 2020 23:59:38 +0300
Message-Id: <20200811205939.19550-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200811205939.19550-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200811205939.19550-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2_async_notifier_add_subdev() requires the asd to be allocated
dynamically, but the rcar-csi2 driver embeds it in the rcar_csi2
structure. This causes memory corruption when the notifier is destroyed
at remove time with v4l2_async_notifier_cleanup().

Fix this issue by registering the asd with
v4l2_async_notifier_add_fwnode_subdev(), which allocates it dynamically
internally.

Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 24 +++++++++------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index c6cc4f473a07..a16c492b3143 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -362,7 +362,6 @@ struct rcar_csi2 {
 	struct media_pad pads[NR_OF_RCAR_CSI2_PAD];
 
 	struct v4l2_async_notifier notifier;
-	struct v4l2_async_subdev asd;
 	struct v4l2_subdev *remote;
 
 	struct v4l2_mbus_framefmt mf;
@@ -811,6 +810,8 @@ static int rcsi2_parse_v4l2(struct rcar_csi2 *priv,
 
 static int rcsi2_parse_dt(struct rcar_csi2 *priv)
 {
+	struct v4l2_async_subdev *asd;
+	struct fwnode_handle *fwnode;
 	struct device_node *ep;
 	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
 	int ret;
@@ -834,24 +835,19 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
 		return ret;
 	}
 
-	priv->asd.match.fwnode =
-		fwnode_graph_get_remote_endpoint(of_fwnode_handle(ep));
-	priv->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
-
+	fwnode = fwnode_graph_get_remote_endpoint(of_fwnode_handle(ep));
 	of_node_put(ep);
 
+	dev_dbg(priv->dev, "Found '%pOF'\n", to_of_node(fwnode));
+
 	v4l2_async_notifier_init(&priv->notifier);
-
-	ret = v4l2_async_notifier_add_subdev(&priv->notifier, &priv->asd);
-	if (ret) {
-		fwnode_handle_put(priv->asd.match.fwnode);
-		return ret;
-	}
-
 	priv->notifier.ops = &rcar_csi2_notify_ops;
 
-	dev_dbg(priv->dev, "Found '%pOF'\n",
-		to_of_node(priv->asd.match.fwnode));
+	asd = v4l2_async_notifier_add_fwnode_subdev(&priv->notifier, fwnode,
+						    sizeof(*asd));
+	fwnode_handle_put(fwnode);
+	if (IS_ERR(asd))
+		return PTR_ERR(asd);
 
 	ret = v4l2_async_subdev_notifier_register(&priv->subdev,
 						  &priv->notifier);
-- 
Regards,

Laurent Pinchart

