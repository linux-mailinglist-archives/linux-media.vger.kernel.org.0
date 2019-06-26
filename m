Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 628995638D
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 09:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbfFZHo3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 03:44:29 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:45505 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727000AbfFZHo1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 03:44:27 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id g2bNh3RUP7KeZg2bRhhHnV; Wed, 26 Jun 2019 09:44:25 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>, prabhakar.csengg@gmail.com
Subject: [PATCH 01/16] am437x/davinci: set device_caps in struct video_device
Date:   Wed, 26 Jun 2019 09:44:06 +0200
Message-Id: <20190626074421.38739-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
References: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIj3dZgglss+tf4PXeuCKB+HXvyTYrUKj32m1X7tI6K/ziBELb3FaqsxZxhj9nnBA9jyIwHOfHA95IwCaWb+b4cHtz/EakH0fDudTLunc/74bVfrF/mB
 BTuJt9wQXQHQXTZNN23aWb00JECxh0szhOG996HlnrE/fYccKE4w10VtUgeFDCsOP5+6jnF3xJHUZDxBT/DXUva/xIqIeDXMSiy6IeHnHAQfQHfAXa82rEAA
 +cTq5IpYntpnqpPo3B83BTo7LbAN1hVZt5ltay3yED8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of filling in the struct v4l2_capability device_caps
field, fill in the struct video_device device_caps field.

That way the V4L2 core knows what the capabilities of the
video device are.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: prabhakar.csengg@gmail.com
---
 drivers/media/platform/am437x/am437x-vpfe.c   | 6 ++----
 drivers/media/platform/davinci/vpbe_display.c | 3 +--
 drivers/media/platform/davinci/vpfe_capture.c | 3 +--
 drivers/media/platform/davinci/vpif_capture.c | 3 +--
 drivers/media/platform/davinci/vpif_display.c | 3 +--
 5 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index fe7b937eb5f2..ef635f80d645 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -1412,10 +1412,6 @@ static int vpfe_querycap(struct file *file, void  *priv,
 	strscpy(cap->card, "TI AM437x VPFE", sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info),
 			"platform:%s", vpfe->v4l2_dev.name);
-	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
-			    V4L2_CAP_READWRITE;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
-
 	return 0;
 }
 
@@ -2393,6 +2389,8 @@ static int vpfe_probe_complete(struct vpfe_device *vpfe)
 	vdev->vfl_dir = VFL_DIR_RX;
 	vdev->queue = q;
 	vdev->lock = &vpfe->lock;
+	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
+			    V4L2_CAP_READWRITE;
 	video_set_drvdata(vdev, vpfe);
 	err = video_register_device(&vpfe->video_dev, VFL_TYPE_GRABBER, -1);
 	if (err) {
diff --git a/drivers/media/platform/davinci/vpbe_display.c b/drivers/media/platform/davinci/vpbe_display.c
index 000b191c42d8..8d864b4da65e 100644
--- a/drivers/media/platform/davinci/vpbe_display.c
+++ b/drivers/media/platform/davinci/vpbe_display.c
@@ -633,8 +633,6 @@ static int vpbe_display_querycap(struct file *file, void  *priv,
 	struct vpbe_layer *layer = video_drvdata(file);
 	struct vpbe_device *vpbe_dev = layer->disp_dev->vpbe_dev;
 
-	cap->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	snprintf(cap->driver, sizeof(cap->driver), "%s",
 		dev_name(vpbe_dev->pdev));
 	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
@@ -1319,6 +1317,7 @@ static int init_vpbe_layer(int i, struct vpbe_display *disp_dev,
 	vbd->v4l2_dev   = &disp_dev->vpbe_dev->v4l2_dev;
 	vbd->lock	= &vpbe_display_layer->opslock;
 	vbd->vfl_dir	= VFL_DIR_TX;
+	vbd->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
 
 	if (disp_dev->vpbe_dev->current_timings.timings_type &
 			VPBE_ENC_STD)
diff --git a/drivers/media/platform/davinci/vpfe_capture.c b/drivers/media/platform/davinci/vpfe_capture.c
index 295fbf1a49cf..852fc357e19d 100644
--- a/drivers/media/platform/davinci/vpfe_capture.c
+++ b/drivers/media/platform/davinci/vpfe_capture.c
@@ -877,8 +877,6 @@ static int vpfe_querycap(struct file *file, void  *priv,
 
 	v4l2_dbg(1, debug, &vpfe_dev->v4l2_dev, "vpfe_querycap\n");
 
-	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	strscpy(cap->driver, CAPTURE_DRV_NAME, sizeof(cap->driver));
 	strscpy(cap->bus_info, "VPFE", sizeof(cap->bus_info));
 	strscpy(cap->card, vpfe_dev->cfg->card_name, sizeof(cap->card));
@@ -1785,6 +1783,7 @@ static int vpfe_probe(struct platform_device *pdev)
 	vfd->ioctl_ops		= &vpfe_ioctl_ops;
 	vfd->tvnorms		= 0;
 	vfd->v4l2_dev		= &vpfe_dev->v4l2_dev;
+	vfd->device_caps	= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
 	snprintf(vfd->name, sizeof(vfd->name),
 		 "%s_V%d.%d.%d",
 		 CAPTURE_DRV_NAME,
diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
index f0f7ef638c56..af22fc5050c3 100644
--- a/drivers/media/platform/davinci/vpif_capture.c
+++ b/drivers/media/platform/davinci/vpif_capture.c
@@ -1085,8 +1085,6 @@ static int vpif_querycap(struct file *file, void  *priv,
 {
 	struct vpif_capture_config *config = vpif_dev->platform_data;
 
-	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	strscpy(cap->driver, VPIF_DRIVER_NAME, sizeof(cap->driver));
 	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
 		 dev_name(vpif_dev));
@@ -1473,6 +1471,7 @@ static int vpif_probe_complete(void)
 		vdev->vfl_dir = VFL_DIR_RX;
 		vdev->queue = q;
 		vdev->lock = &common->lock;
+		vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
 		video_set_drvdata(&ch->video_dev, ch);
 		err = video_register_device(vdev,
 					    VFL_TYPE_GRABBER, (j ? 1 : 0));
diff --git a/drivers/media/platform/davinci/vpif_display.c b/drivers/media/platform/davinci/vpif_display.c
index a69897c68a50..91592e766368 100644
--- a/drivers/media/platform/davinci/vpif_display.c
+++ b/drivers/media/platform/davinci/vpif_display.c
@@ -584,8 +584,6 @@ static int vpif_querycap(struct file *file, void  *priv,
 {
 	struct vpif_display_config *config = vpif_dev->platform_data;
 
-	cap->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	strscpy(cap->driver, VPIF_DRIVER_NAME, sizeof(cap->driver));
 	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
 		 dev_name(vpif_dev));
@@ -1218,6 +1216,7 @@ static int vpif_probe_complete(void)
 		vdev->vfl_dir = VFL_DIR_TX;
 		vdev->queue = q;
 		vdev->lock = &common->lock;
+		vdev->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
 		video_set_drvdata(&ch->video_dev, ch);
 		err = video_register_device(vdev, VFL_TYPE_GRABBER,
 					    (j ? 3 : 2));
-- 
2.20.1

