Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBB9E56392
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 09:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbfFZHob (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 03:44:31 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:41161 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727007AbfFZHo3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 03:44:29 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id g2bNh3RUP7KeZg2bRhhHnu; Wed, 26 Jun 2019 09:44:26 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 03/16] s3c-camif/s5p-g2d/s5p-jpeg: set device_caps in struct video_device
Date:   Wed, 26 Jun 2019 09:44:08 +0200
Message-Id: <20190626074421.38739-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
References: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPhWcZmTM3uGjHlmVJfH7WGtY8O4exJsKuN6Y6jgaswPyPeLEYLnsiA8QAPwUtSX9L1yu2hoKRQ+jutvRzCZtKYMn2IXFeVoFaBej1YUvmJujVnI0Zq7
 SbSRkngWPdJNYfh3pUXkFmy9UppQLZh792PZ+6nYT5mP06Un/Ji6ujFSv5Ryrpv4VWBvYYupuq1R7j619vWII3XMICSTZbLAmaDXjGQRnJXnGCwfaH6DU8jw
 kSpSNG/wOWjDCAE4eoLYkQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of filling in the struct v4l2_capability device_caps
field, fill in the struct video_device device_caps field.

That way the V4L2 core knows what the capabilities of the
video device are.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/media/platform/s3c-camif/camif-capture.c | 5 +----
 drivers/media/platform/s5p-g2d/g2d.c             | 3 +--
 drivers/media/platform/s5p-jpeg/jpeg-core.c      | 4 ++--
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/s3c-camif/camif-capture.c b/drivers/media/platform/s3c-camif/camif-capture.c
index c3fc94ef251e..2ef0ca9bbbcb 100644
--- a/drivers/media/platform/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/s3c-camif/camif-capture.c
@@ -644,10 +644,6 @@ static int s3c_camif_vidioc_querycap(struct file *file, void *priv,
 	strscpy(cap->card, S3C_CAMIF_DRIVER_NAME, sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s.%d",
 		 dev_name(vp->camif->dev), vp->id);
-
-	cap->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
-
 	return 0;
 }
 
@@ -1166,6 +1162,7 @@ int s3c_camif_register_video_node(struct camif_dev *camif, int idx)
 		goto err_me_cleanup;
 
 	vfd->ctrl_handler = &vp->ctrl_handler;
+	vfd->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE;
 
 	ret = video_register_device(vfd, VFL_TYPE_GRABBER, -1);
 	if (ret)
diff --git a/drivers/media/platform/s5p-g2d/g2d.c b/drivers/media/platform/s5p-g2d/g2d.c
index 152d192d5c3f..131d55cc7450 100644
--- a/drivers/media/platform/s5p-g2d/g2d.c
+++ b/drivers/media/platform/s5p-g2d/g2d.c
@@ -296,8 +296,6 @@ static int vidioc_querycap(struct file *file, void *priv,
 	strscpy(cap->driver, G2D_NAME, sizeof(cap->driver));
 	strscpy(cap->card, G2D_NAME, sizeof(cap->card));
 	cap->bus_info[0] = 0;
-	cap->device_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -704,6 +702,7 @@ static int g2d_probe(struct platform_device *pdev)
 	set_bit(V4L2_FL_QUIRK_INVERTED_CROP, &vfd->flags);
 	vfd->lock = &dev->mutex;
 	vfd->v4l2_dev = &dev->v4l2_dev;
+	vfd->device_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING;
 	ret = video_register_device(vfd, VFL_TYPE_GRABBER, 0);
 	if (ret) {
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c b/drivers/media/platform/s5p-jpeg/jpeg-core.c
index 8cc730eccb6c..3ecb29c75968 100644
--- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
@@ -1288,8 +1288,6 @@ static int s5p_jpeg_querycap(struct file *file, void *priv,
 	}
 	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
 		 dev_name(ctx->jpeg->dev));
-	cap->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -2977,6 +2975,7 @@ static int s5p_jpeg_probe(struct platform_device *pdev)
 	jpeg->vfd_encoder->lock		= &jpeg->lock;
 	jpeg->vfd_encoder->v4l2_dev	= &jpeg->v4l2_dev;
 	jpeg->vfd_encoder->vfl_dir	= VFL_DIR_M2M;
+	jpeg->vfd_encoder->device_caps	= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M;
 
 	ret = video_register_device(jpeg->vfd_encoder, VFL_TYPE_GRABBER, -1);
 	if (ret) {
@@ -3006,6 +3005,7 @@ static int s5p_jpeg_probe(struct platform_device *pdev)
 	jpeg->vfd_decoder->lock		= &jpeg->lock;
 	jpeg->vfd_decoder->v4l2_dev	= &jpeg->v4l2_dev;
 	jpeg->vfd_decoder->vfl_dir	= VFL_DIR_M2M;
+	jpeg->vfd_decoder->device_caps	= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M;
 
 	ret = video_register_device(jpeg->vfd_decoder, VFL_TYPE_GRABBER, -1);
 	if (ret) {
-- 
2.20.1

