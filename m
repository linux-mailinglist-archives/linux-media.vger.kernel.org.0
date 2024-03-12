Return-Path: <linux-media+bounces-6871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F98A87921A
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A35551F21D89
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 10:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C90D35F18;
	Tue, 12 Mar 2024 10:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h4d4LaBq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416434176D
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239671; cv=none; b=oiUqD23kAmCTSq/EJlkA4hT96dqKlPB9xBtC4n+IkuVS3J3oKtoHv8y5XcVxV+Qx7FIh1XsMe1ffBIzuV3bfQFNpVHN+Xj6IbbYfXIGidnC+c6tSjDrxBla+PzpLSRZ1VL/7Hrc8tVyHpjeQ0ihfo1xH0SmYjKNuua18oMbnbus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239671; c=relaxed/simple;
	bh=hGMHWbk+42dOTjRmgjMTR3uqtbd8CE5teAWCzPI0P7M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hNrR/iGi3aYfv4VeAMvuo5PYr7RMjDr+YbVLypf0JCAj06/6hCFaPJVPrKfirfV0ZlWB/IVxM+QohebIMzmkr7WeDIScrWVD+KpmFNvZiTzBO8ikTiERfU8Sro02ZQtCUmgLWaSlN0gZOcaRAwMPdzmoukQHkeJC5w3b3SrnfqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h4d4LaBq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239670; x=1741775670;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hGMHWbk+42dOTjRmgjMTR3uqtbd8CE5teAWCzPI0P7M=;
  b=h4d4LaBqfRMTYbqRJL7C2Jhv6MMJyHjRViVgp3AJJbH0Ze39jJx0/S92
   WJEAE4hf8rSecVA0szw32d2w+2Kl1SPfT+w7zyqw+RLJWMewSPUrQipz/
   oxt6OwN0z6PCo+pmq/XK/W/UxeVytOtqpkMI7rRJCarI50+VfQ9HC/wk8
   HjgeL+8C5SIw/Ih1pn7RwDWgoHUwf4U2q9cnRJH4HlSssZpvEhYkZheKF
   ppretG1KFDK+YFJAs0ecXBJeu0xS7ANDF8VYLcyHed67vpumj9EL7pK6K
   xfQC4jU9g8gch0zSRu+SIMXD/ZSwdhk4SzUvswm5BB/hocVUQ9XycVHyg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4794258"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4794258"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16194058"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:28 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EAB7011FB11;
	Tue, 12 Mar 2024 12:34:24 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v3 02/26] Revert "media: utilize new cdev_device_add helper function"
Date: Tue, 12 Mar 2024 12:33:58 +0200
Message-Id: <20240312103422.216484-3-sakari.ailus@linux.intel.com>
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

This reverts commit 857313e51006ff51524579bcd8808b70f9a80812. This patch is
temporarily reverted for internal rework.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-core.c | 16 ++++++++++++----
 drivers/media/mc/mc-devnode.c     | 21 ++++++++++++++++-----
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 5a54db839e5d..3e0c0dcff358 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -137,19 +137,26 @@ static int __must_check cec_devnode_register(struct cec_devnode *devnode,
 
 	/* Part 2: Initialize and register the character device */
 	cdev_init(&devnode->cdev, &cec_devnode_fops);
+	devnode->cdev.kobj.parent = &devnode->dev.kobj;
 	devnode->cdev.owner = owner;
 	kobject_set_name(&devnode->cdev.kobj, "cec%d", devnode->minor);
 
 	devnode->registered = true;
-	ret = cdev_device_add(&devnode->cdev, &devnode->dev);
-	if (ret) {
+	ret = cdev_add(&devnode->cdev, devnode->dev.devt, 1);
+	if (ret < 0) {
+		pr_err("%s: cdev_add failed\n", __func__);
 		devnode->registered = false;
-		pr_err("%s: cdev_device_add failed\n", __func__);
 		goto clr_bit;
 	}
 
+	ret = device_add(&devnode->dev);
+	if (ret)
+		goto cdev_del;
+
 	return 0;
 
+cdev_del:
+	cdev_del(&devnode->cdev);
 clr_bit:
 	mutex_lock(&cec_devnode_lock);
 	clear_bit(devnode->minor, cec_devnode_nums);
@@ -195,7 +202,8 @@ static void cec_devnode_unregister(struct cec_adapter *adap)
 	cec_adap_enable(adap);
 	mutex_unlock(&adap->lock);
 
-	cdev_device_del(&devnode->cdev, &devnode->dev);
+	device_del(&devnode->dev);
+	cdev_del(&devnode->cdev);
 	put_device(&devnode->dev);
 }
 
diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 302328f51417..7827e9519382 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -239,23 +239,33 @@ int __must_check media_devnode_register(struct media_device *mdev,
 	dev_set_name(&devnode->dev, "media%d", devnode->minor);
 	device_initialize(&devnode->dev);
 
-	/* Part 2: Initialize the character device */
+	/* Part 2: Initialize and register the character device */
 	cdev_init(&devnode->cdev, &media_devnode_fops);
 	devnode->cdev.owner = owner;
+	devnode->cdev.kobj.parent = &devnode->dev.kobj;
 	kobject_set_name(&devnode->cdev.kobj, "media%d", devnode->minor);
 
-	/* Part 3: Add the media and char device */
-	ret = cdev_device_add(&devnode->cdev, &devnode->dev);
+	ret = cdev_add(&devnode->cdev, MKDEV(MAJOR(media_dev_t),
+					     devnode->minor), 1);
 	if (ret < 0) {
-		pr_err("%s: cdev_device_add failed\n", __func__);
+		pr_err("%s: cdev_add failed\n", __func__);
 		goto cdev_add_error;
 	}
 
+	/* Part 3: Add the media device */
+	ret = device_add(&devnode->dev);
+	if (ret < 0) {
+		pr_err("%s: device_add failed\n", __func__);
+		goto device_add_error;
+	}
+
 	/* Part 4: Activate this minor. The char device can now be used. */
 	set_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
 
 	return 0;
 
+device_add_error:
+	cdev_del(&devnode->cdev);
 cdev_add_error:
 	mutex_lock(&media_devnode_lock);
 	clear_bit(devnode->minor, media_devnode_nums);
@@ -275,9 +285,10 @@ void media_devnode_unregister(struct media_devnode *devnode)
 	mutex_lock(&media_devnode_lock);
 	clear_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
 	/* Delete the cdev on this minor as well */
-	cdev_device_del(&devnode->cdev, &devnode->dev);
+	cdev_del(&devnode->cdev);
 	devnode->media_dev = NULL;
 	mutex_unlock(&media_devnode_lock);
+	device_del(&devnode->dev);
 
 	put_device(&devnode->dev);
 }
-- 
2.39.2


