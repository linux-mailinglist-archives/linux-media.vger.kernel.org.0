Return-Path: <linux-media+bounces-6877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E82879220
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9876EB2214A
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 10:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC19141C89;
	Tue, 12 Mar 2024 10:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sq49bCG4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13DD7867A
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239675; cv=none; b=F2QuygS9+A+V12+lX/BfG0Ilm9aW8foOlYgN4a0LX+0riRoXSEcNzhS+0SP2helrXABZ1EsdSBr3RvvIaoXyh9+Wwxal1f3VvmAPMXu/hgfjh6idosypOxx8UANbN4mFab2GgQ3xeznAeoWxsIpqKeQAyTVb5S1d0tnk5dHZWhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239675; c=relaxed/simple;
	bh=bbLg7O1l6ZI5zph8yNSYjKyaUdrjlP/AihfL7XBciVc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JYzvndpVoKITjTZpwmr5VHbRgcgAeZX4r2RCBb+HBcPGi6kysJm2CB27AltXi9KgyVV+Oo0uQdw/C/L/1+dZ/I8Yl/S9GFaGnoDag6lvJks3IYzzgSCfKuRs45F1gpsxNRrKBWDdkpmSMy84tZVuqCxGDQjurwoK3cNqx7IpW60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sq49bCG4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239674; x=1741775674;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bbLg7O1l6ZI5zph8yNSYjKyaUdrjlP/AihfL7XBciVc=;
  b=Sq49bCG4WV8wLeN0Et4VKAuNPjruQtvjFkTVmvUrtNRK+48NHcAbvGeE
   6lmqwqVIoQcwoTVhPebAuKu40vEXfaoI4UQPgRDCSth+pGOYTuydwFqeo
   ORY0mpN/ufL1Sj44YRDc371HxJOv9BR44F5oZ/3g5RsmqN8fRdWVAetcF
   BTCYEe749Fa7VBEPJsxQvy7fsQrL+mTXIN8qS6LV6nQ5Fa4J3ckz3b/0e
   x0Ewc376BHXmfe40ikczLNRzXY9/9H/VR3p+6FSxet16L65oPnZST8jbq
   CBTFN7V3Zu31eAOYqwuo0jcB9onsicDsQ6myW53YIm2ZWxzzXMpF/nnY5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4794285"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4794285"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16194068"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:32 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E5F0311FB11;
	Tue, 12 Mar 2024 12:34:28 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v3 08/26] media: mc: Do not call cdev_device_del() if cdev_device_add() fails
Date: Tue, 12 Mar 2024 12:34:04 +0200
Message-Id: <20240312103422.216484-9-sakari.ailus@linux.intel.com>
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

cdev_device_del() is the right function to remove a device when
cdev_device_add() succeeds. If it does not, however, put_device() needs to
be used instead. Fix this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/mc/mc-devnode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 186f585545c2..5696ccf01d81 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -254,9 +254,9 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
 
 cdev_add_error:
 	mutex_lock(&media_devnode_lock);
-	cdev_device_del(&devnode->cdev, &devnode->dev);
 	clear_bit(devnode->minor, media_devnode_nums);
 	mutex_unlock(&media_devnode_lock);
+	put_device(&devnode->dev);
 
 	return ret;
 }
-- 
2.39.2


