Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E56652EAE97
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:36:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728169AbhAEPej (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:34:39 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728150AbhAEPej (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:34:39 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3CC9D1871;
        Tue,  5 Jan 2021 16:29:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860595;
        bh=8JgoB6+bEGZ2uMfqfjJUYJXTSJbhd8hZkI+Vy9GCX1M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J8HBHC/9blXe1CxiR3eOCvYnmj1qzmE4AX2xLGD3oyqqaLD/l3dV/Dm5EEPZB9zVE
         O1oXlF2gHxbpYZoZINa0VIllAX+j624/T7VCrcF2YjWlsTS4R1inogvlj0/8TmrHnb
         7iLOQ5tlYKscJEw/A0V5/+Sftiaytle7tRvLFxU8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 31/75] media: imx: capture: Support creating immutable link to capture device
Date:   Tue,  5 Jan 2021 17:28:08 +0200
Message-Id: <20210105152852.5733-32-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the subdevice connected to the capture device has a single possible
sink, there's no point in making the link mutable. Support creating
immutable links.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-ic-prpencvf.c   | 2 +-
 drivers/staging/media/imx/imx-media-capture.c | 7 +++++--
 drivers/staging/media/imx/imx-media-csi.c     | 2 +-
 drivers/staging/media/imx/imx-media.h         | 3 ++-
 drivers/staging/media/imx/imx7-media-csi.c    | 2 +-
 5 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 88d69425e1b3..6c9c75ffb30c 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -1269,7 +1269,7 @@ static int prp_registered(struct v4l2_subdev *sd)
 	if (IS_ERR(priv->vdev))
 		return PTR_ERR(priv->vdev);
 
-	ret = imx_media_capture_device_register(priv->vdev);
+	ret = imx_media_capture_device_register(priv->vdev, false);
 	if (ret)
 		goto remove_vdev;
 
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 04eb612ff1fa..c6991e8f151c 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -898,12 +898,14 @@ static int capture_init_format(struct capture_priv *priv)
 	return 0;
 }
 
-int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
+int imx_media_capture_device_register(struct imx_media_video_dev *vdev,
+				      bool immutable)
 {
 	struct capture_priv *priv = to_capture_priv(vdev);
 	struct v4l2_subdev *sd = priv->src_sd;
 	struct v4l2_device *v4l2_dev = sd->v4l2_dev;
 	struct video_device *vfd = vdev->vfd;
+	u32 flags;
 	int ret;
 
 	/* get media device */
@@ -927,8 +929,9 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 		 video_device_node_name(vfd));
 
 	/* Create the link from the src_sd devnode pad to device node. */
+	flags = immutable ? MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE : 0;
 	ret = media_create_pad_link(&sd->entity, priv->src_sd_pad,
-				    &vfd->entity, 0, 0);
+				    &vfd->entity, 0, flags);
 	if (ret) {
 		dev_err(priv->dev, "failed to create link to device node\n");
 		video_unregister_device(vfd);
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 436f3d7160fa..d54d2a3789c0 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1796,7 +1796,7 @@ static int csi_registered(struct v4l2_subdev *sd)
 		goto free_fim;
 	}
 
-	ret = imx_media_capture_device_register(priv->vdev);
+	ret = imx_media_capture_device_register(priv->vdev, false);
 	if (ret)
 		goto remove_vdev;
 
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 16ab879e0084..4efc4d186c0a 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -288,7 +288,8 @@ struct imx_media_video_dev *
 imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
 			      int pad, bool legacy_api);
 void imx_media_capture_device_remove(struct imx_media_video_dev *vdev);
-int imx_media_capture_device_register(struct imx_media_video_dev *vdev);
+int imx_media_capture_device_register(struct imx_media_video_dev *vdev,
+				      bool immutable);
 void imx_media_capture_device_unregister(struct imx_media_video_dev *vdev);
 struct imx_media_buffer *
 imx_media_capture_device_next_buf(struct imx_media_video_dev *vdev);
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index afd1a7e35bfe..c087a212efdd 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1093,7 +1093,7 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
 	if (IS_ERR(csi->vdev))
 		return PTR_ERR(csi->vdev);
 
-	ret = imx_media_capture_device_register(csi->vdev);
+	ret = imx_media_capture_device_register(csi->vdev, false);
 	if (ret)
 		imx_media_capture_device_remove(csi->vdev);
 
-- 
Regards,

Laurent Pinchart

