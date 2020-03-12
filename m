Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB99183D86
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 00:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgCLXrf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 19:47:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34486 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726895AbgCLXre (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 19:47:34 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 543B1134B;
        Fri, 13 Mar 2020 00:47:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584056852;
        bh=zF47wBqlDAv+1UOCTn/dpU2OibiCIwXx91pnbMpoBPo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JvremsbTxrZHoz6quW/yq65UitlfdwCzSRtztC3oI7H89/rJXKbLE9hLYKD7R191+
         8b1sS7Otb9oBkGHtm06aCf7Mwq7oamLdmIs7loyi2mp5vtzHXj2DqKVN0i4m/sRsvx
         SQpEp4EnH/k1kvbBaNHaVuuLsrNa0dc/9d/f5iSE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 02/14] media: imx: imx7-mipi-csis: Centralize initialization of pad formats
Date:   Fri, 13 Mar 2020 01:47:10 +0200
Message-Id: <20200312234722.23483-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
References: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Pad formats for the active configuration are manually initialized in
mipi_csis_subdev_init(), while pad formats for the TRY configurations
are initialized by the subdev .init_cfg() operation. This creates a risk
of the two configurations not being synchronized. Fix it by initializing
formats in the .init_cfg() operation only, and calling it from
mipi_csis_subdev_init().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 56 ++++++++++++----------
 1 file changed, 32 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 25017ab78095..52d59047ee36 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -649,26 +649,6 @@ static int mipi_csis_link_setup(struct media_entity *entity,
 	return ret;
 }
 
-static int mipi_csis_init_cfg(struct v4l2_subdev *mipi_sd,
-			      struct v4l2_subdev_pad_config *cfg)
-{
-	struct v4l2_mbus_framefmt *mf;
-	unsigned int i;
-	int ret;
-
-	for (i = 0; i < CSIS_PADS_NUM; i++) {
-		mf = v4l2_subdev_get_try_format(mipi_sd, cfg, i);
-
-		ret = imx_media_init_mbus_fmt(mf, MIPI_CSIS_DEF_PIX_HEIGHT,
-					      MIPI_CSIS_DEF_PIX_WIDTH, 0,
-					      V4L2_FIELD_NONE, NULL);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
 static struct v4l2_mbus_framefmt *
 mipi_csis_get_format(struct csi_state *state,
 		     struct v4l2_subdev_pad_config *cfg,
@@ -681,6 +661,37 @@ mipi_csis_get_format(struct csi_state *state,
 	return &state->format_mbus;
 }
 
+static int mipi_csis_init_cfg(struct v4l2_subdev *mipi_sd,
+			      struct v4l2_subdev_pad_config *cfg)
+{
+	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
+	struct v4l2_mbus_framefmt *fmt_sink;
+	struct v4l2_mbus_framefmt *fmt_source;
+	enum v4l2_subdev_format_whence which;
+	int ret;
+
+	which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
+	fmt_sink = mipi_csis_get_format(state, cfg, which, CSIS_PAD_SINK);
+	ret = imx_media_init_mbus_fmt(fmt_sink, MIPI_CSIS_DEF_PIX_WIDTH,
+				      MIPI_CSIS_DEF_PIX_HEIGHT, 0,
+				      V4L2_FIELD_NONE, NULL);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * When called from mipi_csis_subdev_init() to initialize the active
+	 * configuration, cfg is NULL, which indicates there's no source pad
+	 * configuration to set.
+	 */
+	if (!cfg)
+		return 0;
+
+	fmt_source = mipi_csis_get_format(state, cfg, which, CSIS_PAD_SOURCE);
+	*fmt_source = *fmt_sink;
+
+	return 0;
+}
+
 static int mipi_csis_get_fmt(struct v4l2_subdev *mipi_sd,
 			     struct v4l2_subdev_pad_config *cfg,
 			     struct v4l2_subdev_format *sdformat)
@@ -875,10 +886,7 @@ static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
 	mipi_sd->dev = &pdev->dev;
 
 	state->csis_fmt = &mipi_csis_formats[0];
-	state->format_mbus.code = mipi_csis_formats[0].code;
-	state->format_mbus.width = MIPI_CSIS_DEF_PIX_WIDTH;
-	state->format_mbus.height = MIPI_CSIS_DEF_PIX_HEIGHT;
-	state->format_mbus.field = V4L2_FIELD_NONE;
+	mipi_csis_init_cfg(mipi_sd, NULL);
 
 	v4l2_set_subdevdata(mipi_sd, &pdev->dev);
 
-- 
Regards,

Laurent Pinchart

