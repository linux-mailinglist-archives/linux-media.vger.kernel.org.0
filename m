Return-Path: <linux-media+bounces-12845-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 721B1901EE3
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E51F01F272E6
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3B3770FA;
	Mon, 10 Jun 2024 10:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ant2ii7t"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E347E0FB
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013961; cv=none; b=hpWKPxg2reZ0LDnQqLv1pUarTqYseRJYgv1aZIHmDhs8zq2xmy1T57lD+52BSaMtvQ3Sq1WUiGUR/QN5zQ4Ce2NyS3y2obSrZk3t+nWWqD84kof8ldFNygQaoFE5WGzS2Ek+tphEANMpzq/SmK/+VQVwNYPkJlquQQUivehf6Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013961; c=relaxed/simple;
	bh=cniRpn7w2v+7IheGd9rZi7LiUXu7Zbk/Tbks8P8VpEs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E52Cl6kTQ6wLSkC4YZFItVqYVPLhIe1TOfCQjLTAuMu/Qr3lRG0HFWvRj14qK4KtDVughIwF+OPEKPvZhNRlTIGHAeUR+bdjiK4vDrvj9coRwfFdsodx3p3aqmI+gxVC7438WTSN0RB1oFoBPAJV7XcYNdiq34jd1zP2DNQOGCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ant2ii7t; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013960; x=1749549960;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cniRpn7w2v+7IheGd9rZi7LiUXu7Zbk/Tbks8P8VpEs=;
  b=Ant2ii7tLU2iomUjpWGnNXPQvOY0hKfrKRNMrgcjBoSb9Q7bYru3hd1w
   jeJdwP7wHyxWaGnIzA9lZyvtwSCW26WlkDGNe6ht/qt56jGaY4o1Fluu4
   /OkMknDPbqGK4nA7fGeVv7Qws/cbp5sEWuyXYLv9pjSxd9EdTWnscasDq
   nrnPVe1eeZmUM5tNTZwiwdvKnZBabColPmTmahnNny/VIryiipcqRZef3
   syTG4Ts94T+3/m5NPJvvutRhL8Mg80arp2FFTlVR2QAjorAoKHYk8Jsdu
   7flXWaB7WTL4jD6YfMFs5pU4S9ImeJ/G8BoZvTeRPfQFN8FdXPpvMuB+8
   w==;
X-CSE-ConnectionGUID: FcGD2asdTEC+Udcy2HJ/cA==
X-CSE-MsgGUID: 7GREwbhNSzuXfhVfh6CfTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819951"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819951"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:52 -0700
X-CSE-ConnectionGUID: uboZ+2mLTn+bgSSV8CZ7tw==
X-CSE-MsgGUID: s06zcdF6TImZajgSpQLb5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137361"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:50 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4D4B9120BF8;
	Mon, 10 Jun 2024 13:05:41 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuH-004eE0-0v;
	Mon, 10 Jun 2024 13:05:41 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 21/26] media: mc: Add per-file-handle data support
Date: Mon, 10 Jun 2024 13:05:25 +0300
Message-Id: <20240610100530.1107771-22-sakari.ailus@linux.intel.com>
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

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The media devnode core associates devnodes with files by storing the
devnode pointer in the file structure private_data field. In order to
allow tracking of per-file-handle data introduce a new media devnode
file handle structure that stores the devnode pointer, and store a
pointer to that structure in the file private_data field.

Users of the media devnode code (the only existing user being
media_device) are responsible for managing their own subclass of the
media_devnode_fh structure.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Prepare struct media_device_fh to be used for maintaining file handle list
to avoid shuffling things here and there right after.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/mc/mc-device.c  | 14 +++++++++++++-
 drivers/media/mc/mc-devnode.c | 20 +++++++++-----------
 include/media/media-device.h  |  7 +++++++
 include/media/media-devnode.h | 18 +++++++++++++++++-
 include/media/media-fh.h      | 32 ++++++++++++++++++++++++++++++++
 5 files changed, 78 insertions(+), 13 deletions(-)
 create mode 100644 include/media/media-fh.h

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index f1a88edb7573..a9505ab4412d 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -22,6 +22,7 @@
 #include <media/media-device.h>
 #include <media/media-devnode.h>
 #include <media/media-entity.h>
+#include <media/media-fh.h>
 #include <media/media-request.h>
 
 #ifdef CONFIG_MEDIA_CONTROLLER
@@ -35,7 +36,6 @@
 #define MEDIA_ENT_SUBTYPE_MASK			0x0000ffff
 #define MEDIA_ENT_T_DEVNODE_UNKNOWN		(MEDIA_ENT_F_OLD_BASE | \
 						 MEDIA_ENT_SUBTYPE_MASK)
-
 /* -----------------------------------------------------------------------------
  * Userspace API
  */
@@ -47,11 +47,23 @@ static inline void __user *media_get_uptr(__u64 arg)
 
 static int media_device_open(struct file *filp)
 {
+	struct media_device_fh *fh;
+
+	fh = kzalloc(sizeof(*fh), GFP_KERNEL);
+	if (!fh)
+		return -ENOMEM;
+
+	filp->private_data = &fh->fh;
+
 	return 0;
 }
 
 static int media_device_close(struct file *filp)
 {
+	struct media_device_fh *fh = media_device_fh(filp);
+
+	kfree(fh);
+
 	return 0;
 }
 
diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index f27d5d288a38..26491daaba96 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -133,6 +133,7 @@ static long media_compat_ioctl(struct file *filp, unsigned int cmd,
 static int media_open(struct inode *inode, struct file *filp)
 {
 	struct media_devnode *devnode;
+	struct media_devnode_fh *fh;
 	int ret;
 
 	/* Check if the media device is available. This needs to be done with
@@ -153,17 +154,15 @@ static int media_open(struct inode *inode, struct file *filp)
 	get_device(&devnode->dev);
 	mutex_unlock(&media_devnode_lock);
 
-	filp->private_data = devnode;
-
-	if (devnode->fops->open) {
-		ret = devnode->fops->open(filp);
-		if (ret) {
-			put_device(&devnode->dev);
-			filp->private_data = NULL;
-			return ret;
-		}
+	ret = devnode->fops->open(filp);
+	if (ret) {
+		put_device(&devnode->dev);
+		return ret;
 	}
 
+	fh = filp->private_data;
+	fh->devnode = devnode;
+
 	return 0;
 }
 
@@ -172,8 +171,7 @@ static int media_release(struct inode *inode, struct file *filp)
 {
 	struct media_devnode *devnode = media_devnode_data(filp);
 
-	if (devnode->fops->release)
-		devnode->fops->release(filp);
+	devnode->fops->release(filp);
 
 	filp->private_data = NULL;
 
diff --git a/include/media/media-device.h b/include/media/media-device.h
index fe4625f3f62b..f9f7c37e7d57 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -110,6 +110,10 @@ struct media_device_ops {
  *		     other operations that stop or start streaming.
  * @request_id: Used to generate unique request IDs
  *
+ * @fh_list:	List of file handles in the media device
+ *		(struct media_device_fh.mdev_list).
+ * @fh_list_lock: Serialise access to fh_list list.
+ *
  * This structure represents an abstract high-level media device. It allows easy
  * access to entities and provides basic media device-level support. The
  * structure can be allocated directly or embedded in a larger structure.
@@ -182,6 +186,9 @@ struct media_device {
 
 	struct mutex req_queue_mutex;
 	atomic_t request_id;
+
+	struct list_head fh_list;
+	spinlock_t fh_list_lock;
 };
 
 /* We don't need to include usb.h here */
diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
index 113c317e6a0e..e4e8552598eb 100644
--- a/include/media/media-devnode.h
+++ b/include/media/media-devnode.h
@@ -53,6 +53,20 @@ struct media_file_operations {
 	int (*release) (struct file *);
 };
 
+/**
+ * struct media_devnode_fh - Media device node file handle
+ * @devnode:	pointer to the media device node
+ *
+ * This structure serves as a base for per-file-handle data storage. Media
+ * device node users embed media_devnode_fh in their custom file handle data
+ * structures and store the media_devnode_fh in the file private_data in order
+ * to let the media device node core locate the media_devnode corresponding to a
+ * file handle.
+ */
+struct media_devnode_fh {
+	struct media_devnode *devnode;
+};
+
 /**
  * struct media_devnode - Media device node
  * @fops:	pointer to struct &media_file_operations with media device ops
@@ -136,7 +150,9 @@ void media_devnode_unregister(struct media_devnode *devnode);
  */
 static inline struct media_devnode *media_devnode_data(struct file *filp)
 {
-	return filp->private_data;
+	struct media_devnode_fh *fh = filp->private_data;
+
+	return fh->devnode;
 }
 
 /**
diff --git a/include/media/media-fh.h b/include/media/media-fh.h
new file mode 100644
index 000000000000..6f00744b81d6
--- /dev/null
+++ b/include/media/media-fh.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Media device file handle
+ *
+ * Copyright (C) 2019--2023 Intel Corporation
+ */
+
+#ifndef MEDIA_FH_H
+#define MEDIA_FH_H
+
+#include <linux/list.h>
+#include <linux/file.h>
+
+#include <media/media-devnode.h>
+
+/**
+ * struct media_device_fh - File handle specific information on MC
+ *
+ * @fh: The media device file handle
+ * @mdev_list: This file handle in media device's list of file handles
+ */
+struct media_device_fh {
+	struct media_devnode_fh fh;
+	struct list_head mdev_list;
+};
+
+static inline struct media_device_fh *media_device_fh(struct file *filp)
+{
+	return container_of(filp->private_data, struct media_device_fh, fh);
+}
+
+#endif /* MEDIA_FH_H */
-- 
2.39.2


