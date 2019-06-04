Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 773AC34556
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 13:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727269AbfFDLWc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 07:22:32 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:50883 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727170AbfFDLWc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 07:22:32 -0400
Received: from [IPv6:2001:420:44c1:2579:8c28:9f60:8294:d97] ([IPv6:2001:420:44c1:2579:8c28:9f60:8294:d97])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Y7WMhWc3c3qlsY7WPhYANa; Tue, 04 Jun 2019 13:22:30 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 7/7] staging/media: set device_caps in struct video_device
Message-ID: <d6832f03-915a-91fc-b678-b2daf68d66d9@xs4all.nl>
Date:   Tue, 4 Jun 2019 13:22:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfE3mQBXdWNP1MUYUkW1B0V0DuEnyLxACU+NmDKENKfiLavRYdbPdiNXOPs43uD9PKqupFKkkdBIkHva8Fr52Z/GDrLHvYZddf0nHcbQpjXxXad035OPz
 neO4RcdfhqdChwlJSZkqqBcGh2vwdjfc1nCuCVZJcVfS3Zj1R0b71VPa8Qc25npeyBz3A1PnWgZvwzVQUpOV9O1D2Xy+j3RbVBZOLTR1DttLWNSKubwtAddm
 wlX5vQ10ycX/XmngNJT+U9Syd3+BzM3E9kYbhcHrnQSFFLl1swB1FSMEka/ivoB8NyxpM2uYhf27ZUbRFL1z3bg/eEuemA1XrpMp6tE5V3EyLvME6nxqzk8L
 5wF1xcnztj0j3fHeXbMPdlWaqSf+ng==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From 5e271dce24e2a0e3bad026fff4f8d7485d97aa71 Mon Sep 17 00:00:00 2001
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date: Tue, 4 Jun 2019 11:39:41 +0200
Subject: [PATCH 7/7] staging/media: set device_caps in struct video_device

Instead of filling in the struct v4l2_capability device_caps
field, fill in the struct video_device device_caps field.

That way the V4L2 core knows what the capabilities of the
video device are.

But this only really works if all drivers use this, so convert
all staging/media drivers in this patch.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>
---
 drivers/staging/media/bcm2048/radio-bcm2048.c   |  7 ++-----
 drivers/staging/media/davinci_vpfe/vpfe_video.c |  9 +++++----
 drivers/staging/media/omap4iss/iss_video.c      | 11 +++++------
 3 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/bcm2048/radio-bcm2048.c b/drivers/staging/media/bcm2048/radio-bcm2048.c
index 09903ffb13ba..2c60a1fb6350 100644
--- a/drivers/staging/media/bcm2048/radio-bcm2048.c
+++ b/drivers/staging/media/bcm2048/radio-bcm2048.c
@@ -2310,11 +2310,6 @@ static int bcm2048_vidioc_querycap(struct file *file, void *priv,
 	strscpy(capability->card, BCM2048_DRIVER_CARD,
 		sizeof(capability->card));
 	snprintf(capability->bus_info, 32, "I2C: 0x%X", bdev->client->addr);
-	capability->device_caps = V4L2_CAP_TUNER | V4L2_CAP_RADIO |
-					V4L2_CAP_HW_FREQ_SEEK;
-	capability->capabilities = capability->device_caps |
-		V4L2_CAP_DEVICE_CAPS;
-
 	return 0;
 }

@@ -2570,6 +2565,8 @@ static const struct video_device bcm2048_viddev_template = {
 	.name			= BCM2048_DRIVER_NAME,
 	.release		= video_device_release_empty,
 	.ioctl_ops		= &bcm2048_ioctl_ops,
+	.device_caps		= V4L2_CAP_TUNER | V4L2_CAP_RADIO |
+				  V4L2_CAP_HW_FREQ_SEEK,
 };

 /*
diff --git a/drivers/staging/media/davinci_vpfe/vpfe_video.c b/drivers/staging/media/davinci_vpfe/vpfe_video.c
index 84cca18e3e9d..ab6bc452d9f6 100644
--- a/drivers/staging/media/davinci_vpfe/vpfe_video.c
+++ b/drivers/staging/media/davinci_vpfe/vpfe_video.c
@@ -612,10 +612,6 @@ static int vpfe_querycap(struct file *file, void  *priv,

 	v4l2_dbg(1, debug, &vpfe_dev->v4l2_dev, "vpfe_querycap\n");

-	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
-		cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
-	else
-		cap->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
 	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OUTPUT |
 			    V4L2_CAP_STREAMING | V4L2_CAP_DEVICE_CAPS;
 	strscpy(cap->driver, CAPTURE_DRV_NAME, sizeof(cap->driver));
@@ -1628,6 +1624,11 @@ int vpfe_video_register(struct vpfe_video_device *video,

 	video->video_dev.v4l2_dev = vdev;

+	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		video->video_dev.device_caps = V4L2_CAP_VIDEO_CAPTURE;
+	else
+		video->video_dev.device_caps = V4L2_CAP_VIDEO_OUTPUT;
+	video->video_dev.device_caps |= V4L2_CAP_STREAMING;
 	ret = video_register_device(&video->video_dev, VFL_TYPE_GRABBER, -1);
 	if (ret < 0)
 		pr_err("%s: could not register video device (%d)\n",
diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
index c2c5a9cd8642..c307707480f7 100644
--- a/drivers/staging/media/omap4iss/iss_video.c
+++ b/drivers/staging/media/omap4iss/iss_video.c
@@ -533,12 +533,6 @@ iss_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 	strscpy(cap->driver, ISS_VIDEO_DRIVER_NAME, sizeof(cap->driver));
 	strscpy(cap->card, video->video.name, sizeof(cap->card));
 	strscpy(cap->bus_info, "media", sizeof(cap->bus_info));
-
-	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
-		cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
-	else
-		cap->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
-
 	cap->capabilities = V4L2_CAP_DEVICE_CAPS | V4L2_CAP_STREAMING
 			  | V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OUTPUT;

@@ -1272,6 +1266,11 @@ int omap4iss_video_register(struct iss_video *video, struct v4l2_device *vdev)
 	int ret;

 	video->video.v4l2_dev = vdev;
+	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		video->video.device_caps = V4L2_CAP_VIDEO_CAPTURE;
+	else
+		video->video.device_caps = V4L2_CAP_VIDEO_OUTPUT;
+	video->video.device_caps |= V4L2_CAP_STREAMING;

 	ret = video_register_device(&video->video, VFL_TYPE_GRABBER, -1);
 	if (ret < 0)
-- 
2.20.1

