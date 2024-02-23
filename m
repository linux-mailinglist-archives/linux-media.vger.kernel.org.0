Return-Path: <linux-media+bounces-5752-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 315C9860E0A
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 10:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFC45286955
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 09:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464345C8F1;
	Fri, 23 Feb 2024 09:34:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CB017BAC
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 09:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708680874; cv=none; b=fMrYZ9m3yW851W0REOAoqs7Rph4cMHEuGJW+WO/x1DsbAH9LYgpEhc88yEQ4XPh2fA8Wrn6YSJcFKGAR0tf/YjqCUeGqihacyHsN9M7UfMfJfSRXR5WaldNrYZMNa6832gmHG/j/GJIBKD7tgCSGqxbXloveWHHSJAifUL7eBBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708680874; c=relaxed/simple;
	bh=vHudLcc+G6lZ41h/GpZwTmM7A18MPHMLey+IsCjl5LM=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=VcxX+/ou2Rsbwyt2v+GWaucnyWz7+PZvmRDlWd1SWuD6bxDuneAzjGw4gPu8Pz8TLCsRLhdjcpced+RmK04MhoPQrL9TBe9HgeUfaqd3KVwAipZOHoDCrHDkw/2jyhZqqO1lG9arFmAU+oRaXtP4gw2oc4Vda9W6wy4tRSeejFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C796DC433F1;
	Fri, 23 Feb 2024 09:34:33 +0000 (UTC)
Message-ID: <41bb718b-2c6d-41aa-b093-b800dffcbe1e@xs4all.nl>
Date: Fri, 23 Feb 2024 10:34:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: mc: return ENODEV instead of EIO/ENXIO when dev is,
 unregistered
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

If the media device is unregistered, the read/write/ioctl file ops
returned EIO instead of ENODEV. And open returned ENXIO instead of the
linux kernel standard of ENODEV.

Change the error code to ENODEV and document this as well in
media-func-open.rst.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../userspace-api/media/mediactl/media-func-open.rst   |  4 ++--
 drivers/media/mc/mc-devnode.c                          | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-func-open.rst b/Documentation/userspace-api/media/mediactl/media-func-open.rst
index 24487cb0a308..8c1c7ebefdb1 100644
--- a/Documentation/userspace-api/media/mediactl/media-func-open.rst
+++ b/Documentation/userspace-api/media/mediactl/media-func-open.rst
@@ -61,5 +61,5 @@ ENFILE
 ENOMEM
     Insufficient kernel memory was available.

-ENXIO
-    No device corresponding to this device special file exists.
+ENODEV
+    Device not found or was removed.
diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 7f67825c8757..fbf76e1414de 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -75,7 +75,7 @@ static ssize_t media_read(struct file *filp, char __user *buf,
 	if (!devnode->fops->read)
 		return -EINVAL;
 	if (!media_devnode_is_registered(devnode))
-		return -EIO;
+		return -ENODEV;
 	return devnode->fops->read(filp, buf, sz, off);
 }

@@ -87,7 +87,7 @@ static ssize_t media_write(struct file *filp, const char __user *buf,
 	if (!devnode->fops->write)
 		return -EINVAL;
 	if (!media_devnode_is_registered(devnode))
-		return -EIO;
+		return -ENODEV;
 	return devnode->fops->write(filp, buf, sz, off);
 }

@@ -114,7 +114,7 @@ __media_ioctl(struct file *filp, unsigned int cmd, unsigned long arg,
 		return -ENOTTY;

 	if (!media_devnode_is_registered(devnode))
-		return -EIO;
+		return -ENODEV;

 	return ioctl_func(filp, cmd, arg);
 }
@@ -152,11 +152,11 @@ static int media_open(struct inode *inode, struct file *filp)
 	 */
 	mutex_lock(&media_devnode_lock);
 	devnode = container_of(inode->i_cdev, struct media_devnode, cdev);
-	/* return ENXIO if the media device has been removed
+	/* return ENODEV if the media device has been removed
 	   already or if it is not registered anymore. */
 	if (!media_devnode_is_registered(devnode)) {
 		mutex_unlock(&media_devnode_lock);
-		return -ENXIO;
+		return -ENODEV;
 	}
 	/* and increase the device refcount */
 	get_device(&devnode->dev);
-- 
2.43.0


