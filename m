Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE7D183D91
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 00:47:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgCLXrm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 19:47:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34488 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726986AbgCLXrl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 19:47:41 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C9479D3;
        Fri, 13 Mar 2020 00:47:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584056858;
        bh=PgzUbQYsCfH+UKSj5FNYBE8oSE5L5wAXt6bNsexz5Ew=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gJnj5Nq3Dr4L47EiDPi8FwHzXNrcnRkG16pLJEAhq5+mcRVA/FLYjvQnMmrxCPxp6
         yzdXRySMKGT3d7ZjeHOOw6n67iUCNpH3i3HVbLyMmoJKaj0I6+1cZQtHNEtqkgqTr0
         rJq6yQ3HRScxdFKTHu9PLeMfS7G8xBQLv6U+wfLc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 13/14] media: imx: imx7-mipi-csis: Don't use imx-media-utils helpers
Date:   Fri, 13 Mar 2020 01:47:21 +0200
Message-Id: <20200312234722.23483-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
References: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx7-mipi-csis only uses the imx_media_init_mbus_fmt() function from
the imx-media-utils helpers. The helpers don't support all the media bus
formats used by this driver, and are thus a bad fit. As the MIPI CSIS is
a standalone IP core that could be integrated in other SoCs, let's not
use the helper.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 0829980d7af5..66ff73919371 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -28,8 +28,6 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
-#include "imx-media.h"
-
 #define CSIS_DRIVER_NAME			"imx7-mipi-csis"
 #define CSIS_SUBDEV_NAME			CSIS_DRIVER_NAME
 
@@ -709,15 +707,21 @@ static int mipi_csis_init_cfg(struct v4l2_subdev *mipi_sd,
 	struct v4l2_mbus_framefmt *fmt_sink;
 	struct v4l2_mbus_framefmt *fmt_source;
 	enum v4l2_subdev_format_whence which;
-	int ret;
 
 	which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
 	fmt_sink = mipi_csis_get_format(state, cfg, which, CSIS_PAD_SINK);
-	ret = imx_media_init_mbus_fmt(fmt_sink, MIPI_CSIS_DEF_PIX_WIDTH,
-				      MIPI_CSIS_DEF_PIX_HEIGHT, 0,
-				      V4L2_FIELD_NONE, NULL);
-	if (ret < 0)
-		return ret;
+
+	fmt_sink->code = MEDIA_BUS_FMT_UYVY8_2X8;
+	fmt_sink->width = MIPI_CSIS_DEF_PIX_WIDTH;
+	fmt_sink->height = MIPI_CSIS_DEF_PIX_HEIGHT;
+	fmt_sink->field = V4L2_FIELD_NONE;
+
+	fmt_sink->colorspace = V4L2_COLORSPACE_SMPTE170M;
+	fmt_sink->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt_sink->colorspace);
+	fmt_sink->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt_sink->colorspace);
+	fmt_sink->quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(false, fmt_sink->colorspace,
+					      fmt_sink->ycbcr_enc);
 
 	/*
 	 * When called from mipi_csis_subdev_init() to initialize the active
-- 
Regards,

Laurent Pinchart

