Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2381F3184
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 03:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbgFHXGU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 19:06:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:49134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726933AbgFHXGT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jun 2020 19:06:19 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 83AF82078B;
        Mon,  8 Jun 2020 23:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591657578;
        bh=Mo/LmzV2QH5IQjVnMsc7iY/hSjl6NooGCziyrango3A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PaZI19HqaswJ2RRRfF6TMBox4I5+8A9tCnSqXso92wcV+bTthSBYnR8N4jlrXOGrm
         +qK4Z82ucPg1pQqh4rwciI61DEpr+JnSvOQUbxGW8/NrnpS5vWMmT3Ec0/NWAim8uu
         ndu3d3CjJfQLVuuTdLlf8hyOCGV1oFRLHY69EwlI=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.7 008/274] media: imx: imx7-mipi-csis: Cleanup and fix subdev pad format handling
Date:   Mon,  8 Jun 2020 19:01:41 -0400
Message-Id: <20200608230607.3361041-8-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608230607.3361041-1-sashal@kernel.org>
References: <20200608230607.3361041-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[ Upstream commit d321dd233b9f2bb407b8e6b4759408f09ec207c3 ]

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
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 82 ++++++++++------------
 1 file changed, 37 insertions(+), 45 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index fbc1a924652a..6318f0aebb4b 100644
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
2.25.1

