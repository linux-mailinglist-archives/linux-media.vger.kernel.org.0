Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D80356398
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 09:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbfFZHog (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 03:44:36 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:39193 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727079AbfFZHof (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 03:44:35 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id g2bNh3RUP7KeZg2bahhHrL; Wed, 26 Jun 2019 09:44:34 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 16/16] omap3isp: set device_caps in struct video_device
Date:   Wed, 26 Jun 2019 09:44:21 +0200
Message-Id: <20190626074421.38739-17-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
References: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNCjFJhN1Fb9b8791SEdpL66jnzKmHxA7Y2YcugEaS6lZhnfnYwS7Wy6OLrQnLe7km97hwYQIdginfY0t3a7ODFpVWISW4gTrQ6QkI5rBX13sjTA7Mnw
 aTwBMHX2g69MJnvTQZPAgwEG5GK+Qdl1zjQDHBPS00C4vWGsGsv5CfWZJSuX2YePe3NV1RagXv39Y9QevMPSN3qaXZRRKHYU+5bahstPwt42lfpiP3/B0UPr
 ZDD1yOhXNlSURebyuzsAQ6a0J2nh/2PMAwQUVr7bcy4=
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
 drivers/media/platform/omap3isp/ispvideo.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/omap3isp/ispvideo.c b/drivers/media/platform/omap3isp/ispvideo.c
index 175bbed9a235..d98b8c3ec0b2 100644
--- a/drivers/media/platform/omap3isp/ispvideo.c
+++ b/drivers/media/platform/omap3isp/ispvideo.c
@@ -660,12 +660,6 @@ isp_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 
 	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OUTPUT
 		| V4L2_CAP_STREAMING | V4L2_CAP_DEVICE_CAPS;
-
-	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
-		cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
-	else
-		cap->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
-
 	return 0;
 }
 
@@ -1463,6 +1457,13 @@ int omap3isp_video_init(struct isp_video *video, const char *name)
 	video->video.vfl_type = VFL_TYPE_GRABBER;
 	video->video.release = video_device_release_empty;
 	video->video.ioctl_ops = &isp_video_ioctl_ops;
+	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		video->video.device_caps =
+			V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	else
+		video->video.device_caps =
+			V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
+
 	video->pipe.stream_state = ISP_PIPELINE_STREAM_STOPPED;
 
 	video_set_drvdata(&video->video, video);
-- 
2.20.1

