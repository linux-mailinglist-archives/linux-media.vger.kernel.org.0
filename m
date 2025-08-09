Return-Path: <linux-media+bounces-39224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38711B1F683
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2057E189BDE8
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1569F27FB2E;
	Sat,  9 Aug 2025 21:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b4NAT/Og"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058AF2C08BD
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774291; cv=none; b=ZinPCdfO3eSbVn0Fz4Mj9wb65A7xN4MCOe49XDbFz2ePOdyuBBiN/Ql3HwBc/yJWoMENQm5bFX/bA8UAS6Ro3ogmUZxJciqaNnAouRC2c2j75DHNJdbj8muh63//Yeal5agEsb2D0v5+NhJwP0EG+ooeUG5KERfCUIz3t/2yVGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774291; c=relaxed/simple;
	bh=30ODzOYSsdYhxtZT3eMpE2XHGFkcYe2Eo0P7wNfTlzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bpQMmAdhtJaGrqhm8EZn7fyT8J8n3/3TcRd++tdyPi82qVGIz7PvL+rQuGMcpQ4cHAVlVJeynVNAdJwqdTObNxAquU891Ox34xwPW7ZRPdx7O7eYot9iWvVbp/CxYJZRai7pWlSEt4416dmVjpha/RJfalQ+O4gLgveEeHxAwi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b4NAT/Og; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 11C9D337C;
	Sat,  9 Aug 2025 23:17:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774232;
	bh=30ODzOYSsdYhxtZT3eMpE2XHGFkcYe2Eo0P7wNfTlzA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b4NAT/Og3JHA4HedY/Vk7EEzcdsxmYcdlwqTrfh6rovGJElOysA2BKObTtkOIq2TB
	 eqKm03xzAwqq0B8xmuCq+EbMev6ps994IiXcLPArF/EpzcMJBulJxEaBTpRW/A3Vdg
	 Hiw4ZseJfN2N+qSD69M0S2KNyLQ8dBqWyixaYHNs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Erling Ljunggren <hljunggr@cisco.com>,
	Ma Ke <make24@iscas.ac.cn>
Subject: [PATCH v2 31/76] media: v4l2-dev: Make open and release file operations mandatory
Date: Sun, 10 Aug 2025 00:16:08 +0300
Message-ID: <20250809211654.28887-32-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

All V4L2 drivers implement the open and release file operations. As all
new drivers will need to use v4l2_fh, this situation won't change. Make
those two file operation mandatory at registration time. This allows
simplifying v4l2_open() and v4l2_release().

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-dev.c | 32 +++++++++++++++---------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index c369235113d9..1a4184b94838 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -411,7 +411,7 @@ static int v4l2_mmap(struct file *filp, struct vm_area_struct *vm)
 static int v4l2_open(struct inode *inode, struct file *filp)
 {
 	struct video_device *vdev;
-	int ret = 0;
+	int ret;
 
 	/* Check if the video device is available */
 	mutex_lock(&videodev_lock);
@@ -424,12 +424,11 @@ static int v4l2_open(struct inode *inode, struct file *filp)
 	/* and increase the device refcount */
 	video_get(vdev);
 	mutex_unlock(&videodev_lock);
-	if (vdev->fops->open) {
-		if (video_is_registered(vdev))
-			ret = vdev->fops->open(filp);
-		else
-			ret = -ENODEV;
-	}
+
+	if (video_is_registered(vdev))
+		ret = vdev->fops->open(filp);
+	else
+		ret = -ENODEV;
 
 	if (vdev->dev_debug & V4L2_DEV_DEBUG_FOP)
 		dprintk("%s: open (%d)\n",
@@ -444,7 +443,7 @@ static int v4l2_open(struct inode *inode, struct file *filp)
 static int v4l2_release(struct inode *inode, struct file *filp)
 {
 	struct video_device *vdev = video_devdata(filp);
-	int ret = 0;
+	int ret;
 
 	/*
 	 * We need to serialize the release() with queueing new requests.
@@ -452,14 +451,12 @@ static int v4l2_release(struct inode *inode, struct file *filp)
 	 * operation, and that should not be mixed with queueing a new
 	 * request at the same time.
 	 */
-	if (vdev->fops->release) {
-		if (v4l2_device_supports_requests(vdev->v4l2_dev)) {
-			mutex_lock(&vdev->v4l2_dev->mdev->req_queue_mutex);
-			ret = vdev->fops->release(filp);
-			mutex_unlock(&vdev->v4l2_dev->mdev->req_queue_mutex);
-		} else {
-			ret = vdev->fops->release(filp);
-		}
+	if (v4l2_device_supports_requests(vdev->v4l2_dev)) {
+		mutex_lock(&vdev->v4l2_dev->mdev->req_queue_mutex);
+		ret = vdev->fops->release(filp);
+		mutex_unlock(&vdev->v4l2_dev->mdev->req_queue_mutex);
+	} else {
+		ret = vdev->fops->release(filp);
 	}
 
 	if (vdev->dev_debug & V4L2_DEV_DEBUG_FOP)
@@ -922,6 +919,9 @@ int __video_register_device(struct video_device *vdev,
 	/* the device_caps field MUST be set for all but subdevs */
 	if (WARN_ON(type != VFL_TYPE_SUBDEV && !vdev->device_caps))
 		return -EINVAL;
+	/* the open and release file operations are mandatory */
+	if (WARN_ON(!vdev->fops || !vdev->fops->open || !vdev->fops->release))
+		return -EINVAL;
 
 	/* v4l2_fh support */
 	spin_lock_init(&vdev->fh_lock);
-- 
Regards,

Laurent Pinchart


