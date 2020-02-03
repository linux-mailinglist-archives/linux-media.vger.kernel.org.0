Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77592150595
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 12:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbgBCLnh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 06:43:37 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:43321 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726100AbgBCLnh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Feb 2020 06:43:37 -0500
Received: from tschai.fritz.box ([46.9.235.248])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ya8XiS6uJn7E5ya8bi3V5a; Mon, 03 Feb 2020 12:43:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580730213; bh=12SBuYpwUxrRrkQnFVJtIzyZI5+E2VH9WrLC9tg7fso=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=ZNDIH+RZZBJcmEl6uPVQ98jkHfKPuRcDjuUkC9DyKfY39W32Z53grbb/sjVsn2iyz
         2iCLB74Fpj7sViPZ9YgzhzT8fMBrKDf+EkfZss1xw/sAbXuhLp5Nt4OlSaG7UboXYl
         viyTvSxBX2CRo0ieVOwngYaaTQcMsQjrWGHfBkX06l0zu6Usjo1DDFWl2joqE9xbf0
         yCmBNiZteh+wzbUGIpdJRWtLFAUSW1tVJVsmQ1wz6Su3WbC3Nw1LG0ETMpFN2lOpGN
         RwQmQtwdQugHPcNgJBvL9N4CTvOutGi6zc+PTOmyNN/EPryf6f29shfPXOQ/rrb3vS
         PwDNQhQTQMvmQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 10/11] media/platform: rename VFL_TYPE_GRABBER to _VIDEO
Date:   Mon,  3 Feb 2020 12:41:18 +0100
Message-Id: <20200203114119.1177490-11-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200203114119.1177490-1-hverkuil-cisco@xs4all.nl>
References: <20200203114119.1177490-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJ+7u+LFNDEYz2FrxBtEO9PAWHgEYAqh2orTG3bntn6oGxW8hex0sd7DQiFsuSucmLtTvY2NPCiRQmKg5DMm+xFz85+00rqcRwvQUyzIushNd/uoKuAN
 0iSP2eAUAlmdZhieNC+FNJ1arS9LrRIXx9w+KbR8jAoW9Oode0Yc6DYogs1bUKd4FIy9g3cgiehYMhi9mWG8syu8EPUZvSm7H/JL/fHZ0YOXrmUtf45bR0nP
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

'GRABBER' is a weird name, all other types map to the /dev
device names. Rename to 'VIDEO' to be consistent with the
other types.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/am437x/am437x-vpfe.c            |  2 +-
 drivers/media/platform/aspeed-video.c                  |  4 ++--
 drivers/media/platform/atmel/atmel-isc-base.c          |  2 +-
 drivers/media/platform/atmel/atmel-isi.c               |  2 +-
 drivers/media/platform/coda/coda-common.c              |  2 +-
 drivers/media/platform/davinci/vpbe_display.c          |  2 +-
 drivers/media/platform/davinci/vpfe_capture.c          |  2 +-
 drivers/media/platform/davinci/vpif_capture.c          |  2 +-
 drivers/media/platform/davinci/vpif_display.c          |  2 +-
 drivers/media/platform/exynos-gsc/gsc-m2m.c            |  2 +-
 drivers/media/platform/exynos4-is/fimc-capture.c       |  2 +-
 drivers/media/platform/exynos4-is/fimc-isp-video.c     |  2 +-
 drivers/media/platform/exynos4-is/fimc-lite.c          |  2 +-
 drivers/media/platform/exynos4-is/fimc-m2m.c           |  2 +-
 drivers/media/platform/fsl-viu.c                       |  2 +-
 drivers/media/platform/imx-pxp.c                       |  2 +-
 drivers/media/platform/m2m-deinterlace.c               |  2 +-
 drivers/media/platform/marvell-ccic/mcam-core.c        |  2 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c        |  2 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c           |  2 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c |  2 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c |  2 +-
 drivers/media/platform/mx2_emmaprp.c                   |  2 +-
 drivers/media/platform/omap/omap_vout.c                |  2 +-
 drivers/media/platform/omap3isp/ispvideo.c             |  4 ++--
 drivers/media/platform/pxa_camera.c                    |  2 +-
 drivers/media/platform/qcom/camss/camss-video.c        |  2 +-
 drivers/media/platform/qcom/venus/vdec.c               |  2 +-
 drivers/media/platform/qcom/venus/venc.c               |  2 +-
 drivers/media/platform/rcar-vin/rcar-v4l2.c            |  2 +-
 drivers/media/platform/rcar_fdp1.c                     |  2 +-
 drivers/media/platform/rcar_jpu.c                      |  4 ++--
 drivers/media/platform/renesas-ceu.c                   |  2 +-
 drivers/media/platform/rockchip/rga/rga.c              |  2 +-
 drivers/media/platform/s3c-camif/camif-capture.c       |  2 +-
 drivers/media/platform/s5p-g2d/g2d.c                   |  2 +-
 drivers/media/platform/s5p-jpeg/jpeg-core.c            |  4 ++--
 drivers/media/platform/s5p-mfc/s5p_mfc.c               |  4 ++--
 drivers/media/platform/sh_veu.c                        |  2 +-
 drivers/media/platform/sh_vou.c                        |  2 +-
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c          |  2 +-
 drivers/media/platform/sti/delta/delta-v4l2.c          |  2 +-
 drivers/media/platform/sti/hva/hva-v4l2.c              |  2 +-
 drivers/media/platform/stm32/stm32-dcmi.c              |  2 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c    |  2 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c   |  4 ++--
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c       |  2 +-
 drivers/media/platform/ti-vpe/cal.c                    |  2 +-
 drivers/media/platform/ti-vpe/vpe.c                    |  2 +-
 drivers/media/platform/via-camera.c                    |  2 +-
 drivers/media/platform/vicodec/vicodec-core.c          |  2 +-
 drivers/media/platform/vim2m.c                         |  2 +-
 drivers/media/platform/vimc/vimc-capture.c             |  2 +-
 drivers/media/platform/vivid/vivid-core.c              | 10 +++++-----
 drivers/media/platform/vsp1/vsp1_histo.c               |  4 ++--
 drivers/media/platform/vsp1/vsp1_video.c               |  4 ++--
 drivers/media/platform/xilinx/xilinx-dma.c             |  4 ++--
 57 files changed, 70 insertions(+), 70 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 09104304bd06..e3f302bc2f96 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -2267,7 +2267,7 @@ static int vpfe_probe_complete(struct vpfe_device *vpfe)
 	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
 			    V4L2_CAP_READWRITE;
 	video_set_drvdata(vdev, vpfe);
-	err = video_register_device(&vpfe->video_dev, VFL_TYPE_GRABBER, -1);
+	err = video_register_device(&vpfe->video_dev, VFL_TYPE_VIDEO, -1);
 	if (err) {
 		vpfe_err(vpfe,
 			"Unable to register video device.\n");
diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index d8593cb2ae84..51e5f9708a46 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -1565,14 +1565,14 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
 		V4L2_CAP_STREAMING;
 	vdev->v4l2_dev = v4l2_dev;
 	strscpy(vdev->name, DEVICE_NAME, sizeof(vdev->name));
-	vdev->vfl_type = VFL_TYPE_GRABBER;
+	vdev->vfl_type = VFL_TYPE_VIDEO;
 	vdev->vfl_dir = VFL_DIR_RX;
 	vdev->release = video_device_release_empty;
 	vdev->ioctl_ops = &aspeed_video_ioctl_ops;
 	vdev->lock = &video->video_lock;
 
 	video_set_drvdata(vdev, video);
-	rc = video_register_device(vdev, VFL_TYPE_GRABBER, 0);
+	rc = video_register_device(vdev, VFL_TYPE_VIDEO, 0);
 	if (rc) {
 		vb2_queue_release(vbq);
 		v4l2_ctrl_handler_free(&video->ctrl_handler);
diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index d7669a03e98e..caf6a70d6385 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -2143,7 +2143,7 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
 	vdev->device_caps	= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE;
 	video_set_drvdata(vdev, isc);
 
-	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret < 0) {
 		v4l2_err(&isc->v4l2_dev,
 			 "video_register_device failed: %d\n", ret);
diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index 963dfd6e750e..d74aa73f26be 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -1094,7 +1094,7 @@ static int isi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 		return ret;
 	}
 
-	ret = video_register_device(isi->vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(isi->vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		dev_err(isi->dev, "Failed to register video device\n");
 		return ret;
diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index acff10ad257a..d0d093dd8f7c 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -2726,7 +2726,7 @@ static int coda_register_device(struct coda_dev *dev, int i)
 	v4l2_disable_ioctl(vfd, VIDIOC_G_CROP);
 	v4l2_disable_ioctl(vfd, VIDIOC_S_CROP);
 
-	ret = video_register_device(vfd, VFL_TYPE_GRABBER, 0);
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
 	if (!ret)
 		v4l2_info(&dev->v4l2_dev, "%s registered as %s\n",
 			  type == CODA_INST_ENCODER ? "encoder" : "decoder",
diff --git a/drivers/media/platform/davinci/vpbe_display.c b/drivers/media/platform/davinci/vpbe_display.c
index ae419958e420..38d3088d4d38 100644
--- a/drivers/media/platform/davinci/vpbe_display.c
+++ b/drivers/media/platform/davinci/vpbe_display.c
@@ -1339,7 +1339,7 @@ static int register_device(struct vpbe_layer *vpbe_display_layer,
 
 	vpbe_display_layer->video_dev.queue = &vpbe_display_layer->buffer_queue;
 	err = video_register_device(&vpbe_display_layer->video_dev,
-				    VFL_TYPE_GRABBER,
+				    VFL_TYPE_VIDEO,
 				    -1);
 	if (err)
 		return -ENODEV;
diff --git a/drivers/media/platform/davinci/vpfe_capture.c b/drivers/media/platform/davinci/vpfe_capture.c
index 9b1d9643589b..5606da559bdf 100644
--- a/drivers/media/platform/davinci/vpfe_capture.c
+++ b/drivers/media/platform/davinci/vpfe_capture.c
@@ -1780,7 +1780,7 @@ static int vpfe_probe(struct platform_device *pdev)
 		"video_dev=%p\n", &vpfe_dev->video_dev);
 	vpfe_dev->fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	ret = video_register_device(&vpfe_dev->video_dev,
-				    VFL_TYPE_GRABBER, -1);
+				    VFL_TYPE_VIDEO, -1);
 
 	if (ret) {
 		v4l2_err(pdev->dev.driver,
diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
index 71f4fe882d13..d9ec439faefa 100644
--- a/drivers/media/platform/davinci/vpif_capture.c
+++ b/drivers/media/platform/davinci/vpif_capture.c
@@ -1466,7 +1466,7 @@ static int vpif_probe_complete(void)
 		vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
 		video_set_drvdata(&ch->video_dev, ch);
 		err = video_register_device(vdev,
-					    VFL_TYPE_GRABBER, (j ? 1 : 0));
+					    VFL_TYPE_VIDEO, (j ? 1 : 0));
 		if (err)
 			goto probe_out;
 	}
diff --git a/drivers/media/platform/davinci/vpif_display.c b/drivers/media/platform/davinci/vpif_display.c
index abbdbac08e6f..ead14c49d4f5 100644
--- a/drivers/media/platform/davinci/vpif_display.c
+++ b/drivers/media/platform/davinci/vpif_display.c
@@ -1214,7 +1214,7 @@ static int vpif_probe_complete(void)
 		vdev->lock = &common->lock;
 		vdev->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
 		video_set_drvdata(&ch->video_dev, ch);
-		err = video_register_device(vdev, VFL_TYPE_GRABBER,
+		err = video_register_device(vdev, VFL_TYPE_VIDEO,
 					    (j ? 3 : 2));
 		if (err < 0)
 			goto probe_out;
diff --git a/drivers/media/platform/exynos-gsc/gsc-m2m.c b/drivers/media/platform/exynos-gsc/gsc-m2m.c
index 35a1d0d6dd66..e2c162635f72 100644
--- a/drivers/media/platform/exynos-gsc/gsc-m2m.c
+++ b/drivers/media/platform/exynos-gsc/gsc-m2m.c
@@ -771,7 +771,7 @@ int gsc_register_m2m_device(struct gsc_dev *gsc)
 		return PTR_ERR(gsc->m2m.m2m_dev);
 	}
 
-	ret = video_register_device(&gsc->vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(&gsc->vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		dev_err(&pdev->dev,
 			 "%s(): failed to register video device\n", __func__);
diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
index 121d609ff856..705f182330ca 100644
--- a/drivers/media/platform/exynos4-is/fimc-capture.c
+++ b/drivers/media/platform/exynos4-is/fimc-capture.c
@@ -1808,7 +1808,7 @@ static int fimc_register_capture_device(struct fimc_dev *fimc,
 	if (ret)
 		goto err_me_cleanup;
 
-	ret = video_register_device(vfd, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
 	if (ret)
 		goto err_ctrl_free;
 
diff --git a/drivers/media/platform/exynos4-is/fimc-isp-video.c b/drivers/media/platform/exynos4-is/fimc-isp-video.c
index d2cbcdca0463..15f443fa7208 100644
--- a/drivers/media/platform/exynos4-is/fimc-isp-video.c
+++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
@@ -619,7 +619,7 @@ int fimc_isp_video_device_register(struct fimc_isp *isp,
 
 	video_set_drvdata(vdev, isp);
 
-	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret < 0) {
 		media_entity_cleanup(&vdev->entity);
 		return ret;
diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
index e87c6a09205b..8ce8dfcb5aee 100644
--- a/drivers/media/platform/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/exynos4-is/fimc-lite.c
@@ -1297,7 +1297,7 @@ static int fimc_lite_subdev_registered(struct v4l2_subdev *sd)
 	video_set_drvdata(vfd, fimc);
 	fimc->ve.pipe = v4l2_get_subdev_hostdata(sd);
 
-	ret = video_register_device(vfd, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
 	if (ret < 0) {
 		media_entity_cleanup(&vfd->entity);
 		fimc->ve.pipe = NULL;
diff --git a/drivers/media/platform/exynos4-is/fimc-m2m.c b/drivers/media/platform/exynos4-is/fimc-m2m.c
index c70c2cbe3eb1..4acb179556c4 100644
--- a/drivers/media/platform/exynos4-is/fimc-m2m.c
+++ b/drivers/media/platform/exynos4-is/fimc-m2m.c
@@ -746,7 +746,7 @@ int fimc_register_m2m_device(struct fimc_dev *fimc,
 	if (ret)
 		goto err_me;
 
-	ret = video_register_device(vfd, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
 	if (ret)
 		goto err_vd;
 
diff --git a/drivers/media/platform/fsl-viu.c b/drivers/media/platform/fsl-viu.c
index 81a8faedbba6..84633a3b8475 100644
--- a/drivers/media/platform/fsl-viu.c
+++ b/drivers/media/platform/fsl-viu.c
@@ -1486,7 +1486,7 @@ static int viu_of_probe(struct platform_device *op)
 
 	mutex_lock(&viu_dev->lock);
 
-	ret = video_register_device(viu_dev->vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(viu_dev->vdev, VFL_TYPE_VIDEO, -1);
 	if (ret < 0) {
 		video_device_release(viu_dev->vdev);
 		goto err_unlock;
diff --git a/drivers/media/platform/imx-pxp.c b/drivers/media/platform/imx-pxp.c
index 38d942322302..08d76eb05ed1 100644
--- a/drivers/media/platform/imx-pxp.c
+++ b/drivers/media/platform/imx-pxp.c
@@ -1709,7 +1709,7 @@ static int pxp_probe(struct platform_device *pdev)
 		goto err_v4l2;
 	}
 
-	ret = video_register_device(vfd, VFL_TYPE_GRABBER, 0);
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
 		goto err_m2m;
diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
index 9ad24c86c5ab..1f89e71cdccf 100644
--- a/drivers/media/platform/m2m-deinterlace.c
+++ b/drivers/media/platform/m2m-deinterlace.c
@@ -953,7 +953,7 @@ static int deinterlace_probe(struct platform_device *pdev)
 	vfd->lock = &pcdev->dev_mutex;
 	vfd->v4l2_dev = &pcdev->v4l2_dev;
 
-	ret = video_register_device(vfd, VFL_TYPE_GRABBER, 0);
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		v4l2_err(&pcdev->v4l2_dev, "Failed to register video device\n");
 		goto unreg_dev;
diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/media/platform/marvell-ccic/mcam-core.c
index 803baf97f06e..09775b6624c6 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.c
+++ b/drivers/media/platform/marvell-ccic/mcam-core.c
@@ -1802,7 +1802,7 @@ static int mccic_notify_bound(struct v4l2_async_notifier *notifier,
 	cam->vdev.lock = &cam->s_mutex;
 	cam->vdev.queue = &cam->vb_queue;
 	video_set_drvdata(&cam->vdev, cam);
-	ret = video_register_device(&cam->vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(&cam->vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		cam->sensor = NULL;
 		goto out;
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index ee802fc3bcdf..f82a81a3bdee 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -1150,7 +1150,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	jpeg->dec_vdev->device_caps = V4L2_CAP_STREAMING |
 				      V4L2_CAP_VIDEO_M2M_MPLANE;
 
-	ret = video_register_device(jpeg->dec_vdev, VFL_TYPE_GRABBER, 3);
+	ret = video_register_device(jpeg->dec_vdev, VFL_TYPE_VIDEO, 3);
 	if (ret) {
 		v4l2_err(&jpeg->v4l2_dev, "Failed to register video device\n");
 		goto err_dec_vdev_register;
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
index 7c9e2d69e21a..821f2cf325f0 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
@@ -1229,7 +1229,7 @@ int mtk_mdp_register_m2m_device(struct mtk_mdp_dev *mdp)
 		goto err_m2m_init;
 	}
 
-	ret = video_register_device(mdp->vdev, VFL_TYPE_GRABBER, 2);
+	ret = video_register_device(mdp->vdev, VFL_TYPE_VIDEO, 2);
 	if (ret) {
 		dev_err(dev, "failed to register video device\n");
 		goto err_vdev_register;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 100ae8c5e702..97a1b6664c20 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -331,7 +331,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_event_workq;
 	}
 
-	ret = video_register_device(vfd_dec, VFL_TYPE_GRABBER, 0);
+	ret = video_register_device(vfd_dec, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		mtk_v4l2_err("Failed to register video device");
 		goto err_dec_reg;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 1d82aa2b6017..4d31f1ed113f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -356,7 +356,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_event_workq;
 	}
 
-	ret = video_register_device(vfd_enc, VFL_TYPE_GRABBER, 1);
+	ret = video_register_device(vfd_enc, VFL_TYPE_VIDEO, 1);
 	if (ret) {
 		mtk_v4l2_err("Failed to register video device");
 		goto err_enc_reg;
diff --git a/drivers/media/platform/mx2_emmaprp.c b/drivers/media/platform/mx2_emmaprp.c
index 27779b75df54..df78df59da45 100644
--- a/drivers/media/platform/mx2_emmaprp.c
+++ b/drivers/media/platform/mx2_emmaprp.c
@@ -866,7 +866,7 @@ static int emmaprp_probe(struct platform_device *pdev)
 		goto rel_vdev;
 	}
 
-	ret = video_register_device(vfd, VFL_TYPE_GRABBER, 0);
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		v4l2_err(&pcdev->v4l2_dev, "Failed to register video device\n");
 		goto rel_m2m;
diff --git a/drivers/media/platform/omap/omap_vout.c b/drivers/media/platform/omap/omap_vout.c
index 513b99bf963b..21193f0b7f61 100644
--- a/drivers/media/platform/omap/omap_vout.c
+++ b/drivers/media/platform/omap/omap_vout.c
@@ -1500,7 +1500,7 @@ static int __init omap_vout_create_video_devices(struct platform_device *pdev)
 		/* Register the Video device with V4L2
 		 */
 		vfd = vout->vfd;
-		if (video_register_device(vfd, VFL_TYPE_GRABBER, -1) < 0) {
+		if (video_register_device(vfd, VFL_TYPE_VIDEO, -1) < 0) {
 			dev_err(&pdev->dev,
 				": Could not register Video for Linux device\n");
 			vfd->minor = -1;
diff --git a/drivers/media/platform/omap3isp/ispvideo.c b/drivers/media/platform/omap3isp/ispvideo.c
index ee183c35ff3b..0ed250ffd95b 100644
--- a/drivers/media/platform/omap3isp/ispvideo.c
+++ b/drivers/media/platform/omap3isp/ispvideo.c
@@ -1453,7 +1453,7 @@ int omap3isp_video_init(struct isp_video *video, const char *name)
 	video->video.fops = &isp_video_fops;
 	snprintf(video->video.name, sizeof(video->video.name),
 		 "OMAP3 ISP %s %s", name, direction);
-	video->video.vfl_type = VFL_TYPE_GRABBER;
+	video->video.vfl_type = VFL_TYPE_VIDEO;
 	video->video.release = video_device_release_empty;
 	video->video.ioctl_ops = &isp_video_ioctl_ops;
 	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
@@ -1484,7 +1484,7 @@ int omap3isp_video_register(struct isp_video *video, struct v4l2_device *vdev)
 
 	video->video.v4l2_dev = vdev;
 
-	ret = video_register_device(&video->video, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(&video->video, VFL_TYPE_VIDEO, -1);
 	if (ret < 0)
 		dev_err(video->isp->dev,
 			"%s: could not register video device (%d)\n",
diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
index 43ae645d866b..5b98e945befb 100644
--- a/drivers/media/platform/pxa_camera.c
+++ b/drivers/media/platform/pxa_camera.c
@@ -2191,7 +2191,7 @@ static int pxa_camera_sensor_bound(struct v4l2_async_notifier *notifier,
 	if (err)
 		goto out_sensor_poweroff;
 
-	err = video_register_device(&pcdev->vdev, VFL_TYPE_GRABBER, -1);
+	err = video_register_device(&pcdev->vdev, VFL_TYPE_VIDEO, -1);
 	if (err) {
 		v4l2_err(v4l2_dev, "register video device failed: %d\n", err);
 		pcdev->sensor = NULL;
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 1d50dfbbb762..c4220778ad47 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -921,7 +921,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 	vdev->lock = &video->lock;
 	strscpy(vdev->name, name, sizeof(vdev->name));
 
-	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret < 0) {
 		dev_err(v4l2_dev->dev, "Failed to register video device: %d\n",
 			ret);
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 8feaf5daece9..32f0abd4f2fe 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1458,7 +1458,7 @@ static int vdec_probe(struct platform_device *pdev)
 	vdev->v4l2_dev = &core->v4l2_dev;
 	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
 
-	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret)
 		goto err_vdev_release;
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 453edf966d4f..adaa2237fd8f 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1281,7 +1281,7 @@ static int venc_probe(struct platform_device *pdev)
 	vdev->v4l2_dev = &core->v4l2_dev;
 	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
 
-	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret)
 		goto err_vdev_release;
 
diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 5ff565e76bca..cafc13856c04 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -953,7 +953,7 @@ int rvin_v4l2_register(struct rvin_dev *vin)
 
 	rvin_format_align(vin, &vin->format);
 
-	ret = video_register_device(&vin->vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(&vin->vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		vin_err(vin, "Failed to register video device\n");
 		return ret;
diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
index 97bed45360f0..c9448de885b6 100644
--- a/drivers/media/platform/rcar_fdp1.c
+++ b/drivers/media/platform/rcar_fdp1.c
@@ -2344,7 +2344,7 @@ static int fdp1_probe(struct platform_device *pdev)
 	video_set_drvdata(vfd, fdp1);
 	strscpy(vfd->name, fdp1_videodev.name, sizeof(vfd->name));
 
-	ret = video_register_device(vfd, VFL_TYPE_GRABBER, 0);
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		v4l2_err(&fdp1->v4l2_dev, "Failed to register video device\n");
 		goto release_m2m;
diff --git a/drivers/media/platform/rcar_jpu.c b/drivers/media/platform/rcar_jpu.c
index 1c3f507acfc9..5250a14324e9 100644
--- a/drivers/media/platform/rcar_jpu.c
+++ b/drivers/media/platform/rcar_jpu.c
@@ -1663,7 +1663,7 @@ static int jpu_probe(struct platform_device *pdev)
 	jpu->vfd_encoder.device_caps	= V4L2_CAP_STREAMING |
 					  V4L2_CAP_VIDEO_M2M_MPLANE;
 
-	ret = video_register_device(&jpu->vfd_encoder, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(&jpu->vfd_encoder, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		v4l2_err(&jpu->v4l2_dev, "Failed to register video device\n");
 		goto m2m_init_rollback;
@@ -1682,7 +1682,7 @@ static int jpu_probe(struct platform_device *pdev)
 	jpu->vfd_decoder.device_caps	= V4L2_CAP_STREAMING |
 					  V4L2_CAP_VIDEO_M2M_MPLANE;
 
-	ret = video_register_device(&jpu->vfd_decoder, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(&jpu->vfd_decoder, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		v4l2_err(&jpu->v4l2_dev, "Failed to register video device\n");
 		goto enc_vdev_register_rollback;
diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
index 197b3991330d..f7d71a6a7970 100644
--- a/drivers/media/platform/renesas-ceu.c
+++ b/drivers/media/platform/renesas-ceu.c
@@ -1450,7 +1450,7 @@ static int ceu_notify_complete(struct v4l2_async_notifier *notifier)
 				  V4L2_CAP_STREAMING;
 	video_set_drvdata(vdev, ceudev);
 
-	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret < 0) {
 		v4l2_err(vdev->v4l2_dev,
 			 "video_register_device failed: %d\n", ret);
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index e9ff12b6b5bb..9d122429706e 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -889,7 +889,7 @@ static int rga_probe(struct platform_device *pdev)
 	def_frame.stride = (def_frame.width * def_frame.fmt->depth) >> 3;
 	def_frame.size = def_frame.stride * def_frame.height;
 
-	ret = video_register_device(vfd, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		v4l2_err(&rga->v4l2_dev, "Failed to register video device\n");
 		goto rel_vdev;
diff --git a/drivers/media/platform/s3c-camif/camif-capture.c b/drivers/media/platform/s3c-camif/camif-capture.c
index 2fb45db8e4ba..9ca49af29542 100644
--- a/drivers/media/platform/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/s3c-camif/camif-capture.c
@@ -1158,7 +1158,7 @@ int s3c_camif_register_video_node(struct camif_dev *camif, int idx)
 	vfd->ctrl_handler = &vp->ctrl_handler;
 	vfd->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE;
 
-	ret = video_register_device(vfd, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
 	if (ret)
 		goto err_ctrlh_free;
 
diff --git a/drivers/media/platform/s5p-g2d/g2d.c b/drivers/media/platform/s5p-g2d/g2d.c
index f5f05ea9f521..6932fd47071b 100644
--- a/drivers/media/platform/s5p-g2d/g2d.c
+++ b/drivers/media/platform/s5p-g2d/g2d.c
@@ -695,7 +695,7 @@ static int g2d_probe(struct platform_device *pdev)
 	vfd->lock = &dev->mutex;
 	vfd->v4l2_dev = &dev->v4l2_dev;
 	vfd->device_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING;
-	ret = video_register_device(vfd, VFL_TYPE_GRABBER, 0);
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
 		goto rel_vdev;
diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c b/drivers/media/platform/s5p-jpeg/jpeg-core.c
index ac2162235cef..86bda3947110 100644
--- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
@@ -2946,7 +2946,7 @@ static int s5p_jpeg_probe(struct platform_device *pdev)
 	jpeg->vfd_encoder->vfl_dir	= VFL_DIR_M2M;
 	jpeg->vfd_encoder->device_caps	= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M;
 
-	ret = video_register_device(jpeg->vfd_encoder, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(jpeg->vfd_encoder, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		v4l2_err(&jpeg->v4l2_dev, "Failed to register video device\n");
 		video_device_release(jpeg->vfd_encoder);
@@ -2976,7 +2976,7 @@ static int s5p_jpeg_probe(struct platform_device *pdev)
 	jpeg->vfd_decoder->vfl_dir	= VFL_DIR_M2M;
 	jpeg->vfd_decoder->device_caps	= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M;
 
-	ret = video_register_device(jpeg->vfd_decoder, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(jpeg->vfd_decoder, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		v4l2_err(&jpeg->v4l2_dev, "Failed to register video device\n");
 		video_device_release(jpeg->vfd_decoder);
diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
index b776f83e395e..5c2a23b953a4 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
@@ -1376,7 +1376,7 @@ static int s5p_mfc_probe(struct platform_device *pdev)
 	s5p_mfc_init_regs(dev);
 
 	/* Register decoder and encoder */
-	ret = video_register_device(dev->vfd_dec, VFL_TYPE_GRABBER, 0);
+	ret = video_register_device(dev->vfd_dec, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
 		goto err_dec_reg;
@@ -1384,7 +1384,7 @@ static int s5p_mfc_probe(struct platform_device *pdev)
 	v4l2_info(&dev->v4l2_dev,
 		  "decoder registered as /dev/video%d\n", dev->vfd_dec->num);
 
-	ret = video_register_device(dev->vfd_enc, VFL_TYPE_GRABBER, 0);
+	ret = video_register_device(dev->vfd_enc, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
 		goto err_enc_reg;
diff --git a/drivers/media/platform/sh_veu.c b/drivers/media/platform/sh_veu.c
index 2b4c0d9d6928..f08b8fc192d8 100644
--- a/drivers/media/platform/sh_veu.c
+++ b/drivers/media/platform/sh_veu.c
@@ -1160,7 +1160,7 @@ static int sh_veu_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_resume(&pdev->dev);
 
-	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	pm_runtime_suspend(&pdev->dev);
 	if (ret < 0)
 		goto evidreg;
diff --git a/drivers/media/platform/sh_vou.c b/drivers/media/platform/sh_vou.c
index 2236702c21b4..36e5f2ff4ef1 100644
--- a/drivers/media/platform/sh_vou.c
+++ b/drivers/media/platform/sh_vou.c
@@ -1323,7 +1323,7 @@ static int sh_vou_probe(struct platform_device *pdev)
 		goto ei2cnd;
 	}
 
-	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret < 0)
 		goto evregdev;
 
diff --git a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
index d1025a53709f..af2d5eb782ce 100644
--- a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
+++ b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
@@ -1066,7 +1066,7 @@ static int bdisp_register_device(struct bdisp_dev *bdisp)
 		return PTR_ERR(bdisp->m2m.m2m_dev);
 	}
 
-	ret = video_register_device(&bdisp->vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(&bdisp->vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		dev_err(bdisp->dev,
 			"%s(): failed to register video device\n", __func__);
diff --git a/drivers/media/platform/sti/delta/delta-v4l2.c b/drivers/media/platform/sti/delta/delta-v4l2.c
index 91369fb3ffaa..2503224eeee5 100644
--- a/drivers/media/platform/sti/delta/delta-v4l2.c
+++ b/drivers/media/platform/sti/delta/delta-v4l2.c
@@ -1781,7 +1781,7 @@ static int delta_register_device(struct delta_dev *delta)
 	snprintf(vdev->name, sizeof(vdev->name), "%s-%s",
 		 DELTA_NAME, DELTA_FW_VERSION);
 
-	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		dev_err(delta->dev, "%s failed to register video device\n",
 			DELTA_PREFIX);
diff --git a/drivers/media/platform/sti/hva/hva-v4l2.c b/drivers/media/platform/sti/hva/hva-v4l2.c
index 64004d15a9c9..197b99d8fd9c 100644
--- a/drivers/media/platform/sti/hva/hva-v4l2.c
+++ b/drivers/media/platform/sti/hva/hva-v4l2.c
@@ -1316,7 +1316,7 @@ static int hva_register_device(struct hva_dev *hva)
 	snprintf(vdev->name, sizeof(vdev->name), "%s%lx", HVA_NAME,
 		 hva->ip_version);
 
-	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		dev_err(dev, "%s failed to register video device\n",
 			HVA_PREFIX);
diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index 9392e3409fba..49a91125e877 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -1971,7 +1971,7 @@ static int dcmi_probe(struct platform_device *pdev)
 	}
 	dcmi->vdev->entity.flags |= MEDIA_ENT_FL_DEFAULT;
 
-	ret = video_register_device(dcmi->vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(dcmi->vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		dev_err(dcmi->dev, "Failed to register video device\n");
 		goto err_media_entity_cleanup;
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
index 83a3a0257c7b..5aee3fd875ad 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
@@ -374,7 +374,7 @@ int sun4i_csi_v4l2_register(struct sun4i_csi *csi)
 	vdev->ioctl_ops = &sun4i_csi_ioctl_ops;
 	video_set_drvdata(vdev, csi);
 
-	ret = video_register_device(&csi->vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(&csi->vdev, VFL_TYPE_VIDEO, -1);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
index f0dfe68486d1..cb30efb5d1f1 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
@@ -648,7 +648,7 @@ int sun6i_video_init(struct sun6i_video *video, struct sun6i_csi *csi,
 	vdev->release		= video_device_release_empty;
 	vdev->fops		= &sun6i_video_fops;
 	vdev->ioctl_ops		= &sun6i_video_ioctl_ops;
-	vdev->vfl_type		= VFL_TYPE_GRABBER;
+	vdev->vfl_type		= VFL_TYPE_VIDEO;
 	vdev->vfl_dir		= VFL_DIR_RX;
 	vdev->v4l2_dev		= &csi->v4l2_dev;
 	vdev->queue		= vidq;
@@ -656,7 +656,7 @@ int sun6i_video_init(struct sun6i_video *video, struct sun6i_csi *csi,
 	vdev->device_caps	= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE;
 	video_set_drvdata(vdev, video);
 
-	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret < 0) {
 		v4l2_err(&csi->v4l2_dev,
 			 "video_register_device failed: %d\n", ret);
diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index b61f3dea7c93..214567367324 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -882,7 +882,7 @@ static int deinterlace_probe(struct platform_device *pdev)
 		 deinterlace_video_device.name);
 	video_set_drvdata(vfd, dev);
 
-	ret = video_register_device(vfd, VFL_TYPE_GRABBER, 0);
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
 
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index be54806180a5..6e009e479be3 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1948,7 +1948,7 @@ static int cal_complete_ctx(struct cal_ctx *ctx)
 	vfd->lock = &ctx->mutex;
 	video_set_drvdata(vfd, ctx);
 
-	ret = video_register_device(vfd, VFL_TYPE_GRABBER, video_nr);
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, video_nr);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index 65c2c048b018..cff2fcd6d812 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -2500,7 +2500,7 @@ static void vpe_fw_cb(struct platform_device *pdev)
 	vfd->lock = &dev->dev_mutex;
 	vfd->v4l2_dev = &dev->v4l2_dev;
 
-	ret = video_register_device(vfd, VFL_TYPE_GRABBER, 0);
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		vpe_err(dev, "Failed to register video device\n");
 
diff --git a/drivers/media/platform/via-camera.c b/drivers/media/platform/via-camera.c
index 78841b9015ce..c88fd3403eda 100644
--- a/drivers/media/platform/via-camera.c
+++ b/drivers/media/platform/via-camera.c
@@ -1262,7 +1262,7 @@ static int viacam_probe(struct platform_device *pdev)
 	cam->vdev.lock = &cam->lock;
 	cam->vdev.queue = vq;
 	video_set_drvdata(&cam->vdev, cam);
-	ret = video_register_device(&cam->vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(&cam->vdev, VFL_TYPE_VIDEO, -1);
 	if (ret)
 		goto out_irq;
 
diff --git a/drivers/media/platform/vicodec/vicodec-core.c b/drivers/media/platform/vicodec/vicodec-core.c
index 82350097503e..f78579b48762 100644
--- a/drivers/media/platform/vicodec/vicodec-core.c
+++ b/drivers/media/platform/vicodec/vicodec-core.c
@@ -2120,7 +2120,7 @@ static int register_instance(struct vicodec_dev *dev,
 	}
 	video_set_drvdata(vfd, dev);
 
-	ret = video_register_device(vfd, VFL_TYPE_GRABBER, 0);
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device '%s'\n", name);
 		v4l2_m2m_release(dev_instance->m2m_dev);
diff --git a/drivers/media/platform/vim2m.c b/drivers/media/platform/vim2m.c
index 8d6b09623d88..ac6717fbb764 100644
--- a/drivers/media/platform/vim2m.c
+++ b/drivers/media/platform/vim2m.c
@@ -1333,7 +1333,7 @@ static int vim2m_probe(struct platform_device *pdev)
 	vfd->lock = &dev->dev_mutex;
 	vfd->v4l2_dev = &dev->v4l2_dev;
 
-	ret = video_register_device(vfd, VFL_TYPE_GRABBER, 0);
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
 		goto error_v4l2;
diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index 76c015898cfd..0615aa4dc733 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -460,7 +460,7 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 	video_set_drvdata(vdev, &vcap->ved);
 
 	/* Register the video_device with the v4l2 and the media framework */
-	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		dev_err(&vimc->pdev.dev, "%s: video register failed (err=%d)\n",
 			vcap->vdev.name, ret);
diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
index 15091cbf6de7..c62c068b6b60 100644
--- a/drivers/media/platform/vivid/vivid-core.c
+++ b/drivers/media/platform/vivid/vivid-core.c
@@ -407,7 +407,7 @@ static int vidioc_log_status(struct file *file, void *fh)
 	struct video_device *vdev = video_devdata(file);
 
 	v4l2_ctrl_log_status(file, fh);
-	if (vdev->vfl_dir == VFL_DIR_RX && vdev->vfl_type == VFL_TYPE_GRABBER)
+	if (vdev->vfl_dir == VFL_DIR_RX && vdev->vfl_type == VFL_TYPE_VIDEO)
 		tpg_log_status(&dev->tpg);
 	return 0;
 }
@@ -1525,7 +1525,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		}
 #endif
 
-		ret = video_register_device(vfd, VFL_TYPE_GRABBER, vid_cap_nr[inst]);
+		ret = video_register_device(vfd, VFL_TYPE_VIDEO, vid_cap_nr[inst]);
 		if (ret < 0)
 			goto unreg_dev;
 		v4l2_info(&dev->v4l2_dev, "V4L2 capture device registered as %s\n",
@@ -1578,7 +1578,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		}
 #endif
 
-		ret = video_register_device(vfd, VFL_TYPE_GRABBER, vid_out_nr[inst]);
+		ret = video_register_device(vfd, VFL_TYPE_VIDEO, vid_out_nr[inst]);
 		if (ret < 0)
 			goto unreg_dev;
 		v4l2_info(&dev->v4l2_dev, "V4L2 output device registered as %s\n",
@@ -1734,7 +1734,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		if (ret)
 			goto unreg_dev;
 #endif
-		ret = video_register_device(vfd, VFL_TYPE_GRABBER,
+		ret = video_register_device(vfd, VFL_TYPE_VIDEO,
 					    meta_cap_nr[inst]);
 		if (ret < 0)
 			goto unreg_dev;
@@ -1764,7 +1764,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		if (ret)
 			goto unreg_dev;
 #endif
-		ret = video_register_device(vfd, VFL_TYPE_GRABBER,
+		ret = video_register_device(vfd, VFL_TYPE_VIDEO,
 					    meta_out_nr[inst]);
 		if (ret < 0)
 			goto unreg_dev;
diff --git a/drivers/media/platform/vsp1/vsp1_histo.c b/drivers/media/platform/vsp1/vsp1_histo.c
index 30d751f2cccf..a91e142bcb94 100644
--- a/drivers/media/platform/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/vsp1/vsp1_histo.c
@@ -551,7 +551,7 @@ int vsp1_histogram_init(struct vsp1_device *vsp1, struct vsp1_histogram *histo,
 	histo->video.fops = &histo_v4l2_fops;
 	snprintf(histo->video.name, sizeof(histo->video.name),
 		 "%s histo", histo->entity.subdev.name);
-	histo->video.vfl_type = VFL_TYPE_GRABBER;
+	histo->video.vfl_type = VFL_TYPE_VIDEO;
 	histo->video.release = video_device_release_empty;
 	histo->video.ioctl_ops = &histo_v4l2_ioctl_ops;
 	histo->video.device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
@@ -576,7 +576,7 @@ int vsp1_histogram_init(struct vsp1_device *vsp1, struct vsp1_histogram *histo,
 
 	/* ... and register the video device. */
 	histo->video.queue = &histo->queue;
-	ret = video_register_device(&histo->video, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(&histo->video, VFL_TYPE_VIDEO, -1);
 	if (ret < 0) {
 		dev_err(vsp1->dev, "failed to register video device\n");
 		goto error;
diff --git a/drivers/media/platform/vsp1/vsp1_video.c b/drivers/media/platform/vsp1/vsp1_video.c
index 5e59ed2c3614..044eb5778820 100644
--- a/drivers/media/platform/vsp1/vsp1_video.c
+++ b/drivers/media/platform/vsp1/vsp1_video.c
@@ -1293,7 +1293,7 @@ struct vsp1_video *vsp1_video_create(struct vsp1_device *vsp1,
 	video->video.fops = &vsp1_video_fops;
 	snprintf(video->video.name, sizeof(video->video.name), "%s %s",
 		 rwpf->entity.subdev.name, direction);
-	video->video.vfl_type = VFL_TYPE_GRABBER;
+	video->video.vfl_type = VFL_TYPE_VIDEO;
 	video->video.release = video_device_release_empty;
 	video->video.ioctl_ops = &vsp1_video_ioctl_ops;
 
@@ -1316,7 +1316,7 @@ struct vsp1_video *vsp1_video_create(struct vsp1_device *vsp1,
 
 	/* ... and register the video device. */
 	video->video.queue = &video->queue;
-	ret = video_register_device(&video->video, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(&video->video, VFL_TYPE_VIDEO, -1);
 	if (ret < 0) {
 		dev_err(video->vsp1->dev, "failed to register video device\n");
 		goto error;
diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
index b211380a11f2..7ca0bb6a54fa 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -685,7 +685,7 @@ int xvip_dma_init(struct xvip_composite_device *xdev, struct xvip_dma *dma,
 		 xdev->dev->of_node,
 		 type == V4L2_BUF_TYPE_VIDEO_CAPTURE ? "output" : "input",
 		 port);
-	dma->video.vfl_type = VFL_TYPE_GRABBER;
+	dma->video.vfl_type = VFL_TYPE_VIDEO;
 	dma->video.vfl_dir = type == V4L2_BUF_TYPE_VIDEO_CAPTURE
 			   ? VFL_DIR_RX : VFL_DIR_TX;
 	dma->video.release = video_device_release_empty;
@@ -734,7 +734,7 @@ int xvip_dma_init(struct xvip_composite_device *xdev, struct xvip_dma *dma,
 
 	dma->align = 1 << dma->dma->device->copy_align;
 
-	ret = video_register_device(&dma->video, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(&dma->video, VFL_TYPE_VIDEO, -1);
 	if (ret < 0) {
 		dev_err(dma->xdev->dev, "failed to register video device\n");
 		goto error;
-- 
2.24.0

