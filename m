Return-Path: <linux-media+bounces-39304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 069A5B1F7C0
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C945189A3D6
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30ADC1E9B08;
	Sun, 10 Aug 2025 01:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qcttda3+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A645B21A
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789536; cv=none; b=FYhq11rjwQupTucLr+gfEwB+ti8nza6C/y5TGLWpP2PGJeSHUSCezUosBo2xeHr59MRwz12dSUMalKG8iF8sp4MfeVRHaMSrhFbmiYb+TtkX3AiY1q3lMsbgV9GfAidynhA5STBb7qCzjmShh0P3QmszpjPKVFXEqYXI/VaUk2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789536; c=relaxed/simple;
	bh=iK7TwoUabGq9yhF6sFM3ES1eZkpSN8wECmgoLo+Ahuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pyd3pjlmkgAWjnpdTUE+UVXy/PUOEOaOFXopUZ9e82RIfbme/JKzCYvcCNParV7YfxbNBETT6m+Z+1uUk/Ds7OAWbdoptwBGfo41XR3CLqPLjQeTo+xQD9+MNvEdrGQClCPV6pp2adigWCLWMrEtnXATjywkhAVE142rC76KgO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qcttda3+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9F74718B9;
	Sun, 10 Aug 2025 03:31:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789481;
	bh=iK7TwoUabGq9yhF6sFM3ES1eZkpSN8wECmgoLo+Ahuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qcttda3+EvYcDeeNg8wdO0LQakEcynZAvA08iNlLoz72DrKD35hAWHpUwoxygttE9
	 S/O5o3H33e8S+wJlwpIjaP5U9oWh/G5wsoN+h8D1mKl/gTada5VndjeE8vtKboSQC9
	 fLkpFfxYlc8BSTZ4V8uTeVOyCaYQGT4ygta7GeEg=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Erling Ljunggren <hljunggr@cisco.com>,
	Ma Ke <make24@iscas.ac.cn>
Subject: [PATCH v3 31/76] media: v4l2-dev: Make open and release file operations mandatory
Date: Sun, 10 Aug 2025 04:30:13 +0300
Message-ID: <20250810013100.29776-32-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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


