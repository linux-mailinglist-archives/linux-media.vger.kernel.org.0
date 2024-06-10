Return-Path: <linux-media+bounces-12835-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 284F6901ED9
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF6C81F26C58
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9525C7BB0C;
	Mon, 10 Jun 2024 10:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GK7MdAvy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9711C78C98
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013956; cv=none; b=o3O+qDi6+61fPCTlWpFGYICKeQRQK92NoPhd9NG5sm0ye85dL3ujnsOSV00mS2Gpgs98eswquSymUlDXJu3T2Vn+AivwFEFylw2fy9HjZ1ORAdLo6EaIHquAE3n8StzhXiA5gLIa1twXK4FNJmGL992TKiMcrIoytXQBlNjotsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013956; c=relaxed/simple;
	bh=II6lz7idmJWX19uPmLqcUf7Hfulwjv5ymsaQBoCu7Zc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j3+p3DKR7ZtxKJY/HvHA/gBIngl7EGevREPSwEAQlyaMinwqeX0OH+u4BfXMpM7mUm2LCbW9zrmBTPnlKSlkZOujMzxvTZzWqpWy2xAwo0Q2GsksB3jwOCA7AlVOtS/HOuWomeJgyL/wP7fx4F+ItJGDbnbJkWgdvrObpgPMN/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GK7MdAvy; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013955; x=1749549955;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=II6lz7idmJWX19uPmLqcUf7Hfulwjv5ymsaQBoCu7Zc=;
  b=GK7MdAvyTKmww9xb/ozfdiX8MZPlw5FQSUdKfGDG3AQOFr1MI/VSp6pi
   5YZ04/G7Cj6qxJgKVX1PQ1fzYetj4E0Sj+Uk4dGgrCoigssdKTp70d34B
   aWzkJSdkGIpcZ6oeEJcFOCh3CSmDhZ5dEhXyVHcyb4h892SMp4+sfIOqy
   L9k8f0eHvE/qxLedclsyaC+gD0ExQqYM62gLfqvKj4+YbY3UfkPapyYc6
   z2x4r7+WpizCPbtTGpm3heHvHXvvWufdZQdA7N4fUBDR4sFt4ODMQbxpo
   eALVu6szbWnmtK3vLGuVpg1nlWXSCgU6u1Cn/bS7IjRZBW308gFyfdOvV
   g==;
X-CSE-ConnectionGUID: g/4JFNrJS9eGqJdDwmlvhw==
X-CSE-MsgGUID: VEu5kitbSkqY6NJkPVQuHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819921"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819921"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:50 -0700
X-CSE-ConnectionGUID: Dd5fcmnDQsidX2nJbvz/gA==
X-CSE-MsgGUID: hIdMH4ltQvOp59f4rUMcrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137346"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:47 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1E826120B9A;
	Mon, 10 Jun 2024 13:05:41 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuH-004eDM-0K;
	Mon, 10 Jun 2024 13:05:41 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 13/26] media: mc: Initialise media devnode in media_device_init()
Date: Mon, 10 Jun 2024 13:05:17 +0300
Message-Id: <20240610100530.1107771-14-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/mc/mc-device.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index f1f3addf7932..f1d89d940fe1 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -711,9 +711,10 @@ void media_device_init(struct media_device *mdev)
 	mutex_init(&mdev->req_queue_mutex);
 	mutex_init(&mdev->graph_mutex);
 	ida_init(&mdev->entity_internal_idx);
-
 	atomic_set(&mdev->request_id, 0);
 
+	media_devnode_init(&mdev->devnode);
+
 	if (!*mdev->bus_info)
 		media_set_bus_info(mdev->bus_info, sizeof(mdev->bus_info),
 				   mdev->dev);
@@ -729,6 +730,7 @@ void media_device_cleanup(struct media_device *mdev)
 	media_graph_walk_cleanup(&mdev->pm_count_walk);
 	mutex_destroy(&mdev->graph_mutex);
 	mutex_destroy(&mdev->req_queue_mutex);
+	put_device(&mdev->devnode.dev);
 }
 EXPORT_SYMBOL_GPL(media_device_cleanup);
 
@@ -744,26 +746,19 @@ int __must_check __media_device_register(struct media_device *mdev,
 	/* Set version 0 to indicate user-space that the graph is static */
 	mdev->topology_version = 0;
 
-	media_devnode_init(&mdev->devnode);
-
 	ret = media_devnode_register(&mdev->devnode, owner);
 	if (ret < 0)
-		goto err_put;
+		return ret;
 
 	ret = device_create_file(&mdev->devnode.dev, &dev_attr_model);
-	if (ret < 0)
-		goto err_unregister;
+	if (ret < 0) {
+		media_devnode_unregister(&mdev->devnode);
+		return ret;
+	}
 
 	dev_dbg(mdev->dev, "Media device registered\n");
 
 	return 0;
-
-err_unregister:
-	media_devnode_unregister(&mdev->devnode);
-err_put:
-	put_device(&mdev->devnode.dev);
-
-	return ret;
 }
 EXPORT_SYMBOL_GPL(__media_device_register);
 
@@ -810,7 +805,6 @@ void media_device_unregister(struct media_device *mdev)
 	device_remove_file(&mdev->devnode.dev, &dev_attr_model);
 	dev_dbg(mdev->dev, "Media device unregistering\n");
 	media_devnode_unregister(&mdev->devnode);
-	put_device(&mdev->devnode.dev);
 }
 EXPORT_SYMBOL_GPL(media_device_unregister);
 
-- 
2.39.2


