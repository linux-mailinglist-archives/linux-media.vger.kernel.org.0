Return-Path: <linux-media+bounces-6879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E0B879223
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:35:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 492691F21E88
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 10:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A2679B77;
	Tue, 12 Mar 2024 10:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F2826sjN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB1578B46
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239676; cv=none; b=XxAzbUsSzP2UhldqJunCq/UK48GjAohAb9pcU3viVGtsvI1iJFZvIuCOAkjFibxMZ5oSsGCo68fYuHBR7Y4SeYFmrm4qmUr4R90vHLIj0Gtq/jz7g6885jLI4Xn3KPFc5JPnF1tlmSdOVTS16OWPMG0I/4DzJhYwd6eiJA5oYEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239676; c=relaxed/simple;
	bh=m4PnEBFUNTnx84fAG11/MiRlWNZSJbIncWd/WAbUDoE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=knTWbAc+0Dz30nH1pgAq0Gjsv+C+X8BqxqFVCuLIX6MTR+9yaAHxp/t5/NtDKDw1fbtN0PDmt+UwFLxTrV93Nr/0p+u/p9xPf2mpv+bgy+SlZlphPu2R7Hpm6gjzEIWueFN1boIBlFTVAQdEj2s0jfcD+Z2Np/QwtlccvqiBw0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F2826sjN; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239675; x=1741775675;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m4PnEBFUNTnx84fAG11/MiRlWNZSJbIncWd/WAbUDoE=;
  b=F2826sjNPV9tkt1scilbMwc2joNnePg5CTzLL/YL90FHer2/fBHJHRlF
   IaxHel/PKPUssXIxf09aJnW4D+bY0Vb510xjIt79kMrv42aLItZQtQHF7
   7wDZeb+v1vOXwuSPqa/ueZ99ZvVTuO6tubzkvIU7bvqxMKYuJVC0iNA2v
   H7c4H8OXgv08ASo6aGkoEIjZ1LJTs8ZOHdbLklhckpFR2agyH40oj95Z/
   euTJ741UWgMsWatEOyCvVfXGmXsnO27VNCaKa1XxD0JI4D/7QGWbdr60y
   jTAhZsCc+GPgRSp2DfPrr3tF/8RmXB/qfxA/sLnDz+1WM1mECYNfjbU7z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4794294"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4794294"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16194085"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:33 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5C72511FB89;
	Tue, 12 Mar 2024 12:34:30 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v3 10/26] media: mc: Clear minor number reservation at unregistration time
Date: Tue, 12 Mar 2024 12:34:06 +0200
Message-Id: <20240312103422.216484-11-sakari.ailus@linux.intel.com>
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

Clear the media device's minor number reservation at unregister time as
there's no need to keep it reserved for longer. This makes it possible to
reserve the same minor right after unregistration.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-devnode.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index dbf546853ca9..2538371a90af 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -49,13 +49,6 @@ static void media_devnode_release(struct device *cd)
 {
 	struct media_devnode *devnode = to_media_devnode(cd);
 
-	mutex_lock(&media_devnode_lock);
-
-	/* Mark device node number as free */
-	clear_bit(devnode->minor, media_devnode_nums);
-
-	mutex_unlock(&media_devnode_lock);
-
 	/* Release media_devnode and perform other cleanups as needed. */
 	if (devnode->release)
 		devnode->release(devnode);
@@ -270,6 +263,10 @@ void media_devnode_unregister(struct media_devnode *devnode)
 
 	cdev_del(&devnode->cdev);
 	device_unregister(&devnode->dev);
+
+	mutex_lock(&media_devnode_lock);
+	clear_bit(devnode->minor, media_devnode_nums);
+	mutex_unlock(&media_devnode_lock);
 }
 
 /*
-- 
2.39.2


