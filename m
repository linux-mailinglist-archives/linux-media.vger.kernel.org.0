Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D356031B4AB
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:35:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbhBOEfB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:35:01 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45928 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbhBOEfB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:35:01 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1949519B0;
        Mon, 15 Feb 2021 05:28:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363315;
        bh=seunjfYU3PCoTXOLMaa6FHUvYgfDR3eVR4zmiIrXpJw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M5yxgkwd82Cezmuu8gRm4YChGUOH3sBNTI4yAnNe3iWaeDansI/amt1bmzxaou8lN
         qIjivDtLhuFyfRLJkJztoeZ1kM3Fzm32djIr0t4UR+Dc9TahE0GjTgmGHe2nmnYxHD
         Bx7RMXXYWCPs6DjV5NLOEcsx/E/bfmy4glLj1nKY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 33/77] media: imx: imx7-media-csi: Create immutable link to capture device
Date:   Mon, 15 Feb 2021 06:26:57 +0200
Message-Id: <20210215042741.28850-34-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The i.MX7 camera pipeline is simple, with the CSI connected directly to
the capture device without any other option. There's thus no need to
allow link configurable by userspace. Make it immutable.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index bc3324a30824..174e608ededa 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -166,8 +166,6 @@ struct imx7_csi {
 
 	struct v4l2_subdev *src_sd;
 
-	struct media_entity *sink;
-
 	struct v4l2_mbus_framefmt format_mbus[IMX7_CSI_PADS_NUM];
 	const struct imx_media_pixfmt *cc[IMX7_CSI_PADS_NUM];
 	struct v4l2_fract frame_interval[IMX7_CSI_PADS_NUM];
@@ -450,19 +448,6 @@ static int imx7_csi_link_setup(struct media_entity *entity,
 		} else {
 			csi->src_sd = NULL;
 		}
-
-		goto unlock;
-	}
-
-	/* source pad */
-	if (flags & MEDIA_LNK_FL_ENABLED) {
-		if (csi->sink) {
-			ret = -EBUSY;
-			goto unlock;
-		}
-		csi->sink = remote->entity;
-	} else {
-		csi->sink = NULL;
 	}
 
 unlock:
@@ -842,7 +827,7 @@ static int imx7_csi_s_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&csi->lock);
 
-	if (!csi->src_sd || !csi->sink) {
+	if (!csi->src_sd) {
 		ret = -EPIPE;
 		goto out_unlock;
 	}
@@ -1091,7 +1076,8 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
 	if (IS_ERR(csi->vdev))
 		return PTR_ERR(csi->vdev);
 
-	ret = imx_media_capture_device_register(csi->vdev, 0);
+	ret = imx_media_capture_device_register(csi->vdev,
+						MEDIA_LNK_FL_IMMUTABLE);
 	if (ret)
 		imx_media_capture_device_remove(csi->vdev);
 
-- 
Regards,

Laurent Pinchart

