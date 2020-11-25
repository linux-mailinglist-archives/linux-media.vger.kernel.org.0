Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A82AB2C45A2
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 17:45:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732136AbgKYQph (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 11:45:37 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:63836 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732109AbgKYQpd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 11:45:33 -0500
X-Halon-ID: 9f117fc7-2f3d-11eb-a78a-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 9f117fc7-2f3d-11eb-a78a-0050569116f7;
        Wed, 25 Nov 2020 17:45:28 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/5] rcar-vin: Rework parallel firmware parsing
Date:   Wed, 25 Nov 2020 17:44:47 +0100
Message-Id: <20201125164450.2056963-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201125164450.2056963-1-niklas.soderlund+renesas@ragnatech.se>
References: <20201125164450.2056963-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rework the parallel firmware parsing code to not use the soon to be
removed v4l2_async_notifier_parse_fwnode_endpoints_by_port() helper. The
change only aims to prepare for the removing of the old helper and there
are no functional change.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 50 +++++++++++++++------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 07f250bfc0051135..396ff5531359f3f4 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -604,32 +604,56 @@ static const struct v4l2_async_notifier_operations rvin_parallel_notify_ops = {
 	.complete = rvin_parallel_notify_complete,
 };
 
-static int rvin_parallel_parse_v4l2(struct device *dev,
-				    struct v4l2_fwnode_endpoint *vep,
-				    struct v4l2_async_subdev *asd)
+static int rvin_parallel_parse_of(struct rvin_dev *vin)
 {
-	struct rvin_dev *vin = dev_get_drvdata(dev);
+	struct fwnode_handle *ep, *fwnode;
+	struct v4l2_fwnode_endpoint vep = {
+		.bus_type = V4L2_MBUS_UNKNOWN,
+	};
+	struct v4l2_async_subdev *asd;
+	int ret;
 
-	if (vep->base.port || vep->base.id)
-		return -ENOTCONN;
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 0, 0, 0);
+	if (!ep)
+		return 0;
 
-	vin->parallel.mbus_type = vep->bus_type;
+	fwnode = fwnode_graph_get_remote_endpoint(ep);
+	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+	fwnode_handle_put(ep);
+	if (ret) {
+		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
+		ret = -EINVAL;
+		goto out;
+	}
 
-	switch (vin->parallel.mbus_type) {
+	switch (vep.bus_type) {
 	case V4L2_MBUS_PARALLEL:
 	case V4L2_MBUS_BT656:
 		vin_dbg(vin, "Found %s media bus\n",
-			vin->parallel.mbus_type == V4L2_MBUS_PARALLEL ?
+			vep.bus_type == V4L2_MBUS_PARALLEL ?
 			"PARALLEL" : "BT656");
-		vin->parallel.bus = vep->bus.parallel;
+		vin->parallel.mbus_type = vep.bus_type;
+		vin->parallel.bus = vep.bus.parallel;
 		break;
 	default:
 		vin_err(vin, "Unknown media bus type\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out;
+	}
+
+	asd = v4l2_async_notifier_add_fwnode_subdev(&vin->notifier, fwnode,
+						    sizeof(*asd));
+	if (IS_ERR(asd)) {
+		ret = PTR_ERR(asd);
+		goto out;
 	}
 
 	vin->parallel.asd = asd;
 
+	vin_dbg(vin, "Add parallel OF device %pOF\n", to_of_node(fwnode));
+out:
+	fwnode_handle_put(fwnode);
+
 	return 0;
 }
 
@@ -639,9 +663,7 @@ static int rvin_parallel_init(struct rvin_dev *vin)
 
 	v4l2_async_notifier_init(&vin->notifier);
 
-	ret = v4l2_async_notifier_parse_fwnode_endpoints_by_port(
-		vin->dev, &vin->notifier, sizeof(*vin->parallel.asd),
-		0, rvin_parallel_parse_v4l2);
+	ret = rvin_parallel_parse_of(vin);
 	if (ret)
 		return ret;
 
-- 
2.29.2

