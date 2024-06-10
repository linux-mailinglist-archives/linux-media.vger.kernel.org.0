Return-Path: <linux-media+bounces-12834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22973901ED8
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF062B21432
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A837BAF4;
	Mon, 10 Jun 2024 10:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQ3y+IwL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7836778C89
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013955; cv=none; b=tU7DZZAAp/Gd+Q0pPueNt8FY3AEon7qo+KPBdLFZgg7HIpgoSB1CM/2KyzwjOOJG0YWosESpvJBo8T9V5OtubJHJB4fSTUQU7xZgSVPZQu2k/K25z9CFJm0bqJVAutSS7t+kA5OmIKxxfwL4oZFU1eAjs3X/L5ejxekKPgE3sO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013955; c=relaxed/simple;
	bh=tM6zZKGkriDI1MbccPv6yeW0LtSVx/9DN3hcT1x3INw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QaHVJEgrCIXTG1wGwqziADmxw8jy1WxJMzzP5l2/MhxvvWTnDrNUJO6CzsSYZFlna5UdyFDGc+3jQ+p/wP0bqq1Tw2k5ac479UKfIrztv32Z0NxroAFm5Xjxb1CK0rggw1yjwNoqxDdHu58mqu9/IwnvOCv3MxRworKanDmbedM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OQ3y+IwL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013955; x=1749549955;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tM6zZKGkriDI1MbccPv6yeW0LtSVx/9DN3hcT1x3INw=;
  b=OQ3y+IwLN//wVFGlbcZU8tXriO3CWymp5kkvTVoc3lA5CRgpO/3Kes6X
   KHkjRJ3ql26ovL7OMLyFfDppf7Ic0MeRiRyLZvQTsDIqXbYsaCCOS+gA2
   Gftbc9tXtMpxUIiWUYlPEhz9cAhUMUdsUtkqJwa/gGqy+yw0MbZRnDJfN
   HXoM3BGxvvjfInBtLa1jtFbGKFsp5llqU+08f4B+EA71cv6uWWAou655W
   Tav+C4I1uXdmaNNEiKJPRGqkfdjzQ8AFFJvkRy4daw0T+c+6RAuuEW8Fx
   DLUdpeWvHu4AqNL/u/4G9A7KeMcJ5NdfULd+awwERqMNuKM98DgKCXFfP
   A==;
X-CSE-ConnectionGUID: fI2cJ4X/QW2Si5ROJ4lcLw==
X-CSE-MsgGUID: 5T5G19Z1S0Ku423bve0ipg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819922"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819922"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:50 -0700
X-CSE-ConnectionGUID: +Mf9RaJBRCihk7wYrpAAkw==
X-CSE-MsgGUID: xm1Gg891QdeQuJLKFXdLRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137348"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:47 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 18AB0120B86;
	Mon, 10 Jun 2024 13:05:41 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuH-004eDH-0F;
	Mon, 10 Jun 2024 13:05:41 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 12/26] media: mc: Shuffle functions around
Date: Mon, 10 Jun 2024 13:05:16 +0300
Message-Id: <20240610100530.1107771-13-sakari.ailus@linux.intel.com>
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


