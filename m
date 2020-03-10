Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6011917F5AC
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 12:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgCJLGo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 07:06:44 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:25631 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726269AbgCJLGo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 07:06:44 -0400
X-IronPort-AV: E=Sophos;i="5.70,536,1574089200"; 
   d="scan'208";a="41493390"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Mar 2020 20:06:43 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 85C74420C2EB;
        Tue, 10 Mar 2020 20:06:41 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/3] media: rcar-csi2: Add support to match fwnode against remote or parent port
Date:   Tue, 10 Mar 2020 11:06:02 +0000
Message-Id: <1583838364-12932-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583838364-12932-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1583838364-12932-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The rcar-csi2 driver uses the v4l2-async framework to do endpoint matching
instead of node matching. This is needed as it needs to work with the
adv748x driver which register it self in v4l2-async using endpoints
instead of nodes. The reason for this is that from a single DT node it
creates multiple subdevices, one for each endpoint.

But when using subdevs which register itself in v4l2-async using nodes,
the rcar-csi2 driver failed to find the matching endpoint because the
match.fwnode was pointing to remote endpoint instead of remote parent
port.

This commit adds support in rcar-csi2 driver to handle both the cases
where subdev registers in v4l2-async using endpoints/nodes, by using
match_type as V4L2_ASYNC_MATCH_CUSTOM and implementing the match()
callback to compare the fwnode of either remote/parent.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 41 ++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index faa9fb2..39e1639 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -808,6 +808,41 @@ static int rcsi2_parse_v4l2(struct rcar_csi2 *priv,
 	return 0;
 }
 
+static bool rcsi2_asd_match(struct device *dev,
+			    struct v4l2_async_subdev *async_sd)
+{
+	struct rcar_csi2 *priv = (struct rcar_csi2 *)
+				  async_sd->match.custom.priv;
+	struct fwnode_handle *endpoint;
+	struct fwnode_handle *remote;
+	struct fwnode_handle *parent;
+	struct device_node *np;
+	bool matched = false;
+
+	np = of_graph_get_endpoint_by_regs(priv->dev->of_node, 0, 0);
+	if (!np) {
+		dev_err(priv->dev, "Not connected to subdevice\n");
+		return -EINVAL;
+	}
+
+	endpoint = of_fwnode_handle(np);
+	remote = fwnode_graph_get_remote_endpoint(endpoint);
+	parent = fwnode_graph_get_remote_port_parent(endpoint);
+	if (parent) {
+		if (parent == dev->fwnode ||
+		    parent == &dev->of_node->fwnode)
+			matched = true;
+	} else if (remote && !matched) {
+		if (remote == dev->fwnode ||
+		    remote == &dev->of_node->fwnode)
+			matched = true;
+	}
+
+	of_node_put(np);
+
+	return matched;
+}
+
 static int rcsi2_parse_dt(struct rcar_csi2 *priv)
 {
 	struct device_node *ep;
@@ -833,9 +868,9 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
 		return ret;
 	}
 
-	priv->asd.match.fwnode =
-		fwnode_graph_get_remote_endpoint(of_fwnode_handle(ep));
-	priv->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
+	priv->asd.match.custom.match = &rcsi2_asd_match;
+	priv->asd.match.custom.priv = priv;
+	priv->asd.match_type = V4L2_ASYNC_MATCH_CUSTOM;
 
 	of_node_put(ep);
 
-- 
2.7.4

