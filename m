Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C015E691305
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 23:16:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbjBIWQn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 17:16:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjBIWQm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 17:16:42 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3B1236FFE
        for <linux-media@vger.kernel.org>; Thu,  9 Feb 2023 14:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675981001; x=1707517001;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GSjf2NPzu5MWkIb8/9gk2LPcHwSjoEZKSLu4qvnTF5c=;
  b=O2IpwRobfEefhPRGeCMx/NorLDlYWHEa+ykVXegn9bx9YrlwUZhCq+kQ
   wk+RW+XBdB4U1v9931DUGrVrtGRQ7m9AJNMD7xneIicbITJjRAL87DMXI
   T2pWUaFYzIEZj1DgHAMSV0OsHplgf+DlOOC1PTVvbuK9dQW11Apg3qi6p
   Z69jApP3VAi6LkiMwJ8HgucRYpi9udbpDjLABqVDYD2lHs5KxyagrtIFZ
   D8Oko0+jvqBGvAMxPBCmHPs/3qs9bLZ5DyrlxpsKQjSeyfYKPwtJJWctS
   sWY/z2RUThWCFzKPNTVDGH6D5M5xzwdTXSlHOo8w2CbC7IToVgRlcqpdz
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="357663787"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; 
   d="scan'208";a="357663787"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 14:16:41 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="645418193"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; 
   d="scan'208";a="645418193"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 14:16:38 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id EA03412033D;
        Fri, 10 Feb 2023 00:16:34 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     frieder.schrempf@kontron.de, laurent.pinchart@ideasonboard.com,
        Tim Harvey <tharvey@gateworks.com>,
        linux-arm-kernel@lists.infradead.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Javier Martinez Canillas <javierm@redhat.com>
Subject: [RFC 1/1] v4l: async: Add some debug prints
Date:   Fri, 10 Feb 2023 00:16:34 +0200
Message-Id: <20230209221634.35239-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <049f2fea-1725-74d9-d20d-fc4f7506d504@kontron.de>
References: <049f2fea-1725-74d9-d20d-fc4f7506d504@kontron.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just add some debug prints for V4L2 async sub-device matching process. These
might come useful in figuring out why things don't work as expected.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Frieder,

Can you try this? It prints what is being matched with what. Perhaps this
could be merged in a bit more refined form if it proves useful.

Not tested in any way.

 drivers/media/v4l2-core/v4l2-async.c | 41 ++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 2f1b718a9189..6c13a9488415 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -86,13 +86,18 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
 	bool sd_fwnode_is_ep;
 	struct device *dev;
 
+	dev_dbg(sd->dev, "async fwnode match %pfw vs. %pfw\n", sd_fwnode,
+		asd->match.fwnode);
+
 	/*
 	 * Both the subdev and the async subdev can provide either an endpoint
 	 * fwnode or a device fwnode. Start with the simple case of direct
 	 * fwnode matching.
 	 */
-	if (sd_fwnode == asd->match.fwnode)
+	if (sd_fwnode == asd->match.fwnode) {
+		dev_dbg(sd->dev, "true\n");
 		return true;
+	}
 
 	/*
 	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
@@ -105,8 +110,12 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
 	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd_fwnode);
 	asd_fwnode_is_ep = fwnode_graph_is_endpoint(asd->match.fwnode);
 
-	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
+	dev_dbg(sd->dev, "async fwnode match %pfw vs. %pfw\n", sd_fwnode,
+		asd->match.fwnode);
+	if (sd_fwnode_is_ep == asd_fwnode_is_ep) {
+		dev_dbg(sd->dev, "unmatching node types (false)\n");
 		return false;
+	}
 
 	/*
 	 * The sd and asd fwnodes are of different types. Get the device fwnode
@@ -120,10 +129,15 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
 		other_fwnode = sd_fwnode;
 	}
 
+	dev_dbg(sd->dev, "async fwnode (compat) match %pfw vs. %pfw\n",
+		dev_fwnode, other_fwnode);
+
 	fwnode_handle_put(dev_fwnode);
 
-	if (dev_fwnode != other_fwnode)
+	if (dev_fwnode != other_fwnode) {
+		dev_dbg(sd->dev, "false\n");
 		return false;
+	}
 
 	/*
 	 * We have a heterogeneous match. Retrieve the struct device of the side
@@ -143,6 +157,8 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
 			   dev->driver->name);
 	}
 
+	dev_dbg(sd->dev, "true\n");
+
 	return true;
 }
 
@@ -255,7 +271,10 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
 			v4l2_async_find_subdev_notifier(sd);
 
 		if (subdev_notifier &&
-		    !v4l2_async_nf_can_complete(subdev_notifier))
+		    !v4l2_async_nf_can_complete(subdev_notifier)) {
+			if (subdev_notifier->sd)
+				deb_dbg(subdev_notifier->sd->dev,
+					"cannot complete\n");
 			return false;
 	}
 
@@ -273,18 +292,27 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
 	if (!list_empty(&notifier->waiting))
 		return 0;
 
+	if (notifier->sd)
+		deb_dbg(notifier->sd->dev, "trying to complete\n");
+
 	/* Check the entire notifier tree; find the root notifier first. */
 	while (notifier->parent)
 		notifier = notifier->parent;
 
 	/* This is root if it has v4l2_dev. */
-	if (!notifier->v4l2_dev)
+	if (!notifier->v4l2_dev) {
+		if (notifier->sd)
+			deb_dbg(notifier->sd->dev,
+				"V4L2 device not available\n");
 		return 0;
+	}
 
 	/* Is everything ready? */
 	if (!v4l2_async_nf_can_complete(notifier))
 		return 0;
 
+	deb_dbg(notifier->sd->dev, "complete\n");
+
 	return v4l2_async_nf_call_complete(notifier);
 }
 
@@ -386,6 +414,9 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier)
 			continue;
 
 		ret = v4l2_async_match_notify(notifier, v4l2_dev, sd, asd);
+		deb_dbg(sd->dev, "bound to %s's notifier (ret %d)\n",
+			notifier->sd ? dev_name(notifier->sd->dev) : "no-dev",
+			ret);
 		if (ret < 0)
 			return ret;
 
-- 
2.30.2

