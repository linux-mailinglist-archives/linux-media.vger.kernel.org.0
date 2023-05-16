Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42E6B7049CE
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 11:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbjEPJ4X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 05:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232226AbjEPJ4V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 05:56:21 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A511D35A8
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 02:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684230971; x=1715766971;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NyvkOIbmW/h2GLfjdFiX2AVsnQmuUkjQ9mvL6yniB+I=;
  b=Mq4/3h1xIlgE3BksTt8zre9fp8HUB2aWRhHwGVCzn8aPOOPJGn/Uh5fN
   EhJVnLtVzJxNfMGOCs/bsyOsGRtHuVBIFrvfP8zBjL+1V1AMbd8ueVinn
   lCCvoxmUpUbRzElfqHyFMZqniVglGBWdoJ6h9oL0GmcBIdelHGMIp4Gu4
   7QNOBnp9UcQskcAkNKoaRzqvgWYFjq0Dip56ImgRswm95GpJnFeg0i/gp
   dEPXFh8Eol3xeN/efs1mInSc18hLnFrJc1c59A5O1wCimAsKM3PA+907N
   OWsKsmkgtbY71fmRAm6Y/vogGgavf32gq/eiYhncs5QHBQE2ds8RHkFQC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="354601439"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="354601439"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="731931811"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="731931811"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:43 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 1FE49122EB2;
        Tue, 16 May 2023 12:55:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pyrOy-002ZA8-3w; Tue, 16 May 2023 12:55:28 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Subject: [PATCH v2 11/31] media: v4l: async: Clean up list heads and entries
Date:   Tue, 16 May 2023 12:54:57 +0300
Message-Id: <20230516095517.611711-12-sakari.ailus@linux.intel.com>
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

The naming of list heads and list entries is confusing as they're named
similarly. Use _list for list head and _entry for list entries.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  2 +-
 drivers/media/platform/xilinx/xilinx-vipp.c   |  6 +--
 drivers/media/v4l2-core/v4l2-async.c          | 54 +++++++++----------
 drivers/staging/media/tegra-video/vi.c        |  4 +-
 include/media/v4l2-async.h                    | 36 ++++++-------
 include/media/v4l2-subdev.h                   |  2 +-
 6 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 3c84cb1216320..9231d6a65f4ec 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1420,7 +1420,7 @@ static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
 	unsigned int pad;
 	int ret;
 
-	list_for_each_entry(asd, &cio2->notifier.asd_list, asd_list) {
+	list_for_each_entry(asd, &cio2->notifier.asd_list, asd_entry) {
 		s_asd = to_sensor_asd(asd);
 		q = &cio2->queue[s_asd->csi2.port];
 
diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index b309af0c83749..52c5a7decf284 100644
--- a/drivers/media/platform/xilinx/xilinx-vipp.c
+++ b/drivers/media/platform/xilinx/xilinx-vipp.c
@@ -56,7 +56,7 @@ xvip_graph_find_entity(struct xvip_composite_device *xdev,
 	struct xvip_graph_entity *entity;
 	struct v4l2_async_subdev *asd;
 
-	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_list) {
+	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_entry) {
 		entity = to_xvip_entity(asd);
 		if (entity->asd.match.fwnode == fwnode)
 			return entity;
@@ -291,7 +291,7 @@ static int xvip_graph_notify_complete(struct v4l2_async_notifier *notifier)
 	dev_dbg(xdev->dev, "notify complete, all subdevs registered\n");
 
 	/* Create links for every entity. */
-	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_list) {
+	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_entry) {
 		entity = to_xvip_entity(asd);
 		ret = xvip_graph_build_one(xdev, entity);
 		if (ret < 0)
@@ -393,7 +393,7 @@ static int xvip_graph_parse(struct xvip_composite_device *xdev)
 	if (ret < 0)
 		return 0;
 
-	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_list) {
+	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_entry) {
 		entity = to_xvip_entity(asd);
 		ret = xvip_graph_parse_one(xdev, entity->asd.match.fwnode);
 		if (ret < 0) {
diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 87a34749a8cdc..82016b92102d4 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -213,7 +213,7 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
 		      struct v4l2_async_match_desc *match);
 	struct v4l2_async_subdev *asd;
 
-	list_for_each_entry(asd, &notifier->waiting, list) {
+	list_for_each_entry(asd, &notifier->waiting_list, waiting_entry) {
 		/* bus_type has been verified valid before */
 		switch (asd->match.type) {
 		case V4L2_ASYNC_MATCH_TYPE_I2C:
@@ -262,7 +262,7 @@ v4l2_async_find_subdev_notifier(struct v4l2_subdev *sd)
 {
 	struct v4l2_async_notifier *n;
 
-	list_for_each_entry(n, &notifier_list, list)
+	list_for_each_entry(n, &notifier_list, notifier_entry)
 		if (n->sd == sd)
 			return n;
 
@@ -287,10 +287,10 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
 {
 	struct v4l2_subdev *sd;
 
-	if (!list_empty(&notifier->waiting))
+	if (!list_empty(&notifier->waiting_list))
 		return false;
 
-	list_for_each_entry(sd, &notifier->done, async_list) {
+	list_for_each_entry(sd, &notifier->done_list, async_list) {
 		struct v4l2_async_notifier *subdev_notifier =
 			v4l2_async_find_subdev_notifier(sd);
 
@@ -312,7 +312,7 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
 	struct v4l2_async_notifier *__notifier = notifier;
 
 	/* Quick check whether there are still more sub-devices here. */
-	if (!list_empty(&notifier->waiting))
+	if (!list_empty(&notifier->waiting_list))
 		return 0;
 
 	if (notifier->sd)
@@ -391,13 +391,12 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 		return ret;
 	}
 
-	/* Remove from the waiting list */
-	list_del(&asd->list);
+	list_del(&asd->waiting_entry);
 	sd->asd = asd;
 	sd->notifier = notifier;
 
 	/* Move from the global subdevice list to notifier's done */
-	list_move(&sd->async_list, &notifier->done);
+	list_move(&sd->async_list, &notifier->done_list);
 
 	dev_dbg(notifier_dev(notifier), "v4l2-async: %s bound (ret %d)\n",
 		dev_name(sd->dev), ret);
@@ -478,7 +477,7 @@ v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier,
 {
 	struct v4l2_subdev *sd, *tmp;
 
-	list_for_each_entry_safe(sd, tmp, &notifier->done, async_list) {
+	list_for_each_entry_safe(sd, tmp, &notifier->done_list, async_list) {
 		struct v4l2_async_notifier *subdev_notifier =
 			v4l2_async_find_subdev_notifier(sd);
 
@@ -487,7 +486,8 @@ v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier,
 
 		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
 		if (readd)
-			list_add_tail(&sd->asd->list, &notifier->waiting);
+			list_add_tail(&sd->asd->waiting_entry,
+				      &notifier->waiting_list);
 		v4l2_async_cleanup(sd);
 
 		list_move(&sd->async_list, &subdev_list);
@@ -504,11 +504,11 @@ v4l2_async_nf_has_async_match_entry(struct v4l2_async_notifier *notifier,
 	struct v4l2_async_subdev *asd;
 	struct v4l2_subdev *sd;
 
-	list_for_each_entry(asd, &notifier->waiting, list)
+	list_for_each_entry(asd, &notifier->waiting_list, waiting_entry)
 		if (v4l2_async_match_equal(&asd->match, match))
 			return true;
 
-	list_for_each_entry(sd, &notifier->done, async_list) {
+	list_for_each_entry(sd, &notifier->done_list, async_list) {
 		if (WARN_ON(!sd->asd))
 			continue;
 
@@ -533,7 +533,7 @@ v4l2_async_nf_has_async_match(struct v4l2_async_notifier *notifier,
 	lockdep_assert_held(&list_lock);
 
 	/* Check that an asd is not being added more than once. */
-	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
+	list_for_each_entry(asd, &notifier->asd_list, asd_entry) {
 		if (skip_self && &asd->match == match)
 			break;
 		if (v4l2_async_match_equal(&asd->match, match))
@@ -541,7 +541,7 @@ v4l2_async_nf_has_async_match(struct v4l2_async_notifier *notifier,
 	}
 
 	/* Check that an asd does not exist in other notifiers. */
-	list_for_each_entry(notifier, &notifier_list, list)
+	list_for_each_entry(notifier, &notifier_list, notifier_entry)
 		if (v4l2_async_nf_has_async_match_entry(notifier, match))
 			return true;
 
@@ -583,17 +583,17 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 	struct v4l2_async_subdev *asd;
 	int ret;
 
-	INIT_LIST_HEAD(&notifier->waiting);
-	INIT_LIST_HEAD(&notifier->done);
+	INIT_LIST_HEAD(&notifier->waiting_list);
+	INIT_LIST_HEAD(&notifier->done_list);
 
 	mutex_lock(&list_lock);
 
-	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
+	list_for_each_entry(asd, &notifier->asd_list, asd_entry) {
 		ret = v4l2_async_nf_match_valid(notifier, &asd->match, true);
 		if (ret)
 			goto err_unlock;
 
-		list_add_tail(&asd->list, &notifier->waiting);
+		list_add_tail(&asd->waiting_entry, &notifier->waiting_list);
 	}
 
 	ret = v4l2_async_nf_try_all_subdevs(notifier);
@@ -605,7 +605,7 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 		goto err_unbind;
 
 	/* Keep also completed notifiers on the list */
-	list_add(&notifier->list, &notifier_list);
+	list_add(&notifier->notifier_entry, &notifier_list);
 
 	mutex_unlock(&list_lock);
 
@@ -670,7 +670,7 @@ __v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
 	notifier->sd = NULL;
 	notifier->v4l2_dev = NULL;
 
-	list_del(&notifier->list);
+	list_del(&notifier->notifier_entry);
 }
 
 void v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
@@ -690,7 +690,7 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
 	if (!notifier || !notifier->asd_list.next)
 		return;
 
-	list_for_each_entry_safe(asd, tmp, &notifier->asd_list, asd_list) {
+	list_for_each_entry_safe(asd, tmp, &notifier->asd_list, asd_entry) {
 		switch (asd->match.type) {
 		case V4L2_ASYNC_MATCH_TYPE_FWNODE:
 			fwnode_handle_put(asd->match.fwnode);
@@ -699,7 +699,7 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
 			break;
 		}
 
-		list_del(&asd->asd_list);
+		list_del(&asd->asd_entry);
 		v4l2_async_nf_call_destroy(notifier, asd);
 		kfree(asd);
 	}
@@ -727,7 +727,7 @@ static int __v4l2_async_nf_add_subdev(struct v4l2_async_notifier *notifier,
 	if (ret)
 		goto unlock;
 
-	list_add_tail(&asd->asd_list, &notifier->asd_list);
+	list_add_tail(&asd->asd_entry, &notifier->asd_list);
 
 unlock:
 	mutex_unlock(&list_lock);
@@ -823,7 +823,7 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 
 	mutex_lock(&list_lock);
 
-	list_for_each_entry(notifier, &notifier_list, list) {
+	list_for_each_entry(notifier, &notifier_list, notifier_entry) {
 		struct v4l2_device *v4l2_dev =
 			v4l2_async_nf_find_v4l2_dev(notifier);
 		struct v4l2_async_subdev *asd;
@@ -890,7 +890,7 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
 	if (sd->asd) {
 		struct v4l2_async_notifier *notifier = sd->notifier;
 
-		list_add(&sd->asd->list, &notifier->waiting);
+		list_add(&sd->asd->waiting_entry, &notifier->waiting_list);
 
 		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
 	}
@@ -944,9 +944,9 @@ static int pending_subdevs_show(struct seq_file *s, void *data)
 
 	mutex_lock(&list_lock);
 
-	list_for_each_entry(notif, &notifier_list, list) {
+	list_for_each_entry(notif, &notifier_list, notifier_entry) {
 		seq_printf(s, "%s:\n", v4l2_async_nf_name(notif));
-		list_for_each_entry(asd, &notif->waiting, list)
+		list_for_each_entry(asd, &notif->waiting_list, waiting_entry)
 			print_waiting_match(s, &asd->match);
 	}
 
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 2f1aff7e87170..350871f34f7cc 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1565,7 +1565,7 @@ tegra_vi_graph_find_entity(struct tegra_vi_channel *chan,
 	struct tegra_vi_graph_entity *entity;
 	struct v4l2_async_subdev *asd;
 
-	list_for_each_entry(asd, &chan->notifier.asd_list, asd_list) {
+	list_for_each_entry(asd, &chan->notifier.asd_list, asd_entry) {
 		entity = to_tegra_vi_graph_entity(asd);
 		if (entity->asd.match.fwnode == fwnode)
 			return entity;
@@ -1709,7 +1709,7 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 	}
 
 	/* create links between the entities */
-	list_for_each_entry(asd, &chan->notifier.asd_list, asd_list) {
+	list_for_each_entry(asd, &chan->notifier.asd_list, asd_entry) {
 		entity = to_tegra_vi_graph_entity(asd);
 		ret = tegra_vi_graph_build(chan, entity);
 		if (ret < 0)
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 8d1506a9755c3..54f9f45ed3d8e 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -65,10 +65,10 @@ struct v4l2_async_match_desc {
  * struct v4l2_async_subdev - sub-device descriptor, as known to a bridge
  *
  * @match:	struct of match type and per-bus type matching data sets
- * @asd_list:	used to add struct v4l2_async_subdev objects to the
- *		master notifier @asd_list
- * @list:	used to link struct v4l2_async_subdev objects, waiting to be
- *		probed, to a notifier->waiting list
+ * @asd_entry:	used to add struct v4l2_async_subdev objects to the
+ *		master notifier @asd_entry
+ * @waiting_entry: used to link struct v4l2_async_subdev objects, waiting to be
+ *		probed, to a notifier->waiting_list list
  *
  * When this struct is used as a member in a driver specific struct,
  * the driver specific struct shall contain the &struct
@@ -76,8 +76,8 @@ struct v4l2_async_match_desc {
  */
 struct v4l2_async_subdev {
 	struct v4l2_async_match_desc match;
-	struct list_head list;
-	struct list_head asd_list;
+	struct list_head asd_entry;
+	struct list_head waiting_entry;
 };
 
 /**
@@ -107,9 +107,9 @@ struct v4l2_async_notifier_operations {
  * @sd:		sub-device that registered the notifier, NULL otherwise
  * @parent:	parent notifier
  * @asd_list:	master list of struct v4l2_async_subdev
- * @waiting:	list of struct v4l2_async_subdev, waiting for their drivers
- * @done:	list of struct v4l2_subdev, already probed
- * @list:	member in a global list of notifiers
+ * @waiting_list: list of struct v4l2_async_subdev, waiting for their drivers
+ * @done_list:	list of struct v4l2_subdev, already probed
+ * @notifier_entry: member in a global list of notifiers
  */
 struct v4l2_async_notifier {
 	const struct v4l2_async_notifier_operations *ops;
@@ -117,9 +117,9 @@ struct v4l2_async_notifier {
 	struct v4l2_subdev *sd;
 	struct v4l2_async_notifier *parent;
 	struct list_head asd_list;
-	struct list_head waiting;
-	struct list_head done;
-	struct list_head list;
+	struct list_head waiting_list;
+	struct list_head done_list;
+	struct list_head notifier_entry;
 };
 
 /**
@@ -134,7 +134,7 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
  *
  * @notifier: pointer to &struct v4l2_async_notifier
  *
- * This function initializes the notifier @asd_list. It must be called
+ * This function initializes the notifier @asd_entry. It must be called
  * before adding a subdevice to a notifier, using one of:
  * v4l2_async_nf_add_fwnode_remote(), v4l2_async_nf_add_fwnode() or
  * v4l2_async_nf_add_i2c().
@@ -147,7 +147,7 @@ __v4l2_async_nf_add_fwnode(struct v4l2_async_notifier *notifier,
 			   unsigned int asd_struct_size);
 /**
  * v4l2_async_nf_add_fwnode - Allocate and add a fwnode async
- *				subdev to the notifier's master asd_list.
+ *				subdev to the notifier's master asd_entry.
  *
  * @notifier: pointer to &struct v4l2_async_notifier
  * @fwnode: fwnode handle of the sub-device to be matched, pointer to
@@ -157,7 +157,7 @@ __v4l2_async_nf_add_fwnode(struct v4l2_async_notifier *notifier,
  *	  sub-device struct, i.e. both begin at the same memory address.
  *
  * Allocate a fwnode-matched asd of size asd_struct_size, and add it to the
- * notifiers @asd_list. The function also gets a reference of the fwnode which
+ * notifiers @asd_entry. The function also gets a reference of the fwnode which
  * is released later at notifier cleanup time.
  */
 #define v4l2_async_nf_add_fwnode(notifier, fwnode, type)		\
@@ -170,7 +170,7 @@ __v4l2_async_nf_add_fwnode_remote(struct v4l2_async_notifier *notif,
 /**
  * v4l2_async_nf_add_fwnode_remote - Allocate and add a fwnode
  *						  remote async subdev to the
- *						  notifier's master asd_list.
+ *						  notifier's master asd_entry.
  *
  * @notifier: pointer to &struct v4l2_async_notifier
  * @ep: local endpoint pointing to the remote sub-device to be matched,
@@ -180,7 +180,7 @@ __v4l2_async_nf_add_fwnode_remote(struct v4l2_async_notifier *notif,
  *	  sub-device struct, i.e. both begin at the same memory address.
  *
  * Gets the remote endpoint of a given local endpoint, set it up for fwnode
- * matching and adds the async sub-device to the notifier's @asd_list. The
+ * matching and adds the async sub-device to the notifier's @asd_entry. The
  * function also gets a reference of the fwnode which is released later at
  * notifier cleanup time.
  *
@@ -196,7 +196,7 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier,
 			unsigned int asd_struct_size);
 /**
  * v4l2_async_nf_add_i2c - Allocate and add an i2c async
- *				subdev to the notifier's master asd_list.
+ *				subdev to the notifier's master asd_entry.
  *
  * @notifier: pointer to &struct v4l2_async_notifier
  * @adapter: I2C adapter ID to be matched
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index cfd19e72d0fc4..82e4cf3dd2e05 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1020,7 +1020,7 @@ struct v4l2_subdev_platform_data {
  * @dev: pointer to the physical device, if any
  * @fwnode: The fwnode_handle of the subdev, usually the same as
  *	    either dev->of_node->fwnode or dev->fwnode (whichever is non-NULL).
- * @async_list: Links this subdev to a global subdev_list or @notifier->done
+ * @async_list: Links this subdev to a global subdev_entry or @notifier->done
  *	list.
  * @asd: Pointer to respective &struct v4l2_async_subdev.
  * @notifier: Pointer to the managing notifier.
-- 
2.30.2

