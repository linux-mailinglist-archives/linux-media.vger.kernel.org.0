Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15F6235D53E
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 04:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245555AbhDMCbd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 22:31:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35890 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241199AbhDMCbc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 22:31:32 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91F79AF3;
        Tue, 13 Apr 2021 04:31:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618281071;
        bh=9w19Yz9qw3aZm4XFvImmkXuVqJ6OoWVHG08SGtxY/U8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G+nM0xwCuYALTA/UvwA5Sbu7P285Hm31oKsf7B+JEDoFYYW1W4dqaAPk/IYVDO+BL
         falr9zNbtFgsPscJUuzSbE/lDUokuxGH/x78Jkg5LiqL+oUuoACQ4P3f3s/n5KlubY
         EthstAkOfFmwbCHHQsl3L4Iu0XKUGB5oiM2X/BHE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>
Subject: [PATCH 05/23] media: imx: imx7_mipi_csis: Minimize locking in get/set format
Date:   Tue, 13 Apr 2021 05:29:56 +0300
Message-Id: <20210413023014.28797-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reduce the code sections that are run with the lock held in the get/set
format handlers:

- mipi_csis_get_format() retrieves a pointer to the format, and thus
  doesn't need locking as long as the arguments passed to the function
  don't require locking either.

- sdformat is a structure passed by the caller, not an internal state,
  and thus doesn't require locking.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 36 ++++++++++++----------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 25125e067aa7..bbcd39672f92 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -860,8 +860,9 @@ static int mipi_csis_get_fmt(struct v4l2_subdev *mipi_sd,
 	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
 	struct v4l2_mbus_framefmt *fmt;
 
-	mutex_lock(&state->lock);
 	fmt = mipi_csis_get_format(state, cfg, sdformat->which, sdformat->pad);
+
+	mutex_lock(&state->lock);
 	sdformat->format = *fmt;
 	mutex_unlock(&state->lock);
 
@@ -919,24 +920,17 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *mipi_sd,
 	if (sdformat->pad != CSIS_PAD_SINK)
 		return -EINVAL;
 
-	fmt = mipi_csis_get_format(state, cfg, sdformat->which, sdformat->pad);
-
-	mutex_lock(&state->lock);
-
-	/* Validate the media bus code and clamp the size. */
-	csis_fmt = find_csis_format(sdformat->format.code);
-	if (!csis_fmt)
-		csis_fmt = &mipi_csis_formats[0];
-
-	fmt->code = csis_fmt->code;
-	fmt->width = sdformat->format.width;
-	fmt->height = sdformat->format.height;
-
 	/*
+	 * Validate the media bus code and clamp and align the size.
+	 *
 	 * The total number of bits per line must be a multiple of 8. We thus
 	 * need to align the width for formats that are not multiples of 8
 	 * bits.
 	 */
+	csis_fmt = find_csis_format(sdformat->format.code);
+	if (!csis_fmt)
+		csis_fmt = &mipi_csis_formats[0];
+
 	switch (csis_fmt->width % 8) {
 	case 0:
 		align = 0;
@@ -956,8 +950,18 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *mipi_sd,
 		break;
 	}
 
-	v4l_bound_align_image(&fmt->width, 1, CSIS_MAX_PIX_WIDTH, align,
-			      &fmt->height, 1, CSIS_MAX_PIX_HEIGHT, 0, 0);
+	v4l_bound_align_image(&sdformat->format.width, 1,
+			      CSIS_MAX_PIX_WIDTH, align,
+			      &sdformat->format.height, 1,
+			      CSIS_MAX_PIX_HEIGHT, 0, 0);
+
+	fmt = mipi_csis_get_format(state, cfg, sdformat->which, sdformat->pad);
+
+	mutex_lock(&state->lock);
+
+	fmt->code = csis_fmt->code;
+	fmt->width = sdformat->format.width;
+	fmt->height = sdformat->format.height;
 
 	sdformat->format = *fmt;
 
-- 
Regards,

Laurent Pinchart

