Return-Path: <linux-media+bounces-6884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B3B879229
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D35921C212E2
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 10:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2835788E;
	Tue, 12 Mar 2024 10:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4BBzjYn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEDB79B8C
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239679; cv=none; b=aJPcc0wjVGbXKKXFy1nhCnUQpiGULarqKzlwRXGyDFq7SeJs7Zt1tc7LLKK5BOggnEr76KiGlH45gn3QmLTwmOeQhO35f36bad47Asq60xq9ZoX1Qyd6wAssqrJ+1hurm+hcYHULdECNooTXcZ1SwfaQgAEhw268tXOVaZ6tVXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239679; c=relaxed/simple;
	bh=b8A0zAtDgHgdySNbkiiN2Py2hl+u3/NaWACsnHEcZGk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I7k7HLKrBI5JDMSmTPfoKwVmd7Ed48mc0LdP1m9T38Gv5eR2xA+qKltoNBfWTrAXzD2yKZPL+OXKoMtMmRwvCJZNl02m5lJR4S8iBzygYitwZ+OCR7fDgrXfjNqCT5eWtq14lyLyFqFbRbDa8qseZMickM9BZeg6EkyHTdnIwOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4BBzjYn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239678; x=1741775678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b8A0zAtDgHgdySNbkiiN2Py2hl+u3/NaWACsnHEcZGk=;
  b=C4BBzjYn/UQiZTj9M7rdE6ao0UysAwnOfGYt5ac8Vo31EB8C1qmF8hSt
   Jd9zkdGo8DMYvp+J4uSa3SiapEsjciGbNbtXEfclDthKjKUbx7WlnOw2a
   OiD/ZApg0uup5H1kROY+aTqcA/MNP5cIraaJJRFzMTVymd5NJyQ8dtwu7
   9NDyKy/BeBMQleSv0TnzalPco9tbWEtYPT0wfgkjmRR86DQDQ6uRJeq9w
   c3m3pFZp0XIrGAsQPv/syfAW1fAi9jnmtfwyFM+XKsbPEa9pta2q9e/n+
   aISiwWJwo3QW9O8oI5000Pi3fJ2i1tVD9y0O1X/REUuKWiZZSSpBqBCwM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4794318"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4794318"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16194096"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:37 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4069111FB89;
	Tue, 12 Mar 2024 12:34:34 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v3 16/26] media: mc: Postpone graph object removal until free
Date: Tue, 12 Mar 2024 12:34:12 +0200
Message-Id: <20240312103422.216484-17-sakari.ailus@linux.intel.com>
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


