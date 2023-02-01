Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5C8687098
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 22:46:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjBAVqD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 16:46:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231185AbjBAVqA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 16:46:00 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BA1769517
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675287956; x=1706823956;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VKjoCYwpt5HtdCIBTFH+klUo3ng/sgbc8tHhHqplIrg=;
  b=OlxV46sAr9u/xy1zNjWTSVxbZOqYkUgFuCR2S6Dw6uAqitOttGm4DOuV
   d86OskWhT1kSwW3/58A2YgSV2w7R61D5hqw5+PcK+AR2916uvugOSOke6
   P3bS59YqTq/6KYaFOreLkxIT7ITq3V2ymaC/0LQputg8CHmAH3dO5aZaI
   Ir+9Fs41SbJO0KrKrOdn6730WHO4KRJR8BN7rGvPqGtLXyIc1opngYdR1
   8P8NQv6guz+XcSoC5pFRfifdxY5IZdAxTFa4E83cdBdhnd9+wFnxgC1RD
   66SXQewpB2THAQbuFhdvaN3M6A95lL89xH95YvsqAs5rJPQ69YCapEWTh
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330415653"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="330415653"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695527310"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="695527310"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:49 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 9465C120339;
        Wed,  1 Feb 2023 23:45:46 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 13/26] media device: Initialise media devnode in media_device_init()
Date:   Wed,  1 Feb 2023 23:45:22 +0200
Message-Id: <20230201214535.347075-14-sakari.ailus@linux.intel.com>
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

Call media_devnode_init() from media_device_init(). This has the effect of
creating a struct device for the media_devnode before it is registered,
making it possible to obtain a reference to it for e.g. video devices.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-device.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index c90f79454988..f4d880fcd977 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -716,8 +716,8 @@ void media_device_init(struct media_device *mdev)
 	mutex_init(&mdev->req_queue_mutex);
 	mutex_init(&mdev->graph_mutex);
 	ida_init(&mdev->entity_internal_idx);
-
 	atomic_set(&mdev->request_id, 0);
+	media_devnode_init(&mdev->devnode);
 
 	if (!*mdev->bus_info)
 		media_set_bus_info(mdev->bus_info, sizeof(mdev->bus_info),
@@ -734,6 +734,7 @@ void media_device_cleanup(struct media_device *mdev)
 	media_graph_walk_cleanup(&mdev->pm_count_walk);
 	mutex_destroy(&mdev->graph_mutex);
 	mutex_destroy(&mdev->req_queue_mutex);
+	put_device(&mdev->devnode.dev);
 }
 EXPORT_SYMBOL_GPL(media_device_cleanup);
 
@@ -749,26 +750,19 @@ int __must_check __media_device_register(struct media_device *mdev,
 	/* Set version 0 to indicate user-space that the graph is static */
 	mdev->topology_version = 0;
 
-	media_devnode_init(&mdev->devnode);
-
 	ret = media_devnode_register(&mdev->devnode, owner);
 	if (ret < 0)
-		goto out_put;
+		return ret;
 
 	ret = device_create_file(&mdev->devnode.dev, &dev_attr_model);
-	if (ret < 0)
-		goto out_unregister;
+	if (ret < 0) {
+		media_devnode_unregister(&mdev->devnode);
+		return ret;
+	}
 
 	dev_dbg(mdev->dev, "Media device registered\n");
 
 	return 0;
-
-out_unregister:
-	media_devnode_unregister(&mdev->devnode);
-out_put:
-	put_device(&mdev->devnode.dev);
-
-	return ret;
 }
 EXPORT_SYMBOL_GPL(__media_device_register);
 
@@ -815,7 +809,6 @@ void media_device_unregister(struct media_device *mdev)
 	device_remove_file(&mdev->devnode.dev, &dev_attr_model);
 	dev_dbg(mdev->dev, "Media device unregistering\n");
 	media_devnode_unregister(&mdev->devnode);
-	put_device(&mdev->devnode.dev);
 }
 EXPORT_SYMBOL_GPL(media_device_unregister);
 
-- 
2.30.2

