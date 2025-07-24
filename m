Return-Path: <linux-media+bounces-38385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB4AB10CDB
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 16:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46AB6168A27
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 14:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45D62DE6E9;
	Thu, 24 Jul 2025 14:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gAaY+Dbr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3602D29B7;
	Thu, 24 Jul 2025 14:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366233; cv=none; b=FXtmYKWMXVjsMOnoae34r/1yFPo2BVdw30eT/0Al0boyrZdAZywk1N0XUkIqqHG6AiDqCxL30kZHX17o4/CBUOd2U3RmgqeWlyTFXu+rbP2U2a3lM5/PykdHPslst2bCRKgo4qSyqbu3FwmYsasH5EhpPqoN/6Yyqz8s0mUZsm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366233; c=relaxed/simple;
	bh=kncEHGUHBsOPEbj18mUjhjLaFdDTloHadGxnvcBRhXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jjFrpU+buws4QMlO+YFs+7uDx1mTNSwMAZOnFTFlRzdIJ777censlNyScOA8uv1KZ2bSxpkzooMo1RAp27ZSvNdbHCG6SLkB5FZpROUp0MCb0VhccDLmNlzEbUmyqOXn2dX/egmO04kIxfuiPEq0UNh6h0YJyp7CLucxUwVQj5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gAaY+Dbr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4822511E6;
	Thu, 24 Jul 2025 16:09:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366189;
	bh=kncEHGUHBsOPEbj18mUjhjLaFdDTloHadGxnvcBRhXM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gAaY+DbrTVEhRUog6Y1tHYj8lkp5ax+jymeQIs6+3uVtcn7z+YxFdusv8C4Qu/p64
	 gKFSZwqZFlEPAssB+7plXSZ8LZxHsnTuZ+tcQjNZ6hmfsZQOHe2cAJWD/uxI3SSIA6
	 8KcE9stVQFHHDqFTYV0pgQqAGPVTS+EfBy9Yw050=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:08 +0200
Subject: [PATCH v2 01/27] media: mc: Add per-file-handle data support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-1-c9b316773486@ideasonboard.com>
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Hans Verkuil <hverkuil@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7105;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=iZLPf77dc0oKef/FoIrNYxuY8wrefkX+9mbiaN7w1+U=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7OvS5BlVCgiF1gQqp9wy2UdrB4acbKilKqM
 fhKRME9Q1WJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+zgAKCRByNAaPFqFW
 PFwnD/9tMm5RSk04hMUf0xgme2U3HQKA5jq+FX5aJPpIj4pNU9WjhDYPOKRXvTVrPqa2a87lE0v
 +2KyqJj0AYVdRG8PAqLIvfLgon0ttIlMHJRpsSY2XhX/KVhNtU78imxQsj+ZmR57o7IlKEfdaBE
 0NFZBgL4VmRkB0WSaM+sbMDdtsMBS+GVITGxu0FEH7bJTIGvqGADAoFfIZT3osz6ZL/ij4OS3lB
 Y48H7lRZXIP0m97d26Qiph5Fa6ff7BnPXdulyG0ImDbE0cD9s5ndZPq0MNqjUr8Kq/OlzMKPJhC
 u57FCHwiwiA8qdSK04kWtDA1cE99rYGYSYMHXJDkHjrvzHi4LEc74iCATILYLlGMT0LCh/7/Qht
 Oz81NzymhC8coQxkylalaxhNzT+rcLO+ylaeB/Kj3wALxleEQAXsKzhUrcKfyDq9t7h9ECOZUsa
 VGP9P5PX+OwHYRqZofSIToNxjcYSUpUmYWbjBd0YPdm6BfXs+fgT0bdDiPoanvhP23ifhPqWyml
 /JZoke8BMxkZq4gtEtCmq75MT4XgZ+tBnQF6KzRpHCxJv6Mi+U+YbdPsV1E0HxWl6/BlsN7H81u
 WvDeHEKvFwre4T5n12vQr6lfLAiy2wMd+8PobpzSyQNeCTeXuqK3fhXfJpGD1z23NS2r14CZLtz
 7/1Ne2kdcP5LNBQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

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
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/mc/mc-device.c  | 14 +++++++++++++-
 drivers/media/mc/mc-devnode.c | 20 +++++++++-----------
 include/media/media-device.h  |  7 +++++++
 include/media/media-devnode.h | 18 +++++++++++++++++-
 include/media/media-fh.h      | 32 ++++++++++++++++++++++++++++++++
 5 files changed, 78 insertions(+), 13 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index c0dd4ae5722725f1744bc6fd6282d5c765438059..f298f8f67b8a84194d66126461e84228c0b20394 100644
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
index 56444edaf13651874331e7c04e86b0a585067d38..312eb48ffc2f2a0c013e4744204995df0ff5b12c 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -142,6 +142,7 @@ static long media_compat_ioctl(struct file *filp, unsigned int cmd,
 static int media_open(struct inode *inode, struct file *filp)
 {
 	struct media_devnode *devnode;
+	struct media_devnode_fh *fh;
 	int ret;
 
 	/* Check if the media device is available. This needs to be done with
@@ -162,17 +163,15 @@ static int media_open(struct inode *inode, struct file *filp)
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
 
@@ -181,8 +180,7 @@ static int media_release(struct inode *inode, struct file *filp)
 {
 	struct media_devnode *devnode = media_devnode_data(filp);
 
-	if (devnode->fops->release)
-		devnode->fops->release(filp);
+	devnode->fops->release(filp);
 
 	filp->private_data = NULL;
 
diff --git a/include/media/media-device.h b/include/media/media-device.h
index 53d2a16a70b0d9d6e5cc28fe1fc5d5ef384410d5..2fc750efef7c43814f019f12078e9c96c1bd6bf9 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -108,6 +108,10 @@ struct media_device_ops {
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
@@ -180,6 +184,9 @@ struct media_device {
 
 	struct mutex req_queue_mutex;
 	atomic_t request_id;
+
+	struct list_head fh_list;
+	spinlock_t fh_list_lock;
 };
 
 /* We don't need to include usb.h here */
diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
index d27c1c646c2805171be3997d72210dd4d1a38e32..6c2e253dde498779dffd103dc5d00e50e14a0249 100644
--- a/include/media/media-devnode.h
+++ b/include/media/media-devnode.h
@@ -55,6 +55,20 @@ struct media_file_operations {
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
  * @media_dev:	pointer to struct &media_device
@@ -146,7 +160,9 @@ void media_devnode_unregister(struct media_devnode *devnode);
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
index 0000000000000000000000000000000000000000..6f00744b81d6000a4b0c503fe6968dd7adcbb1c3
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
2.49.0


