Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59969756476
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 15:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231485AbjGQNWC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jul 2023 09:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230400AbjGQNVj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jul 2023 09:21:39 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42F3410D3
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 06:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689600060; x=1721136060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=syQraCRBi7qZgc23GK2gx2FD7RjMDiriUfASo/FYpKQ=;
  b=Vpex9AgkdNdg+2VNcGyP3Z3JcPe4xZ3DyTPS1w3RWDNjt0oXKgnzXBC+
   c3pdDyoxvfzLB8wxRpVN/vJldisdDJKvcfS9xpcGmiIbon0LWcvO4TKKy
   sxaeUN/03d2BvEo4JN5/JJ3Wa+EozD8rZRj7dru/0YZD49C3eExBjYtmx
   wgGruvpW7HIuxSmupQ90NLHE57maZQjRc5eWj7F/5XkFUZqcFwFZuSD4i
   l4Bg9CDJcTVnP2v+h+yjf5tj+/+vCxcBtBY3qfPfSjIpG+ZGQ75oq330h
   zMBGXF8e84v0jcsuiIPM4syDtlEjQiQcYQgp3nHsmz9YJ8QqfLqmeUMsj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432097543"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="432097543"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:20:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="726541910"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="726541910"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:20:27 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id ED92C120E95;
        Mon, 17 Jul 2023 16:20:15 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qLO8G-004s0e-0L;
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
Subject: [PATCH v5 11/38] media: v4l: async: Add some debug prints
Date:   Mon, 17 Jul 2023 16:18:42 +0300
Message-Id: <20230717131909.1160787-12-sakari.ailus@linux.intel.com>
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

Just add some debug prints for V4L2 async sub-device matching process.
These might come useful in figuring out why things don't work as expected.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
---
 drivers/media/v4l2-core/v4l2-async.c | 71 ++++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 7831bc879290..c5781124337a 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -77,6 +77,17 @@ static bool match_i2c(struct v4l2_async_notifier *notifier,
 #endif
 }
 
+static struct device *notifier_dev(struct v4l2_async_notifier *notifier)
+{
+	if (notifier->sd)
+		return notifier->sd->dev;
+
+	if (notifier->v4l2_dev)
+		return notifier->v4l2_dev->dev;
+
+	return NULL;
+}
+
 static bool
 match_fwnode_one(struct v4l2_async_notifier *notifier,
 		 struct v4l2_subdev *sd, struct fwnode_handle *sd_fwnode,
@@ -88,13 +99,20 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
 	bool sd_fwnode_is_ep;
 	struct device *dev;
 
+	dev_dbg(notifier_dev(notifier),
+		"v4l2-async: fwnode match: need %pfw, trying %pfw\n",
+		sd_fwnode, asd->match.fwnode);
+
 	/*
 	 * Both the subdev and the async subdev can provide either an endpoint
 	 * fwnode or a device fwnode. Start with the simple case of direct
 	 * fwnode matching.
 	 */
-	if (sd_fwnode == asd->match.fwnode)
+	if (sd_fwnode == asd->match.fwnode) {
+		dev_dbg(notifier_dev(notifier),
+			"v4l2-async: direct match found\n");
 		return true;
+	}
 
 	/*
 	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
@@ -107,8 +125,11 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
 	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd_fwnode);
 	asd_fwnode_is_ep = fwnode_graph_is_endpoint(asd->match.fwnode);
 
-	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
+	if (sd_fwnode_is_ep == asd_fwnode_is_ep) {
+		dev_dbg(notifier_dev(notifier),
+			"v4l2-async: direct match not found\n");
 		return false;
+	}
 
 	/*
 	 * The sd and asd fwnodes are of different types. Get the device fwnode
@@ -122,10 +143,17 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
 		other_fwnode = sd_fwnode;
 	}
 
+	dev_dbg(notifier_dev(notifier),
+		"v4l2-async: fwnode compat match: need %pfw, trying %pfw\n",
+		dev_fwnode, other_fwnode);
+
 	fwnode_handle_put(dev_fwnode);
 
-	if (dev_fwnode != other_fwnode)
+	if (dev_fwnode != other_fwnode) {
+		dev_dbg(notifier_dev(notifier),
+			"v4l2-async: compat match not found\n");
 		return false;
+	}
 
 	/*
 	 * We have a heterogeneous match. Retrieve the struct device of the side
@@ -145,12 +173,18 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
 			   dev->driver->name);
 	}
 
+	dev_dbg(notifier_dev(notifier), "v4l2-async: compat match found\n");
+
 	return true;
 }
 
 static bool match_fwnode(struct v4l2_async_notifier *notifier,
 			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
 {
+	dev_dbg(notifier_dev(notifier),
+		"v4l2-async: matching for notifier %pfw, sd fwnode %pfw\n",
+		dev_fwnode(notifier_dev(notifier)), sd->fwnode);
+
 	if (match_fwnode_one(notifier, sd, sd->fwnode, asd))
 		return true;
 
@@ -158,6 +192,9 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
 	if (IS_ERR_OR_NULL(sd->fwnode->secondary))
 		return false;
 
+	dev_dbg(notifier_dev(notifier),
+		"v4l2-async: trying secondary fwnode match\n");
+
 	return match_fwnode_one(notifier, sd, sd->fwnode->secondary, asd);
 }
 
@@ -271,22 +308,33 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
 static int
 v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
 {
+	struct v4l2_async_notifier *__notifier = notifier;
+
 	/* Quick check whether there are still more sub-devices here. */
 	if (!list_empty(&notifier->waiting))
 		return 0;
 
+	if (notifier->sd)
+		dev_dbg(notifier_dev(notifier),
+			"v4l2-async: trying to complete\n");
+
 	/* Check the entire notifier tree; find the root notifier first. */
 	while (notifier->parent)
 		notifier = notifier->parent;
 
 	/* This is root if it has v4l2_dev. */
-	if (!notifier->v4l2_dev)
+	if (!notifier->v4l2_dev) {
+		dev_dbg(notifier_dev(__notifier),
+			"v4l2-async: V4L2 device not available\n");
 		return 0;
+	}
 
 	/* Is everything ready? */
 	if (!v4l2_async_nf_can_complete(notifier))
 		return 0;
 
+	dev_dbg(notifier_dev(__notifier), "v4l2-async: complete\n");
+
 	return v4l2_async_nf_call_complete(notifier);
 }
 
@@ -350,6 +398,9 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 	/* Move from the global subdevice list to notifier's done */
 	list_move(&sd->async_list, &notifier->done);
 
+	dev_dbg(notifier_dev(notifier), "v4l2-async: %s bound (ret %d)\n",
+		dev_name(sd->dev), ret);
+
 	/*
 	 * See if the sub-device has a notifier. If not, return here.
 	 */
@@ -378,6 +429,8 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier)
 	if (!v4l2_dev)
 		return 0;
 
+	dev_dbg(notifier_dev(notifier), "v4l2-async: trying all sub-devices\n");
+
 again:
 	list_for_each_entry(sd, &subdev_list, async_list) {
 		struct v4l2_async_subdev *asd;
@@ -387,6 +440,9 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier)
 		if (!asd)
 			continue;
 
+		dev_dbg(notifier_dev(notifier),
+			"v4l2-async: match found, subdev %s\n", sd->name);
+
 		ret = v4l2_async_match_notify(notifier, v4l2_dev, sd, asd);
 		if (ret < 0)
 			return ret;
@@ -496,8 +552,7 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_subdev *asd,
 				   int this_index)
 {
-	struct device *dev =
-		notifier->v4l2_dev ? notifier->v4l2_dev->dev : NULL;
+	struct device *dev = notifier_dev(notifier);
 
 	if (!asd)
 		return -EINVAL;
@@ -506,12 +561,12 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
 	case V4L2_ASYNC_MATCH_I2C:
 	case V4L2_ASYNC_MATCH_FWNODE:
 		if (v4l2_async_nf_has_async_subdev(notifier, asd, this_index)) {
-			dev_dbg(dev, "subdev descriptor already listed in this or other notifiers\n");
+			dev_dbg(dev, "v4l2-async: subdev descriptor already listed in a notifier\n");
 			return -EEXIST;
 		}
 		break;
 	default:
-		dev_err(dev, "Invalid match type %u on %p\n",
+		dev_err(dev, "v4l2-async: Invalid match type %u on %p\n",
 			asd->match_type, asd);
 		return -EINVAL;
 	}
-- 
2.39.2

