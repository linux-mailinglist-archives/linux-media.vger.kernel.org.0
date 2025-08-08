Return-Path: <linux-media+bounces-39119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BFAB1E7DF
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 14:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B249E5612E3
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 12:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EE7025D1E6;
	Fri,  8 Aug 2025 12:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i++harGg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109561CAB3
	for <linux-media@vger.kernel.org>; Fri,  8 Aug 2025 12:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754654585; cv=none; b=mxVSvDtWn1Ri/3/D+2mwEXJbnRgyjv/xeNwUMNkEnxWgBJ/3Z2c4EIhl4ZWQIq7m3lXMZOF0VnfmMkYGGmszM6hr4urBeQ5hjcz+Yp80qb6rag1otjHzXV7Klj+UQ3WXdQG3/Kuw/ZvkyVe2SNB3rNSgjp+4FvMaFEYGTxnjfw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754654585; c=relaxed/simple;
	bh=cUITcdE7RK60lfECMr0illf/GsVKN3pLzr8LO8L44wg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a5/NxxK3HQZ0Ni+Y7ixkJ/8ObS3bnoyBXPBZ/4y3c3CIFOB1nv3NOROLhGKbFCMTSN12oCZ4NPwBy6Jr4HdeNPj8+ci++vstSkSLQhD67kgjstuX47obGJ8+0avi8fUbvmhaja6sdRE1nt5twENtmtQI4iugxgijwzCdceec4xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i++harGg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754654584; x=1786190584;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cUITcdE7RK60lfECMr0illf/GsVKN3pLzr8LO8L44wg=;
  b=i++harGg5kQI5fYQ25h0H3djvrpJr1r9jiKLEg6lhKTzKZvGbqp8bo2Y
   xz67sTZbJQA8l3Vanm9QDxETdL1fYYSJV2nFyH3lisNgVKjYgwHdQdiG/
   m3WeWKoLDEJDCzR5lkom7eE5ZS4SoLTPgUKtDEUWEO43ogA7w/iMCP+e0
   78zkoVuc4NHbrjMr9++kTbJQdb4oC/heVmCroXB83tSk6zH0KTJYh2v7N
   TwgUlI4Tkg661O3jtCcqqJhU52/dQ6ZOHmk58PADo9MO9q+siwBigiyyR
   dwmeoADImTYOh0TPP+Px5uRkzIxrcRL1o9YhSrHIrEBU8dxdlpoFHvJuK
   Q==;
X-CSE-ConnectionGUID: icYaVrBDQ3CLNCj5R/SGHw==
X-CSE-MsgGUID: oF4Me4AnQ5Wmlhr0I9C93A==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="59615481"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="59615481"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 05:03:03 -0700
X-CSE-ConnectionGUID: UBSHv8XvQyGHTc7y5zlAcQ==
X-CSE-MsgGUID: EapcKZVKQR6jojFwEVC0BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="170692589"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.151])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 05:03:03 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C857611F87B;
	Fri,  8 Aug 2025 15:02:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1ukLoJ-008s61-2F;
	Fri, 08 Aug 2025 15:02:59 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [PATCH 1/1] media: vim2m: Remove compilation conditional to CONFIG_MEDIA_CONTROLLER
Date: Fri,  8 Aug 2025 15:02:59 +0300
Message-Id: <20250808120259.2114561-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MEDIA_CONTROLLER is selected for vim2m already since commit 016baa59bf9f
("media: Kconfig: Don't expose the Request API option"). Also remove the
related #ifdefs.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/test-drivers/vim2m.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index 1d1a9e768505..80ffd8e3dd62 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -191,9 +191,7 @@ static void get_alignment(u32 fourcc,
 struct vim2m_dev {
 	struct v4l2_device	v4l2_dev;
 	struct video_device	vfd;
-#ifdef CONFIG_MEDIA_CONTROLLER
 	struct media_device	mdev;
-#endif
 
 	atomic_t		num_inst;
 	struct mutex		dev_mutex;
@@ -1470,9 +1468,7 @@ static void vim2m_device_release(struct video_device *vdev)
 
 	v4l2_device_unregister(&dev->v4l2_dev);
 	v4l2_m2m_release(dev->m2m_dev);
-#ifdef CONFIG_MEDIA_CONTROLLER
 	media_device_cleanup(&dev->mdev);
-#endif
 	kfree(dev);
 }
 
@@ -1543,7 +1539,6 @@ static int vim2m_probe(struct platform_device *pdev)
 		goto error_dev;
 	}
 
-#ifdef CONFIG_MEDIA_CONTROLLER
 	dev->mdev.dev = &pdev->dev;
 	strscpy(dev->mdev.model, "vim2m", sizeof(dev->mdev.model));
 	strscpy(dev->mdev.bus_info, "platform:vim2m",
@@ -1551,7 +1546,6 @@ static int vim2m_probe(struct platform_device *pdev)
 	media_device_init(&dev->mdev);
 	dev->mdev.ops = &m2m_media_ops;
 	dev->v4l2_dev.mdev = &dev->mdev;
-#endif
 
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
 	if (ret) {
@@ -1562,7 +1556,6 @@ static int vim2m_probe(struct platform_device *pdev)
 	v4l2_info(&dev->v4l2_dev,
 		  "Device registered as /dev/video%d\n", vfd->num);
 
-#ifdef CONFIG_MEDIA_CONTROLLER
 	ret = v4l2_m2m_register_media_controller(dev->m2m_dev, vfd,
 						 MEDIA_ENT_F_PROC_VIDEO_SCALER);
 	if (ret) {
@@ -1575,13 +1568,11 @@ static int vim2m_probe(struct platform_device *pdev)
 		v4l2_err(&dev->v4l2_dev, "Failed to register mem2mem media device\n");
 		goto error_m2m_mc;
 	}
-#endif
+
 	return 0;
 
-#ifdef CONFIG_MEDIA_CONTROLLER
 error_m2m_mc:
 	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
-#endif
 error_v4l2:
 	video_unregister_device(&dev->vfd);
 	/* vim2m_device_release called by video_unregister_device to release various objects */
@@ -1602,10 +1593,8 @@ static void vim2m_remove(struct platform_device *pdev)
 
 	v4l2_info(&dev->v4l2_dev, "Removing " MEM2MEM_NAME);
 
-#ifdef CONFIG_MEDIA_CONTROLLER
 	media_device_unregister(&dev->mdev);
 	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
-#endif
 	video_unregister_device(&dev->vfd);
 }
 
-- 
2.39.5


