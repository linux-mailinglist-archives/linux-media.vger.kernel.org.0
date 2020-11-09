Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF14F2AC928
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 00:14:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730895AbgKIXOH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 18:14:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729452AbgKIXOG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 18:14:06 -0500
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A34C0613CF
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 15:14:06 -0800 (PST)
Received: from lanttu.localdomain (lanttu.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::c1:2])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id ABBA3634C89;
        Tue, 10 Nov 2020 01:12:34 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 1/1] vim2m: Register video device after setting up internals
Date:   Tue, 10 Nov 2020 01:07:22 +0200
Message-Id: <20201109230722.2677-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Prevent NULL (or close to NULL) pointer dereference in various places by
registering the video device only when the V4L2 m2m framework has been set
up.

Fixes: commit 96d8eab5d0a1 ("V4L/DVB: [v5,2/2] v4l: Add a mem-to-mem videobuf framework test device")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Hi folks,

I haven't thought a lot about this but at least it fixes an oops that
happens at vim2m load time otherwise.

It's a test driver so I guess backporting isn't crucial anyway.

 drivers/media/test-drivers/vim2m.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index a776bb8e0e09..331a9053a0ed 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -1325,12 +1325,6 @@ static int vim2m_probe(struct platform_device *pdev)
 	vfd->lock = &dev->dev_mutex;
 	vfd->v4l2_dev = &dev->v4l2_dev;
 
-	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
-	if (ret) {
-		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
-		goto error_v4l2;
-	}
-
 	video_set_drvdata(vfd, dev);
 	v4l2_info(&dev->v4l2_dev,
 		  "Device registered as /dev/video%d\n", vfd->num);
@@ -1345,6 +1339,12 @@ static int vim2m_probe(struct platform_device *pdev)
 		goto error_dev;
 	}
 
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
+	if (ret) {
+		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
+		goto error_m2m;
+	}
+
 #ifdef CONFIG_MEDIA_CONTROLLER
 	dev->mdev.dev = &pdev->dev;
 	strscpy(dev->mdev.model, "vim2m", sizeof(dev->mdev.model));
@@ -1358,7 +1358,7 @@ static int vim2m_probe(struct platform_device *pdev)
 						 MEDIA_ENT_F_PROC_VIDEO_SCALER);
 	if (ret) {
 		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem media controller\n");
-		goto error_dev;
+		goto error_v4l2;
 	}
 
 	ret = media_device_register(&dev->mdev);
@@ -1373,11 +1373,13 @@ static int vim2m_probe(struct platform_device *pdev)
 error_m2m_mc:
 	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
 #endif
-error_dev:
+error_v4l2:
 	video_unregister_device(&dev->vfd);
 	/* vim2m_device_release called by video_unregister_device to release various objects */
 	return ret;
-error_v4l2:
+error_m2m:
+	v4l2_m2m_release(dev->m2m_dev);
+error_dev:
 	v4l2_device_unregister(&dev->v4l2_dev);
 error_free:
 	kfree(dev);
-- 
2.27.0

