Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1245214B6
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241404AbiEJMD3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241400AbiEJMD1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA362165AB
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:29 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6411DFF;
        Tue, 10 May 2022 13:59:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183961;
        bh=qW8IIw68EVP3AedmAhYt7206Mi7WCoyGyeEfwRlV45Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n9pt2Bpc+j5ATaaFG3VP2jT0BwGaT+LQrNcNuufE8xSPW3qnud0kpUs+Cv588sWNM
         zuH8WJg/E1d2wxkNCDPiaiKL7qFYW6k+P5OvLK7gu/2bXOyVp5uMPNy4CLDRQ0OfWK
         6Dz2fNUMSI0etv+kOo0WMTidl8vIHQck+YeOTKAE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Subject: [PATCH 13/50] staging: media: imx: imx7-media-csi: Drop unused controls support
Date:   Tue, 10 May 2022 14:58:22 +0300
Message-Id: <20220510115859.19777-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop the unused control handler from the driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 2e314ce961dc..499bb74ad6f3 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -21,7 +21,6 @@
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
-#include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
@@ -744,8 +743,6 @@ struct capture_priv {
 	struct vb2_queue q;			/* The videobuf2 queue */
 	struct list_head ready_q;		/* List of queued buffers */
 	spinlock_t q_lock;			/* Protect ready_q */
-
-	struct v4l2_ctrl_handler ctrl_hdlr;	/* Controls inherited from subdevs */
 };
 
 #define to_capture_priv(v) container_of(v, struct capture_priv, vdev)
@@ -1382,13 +1379,6 @@ imx7_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
 	return &priv->vdev;
 }
 
-static void imx7_media_capture_device_remove(struct imx_media_video_dev *vdev)
-{
-	struct capture_priv *priv = to_capture_priv(vdev);
-
-	v4l2_ctrl_handler_free(&priv->ctrl_hdlr);
-}
-
 /* -----------------------------------------------------------------------------
  * V4L2 Subdev Operations
  */
@@ -1730,7 +1720,7 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
 	ret = imx7_media_capture_device_register(csi->vdev,
 						 MEDIA_LNK_FL_IMMUTABLE);
 	if (ret)
-		goto err_remove;
+		return ret;
 
 	ret = v4l2_device_register_subdev_nodes(&csi->imxmd->v4l2_dev);
 	if (ret)
@@ -1744,8 +1734,6 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
 
 err_unreg:
 	imx7_media_capture_device_unregister(csi->vdev);
-err_remove:
-	imx7_media_capture_device_remove(csi->vdev);
 	return ret;
 }
 
@@ -1754,7 +1742,6 @@ static void imx7_csi_unregistered(struct v4l2_subdev *sd)
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
 
 	imx7_media_capture_device_unregister(csi->vdev);
-	imx7_media_capture_device_remove(csi->vdev);
 }
 
 static const struct v4l2_subdev_video_ops imx7_csi_video_ops = {
-- 
Regards,

Laurent Pinchart

