Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31FF0447A3
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 19:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393220AbfFMRBI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 13:01:08 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:47638 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729739AbfFLXqX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 19:46:23 -0400
X-Halon-ID: 424e0b75-8d6c-11e9-8ab4-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 424e0b75-8d6c-11e9-8ab4-005056917a89;
        Thu, 13 Jun 2019 01:46:12 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v3 8/8] rcar-vin: Merge Gen2 and Gen3 file operations
Date:   Thu, 13 Jun 2019 01:45:47 +0200
Message-Id: <20190612234547.14486-9-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190612234547.14486-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190612234547.14486-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After the rework of the Gen2 file operations it's now trivial to merge
the Gen2 and Gen3 versions.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 100 ++++----------------
 1 file changed, 18 insertions(+), 82 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index a84a07f1588cc818..0936bcd98df1f75d 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -781,16 +781,21 @@ static int rvin_open(struct file *file)
 	if (ret)
 		goto err_unlock;
 
-	if (v4l2_fh_is_singular_file(file)) {
-		ret = rvin_power_parallel(vin, true);
+	if (vin->info->use_mc) {
+		ret = v4l2_pipeline_pm_use(&vin->vdev.entity, 1);
 		if (ret < 0)
 			goto err_open;
+	} else {
+		if (v4l2_fh_is_singular_file(file)) {
+			ret = rvin_power_parallel(vin, true);
+			if (ret < 0)
+				goto err_open;
 
-		ret = v4l2_ctrl_handler_setup(&vin->ctrl_handler);
-		if (ret)
-			goto err_parallel;
+			ret = v4l2_ctrl_handler_setup(&vin->ctrl_handler);
+			if (ret)
+				goto err_parallel;
+		}
 	}
-
 	mutex_unlock(&vin->lock);
 
 	return 0;
@@ -820,12 +825,12 @@ static int rvin_release(struct file *file)
 	/* the release helper will cleanup any on-going streaming */
 	ret = _vb2_fop_release(file, NULL);
 
-	/*
-	 * If this was the last open file.
-	 * Then de-initialize hw module.
-	 */
-	if (fh_singular)
-		rvin_power_parallel(vin, false);
+	if (vin->info->use_mc) {
+		v4l2_pipeline_pm_use(&vin->vdev.entity, 0);
+	} else {
+		if (fh_singular)
+			rvin_power_parallel(vin, false);
+	}
 
 	mutex_unlock(&vin->lock);
 
@@ -844,74 +849,6 @@ static const struct v4l2_file_operations rvin_fops = {
 	.read		= vb2_fop_read,
 };
 
-/* -----------------------------------------------------------------------------
- * Media controller file operations
- */
-
-static int rvin_mc_open(struct file *file)
-{
-	struct rvin_dev *vin = video_drvdata(file);
-	int ret;
-
-	ret = mutex_lock_interruptible(&vin->lock);
-	if (ret)
-		return ret;
-
-	ret = pm_runtime_get_sync(vin->dev);
-	if (ret < 0)
-		goto err_unlock;
-
-	ret = v4l2_pipeline_pm_use(&vin->vdev.entity, 1);
-	if (ret < 0)
-		goto err_pm;
-
-	file->private_data = vin;
-
-	ret = v4l2_fh_open(file);
-	if (ret)
-		goto err_v4l2pm;
-
-	mutex_unlock(&vin->lock);
-
-	return 0;
-err_v4l2pm:
-	v4l2_pipeline_pm_use(&vin->vdev.entity, 0);
-err_pm:
-	pm_runtime_put(vin->dev);
-err_unlock:
-	mutex_unlock(&vin->lock);
-
-	return ret;
-}
-
-static int rvin_mc_release(struct file *file)
-{
-	struct rvin_dev *vin = video_drvdata(file);
-	int ret;
-
-	mutex_lock(&vin->lock);
-
-	/* the release helper will cleanup any on-going streaming. */
-	ret = _vb2_fop_release(file, NULL);
-
-	v4l2_pipeline_pm_use(&vin->vdev.entity, 0);
-	pm_runtime_put(vin->dev);
-
-	mutex_unlock(&vin->lock);
-
-	return ret;
-}
-
-static const struct v4l2_file_operations rvin_mc_fops = {
-	.owner		= THIS_MODULE,
-	.unlocked_ioctl	= video_ioctl2,
-	.open		= rvin_mc_open,
-	.release	= rvin_mc_release,
-	.poll		= vb2_fop_poll,
-	.mmap		= vb2_fop_mmap,
-	.read		= vb2_fop_read,
-};
-
 void rvin_v4l2_unregister(struct rvin_dev *vin)
 {
 	if (!video_is_registered(&vin->vdev))
@@ -952,6 +889,7 @@ int rvin_v4l2_register(struct rvin_dev *vin)
 	snprintf(vdev->name, sizeof(vdev->name), "VIN%u output", vin->id);
 	vdev->release = video_device_release_empty;
 	vdev->lock = &vin->lock;
+	vdev->fops = &rvin_fops;
 	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
 		V4L2_CAP_READWRITE;
 
@@ -963,10 +901,8 @@ int rvin_v4l2_register(struct rvin_dev *vin)
 	vin->format.colorspace = RVIN_DEFAULT_COLORSPACE;
 
 	if (vin->info->use_mc) {
-		vdev->fops = &rvin_mc_fops;
 		vdev->ioctl_ops = &rvin_mc_ioctl_ops;
 	} else {
-		vdev->fops = &rvin_fops;
 		vdev->ioctl_ops = &rvin_ioctl_ops;
 		rvin_reset_format(vin);
 	}
-- 
2.21.0

