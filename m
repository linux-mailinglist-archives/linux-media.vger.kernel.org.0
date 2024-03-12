Return-Path: <linux-media+bounces-6881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5C1879225
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D3B61C211F5
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 10:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E86879B8A;
	Tue, 12 Mar 2024 10:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwkFRzDx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363EE79B66
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239677; cv=none; b=DwKnLVMrqszhIyvXV5+Ha7mzykZpz1iKdewKnYFAva4xJ464xsAn2eGg3k0bbAgGp9yavmUsRty4e0Bmo1gzZeDbcLZUqvcsS3EqCUVg76z8dKuDIJuITv6JBHs+uCPsxP7CtYg0N/BlSN+rTjotCNIjzkfEf4GIQGZ5iFfVRNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239677; c=relaxed/simple;
	bh=tM6zZKGkriDI1MbccPv6yeW0LtSVx/9DN3hcT1x3INw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c5gyLFX38ZB0i+4Ig6ugm+eZVvMdJmXLoY6l9uOMQx61MW8vupx9IcsKdPSO6eamROeqNAMuq+rBZYuoN4gkRJcp/IGkkO1r0JxqADgeWjqOOlS+oA3sFEfGrJJfri+w0HTgUS7LvzZThXvIUBuTSu4L8086zEpuQXnkme7svHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwkFRzDx; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239676; x=1741775676;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tM6zZKGkriDI1MbccPv6yeW0LtSVx/9DN3hcT1x3INw=;
  b=dwkFRzDxk9feiE15n57IJg8szCQiK5ay9VZPW6xLa7h38arjQ/iAhuQO
   JopTk9bIYZd8OlxRWNdwNFaZDkhbG9Mru0XMDBMxg5o/oBo+xg/4hJ27J
   0Zl7t/ucV5lyfv8XJWa5P1+2IlBEZPxvbXfgw/oheEiTVjuMxACmIn6aU
   wXaEhwAfzIO5LqqYhVCCK3cgvIYNB2FyHcC8WtNf0K8f9PxTGDVt651bJ
   QGRPdPAgUmbjAjLE/u87tJyfc/qNZqvlYWMHIXsBh3NsVkKe6g4gUN4i7
   0Fi77gFnoic9g8UU7GREQioDtkTHHEcKRImO169Ep1Fe5kZ6yQtRBHQzp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4794301"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4794301"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16194090"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:35 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B4B9C11F819;
	Tue, 12 Mar 2024 12:34:31 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v3 12/26] media: mc: Shuffle functions around
Date: Tue, 12 Mar 2024 12:34:08 +0200
Message-Id: <20240312103422.216484-13-sakari.ailus@linux.intel.com>
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

As the call paths of the functions in question will change, move them
around in anticipation of that. No other changes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/mc/mc-device.c | 54 ++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index dd4d589a6701..f1f3addf7932 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -673,6 +673,33 @@ void media_device_unregister_entity(struct media_entity *entity)
 }
 EXPORT_SYMBOL_GPL(media_device_unregister_entity);
 
+void media_device_register_entity_notify(struct media_device *mdev,
+					struct media_entity_notify *nptr)
+{
+	mutex_lock(&mdev->graph_mutex);
+	list_add_tail(&nptr->list, &mdev->entity_notify);
+	mutex_unlock(&mdev->graph_mutex);
+}
+EXPORT_SYMBOL_GPL(media_device_register_entity_notify);
+
+/*
+ * Note: Should be called with mdev->lock held.
+ */
+static void __media_device_unregister_entity_notify(struct media_device *mdev,
+					struct media_entity_notify *nptr)
+{
+	list_del(&nptr->list);
+}
+
+void media_device_unregister_entity_notify(struct media_device *mdev,
+					struct media_entity_notify *nptr)
+{
+	mutex_lock(&mdev->graph_mutex);
+	__media_device_unregister_entity_notify(mdev, nptr);
+	mutex_unlock(&mdev->graph_mutex);
+}
+EXPORT_SYMBOL_GPL(media_device_unregister_entity_notify);
+
 void media_device_init(struct media_device *mdev)
 {
 	INIT_LIST_HEAD(&mdev->entities);
@@ -740,33 +767,6 @@ int __must_check __media_device_register(struct media_device *mdev,
 }
 EXPORT_SYMBOL_GPL(__media_device_register);
 
-void media_device_register_entity_notify(struct media_device *mdev,
-					struct media_entity_notify *nptr)
-{
-	mutex_lock(&mdev->graph_mutex);
-	list_add_tail(&nptr->list, &mdev->entity_notify);
-	mutex_unlock(&mdev->graph_mutex);
-}
-EXPORT_SYMBOL_GPL(media_device_register_entity_notify);
-
-/*
- * Note: Should be called with mdev->lock held.
- */
-static void __media_device_unregister_entity_notify(struct media_device *mdev,
-					struct media_entity_notify *nptr)
-{
-	list_del(&nptr->list);
-}
-
-void media_device_unregister_entity_notify(struct media_device *mdev,
-					struct media_entity_notify *nptr)
-{
-	mutex_lock(&mdev->graph_mutex);
-	__media_device_unregister_entity_notify(mdev, nptr);
-	mutex_unlock(&mdev->graph_mutex);
-}
-EXPORT_SYMBOL_GPL(media_device_unregister_entity_notify);
-
 void media_device_unregister(struct media_device *mdev)
 {
 	struct media_entity *entity;
-- 
2.39.2


