Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83AB5739FDC
	for <lists+linux-media@lfdr.de>; Thu, 22 Jun 2023 13:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbjFVLl5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jun 2023 07:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbjFVLlz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jun 2023 07:41:55 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F1D210C
        for <linux-media@vger.kernel.org>; Thu, 22 Jun 2023 04:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687434098; x=1718970098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tEc9ZKecOZjG1sU1hBo0ihlsiv5JjLpdndtpZ7VqRFc=;
  b=S3oBGCNg1gFlfZ84O2Tmo0Za+PzbjInvFbVZYv6Ait6h2tFXwSY4nube
   D/LLxENHOlDrvcHwjIa1glucI4tpC/vkAb4nXyzQYx7Umbr/vD6HbxvL4
   doFm3FCpDU0QN2z45MYCoJnWhqV6NF36OX/Hp47EDZOxZLQdva4ghIhTY
   zLy8n4xaiIciyuECUfXepdFALXIjUd9XoiZeVS1CUUzHbrtVQ3AU5stFh
   Zq4jotOpASgJABkurvSwsbh+UqInyijzNXPn/wJYZuL0uk9RgJ4481PVe
   wYxpyJ6r6c8sU1Oknk7o1nIq/KBwrc6qNpbuYx/K8uuiVjWUWg5JQ5gH/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="340800490"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="340800490"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="839013560"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="839013560"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:12 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 12789120DDD;
        Thu, 22 Jun 2023 14:40:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qCIg2-003oTE-3B;
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
Subject: [PATCH v4 17/38] media: v4l: async: Clean up list heads and entries
Date:   Thu, 22 Jun 2023 14:40:07 +0300
Message-Id: <20230622114028.908825-18-sakari.ailus@linux.intel.com>
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

The naming of list heads and list entries is confusing as they're named
similarly. Use _list for list head and _entry for list entries.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested_by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  2 +-
 drivers/media/platform/xilinx/xilinx-vipp.c   |  6 +--
 drivers/media/v4l2-core/v4l2-async.c          | 54 +++++++++----------
 drivers/staging/media/tegra-video/vi.c        |  4 +-
 include/media/v4l2-async.h                    | 22 ++++----
 include/media/v4l2-subdev.h                   |  4 +-
 6 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 34984a7474ed8..78248cb343ceb 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1420,7 +1420,7 @@ static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
 	struct cio2_queue *q;
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
index 465eb072e7c59..04ea6f9a8ed3a 100644
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
 
@@ -535,7 +535,7 @@ v4l2_async_nf_has_async_match(struct v4l2_async_notifier *notifier,
 	lockdep_assert_held(&list_lock);
 
 	/* Check that an asd is not being added more than once. */
-	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
+	list_for_each_entry(asd, &notifier->asd_list, asd_entry) {
 		if (skip_self && &asd->match == match)
 			continue;
 		if (v4l2_async_match_equal(&asd->match, match))
@@ -543,7 +543,7 @@ v4l2_async_nf_has_async_match(struct v4l2_async_notifier *notifier,
 	}
 
 	/* Check that an asd does not exist in other notifiers. */
-	list_for_each_entry(notifier, &notifier_list, list)
+	list_for_each_entry(notifier, &notifier_list, notifier_entry)
 		if (v4l2_async_nf_has_async_match_entry(notifier, match))
 			return true;
 
@@ -585,17 +585,17 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
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
@@ -607,7 +607,7 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 		goto err_unbind;
 
 	/* Keep also completed notifiers on the list */
-	list_add(&notifier->list, &notifier_list);
+	list_add(&notifier->notifier_entry, &notifier_list);
 
 	mutex_unlock(&list_lock);
 
@@ -672,7 +672,7 @@ __v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
 	notifier->sd = NULL;
 	notifier->v4l2_dev = NULL;
 
-	list_del(&notifier->list);
+	list_del(&notifier->notifier_entry);
 }
 
 void v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
@@ -692,7 +692,7 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
 	if (!notifier || !notifier->asd_list.next)
 		return;
 
-	list_for_each_entry_safe(asd, tmp, &notifier->asd_list, asd_list) {
+	list_for_each_entry_safe(asd, tmp, &notifier->asd_list, asd_entry) {
 		switch (asd->match.type) {
 		case V4L2_ASYNC_MATCH_TYPE_FWNODE:
 			fwnode_handle_put(asd->match.fwnode);
@@ -701,7 +701,7 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
 			break;
 		}
 
-		list_del(&asd->asd_list);
+		list_del(&asd->asd_entry);
 		v4l2_async_nf_call_destroy(notifier, asd);
 		kfree(asd);
 	}
@@ -729,7 +729,7 @@ static int __v4l2_async_nf_add_subdev(struct v4l2_async_notifier *notifier,
 	if (ret)
 		goto unlock;
 
-	list_add_tail(&asd->asd_list, &notifier->asd_list);
+	list_add_tail(&asd->asd_entry, &notifier->asd_list);
 
 unlock:
 	mutex_unlock(&list_lock);
@@ -827,7 +827,7 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 
 	INIT_LIST_HEAD(&sd->async_list);
 
-	list_for_each_entry(notifier, &notifier_list, list) {
+	list_for_each_entry(notifier, &notifier_list, notifier_entry) {
 		struct v4l2_device *v4l2_dev =
 			v4l2_async_nf_find_v4l2_dev(notifier);
 		struct v4l2_async_subdev *asd;
@@ -894,7 +894,7 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
 	if (sd->asd) {
 		struct v4l2_async_notifier *notifier = sd->notifier;
 
-		list_add(&sd->asd->list, &notifier->waiting);
+		list_add(&sd->asd->waiting_entry, &notifier->waiting_list);
 
 		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
 	}
@@ -948,9 +948,9 @@ static int pending_subdevs_show(struct seq_file *s, void *data)
 
 	mutex_lock(&list_lock);
 
-	list_for_each_entry(notif, &notifier_list, list) {
+	list_for_each_entry(notif, &notifier_list, notifier_entry) {
 		seq_printf(s, "%s:\n", v4l2_async_nf_name(notif));
-		list_for_each_entry(asd, &notif->waiting, list)
+		list_for_each_entry(asd, &notif->waiting_list, waiting_entry)
 			print_waiting_match(s, &asd->match);
 	}
 
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 79284c3b6caed..9c5b6cfdc8e90 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1464,7 +1464,7 @@ tegra_vi_graph_find_entity(struct tegra_vi_channel *chan,
 	struct tegra_vi_graph_entity *entity;
 	struct v4l2_async_subdev *asd;
 
-	list_for_each_entry(asd, &chan->notifier.asd_list, asd_list) {
+	list_for_each_entry(asd, &chan->notifier.asd_list, asd_entry) {
 		entity = to_tegra_vi_graph_entity(asd);
 		if (entity->asd.match.fwnode == fwnode)
 			return entity;
@@ -1608,7 +1608,7 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 	}
 
 	/* create links between the entities */
-	list_for_each_entry(asd, &chan->notifier.asd_list, asd_list) {
+	list_for_each_entry(asd, &chan->notifier.asd_list, asd_entry) {
 		entity = to_tegra_vi_graph_entity(asd);
 		ret = tegra_vi_graph_build(chan, entity);
 		if (ret < 0)
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 8d1506a9755c3..03ac6520f3d27 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -65,10 +65,10 @@ struct v4l2_async_match_desc {
  * struct v4l2_async_subdev - sub-device descriptor, as known to a bridge
  *
  * @match:	struct of match type and per-bus type matching data sets
- * @asd_list:	used to add struct v4l2_async_subdev objects to the
+ * @asd_entry:	used to add struct v4l2_async_subdev objects to the
  *		master notifier @asd_list
- * @list:	used to link struct v4l2_async_subdev objects, waiting to be
- *		probed, to a notifier->waiting list
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
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index b325df0d54d61..b58c7a325e99e 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1020,8 +1020,8 @@ struct v4l2_subdev_platform_data {
  * @dev: pointer to the physical device, if any
  * @fwnode: The fwnode_handle of the subdev, usually the same as
  *	    either dev->of_node->fwnode or dev->fwnode (whichever is non-NULL).
- * @async_list: Links this subdev to a global subdev_list or @notifier->done
- *	list.
+ * @async_list: Links this subdev to a global subdev_list or
+ *		@notifier->done_list list.
  * @asd: Pointer to respective &struct v4l2_async_subdev.
  * @notifier: Pointer to the managing notifier.
  * @subdev_notifier: A sub-device notifier implicitly registered for the sub-
-- 
2.39.2

