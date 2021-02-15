Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D376E31B498
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhBOEbh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:31:37 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45636 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbhBOEbd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:31:33 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC4191908;
        Mon, 15 Feb 2021 05:28:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363302;
        bh=3NVWhaqvmW9xGhoRt/UcMSxv1CgAdr/0RDs5MLukWx4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eBw1QxEdiRJ94FJs8JCOYaBsp4QIhfl9fEHZOP6KDiyeIHvvmC0m7vrxyi43X4KKa
         uQqQm8YHrCiXWXPnFZlCBoR/2l5nFd/zodwhE0Ojh3P4GOwS/pSF6DFb5XDHXYqSCd
         uyMVU9VV+cE0bjfDMCgcd56ZDM9ht8w58PTCoyRw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 15/77] media: imx: capture: Register the video device after completing init
Date:   Mon, 15 Feb 2021 06:26:39 +0200
Message-Id: <20210215042741.28850-16-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the video device is registered, it can get used by userspace
immediately. Its initialization must thus be fully complete. Ensure this
by registering the video device after all initialization steps.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 37 +++++++++----------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 78b6e592692f..cd0ad2b32bbf 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -723,27 +723,13 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 
 	vfd->v4l2_dev = v4l2_dev;
 
-	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
-	if (ret) {
-		dev_err(priv->dev, "Failed to register video device\n");
-		return ret;
-	}
-
-	/* create the link from the src_sd devnode pad to device node */
-	ret = media_create_pad_link(&sd->entity, priv->src_sd_pad,
-				    &vfd->entity, 0, 0);
-	if (ret) {
-		dev_err(priv->dev, "failed to create link to device node\n");
-		goto unreg;
-	}
-
 	/* setup default format */
 	fmt_src.pad = priv->src_sd_pad;
 	fmt_src.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt_src);
 	if (ret) {
 		dev_err(priv->dev, "failed to get src_sd format\n");
-		goto unreg;
+		return ret;
 	}
 
 	vdev->fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
@@ -754,16 +740,29 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 	vdev->cc = imx_media_find_pixel_format(vdev->fmt.fmt.pix.pixelformat,
 					       PIXFMT_SEL_ANY);
 
+	/* Register the video device. */
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(priv->dev, "Failed to register video device\n");
+		return ret;
+	}
+
 	dev_info(priv->dev, "Registered %s as /dev/%s\n", vfd->name,
 		 video_device_node_name(vfd));
 
-	/* add vdev to the video device list */
+	/* Create the link from the src_sd devnode pad to device node. */
+	ret = media_create_pad_link(&sd->entity, priv->src_sd_pad,
+				    &vfd->entity, 0, 0);
+	if (ret) {
+		dev_err(priv->dev, "failed to create link to device node\n");
+		video_unregister_device(vfd);
+		return ret;
+	}
+
+	/* Add vdev to the video devices list. */
 	imx_media_add_video_device(priv->md, vdev);
 
 	return 0;
-unreg:
-	video_unregister_device(vfd);
-	return ret;
 }
 EXPORT_SYMBOL_GPL(imx_media_capture_device_register);
 
-- 
Regards,

Laurent Pinchart

