Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFE217049C5
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 11:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232216AbjEPJ4L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 05:56:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232203AbjEPJ4I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 05:56:08 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 059412D62
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 02:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684230967; x=1715766967;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3fjbuzwB4TQgvmEum3YTXwrxL3vBT0PAChlBP/Zs2sQ=;
  b=RKixRkr93MEUp+cun+v8awR6KdZdBmkz9cqkcjwBe/GFlRK7JY47nqVc
   8gXsJO9IVHtEoLqLa2IxRfR/QWDowV2316grFYsH+g+ivuNCM5ds+Fwz9
   +N+ZqNTib0AznitBPZmnRRIFN5X+0xq3OaactMAHOGUsWcj+Mpww9GGUU
   xPmppIqb1Zfo3CAfeVfIouvwsZKRXsBtyjpsLFCV+ru9geO9OKeelRtLh
   4XjHVITU4IkIrqyGI5DVc2xaEF+VjiWuorwwAA7jdX7BTnzRLPrIA9ttJ
   Ei/axQz6K4KG6wlmWcpZu8Ys1Zz0hLGGwf5CyR9DWddGW99QfLF6eeFWa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="353715228"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="353715228"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="678791323"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="678791323"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:38 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E80A51216E0;
        Tue, 16 May 2023 12:55:35 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pyrOx-002Z9m-UV; Tue, 16 May 2023 12:55:27 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Subject: [PATCH v2 04/31] media: v4l: async: Add some debug prints
Date:   Tue, 16 May 2023 12:54:50 +0300
Message-Id: <20230516095517.611711-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
References: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just add some debug prints for V4L2 async sub-device matching process.
These might come useful in figuring out why things don't work as expected.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 71 ++++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 7831bc8792904..5f43107910e89 100644
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
 
+		dev_dbg(notifier_dev(notifier), "v4l2-async: match found, subdev %s\n",
+			sd->name);
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
+			dev_dbg(dev, "v4l2-async: subdev descriptor already listed in this or other notifiers\n");
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
2.30.2

