Return-Path: <linux-media+bounces-2774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C3E819CF5
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5406288781
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8232A21353;
	Wed, 20 Dec 2023 10:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUc6LTY5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71FE21105
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703068648; x=1734604648;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3eYoyL85RZ0NXQdOXP/zvPjuOHNqncO7h8P3i0dE8HU=;
  b=HUc6LTY50IdfLBdpzAurs1iiFC05wG9u0FHN987XyG6OhbhSoiEzQyq3
   a4Ev3taZBxMb+ogmc0X5tcKwdqwqYy+fbhq1x3vvgaeL2WJit+MpkZhsK
   FPElFrxgeBWDmVyvY6QAzp/qc3GltzxofKva1h/0hvE/WC76kW9EtkFGq
   cgM+FsH5E9vjjxLflbFqRmfEx3yjkbN1lXM8jt7mhNpD1LrTxakj4/gst
   vHDvF21IynWn+nSIp5N/y3lg1BJ+64+4b4C6tMtUqoVIvQaz00hOUL4PI
   l2CcNy2kN7Ckk/BFF8GAGWth6BKUcCmpL5aN3A4EjPUFAlRLOUJ2RiB/b
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9174345"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9174345"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769544256"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769544256"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:25 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 63128120788;
	Wed, 20 Dec 2023 12:37:22 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 13/29] media: mc: Initialise media devnode in media_device_init()
Date: Wed, 20 Dec 2023 12:36:57 +0200
Message-Id: <20231220103713.113386-14-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call media_devnode_init() from media_device_init(). This has the effect of
creating a struct device for the media_devnode before it is registered,
making it possible to obtain a reference to it for e.g. video devices.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/mc/mc-device.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index 44685ab6a450..e6ac9b066524 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -711,8 +711,8 @@ void media_device_init(struct media_device *mdev)
 	mutex_init(&mdev->req_queue_mutex);
 	mutex_init(&mdev->graph_mutex);
 	ida_init(&mdev->entity_internal_idx);
-
 	atomic_set(&mdev->request_id, 0);
+	media_devnode_init(&mdev->devnode);
 
 	if (!*mdev->bus_info)
 		media_set_bus_info(mdev->bus_info, sizeof(mdev->bus_info),
@@ -729,6 +729,7 @@ void media_device_cleanup(struct media_device *mdev)
 	media_graph_walk_cleanup(&mdev->pm_count_walk);
 	mutex_destroy(&mdev->graph_mutex);
 	mutex_destroy(&mdev->req_queue_mutex);
+	put_device(&mdev->devnode.dev);
 }
 EXPORT_SYMBOL_GPL(media_device_cleanup);
 
@@ -744,26 +745,19 @@ int __must_check __media_device_register(struct media_device *mdev,
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
 
@@ -810,7 +804,6 @@ void media_device_unregister(struct media_device *mdev)
 	device_remove_file(&mdev->devnode.dev, &dev_attr_model);
 	dev_dbg(mdev->dev, "Media device unregistering\n");
 	media_devnode_unregister(&mdev->devnode);
-	put_device(&mdev->devnode.dev);
 }
 EXPORT_SYMBOL_GPL(media_device_unregister);
 
-- 
2.39.2


