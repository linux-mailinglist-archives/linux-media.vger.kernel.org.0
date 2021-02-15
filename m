Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD60231B4A7
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbhBOEeX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:34:23 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45636 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbhBOEeK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:34:10 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 362E21952;
        Mon, 15 Feb 2021 05:28:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363313;
        bh=rLGIY23JWW4JTlN/e6tNeP7C20At9SydaHA0DHDwVjc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SI5Sm3orqVTpbXWrSjt2v2qgMme44KQLcSxegWOQ4hc/uAGZ0mQNzXrleOKE0p3rM
         QGMDZrG0INieHZULqDvk5tiii+yRZ2PLOuibuEfet64zqol8P+/02pyRVmnZ5it3l4
         /dgNa2J+trpsXu/Q4YixlqVuZZT3V7lmFmQzI0Bs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 30/77] media: imx: capture: Support creating immutable link to capture device
Date:   Mon, 15 Feb 2021 06:26:54 +0200
Message-Id: <20210215042741.28850-31-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the subdevice connected to the capture device has a single possible
sink, there's no point in making the link mutable. Support creating
immutable links.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
Changes since v1:

- Pass link flags to imx_media_capture_device_register()
---
 drivers/staging/media/imx/imx-ic-prpencvf.c   | 2 +-
 drivers/staging/media/imx/imx-media-capture.c | 7 +++++--
 drivers/staging/media/imx/imx-media-csi.c     | 2 +-
 drivers/staging/media/imx/imx-media.h         | 3 ++-
 drivers/staging/media/imx/imx7-media-csi.c    | 2 +-
 5 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 88d69425e1b3..d990553de87b 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -1269,7 +1269,7 @@ static int prp_registered(struct v4l2_subdev *sd)
 	if (IS_ERR(priv->vdev))
 		return PTR_ERR(priv->vdev);
 
-	ret = imx_media_capture_device_register(priv->vdev);
+	ret = imx_media_capture_device_register(priv->vdev, 0);
 	if (ret)
 		goto remove_vdev;
 
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index c4360866f7f6..93ba09236010 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -898,7 +898,8 @@ static int capture_init_format(struct capture_priv *priv)
 	return 0;
 }
 
-int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
+int imx_media_capture_device_register(struct imx_media_video_dev *vdev,
+				      u32 link_flags)
 {
 	struct capture_priv *priv = to_capture_priv(vdev);
 	struct v4l2_subdev *sd = priv->src_sd;
@@ -927,8 +928,10 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 		 video_device_node_name(vfd));
 
 	/* Create the link from the src_sd devnode pad to device node. */
+	if (link_flags & MEDIA_LNK_FL_IMMUTABLE)
+		link_flags |= MEDIA_LNK_FL_ENABLED;
 	ret = media_create_pad_link(&sd->entity, priv->src_sd_pad,
-				    &vfd->entity, 0, 0);
+				    &vfd->entity, 0, link_flags);
 	if (ret) {
 		dev_err(priv->dev, "failed to create link to device node\n");
 		video_unregister_device(vfd);
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 45c92816facc..8d02939aaa23 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1788,7 +1788,7 @@ static int csi_registered(struct v4l2_subdev *sd)
 		goto free_fim;
 	}
 
-	ret = imx_media_capture_device_register(priv->vdev);
+	ret = imx_media_capture_device_register(priv->vdev, 0);
 	if (ret)
 		goto remove_vdev;
 
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 2ea2e62ddf86..492d9a64e704 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -288,7 +288,8 @@ struct imx_media_video_dev *
 imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
 			      int pad, bool legacy_api);
 void imx_media_capture_device_remove(struct imx_media_video_dev *vdev);
-int imx_media_capture_device_register(struct imx_media_video_dev *vdev);
+int imx_media_capture_device_register(struct imx_media_video_dev *vdev,
+				      u32 link_flags);
 void imx_media_capture_device_unregister(struct imx_media_video_dev *vdev);
 struct imx_media_buffer *
 imx_media_capture_device_next_buf(struct imx_media_video_dev *vdev);
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 3bf2505de6a2..90cf4b889e23 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1104,7 +1104,7 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
 	if (IS_ERR(csi->vdev))
 		return PTR_ERR(csi->vdev);
 
-	ret = imx_media_capture_device_register(csi->vdev);
+	ret = imx_media_capture_device_register(csi->vdev, 0);
 	if (ret)
 		imx_media_capture_device_remove(csi->vdev);
 
-- 
Regards,

Laurent Pinchart

