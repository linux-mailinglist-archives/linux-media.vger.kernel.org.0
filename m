Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 860E12EAE7B
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:33:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbhAEPcv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:32:51 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37698 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727966AbhAEPcv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:32:51 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8586B8D7;
        Tue,  5 Jan 2021 16:29:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860587;
        bh=TxDPBjhjxpZBjHQqS6hIq9FKoCT21Bs8+U781e37n2k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RVT7eRvXHeVh9zEKmJ/Bx/5XJK56iTioST8rygL6SQLX9u62Gg09IgFArxvW1F5RP
         zRU/cCMLXQPY88TERkCXujG2WyvOjKKQ8X+QnG9CY7Jm+Gm49lLa5uAQYNH1WhetY6
         hLEa2HSB/k2tWE3xNVYPpDsm7D7ZH6KblN1TG3TA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 18/75] media: imx: capture: Move default format init to a separate function
Date:   Tue,  5 Jan 2021 17:27:55 +0200
Message-Id: <20210105152852.5733-19-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To prepare for more complex default format initialization and keep
imx_media_capture_device_register() simple, extract the format
initialization code to a separate function.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 42 ++++++++++++-------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index f778d9588eb3..009dd8733813 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -709,13 +709,37 @@ void imx_media_capture_device_error(struct imx_media_video_dev *vdev)
 }
 EXPORT_SYMBOL_GPL(imx_media_capture_device_error);
 
+static int capture_init_format(struct capture_priv *priv)
+{
+	struct v4l2_subdev_format fmt_src = {
+		.pad = priv->src_sd_pad,
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	struct imx_media_video_dev *vdev = &priv->vdev;
+	int ret;
+
+	ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL, &fmt_src);
+	if (ret) {
+		dev_err(priv->dev, "failed to get source format\n");
+		return ret;
+	}
+
+	imx_media_mbus_fmt_to_pix_fmt(&vdev->fmt, &fmt_src.format, NULL);
+	vdev->compose.width = fmt_src.format.width;
+	vdev->compose.height = fmt_src.format.height;
+
+	vdev->cc = imx_media_find_pixel_format(vdev->fmt.pixelformat,
+					       PIXFMT_SEL_ANY);
+
+	return 0;
+}
+
 int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 {
 	struct capture_priv *priv = to_capture_priv(vdev);
 	struct v4l2_subdev *sd = priv->src_sd;
 	struct v4l2_device *v4l2_dev = sd->v4l2_dev;
 	struct video_device *vfd = vdev->vfd;
-	struct v4l2_subdev_format fmt_src;
 	int ret;
 
 	/* get media device */
@@ -723,20 +747,10 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 
 	vfd->v4l2_dev = v4l2_dev;
 
-	/* setup default format */
-	fmt_src.pad = priv->src_sd_pad;
-	fmt_src.which = V4L2_SUBDEV_FORMAT_ACTIVE;
-	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt_src);
-	if (ret) {
-		dev_err(priv->dev, "failed to get src_sd format\n");
+	/* Initialize the default format and compose rectangle. */
+	ret = capture_init_format(priv);
+	if (ret < 0)
 		return ret;
-	}
-
-	imx_media_mbus_fmt_to_pix_fmt(&vdev->fmt, &fmt_src.format, NULL);
-	vdev->compose.width = fmt_src.format.width;
-	vdev->compose.height = fmt_src.format.height;
-	vdev->cc = imx_media_find_pixel_format(vdev->fmt.pixelformat,
-					       PIXFMT_SEL_ANY);
 
 	/* Register the video device. */
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
-- 
Regards,

Laurent Pinchart

