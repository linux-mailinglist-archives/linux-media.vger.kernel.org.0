Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4114775648B
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 15:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231785AbjGQNWU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jul 2023 09:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231459AbjGQNVl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jul 2023 09:21:41 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D3D10D7
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 06:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689600066; x=1721136066;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B6OHufAuI7W16FNFWe/9nRfxnWey6PLQONI9jr6lGSc=;
  b=ICfB6AE3nYQQPVdb76/a4X4jnWwGLsdzJ7qnEp+Bu04/tUQsVIj9N+4i
   cTpjDPbkr2e9bM2SluV6OlrFhX94PgQStWp6vfaVdtDzFQCQW8z4C14oh
   9nzc7vsLxYVo5N4Jn3IaY9Difdk0IpESuDi0pibrBaleNMPsAO6n9KhsC
   XyP0xirSKSBHn4D0ynPP3g3iYIJ4mwu0PGrWRevNR9exYoaNJvSHqALT1
   hnaiGHvB1H4+a83ETdNoFqeQFJuiF7yKobhdeoDgXsCiytLP99yn6viX5
   zdiyWkVufHetAERNUzv7sKw6YUT40COJWQfpyJid70ymlL2Msb8Lofq7J
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432097824"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="432097824"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:20:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="726542020"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="726542020"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:20:36 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 2431212102D;
        Mon, 17 Jul 2023 16:20:16 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qLO8G-004s1D-0u;
        Mon, 17 Jul 2023 16:19:20 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v5 18/38] media: v4l: async: Simplify async sub-device fwnode matching
Date:   Mon, 17 Jul 2023 16:18:49 +0300
Message-Id: <20230717131909.1160787-19-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230717131909.1160787-1-sakari.ailus@linux.intel.com>
References: <20230717131909.1160787-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
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
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
---
 drivers/media/i2c/adv748x/adv748x-csi2.c   |  5 +-
 drivers/media/i2c/max9286.c                | 14 +---
 drivers/media/i2c/rdacm20.c                | 16 +---
 drivers/media/i2c/rdacm21.c                | 15 +---
 drivers/media/i2c/tc358746.c               |  5 --
 drivers/media/platform/nxp/imx-mipi-csis.c |  7 --
 drivers/media/v4l2-core/v4l2-async.c       | 88 ++++++----------------
 7 files changed, 26 insertions(+), 124 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index bd4f3fe0e309..b6f93c1db3d2 100644
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
index 88c58e0c49aa..6425b0b0b145 100644
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
index 01a2596282f0..f4e2e2f3972a 100644
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
index 043fec778a5e..3454f7d73121 100644
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
index e9b2d906c177..755be4575052 100644
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
 
diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 05d52762e792..d0dc30187775 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1365,13 +1365,6 @@ static int mipi_csis_subdev_init(struct mipi_csis_device *csis)
 
 	sd->dev = csis->dev;
 
-	sd->fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev),
-						     1, 0, 0);
-	if (!sd->fwnode) {
-		dev_err(csis->dev, "Unable to retrieve endpoint for port@1\n");
-		return -ENOENT;
-	}
-
 	csis->pads[CSIS_PAD_SINK].flags = MEDIA_PAD_FL_SINK
 					 | MEDIA_PAD_FL_MUST_CONNECT;
 	csis->pads[CSIS_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE
diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 04ea6f9a8ed3..11d336e783bd 100644
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
+	asd_dev_fwnode = fwnode_graph_get_port_parent(match->fwnode);
 
-	dev_dbg(notifier_dev(notifier),
-		"v4l2-async: fwnode compat match: need %pfw, trying %pfw\n",
-		dev_fwnode, other_fwnode);
+	ret = sd_fwnode == asd_dev_fwnode;
 
-	fwnode_handle_put(dev_fwnode);
+	fwnode_handle_put(asd_dev_fwnode);
 
-	if (dev_fwnode != other_fwnode) {
-		dev_dbg(notifier_dev(notifier),
-			"v4l2-async: compat match not found\n");
-		return false;
-	}
-
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
-	dev_dbg(notifier_dev(notifier), "v4l2-async: compat match found\n");
+	dev_dbg(notifier_dev(notifier),
+		"v4l2-async: device--endpoint match %sfound\n",
+		ret ? "" : "not ");
 
-	return true;
+	return ret;
 }
 
 static bool match_fwnode(struct v4l2_async_notifier *notifier,
@@ -816,12 +763,19 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
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
+	 * not the endpoint node.
 	 */
-	if (!sd->fwnode && sd->dev)
+	if (!sd->fwnode && sd->dev) {
 		sd->fwnode = dev_fwnode(sd->dev);
+	} else if (fwnode_graph_is_endpoint(sd->fwnode)) {
+		dev_warn(sd->dev, "sub-device fwnode is an endpoint!\n");
+		return -EINVAL;
+	}
 
 	mutex_lock(&list_lock);
 
-- 
2.39.2

