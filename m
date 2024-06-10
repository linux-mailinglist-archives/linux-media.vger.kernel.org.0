Return-Path: <linux-media+bounces-12824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A92BB901ECE
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:06:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CD821C21456
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F17042AA1;
	Mon, 10 Jun 2024 10:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LkZE0Y/6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B73768E7
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013950; cv=none; b=cLw90agW9U+6kZ9fFvZVAfl4I1ODKWt8ISFv2ehUj867RO46AMafeAjewvPjREChaR1f8w1HlCNriFJj+vgs2eywy4M+BcT/CQ+SP99fy+xD3+wu2ErvzJb6mMiGOEzDYvdWGRG+ZpDiFrxp2R1qeH/K8zQlRL/rxfzD482Du7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013950; c=relaxed/simple;
	bh=ucMQcGs1aaFfr8olSphZarmM4nijLgdBjvG6Iz2CVu8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CVherpHEvSo+s66FMwPxXU6JZ+vkMI4wGQhQV2zV2R7vlI9YQqqifXUk5vPU9ule9hb72rL4BJrqegtukm6SYabWX4+ZWcp174zAfXWz0Fe2zSfcDHyUv0YWMCHFU689Y8boxgIn4+OTRFOVzWdGrBcnoiqWbof9vFRzQNg8EEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LkZE0Y/6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013949; x=1749549949;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ucMQcGs1aaFfr8olSphZarmM4nijLgdBjvG6Iz2CVu8=;
  b=LkZE0Y/61tUn04Nn4hLC88fP0/uGASuwqSTZQa+Wc1bnJl7Ls2LHVICC
   SEYPdSB4pjE6BIjZYRMXau7zOwhBUn2CbAo9RKrhFC24nYf7Qhob+kAbT
   3iBGwArb8CWwv51B5cv1hc+DWYtDVpbeGEmki6+RMkMZq3dTWcgy3+fGs
   7HqgVhzSOBQ8xHMduTzguZds9wyq9bAfmEzuWSqrHzUjOr4OYyhXryvsD
   ftlz9clKNYwxkYXv8skuFqNBxSAhuUAOCuLR8oGRzmBAQye92NXJTrnqo
   1O+JAxPoaoALY5MWlfXj7h2sWkhaUQO5PTEk9F1ye+9s6RSr59H+WgZ4l
   w==;
X-CSE-ConnectionGUID: AJllcVUwRHqOogIDEBDCcg==
X-CSE-MsgGUID: Awy+ImybSuuq0y4amCnYSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819873"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819873"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:45 -0700
X-CSE-ConnectionGUID: QhIgeWlUTw+Eqxts6mF7zg==
X-CSE-MsgGUID: y5fZuSQJShOTaxk4YOcpWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137332"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:43 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DFD07120688;
	Mon, 10 Jun 2024 13:05:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuG-004eCd-2t;
	Mon, 10 Jun 2024 13:05:40 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 04/26] media: mc, cec: Make use of cdev_device_add() again
Date: Mon, 10 Jun 2024 13:05:08 +0300
Message-Id: <20240610100530.1107771-5-sakari.ailus@linux.intel.com>
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

Bring back cdev_device_add() to Media controller and CEC frameworks after
briefly being removed for reverting other, unrelated patches.

The original commit is 857313e51006ff51524579bcd8808b70f9a80812.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/cec/core/cec-core.c | 16 ++++------------
 drivers/media/mc/mc-devnode.c     | 25 ++++++++++---------------
 2 files changed, 14 insertions(+), 27 deletions(-)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 3bacfd0ecd83..764ec73b0bb0 100644
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
index bc223a427020..64bbff0f90cd 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -232,37 +232,32 @@ int __must_check media_devnode_register(struct media_device *mdev,
 	devnode->minor = minor;
 	devnode->media_dev = mdev;
 
-	/* Part 2: Initialize and register the character device */
+	/* Part 2: Initialize the media and character devices */
 	cdev_init(&devnode->cdev, &media_devnode_fops);
 	devnode->cdev.owner = owner;
 	kobject_set_name(&devnode->cdev.kobj, "media%d", devnode->minor);
 
-	set_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
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
+	set_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
+	ret = cdev_device_add(&devnode->cdev, &devnode->dev);
 	if (ret < 0) {
-		pr_err("%s: device_register failed\n", __func__);
-		goto error;
+		pr_err("%s: cdev_device_add failed\n", __func__);
+		goto cdev_add_error;
 	}
 
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


