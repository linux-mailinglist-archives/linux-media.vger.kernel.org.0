Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 658E026984B
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 23:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbgINVvN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 17:51:13 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:34543 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726059AbgINVvJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 17:51:09 -0400
X-Halon-ID: 63bdf0a7-f6d4-11ea-a39b-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac52a8.dip0.t-ipconnect.de [84.172.82.168])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 63bdf0a7-f6d4-11ea-a39b-005056917f90;
        Mon, 14 Sep 2020 23:51:05 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] rcar-csi2: Switch to using fwnode instead of OF
Date:   Mon, 14 Sep 2020 23:50:10 +0200
Message-Id: <20200914215011.339387-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200914215011.339387-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200914215011.339387-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the fwnode_graph_get_endpoint_by_id() interface instead of
of_graph_get_endpoint_by_regs() to fetch the fwnode. This saves
translating between a device_node and fwnode_handle.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 511cd4984777ad99..23e89ef2429d310a 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -873,31 +873,31 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
 {
 	struct v4l2_async_subdev *asd;
 	struct fwnode_handle *fwnode;
-	struct device_node *ep;
+	struct fwnode_handle *ep;
 	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
 	int ret;
 
-	ep = of_graph_get_endpoint_by_regs(priv->dev->of_node, 0, 0);
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(priv->dev), 0, 0, 0);
 	if (!ep) {
 		dev_err(priv->dev, "Not connected to subdevice\n");
 		return -EINVAL;
 	}
 
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &v4l2_ep);
+	ret = v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
 	if (ret) {
 		dev_err(priv->dev, "Could not parse v4l2 endpoint\n");
-		of_node_put(ep);
+		fwnode_handle_put(ep);
 		return -EINVAL;
 	}
 
 	ret = rcsi2_parse_v4l2(priv, &v4l2_ep);
 	if (ret) {
-		of_node_put(ep);
+		fwnode_handle_put(ep);
 		return ret;
 	}
 
-	fwnode = fwnode_graph_get_remote_endpoint(of_fwnode_handle(ep));
-	of_node_put(ep);
+	fwnode = fwnode_graph_get_remote_endpoint(ep);
+	fwnode_handle_put(ep);
 
 	dev_dbg(priv->dev, "Found '%pOF'\n", to_of_node(fwnode));
 
-- 
2.28.0

