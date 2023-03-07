Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08FD26AF78F
	for <lists+linux-media@lfdr.de>; Tue,  7 Mar 2023 22:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbjCGV21 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Mar 2023 16:28:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231448AbjCGV2Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Mar 2023 16:28:25 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D8B93E09
        for <linux-media@vger.kernel.org>; Tue,  7 Mar 2023 13:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678224499; x=1709760499;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QfmuT3q4+mTT/6QyePKouiEHaOY4cUGKIJxXR9FVf3Y=;
  b=R7QXQGM1ALiF4T9Hlt3qeeNTOqK+whXMe2c0dUfE0voZy6EK5iUci7zu
   argMDfX7x306eINS12uFVc9Y4+0w168FoniYC/ilZCzYXa7uiTk8Rx496
   tkzc8ao5uNh9/4dmt3x4smKTYrzzOcYfhkuREhATORHJpXesX1hk/fn6Y
   /XlE6wu0vgoOuizU7uNlDPFAMQ+ULxSAoBSjsSWYORu9Y6EKvhdqUihEI
   AnHIfoIVY3cLsyqcOqsfyipN4+j+xfHQ2qoFkck8MShDBGeqhD7NCcc6R
   JjgIHGfY4fDVT0Ia5MGyRakQZHFIbaHWcjgdWbIAmNIT5umEo3S2gJlSl
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="398557058"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="398557058"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 13:28:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="676710117"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="676710117"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 13:28:10 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 10836122D8B;
        Tue,  7 Mar 2023 23:20:41 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com
Subject: [RFC 03/10] media: v4l: async: Simplify async sub-device fwnode matching
Date:   Tue,  7 Mar 2023 23:20:31 +0200
Message-Id: <20230307212038.968381-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230307212038.968381-1-sakari.ailus@linux.intel.com>
References: <20230307212038.968381-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2 async sub-device matching originally used the device nodes only.
Endpoint nodes were taken into use instead as using the device nodes was
problematic for it was in some cases ambiguous which link might have been in
question.

There is however no need to use endpoint nodes on both sides, as the async
sub-device's fwnode can always be trivially obtained using
fwnode_graph_get_remote_endpoint() when needed while what counts is whether
or not the link is between two device nodes, i.e. the device nodes match.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c |  3 -
 drivers/media/i2c/max9286.c              | 16 +----
 drivers/media/i2c/rdacm20.c              | 15 +----
 drivers/media/i2c/rdacm21.c              | 15 +----
 drivers/media/i2c/tc358746.c             |  3 -
 drivers/media/v4l2-core/v4l2-async.c     | 86 ++++++------------------
 6 files changed, 25 insertions(+), 113 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index bd4f3fe0e309..3d830816243f 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -300,9 +300,6 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
 			    MEDIA_ENT_F_VID_IF_BRIDGE,
 			    is_txa(tx) ? "txa" : "txb");
 
-	/* Ensure that matching is based upon the endpoint fwnodes */
-	tx->sd.fwnode = of_fwnode_handle(state->endpoints[tx->port]);
-
 	/* Register internal ops for incremental subdev registration */
 	tx->sd.internal_ops = &adv748x_csi2_internal_ops;
 
diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 701038d6d19b..b64693fc35e9 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1051,7 +1051,6 @@ static const struct v4l2_ctrl_ops max9286_ctrl_ops = {
 static int max9286_v4l2_register(struct max9286_priv *priv)
 {
 	struct device *dev = &priv->client->dev;
-	struct fwnode_handle *ep;
 	int ret;
 	int i;
 
@@ -1093,25 +1092,14 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
 	if (ret)
 		goto err_async;
 
-	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), MAX9286_SRC_PAD,
-					     0, 0);
-	if (!ep) {
-		dev_err(dev, "Unable to retrieve endpoint on \"port@4\"\n");
-		ret = -ENOENT;
-		goto err_async;
-	}
-	priv->sd.fwnode = ep;
-
 	ret = v4l2_async_register_subdev(&priv->sd);
-	if (ret < 0) {
+	if (ret < 0)
 		dev_err(dev, "Unable to register subdevice\n");
-		goto err_put_node;
+		goto err_async;
 	}
 
 	return 0;
 
-err_put_node:
-	fwnode_handle_put(ep);
 err_async:
 	v4l2_ctrl_handler_free(&priv->ctrls);
 	max9286_v4l2_notifier_unregister(priv);
diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index a2263fa825b5..ea1111152285 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -567,7 +567,6 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 static int rdacm20_probe(struct i2c_client *client)
 {
 	struct rdacm20_device *dev;
-	struct fwnode_handle *ep;
 	int ret;
 
 	dev = devm_kzalloc(&client->dev, sizeof(*dev), GFP_KERNEL);
@@ -616,24 +615,12 @@ static int rdacm20_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto error_free_ctrls;
 
-	ep = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
-	if (!ep) {
-		dev_err(&client->dev,
-			"Unable to get endpoint in node %pOF\n",
-			client->dev.of_node);
-		ret = -ENOENT;
-		goto error_free_ctrls;
-	}
-	dev->sd.fwnode = ep;
-
 	ret = v4l2_async_register_subdev(&dev->sd);
 	if (ret)
-		goto error_put_node;
+		goto error_free_ctrls;
 
 	return 0;
 
-error_put_node:
-	fwnode_handle_put(ep);
 error_free_ctrls:
 	v4l2_ctrl_handler_free(&dev->ctrls);
 error:
diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index 9ccc56c30d3b..d67cfcb2e05a 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -543,7 +543,6 @@ static int rdacm21_initialize(struct rdacm21_device *dev)
 static int rdacm21_probe(struct i2c_client *client)
 {
 	struct rdacm21_device *dev;
-	struct fwnode_handle *ep;
 	int ret;
 
 	dev = devm_kzalloc(&client->dev, sizeof(*dev), GFP_KERNEL);
@@ -588,24 +587,12 @@ static int rdacm21_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto error_free_ctrls;
 
-	ep = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
-	if (!ep) {
-		dev_err(&client->dev,
-			"Unable to get endpoint in node %pOF\n",
-			client->dev.of_node);
-		ret = -ENOENT;
-		goto error_free_ctrls;
-	}
-	dev->sd.fwnode = ep;
-
 	ret = v4l2_async_register_subdev(&dev->sd);
 	if (ret)
-		goto error_put_node;
+		goto error_free_ctrls;
 
 	return 0;
 
-error_put_node:
-	fwnode_handle_put(dev->sd.fwnode);
 error_free_ctrls:
 	v4l2_ctrl_handler_free(&dev->ctrls);
 error:
diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index 4063754a6732..56f2b43d4edf 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -1476,9 +1476,6 @@ static int tc358746_async_register(struct tc358746 *tc358746)
 	if (err)
 		goto err_cleanup;
 
-	tc358746->sd.fwnode = fwnode_graph_get_endpoint_by_id(
-		dev_fwnode(tc358746->sd.dev), TC358746_SOURCE, 0, 0);
-
 	err = v4l2_async_register_subdev(&tc358746->sd);
 	if (err)
 		goto err_unregister;
diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 6dd426c2ca68..13fe0bdc70b6 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -86,84 +86,33 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
 		 struct v4l2_subdev *sd, struct fwnode_handle *sd_fwnode,
 		 struct v4l2_async_subdev *asd)
 {
-	struct fwnode_handle *other_fwnode;
-	struct fwnode_handle *dev_fwnode;
-	bool asd_fwnode_is_ep;
-	bool sd_fwnode_is_ep;
-	struct device *dev;
+	struct fwnode_handle *asd_dev_fwnode;
+	bool ret;
 
 	dev_dbg(sd->dev, "async: fwnode match: need %pfw, trying %pfw\n",
 		sd_fwnode, asd->match.fwnode);
 
-	/*
-	 * Both the subdev and the async subdev can provide either an endpoint
-	 * fwnode or a device fwnode. Start with the simple case of direct
-	 * fwnode matching.
-	 */
 	if (sd_fwnode == asd->match.fwnode) {
 		dev_dbg(sd->dev, "async: direct match found\n");
 		return true;
 	}
 
-	/*
-	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
-	 * endpoint or a device. If they're of the same type, there's no match.
-	 * Technically speaking this checks if the nodes refer to a connected
-	 * endpoint, which is the simplest check that works for both OF and
-	 * ACPI. This won't make a difference, as drivers should not try to
-	 * match unconnected endpoints.
-	 */
-	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd_fwnode);
-	asd_fwnode_is_ep = fwnode_graph_is_endpoint(asd->match.fwnode);
-
-	if (sd_fwnode_is_ep == asd_fwnode_is_ep) {
-		dev_dbg(sd->dev, "async: matching node types\n");
+	if (!fwnode_graph_is_endpoint(asd->match.fwnode)) {
+		dev_dbg(sd->dev,
+			"async: async subdev fwnode not endpoint, no match\n");
 		return false;
 	}
 
-	/*
-	 * The sd and asd fwnodes are of different types. Get the device fwnode
-	 * parent of the endpoint fwnode, and compare it with the other fwnode.
-	 */
-	if (sd_fwnode_is_ep) {
-		dev_fwnode = fwnode_graph_get_port_parent(sd_fwnode);
-		other_fwnode = asd->match.fwnode;
-	} else {
-		dev_fwnode = fwnode_graph_get_port_parent(asd->match.fwnode);
-		other_fwnode = sd_fwnode;
-	}
-
-	dev_dbg(sd->dev, "async: fwnode compat match, need %pfw, trying %pfw\n",
-		dev_fwnode, other_fwnode);
+	asd_dev_fwnode = fwnode_graph_get_port_parent(asd->match.fwnode);
 
-	fwnode_handle_put(dev_fwnode);
+	ret = sd_fwnode == asd_dev_fwnode;
 
-	if (dev_fwnode != other_fwnode) {
-		dev_dbg(sd->dev, "async: compat match not found\n");
-		return false;
-	}
+	fwnode_handle_put(asd_dev_fwnode);
 
-	/*
-	 * We have a heterogeneous match. Retrieve the struct device of the side
-	 * that matched on a device fwnode to print its driver name.
-	 */
-	if (sd_fwnode_is_ep)
-		dev = notifier->v4l2_dev ? notifier->v4l2_dev->dev
-		    : notifier->sd->dev;
-	else
-		dev = sd->dev;
-
-	if (dev && dev->driver) {
-		if (sd_fwnode_is_ep)
-			dev_warn(dev, "Driver %s uses device fwnode, incorrect match may occur\n",
-				 dev->driver->name);
-		dev_notice(dev, "Consider updating driver %s to match on endpoints\n",
-			   dev->driver->name);
-	}
-
-	dev_dbg(sd->dev, "async: compat match found\n");
+	dev_dbg(sd->dev, "async: device--endpoint match %sfound\n",
+		ret ? "" : "not ");
 
-	return true;
+	return ret;
 }
 
 static bool match_fwnode(struct v4l2_async_notifier *notifier,
@@ -804,12 +753,19 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 	int ret;
 
 	/*
-	 * No reference taken. The reference is held by the device
-	 * (struct v4l2_subdev.dev), and async sub-device does not
-	 * exist independently of the device at any point of time.
+	 * No reference taken. The reference is held by the device (struct
+	 * v4l2_subdev.dev), and async sub-device does not exist independently
+	 * of the device at any point of time.
+	 *
+	 * The async sub-device shall always be registered for its device node,
+	 * not the endpoint node. Issue a warning in that case. Once there is
+	 * certainty no driver no longer does this, remove the warning (and
+	 * compatibility code) below.
 	 */
 	if (!sd->fwnode && sd->dev)
 		sd->fwnode = dev_fwnode(sd->dev);
+	else if (WARN_ON(fwnode_graph_is_endpoint(sd->fwnode)))
+		sd->fwnode = fwnode_graph_get_port_parent(sd->fwnode);
 
 	mutex_lock(&list_lock);
 
-- 
2.30.2

