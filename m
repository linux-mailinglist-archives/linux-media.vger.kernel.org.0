Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5C796AF78E
	for <lists+linux-media@lfdr.de>; Tue,  7 Mar 2023 22:28:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbjCGV20 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Mar 2023 16:28:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbjCGV2X (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Mar 2023 16:28:23 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 145C72DE56
        for <linux-media@vger.kernel.org>; Tue,  7 Mar 2023 13:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678224498; x=1709760498;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jlyutxkfvpEhwDQh1Jj39clHdERR3Y+LZA1cpv3ay9U=;
  b=TE0uxMG0nRDPGA3EFOQ/JCsUn5OGK5PvD/SxPQ3DqJ/PxUqoFFro3Tg1
   SKzDQtOIeMfAU6BxYJm5bM16l3aGMfaN+39XnOiegvzphzGteKy+Arg1C
   oCPJeCDzSndLVKiusbpz8+vqcIx8QMELqPoLK7zoKGvPQiNxms2j8FTVY
   rEKLGsUYDFxwRSI0FSaYcSUQNBMI5GJuaf0noBiztWB6Ak1a6OPZlFSOw
   iPrnUFtgWNnpYI/BfHifQm2sjX48GulOasv5WF+MPdadKfT2bv2db+XBB
   UVjGuVQuy3O6P8o//k0BZ5cr664Q7XOUgJ0vhR5PjKWWPGkuBuEUengFC
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="398557065"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="398557065"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 13:28:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="676710118"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="676710118"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 13:28:10 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 1C570122D27;
        Tue,  7 Mar 2023 23:20:41 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com
Subject: [RFC 02/10] media: v4l: async: Add some debug prints
Date:   Tue,  7 Mar 2023 23:20:30 +0200
Message-Id: <20230307212038.968381-3-sakari.ailus@linux.intel.com>
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

Just add some debug prints for V4L2 async sub-device matching process. These
might come useful in figuring out why things don't work as expected.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 59 ++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 008a2a3e312e..6dd426c2ca68 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -75,6 +75,12 @@ static bool match_i2c(struct v4l2_async_notifier *notifier,
 #endif
 }
 
+static struct device *notifier_dev(struct v4l2_async_notifier *notifier)
+{
+	return notifier->sd ? notifier->sd->dev : notifier->v4l2_dev ?
+		notifier->v4l2_dev->dev : NULL;
+}
+
 static bool
 match_fwnode_one(struct v4l2_async_notifier *notifier,
 		 struct v4l2_subdev *sd, struct fwnode_handle *sd_fwnode,
@@ -86,13 +92,18 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
 	bool sd_fwnode_is_ep;
 	struct device *dev;
 
+	dev_dbg(sd->dev, "async: fwnode match: need %pfw, trying %pfw\n",
+		sd_fwnode, asd->match.fwnode);
+
 	/*
 	 * Both the subdev and the async subdev can provide either an endpoint
 	 * fwnode or a device fwnode. Start with the simple case of direct
 	 * fwnode matching.
 	 */
-	if (sd_fwnode == asd->match.fwnode)
+	if (sd_fwnode == asd->match.fwnode) {
+		dev_dbg(sd->dev, "async: direct match found\n");
 		return true;
+	}
 
 	/*
 	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
@@ -105,8 +116,10 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
 	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd_fwnode);
 	asd_fwnode_is_ep = fwnode_graph_is_endpoint(asd->match.fwnode);
 
-	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
+	if (sd_fwnode_is_ep == asd_fwnode_is_ep) {
+		dev_dbg(sd->dev, "async: matching node types\n");
 		return false;
+	}
 
 	/*
 	 * The sd and asd fwnodes are of different types. Get the device fwnode
@@ -120,10 +133,15 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
 		other_fwnode = sd_fwnode;
 	}
 
+	dev_dbg(sd->dev, "async: fwnode compat match, need %pfw, trying %pfw\n",
+		dev_fwnode, other_fwnode);
+
 	fwnode_handle_put(dev_fwnode);
 
-	if (dev_fwnode != other_fwnode)
+	if (dev_fwnode != other_fwnode) {
+		dev_dbg(sd->dev, "async: compat match not found\n");
 		return false;
+	}
 
 	/*
 	 * We have a heterogeneous match. Retrieve the struct device of the side
@@ -143,12 +161,17 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
 			   dev->driver->name);
 	}
 
+	dev_dbg(sd->dev, "async: compat match found\n");
+
 	return true;
 }
 
 static bool match_fwnode(struct v4l2_async_notifier *notifier,
 			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
 {
+	dev_dbg(sd->dev, "async: matching for notifier %pfw, sd %pfw\n",
+		dev_fwnode(notifier_dev(notifier)), sd->fwnode);
+
 	if (match_fwnode_one(notifier, sd, sd->fwnode, asd))
 		return true;
 
@@ -156,6 +179,8 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
 	if (IS_ERR_OR_NULL(sd->fwnode->secondary))
 		return false;
 
+	dev_dbg(sd->dev, "async: trying secondary fwnode match\n");
+
 	return match_fwnode_one(notifier, sd, sd->fwnode->secondary, asd);
 }
 
@@ -247,16 +272,21 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
 {
 	struct v4l2_subdev *sd;
 
-	if (!list_empty(&notifier->waiting))
+	if (!list_empty(&notifier->waiting)) {
+		dev_dbg(notifier_dev(notifier), "async: waiting for subdevs\n");
 		return false;
+	}
 
 	list_for_each_entry(sd, &notifier->done, async_list) {
 		struct v4l2_async_notifier *subdev_notifier =
 			v4l2_async_find_subdev_notifier(sd);
 
 		if (subdev_notifier &&
-		    !v4l2_async_nf_can_complete(subdev_notifier))
+		    !v4l2_async_nf_can_complete(subdev_notifier)) {
+			dev_dbg(notifier_dev(notifier),
+				"async: cannot complete\n");
 			return false;
+		}
 	}
 
 	return true;
@@ -269,22 +299,32 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
 static int
 v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
 {
+	struct v4l2_async_notifier *__notifier = notifier;
+
 	/* Quick check whether there are still more sub-devices here. */
 	if (!list_empty(&notifier->waiting))
 		return 0;
 
+	if (notifier->sd)
+		dev_dbg(notifier_dev(notifier), "async: trying to complete\n");
+
 	/* Check the entire notifier tree; find the root notifier first. */
 	while (notifier->parent)
 		notifier = notifier->parent;
 
 	/* This is root if it has v4l2_dev. */
-	if (!notifier->v4l2_dev)
+	if (!notifier->v4l2_dev) {
+		dev_dbg(notifier_dev(__notifier),
+			"async: V4L2 device not available\n");
 		return 0;
+	}
 
 	/* Is everything ready? */
 	if (!v4l2_async_nf_can_complete(notifier))
 		return 0;
 
+	dev_dbg(notifier_dev(__notifier), "async: complete\n");
+
 	return v4l2_async_nf_call_complete(notifier);
 }
 
@@ -362,7 +402,12 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 	 */
 	subdev_notifier->parent = notifier;
 
-	return v4l2_async_nf_try_all_subdevs(subdev_notifier);
+	ret = v4l2_async_nf_try_all_subdevs(subdev_notifier);
+
+	dev_dbg(sd->dev, "async: bound to %s's notifier (ret %d)\n",
+		dev_name(notifier_dev(notifier)), ret);
+
+	return ret;
 }
 
 /* Test all async sub-devices in a notifier for a match. */
-- 
2.30.2

