Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AACB2EAE74
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728020AbhAEPc1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:32:27 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727994AbhAEPcY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:32:24 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3F4C8CE;
        Tue,  5 Jan 2021 16:29:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860586;
        bh=LadFPMUjwlZ+k/f2DMbJS9pp5thH0jST0I0uLRSfBnE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mQBNBhfNVQ9/hfMSCjP7hOuecGDWF02qlKh7zaxs/ALjk5coLDhQ1ohjpeomZS6po
         MIB+FVOIP1TvAovVRYeG7dQm3cMWtjgS6d9h/+v56YHQ+j2jRidyq1amCu94s4Ny4L
         wS95ibQShOC/Q17LIAdFlua3El9373Adcrq+ErXU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 15/75] media: imx: capture: Initialize video_device programmatically
Date:   Tue,  5 Jan 2021 17:27:52 +0200
Message-Id: <20210105152852.5733-16-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
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
---
 drivers/staging/media/imx/imx-media-capture.c | 23 ++++++++-----------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index d7cc1423b71e..e22d98ce5d1e 100644
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
@@ -815,17 +805,22 @@ imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
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

