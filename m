Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2C22EAE83
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:33:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbhAEPdQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:33:16 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728060AbhAEPdQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:33:16 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4C62D8DB;
        Tue,  5 Jan 2021 16:29:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860589;
        bh=xLe5NbD2FKKYGWB9KnxOPxqmio0gZFbuSPJq6ugJS/0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lVjzhnbnEgHDuw2K/t6F+1w9ikhoD075MFlk+PRVol4aWeqgFy49boWezxVsQJiHM
         TJAJCR3URR00P6ADL3ksBXK8wU1y/tuy4335/PukD/5Z32Rhbe2tJxv05ZS3fueRRb
         qkfwAofHzcftvKNzqK8ENnkwDsiFBsEzNGtI4s1Y=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 21/75] media: imx: capture: Add a mechanism to disable control inheritance
Date:   Tue,  5 Jan 2021 17:27:58 +0200
Message-Id: <20210105152852.5733-22-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a parameter to the imx_media_capture_device_init() function to
select between the legacy and MC-centric API. When selecting the
MC-centric API, the video node doesn't inherit controls from subdevs
anymore. All callers are updated to use the legacy API for now,
preserving the existing behaviour.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-ic-prpencvf.c      |  2 +-
 drivers/staging/media/imx/imx-media-capture.c    | 13 +++++++++----
 drivers/staging/media/imx/imx-media-csi.c        |  5 ++---
 drivers/staging/media/imx/imx-media-dev-common.c |  4 ++++
 drivers/staging/media/imx/imx-media.h            |  2 +-
 drivers/staging/media/imx/imx7-media-csi.c       |  2 +-
 6 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index adb1a09e59d2..88d69425e1b3 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -1265,7 +1265,7 @@ static int prp_registered(struct v4l2_subdev *sd)
 
 	priv->vdev = imx_media_capture_device_init(ic_priv->ipu_dev,
 						   &ic_priv->sd,
-						   PRPENCVF_SRC_PAD);
+						   PRPENCVF_SRC_PAD, true);
 	if (IS_ERR(priv->vdev))
 		return PTR_ERR(priv->vdev);
 
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 0775e60ad894..70b3d187bbc3 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -45,6 +45,8 @@ struct capture_priv {
 	spinlock_t q_lock;			/* Protect ready_q */
 
 	struct v4l2_ctrl_handler ctrl_hdlr;	/* Controls inherited from subdevs */
+
+	bool legacy_api;			/* Use the legacy (pre-MC) API */
 };
 
 #define to_capture_priv(v) container_of(v, struct capture_priv, vdev)
@@ -806,7 +808,7 @@ EXPORT_SYMBOL_GPL(imx_media_capture_device_unregister);
 
 struct imx_media_video_dev *
 imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
-			      int pad)
+			      int pad, bool legacy_api)
 {
 	struct capture_priv *priv;
 	struct video_device *vfd;
@@ -820,6 +822,7 @@ imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
 	priv->src_sd = src_sd;
 	priv->src_sd_pad = pad;
 	priv->dev = dev;
+	priv->legacy_api = legacy_api;
 
 	mutex_init(&priv->mutex);
 	INIT_LIST_HEAD(&priv->ready_q);
@@ -874,9 +877,11 @@ imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
 		return ERR_PTR(ret);
 	}
 
-	/* Initialize the control handler. */
-	v4l2_ctrl_handler_init(&priv->ctrl_hdlr, 0);
-	vfd->ctrl_handler = &priv->ctrl_hdlr;
+	if (legacy_api) {
+		/* Initialize the control handler. */
+		v4l2_ctrl_handler_init(&priv->ctrl_hdlr, 0);
+		vfd->ctrl_handler = &priv->ctrl_hdlr;
+	}
 
 	return &priv->vdev;
 }
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 3a1501434288..436f3d7160fa 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1789,9 +1789,8 @@ static int csi_registered(struct v4l2_subdev *sd)
 		goto put_csi;
 	}
 
-	priv->vdev = imx_media_capture_device_init(priv->sd.dev,
-						   &priv->sd,
-						   CSI_SRC_PAD_IDMAC);
+	priv->vdev = imx_media_capture_device_init(priv->sd.dev, &priv->sd,
+						   CSI_SRC_PAD_IDMAC, true);
 	if (IS_ERR(priv->vdev)) {
 		ret = PTR_ERR(priv->vdev);
 		goto free_fim;
diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
index 5fe4b22ab847..d186179388d0 100644
--- a/drivers/staging/media/imx/imx-media-dev-common.c
+++ b/drivers/staging/media/imx/imx-media-dev-common.c
@@ -287,6 +287,8 @@ static int imx_media_link_notify(struct media_link *link, u32 flags,
 	    !(flags & MEDIA_LNK_FL_ENABLED)) {
 		list_for_each_entry(pad_vdev, pad_vdev_list, list) {
 			vfd = pad_vdev->vdev->vfd;
+			if (!vfd->ctrl_handler)
+				continue;
 			dev_dbg(imxmd->md.dev,
 				"reset controls for %s\n",
 				vfd->entity.name);
@@ -297,6 +299,8 @@ static int imx_media_link_notify(struct media_link *link, u32 flags,
 		   (link->flags & MEDIA_LNK_FL_ENABLED)) {
 		list_for_each_entry(pad_vdev, pad_vdev_list, list) {
 			vfd = pad_vdev->vdev->vfd;
+			if (!vfd->ctrl_handler)
+				continue;
 			dev_dbg(imxmd->md.dev,
 				"refresh controls for %s\n",
 				vfd->entity.name);
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 483fda2f13d9..16ab879e0084 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -286,7 +286,7 @@ int imx_media_ic_unregister(struct v4l2_subdev *sd);
 /* imx-media-capture.c */
 struct imx_media_video_dev *
 imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
-			      int pad);
+			      int pad, bool legacy_api);
 void imx_media_capture_device_remove(struct imx_media_video_dev *vdev);
 int imx_media_capture_device_register(struct imx_media_video_dev *vdev);
 void imx_media_capture_device_unregister(struct imx_media_video_dev *vdev);
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 98eb41f6496c..466e7e3567aa 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1089,7 +1089,7 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
 	}
 
 	csi->vdev = imx_media_capture_device_init(csi->sd.dev, &csi->sd,
-						  IMX7_CSI_PAD_SRC);
+						  IMX7_CSI_PAD_SRC, true);
 	if (IS_ERR(csi->vdev))
 		return PTR_ERR(csi->vdev);
 
-- 
Regards,

Laurent Pinchart

