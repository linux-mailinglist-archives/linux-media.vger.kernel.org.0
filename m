Return-Path: <linux-media+bounces-2779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD28819CFA
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:38:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CF471C22770
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04BF7219F6;
	Wed, 20 Dec 2023 10:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L0JzkDlx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A8F21362
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703068650; x=1734604650;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b8A0zAtDgHgdySNbkiiN2Py2hl+u3/NaWACsnHEcZGk=;
  b=L0JzkDlxYDTWG51V5sNuCpt0PWFRWLk0/U1ryw4GNdNFRs8xHImS/37f
   pzCt7fj4Dyxo9Mo1uQHaWS/wUQxMXjBqvMlGzc7cBiCawMzQhDGyNf5Oo
   hcLjBQKU2Oi3kFQXHnRr3RxlqLYK8P/VCj0Vn8gaOqurrRe5yJshC7QRD
   XJ2Wxhh9t2CFSfqJXbyLqR0xxWAQhoYbRSf4wIC0meMyXQL6Zv7PnIM/7
   oP12RuZnWQmn0CxNzLVG731EM3o5Hdw6ICXNYWdDMfTgAz2pYEm/hXKng
   SxhozcM/0zx2EbLmrs17E3++Wk5caoHRwdo7wHsrgD38UHGYMEZq6O3Y0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9174367"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9174367"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769544269"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769544269"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:28 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8F90F12068E;
	Wed, 20 Dec 2023 12:37:25 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 18/29] media: mc: Postpone graph object removal until free
Date: Wed, 20 Dec 2023 12:37:02 +0200
Message-Id: <20231220103713.113386-19-sakari.ailus@linux.intel.com>
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
index bbc233e726d2..10426c2796b6 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -702,8 +702,33 @@ EXPORT_SYMBOL_GPL(media_device_unregister_entity_notify);
 
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
@@ -787,42 +812,14 @@ EXPORT_SYMBOL_GPL(__media_device_register);
 
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
2.39.2


