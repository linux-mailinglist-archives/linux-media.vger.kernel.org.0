Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61CE231B497
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhBOEb3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:31:29 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45318 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbhBOEbW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:31:22 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F7DF1906;
        Mon, 15 Feb 2021 05:28:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363301;
        bh=QJQ2GflcMyP4fc5sw47oO1hFp7gA+oC7AyB1Qy19R3I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O5OXtL8ZrxU/RJvM9g81v2C2Hqx06ymwZRDFEy96vl2AeGVK//OtZXcgNmZKjGTSf
         CNsYgmy0IclUfgcuUJCoGIb5CAMMlIjOLKRZq6a/JGTKkwrvzpY08dmQyQRSSFKQCl
         6pxq81YOA0Qy9I2jl8szJqadZY2Xor0JfznF1M3M=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 14/77] media: imx: capture: Initialize video_device programmatically
Date:   Mon, 15 Feb 2021 06:26:38 +0200
Message-Id: <20210215042741.28850-15-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Overwriting the whole video_device isn't future-proof as it would
overwrite any field initialized by video_device_alloc(). Furthermore,
the current implementation modifies the global template video_device as
if it were a per-instance structure, which is bad practice. To fix all
this, initialize the video device programmatically in
imx_media_capture_device_init().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/media/imx/imx-media-capture.c | 23 ++++++++-----------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 88de2eef74d2..78b6e592692f 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -672,16 +672,6 @@ static const struct v4l2_file_operations capture_fops = {
 	.mmap		= vb2_fop_mmap,
 };
 
-static struct video_device capture_videodev = {
-	.fops		= &capture_fops,
-	.ioctl_ops	= &capture_ioctl_ops,
-	.minor		= -1,
-	.release	= video_device_release,
-	.vfl_dir	= VFL_DIR_RX,
-	.tvnorms	= V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM,
-	.device_caps	= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING,
-};
-
 struct imx_media_buffer *
 imx_media_capture_device_next_buf(struct imx_media_video_dev *vdev)
 {
@@ -809,17 +799,22 @@ imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
 	spin_lock_init(&priv->q_lock);
 
 	/* Allocate and initialize the video device. */
-	snprintf(capture_videodev.name, sizeof(capture_videodev.name),
-		 "%s capture", src_sd->name);
-
 	vfd = video_device_alloc();
 	if (!vfd)
 		return ERR_PTR(-ENOMEM);
 
-	*vfd = capture_videodev;
+	vfd->fops = &capture_fops;
+	vfd->ioctl_ops = &capture_ioctl_ops;
+	vfd->minor = -1;
+	vfd->release = video_device_release;
+	vfd->vfl_dir = VFL_DIR_RX;
+	vfd->tvnorms = V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM;
+	vfd->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
 	vfd->lock = &priv->mutex;
 	vfd->queue = &priv->q;
 
+	snprintf(vfd->name, sizeof(vfd->name), "%s capture", src_sd->name);
+
 	video_set_drvdata(vfd, priv);
 	priv->vdev.vfd = vfd;
 	INIT_LIST_HEAD(&priv->vdev.list);
-- 
Regards,

Laurent Pinchart

