Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4109131B4AF
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbhBOEfh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:35:37 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45928 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbhBOEfe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:35:34 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A56F1AB3;
        Mon, 15 Feb 2021 05:28:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363321;
        bh=BNDk6/SbfKAoS8tWroNbu/8Wopur8DF04+ZFGaL9TFQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Gb/pNJHWYaRK4KhYLTyw0IR2kAxMB6LiYvF17QcMylWsluZq6DGiNRbxcBR/hwRXb
         s2fw7M8i8ul0+UOozu91rJX0QDcNndzM+7lVO3GU4po3PlwwmbiXFe7El+IyH8SjJY
         o+9y6aE+JqBIu7c79wdPuvJGes0HFydbNILFLqbw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 39/77] media: imx: imx7-media-csi: Don't lock access to is_csi2
Date:   Mon, 15 Feb 2021 06:27:03 +0200
Message-Id: <20210215042741.28850-40-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The is_csi2 field can't be accessed concurrently by
imx7_csi_pad_link_validate() and imx7_csi_configure(), as the latter is
called from imx7_csi_s_stream(), which is called after link validation.
Drop the lock.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 2a4b69cc0178..dc25b593eaeb 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1001,7 +1001,6 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
 	struct imx_media_video_dev *vdev = csi->vdev;
 	const struct v4l2_pix_format *out_pix = &vdev->fmt;
 	struct media_pad *pad;
-	bool is_csi2;
 	int ret;
 
 	if (!csi->src_sd)
@@ -1018,7 +1017,7 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
 	switch (csi->src_sd->entity.function) {
 	case MEDIA_ENT_F_VID_IF_BRIDGE:
 		/* The input is the CSI-2 receiver. */
-		is_csi2 = true;
+		csi->is_csi2 = true;
 		break;
 
 	case MEDIA_ENT_F_VID_MUX:
@@ -1027,7 +1026,7 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
 		if (!pad)
 			return -ENODEV;
 
-		is_csi2 = pad->entity->function == MEDIA_ENT_F_VID_IF_BRIDGE;
+		csi->is_csi2 = pad->entity->function == MEDIA_ENT_F_VID_IF_BRIDGE;
 		break;
 
 	default:
@@ -1035,14 +1034,10 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
 		 * The input is an external entity, it must use the parallel
 		 * bus.
 		 */
-		is_csi2 = false;
+		csi->is_csi2 = false;
 		break;
 	}
 
-	mutex_lock(&csi->lock);
-	csi->is_csi2 = is_csi2;
-	mutex_unlock(&csi->lock);
-
 	/* Validate the sink link, ensure the pixel format is supported. */
 	switch (out_pix->pixelformat) {
 	case V4L2_PIX_FMT_UYVY:
-- 
Regards,

Laurent Pinchart

