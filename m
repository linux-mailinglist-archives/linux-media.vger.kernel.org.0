Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67362139BF7
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 22:55:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728873AbgAMVzb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 16:55:31 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52352 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728733AbgAMVza (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 16:55:30 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 8FC6F2912F2
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, skhan@linuxfoundation.org,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH v4 2/6] media: vimc: allocate vimc_device dynamically
Date:   Mon, 13 Jan 2020 23:55:02 +0200
Message-Id: <20200113215506.13329-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113215506.13329-1-dafna.hirschfeld@collabora.com>
References: <20200113215506.13329-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In future patch, the release of the device will move
to the release callback of v4l2_device. Therefore the
device will be released only when the last fh will be
closed. Dynamic allocation will then be needed since
when the device is unbounded and then bounded again,
it might be that the probe callback will run before
the release of the last device is finished. In that
case both operations will run on the same memory
concurrently and cause memory corruption.
This patch also removes the pdev field of
vimc_device since it is not needed anymore.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/vimc/vimc-common.h |  2 --
 drivers/media/platform/vimc/vimc-core.c   | 31 +++++++++++++----------
 2 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
index 87eb8259c2a8..1b6ef7196f3c 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -106,14 +106,12 @@ struct vimc_ent_device {
 /**
  * struct vimc_device - main device for vimc driver
  *
- * @pdev	pointer to the platform device
  * @pipe_cfg	pointer to the vimc pipeline configuration structure
  * @ent_devs	array of vimc_ent_device pointers
  * @mdev	the associated media_device parent
  * @v4l2_dev	Internal v4l2 parent device
  */
 struct vimc_device {
-	struct platform_device pdev;
 	const struct vimc_pipeline_config *pipe_cfg;
 	struct vimc_ent_device **ent_devs;
 	struct media_device mdev;
diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
index 51c89fc79d90..1c55e0382f09 100644
--- a/drivers/media/platform/vimc/vimc-core.c
+++ b/drivers/media/platform/vimc/vimc-core.c
@@ -252,16 +252,21 @@ static void vimc_unregister(struct vimc_device *vimc)
 	media_device_cleanup(&vimc->mdev);
 	v4l2_device_unregister(&vimc->v4l2_dev);
 	kfree(vimc->ent_devs);
+	kfree(vimc);
 }
 
 static int vimc_probe(struct platform_device *pdev)
 {
-	struct vimc_device *vimc = container_of(pdev, struct vimc_device, pdev);
+	struct vimc_device *vimc;
 	int ret;
 
 	dev_dbg(&pdev->dev, "probe");
 
-	memset(&vimc->mdev, 0, sizeof(vimc->mdev));
+	vimc = kzalloc(sizeof(*vimc), GFP_KERNEL);
+	if (!vimc)
+		return -ENOMEM;
+
+	vimc->pipe_cfg = &pipe_cfg;
 
 	/* Link the media device within the v4l2_device */
 	vimc->v4l2_dev.mdev = &vimc->mdev;
@@ -277,15 +282,17 @@ static int vimc_probe(struct platform_device *pdev)
 	ret = vimc_register_devices(vimc);
 	if (ret) {
 		media_device_cleanup(&vimc->mdev);
+		kfree(vimc);
 		return ret;
 	}
 
+	platform_set_drvdata(pdev, vimc);
 	return 0;
 }
 
 static int vimc_remove(struct platform_device *pdev)
 {
-	struct vimc_device *vimc = container_of(pdev, struct vimc_device, pdev);
+	struct vimc_device *vimc = platform_get_drvdata(pdev);
 
 	dev_dbg(&pdev->dev, "remove");
 
@@ -299,12 +306,10 @@ static void vimc_dev_release(struct device *dev)
 {
 }
 
-static struct vimc_device vimc_dev = {
-	.pipe_cfg = &pipe_cfg,
-	.pdev = {
-		.name = VIMC_PDEV_NAME,
-		.dev.release = vimc_dev_release,
-	}
+
+static struct platform_device vimc_pdev = {
+	.name = VIMC_PDEV_NAME,
+	.dev.release = vimc_dev_release,
 };
 
 static struct platform_driver vimc_pdrv = {
@@ -319,16 +324,16 @@ static int __init vimc_init(void)
 {
 	int ret;
 
-	ret = platform_device_register(&vimc_dev.pdev);
+	ret = platform_device_register(&vimc_pdev);
 	if (ret) {
-		dev_err(&vimc_dev.pdev.dev,
+		dev_err(&vimc_pdev.dev,
 			"platform device registration failed (err=%d)\n", ret);
 		return ret;
 	}
 
 	ret = platform_driver_register(&vimc_pdrv);
 	if (ret) {
-		dev_err(&vimc_dev.pdev.dev,
+		dev_err(&vimc_pdev.dev,
 			"platform driver registration failed (err=%d)\n", ret);
 		platform_driver_unregister(&vimc_pdrv);
 		return ret;
@@ -341,7 +346,7 @@ static void __exit vimc_exit(void)
 {
 	platform_driver_unregister(&vimc_pdrv);
 
-	platform_device_unregister(&vimc_dev.pdev);
+	platform_device_unregister(&vimc_pdev);
 }
 
 module_init(vimc_init);
-- 
2.17.1

