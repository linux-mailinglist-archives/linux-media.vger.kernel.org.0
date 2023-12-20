Return-Path: <linux-media+bounces-2776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F67819CF7
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:38:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE9F8B215B0
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B450921371;
	Wed, 20 Dec 2023 10:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H4OP9f27"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF34221340
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703068649; x=1734604649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+d7iJXIRHrUkm3+oWHno0huhYBxKZlBeeISLKQ+MAYQ=;
  b=H4OP9f27dRyH7l3JlVOJd+2APAzTXWFvFbE/Uuzq/L/5LgRiLDU+2ZzI
   k3PfSZTv+BK/PwpthTakWHBfIvj5sO4o+hCs/OSsCNeqR2vPl0MJLTzWq
   WWNLPMy+RyC7jZ1GoIcw/TAq1u+rf1Vb3QuluQHMK0K9hDGmQoHdM7dX+
   OIuoJu40rwsfOaqK1MLz76FWOfMBv1SoD+DxYfE4qSrqMfv4p2tlDeY7t
   4JvyODjcw4c8CuS05H7zkrYDRizZIHndcPLRK02aFgbIVkTl3bNlqvSlz
   MjfizmQd50OtSX121Hm9v2wiYiWakMx0u8y1gDTWBoRwgtkbLgQ/ujbth
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9174356"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9174356"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769544258"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769544258"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:26 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D509512098A;
	Wed, 20 Dec 2023 12:37:23 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 15/29] media: mc: Unassign minor only if it has been assigned
Date: Wed, 20 Dec 2023 12:36:59 +0200
Message-Id: <20231220103713.113386-16-sakari.ailus@linux.intel.com>
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

Assign the media device minor to -1 if it has not been previously
assigned. There's no dependence to this yes but it will be required by
patch "media: mc: Implement best effort media device removal safety sans
refcount" soon.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-devnode.c | 9 ++++++++-
 include/media/media-devnode.h | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 717408791a7c..5057c48f8870 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -59,7 +59,8 @@ static void media_devnode_release(struct device *cd)
 {
 	struct media_devnode *devnode = to_media_devnode(cd);
 
-	media_devnode_free_minor(devnode->minor);
+	if (devnode->minor != -1)
+		media_devnode_free_minor(devnode->minor);
 
 	/* Release media_devnode and perform other cleanups as needed. */
 	if (devnode->release)
@@ -212,6 +213,7 @@ static const struct file_operations media_devnode_fops = {
 void media_devnode_init(struct media_devnode *devnode)
 {
 	device_initialize(&devnode->dev);
+	devnode->minor = -1;
 }
 
 int __must_check media_devnode_register(struct media_devnode *devnode,
@@ -220,6 +222,9 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
 	int minor;
 	int ret;
 
+	if (devnode->minor != -1)
+		return -EINVAL;
+
 	/* Part 1: Find a free minor number */
 	mutex_lock(&media_devnode_lock);
 	minor = find_first_zero_bit(media_devnode_nums, MEDIA_NUM_DEVICES);
@@ -261,6 +266,8 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
 cdev_add_error:
 	media_devnode_free_minor(devnode->minor);
 
+	devnode->minor = -1;
+
 	return ret;
 }
 
diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
index 6d46c658be21..d050f54f252a 100644
--- a/include/media/media-devnode.h
+++ b/include/media/media-devnode.h
@@ -60,7 +60,7 @@ struct media_file_operations {
  * @dev:	pointer to struct &device containing the media controller device
  * @cdev:	struct cdev pointer character device
  * @parent:	parent device
- * @minor:	device node minor number
+ * @minor:	device node minor number, -1 if unassigned
  * @flags:	flags, combination of the ``MEDIA_FLAG_*`` constants
  * @release:	release callback called at the end of ``media_devnode_release()``
  *		routine at media-device.c.
-- 
2.39.2


