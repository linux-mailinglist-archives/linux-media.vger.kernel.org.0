Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE122EAE76
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:33:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728027AbhAEPce (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:32:34 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37698 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727994AbhAEPce (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:32:34 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C0B28CF;
        Tue,  5 Jan 2021 16:29:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860586;
        bh=LH0qQiejeEILCaqMPxfgfsaOZpXX5a1lEk0fIfrDCTw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Nrif2TN/mtQvkir8wMDsjLLdA76i2emwzR27G5TqzhnccuLHmM/3o6yAcQt+iHctE
         gav/0aidw3NULejZupuizWWPTvbqxOrAN2NW/i25VNRtMXWEqHFWnDiCjf0lq2XdI5
         D0UJ8O8QUjVEeRf5QUxtQMbYDldglJcoZQwppCpk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 16/75] media: imx: capture: Register the video device after completing init
Date:   Tue,  5 Jan 2021 17:27:53 +0200
Message-Id: <20210105152852.5733-17-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the video device is registered, it can get used by userspace
immediately. Its initialization must thus be fully complete. Ensure this
by registering the video device after all initialization steps.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 37 +++++++++----------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index e22d98ce5d1e..335cb74baa4c 100644
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

