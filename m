Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD88468709A
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 22:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbjBAVqF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 16:46:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbjBAVqC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 16:46:02 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 325BF6812D
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675287961; x=1706823961;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=weabiT4yTA0ziBp/dh6uchP6cSbrI8QEYQw1qYaQKpw=;
  b=GTUZ60dqZ6gspXSmMFPhFslvxR4Ey+BHIZ3hhRtnAYZg6wlOW0t/0qrg
   i6K7clREW6uogb71rab2YvWfcN00p/oNhkEVE90DYf0TvYC/khZqTp4au
   V7fSmyghrFF49z8Vi/WMATsURH6w4C5bDa2ch+n9gM0l7xGvPmLTMAB3t
   yBbWeI8DARsuTHvMdWgBBOgQoyKLeGWITriTMNb+03qttviGvg11LHMCY
   +q++GHnoYjfwlDITV415TUbGDewsg19F4KpdNRB34hVGC7G6AfSqjqf4L
   blb3m5oyUvComosNGuFa+LDFv7dSyWxW6E9ZCA2LzGIOCcWCglaFpAbsI
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330415664"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="330415664"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695527316"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="695527316"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:51 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id BAA4912279A;
        Wed,  1 Feb 2023 23:45:48 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 16/26] media-device: Postpone graph object removal until free
Date:   Wed,  1 Feb 2023 23:45:25 +0200
Message-Id: <20230201214535.347075-17-sakari.ailus@linux.intel.com>
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

The media device itself will be unregistered based on it being unbound and
driver's remove callback being called. The graph objects themselves may
still be in use; rely on the media device release callback to release
them.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
---
 drivers/media/mc/mc-device.c | 53 +++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 28 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index c13cbdfdbaab..00c44752b4a1 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -707,8 +707,33 @@ EXPORT_SYMBOL_GPL(media_device_unregister_entity_notify);
 
 static void __media_device_release(struct media_device *mdev)
 {
+	struct media_entity *entity;
+	struct media_entity *next;
+	struct media_interface *intf, *tmp_intf;
+	struct media_entity_notify *notify, *nextp;
+
 	dev_dbg(mdev->dev, "Media device released\n");
 
+	/* Remove all entities from the media device */
+	list_for_each_entry_safe(entity, next, &mdev->entities, graph_obj.list)
+		__media_device_unregister_entity(entity);
+
+	/* Remove all entity_notify callbacks from the media device */
+	list_for_each_entry_safe(notify, nextp, &mdev->entity_notify, list)
+		__media_device_unregister_entity_notify(mdev, notify);
+
+	/* Remove all interfaces from the media device */
+	list_for_each_entry_safe(intf, tmp_intf, &mdev->interfaces,
+				 graph_obj.list) {
+		/*
+		 * Unlink the interface, but don't free it here; the
+		 * module which created it is responsible for freeing
+		 * it
+		 */
+		__media_remove_intf_links(intf);
+		media_gobj_destroy(&intf->graph_obj);
+	}
+
 	ida_destroy(&mdev->entity_internal_idx);
 	mdev->entity_internal_idx_max = 0;
 	media_graph_walk_cleanup(&mdev->pm_count_walk);
@@ -799,42 +824,14 @@ EXPORT_SYMBOL_GPL(__media_device_register);
 
 void media_device_unregister(struct media_device *mdev)
 {
-	struct media_entity *entity;
-	struct media_entity *next;
-	struct media_interface *intf, *tmp_intf;
-	struct media_entity_notify *notify, *nextp;
-
 	if (mdev == NULL)
 		return;
 
 	mutex_lock(&mdev->graph_mutex);
-
-	/* Check if mdev was ever registered at all */
 	if (!media_devnode_is_registered(&mdev->devnode)) {
 		mutex_unlock(&mdev->graph_mutex);
 		return;
 	}
-
-	/* Remove all entities from the media device */
-	list_for_each_entry_safe(entity, next, &mdev->entities, graph_obj.list)
-		__media_device_unregister_entity(entity);
-
-	/* Remove all entity_notify callbacks from the media device */
-	list_for_each_entry_safe(notify, nextp, &mdev->entity_notify, list)
-		__media_device_unregister_entity_notify(mdev, notify);
-
-	/* Remove all interfaces from the media device */
-	list_for_each_entry_safe(intf, tmp_intf, &mdev->interfaces,
-				 graph_obj.list) {
-		/*
-		 * Unlink the interface, but don't free it here; the
-		 * module which created it is responsible for freeing
-		 * it
-		 */
-		__media_remove_intf_links(intf);
-		media_gobj_destroy(&intf->graph_obj);
-	}
-
 	mutex_unlock(&mdev->graph_mutex);
 
 	device_remove_file(&mdev->devnode.dev, &dev_attr_model);
-- 
2.30.2

