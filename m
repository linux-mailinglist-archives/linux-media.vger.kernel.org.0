Return-Path: <linux-media+bounces-12825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22222901ED0
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81D7BB27C75
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188F577119;
	Mon, 10 Jun 2024 10:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a68ShmmO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84B0768EF
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013950; cv=none; b=ODGfV0hktUWK5LXlj9nQqovcLuUYRT0zHz8t1IaBmPn3AujGLZTbxRROv9c+AgHoZhX0jgd64lXSQwqn7B5DOCRxJ0TMrKIuAV6/E01df8a2509gOjH3pCfY2fp59ZnTh3WBCqhHOZIwycindaqb9YPzeC39kEe++CEv3RhLkS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013950; c=relaxed/simple;
	bh=Q2vBl9qOunJV4jY8YF3rus/ZAZLYNDmEVjWtREu/9So=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Srqw6c808iL3pWy7Sz5otsSW/sTsVoI3by6utUOnPM2rDtiEoOOPGBbuZwYTKf/H+EAQjD+j5iiWfHyPACj79xUelES40UPeZq3O2ruoGabv9wcMC/3w8HQmVYWGGWtqMYC0Zd9flXg4Pzc39yIvGJlLNuZoP8M1ZsjSdMI8Iyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a68ShmmO; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013949; x=1749549949;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q2vBl9qOunJV4jY8YF3rus/ZAZLYNDmEVjWtREu/9So=;
  b=a68ShmmOoxLvkmjbttCBYbCXyz6VJIVbTFx5DlfQkgKTL8PWkr1VAHso
   KwwdFKrckEhEnbyKDeVBe1nVfYNA1/21vq8EVANPsCgIoBteS3tvgDcBY
   DEocMBNkuNVnuRZZS7RtksptHONGuh6n5SehUdnk3SgbWePQHaLJQKb9y
   GybW0jLRSIbeFL9UmarjSmZ5VZDOHPSDskDROw87dJr+4jrfOIczY+XWa
   cGdKO7IOHbpBP8wnRRXXuud8qV3QmK6yS/pqPjGVbTdCpSWzwGdXCaPBu
   sIYSH5dalvgxG+VoSV7hTTElKr0Y1MzO2IgFSN5/YBVBD2KhfBZJMS9q9
   g==;
X-CSE-ConnectionGUID: +Ondn74cSuy5TtBf9GzDHQ==
X-CSE-MsgGUID: EhdziyChQ4uyI11rx7s2gA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819876"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819876"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:45 -0700
X-CSE-ConnectionGUID: 5KGUSuijTrSqB6lq2xBw9Q==
X-CSE-MsgGUID: 03PPfaLmR/mlW8Ta992+9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137333"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:43 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D6366120381;
	Mon, 10 Jun 2024 13:05:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuG-004eCS-2m;
	Mon, 10 Jun 2024 13:05:40 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 02/26] Revert "media: utilize new cdev_device_add helper function"
Date: Mon, 10 Jun 2024 13:05:06 +0300
Message-Id: <20240610100530.1107771-3-sakari.ailus@linux.intel.com>
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

This reverts commit 857313e51006ff51524579bcd8808b70f9a80812. This patch is
temporarily reverted for internal rework.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-core.c | 16 ++++++++++++----
 drivers/media/mc/mc-devnode.c     | 22 ++++++++++++++++------
 2 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 6f940df0230c..3bacfd0ecd83 100644
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
index 22905c1d86e8..d36bc9891f3f 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -239,22 +239,31 @@ int __must_check media_devnode_register(struct media_device *mdev,
 	dev_set_name(&devnode->dev, "media%d", devnode->minor);
 	device_initialize(&devnode->dev);
 
-	/* Part 2: Initialize the character device */
+	/* Part 2: Initialize and register the character device */
 	cdev_init(&devnode->cdev, &media_devnode_fops);
 	devnode->cdev.owner = owner;
+	devnode->cdev.kobj.parent = &devnode->dev.kobj;
 	kobject_set_name(&devnode->cdev.kobj, "media%d", devnode->minor);
 
-	/* Part 3: Add the media and char device */
 	set_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
-	ret = cdev_device_add(&devnode->cdev, &devnode->dev);
+	ret = cdev_add(&devnode->cdev, MKDEV(MAJOR(media_dev_t),
+					     devnode->minor), 1);
 	if (ret < 0) {
-		clear_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
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
 	return 0;
 
+device_add_error:
+	cdev_del(&devnode->cdev);
 cdev_add_error:
 	mutex_lock(&media_devnode_lock);
 	clear_bit(devnode->minor, media_devnode_nums);
@@ -274,9 +283,10 @@ void media_devnode_unregister(struct media_devnode *devnode)
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


