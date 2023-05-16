Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E35F37049DF
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 11:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232259AbjEPJ5A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 05:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232263AbjEPJ4e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 05:56:34 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 608D635A8
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 02:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684230991; x=1715766991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9um+Tw1RxJSospdvQsI5SK3k7MFLaVbfNWiy581g308=;
  b=mctLFbKBaHO7GOC/h7DnUGh2iR9pda7VdaF8aRK28nmiznPqdYUYOonk
   kETPK2AkZeHwYvALReb6lxDTcLwV9ZlKw/UHEcEF3RTXq7fYd3B31NARk
   pITewrlqXXrrkkGlTtIC8uLiu/QY3Lxxkyxi0Ajz2lmFRHDUfSaao6oSx
   zg2Tf/OBXXz227PTDe9SfMLuiMu+wexRt/Vwebe7QlxiOmZyUD0wpHxmj
   z5P0ZuNuLoVbWtNNue2Ld5NXPPPmVgW7YDBSZLVN0BFNmFBMsgA7Q8o5h
   6uELrZbAMEk43BQ1WBtKWjerwolNz3RRXyMJPV3PkNLlrKdYxDFjbdrxW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="354601595"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="354601595"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="731931880"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="731931880"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:48 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 4FCBC122F00;
        Tue, 16 May 2023 12:55:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pyrOy-002ZAb-AY; Tue, 16 May 2023 12:55:28 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Subject: [PATCH v2 18/31] media: v4l: async: Differentiate connecting and creating sub-devices
Date:   Tue, 16 May 2023 12:55:04 +0300
Message-Id: <20230516095517.611711-19-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
References: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When the v4l2-async framework was introduced, the use case for it was to
connect a camera sensor with a parallel receiver. Both tended to be rather
simple devices with a single connection between them.

The framework has been since improved in multiple ways but there are
limitations that have remained, for instance the assumption an async
sub-device is connected towards a single notifier and via a single link
only.

This patch adds an object that represents the device while an earlier
patch in the series re-purposed the old struct v4l2_async_subdev as the
connection. In other words, multiple connections (via graph endpoints) may
now exist for a given async sub-device.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 245 +++++++++++++++++++++------
 include/media/v4l2-async.h           |  39 ++++-
 include/media/v4l2-subdev.h          |   2 +-
 3 files changed, 226 insertions(+), 60 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index c70d87931ebb6..c24a709d45caa 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -148,6 +148,7 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
 }
 
 static LIST_HEAD(subdev_list);
+static LIST_HEAD(asd_list);
 static LIST_HEAD(notifier_list);
 static DEFINE_MUTEX(list_lock);
 
@@ -239,7 +240,7 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
 
 	list_for_each_entry(asc, &notifier->done_list, asc_entry) {
 		struct v4l2_async_notifier *subdev_notifier =
-			v4l2_async_find_subdev_notifier(asc->sd);
+			v4l2_async_find_subdev_notifier(asc->asd->sd);
 
 		if (subdev_notifier &&
 		    !v4l2_async_nf_can_complete(subdev_notifier))
@@ -313,30 +314,50 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_connection *asc)
 {
 	struct v4l2_async_notifier *subdev_notifier;
+	bool registered = false;
 	int ret;
 
-	ret = v4l2_device_register_subdev(v4l2_dev, sd);
-	if (ret < 0)
-		return ret;
+	if (!asc->asd->bound) {
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
 
-	asc->sd = sd;
+	asc->asd->bound++;
+	if (!sd->asd) {
+		sd->asd = asc->asd;
+		sd->notifier = notifier;
+		asc->asd->sd = sd;
+	} else {
+		WARN_ON(sd->asd != asc->asd);
+	}
 
 	/* Move from the waiting list to notifier's done */
 	list_move(&asc->asc_entry, &notifier->done_list);
@@ -362,9 +383,11 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 
 err_call_unbind:
 	v4l2_async_nf_call_unbind(notifier, sd, asc);
+	list_del(&asc->asc_subdev_entry);
 
 err_unregister_subdev:
-	v4l2_device_unregister_subdev(sd);
+	if (registered)
+		v4l2_device_unregister_subdev(sd);
 
 	return ret;
 }
@@ -410,15 +433,17 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier)
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
+	asc->asd->bound--;
+	WARN_ON(asc->asd->bound < 0);
+	if (!asc->asd->bound) {
+		v4l2_async_nf_call_unbind(notifier, asc->asd->sd, asc);
+		v4l2_device_unregister_subdev(asc->asd->sd);
+		asc->asd->sd->asd = NULL;
+	}
 }
 
 /* Unbind all sub-devices in the notifier tree. */
@@ -430,16 +455,12 @@ v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier)
 	list_for_each_entry_safe(asc, asc_tmp, &notifier->done_list,
 				 asc_entry) {
 		struct v4l2_async_notifier *subdev_notifier =
-			v4l2_async_find_subdev_notifier(asc->sd);
+			v4l2_async_find_subdev_notifier(asc->asd->sd);
 
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
@@ -457,7 +478,7 @@ v4l2_async_nf_has_async_match_entry(struct v4l2_async_notifier *notifier,
 			return true;
 
 	list_for_each_entry(asc, &notifier->done_list, asc_entry) {
-		if (WARN_ON(!asc->sd->asd))
+		if (WARN_ON(!asc->asd->sd->asd))
 			continue;
 
 		if (v4l2_async_match_equal(&asc->match, match))
@@ -632,6 +653,18 @@ void v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
 }
 EXPORT_SYMBOL(v4l2_async_nf_unregister);
 
+static void release_async_subdev(struct kref *kref)
+{
+	struct v4l2_async_subdev *asd =
+		container_of_const(kref, struct v4l2_async_subdev, kref);
+
+	list_del(&asd->asd_entry);
+
+	WARN_ON(asd->asc_list.next && !list_empty(&asd->asc_list));
+
+	kfree(asd);
+}
+
 static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
 {
 	struct v4l2_async_connection *asc, *tmp;
@@ -642,16 +675,28 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
 	WARN_ON(!list_empty(&notifier->done_list));
 
 	list_for_each_entry_safe(asc, tmp, &notifier->waiting_list, asc_entry) {
+		list_del(&asc->asc_entry);
+		list_del(&asc->asc_subdev_entry);
+		v4l2_async_nf_call_destroy(notifier, asc);
+
 		switch (asc->match.type) {
 		case V4L2_ASYNC_MATCH_TYPE_FWNODE:
+			dev_dbg(notifier_dev(notifier),
+				"release async connection for fwnode %pfw\n",
+				asc->match.fwnode);
 			fwnode_handle_put(asc->match.fwnode);
 			break;
-		default:
+		case V4L2_ASYNC_MATCH_TYPE_I2C:
+			dev_dbg(notifier_dev(notifier),
+				"release I²C async connection\n");
 			break;
+		default:
+			dev_dbg(notifier_dev(notifier),
+				"release invalid async connection type %u\n",
+				asc->match.type);
 		}
 
-		list_del(&asc->asc_entry);
-		v4l2_async_nf_call_destroy(notifier, asc);
+		kref_put(&asc->asd->kref, release_async_subdev);
 		kfree(asc);
 	}
 }
@@ -666,16 +711,104 @@ void v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
 }
 EXPORT_SYMBOL_GPL(v4l2_async_nf_cleanup);
 
+static bool async_subdev_has_connection(struct v4l2_async_notifier *notifier,
+					struct v4l2_async_subdev *asd,
+					struct v4l2_async_connection *asc)
+{
+	struct v4l2_async_connection *__asc;
+	struct fwnode_handle *fwnode;
+	bool exists = false;
+
+	fwnode = fwnode_graph_get_port_parent(asc->match.fwnode);
+	if (WARN_ON(!fwnode))
+		return false;
+
+	list_for_each_entry(__asc, &asd->asc_list, asc_subdev_entry) {
+		struct fwnode_handle *__fwnode;
+
+		if (__asc->match.type != V4L2_ASYNC_MATCH_TYPE_FWNODE)
+			continue;
+
+		__fwnode = fwnode_graph_get_port_parent(__asc->match.fwnode);
+		if (WARN_ON(!__fwnode))
+			continue;
+
+		fwnode_handle_put(__fwnode);
+
+		if (__fwnode == fwnode) {
+			exists = true;
+			break;
+		}
+	}
+
+	fwnode_handle_put(fwnode);
+
+	return exists;
+}
+
+/* Find an async sub-device for the async connection. */
+static int v4l2_async_find_async_subdev(struct v4l2_async_notifier *notifier,
+					struct v4l2_async_connection *asc)
+{
+	struct v4l2_async_subdev *asd;
+
+	lockdep_assert_held(&list_lock);
+
+	if (asc->match.type == V4L2_ASYNC_MATCH_TYPE_FWNODE) {
+		dev_dbg(notifier_dev(notifier),
+			"async: looking up subdev for %pfw\n",
+			asc->match.fwnode);
+
+		/*
+		 * Matching by endpoint nodes may mean there are multiple
+		 * connections to a single device. This is only possible with
+		 * fwnode matching.
+		 */
+		if (fwnode_graph_is_endpoint(asc->match.fwnode)) {
+			list_for_each_entry(asd, &asd_list, asd_entry) {
+				if (async_subdev_has_connection(notifier, asd,
+								asc)) {
+					kref_get(&asd->kref);
+					goto found;
+				}
+			}
+		}
+	}
+
+	dev_dbg(notifier_dev(notifier), "not found, allocating new one\n");
+
+	asd = kzalloc(sizeof(*asd), GFP_KERNEL);
+	if (!asd)
+		return -ENOMEM;
+
+	kref_init(&asd->kref);
+	INIT_LIST_HEAD(&asd->asc_list);
+	list_add(&asd->asd_entry, &asd_list);
+
+found:
+	list_add(&asc->asc_subdev_entry, &asd->asc_list);
+	asc->asd = asd;
+
+	return 0;
+}
+
 static int __v4l2_async_nf_add_connection(struct v4l2_async_notifier *notifier,
 					  struct v4l2_async_connection *asc)
 {
+	int ret;
+
 	mutex_lock(&list_lock);
 
+	ret = v4l2_async_find_async_subdev(notifier, asc);
+	if (ret)
+		goto unlock;
+
 	list_add_tail(&asc->asc_entry, &notifier->waiting_list);
 
+unlock:
 	mutex_unlock(&list_lock);
 
-	return 0;
+	return ret;
 }
 
 struct v4l2_async_connection *
@@ -690,6 +823,7 @@ __v4l2_async_nf_add_fwnode(struct v4l2_async_notifier *notifier,
 	if (!asc)
 		return ERR_PTR(-ENOMEM);
 
+	asc->notifier = notifier;
 	asc->match.type = V4L2_ASYNC_MATCH_TYPE_FWNODE;
 	asc->match.fwnode = fwnode_handle_get(fwnode);
 
@@ -737,6 +871,7 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier, int adapter_id,
 	if (!asc)
 		return ERR_PTR(-ENOMEM);
 
+	asc->notifier = notifier;
 	asc->match.type = V4L2_ASYNC_MATCH_TYPE_I2C;
 	asc->match.i2c.adapter_id = adapter_id;
 	asc->match.i2c.address = address;
@@ -754,7 +889,11 @@ EXPORT_SYMBOL_GPL(__v4l2_async_nf_add_i2c);
 struct v4l2_async_connection *
 v4l2_async_connection_unique(struct v4l2_subdev *sd)
 {
-	return sd->asd;
+	if (!list_is_singular(&sd->asd->asc_list))
+		return NULL;
+
+	return list_first_entry(&sd->asd->asc_list,
+				struct v4l2_async_connection, asc_subdev_entry);
 }
 EXPORT_SYMBOL_GPL(v4l2_async_connection_unique);
 
@@ -762,6 +901,7 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 {
 	struct v4l2_async_notifier *subdev_notifier;
 	struct v4l2_async_notifier *notifier;
+	struct v4l2_async_connection *asc;
 	int ret;
 
 	/*
@@ -786,7 +926,6 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 	list_for_each_entry(notifier, &notifier_list, notifier_entry) {
 		struct v4l2_device *v4l2_dev =
 			v4l2_async_nf_find_v4l2_dev(notifier);
-		struct v4l2_async_connection *asc;
 
 		if (!v4l2_dev)
 			continue;
@@ -823,11 +962,8 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
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
 
@@ -837,6 +973,9 @@ EXPORT_SYMBOL(v4l2_async_register_subdev);
 
 void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
 {
+	struct v4l2_async_subdev *asd = sd->asd;
+	struct v4l2_async_connection *asc;
+
 	if (!sd->async_list.next)
 		return;
 
@@ -849,15 +988,19 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
 	kfree(sd->subdev_notifier);
 	sd->subdev_notifier = NULL;
 
-	if (sd->asd) {
-		struct v4l2_async_notifier *notifier = sd->notifier;
+	if (asd) {
+		list_for_each_entry(asc, &asd->asc_list, asc_subdev_entry) {
+			list_move(&asc->asc_entry,
+				  &asc->notifier->waiting_list);
+
+			v4l2_async_unbind_subdev_one(asc->notifier, asc);
+		}
 
-		list_move(&sd->asd->asc_entry, &notifier->waiting_list);
-		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
-		sd->asd->sd = NULL;
+		WARN_ON(asd->bound);
 	}
 
-	v4l2_async_cleanup(sd);
+	list_del(&sd->async_list);
+	sd->async_list.next = NULL;
 
 	mutex_unlock(&list_lock);
 }
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 6e0f9a4965aa5..af02d63fa1ab4 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -8,6 +8,7 @@
 #ifndef V4L2_ASYNC_H
 #define V4L2_ASYNC_H
 
+#include <linux/kref.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 
@@ -62,27 +63,49 @@ struct v4l2_async_match_desc {
 };
 
 /**
- * struct v4l2_async_connection - connection descriptor, as known to a bridge
+ * struct v4l2_async_subdev - sub-device descriptor
  *
+ * @kref:	kref for refcounting the subdev
+ * @asd_entry:	Entry in the list of async sub-devices
+ * @asc_list:	head for struct v4l2_async_connection.asd_entry list
+ * @sd:		the related sub-device
+ * @bound:	How many times a sub-device has been bound (by a link)
+ */
+struct v4l2_async_subdev {
+	struct kref kref;
+	struct list_head asd_entry;
+	struct list_head asc_list;
+	struct v4l2_subdev *sd;
+	int bound;
+};
+
+/**
+ * struct v4l2_async_connection - sub-device connection descriptor, as known to
+ *				  a bridge
+ *
+ * @asd:	the async sub-device related to this connection
  * @match:	struct of match type and per-bus type matching data sets
+ * @notifier:	the async notifier the connection is related to
  * @asc_entry:	used to add struct v4l2_async_connection objects to the
  *		notifier @waiting_list or @done_list
- * @sd:		the related sub-device
+ * @asc_subdev_entry:	entry in struct v4l2_async_subdev.asc_list list
  *
- * When this struct is used as a member in a driver specific struct,
- * the driver specific struct shall contain the &struct
- * v4l2_async_connection as its first member.
+ * When this struct is used as a member in a driver specific struct, the driver
+ * specific struct shall contain the &struct v4l2_async_connection as its first
+ * member.
  */
 struct v4l2_async_connection {
+	struct v4l2_async_subdev *asd;
 	struct v4l2_async_match_desc match;
+	struct v4l2_async_notifier *notifier;
 	struct list_head asc_entry;
-	struct v4l2_subdev *sd;
+	struct list_head asc_subdev_entry;
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
index f689c8eae2803..d2cf9bbae2fb3 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1065,7 +1065,7 @@ struct v4l2_subdev {
 	struct device *dev;
 	struct fwnode_handle *fwnode;
 	struct list_head async_list;
-	struct v4l2_async_connection *asd;
+	struct v4l2_async_subdev *asd;
 	struct v4l2_async_notifier *notifier;
 	struct v4l2_async_notifier *subdev_notifier;
 	struct v4l2_subdev_platform_data *pdata;
-- 
2.30.2

