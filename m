Return-Path: <linux-media+bounces-2768-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1887E819CEF
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFE2BB25BE3
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2719208DC;
	Wed, 20 Dec 2023 10:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C0Z127t4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF6D20DC3
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703068645; x=1734604645;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ypPxmiCEoMuIT5PCFLOgXYxZd0j5UG09Sj3dfTR8FqA=;
  b=C0Z127t4FQpbwCwppUHwgJ+nWIAWAFf3JnMUhqLYThZWXf8rJdgLCuAo
   zrdUoKThHaxho3okmSgb1FPLqaD8ePdDaez9SYRKM+YYP7zZUUlT215Ui
   3L8x1drSU8FWaCdkFQRssy01u4tYykx51IUoE+f2Dot3WD8M38Y9cJUrS
   F4ioYdmYgQenyJ9VYOvW2t7Gx0V18b78Oxq6BPS+uU2jScd8e8E9aFfN9
   VokTqu9D9wqnbuZzTHQ59xMkaUI6LiuNYsqZPP5evdgML44b0BTl6rb+Z
   7R1PqTPnnxJMhdKYFw9fhmNMNSG/Km1qmhd1IvJDfbPZfg8wUWfLQeNpy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9174327"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9174327"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769544246"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769544246"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:21 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2567F11FB5E;
	Wed, 20 Dec 2023 12:37:19 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 08/29] media: mc: Drop nop release callback
Date: Wed, 20 Dec 2023 12:36:52 +0200
Message-Id: <20231220103713.113386-9-sakari.ailus@linux.intel.com>
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

The release callback is only used to print a debug message. Drop it. (It
will be re-introduced later in a different form.)

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/mc/mc-device.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index d4553a3705f5..c0ea08a8fc31 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -566,11 +566,6 @@ static DEVICE_ATTR_RO(model);
  * Registration/unregistration
  */
 
-static void media_device_release(struct media_devnode *devnode)
-{
-	dev_dbg(devnode->parent, "Media device released\n");
-}
-
 static void __media_device_unregister_entity(struct media_entity *entity)
 {
 	struct media_device *mdev = entity->graph_obj.mdev;
@@ -718,7 +713,6 @@ int __must_check __media_device_register(struct media_device *mdev,
 	/* Register the device node. */
 	mdev->devnode.fops = &media_device_fops;
 	mdev->devnode.parent = mdev->dev;
-	mdev->devnode.release = media_device_release;
 
 	/* Set version 0 to indicate user-space that the graph is static */
 	mdev->topology_version = 0;
-- 
2.39.2


