Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1262C6AF78D
	for <lists+linux-media@lfdr.de>; Tue,  7 Mar 2023 22:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbjCGV2W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Mar 2023 16:28:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbjCGV2T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Mar 2023 16:28:19 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81DE98090B
        for <linux-media@vger.kernel.org>; Tue,  7 Mar 2023 13:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678224494; x=1709760494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SM3nJz1wZDi/0iMnrVjntx1+0ImkmNYi+9UZU5an+Vk=;
  b=H8iFwGsiOyFhGhiYaFWp9/7hxKuDN7Ms5VhyfQPN3U3/QzMW0g298qri
   NmjJoLCVLC7A9YwAqulKLnRGgKid5dH5aIImHQYM/qyfgGubdvJVsw1sX
   UlwinOxTciLqKn0Vn4N8t6bGb1+mrBT9mQMV6hU/tGA1zaOhRZrRIIpTp
   3mflZBCuwI7MSho5JghfoiyPW8r1cABSCHYx+rU+lCYq+wxVcYPcfuyoz
   f1L0EgJOjRM3cZvwmv/jdoyYv/qS2u4ko7G56a4/krBVCOOWXyPSAIuVL
   4QV554aXEwcSCm3qoz80ohkazwe4XUCVIt2+3ObVyG6f6d2n6RMUjfYLU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="398557071"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="398557071"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 13:28:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="676710119"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="676710119"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 13:28:10 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id D3B82122DA5;
        Tue,  7 Mar 2023 23:20:45 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com
Subject: [RFC 07/10] media: v4l: async: Clean up list heads and entries
Date:   Tue,  7 Mar 2023 23:20:35 +0200
Message-Id: <20230307212038.968381-8-sakari.ailus@linux.intel.com>
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

The naming of list heads and list entries is confusing as they're named
similarly. Use _head for list head and _list for list entries.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  2 +-
 .../platform/renesas/rcar-vin/rcar-core.c     |  2 +-
 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  2 +-
 drivers/media/platform/xilinx/xilinx-vipp.c   | 10 +--
 drivers/media/v4l2-core/v4l2-async.c          | 66 +++++++++----------
 .../staging/media/imx/imx-media-dev-common.c  |  2 +-
 drivers/staging/media/tegra-video/vi.c        |  6 +-
 include/media/v4l2-async.h                    | 21 +++---
 8 files changed, 56 insertions(+), 55 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 3b76a9d0383a..8b37c2ec8643 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1419,7 +1419,7 @@ static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
 	unsigned int pad;
 	int ret;
 
-	list_for_each_entry(asd, &cio2->notifier.asd_list, asd_list) {
+	list_for_each_entry(asd, &cio2->notifier.asd_head, asd_list) {
 		s_asd = to_sensor_asd(asd);
 		q = &cio2->queue[s_asd->csi2.port];
 
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 5e53d6b7036c..1b530da1c341 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -397,7 +397,7 @@ static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
 		}
 	}
 
-	if (list_empty(&vin->group->notifier.asd_list))
+	if (list_empty(&vin->group->notifier.asd_head))
 		return 0;
 
 	vin->group->notifier.ops = &rvin_group_notify_ops;
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 5939f5165a5e..bfef297f5ec5 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -191,7 +191,7 @@ static int rzg2l_cru_mc_parse_of_graph(struct rzg2l_cru_dev *cru)
 
 	cru->notifier.ops = &rzg2l_cru_async_ops;
 
-	if (list_empty(&cru->notifier.asd_list))
+	if (list_empty(&cru->notifier.asd_head))
 		return 0;
 
 	ret = v4l2_async_nf_register(&cru->v4l2_dev, &cru->notifier);
diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index 0a16c218a50a..80157b7a28ee 100644
--- a/drivers/media/platform/xilinx/xilinx-vipp.c
+++ b/drivers/media/platform/xilinx/xilinx-vipp.c
@@ -56,7 +56,7 @@ xvip_graph_find_entity(struct xvip_composite_device *xdev,
 	struct xvip_graph_entity *entity;
 	struct v4l2_async_subdev *asd;
 
-	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_list) {
+	list_for_each_entry(asd, &xdev->notifier.asd_head, asd_list) {
 		entity = to_xvip_entity(asd);
 		if (entity->asd.match.fwnode == fwnode)
 			return entity;
@@ -291,7 +291,7 @@ static int xvip_graph_notify_complete(struct v4l2_async_notifier *notifier)
 	dev_dbg(xdev->dev, "notify complete, all subdevs registered\n");
 
 	/* Create links for every entity. */
-	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_list) {
+	list_for_each_entry(asd, &xdev->notifier.asd_head, asd_list) {
 		entity = to_xvip_entity(asd);
 		ret = xvip_graph_build_one(xdev, entity);
 		if (ret < 0)
@@ -322,7 +322,7 @@ static int xvip_graph_notify_bound(struct v4l2_async_notifier *notifier,
 	/* Locate the entity corresponding to the bound subdev and store the
 	 * subdev pointer.
 	 */
-	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_list) {
+	list_for_each_entry(asd, &xdev->notifier.asd_head, asd_list) {
 		entity = to_xvip_entity(asd);
 
 		if (entity->asd.match.fwnode != subdev->fwnode)
@@ -415,7 +415,7 @@ static int xvip_graph_parse(struct xvip_composite_device *xdev)
 	if (ret < 0)
 		return 0;
 
-	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_list) {
+	list_for_each_entry(asd, &xdev->notifier.asd_head, asd_list) {
 		entity = to_xvip_entity(asd);
 		ret = xvip_graph_parse_one(xdev, entity->asd.match.fwnode);
 		if (ret < 0) {
@@ -523,7 +523,7 @@ static int xvip_graph_init(struct xvip_composite_device *xdev)
 		goto done;
 	}
 
-	if (list_empty(&xdev->notifier.asd_list)) {
+	if (list_empty(&xdev->notifier.asd_head)) {
 		dev_err(xdev->dev, "no subdev found in graph\n");
 		ret = -ENOENT;
 		goto done;
diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index aaf3c8196341..8e54295855db 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -133,8 +133,8 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
 	return match_fwnode_one(notifier, sd, sd->fwnode->secondary, match);
 }
 
-static LIST_HEAD(subdev_list);
-static LIST_HEAD(notifier_list);
+static LIST_HEAD(subdev_head);
+static LIST_HEAD(notifier_head);
 static DEFINE_MUTEX(list_lock);
 
 static struct v4l2_async_subdev *
@@ -145,7 +145,7 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
 		      struct v4l2_subdev *sd, struct v4l2_async_match *match);
 	struct v4l2_async_subdev *asd;
 
-	list_for_each_entry(asd, &notifier->waiting, list) {
+	list_for_each_entry(asd, &notifier->waiting_head, waiting_list) {
 		/* bus_type has been verified valid before */
 		switch (asd->match.type) {
 		case V4L2_ASYNC_MATCH_I2C:
@@ -194,7 +194,7 @@ v4l2_async_find_subdev_notifier(struct v4l2_subdev *sd)
 {
 	struct v4l2_async_notifier *n;
 
-	list_for_each_entry(n, &notifier_list, list)
+	list_for_each_entry(n, &notifier_head, notifier_list)
 		if (n->sd == sd)
 			return n;
 
@@ -219,12 +219,12 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
 {
 	struct v4l2_subdev *sd;
 
-	if (!list_empty(&notifier->waiting)) {
+	if (!list_empty(&notifier->waiting_head)) {
 		dev_dbg(notifier_dev(notifier), "async: waiting for subdevs\n");
 		return false;
 	}
 
-	list_for_each_entry(sd, &notifier->done, async_list) {
+	list_for_each_entry(sd, &notifier->done_head, async_list) {
 		struct v4l2_async_notifier *subdev_notifier =
 			v4l2_async_find_subdev_notifier(sd);
 
@@ -249,7 +249,7 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
 	struct v4l2_async_notifier *__notifier = notifier;
 
 	/* Quick check whether there are still more sub-devices here. */
-	if (!list_empty(&notifier->waiting))
+	if (!list_empty(&notifier->waiting_head))
 		return 0;
 
 	if (notifier->sd)
@@ -327,13 +327,12 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 		return ret;
 	}
 
-	/* Remove from the waiting list */
-	list_del(&asd->list);
+	list_del(&asd->waiting_list);
 	sd->asd = asd;
 	sd->notifier = notifier;
 
 	/* Move from the global subdevice list to notifier's done */
-	list_move(&sd->async_list, &notifier->done);
+	list_move(&sd->async_list, &notifier->done_head);
 
 	/*
 	 * See if the sub-device has a notifier. If not, return here.
@@ -369,7 +368,7 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier)
 		return 0;
 
 again:
-	list_for_each_entry(sd, &subdev_list, async_list) {
+	list_for_each_entry(sd, &subdev_head, async_list) {
 		struct v4l2_async_subdev *asd;
 		int ret;
 
@@ -411,7 +410,7 @@ v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier,
 {
 	struct v4l2_subdev *sd, *tmp;
 
-	list_for_each_entry_safe(sd, tmp, &notifier->done, async_list) {
+	list_for_each_entry_safe(sd, tmp, &notifier->done_head, async_list) {
 		struct v4l2_async_notifier *subdev_notifier =
 			v4l2_async_find_subdev_notifier(sd);
 
@@ -420,10 +419,11 @@ v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier,
 
 		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
 		if (readd)
-			list_add_tail(&sd->asd->list, &notifier->waiting);
+			list_add_tail(&sd->asd->waiting_list,
+				      &notifier->waiting_head);
 		v4l2_async_cleanup(sd);
 
-		list_move(&sd->async_list, &subdev_list);
+		list_move(&sd->async_list, &subdev_head);
 	}
 
 	notifier->parent = NULL;
@@ -437,11 +437,11 @@ __v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
 	struct v4l2_async_subdev *asd;
 	struct v4l2_subdev *sd;
 
-	list_for_each_entry(asd, &notifier->waiting, list)
+	list_for_each_entry(asd, &notifier->waiting_head, waiting_list)
 		if (asd_equal(&asd->match, match))
 			return true;
 
-	list_for_each_entry(sd, &notifier->done, async_list) {
+	list_for_each_entry(sd, &notifier->done_head, async_list) {
 		if (WARN_ON(!sd->asd))
 			continue;
 
@@ -465,7 +465,7 @@ v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
 	lockdep_assert_held(&list_lock);
 
 	/* Check that an asd is not being added more than once. */
-	list_for_each_entry(asd, &notifier->asd_list, asd_list)
+	list_for_each_entry(asd, &notifier->asd_head, asd_list)
 		if (&asd->match == match)
 			break;
 		if (asd_equal(&asd->match, match))
@@ -473,7 +473,7 @@ v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
 	}
 
 	/* Check that an asd does not exist in other notifiers. */
-	list_for_each_entry(notifier, &notifier_list, list)
+	list_for_each_entry(notifier, &notifier_head, notifier_list)
 		if (__v4l2_async_nf_has_async_subdev(notifier, match))
 			return true;
 
@@ -509,7 +509,7 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
 
 void v4l2_async_nf_init(struct v4l2_async_notifier *notifier)
 {
-	INIT_LIST_HEAD(&notifier->asd_list);
+	INIT_LIST_HEAD(&notifier->asd_head);
 }
 EXPORT_SYMBOL(v4l2_async_nf_init);
 
@@ -518,17 +518,17 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 	struct v4l2_async_subdev *asd;
 	int ret;
 
-	INIT_LIST_HEAD(&notifier->waiting);
-	INIT_LIST_HEAD(&notifier->done);
+	INIT_LIST_HEAD(&notifier->waiting_head);
+	INIT_LIST_HEAD(&notifier->done_head);
 
 	mutex_lock(&list_lock);
 
-	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
+	list_for_each_entry(asd, &notifier->asd_head, asd_list) {
 		ret = v4l2_async_nf_asd_valid(notifier, &asd->match, true);
 		if (ret)
 			goto err_unlock;
 
-		list_add_tail(&asd->list, &notifier->waiting);
+		list_add_tail(&asd->waiting_list, &notifier->waiting_head);
 	}
 
 	ret = v4l2_async_nf_try_all_subdevs(notifier);
@@ -540,7 +540,7 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 		goto err_unbind;
 
 	/* Keep also completed notifiers on the list */
-	list_add(&notifier->list, &notifier_list);
+	list_add(&notifier->notifier_list, &notifier_head);
 
 	mutex_unlock(&list_lock);
 
@@ -605,7 +605,7 @@ __v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
 	notifier->sd = NULL;
 	notifier->v4l2_dev = NULL;
 
-	list_del(&notifier->list);
+	list_del(&notifier->notifier_list);
 }
 
 void v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
@@ -622,10 +622,10 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
 {
 	struct v4l2_async_subdev *asd, *tmp;
 
-	if (!notifier || !notifier->asd_list.next)
+	if (!notifier || !notifier->asd_head.next)
 		return;
 
-	list_for_each_entry_safe(asd, tmp, &notifier->asd_list, asd_list) {
+	list_for_each_entry_safe(asd, tmp, &notifier->asd_head, asd_list) {
 		switch (asd->match.type) {
 		case V4L2_ASYNC_MATCH_FWNODE:
 			fwnode_handle_put(asd->match.fwnode);
@@ -661,7 +661,7 @@ int __v4l2_async_nf_add_subdev(struct v4l2_async_notifier *notifier,
 	if (ret)
 		goto unlock;
 
-	list_add_tail(&asd->asd_list, &notifier->asd_list);
+	list_add_tail(&asd->asd_list, &notifier->asd_head);
 
 unlock:
 	mutex_unlock(&list_lock);
@@ -767,7 +767,7 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 
 	INIT_LIST_HEAD(&sd->async_list);
 
-	list_for_each_entry(notifier, &notifier_list, list) {
+	list_for_each_entry(notifier, &notifier_head, notifier_list) {
 		struct v4l2_device *v4l2_dev =
 			v4l2_async_nf_find_v4l2_dev(notifier);
 		struct v4l2_async_subdev *asd;
@@ -791,7 +791,7 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 	}
 
 	/* None matched, wait for hot-plugging */
-	list_add(&sd->async_list, &subdev_list);
+	list_add(&sd->async_list, &subdev_head);
 
 out_unlock:
 	mutex_unlock(&list_lock);
@@ -832,7 +832,7 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
 	if (sd->asd) {
 		struct v4l2_async_notifier *notifier = sd->notifier;
 
-		list_add(&sd->asd->list, &notifier->waiting);
+		list_add(&sd->asd->waiting_list, &notifier->waiting_head);
 
 		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
 	}
@@ -886,9 +886,9 @@ static int pending_subdevs_show(struct seq_file *s, void *data)
 
 	mutex_lock(&list_lock);
 
-	list_for_each_entry(notif, &notifier_list, list) {
+	list_for_each_entry(notif, &notifier_head, notifier_list) {
 		seq_printf(s, "%s:\n", v4l2_async_nf_name(notif));
-		list_for_each_entry(asd, &notif->waiting, list)
+		list_for_each_entry(asd, &notif->waiting_head, waiting_list)
 			print_waiting_subdev(s, &asd->match);
 	}
 
diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
index e6d6ed3b1161..eaa54848df6a 100644
--- a/drivers/staging/media/imx/imx-media-dev-common.c
+++ b/drivers/staging/media/imx/imx-media-dev-common.c
@@ -398,7 +398,7 @@ int imx_media_dev_notifier_register(struct imx_media_dev *imxmd,
 	int ret;
 
 	/* no subdevs? just bail */
-	if (list_empty(&imxmd->notifier.asd_list)) {
+	if (list_empty(&imxmd->notifier.asd_head)) {
 		v4l2_err(&imxmd->v4l2_dev, "no subdevs\n");
 		return -ENODEV;
 	}
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 11dd142c98c5..4818646fe637 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1563,7 +1563,7 @@ tegra_vi_graph_find_entity(struct tegra_vi_channel *chan,
 	struct tegra_vi_graph_entity *entity;
 	struct v4l2_async_subdev *asd;
 
-	list_for_each_entry(asd, &chan->notifier.asd_list, asd_list) {
+	list_for_each_entry(asd, &chan->notifier.asd_head, asd_list) {
 		entity = to_tegra_vi_graph_entity(asd);
 		if (entity->asd.match.fwnode == fwnode)
 			return entity;
@@ -1707,7 +1707,7 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 	}
 
 	/* create links between the entities */
-	list_for_each_entry(asd, &chan->notifier.asd_list, asd_list) {
+	list_for_each_entry(asd, &chan->notifier.asd_head, asd_list) {
 		entity = to_tegra_vi_graph_entity(asd);
 		ret = tegra_vi_graph_build(chan, entity);
 		if (ret < 0)
@@ -1874,7 +1874,7 @@ static int tegra_vi_graph_init(struct tegra_vi *vi)
 
 		ret = tegra_vi_graph_parse_one(chan, remote);
 		fwnode_handle_put(remote);
-		if (ret < 0 || list_empty(&chan->notifier.asd_list))
+		if (ret < 0 || list_empty(&chan->notifier.asd_head))
 			continue;
 
 		chan->notifier.ops = &tegra_vi_async_ops;
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 0c4cffd081c9..425280b4d387 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -68,7 +68,7 @@ struct v4l2_async_match {
  * @match:	struct of match type and per-bus type matching data sets
  * @asd_list:	used to add struct v4l2_async_subdev objects to the
  *		master notifier @asd_list
- * @list:	used to link struct v4l2_async_subdev objects, waiting to be
+ * @waiting_list: used to link struct v4l2_async_subdev objects, waiting to be
  *		probed, to a notifier->waiting list
  *
  * When this struct is used as a member in a driver specific struct,
@@ -77,9 +77,10 @@ struct v4l2_async_match {
  */
 struct v4l2_async_subdev {
 	struct v4l2_async_match match;
+
 	/* v4l2-async core private: not to be used by drivers */
-	struct list_head list;
 	struct list_head asd_list;
+	struct list_head waiting_list;
 };
 
 /**
@@ -108,20 +109,20 @@ struct v4l2_async_notifier_operations {
  * @v4l2_dev:	v4l2_device of the root notifier, NULL otherwise
  * @sd:		sub-device that registered the notifier, NULL otherwise
  * @parent:	parent notifier
- * @asd_list:	master list of struct v4l2_async_subdev
- * @waiting:	list of struct v4l2_async_subdev, waiting for their drivers
- * @done:	list of struct v4l2_subdev, already probed
- * @list:	member in a global list of notifiers
+ * @asd_head:	master list of struct v4l2_async_subdev
+ * @waiting_list: list of struct v4l2_async_subdev, waiting for their drivers
+ * @done_head:	list of struct v4l2_subdev, already probed
+ * @notifier_list: member in a global list of notifiers
  */
 struct v4l2_async_notifier {
 	const struct v4l2_async_notifier_operations *ops;
 	struct v4l2_device *v4l2_dev;
 	struct v4l2_subdev *sd;
 	struct v4l2_async_notifier *parent;
-	struct list_head asd_list;
-	struct list_head waiting;
-	struct list_head done;
-	struct list_head list;
+	struct list_head asd_head;
+	struct list_head waiting_head;
+	struct list_head done_head;
+	struct list_head notifier_list;
 };
 
 /**
-- 
2.30.2

