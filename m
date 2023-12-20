Return-Path: <linux-media+bounces-2762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B59D819CE9
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:37:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2901B24C93
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9A820B11;
	Wed, 20 Dec 2023 10:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CeYpKJnB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6500208CB
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703068641; x=1734604641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0yFGytW7x2A6ZfvHtRLSwiouOMVOj1u806YhOcEW060=;
  b=CeYpKJnBtvCC/4lwr01527aIqQreY/LlkOpeYEuOym8y1Phae1GOLRX2
   6nVtBKp5lSpTWIvua0W1NDxY160J8WxMotq31bXKPI8q6+tYDem3jUsyG
   aiDFPzBX0ayMA5XIKrJG+VfkcyL8GkBYktNHREu3NFC6gTU8PGD2K1NOW
   ISNZVZmp68n0qayZKDDSuprA8CtRy63eojw4y1xPSZ4Xdzjqql/wQYYkU
   p2C8htjd1Sl3H6aVZJmFPSV8dMhQSacBY8cCh3QLzRSv6U7sRxMmNUyEp
   kFUvvTcwgS55kVSkia+TlVXoUS9ZdlP2mOt1DeF9Y0IaXndej6gIwrcUx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9174304"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9174304"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769544229"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769544229"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:17 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 299721201D0;
	Wed, 20 Dec 2023 12:37:15 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 02/29] Revert "media: utilize new cdev_device_add helper function"
Date: Wed, 20 Dec 2023 12:36:46 +0200
Message-Id: <20231220103713.113386-3-sakari.ailus@linux.intel.com>
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

This reverts commit 857313e51006ff51524579bcd8808b70f9a80812. This patch is
temporarily reverted for internal rework.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-core.c | 16 ++++++++++++----
 drivers/media/mc/mc-devnode.c     | 21 ++++++++++++++++-----
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 7e153c5cad04..0645e68411fb 100644
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
index 0ab33214d243..740573552e5d 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -240,23 +240,33 @@ int __must_check media_devnode_register(struct media_device *mdev,
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
@@ -276,9 +286,10 @@ void media_devnode_unregister(struct media_devnode *devnode)
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


