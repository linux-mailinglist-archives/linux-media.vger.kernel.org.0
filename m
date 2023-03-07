Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A08CE6AF794
	for <lists+linux-media@lfdr.de>; Tue,  7 Mar 2023 22:28:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231497AbjCGV2h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Mar 2023 16:28:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbjCGV2c (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Mar 2023 16:28:32 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5569662D
        for <linux-media@vger.kernel.org>; Tue,  7 Mar 2023 13:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678224510; x=1709760510;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QU2BQ5Z1sefXy0E9eVzp3MjboDloKmPAlYBCv3SXLp0=;
  b=NtCEaeMjJ5NpFT1qV3y0kQiwRGrmdXcsxJ0zBOwbX+cdDM11We1XE9EL
   qA08IUwm7H83O9rB31WDjR0tmQGK0aAU8c3oaCOyzbDXXkhybeVOv27yi
   fFo5voeiiE+5cWn/CC2I2xWYTzsjQNjM6cgDDpNxRcJ4Aa2tCBanDuBJW
   cQFRFFAchyZ/i9T/b6lVA+NAWEWd8ayEBOgwuezQdbOyOWhANdspo8tf5
   punmVh/0Ok631vS/2Bkv9K4xf7ukriLjHfxv0r4MVC/2OXfnKIow3xB2m
   vfHndCFQZIIpN986Yyjh2dzVoSSNMnAM17/dKHAFlxpNJWwIR115LJ5zz
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="398557136"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="398557136"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 13:28:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="676710141"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="676710141"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 13:28:15 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 0C68D122DAB;
        Tue,  7 Mar 2023 23:20:48 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com
Subject: [RFC 10/10] media: v4l: async: Differentiate connecting and creating sub-devices
Date:   Tue,  7 Mar 2023 23:20:38 +0200
Message-Id: <20230307212038.968381-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230307212038.968381-1-sakari.ailus@linux.intel.com>
References: <20230307212038.968381-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
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

This patch adds an object that represents the device while an earlier patch
in the series re-purposed the old struct v4l2_async_subdev as the
connection.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 168 +++++++++++++++++++++++----
 include/media/v4l2-async.h           |  32 ++++-
 include/media/v4l2-subdev.h          |   2 +-
 3 files changed, 176 insertions(+), 26 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 22c79a5fb824..6ecd4c6bc647 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -134,6 +134,7 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
 }
 
 static LIST_HEAD(subdev_head);
+static LIST_HEAD(asd_head);
 static LIST_HEAD(notifier_head);
 static DEFINE_MUTEX(list_lock);
 
@@ -304,13 +305,20 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 	struct v4l2_async_notifier *subdev_notifier;
 	int ret;
 
-	ret = v4l2_device_register_subdev(v4l2_dev, sd);
-	if (ret < 0)
-		return ret;
+	if (!asc->asd->registered) {
+		ret = v4l2_device_register_subdev(v4l2_dev, sd);
+		if (ret < 0)
+			return ret;
+	}
 
 	ret = v4l2_async_nf_call_bound(notifier, sd, asc);
 	if (ret < 0) {
-		v4l2_device_unregister_subdev(sd);
+		if (asc->match.type == V4L2_ASYNC_MATCH_FWNODE)
+			dev_dbg(notifier_dev(notifier),
+				"failed binding %pfw (%d)\n",
+				asc->match.fwnode, ret);
+		if (!asc->asd->registered)
+			v4l2_device_unregister_subdev(sd);
 		return ret;
 	}
 
@@ -322,14 +330,26 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 	 */
 	ret = v4l2_async_create_ancillary_links(notifier, sd);
 	if (ret) {
+		if (asc->match.type == V4L2_ASYNC_MATCH_FWNODE)
+			dev_dbg(notifier_dev(notifier),
+				"failed creating links for %pfw (%d)\n",
+				asc->match.fwnode, ret);
 		v4l2_async_nf_call_unbind(notifier, sd, asc);
-		v4l2_device_unregister_subdev(sd);
+		list_del(&asc->asc_subdev_list);
+		if (!asc->asd->registered)
+			v4l2_device_unregister_subdev(sd);
 		return ret;
 	}
 
 	list_del(&asc->waiting_list);
-	sd->asd = asc;
-	sd->notifier = notifier;
+	if (!sd->asd) {
+		WARN_ON(asc->asd->registered);
+		sd->asd = asc->asd;
+		sd->notifier = notifier;
+		asc->asd->registered = true;
+	} else {
+		WARN_ON(sd->asd != asc->asd);
+	}
 
 	/* Move from the global subdevice list to notifier's done */
 	list_move(&sd->async_list, &notifier->done_head);
@@ -403,6 +423,21 @@ static void v4l2_async_cleanup(struct v4l2_subdev *sd)
 	sd->asd = NULL;
 }
 
+static void v4l2_async_unbind_subdev_one(struct v4l2_async_notifier *notifier,
+					 struct v4l2_subdev *sd, bool readd)
+{
+	struct v4l2_async_connection *asc, *tmp;
+
+	list_for_each_entry_safe(asc, tmp, &sd->asd->asc_head,
+				 asc_subdev_list) {
+		v4l2_async_nf_call_unbind(notifier, sd, asc);
+		list_del(&asc->asc_subdev_list);
+		if (readd)
+			list_add_tail(&asc->waiting_list,
+				      &notifier->waiting_head);
+	}
+}
+
 /* Unbind all sub-devices in the notifier tree. */
 static void
 v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier,
@@ -417,10 +452,8 @@ v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier,
 		if (subdev_notifier)
 			v4l2_async_nf_unbind_all_subdevs(subdev_notifier, true);
 
-		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
-		if (readd)
-			list_add_tail(&sd->asd->waiting_list,
-				      &notifier->waiting_head);
+		v4l2_async_unbind_subdev_one(notifier, sd, readd);
+
 		v4l2_async_cleanup(sd);
 
 		list_move(&sd->async_list, &subdev_head);
@@ -445,8 +478,9 @@ __v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
 		if (WARN_ON(!sd->asd))
 			continue;
 
-		if (asc_equal(&sd->asd->match, match))
-			return true;
+		list_for_each_entry(asc, &sd->asd->asc_head, asc_list)
+			if (asc_equal(&asc->match, match))
+				return true;
 	}
 
 	return false;
@@ -534,7 +568,7 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 	mutex_lock(&list_lock);
 
 	list_for_each_entry(asc, &notifier->asc_head, asc_list) {
-		ret = v4l2_async_nf_asd_valid(notifier, &asc->match, true);
+		ret = v4l2_async_nf_asc_valid(notifier, &asc->match, true);
 		if (ret)
 			goto err_unlock;
 
@@ -604,6 +638,18 @@ void v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
 }
 EXPORT_SYMBOL(v4l2_async_nf_unregister);
 
+static void release_async_subdev(struct kref *kref)
+{
+	struct v4l2_async_subdev *asd =
+		container_of_const(kref, struct v4l2_async_subdev, kref);
+
+	list_del(&asd->asd_list);
+
+	WARN_ON(!list_empty(&asd->asc_head));
+
+	kfree(asd);
+}
+
 static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
 {
 	struct v4l2_async_connection *asc, *tmp;
@@ -612,17 +658,25 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
 		return;
 
 	list_for_each_entry_safe(asc, tmp, &notifier->asc_head, asc_list) {
+		list_del(&asc->asc_list);
+		v4l2_async_nf_call_destroy(notifier, asc);
+
 		switch (asc->match.type) {
 		case V4L2_ASYNC_MATCH_FWNODE:
+			pr_debug("release async connection for fwnode %pfw\n",
+				 asc->match.fwnode);
 			fwnode_handle_put(asc->match.fwnode);
 			break;
-		default:
+		case V4L2_ASYNC_MATCH_I2C:
+			pr_debug("release I²C async connection\n");
 			break;
+		default:
+			pr_debug("release invalid async connection type %u\n",
+				 asc->match.type);
 		}
 
-		list_del(&asc->asc_list);
-		v4l2_async_nf_call_destroy(notifier, asd);
-		kfree(asd);
+		kref_put(&asc->asd->kref, release_async_subdev);
+		kfree(asc);
 	}
 
 	notifier->sd = NULL;
@@ -639,6 +693,72 @@ void v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
 }
 EXPORT_SYMBOL_GPL(v4l2_async_nf_cleanup);
 
+static bool async_subdev_has_connection(struct v4l2_async_notifier *notifier,
+					struct v4l2_async_subdev *asd,
+					struct v4l2_async_connection *asc)
+{
+	struct v4l2_async_connection *__asc;
+
+	list_for_each_entry(__asc, &asd->asc_head, asc_subdev_list) {
+
+		if (__asc->match.type != V4L2_ASYNC_MATCH_FWNODE)
+			continue;
+
+		if (__asc->match.fwnode != asc->match.fwnode)
+			continue;
+
+		dev_dbg(notifier_dev(notifier), "found!\n");
+
+		return true;
+	}
+
+	return false;
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
+	if (asc->match.type == V4L2_ASYNC_MATCH_FWNODE)
+		dev_dbg(notifier_dev(notifier),
+			"async: looking up subdev for %pfw\n",
+			asc->match.fwnode);
+
+	/*
+	 * Matching by endpoint nodes may mean there are multiple connections to
+	 * a single device. This is only possible with fwnode matching.
+	 */
+	if (asc->match.type == V4L2_ASYNC_MATCH_FWNODE &&
+	    fwnode_graph_is_endpoint(asc->match.fwnode)) {
+		list_for_each_entry(asd, &asd_head, asd_list) {
+			if (async_subdev_has_connection(notifier, asd, asc)) {
+				kref_get(&asd->kref);
+				goto found;
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
+	INIT_LIST_HEAD(&asd->asc_head);
+	list_add(&asd->asd_list, &asd_head);
+
+found:
+	list_add(&asc->asc_subdev_list, &asd->asc_head);
+	asc->asd = asd;
+
+	return 0;
+}
+
 int __v4l2_async_nf_add_connection(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_connection *asc)
 {
@@ -650,6 +770,10 @@ int __v4l2_async_nf_add_connection(struct v4l2_async_notifier *notifier,
 	if (ret)
 		goto unlock;
 
+	ret = v4l2_async_find_async_subdev(notifier, asc);
+	if (ret)
+		goto unlock;
+
 	list_add_tail(&asc->asc_list, &notifier->asc_head);
 
 unlock:
@@ -797,7 +921,7 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 		v4l2_async_nf_unbind_all_subdevs(subdev_notifier, false);
 
 	if (sd->asd)
-		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
+		v4l2_async_unbind_subdev_one(notifier, sd, true);
 	v4l2_async_cleanup(sd);
 
 	mutex_unlock(&list_lock);
@@ -820,10 +944,12 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
 
 	if (sd->asd) {
 		struct v4l2_async_notifier *notifier = sd->notifier;
+		struct v4l2_async_connection *asc;
 
-		list_add(&sd->asd->waiting_list, &notifier->waiting_head);
+		list_for_each_entry(asc, &sd->asd->asc_head, asc_subdev_list)
+			list_add(&asc->waiting_list, &notifier->waiting_head);
 
-		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
+		v4l2_async_unbind_subdev_one(notifier, sd, true);
 	}
 
 	v4l2_async_cleanup(sd);
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index cc1aa114100e..9bb3f761a55b 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -8,6 +8,7 @@
 #ifndef V4L2_ASYNC_H
 #define V4L2_ASYNC_H
 
+#include <linux/kref.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 
@@ -63,24 +64,47 @@ struct v4l2_async_match {
 };
 
 /**
- * struct v4l2_async_connection - sub-device descriptor, as known to a bridge
+ * struct v4l2_async_subdev - sub-device descriptor
+ *
+ * @kref:	kref for refcounting the subdev
+ * @asd_list:	Entry in the list of async sub-devices
+ * @subdev_list: used to link struct v4l2_async_subdev objects, waiting to be
+ *		probed, to a notifier->waiting_head list
+ * @asc_head:	head for struct v4l2_async_connection.asd_list list
+ * @registered:	whether the sub-device has been registered
+ */
+struct v4l2_async_subdev {
+	struct kref kref;
+	struct list_head asd_list;
+	struct list_head subdev_list;
+	struct list_head asc_head;
+	bool registered;
+};
+
+/**
+ * struct v4l2_async_connection - sub-device connection descriptor, as known to
+ *				  a bridge
  *
+ * @asd:	the async sub-device related to this connection
  * @match:	struct of match type and per-bus type matching data sets
  * @asc_list:	used to add struct v4l2_async_connection objects to the
  *		master notifier @asc_list
  * @waiting_list: used to link struct v4l2_async_connection objects, waiting to be
  *		probed, to a notifier->waiting list
+ * @asc_subdev_list:	entry in struct v4l2_async_subdev.asc_head list
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
 	struct v4l2_async_match match;
 
 	/* v4l2-async core private: not to be used by drivers */
 	struct list_head asc_list;
 	struct list_head waiting_list;
+	struct list_head asc_subdev_list;
 };
 
 /**
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index a2cce11dda5c..d510fe6ea243 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1063,7 +1063,7 @@ struct v4l2_subdev {
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

