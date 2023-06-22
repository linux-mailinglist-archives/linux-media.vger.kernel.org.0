Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB4B3739FCF
	for <lists+linux-media@lfdr.de>; Thu, 22 Jun 2023 13:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbjFVLlX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jun 2023 07:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230478AbjFVLlU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jun 2023 07:41:20 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0471E1BFE
        for <linux-media@vger.kernel.org>; Thu, 22 Jun 2023 04:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687434076; x=1718970076;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hEBkUMTkIV3+7+RAO3S50QThuWumOnzTpbEVEolPesQ=;
  b=OdxpTCAn2aphCx3sAr3fJKQK9wmr9z+NdghifOTXjBC+23ZAKOxxld2U
   /ogfYaTOUWIZe7unry94Lc05X2wYHMjSVerZSZGI10pRQrYt6OJ8YZw+L
   0CWZu0/CrDX9beM8uNFtOGGGBTdHgjxIaugExynOK1Ji5L8o5pX3FnFTR
   GPmF/diDS1p+m+mWlYqZ4aG5d1U7AHYDecns407xFlNu1VcaMAnaB/9Ba
   rR5vZ6vxngUElUchyDQbRzX/WfwTczgcx7jZbxXSh9xAIpSUAzQXjHGAU
   D0T1s1bwt8+GfBTlVCcfyQkT7T/daqCquuleS2cou75CRTps644svpbcT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="357957713"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="357957713"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="804749900"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="804749900"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:03 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id EB29D120BB3;
        Thu, 22 Jun 2023 14:40:50 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qCIg2-003oSk-2p;
        Thu, 22 Jun 2023 14:40:38 +0300
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
Subject: [PATCH v4 11/38] media: v4l: async: Add some debug prints
Date:   Thu, 22 Jun 2023 14:40:01 +0300
Message-Id: <20230622114028.908825-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230622114028.908825-1-sakari.ailus@linux.intel.com>
References: <20230622114028.908825-1-sakari.ailus@linux.intel.com>
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
Tested_by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
---
 drivers/media/v4l2-core/v4l2-async.c | 71 ++++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 7831bc8792904..c5781124337af 100644
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

