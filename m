Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6683631B4B0
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbhBOEfi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:35:38 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45902 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbhBOEff (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:35:35 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72AEB1AAE;
        Mon, 15 Feb 2021 05:28:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363319;
        bh=ISA3GP48pA0CGjCKcQ+s2Wfu6JNgZfxX48RpbffNTyk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iaoNsj2mAqkxKdJGpc3sgRHrIQ5Bb+lmIM8YV/VAki47D6ZPI33JAqkM4NoguJqac
         lzj/qwQwEcsVYIH0yDvdDWO3zMQes1hdiHxiUwcApDWYVKiG7vxuHjSakqQpaAGXzz
         Mx57Kn6pamO5Hx1I/xZBNsyoTAjBf+DU64la7Rg8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 38/77] media: imx: imx7-media-csi: Fix source type identification
Date:   Mon, 15 Feb 2021 06:27:02 +0200
Message-Id: <20210215042741.28850-39-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The code in imx7_csi_pad_link_validate() that checks the type of the
source incorrectly handles devices that have no parallel input. In that
case, the source entity of the CSI is the CSI-2 receiver, not the video
mux, and the driver will proceed to check the type of the source of the
CSI-2 receiver.

Make the code more explicit to fix this, by handling the three cases
(parallel input only, CSI-2 receiver only, and video mux) separately.

Note that the driver will not correctly handle the case where only a
parallel input is present, and the external entity connected to the
parallel input reports a MEDIA_ENT_F_VID_IF_BRIDGE or
MEDIA_ENT_F_VID_MUX function. This was broken already, and should be
fixed separately.

Fixes: f168e796bf40 ("media: imx7: csi: Fix pad link validation")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 52 +++++++++++++---------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index de7b93317a47..2a4b69cc0178 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1000,39 +1000,47 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
 	struct imx_media_video_dev *vdev = csi->vdev;
 	const struct v4l2_pix_format *out_pix = &vdev->fmt;
-	struct media_entity *src;
 	struct media_pad *pad;
+	bool is_csi2;
 	int ret;
 
-	/*
-	 * Validate the source link, and record whether the CSI mux selects the
-	 * parallel input or the CSI-2 receiver.
-	 */
-	ret = v4l2_subdev_link_validate_default(sd, link, source_fmt, sink_fmt);
-	if (ret)
-		return ret;
-
 	if (!csi->src_sd)
 		return -EPIPE;
 
-	src = &csi->src_sd->entity;
-
 	/*
-	 * if the source is neither a CSI MUX or CSI-2 get the one directly
-	 * upstream from this CSI
+	 * Validate the source link, and record whether the source uses the
+	 * parallel input or the CSI-2 receiver.
 	 */
-	if (src->function != MEDIA_ENT_F_VID_IF_BRIDGE &&
-	    src->function != MEDIA_ENT_F_VID_MUX)
-		src = &csi->sd.entity;
+	ret = v4l2_subdev_link_validate_default(sd, link, source_fmt, sink_fmt);
+	if (ret)
+		return ret;
 
-	pad = imx_media_pipeline_pad(src, 0, 0, true);
-	if (!pad)
-		return -ENODEV;
+	switch (csi->src_sd->entity.function) {
+	case MEDIA_ENT_F_VID_IF_BRIDGE:
+		/* The input is the CSI-2 receiver. */
+		is_csi2 = true;
+		break;
+
+	case MEDIA_ENT_F_VID_MUX:
+		/* The input is the mux, check its input. */
+		pad = imx_media_pipeline_pad(&csi->src_sd->entity, 0, 0, true);
+		if (!pad)
+			return -ENODEV;
+
+		is_csi2 = pad->entity->function == MEDIA_ENT_F_VID_IF_BRIDGE;
+		break;
+
+	default:
+		/*
+		 * The input is an external entity, it must use the parallel
+		 * bus.
+		 */
+		is_csi2 = false;
+		break;
+	}
 
 	mutex_lock(&csi->lock);
-
-	csi->is_csi2 = (pad->entity->function == MEDIA_ENT_F_VID_IF_BRIDGE);
-
+	csi->is_csi2 = is_csi2;
 	mutex_unlock(&csi->lock);
 
 	/* Validate the sink link, ensure the pixel format is supported. */
-- 
Regards,

Laurent Pinchart

