Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4AC070F525
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 13:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbjEXLZ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 07:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbjEXLZ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 07:25:27 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0260EE42
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 04:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684927519; x=1716463519;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/URpm4WDlsGLk8zP/G7udFuSFquei94ubPDSXiuWRuo=;
  b=MWKp9jEBjW1x2PS4I7x0xv1jNC2r2MBhwOT+75nDIwRlRTNIBcltQrc1
   +bsKQFii9h6VkPY6yvWd8dHrdEvp0gORRQFfucD04nP1WQNa2SiwcZsbg
   PS6w7w+k01YOAUxRYyQCIZMvue8NG7RNJ7e+TNe6EuYw24wLNvjbeZ1Wv
   fv21MwW5OEiRp/vjVLoRDlb4yVI7vzR+76JjavE3fxhBFpiPgibacSvZN
   +XUTxMyuowmYxO7s2JoA48wEA8ZBg5ewMsAbO1LWVDbWrrH2wlZXOrXDc
   DfQhr/EE24PnVqhL1Z42a3LgMehTU17juO3rZjJErxtE97qrOZl3vFW57
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="356758398"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="356758398"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 04:24:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="816540629"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="816540629"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 04:24:33 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 9E062122FF2;
        Wed, 24 May 2023 14:24:21 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q1mb2-008z71-1P; Wed, 24 May 2023 14:24:00 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se
Subject: [PATCH v3 19/32] media: v4l: async: Allow multiple connections between entities
Date:   Wed, 24 May 2023 14:23:36 +0300
Message-Id: <20230524112349.2141396-20-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230524112349.2141396-1-sakari.ailus@linux.intel.com>
References: <20230524112349.2141396-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
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

When the v4l2-async framework was introduced, the use case for it was to
connect a camera sensor with a parallel receiver. Both tended to be rather
simple devices with a single connection between them.

The framework has been since improved in multiple ways but there are
limitations that have remained, for instance the assumption an async
sub-device is connected towards a single notifier and via a single link
only.

This patch enables connecting a sub-device to one or more notifiers
simultaneously, with one or more connections per notifier. The notifier
information is moved from the sub-device to the connection and the
connections in sub-device are no longer a pointer but a linked list.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 149 ++++++++++++++-------------
 include/media/v4l2-async.h           |  17 +--
 include/media/v4l2-subdev.h          |   6 +-
 3 files changed, 90 insertions(+), 82 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index fbc98c194a92a..e6d9109049cc4 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -313,29 +313,43 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_connection *asc)
 {
 	struct v4l2_async_notifier *subdev_notifier;
+	bool registered = false;
 	int ret;
 
-	ret = v4l2_device_register_subdev(v4l2_dev, sd);
-	if (ret < 0)
-		return ret;
+	if (list_empty(&sd->asc_list)) {
+		ret = v4l2_device_register_subdev(v4l2_dev, sd);
+		if (ret < 0)
+			return ret;
+		registered = true;
+	}
 
 	ret = v4l2_async_nf_call_bound(notifier, sd, asc);
-	if (ret < 0)
+	if (ret < 0) {
+		if (asc->match.type == V4L2_ASYNC_MATCH_TYPE_FWNODE)
+			dev_dbg(notifier_dev(notifier),
+				"failed binding %pfw (%d)\n",
+				asc->match.fwnode, ret);
 		goto err_unregister_subdev;
+	}
 
-	/*
-	 * Depending of the function of the entities involved, we may want to
-	 * create links between them (for example between a sensor and its lens
-	 * or between a sensor's source pad and the connected device's sink
-	 * pad).
-	 */
-	ret = v4l2_async_create_ancillary_links(notifier, sd);
-	if (ret)
-		goto err_call_unbind;
-
-	sd->asd = asc;
-	sd->notifier = notifier;
+	if (registered) {
+		/*
+		 * Depending of the function of the entities involved, we may
+		 * want to create links between them (for example between a
+		 * sensor and its lens or between a sensor's source pad and the
+		 * connected device's sink pad).
+		 */
+		ret = v4l2_async_create_ancillary_links(notifier, sd);
+		if (ret) {
+			if (asc->match.type == V4L2_ASYNC_MATCH_TYPE_FWNODE)
+				dev_dbg(notifier_dev(notifier),
+					"failed creating links for %pfw (%d)\n",
+					asc->match.fwnode, ret);
+			goto err_call_unbind;
+		}
+	}
 
+	list_add(&asc->asc_subdev_entry, &sd->asc_list);
 	asc->sd = sd;
 
 	/* Move from the waiting list to notifier's done */
@@ -362,9 +376,11 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 
 err_call_unbind:
 	v4l2_async_nf_call_unbind(notifier, sd, asc);
+	list_del(&asc->asc_subdev_entry);
 
 err_unregister_subdev:
-	v4l2_device_unregister_subdev(sd);
+	if (registered)
+		v4l2_device_unregister_subdev(sd);
 
 	return ret;
 }
@@ -410,15 +426,16 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier)
 	return 0;
 }
 
-static void v4l2_async_cleanup(struct v4l2_subdev *sd)
+static void v4l2_async_unbind_subdev_one(struct v4l2_async_notifier *notifier,
+					 struct v4l2_async_connection *asc)
 {
-	v4l2_device_unregister_subdev(sd);
-	/*
-	 * Subdevice driver will reprobe and put the subdev back
-	 * onto the list
-	 */
-	list_del_init(&sd->async_list);
-	sd->asd = NULL;
+	list_move_tail(&asc->asc_entry, &notifier->waiting_list);
+	if (list_is_singular(&asc->asc_subdev_entry)) {
+		v4l2_async_nf_call_unbind(notifier, asc->sd, asc);
+		v4l2_device_unregister_subdev(asc->sd);
+		asc->sd = NULL;
+	}
+	list_del(&asc->asc_subdev_entry);
 }
 
 /* Unbind all sub-devices in the notifier tree. */
@@ -435,11 +452,7 @@ v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier)
 		if (subdev_notifier)
 			v4l2_async_nf_unbind_all_subdevs(subdev_notifier);
 
-		v4l2_async_nf_call_unbind(notifier, asc->sd, asc);
-		v4l2_async_cleanup(asc->sd);
-		list_move_tail(&asc->asc_entry, &notifier->waiting_list);
-		list_move(&asc->sd->async_list, &subdev_list);
-		asc->sd = NULL;
+		v4l2_async_unbind_subdev_one(notifier, asc);
 	}
 
 	notifier->parent = NULL;
@@ -456,13 +469,9 @@ v4l2_async_nf_has_async_match_entry(struct v4l2_async_notifier *notifier,
 		if (v4l2_async_match_equal(&asc->match, match))
 			return true;
 
-	list_for_each_entry(asc, &notifier->done_list, asc_entry) {
-		if (WARN_ON(!asc->sd->asd))
-			continue;
-
+	list_for_each_entry(asc, &notifier->done_list, asc_entry)
 		if (v4l2_async_match_equal(&asc->match, match))
 			return true;
-	}
 
 	return false;
 }
@@ -642,16 +651,12 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
 	WARN_ON(!list_empty(&notifier->done_list));
 
 	list_for_each_entry_safe(asc, tmp, &notifier->waiting_list, asc_entry) {
-		switch (asc->match.type) {
-		case V4L2_ASYNC_MATCH_TYPE_FWNODE:
-			fwnode_handle_put(asc->match.fwnode);
-			break;
-		default:
-			break;
-		}
-
 		list_del(&asc->asc_entry);
 		v4l2_async_nf_call_destroy(notifier, asc);
+
+		if (asc->match.type == V4L2_ASYNC_MATCH_TYPE_FWNODE)
+			fwnode_handle_put(asc->match.fwnode);
+
 		kfree(asc);
 	}
 }
@@ -666,16 +671,14 @@ void v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
 }
 EXPORT_SYMBOL_GPL(v4l2_async_nf_cleanup);
 
-static int __v4l2_async_nf_add_connection(struct v4l2_async_notifier *notifier,
-					  struct v4l2_async_connection *asc)
+static void __v4l2_async_nf_add_connection(struct v4l2_async_notifier *notifier,
+					   struct v4l2_async_connection *asc)
 {
 	mutex_lock(&list_lock);
 
 	list_add_tail(&asc->asc_entry, &notifier->waiting_list);
 
 	mutex_unlock(&list_lock);
-
-	return 0;
 }
 
 struct v4l2_async_connection *
@@ -684,21 +687,16 @@ __v4l2_async_nf_add_fwnode(struct v4l2_async_notifier *notifier,
 			   unsigned int asc_struct_size)
 {
 	struct v4l2_async_connection *asc;
-	int ret;
 
 	asc = kzalloc(asc_struct_size, GFP_KERNEL);
 	if (!asc)
 		return ERR_PTR(-ENOMEM);
 
+	asc->notifier = notifier;
 	asc->match.type = V4L2_ASYNC_MATCH_TYPE_FWNODE;
 	asc->match.fwnode = fwnode_handle_get(fwnode);
 
-	ret = __v4l2_async_nf_add_connection(notifier, asc);
-	if (ret) {
-		fwnode_handle_put(fwnode);
-		kfree(asc);
-		return ERR_PTR(ret);
-	}
+	__v4l2_async_nf_add_connection(notifier, asc);
 
 	return asc;
 }
@@ -731,21 +729,17 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier, int adapter_id,
 			unsigned short address, unsigned int asc_struct_size)
 {
 	struct v4l2_async_connection *asc;
-	int ret;
 
 	asc = kzalloc(asc_struct_size, GFP_KERNEL);
 	if (!asc)
 		return ERR_PTR(-ENOMEM);
 
+	asc->notifier = notifier;
 	asc->match.type = V4L2_ASYNC_MATCH_TYPE_I2C;
 	asc->match.i2c.adapter_id = adapter_id;
 	asc->match.i2c.address = address;
 
-	ret = __v4l2_async_nf_add_connection(notifier, asc);
-	if (ret) {
-		kfree(asc);
-		return ERR_PTR(ret);
-	}
+	__v4l2_async_nf_add_connection(notifier, asc);
 
 	return asc;
 }
@@ -754,7 +748,11 @@ EXPORT_SYMBOL_GPL(__v4l2_async_nf_add_i2c);
 struct v4l2_async_connection *
 v4l2_async_connection_unique(struct v4l2_subdev *sd)
 {
-	return sd->asd;
+	if (!list_is_singular(&sd->asc_list))
+		return NULL;
+
+	return list_first_entry(&sd->asc_list,
+				struct v4l2_async_connection, asc_subdev_entry);
 }
 EXPORT_SYMBOL_GPL(v4l2_async_connection_unique);
 
@@ -762,8 +760,11 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 {
 	struct v4l2_async_notifier *subdev_notifier;
 	struct v4l2_async_notifier *notifier;
+	struct v4l2_async_connection *asc;
 	int ret;
 
+	INIT_LIST_HEAD(&sd->asc_list);
+
 	/*
 	 * No reference taken. The reference is held by the device (struct
 	 * v4l2_subdev.dev), and async sub-device does not exist independently
@@ -784,7 +785,6 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 	list_for_each_entry(notifier, &notifier_list, notifier_entry) {
 		struct v4l2_device *v4l2_dev =
 			v4l2_async_nf_find_v4l2_dev(notifier);
-		struct v4l2_async_connection *asc;
 
 		if (!v4l2_dev)
 			continue;
@@ -821,11 +821,8 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 	if (subdev_notifier)
 		v4l2_async_nf_unbind_all_subdevs(subdev_notifier);
 
-	if (sd->asd) {
-		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
-		sd->asd->sd = NULL;
-	}
-	v4l2_async_cleanup(sd);
+	if (asc)
+		v4l2_async_unbind_subdev_one(notifier, asc);
 
 	mutex_unlock(&list_lock);
 
@@ -835,6 +832,8 @@ EXPORT_SYMBOL(v4l2_async_register_subdev);
 
 void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
 {
+	struct v4l2_async_connection *asc, *asc_tmp;
+
 	if (!sd->async_list.next)
 		return;
 
@@ -847,15 +846,19 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
 	kfree(sd->subdev_notifier);
 	sd->subdev_notifier = NULL;
 
-	if (sd->asd) {
-		struct v4l2_async_notifier *notifier = sd->notifier;
+	if (sd->asc_list.next) {
+		list_for_each_entry_safe(asc, asc_tmp, &sd->asc_list,
+					 asc_subdev_entry) {
+			list_move(&asc->asc_entry,
+				  &asc->notifier->waiting_list);
 
-		list_move(&sd->asd->asc_entry, &notifier->waiting_list);
-		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
-		sd->asd->sd = NULL;
+			v4l2_async_unbind_subdev_one(asc->notifier, asc);
+			list_del(&asc->asc_subdev_entry);
+		}
 	}
 
-	v4l2_async_cleanup(sd);
+	list_del(&sd->async_list);
+	sd->async_list.next = NULL;
 
 	mutex_unlock(&list_lock);
 }
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 6e0f9a4965aa5..4c311f9b66bab 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -62,27 +62,32 @@ struct v4l2_async_match_desc {
 };
 
 /**
- * struct v4l2_async_connection - connection descriptor, as known to a bridge
+ * struct v4l2_async_connection - sub-device connection descriptor, as known to
+ *				  a bridge
  *
  * @match:	struct of match type and per-bus type matching data sets
+ * @notifier:	the async notifier the connection is related to
  * @asc_entry:	used to add struct v4l2_async_connection objects to the
  *		notifier @waiting_list or @done_list
+ * @asc_subdev_entry:	entry in struct v4l2_async_subdev.asc_list list
  * @sd:		the related sub-device
  *
- * When this struct is used as a member in a driver specific struct,
- * the driver specific struct shall contain the &struct
- * v4l2_async_connection as its first member.
+ * When this struct is used as a member in a driver specific struct, the driver
+ * specific struct shall contain the &struct v4l2_async_connection as its first
+ * member.
  */
 struct v4l2_async_connection {
 	struct v4l2_async_match_desc match;
+	struct v4l2_async_notifier *notifier;
 	struct list_head asc_entry;
+	struct list_head asc_subdev_entry;
 	struct v4l2_subdev *sd;
 };
 
 /**
  * struct v4l2_async_notifier_operations - Asynchronous V4L2 notifier operations
- * @bound:	a subdevice driver has successfully probed one of the subdevices
- * @complete:	All subdevices have been probed successfully. The complete
+ * @bound:	a sub-device has been bound by the given connection
+ * @complete:	All connections have been bound successfully. The complete
  *		callback is only executed for the root notifier.
  * @unbind:	a subdevice is leaving
  * @destroy:	the asc is about to be freed
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 215fc8af87614..cc22c10540286 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1022,9 +1022,10 @@ struct v4l2_subdev_platform_data {
  *	    either dev->of_node->fwnode or dev->fwnode (whichever is non-NULL).
  * @async_list: Links this subdev to a global subdev_entry or @notifier->done
  *	list.
- * @asd: Pointer to respective &struct v4l2_async_connection.
  * @subdev_notifier: A sub-device notifier implicitly registered for the sub-
  *		     device using v4l2_async_register_subdev_sensor().
+ * @asc_list: Async connection list, of &struct
+ *	      v4l2_async_connection.subdev_entry.
  * @pdata: common part of subdevice platform data
  * @state_lock: A pointer to a lock used for all the subdev's states, set by the
  *		driver. This is	optional. If NULL, each state instance will get
@@ -1064,9 +1065,8 @@ struct v4l2_subdev {
 	struct device *dev;
 	struct fwnode_handle *fwnode;
 	struct list_head async_list;
-	struct v4l2_async_connection *asd;
-	struct v4l2_async_notifier *notifier;
 	struct v4l2_async_notifier *subdev_notifier;
+	struct list_head asc_list;
 	struct v4l2_subdev_platform_data *pdata;
 	struct mutex *state_lock;
 
-- 
2.30.2

