Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 793D47049C1
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 11:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbjEPJ4I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 05:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232200AbjEPJ4G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 05:56:06 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 203FD359D
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 02:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684230965; x=1715766965;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wZ20NR7Em+kuTx/Ee9iM1XU0xAUhoZ7hlooSJMmLpmQ=;
  b=gZY2IpfWEsD3T5YJ8X7Oz5aaEjUdTZR86xgS2zsfJOq+VWpUREbgFTTO
   i4Ta99ycWCHLBS+N3BqPcuA1HI1s6jbnc3zv6CSGBGsU+23He2dtC49bf
   u2SLBQanocW6QDQxn42qlex7jKO8lsww51jfJrMCBgvQ+5i/Uly2mwY4C
   olgLg2zC/2APOO+ANra6Eap8/4qhO3iF+U66dLZ3ueO15HCsS6rE7IkSx
   Iq8wTubBulgZZuWI0Rh8HV47cOT+ZaDGCgUosFwUrmrnV+RzaMBVmM9kn
   wDZjFzsQ52Vj0Cun+J9/06BNDr6oqntmHea/lpQU+BlVckY5WLkJf7/My
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="354601364"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="354601364"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="731931793"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="731931793"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:43 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 24C11122EB3;
        Tue, 16 May 2023 12:55:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pyrOy-002ZAD-4m; Tue, 16 May 2023 12:55:28 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Subject: [PATCH v2 12/31] media: v4l: async: Simplify async sub-device fwnode matching
Date:   Tue, 16 May 2023 12:54:58 +0300
Message-Id: <20230516095517.611711-13-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
References: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2 async sub-device matching originally used the device nodes only.
Endpoint nodes were taken into use instead as using the device nodes was
problematic for it was in some cases ambiguous which link might have been
in question.

There is however no need to use endpoint nodes on both sides, as the async
sub-device's fwnode can always be trivially obtained using
fwnode_graph_get_remote_endpoint() when needed while what counts is
whether or not the link is between two device nodes, i.e. the device nodes
match.

This will briefly break the adv748x driver but it will be fixed later in
the set, by patch "media: adv748x: Return to endpoint matching".

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c |  5 +-
 drivers/media/i2c/max9286.c              | 14 +---
 drivers/media/i2c/rdacm20.c              | 16 +----
 drivers/media/i2c/rdacm21.c              | 15 +---
 drivers/media/i2c/tc358746.c             |  5 --
 drivers/media/v4l2-core/v4l2-async.c     | 90 ++++++------------------
 6 files changed, 28 insertions(+), 117 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index bd4f3fe0e3096..b6f93c1db3d2a 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -296,13 +296,12 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
 	if (!is_tx_enabled(tx))
 		return 0;
 
+	/* FIXME: Do endpoint matching again! */
+
 	adv748x_subdev_init(&tx->sd, state, &adv748x_csi2_ops,
 			    MEDIA_ENT_F_VID_IF_BRIDGE,
 			    is_txa(tx) ? "txa" : "txb");
 
-	/* Ensure that matching is based upon the endpoint fwnodes */
-	tx->sd.fwnode = of_fwnode_handle(state->endpoints[tx->port]);
-
 	/* Register internal ops for incremental subdev registration */
 	tx->sd.internal_ops = &adv748x_csi2_internal_ops;
 
diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 13a986b885889..64f5c49cae776 100644
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
 	if (ret < 0) {
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
index a2263fa825b59..9d8a8f9efd835 100644
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
@@ -650,7 +637,6 @@ static void rdacm20_remove(struct i2c_client *client)
 {
 	struct rdacm20_device *dev = i2c_to_rdacm20(client);
 
-	fwnode_handle_put(dev->sd.fwnode);
 	v4l2_async_unregister_subdev(&dev->sd);
 	v4l2_ctrl_handler_free(&dev->ctrls);
 	media_entity_cleanup(&dev->sd.entity);
diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index 9ccc56c30d3b0..d67cfcb2e05a4 100644
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
index ec1a193ba161a..b37a9ff73f6ad 100644
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
@@ -1486,7 +1483,6 @@ static int tc358746_async_register(struct tc358746 *tc358746)
 	return 0;
 
 err_unregister:
-	fwnode_handle_put(tc358746->sd.fwnode);
 	v4l2_async_nf_unregister(&tc358746->notifier);
 err_cleanup:
 	v4l2_async_nf_cleanup(&tc358746->notifier);
@@ -1605,7 +1601,6 @@ static void tc358746_remove(struct i2c_client *client)
 	v4l2_fwnode_endpoint_free(&tc358746->csi_vep);
 	v4l2_async_nf_unregister(&tc358746->notifier);
 	v4l2_async_nf_cleanup(&tc358746->notifier);
-	fwnode_handle_put(sd->fwnode);
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&sd->entity);
 
diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 82016b92102d4..d63ee30fe5c19 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -94,89 +94,36 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
 		 struct v4l2_subdev *sd, struct fwnode_handle *sd_fwnode,
 		 struct v4l2_async_match_desc *match)
 {
-	struct fwnode_handle *other_fwnode;
-	struct fwnode_handle *dev_fwnode;
-	bool asd_fwnode_is_ep;
-	bool sd_fwnode_is_ep;
-	struct device *dev;
+	struct fwnode_handle *asd_dev_fwnode;
+	bool ret;
 
 	dev_dbg(notifier_dev(notifier),
 		"v4l2-async: fwnode match: need %pfw, trying %pfw\n",
 		sd_fwnode, match->fwnode);
 
-	/*
-	 * Both the subdev and the async subdev can provide either an endpoint
-	 * fwnode or a device fwnode. Start with the simple case of direct
-	 * fwnode matching.
-	 */
 	if (sd_fwnode == match->fwnode) {
 		dev_dbg(notifier_dev(notifier),
 			"v4l2-async: direct match found\n");
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
-	asd_fwnode_is_ep = fwnode_graph_is_endpoint(match->fwnode);
-
-	if (sd_fwnode_is_ep == asd_fwnode_is_ep) {
+	if (!fwnode_graph_is_endpoint(match->fwnode)) {
 		dev_dbg(notifier_dev(notifier),
 			"v4l2-async: direct match not found\n");
 		return false;
 	}
 
-	/*
-	 * The sd and asd fwnodes are of different types. Get the device fwnode
-	 * parent of the endpoint fwnode, and compare it with the other fwnode.
-	 */
-	if (sd_fwnode_is_ep) {
-		dev_fwnode = fwnode_graph_get_port_parent(sd_fwnode);
-		other_fwnode = match->fwnode;
-	} else {
-		dev_fwnode = fwnode_graph_get_port_parent(match->fwnode);
-		other_fwnode = sd_fwnode;
-	}
-
-	dev_dbg(notifier_dev(notifier),
-		"v4l2-async: fwnode compat match: need %pfw, trying %pfw\n",
-		dev_fwnode, other_fwnode);
-
-	fwnode_handle_put(dev_fwnode);
+	asd_dev_fwnode = fwnode_graph_get_port_parent(match->fwnode);
 
-	if (dev_fwnode != other_fwnode) {
-		dev_dbg(notifier_dev(notifier),
-			"v4l2-async: compat match not found\n");
-		return false;
-	}
+	ret = sd_fwnode == asd_dev_fwnode;
 
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
+	fwnode_handle_put(asd_dev_fwnode);
 
-	dev_dbg(notifier_dev(notifier), "v4l2-async: compat match found\n");
+	dev_dbg(notifier_dev(notifier),
+		"v4l2-async: device--endpoint match %sfound\n",
+		ret ? "" : "not ");
 
-	return true;
+	return ret;
 }
 
 static bool match_fwnode(struct v4l2_async_notifier *notifier,
@@ -814,12 +761,21 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
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
-	if (!sd->fwnode && sd->dev)
+	if (!sd->fwnode && sd->dev) {
 		sd->fwnode = dev_fwnode(sd->dev);
+	} else if (fwnode_graph_is_endpoint(sd->fwnode)) {
+		dev_warn(sd->dev, "sub-device fwnode is an endpoint\n");
+		sd->fwnode = fwnode_graph_get_port_parent(sd->fwnode);
+	}
 
 	mutex_lock(&list_lock);
 
-- 
2.30.2

