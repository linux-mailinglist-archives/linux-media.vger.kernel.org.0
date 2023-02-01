Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61D6768709B
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 22:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231302AbjBAVqF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 16:46:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbjBAVqD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 16:46:03 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3039F66ED2
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675287961; x=1706823961;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MIr121G0j+ekzmFalhInu7JIL7t66lP7ul6BsVHZVq8=;
  b=j2DpWnwb9rsKCDDMe0ml5/qng+JBklVYeodBpKbfJI9kTso9ck2anALH
   aJF8G1Yqc9YT+tqRgIrX/HleoiN39faEh30whmJbCXfqH06NB2oZl1Vo8
   J3t0D1lBEQgYAinSxaIx6EVVYj7R1RcULixRpxQ3lKbxqPJNxs5A021MI
   VLo2fsbc2AZwl+SckK3twHsi6HD/utg/7Z7cvKHn/xgQCFxst+GCU/iD/
   +oMfcwhnHwpjMZ7uWZMs+Ezlje9aO4/UFW57u51bZ2mPIHwpNkEg1Sqz+
   oUor4fOlwzuhy4F4t5q/x9M+mpmmikiL1xREl+AVhs7fRHutlGnu481+P
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330415656"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="330415656"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695527312"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="695527312"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:50 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 4431512276E;
        Wed,  1 Feb 2023 23:45:47 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 14/26] media device: Refcount the media device
Date:   Wed,  1 Feb 2023 23:45:23 +0200
Message-Id: <20230201214535.347075-15-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
References: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As the struct media_device embeds struct media_devnode, the lifetime of
that object must be that same than that of the media_device.

References are obtained by media_device_get() and released by
media_device_put(). In order to use refcounting, the driver must set the
release callback before calling media_device_init() on the media device.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-device.c | 43 +++++++++++++++++++++++++++++++-----
 include/media/media-device.h | 28 +++++++++++++++++++++++
 2 files changed, 65 insertions(+), 6 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index f4d880fcd977..c13cbdfdbaab 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -705,6 +705,30 @@ void media_device_unregister_entity_notify(struct media_device *mdev,
 }
 EXPORT_SYMBOL_GPL(media_device_unregister_entity_notify);
 
+static void __media_device_release(struct media_device *mdev)
+{
+	dev_dbg(mdev->dev, "Media device released\n");
+
+	ida_destroy(&mdev->entity_internal_idx);
+	mdev->entity_internal_idx_max = 0;
+	media_graph_walk_cleanup(&mdev->pm_count_walk);
+	mutex_destroy(&mdev->graph_mutex);
+	mutex_destroy(&mdev->req_queue_mutex);
+}
+
+static void media_device_release(struct media_devnode *devnode)
+{
+	struct media_device *mdev = to_media_device(devnode);
+
+	__media_device_release(mdev);
+
+	if (mdev->ops && mdev->ops->release)
+		mdev->ops->release(mdev);
+	else
+		dev_warn(mdev->dev,
+			 "calling media_device_release but no release callback set!\n");
+}
+
 void media_device_init(struct media_device *mdev)
 {
 	INIT_LIST_HEAD(&mdev->entities);
@@ -717,6 +741,17 @@ void media_device_init(struct media_device *mdev)
 	mutex_init(&mdev->graph_mutex);
 	ida_init(&mdev->entity_internal_idx);
 	atomic_set(&mdev->request_id, 0);
+
+	/*
+	 * Set the release callback to the media device if we have one
+	 * set. Otherwise, the caller is responsible for calling
+	 * media_device_cleanup() in order to release resources
+	 * related to the media device, i.e. the media device is not
+	 * refcounted. This is deprecated.
+	 */
+	if (mdev->ops && mdev->ops->release)
+		mdev->devnode.release = media_device_release;
+
 	media_devnode_init(&mdev->devnode);
 
 	if (!*mdev->bus_info)
@@ -729,12 +764,8 @@ EXPORT_SYMBOL_GPL(media_device_init);
 
 void media_device_cleanup(struct media_device *mdev)
 {
-	ida_destroy(&mdev->entity_internal_idx);
-	mdev->entity_internal_idx_max = 0;
-	media_graph_walk_cleanup(&mdev->pm_count_walk);
-	mutex_destroy(&mdev->graph_mutex);
-	mutex_destroy(&mdev->req_queue_mutex);
-	put_device(&mdev->devnode.dev);
+	__media_device_release(mdev);
+	media_device_put(mdev);
 }
 EXPORT_SYMBOL_GPL(media_device_cleanup);
 
diff --git a/include/media/media-device.h b/include/media/media-device.h
index a33820075aa4..7e8bca6756ba 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -62,6 +62,7 @@ struct media_entity_notify {
  *	       request (and thus the buffer) must be available to the driver.
  *	       And once a buffer is queued, then the driver can complete
  *	       or delete objects from the request before req_queue exits.
+ * @release: Release the resources of the media device.
  */
 struct media_device_ops {
 	int (*link_notify)(struct media_link *link, u32 flags,
@@ -70,6 +71,7 @@ struct media_device_ops {
 	void (*req_free)(struct media_request *req);
 	int (*req_validate)(struct media_request *req);
 	void (*req_queue)(struct media_request *req);
+	void (*release)(struct media_device *mdev);
 };
 
 /**
@@ -219,6 +221,30 @@ struct usb_device;
  */
 void media_device_init(struct media_device *mdev);
 
+/**
+ * media_device_get() - Get a reference to a media device
+ *
+ * @mdev: media device
+ */
+#define media_device_get(mdev)						\
+	do {								\
+		dev_dbg((mdev)->dev, "%s: get media device %s\n",	\
+			__func__, (mdev)->bus_info);			\
+		get_device(&(mdev)->devnode.dev);			\
+	} while (0)
+
+/**
+ * media_device_put() - Put a reference to a media device
+ *
+ * @mdev: media device
+ */
+#define media_device_put(mdev)						\
+	do {								\
+		dev_dbg((mdev)->dev, "%s: put media device %s\n",	\
+			__func__, (mdev)->bus_info);			\
+		put_device(&(mdev)->devnode.dev);			\
+	} while (0)
+
 /**
  * media_device_cleanup() - Cleanups a media device element
  *
@@ -432,6 +458,8 @@ void __media_device_usb_init(struct media_device *mdev,
 			     const char *driver_name);
 
 #else
+#define media_device_get(mdev) do { } while (0)
+#define media_device_put(mdev) do { } while (0)
 static inline int media_device_register(struct media_device *mdev)
 {
 	return 0;
-- 
2.30.2

