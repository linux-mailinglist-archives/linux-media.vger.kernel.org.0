Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA6732C459E
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 17:45:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732132AbgKYQpf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 11:45:35 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:60274 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732127AbgKYQpe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 11:45:34 -0500
X-Halon-ID: a0acf5e1-2f3d-11eb-a78a-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id a0acf5e1-2f3d-11eb-a78a-0050569116f7;
        Wed, 25 Nov 2020 17:45:30 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 4/5] rcar-vin: Rework CSI-2 firmware parsing
Date:   Wed, 25 Nov 2020 17:44:49 +0100
Message-Id: <20201125164450.2056963-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201125164450.2056963-1-niklas.soderlund+renesas@ragnatech.se>
References: <20201125164450.2056963-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rework the CSI-2 firmware parsing code to not use the soon to be
removed v4l2_async_notifier_parse_fwnode_endpoints_by_port() helper. The
change only aims to prepare for the removing of the old helper and there
are no functional change.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 67 ++++++++++++---------
 1 file changed, 40 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 830ab0865967310b..98bff765b02e67d9 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -812,37 +812,48 @@ static const struct v4l2_async_notifier_operations rvin_group_notify_ops = {
 	.complete = rvin_group_notify_complete,
 };
 
-static int rvin_mc_parse_of_endpoint(struct device *dev,
-				     struct v4l2_fwnode_endpoint *vep,
-				     struct v4l2_async_subdev *asd)
+static int rvin_mc_parse_of(struct rvin_dev *vin, unsigned int id)
 {
-	struct rvin_dev *vin = dev_get_drvdata(dev);
-	int ret = 0;
+	struct fwnode_handle *ep, *fwnode;
+	struct v4l2_fwnode_endpoint vep = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	struct v4l2_async_subdev *asd;
+	int ret;
 
-	if (vep->base.port != 1 || vep->base.id >= RVIN_CSI_MAX)
-		return -EINVAL;
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 1, id, 0);
+	if (!ep)
+		return 0;
 
-	if (!of_device_is_available(to_of_node(asd->match.fwnode))) {
+	fwnode = fwnode_graph_get_remote_endpoint(ep);
+	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+	fwnode_handle_put(ep);
+	if (ret) {
+		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (!of_device_is_available(to_of_node(fwnode))) {
 		vin_dbg(vin, "OF device %pOF disabled, ignoring\n",
-			to_of_node(asd->match.fwnode));
-		return -ENOTCONN;
-	}
-
-	mutex_lock(&vin->group->lock);
-
-	if (vin->group->csi[vep->base.id].asd) {
-		vin_dbg(vin, "OF device %pOF already handled\n",
-			to_of_node(asd->match.fwnode));
+			to_of_node(fwnode));
 		ret = -ENOTCONN;
 		goto out;
 	}
 
-	vin->group->csi[vep->base.id].asd = asd;
+	asd = v4l2_async_notifier_add_fwnode_subdev(&vin->group->notifier,
+						    fwnode, sizeof(*asd));
+	if (IS_ERR(asd)) {
+		ret = PTR_ERR(asd);
+		goto out;
+	}
+
+	vin->group->csi[vep.base.id].asd = asd;
 
 	vin_dbg(vin, "Add group OF device %pOF to slot %u\n",
-		to_of_node(asd->match.fwnode), vep->base.id);
+		to_of_node(fwnode), vep.base.id);
 out:
-	mutex_unlock(&vin->group->lock);
+	fwnode_handle_put(fwnode);
 
 	return ret;
 }
@@ -850,7 +861,7 @@ static int rvin_mc_parse_of_endpoint(struct device *dev,
 static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
 {
 	unsigned int count = 0, vin_mask = 0;
-	unsigned int i;
+	unsigned int i, id;
 	int ret;
 
 	mutex_lock(&vin->group->lock);
@@ -881,12 +892,14 @@ static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
 		if (!(vin_mask & BIT(i)))
 			continue;
 
-		ret = v4l2_async_notifier_parse_fwnode_endpoints_by_port(
-				vin->group->vin[i]->dev, &vin->group->notifier,
-				sizeof(struct v4l2_async_subdev), 1,
-				rvin_mc_parse_of_endpoint);
-		if (ret)
-			return ret;
+		for (id = 0; id < RVIN_CSI_MAX; id++) {
+			if (vin->group->csi[id].asd)
+				continue;
+
+			ret = rvin_mc_parse_of(vin->group->vin[i], id);
+			if (ret)
+				return ret;
+		}
 	}
 
 	if (list_empty(&vin->group->notifier.asd_list))
-- 
2.29.2

