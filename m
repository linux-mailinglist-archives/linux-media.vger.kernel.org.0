Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 616EB180309
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 17:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbgCJQS5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 12:18:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55442 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgCJQS5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 12:18:57 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB292580;
        Tue, 10 Mar 2020 17:18:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583857136;
        bh=6QnkenWTEndwNRJajgA6+XXBTwaE54B1Jg8m9L3Nvro=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Op9gB5Up2bcC2NXqZ0rX25qRuSRvn2MpqDdp/zJ3/YC3A8GRfa5s8uVIggbyPLBvJ
         E0ienc7gXBLC6t4CCT1t6davYROuNXikoBD1CByMz4tx1Qne2rJNrLFxK3azVBlLUZ
         MW+exnDOKLXOOMlBXRJGUM4KhoPZEf0A/I60bMOs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 1/8] media: imx: imx7-mipi-csis: Cleanup and fix subdev pad format handling
Date:   Tue, 10 Mar 2020 18:18:38 +0200
Message-Id: <20200310161845.1588-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200310161845.1588-1-laurent.pinchart@ideasonboard.com>
References: <20200310161845.1588-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The subdev set pad format operation currently misbehaves in multiple ways:

- mipi_csis_try_format() unconditionally stores the format in the device
  state, even for V4L2_SUBDEV_FORMAT_TRY.

- The format is never stored in the pad cfg, but the pad cfg format
  always overwrites the format requested by the user.

- The sink format is not propagated to the source.

Fix all this by reworking the set format operation as follows:

1. For the source pad, turn set() into get() as the source format is not
   modifiable.
2. Validate the requested format and updated the stored format
   accordingly.
3. Return the format actually set.
4. Propagate the format from sink to source.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 82 ++++++++++------------
 1 file changed, 37 insertions(+), 45 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index de17a1d22873..25017ab78095 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -669,28 +669,6 @@ static int mipi_csis_init_cfg(struct v4l2_subdev *mipi_sd,
 	return 0;
 }
 
-static struct csis_pix_format const *
-mipi_csis_try_format(struct v4l2_subdev *mipi_sd, struct v4l2_mbus_framefmt *mf)
-{
-	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
-	struct csis_pix_format const *csis_fmt;
-
-	csis_fmt = find_csis_format(mf->code);
-	if (!csis_fmt)
-		csis_fmt = &mipi_csis_formats[0];
-
-	v4l_bound_align_image(&mf->width, 1, CSIS_MAX_PIX_WIDTH,
-			      csis_fmt->pix_width_alignment,
-			      &mf->height, 1, CSIS_MAX_PIX_HEIGHT, 1,
-			      0);
-
-	state->format_mbus.code = csis_fmt->code;
-	state->format_mbus.width = mf->width;
-	state->format_mbus.height = mf->height;
-
-	return csis_fmt;
-}
-
 static struct v4l2_mbus_framefmt *
 mipi_csis_get_format(struct csi_state *state,
 		     struct v4l2_subdev_pad_config *cfg,
@@ -703,53 +681,67 @@ mipi_csis_get_format(struct csi_state *state,
 	return &state->format_mbus;
 }
 
-static int mipi_csis_set_fmt(struct v4l2_subdev *mipi_sd,
+static int mipi_csis_get_fmt(struct v4l2_subdev *mipi_sd,
 			     struct v4l2_subdev_pad_config *cfg,
 			     struct v4l2_subdev_format *sdformat)
 {
 	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
-	struct csis_pix_format const *csis_fmt;
 	struct v4l2_mbus_framefmt *fmt;
 
-	if (sdformat->pad >= CSIS_PADS_NUM)
-		return -EINVAL;
-
-	fmt = mipi_csis_get_format(state, cfg, sdformat->which, sdformat->pad);
-
 	mutex_lock(&state->lock);
-	if (sdformat->pad == CSIS_PAD_SOURCE) {
-		sdformat->format = *fmt;
-		goto unlock;
-	}
-
-	csis_fmt = mipi_csis_try_format(mipi_sd, &sdformat->format);
-
+	fmt = mipi_csis_get_format(state, cfg, sdformat->which, sdformat->pad);
 	sdformat->format = *fmt;
-
-	if (csis_fmt && sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		state->csis_fmt = csis_fmt;
-	else
-		cfg->try_fmt = sdformat->format;
-
-unlock:
 	mutex_unlock(&state->lock);
 
 	return 0;
 }
 
-static int mipi_csis_get_fmt(struct v4l2_subdev *mipi_sd,
+static int mipi_csis_set_fmt(struct v4l2_subdev *mipi_sd,
 			     struct v4l2_subdev_pad_config *cfg,
 			     struct v4l2_subdev_format *sdformat)
 {
 	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
+	struct csis_pix_format const *csis_fmt;
 	struct v4l2_mbus_framefmt *fmt;
 
-	mutex_lock(&state->lock);
+	/*
+	 * The CSIS can't transcode in any way, the source format can't be
+	 * modified.
+	 */
+	if (sdformat->pad == CSIS_PAD_SOURCE)
+		return mipi_csis_get_fmt(mipi_sd, cfg, sdformat);
+
+	if (sdformat->pad != CSIS_PAD_SINK)
+		return -EINVAL;
 
 	fmt = mipi_csis_get_format(state, cfg, sdformat->which, sdformat->pad);
 
+	mutex_lock(&state->lock);
+
+	/* Validate the media bus code and clamp the size. */
+	csis_fmt = find_csis_format(sdformat->format.code);
+	if (!csis_fmt)
+		csis_fmt = &mipi_csis_formats[0];
+
+	fmt->code = csis_fmt->code;
+	fmt->width = sdformat->format.width;
+	fmt->height = sdformat->format.height;
+
+	v4l_bound_align_image(&fmt->width, 1, CSIS_MAX_PIX_WIDTH,
+			      csis_fmt->pix_width_alignment,
+			      &fmt->height, 1, CSIS_MAX_PIX_HEIGHT, 1, 0);
+
 	sdformat->format = *fmt;
 
+	/* Propagate the format from sink to source. */
+	fmt = mipi_csis_get_format(state, cfg, sdformat->which,
+				   CSIS_PAD_SOURCE);
+	*fmt = sdformat->format;
+
+	/* Store the CSIS format descriptor for active formats. */
+	if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		state->csis_fmt = csis_fmt;
+
 	mutex_unlock(&state->lock);
 
 	return 0;
-- 
Regards,

Laurent Pinchart

