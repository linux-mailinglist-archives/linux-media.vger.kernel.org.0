Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3E7D56394
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 09:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbfFZHoc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 03:44:32 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:50385 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727042AbfFZHoa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 03:44:30 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id g2bNh3RUP7KeZg2bUhhHpO; Wed, 26 Jun 2019 09:44:29 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 11/16] xilinx: set device_caps in struct video_device
Date:   Wed, 26 Jun 2019 09:44:16 +0200
Message-Id: <20190626074421.38739-12-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
References: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfB55D53BG9qdt5+XrqwddPCA/aD9C9IqX9YFfWEP/vdI6LGk7M9PMiUle47KC5GB2OlymaKciyfcyOs/94u1bQwn8N01bFFIw8XgWc5GMiTt0yduup/o
 HOdQYoNs4rzt5KH2tQMJh3jO4b1bAfdCXnD0H0ddtv/DFxbdpe4cP88xCfLZbHBuOMCOsMmHBCw16ovgkTkPFKAaF6XK5OgIjIY/PHpzmROS1cSG7OGz1pP8
 FTWpj6O/405J7xL/Mg9lASC0YjznfDKRCShiAlYUW/o=
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
 drivers/media/platform/xilinx/xilinx-dma.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
index c9d5fdb2d407..bcd783d9e5ae 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -491,15 +491,8 @@ xvip_dma_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 	struct v4l2_fh *vfh = file->private_data;
 	struct xvip_dma *dma = to_xvip_dma(vfh->vdev);
 
-	cap->device_caps = V4L2_CAP_STREAMING;
-
-	if (dma->queue.type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
-		cap->device_caps |= V4L2_CAP_VIDEO_CAPTURE;
-	else
-		cap->device_caps |= V4L2_CAP_VIDEO_OUTPUT;
-
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS
-			  | dma->xdev->v4l2_caps;
+	cap->capabilities = dma->xdev->v4l2_caps | V4L2_CAP_STREAMING |
+			    V4L2_CAP_DEVICE_CAPS;
 
 	strscpy(cap->driver, "xilinx-vipp", sizeof(cap->driver));
 	strscpy(cap->card, dma->video.name, sizeof(cap->card));
@@ -700,6 +693,11 @@ int xvip_dma_init(struct xvip_composite_device *xdev, struct xvip_dma *dma,
 	dma->video.release = video_device_release_empty;
 	dma->video.ioctl_ops = &xvip_dma_ioctl_ops;
 	dma->video.lock = &dma->lock;
+	dma->video.device_caps = V4L2_CAP_STREAMING;
+	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		dma->video.device_caps |= V4L2_CAP_VIDEO_CAPTURE;
+	else
+		dma->video.device_caps |= V4L2_CAP_VIDEO_OUTPUT;
 
 	video_set_drvdata(&dma->video, dma);
 
-- 
2.20.1

