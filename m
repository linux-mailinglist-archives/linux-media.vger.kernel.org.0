Return-Path: <linux-media+bounces-6873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6788C87921C
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:34:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 236DE2825DC
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 10:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848EE54FA1;
	Tue, 12 Mar 2024 10:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJh19zML"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5F95730A
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239673; cv=none; b=EoT+h5gGQ1ZC3xP8e87706eMQlvvyaAi3WJ5prSRnd24Lv9ZDe/OMWLuFOEMjxOSkqVwmzUGBIyPqfx2PW30GozoyA6JWg5eNuy9+RaVOa2p9e324NORHaZpax0S/lDCyJKmbfGqOR3VYU+7c1a2NFM7oSxPdGEq8cwTO4rRhsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239673; c=relaxed/simple;
	bh=huJz8vtYoKQIr7RibVp7+Lj+b9OTmQZbPyMn3Sm7kFc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FtP55XCZadD7qIK5lpHiPeHoclBeXUj7hbOgiwTXsoOI6GrI9v694q7zmPFiniOXgOHM8oF/pKdrdgKwsLI1tTM2cZKkr9ZLZnhmZqMgfietHhU3iMwIeC9Dvn69+2A2pnqqQgbbrl2TnMtIj67AaG74gie0n3TbtNCE/kbN1AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJh19zML; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239672; x=1741775672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=huJz8vtYoKQIr7RibVp7+Lj+b9OTmQZbPyMn3Sm7kFc=;
  b=hJh19zMLWSSYxXySTNyU7CLVrEHmuOPxvU1UTLAwE3y79gvnq0absw22
   WKb8wgDL9YdTdvLvW9GOTbu5yoaISi6R9flOF9sS8CFBjSpqf/DYRJ4sE
   BLjev8/1u6kTaVTVYm3raVdwJS3q4D6nwpRzEAUwe+mKrTYX1yQByQJ2O
   Yra1OwtJrYPz8gXNI8RPqysFuhL7SgKWKEUaLHnNJCQUDxNUW3A8JKUYc
   7S9JVQMcvdD0taTVS00pqlCFKmpqLjWZPdJDmuc0w7tWUqttN7exwJ+sB
   Ub54dI6SE3dFFDzdEhKXpA4x6NdiSqkzOFXXNKHdl/6Ax2qXyiHgw4x5C
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4794268"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4794268"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16194062"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:29 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6A2091201F7;
	Tue, 12 Mar 2024 12:34:26 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v3 04/26] media: mc: utilize new cdev_device_add helper function
Date: Tue, 12 Mar 2024 12:34:00 +0200
Message-Id: <20240312103422.216484-5-sakari.ailus@linux.intel.com>
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

From: Logan Gunthorpe <logang@deltatee.com>

Replace the open coded registration of the cdev and dev with the
new device_add_cdev() helper. The helper replaces a common pattern by
taking the proper reference against the parent device and adding both
the cdev and the device.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/media/cec/core/cec-core.c | 16 ++++------------
 drivers/media/mc/mc-devnode.c     | 23 +++++++++--------------
 2 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 3e0c0dcff358..acd2fc979045 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -137,26 +137,19 @@ static int __must_check cec_devnode_register(struct cec_devnode *devnode,
 
 	/* Part 2: Initialize and register the character device */
 	cdev_init(&devnode->cdev, &cec_devnode_fops);
-	devnode->cdev.kobj.parent = &devnode->dev.kobj;
 	devnode->cdev.owner = owner;
 	kobject_set_name(&devnode->cdev.kobj, "cec%d", devnode->minor);
 
 	devnode->registered = true;
-	ret = cdev_add(&devnode->cdev, devnode->dev.devt, 1);
-	if (ret < 0) {
-		pr_err("%s: cdev_add failed\n", __func__);
+	ret = cdev_device_add(&devnode->cdev, &devnode->dev);
+	if (ret) {
+		pr_err("%s: cdev_device_add failed\n", __func__);
 		devnode->registered = false;
 		goto clr_bit;
 	}
 
-	ret = device_add(&devnode->dev);
-	if (ret)
-		goto cdev_del;
-
 	return 0;
 
-cdev_del:
-	cdev_del(&devnode->cdev);
 clr_bit:
 	mutex_lock(&cec_devnode_lock);
 	clear_bit(devnode->minor, cec_devnode_nums);
@@ -202,8 +195,7 @@ static void cec_devnode_unregister(struct cec_adapter *adap)
 	cec_adap_enable(adap);
 	mutex_unlock(&adap->lock);
 
-	device_del(&devnode->dev);
-	cdev_del(&devnode->cdev);
+	cdev_device_del(&devnode->cdev, &devnode->dev);
 	put_device(&devnode->dev);
 }
 
diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index e6ee1382f27d..60dafd3d48ba 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -232,29 +232,24 @@ int __must_check media_devnode_register(struct media_device *mdev,
 	devnode->minor = minor;
 	devnode->media_dev = mdev;
 
-	/* Part 2: Initialize and register the character device */
+	/* Part 2: Initialize the media and character devices */
 	cdev_init(&devnode->cdev, &media_devnode_fops);
 	devnode->cdev.owner = owner;
 	kobject_set_name(&devnode->cdev.kobj, "media%d", devnode->minor);
 
-	ret = cdev_add(&devnode->cdev, MKDEV(MAJOR(media_dev_t),
-					     devnode->minor), 1);
-	if (ret < 0) {
-		pr_err("%s: cdev_add failed\n", __func__);
-		goto error;
-	}
-
-	/* Part 3: Register the media device */
 	devnode->dev.bus = &media_bus_type;
 	devnode->dev.devt = MKDEV(MAJOR(media_dev_t), devnode->minor);
 	devnode->dev.release = media_devnode_release;
 	if (devnode->parent)
 		devnode->dev.parent = devnode->parent;
 	dev_set_name(&devnode->dev, "media%d", devnode->minor);
-	ret = device_register(&devnode->dev);
+	device_initialize(&devnode->dev);
+
+	/* Part 3: Add the media and character devices */
+	ret = cdev_device_add(&devnode->cdev, &devnode->dev);
 	if (ret < 0) {
-		pr_err("%s: device_register failed\n", __func__);
-		goto error;
+		pr_err("%s: cdev_device_add failed\n", __func__);
+		goto cdev_add_error;
 	}
 
 	/* Part 4: Activate this minor. The char device can now be used. */
@@ -262,9 +257,9 @@ int __must_check media_devnode_register(struct media_device *mdev,
 
 	return 0;
 
-error:
+cdev_add_error:
 	mutex_lock(&media_devnode_lock);
-	cdev_del(&devnode->cdev);
+	cdev_device_del(&devnode->cdev, &devnode->dev);
 	clear_bit(devnode->minor, media_devnode_nums);
 	mutex_unlock(&media_devnode_lock);
 
-- 
2.39.2


