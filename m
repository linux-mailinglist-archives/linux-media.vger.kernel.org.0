Return-Path: <linux-media+bounces-6882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80130879226
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2080E1F21DAB
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 10:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A438C69D09;
	Tue, 12 Mar 2024 10:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n3fIxNxg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C72079B76
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239678; cv=none; b=osaIjTXXTcmp86KvkHIbK/WEaCewqPciGzAbP4nzOi2NNFdJDD6lsZhzG5xZdEdxeh8Qsgo26YZp9ZmL8Gqyj9S7gmm5Se4lNkfI9Idnyk4+Pi/MA3Yy4ZaAGBil4jFX/uSkpNLV7UMWJx6oySyjxJj3Yu1z+HuTs1d4TVVHthU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239678; c=relaxed/simple;
	bh=II6lz7idmJWX19uPmLqcUf7Hfulwjv5ymsaQBoCu7Zc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UCqCKTJvuk3VyrThfYsP6r/zwdOALdcS23n9Ja9YUZG4y87YAFbhrtFagAR7PEQM34FmpUGBZoQ2EMLlgumYYhQOIMaBws6+RuqhT7bKQ5NCaYPHlVEQCkW7UFCt9LxBvJ5s8CAZ/f/JMjgf+ZAG8Dt11rfRunlCMLCJuQhIrM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n3fIxNxg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239677; x=1741775677;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=II6lz7idmJWX19uPmLqcUf7Hfulwjv5ymsaQBoCu7Zc=;
  b=n3fIxNxgLqFxE7jmMoIpd8r/wJKnGWAEmi6jzoqRiMpfFh0KCgBOig/G
   LKR01qW73gmXwWOnF2tPI0QxWKizGsl2TYJLwG8aLkGf6YP9pibiUSo2F
   BOXMCNWgX/eWwpL5SdnZKMXkOx4Dw0lYwYG/T9SWVESrK+R6ZsVOzzFxM
   mRJX+HwebMEFInM9wowyI9XqnJ8AR5gYwPAV9H2Qu5p0EVBbtv/s4RJDF
   NzNHqUN6yynyDd3YCv1AbtA3TSZIz0OYm0wM0L+1e4Xq/5BLIJifPs/gY
   dbDsuoYRdOwQaWYFnWswFI1zQrvYNme8juDpnPn8DP8wib75cX45seCRY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4794305"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4794305"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16194092"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:35 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 773D811F81D;
	Tue, 12 Mar 2024 12:34:32 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v3 13/26] media: mc: Initialise media devnode in media_device_init()
Date: Tue, 12 Mar 2024 12:34:09 +0200
Message-Id: <20240312103422.216484-14-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312103422.216484-1-sakari.ailus@linux.intel.com>
References: <20240312103422.216484-1-sakari.ailus@linux.intel.com>
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


