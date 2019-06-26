Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24C5156397
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 09:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbfFZHof (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 03:44:35 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:57875 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727066AbfFZHoe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 03:44:34 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id g2bNh3RUP7KeZg2bZhhHqt; Wed, 26 Jun 2019 09:44:33 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 13/16] vsp1: set device_caps in struct video_device
Date:   Wed, 26 Jun 2019 09:44:18 +0200
Message-Id: <20190626074421.38739-14-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
References: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfK+/Pbz5AvVRS1UXU0Q+52J2RxkY5FhgzLDB7sohwTo/fiN9pebdyzcaCjbxkK2vR7DqhueB1Zu7CMp1bdJhQuRHVIbe3YpcpuwNWYx5TJE306tEpJXZ
 MO/QhiNklhvqyGaW1x0hMTxjmtVUCPu9St0xEmMqDTZtfWL6YC1EEaxm0CF1eGdF25eYzb4na6xk1gUW6mgd53Q9RVW+4Lgvx9PIRzQ8Zmfh7RymUWNLsU8f
 rKD9Yyos1AtOmOV9bWKKd2N0U1/ZvN9eLTnNkSeTYDw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of filling in the struct v4l2_capability device_caps
field, fill in the struct video_device device_caps field.

That way the V4L2 core knows what the capabilities of the
video device are.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/vsp1/vsp1_histo.c |  3 +--
 drivers/media/platform/vsp1/vsp1_video.c | 12 ++++--------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_histo.c b/drivers/media/platform/vsp1/vsp1_histo.c
index 8b01e99acd20..30d751f2cccf 100644
--- a/drivers/media/platform/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/vsp1/vsp1_histo.c
@@ -426,8 +426,6 @@ static int histo_v4l2_querycap(struct file *file, void *fh,
 			  | V4L2_CAP_VIDEO_CAPTURE_MPLANE
 			  | V4L2_CAP_VIDEO_OUTPUT_MPLANE
 			  | V4L2_CAP_META_CAPTURE;
-	cap->device_caps = V4L2_CAP_META_CAPTURE
-			 | V4L2_CAP_STREAMING;
 
 	strscpy(cap->driver, "vsp1", sizeof(cap->driver));
 	strscpy(cap->card, histo->video.name, sizeof(cap->card));
@@ -556,6 +554,7 @@ int vsp1_histogram_init(struct vsp1_device *vsp1, struct vsp1_histogram *histo,
 	histo->video.vfl_type = VFL_TYPE_GRABBER;
 	histo->video.release = video_device_release_empty;
 	histo->video.ioctl_ops = &histo_v4l2_ioctl_ops;
+	histo->video.device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
 
 	video_set_drvdata(&histo->video, histo);
 
diff --git a/drivers/media/platform/vsp1/vsp1_video.c b/drivers/media/platform/vsp1/vsp1_video.c
index fd98e483b2f4..fee2ec45b1d6 100644
--- a/drivers/media/platform/vsp1/vsp1_video.c
+++ b/drivers/media/platform/vsp1/vsp1_video.c
@@ -955,14 +955,6 @@ vsp1_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 	cap->capabilities = V4L2_CAP_DEVICE_CAPS | V4L2_CAP_STREAMING
 			  | V4L2_CAP_VIDEO_CAPTURE_MPLANE
 			  | V4L2_CAP_VIDEO_OUTPUT_MPLANE;
-
-	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
-		cap->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE
-				 | V4L2_CAP_STREAMING;
-	else
-		cap->device_caps = V4L2_CAP_VIDEO_OUTPUT_MPLANE
-				 | V4L2_CAP_STREAMING;
-
 	strscpy(cap->driver, "vsp1", sizeof(cap->driver));
 	strscpy(cap->card, video->video.name, sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
@@ -1268,11 +1260,15 @@ struct vsp1_video *vsp1_video_create(struct vsp1_device *vsp1,
 		video->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
 		video->pad.flags = MEDIA_PAD_FL_SOURCE;
 		video->video.vfl_dir = VFL_DIR_TX;
+		video->video.device_caps = V4L2_CAP_VIDEO_OUTPUT_MPLANE |
+					   V4L2_CAP_STREAMING;
 	} else {
 		direction = "output";
 		video->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 		video->pad.flags = MEDIA_PAD_FL_SINK;
 		video->video.vfl_dir = VFL_DIR_RX;
+		video->video.device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
+					   V4L2_CAP_STREAMING;
 	}
 
 	mutex_init(&video->lock);
-- 
2.20.1

