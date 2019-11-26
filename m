Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FAFF109D8F
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 13:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727595AbfKZMKi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 07:10:38 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49570 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728239AbfKZMKh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 07:10:37 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 58021283CB0
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl,
        dafna3@gmail.com, helen.koike@collabora.com,
        ezequiel@collabora.com, skhan@linuxfoundation.org,
        kernel@collabora.com, laurent.pinchart@ideasonboard.com
Subject: [PATCH v3 3/3] media: vimc: Add device index to the bus_info
Date:   Tue, 26 Nov 2019 13:10:20 +0100
Message-Id: <20191126121020.11597-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191126121020.11597-1-dafna.hirschfeld@collabora.com>
References: <20191126121020.11597-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use a bitmask to get the next available device index
to be used for the bus_info field in the v4l2_capability
struct in the VIDIOC_QUERYCAP ioctl
The bitmask is a global variable in vimc-core.c. It is
set on probe and unset when a vimc device is unregisered.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/vimc/vimc-capture.c |  8 +++++--
 drivers/media/platform/vimc/vimc-common.h  |  2 ++
 drivers/media/platform/vimc/vimc-core.c    | 28 +++++++++++++++++++++-
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index 51772cc79508..31490d39a3a6 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -31,6 +31,7 @@ struct vimc_cap_device {
 	u32 sequence;
 	struct vimc_stream stream;
 	struct media_pad pad;
+	char bus_info[32];
 };
 
 static const struct v4l2_pix_format fmt_default = {
@@ -55,10 +56,12 @@ struct vimc_cap_buffer {
 static int vimc_cap_querycap(struct file *file, void *priv,
 			     struct v4l2_capability *cap)
 {
+	struct vimc_cap_device *vcap = video_drvdata(file);
+
 	strscpy(cap->driver, VIMC_PDEV_NAME, sizeof(cap->driver));
 	strscpy(cap->card, KBUILD_MODNAME, sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info),
-		 "platform:%s", VIMC_PDEV_NAME);
+	strscpy(cap->bus_info, vcap->bus_info, sizeof(cap->bus_info));
+
 
 	return 0;
 }
@@ -447,6 +450,7 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 	vcap->ved.process_frame = vimc_cap_process_frame;
 	vcap->ved.vdev_get_format = vimc_cap_get_format;
 	vcap->ved.dev = vimc->mdev.dev;
+	strscpy(vcap->bus_info, vimc->mdev.bus_info, sizeof(vcap->bus_info));
 
 	/* Initialize the video_device struct */
 	vdev = &vcap->vdev;
diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
index b47ff58553db..3e6df17456c6 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -164,12 +164,14 @@ struct vimc_ent_device {
  * struct vimc_device - main device for vimc driver
  *
  * @mdev	the associated media_device parent
+ * @idx		the index of the device, used for info_bus
  * @v4l2_dev	Internal v4l2 parent device
  * @ents	list of vimc_ent_device objects
  */
 struct vimc_device {
 	struct media_device mdev;
 	struct v4l2_device v4l2_dev;
+	unsigned int idx;
 
 	struct list_head ents;
 };
diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
index 7431fd980f45..50aeb9cfcb43 100644
--- a/drivers/media/platform/vimc/vimc-core.c
+++ b/drivers/media/platform/vimc/vimc-core.c
@@ -14,9 +14,15 @@
 #include "vimc-common.h"
 
 #define VIMC_MDEV_MODEL_NAME "VIMC MDEV"
+#define VIMC_MAX_DEVS 64
 
 #include "vimc-configfs.h"
 
+
+
+static DECLARE_BITMAP(used, VIMC_MAX_DEVS);
+static DEFINE_MUTEX(vimc_dev_idx_lock);
+
 static const struct vimc_ent_type ent_types[] = {
 	{
 		.name = VIMC_SEN_NAME,
@@ -280,14 +286,26 @@ static int vimc_probe(struct platform_device *pdev)
 						pdev->dev.platform_data;
 	struct vimc_device *vimc;
 	int ret;
+	unsigned int idx;
 
 	dev_dbg(&pdev->dev, "probe\n");
 
 	vimc = kzalloc(sizeof(*vimc), GFP_KERNEL);
 	if (!vimc)
 		return -ENOMEM;
+	mutex_lock(&vimc_dev_idx_lock);
+	idx = find_first_zero_bit(used, VIMC_MAX_DEVS);
+	if (idx == VIMC_MAX_DEVS) {
+		mutex_unlock(&vimc_dev_idx_lock);
+		dev_err(&pdev->dev, "there are already %u devs which is the max allowed\n",
+			VIMC_MAX_DEVS);
+		return -EBUSY;
+	}
+	set_bit(idx, used);
+	mutex_unlock(&vimc_dev_idx_lock);
 
 	INIT_LIST_HEAD(&vimc->ents);
+	vimc->idx = idx;
 
 	/* Link the media device within the v4l2_device */
 	vimc->v4l2_dev.mdev = &vimc->mdev;
@@ -296,7 +314,8 @@ static int vimc_probe(struct platform_device *pdev)
 	strscpy(vimc->mdev.model, VIMC_MDEV_MODEL_NAME,
 		sizeof(vimc->mdev.model));
 	snprintf(vimc->mdev.bus_info, sizeof(vimc->mdev.bus_info),
-		 "platform:%s", VIMC_PDEV_NAME);
+		 "platform:%s-%03u", VIMC_PDEV_NAME, idx);
+
 	vimc->mdev.dev = &pdev->dev;
 	media_device_init(&vimc->mdev);
 
@@ -304,6 +323,9 @@ static int vimc_probe(struct platform_device *pdev)
 	if (ret) {
 		media_device_cleanup(&vimc->mdev);
 		kfree(vimc);
+		mutex_lock(&vimc_dev_idx_lock);
+		clear_bit(idx, used);
+		mutex_unlock(&vimc_dev_idx_lock);
 		return ret;
 	}
 	/*
@@ -319,12 +341,16 @@ static int vimc_probe(struct platform_device *pdev)
 static int vimc_remove(struct platform_device *pdev)
 {
 	struct vimc_device *vimc = platform_get_drvdata(pdev);
+	unsigned long idx = vimc->idx;
 
 	dev_dbg(&pdev->dev, "remove\n");
 
 	vimc_unregister(vimc);
 	v4l2_device_put(&vimc->v4l2_dev);
 
+	mutex_lock(&vimc_dev_idx_lock);
+	clear_bit(idx, used);
+	mutex_unlock(&vimc_dev_idx_lock);
 	return 0;
 }
 
-- 
2.20.1

