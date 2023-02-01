Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E055768708C
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 22:45:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbjBAVpq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 16:45:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjBAVpm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 16:45:42 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA65065346
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675287941; x=1706823941;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g+bFFGgu3eqZtS1KL3A/+x8X+w49RNraDxINzuRWRw8=;
  b=Z5vpVQi7qwiYtQYorsuUroMc5ZlC85wtg4Gyz6hCEH9GnCycn888T5vx
   lBUBO7RdhFD3n2OWhAqpwvWzIUW7i+rpMCCEyiOyp3T9WdpKlzDaykXf2
   uDDn9KJ7o9I69QMmN7PMWPJPTadelitoUzHEUnwizpwBbsVLBXt8sLHt/
   EF4aTugVciu4VQIAmsK0PVKys/oCpV1tM4e1WC40M/jtWxyWSbfkTVj+k
   j01UQz1MoLOvaihY///D7S+2lqmaNdLQqNbiRgzhi1n26QzLlVf1loWgf
   80Jnb8Man4g9ALqqe9s+/bag2UMZoA0myK43R3QBgQP+CjWESOMRYJ9lE
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330415600"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="330415600"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:41 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695527290"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="695527290"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:40 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 1069712276E;
        Wed,  1 Feb 2023 23:45:36 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 01/26] Revert "[media] media: fix media devnode ioctl/syscall and unregister race"
Date:   Wed,  1 Feb 2023 23:45:10 +0200
Message-Id: <20230201214535.347075-2-sakari.ailus@linux.intel.com>
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

This reverts commit 6f0dd24a084a ("[media] media: fix media devnode
ioctl/syscall and unregister race"). The commit was part of an original
patchset to avoid crashes when an unregistering device is in use.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-device.c  | 15 +++++++--------
 drivers/media/mc/mc-devnode.c |  8 +-------
 include/media/media-devnode.h | 16 ++--------------
 3 files changed, 10 insertions(+), 29 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index 25020d58eb06..013d54e1a55a 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -745,7 +745,6 @@ int __must_check __media_device_register(struct media_device *mdev,
 	if (ret < 0) {
 		/* devnode free is handled in media_devnode_*() */
 		mdev->devnode = NULL;
-		media_devnode_unregister_prepare(devnode);
 		media_devnode_unregister(devnode);
 		return ret;
 	}
@@ -802,9 +801,6 @@ void media_device_unregister(struct media_device *mdev)
 		return;
 	}
 
-	/* Clear the devnode register bit to avoid races with media dev open */
-	media_devnode_unregister_prepare(mdev->devnode);
-
 	/* Remove all entities from the media device */
 	list_for_each_entry_safe(entity, next, &mdev->entities, graph_obj.list)
 		__media_device_unregister_entity(entity);
@@ -829,10 +825,13 @@ void media_device_unregister(struct media_device *mdev)
 
 	dev_dbg(mdev->dev, "Media device unregistered\n");
 
-	device_remove_file(&mdev->devnode->dev, &dev_attr_model);
-	media_devnode_unregister(mdev->devnode);
-	/* devnode free is handled in media_devnode_*() */
-	mdev->devnode = NULL;
+	/* Check if mdev devnode was registered */
+	if (media_devnode_is_registered(mdev->devnode)) {
+		device_remove_file(&mdev->devnode->dev, &dev_attr_model);
+		media_devnode_unregister(mdev->devnode);
+		/* devnode free is handled in media_devnode_*() */
+		mdev->devnode = NULL;
+	}
 }
 EXPORT_SYMBOL_GPL(media_device_unregister);
 
diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 680fbb3a9340..0ab33214d243 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -267,7 +267,7 @@ int __must_check media_devnode_register(struct media_device *mdev,
 	return ret;
 }
 
-void media_devnode_unregister_prepare(struct media_devnode *devnode)
+void media_devnode_unregister(struct media_devnode *devnode)
 {
 	/* Check if devnode was ever registered at all */
 	if (!media_devnode_is_registered(devnode))
@@ -275,12 +275,6 @@ void media_devnode_unregister_prepare(struct media_devnode *devnode)
 
 	mutex_lock(&media_devnode_lock);
 	clear_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
-	mutex_unlock(&media_devnode_lock);
-}
-
-void media_devnode_unregister(struct media_devnode *devnode)
-{
-	mutex_lock(&media_devnode_lock);
 	/* Delete the cdev on this minor as well */
 	cdev_device_del(&devnode->cdev, &devnode->dev);
 	devnode->media_dev = NULL;
diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
index d27c1c646c28..46f0d3ae44d1 100644
--- a/include/media/media-devnode.h
+++ b/include/media/media-devnode.h
@@ -115,19 +115,6 @@ int __must_check media_devnode_register(struct media_device *mdev,
 					struct media_devnode *devnode,
 					struct module *owner);
 
-/**
- * media_devnode_unregister_prepare - clear the media device node register bit
- * @devnode: the device node to prepare for unregister
- *
- * This clears the passed device register bit. Future open calls will be met
- * with errors. Should be called before media_devnode_unregister() to avoid
- * races with unregister and device file open calls.
- *
- * This function can safely be called if the device node has never been
- * registered or has already been unregistered.
- */
-void media_devnode_unregister_prepare(struct media_devnode *devnode);
-
 /**
  * media_devnode_unregister - unregister a media device node
  * @devnode: the device node to unregister
@@ -135,7 +122,8 @@ void media_devnode_unregister_prepare(struct media_devnode *devnode);
  * This unregisters the passed device. Future open calls will be met with
  * errors.
  *
- * Should be called after media_devnode_unregister_prepare()
+ * This function can safely be called if the device node has never been
+ * registered or has already been unregistered.
  */
 void media_devnode_unregister(struct media_devnode *devnode);
 
-- 
2.30.2

