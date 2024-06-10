Return-Path: <linux-media+bounces-12837-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9183E901EDB
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 026DB2820A2
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21F77CF25;
	Mon, 10 Jun 2024 10:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mEpNyXx4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB25B7A705
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013957; cv=none; b=I8Tj+UPZAvRXl9ZNjy34c7/Oqm6fxtBhgk6zi1NjuyLXPQWGpwXChY0uKcCdNyVpj5GAkhRBDIjkTEscWrVUkW52YZSJ4ng42fIoMm7jDhTKoB1GsNdKHr5UvldlJa+KFgZvM1Ok9gMmoCRpqxrUka7zYSAvYxvEceUg8iFEkg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013957; c=relaxed/simple;
	bh=oneBxfx/LYGFbEe8UyCN6amVIqf8WCaK8FFBAKy+UGQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ra9gDXEv7AVGqVXYOAPxh3eUzJijoyP8NphzbnIo2XOBd0eBqubWe6fDawdJW075JdxAR0FUBThz7FHny2shFDziWTGv4Sfzcx/oXmmtoI34ohBhcr2BGy5QRJjfbeF4vSJyXSBThalnvNVBZZwJPf9MdJ9kIBlI6A1F4QuR0sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mEpNyXx4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013956; x=1749549956;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oneBxfx/LYGFbEe8UyCN6amVIqf8WCaK8FFBAKy+UGQ=;
  b=mEpNyXx4eTLWc/98Z3lUeujKVYX1NUHktZd2fxJZsKuek1BFQbMAr2wC
   bOEkOapHmHcIAbB99F9JNwMo4TbwbzGJawbR2KuAF/73dQHgXTmHHpFLd
   N+qLgPIp1x7ovu3SQGXlljrvGOlIXlS4m+oDbG00EAgJU+Sc8aAewasHp
   XoBFJK4lt/pE8i6e3pycbISwvHvCNSKwUgeX1UNM4BEHIkOAYs+JO9Jgi
   qbWQquWjXAE+WkxV0ku0Y8C8sirhcI5JTIcw8LkINpjeCMEU6Vd8MRPCk
   wjXd8mM7gQZtWYv/0dPW1ykhAip1Kqv/m7TFZ8Zcq9gVhA+c/nzoXnC7T
   A==;
X-CSE-ConnectionGUID: HDb+hCCgQTWBC7pztdbGbQ==
X-CSE-MsgGUID: PoI3OV9sSeiTCH9AcEyKsw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819931"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819931"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:52 -0700
X-CSE-ConnectionGUID: i6mSsOp/RkqWAMJyMx7NTg==
X-CSE-MsgGUID: WDJ6qNJlRe2fT/zvXcDKag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137356"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:50 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2D915120BC1;
	Mon, 10 Jun 2024 13:05:41 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuH-004eDb-0Y;
	Mon, 10 Jun 2024 13:05:41 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 16/26] media: mc: Postpone graph object removal until free
Date: Mon, 10 Jun 2024 13:05:20 +0300
Message-Id: <20240610100530.1107771-17-sakari.ailus@linux.intel.com>
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

The media device itself will be unregistered based on it being unbound and
driver's remove callback being called. The graph objects themselves may
still be in use; rely on the media device release callback to release
them.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
---
 drivers/media/mc/mc-device.c | 59 ++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 33 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index bbc233e726d2..f1a88edb7573 100644
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
@@ -787,43 +812,11 @@ EXPORT_SYMBOL_GPL(__media_device_register);
 
 void media_device_unregister(struct media_device *mdev)
 {
-	struct media_entity *entity;
-	struct media_entity *next;
-	struct media_interface *intf, *tmp_intf;
-	struct media_entity_notify *notify, *nextp;
-
 	if (mdev == NULL)
 		return;
 
-	mutex_lock(&mdev->graph_mutex);
-
-	/* Check if mdev was ever registered at all */
-	if (!media_devnode_is_registered(&mdev->devnode)) {
-		mutex_unlock(&mdev->graph_mutex);
+	if (!media_devnode_is_registered(&mdev->devnode))
 		return;
-	}
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
-	mutex_unlock(&mdev->graph_mutex);
 
 	device_remove_file(&mdev->devnode.dev, &dev_attr_model);
 	dev_dbg(mdev->dev, "Media device unregistering\n");
-- 
2.39.2


