Return-Path: <linux-media+bounces-2767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 281F1819CEE
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 909FF1F21F17
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE29D20DFF;
	Wed, 20 Dec 2023 10:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nvw8XPe9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67229208CE
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703068642; x=1734604642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zfyjOPPGPExsCBpco+FV+gtpUcFP8ASz6xiOXmFUrI0=;
  b=nvw8XPe9B4o9rjD1PI3Fd/pdpnxTD/zsSTJNuojgGO+6PwvXWdv9rQQC
   tDTUYsko5YAErWDkYVzkZy5mJkRM0Cxjxnv4nsrtNpaMG13Jaku/54Q+4
   pYWZukbJvEJQ++XcMevbIh1DfTBkturl+ycPHQDCY4DzQpYKIJV2N8VXJ
   e0crfZS6rskrj7GvWkYtAlQAyu6Bx2MiI3eJXhPCs6mDP5XcK34K6NXfS
   UPaDUe2gTsiEj23+7S2JKhRtnFrqPX33Q3yCHhE5pKobs5NxBz5vOWR/b
   JapQRwaTyOwAMneznjbFK1jDbUaLfZLibAh6jNeOcFIRgkJpsGOQMvQrD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9174314"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9174314"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769544233"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769544233"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:19 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 55130120706;
	Wed, 20 Dec 2023 12:37:16 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 04/29] media: mc: utilize new cdev_device_add helper function
Date: Wed, 20 Dec 2023 12:36:48 +0200
Message-Id: <20231220103713.113386-5-sakari.ailus@linux.intel.com>
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

From: Logan Gunthorpe <logang@deltatee.com>

Replace the open coded registration of the cdev and dev with the
new device_add_cdev() helper. The helper replaces a common pattern by
taking the proper reference against the parent device and adding both
the cdev and the device.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/media/cec/core/cec-core.c | 16 ++++------------
 drivers/media/mc/mc-devnode.c     | 23 +++++++++--------------
 2 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 0645e68411fb..15494b46458a 100644
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
index 1e1792c3ae3f..fabcd646679b 100644
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


