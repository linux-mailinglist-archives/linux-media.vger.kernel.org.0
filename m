Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06E16150585
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 12:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbgBCLl1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 06:41:27 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:40041 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728010AbgBCLl1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Feb 2020 06:41:27 -0500
Received: from tschai.fritz.box ([46.9.235.248])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ya6RiS69Jn7E5ya6Wi3UHN; Mon, 03 Feb 2020 12:41:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580730084; bh=KJ0YxGl2IVbparsfHyR4nfU9rrBB3lgtAj1m+2mzjlA=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=Bfy6JwlahDJ4cDjHCTrGkjsR3ti6NtHUQWf6033TFVu8l+wIVRYTUeTmIDYXE4jyu
         v2yzwWx4BAVLk3FN7xmAQydtLPdne8uyQ6QYjMghAif6aLMWKx+wNTCkTsL4Zh69xr
         RNQrRYAcnk1jAcHa0LPoz2jFDGRmFdDPLp9v423UpF0fiSO5tBf11OC9e/c+r9JEDL
         JsbrvrAwQXbX4Kn+CHxHJ4Ur52hzBSLHWke8oMEQiX/ODdany1j22DsP68R8BZ7pP4
         VVg2qYA6MHSfcJ/nCLUjwS7Ryeo6clXdFThlXaKbYX1IuJfsAGiwWFRxZS+ICB30gI
         waj9Ngq5oAb9Q==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 04/11] staging/media: rename VFL_TYPE_GRABBER to _VIDEO
Date:   Mon,  3 Feb 2020 12:41:12 +0100
Message-Id: <20200203114119.1177490-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200203114119.1177490-1-hverkuil-cisco@xs4all.nl>
References: <20200203114119.1177490-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMYQBx7nC6D3KGDzpS6tqLjATMx7ndUsOT+3rfJyigb0kZdy8hcF589QdhH4omKlqR2++UDGVQ5yWi+dvGWwGhrBql31kNTuqlpDuC13BeeVqJB1Sd+Q
 5yfkH6xFxvFGEt8ZhVhXW3JXxQHVk0oMK54FkcWUTq9huFY9gH5KFRjOr4ey1nsusLzIJUizNmtsRYKJB831z8PLPB527w8ZbJI8brW6LRf0mGl7FmxnqKfU
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

'GRABBER' is a weird name, all other types map to the /dev
device names. Rename to 'VIDEO' to be consistent with the
other types.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/allegro-dvt/allegro-core.c | 2 +-
 drivers/staging/media/hantro/hantro_drv.c        | 2 +-
 drivers/staging/media/imx/imx-media-capture.c    | 2 +-
 drivers/staging/media/imx/imx-media-csc-scaler.c | 2 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c           | 2 +-
 drivers/staging/media/meson/vdec/vdec.c          | 2 +-
 drivers/staging/media/omap4iss/iss_video.c       | 4 ++--
 drivers/staging/media/rkisp1/rkisp1-capture.c    | 2 +-
 drivers/staging/media/rkisp1/rkisp1-params.c     | 2 +-
 drivers/staging/media/rkisp1/rkisp1-stats.c      | 2 +-
 drivers/staging/media/soc_camera/soc_camera.c    | 2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c      | 2 +-
 12 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 6f0cd0784786..f8eafa12861f 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -2701,7 +2701,7 @@ static int allegro_register_device(struct allegro_dev *dev)
 	video_dev->device_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING;
 	video_set_drvdata(video_dev, dev);
 
-	return video_register_device(video_dev, VFL_TYPE_GRABBER, 0);
+	return video_register_device(video_dev, VFL_TYPE_VIDEO, 0);
 }
 
 static void allegro_device_run(void *priv)
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 97c615a2f057..cbd44ef1a144 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -664,7 +664,7 @@ static int hantro_add_func(struct hantro_dev *vpu, unsigned int funcid)
 
 	video_set_drvdata(vfd, vpu);
 
-	ret = video_register_device(vfd, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		v4l2_err(&vpu->v4l2_dev, "Failed to register video device\n");
 		return ret;
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 7712e7be8625..fca8f3847717 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -742,7 +742,7 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 
 	vfd->v4l2_dev = v4l2_dev;
 
-	ret = video_register_device(vfd, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		v4l2_err(sd, "Failed to register video device\n");
 		return ret;
diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index 2b635ebf62d6..2cc77f6e84b6 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -849,7 +849,7 @@ int imx_media_csc_scaler_device_register(struct imx_media_video_dev *vdev)
 
 	vfd->v4l2_dev = &priv->md->v4l2_dev;
 
-	ret = video_register_device(vfd, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		v4l2_err(vfd->v4l2_dev, "Failed to register video device\n");
 		return ret;
diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 569e27b824c8..09c8ede1457c 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -1245,7 +1245,7 @@ static int imgu_v4l2_node_setup(struct imgu_device *imgu, unsigned int pipe,
 	vdev->queue = &node->vbq;
 	vdev->vfl_dir = node->output ? VFL_DIR_TX : VFL_DIR_RX;
 	video_set_drvdata(vdev, imgu);
-	r = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	r = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (r) {
 		dev_err(dev, "failed to register video device (%d)", r);
 		media_entity_cleanup(&vdev->entity);
diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 5c5dabed2f09..7a9cc136afd9 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1076,7 +1076,7 @@ static int vdec_probe(struct platform_device *pdev)
 
 	video_set_drvdata(vdev, core);
 
-	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		dev_err(dev, "Failed registering video device\n");
 		goto err_vdev_release;
diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
index 673aa3a5f2bd..bf7e999998c3 100644
--- a/drivers/staging/media/omap4iss/iss_video.c
+++ b/drivers/staging/media/omap4iss/iss_video.c
@@ -1242,7 +1242,7 @@ int omap4iss_video_init(struct iss_video *video, const char *name)
 	video->video.fops = &iss_video_fops;
 	snprintf(video->video.name, sizeof(video->video.name),
 		 "OMAP4 ISS %s %s", name, direction);
-	video->video.vfl_type = VFL_TYPE_GRABBER;
+	video->video.vfl_type = VFL_TYPE_VIDEO;
 	video->video.release = video_device_release_empty;
 	video->video.ioctl_ops = &iss_video_ioctl_ops;
 	video->pipe.stream_state = ISS_PIPELINE_STREAM_STOPPED;
@@ -1270,7 +1270,7 @@ int omap4iss_video_register(struct iss_video *video, struct v4l2_device *vdev)
 		video->video.device_caps = V4L2_CAP_VIDEO_OUTPUT;
 	video->video.device_caps |= V4L2_CAP_STREAMING;
 
-	ret = video_register_device(&video->video, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(&video->video, VFL_TYPE_VIDEO, -1);
 	if (ret < 0)
 		dev_err(video->iss->dev,
 			"could not register video device (%d)\n", ret);
diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index 524e0dd38c1b..7cc2ace193d1 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -1362,7 +1362,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
 
 	vdev->queue = q;
 
-	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		dev_err(cap->rkisp1->dev,
 			"failed to register %s, ret=%d\n", vdev->name, ret);
diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index 781f0ca85af1..44d542caf32b 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -1605,7 +1605,7 @@ int rkisp1_params_register(struct rkisp1_params *params,
 	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
 	if (ret)
 		goto err_release_queue;
-	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		dev_err(&vdev->dev,
 			"failed to register %s, ret=%d\n", vdev->name, ret);
diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
index d98ea15837de..c0ccc86b1275 100644
--- a/drivers/staging/media/rkisp1/rkisp1-stats.c
+++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
@@ -487,7 +487,7 @@ int rkisp1_stats_register(struct rkisp1_stats *stats,
 	if (ret)
 		goto err_release_queue;
 
-	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		dev_err(&vdev->dev,
 			"failed to register %s, ret=%d\n", vdev->name, ret);
diff --git a/drivers/staging/media/soc_camera/soc_camera.c b/drivers/staging/media/soc_camera/soc_camera.c
index 7b9448e3c9ba..39f513f69b89 100644
--- a/drivers/staging/media/soc_camera/soc_camera.c
+++ b/drivers/staging/media/soc_camera/soc_camera.c
@@ -2068,7 +2068,7 @@ static int soc_camera_video_start(struct soc_camera_device *icd)
 		v4l2_disable_ioctl(icd->vdev, VIDIOC_S_STD);
 		v4l2_disable_ioctl(icd->vdev, VIDIOC_ENUMSTD);
 	}
-	ret = video_register_device(icd->vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(icd->vdev, VFL_TYPE_VIDEO, -1);
 	if (ret < 0) {
 		dev_err(icd->pdev, "video_register_device failed: %d\n", ret);
 		return ret;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index c6ddd46eff82..05a85517ff60 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -414,7 +414,7 @@ static int cedrus_probe(struct platform_device *pdev)
 	dev->mdev.ops = &cedrus_m2m_media_ops;
 	dev->v4l2_dev.mdev = &dev->mdev;
 
-	ret = video_register_device(vfd, VFL_TYPE_GRABBER, 0);
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
 		goto err_m2m;
-- 
2.24.0

