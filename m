Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B593867D7CD
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 22:35:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbjAZVfH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 16:35:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233009AbjAZVfF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 16:35:05 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A9523C66
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 13:35:03 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2B59975;
        Thu, 26 Jan 2023 22:35:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674768902;
        bh=dlgWHoOO0Ly7P3GmVcC/r9QXKdJkZqiONF/Y7fqDyf8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k8r5+gowqPtJkSINelxejysIIctCk7eN0JZKGFQ4+Ol/wgoIGapQG3m876hMAQrG/
         LXgI2cfQYXvf2du9LmGRGk4BzoB5n/dRK2/k4bltMGY+h1b8sd8SGbX4EN3Vx3QlJj
         WAnU45WSx4Jfzs3RmqCy8lkC7aX0m2Z6ziWNU1O4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Adam Ford <aford173@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v1 5/5] media: imx-mipi-csis: Implement .init_cfg() using .set_fmt()
Date:   Thu, 26 Jan 2023 23:34:37 +0200
Message-Id: <20230126213437.20796-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126213437.20796-1-laurent.pinchart@ideasonboard.com>
References: <20230126213437.20796-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The .set_fmt() handler is responsible for adjusting the requested format
based on the device limitations. Implement .init_cfg() as a wrapper of
.set_fmt(), to ensure that the initial configuration always matches the
rules implemented in .set_fmt(), should they ever change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 48 ++++++++++------------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 9e424cb1c4b1..e99633565463 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -989,32 +989,6 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int mipi_csis_init_cfg(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_state *sd_state)
-{
-	struct v4l2_mbus_framefmt *fmt_sink;
-	struct v4l2_mbus_framefmt *fmt_source;
-
-	fmt_sink = v4l2_subdev_get_pad_format(sd, sd_state, CSIS_PAD_SINK);
-	fmt_source = v4l2_subdev_get_pad_format(sd, sd_state, CSIS_PAD_SOURCE);
-
-	fmt_sink->code = MEDIA_BUS_FMT_UYVY8_1X16;
-	fmt_sink->width = MIPI_CSIS_DEF_PIX_WIDTH;
-	fmt_sink->height = MIPI_CSIS_DEF_PIX_HEIGHT;
-	fmt_sink->field = V4L2_FIELD_NONE;
-
-	fmt_sink->colorspace = V4L2_COLORSPACE_SMPTE170M;
-	fmt_sink->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt_sink->colorspace);
-	fmt_sink->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt_sink->colorspace);
-	fmt_sink->quantization =
-		V4L2_MAP_QUANTIZATION_DEFAULT(false, fmt_sink->colorspace,
-					      fmt_sink->ycbcr_enc);
-
-	*fmt_source = *fmt_sink;
-
-	return 0;
-}
-
 static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_mbus_code_enum *code)
@@ -1101,6 +1075,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 	fmt->code = csis_fmt->code;
 	fmt->width = sdformat->format.width;
 	fmt->height = sdformat->format.height;
+	fmt->field = V4L2_FIELD_NONE;
 	fmt->colorspace = sdformat->format.colorspace;
 	fmt->quantization = sdformat->format.quantization;
 	fmt->xfer_func = sdformat->format.xfer_func;
@@ -1147,6 +1122,27 @@ static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	return 0;
 }
 
+static int mipi_csis_init_cfg(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_subdev_format fmt = {
+		.pad = CSIS_PAD_SINK,
+	};
+
+	fmt.format.code = mipi_csis_formats[0].code;
+	fmt.format.width = MIPI_CSIS_DEF_PIX_WIDTH;
+	fmt.format.height = MIPI_CSIS_DEF_PIX_HEIGHT;
+
+	fmt.format.colorspace = V4L2_COLORSPACE_SMPTE170M;
+	fmt.format.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt.format.colorspace);
+	fmt.format.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt.format.colorspace);
+	fmt.format.quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(false, fmt.format.colorspace,
+					      fmt.format.ycbcr_enc);
+
+	return mipi_csis_set_fmt(sd, sd_state, &fmt);
+}
+
 static int mipi_csis_log_status(struct v4l2_subdev *sd)
 {
 	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
-- 
Regards,

Laurent Pinchart

