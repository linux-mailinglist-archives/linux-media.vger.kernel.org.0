Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3B6A4BBF9D
	for <lists+linux-media@lfdr.de>; Fri, 18 Feb 2022 19:36:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239302AbiBRSgS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Feb 2022 13:36:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239303AbiBRSgR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Feb 2022 13:36:17 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E605272782
        for <linux-media@vger.kernel.org>; Fri, 18 Feb 2022 10:35:59 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 0106540002;
        Fri, 18 Feb 2022 18:35:54 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     slongerbeam@gmail.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        martin.kepplinger@puri.sm, rmfrfs@gmail.com,
        xavier.roumegue@oss.nxp.com, alexander.stein@ew.tq-group.com,
        dorota.czaplejewicz@puri.sm
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v2 7/7] media: imx: imx-mipi-csis: Add output format
Date:   Fri, 18 Feb 2022 19:34:21 +0100
Message-Id: <20220218183421.583874-8-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220218183421.583874-1-jacopo@jmondi.org>
References: <20220218183421.583874-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Due to how pixel components are transmitted on the CSI-2 serial bus
and how they are stored in memory by the CSI-2 receiver, the component
ordering might change and the image formats on the sink and source pads
of the receiver should reflect it.

For RGB24, in example, the component ordering on the wire as described by
the CSI-2 specification matches the BGR888 format, while once stored in
in memory by the CSIS receiver they match the RGB888 format.

Add an additional .output field to struct csis_pix_format to allow
propagating the correct format to the source pad after a format
configuration on the sink.

The change is only relevant for RGB24 but paves the way for further
format translations in future.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/platform/imx/imx-mipi-csis.c | 29 +++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
index fdf133f81c5b..128f4180d1e9 100644
--- a/drivers/media/platform/imx/imx-mipi-csis.c
+++ b/drivers/media/platform/imx/imx-mipi-csis.c
@@ -351,6 +351,7 @@ struct csis_pix_format {
 	u32 code;
 	u32 data_type;
 	u8 width;
+	u32 output;
 };
 
 static const struct csis_pix_format mipi_csis_formats[] = {
@@ -359,95 +360,117 @@ static const struct csis_pix_format mipi_csis_formats[] = {
 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
 		.data_type = MIPI_CSI2_DATA_TYPE_YUV422_8,
 		.width = 16,
+		.output = MEDIA_BUS_FMT_UYVY8_1X16,
 	},
 	/* RGB formats. */
 	{
 		.code = MEDIA_BUS_FMT_RGB565_1X16,
 		.data_type = MIPI_CSI2_DATA_TYPE_RGB565,
 		.width = 16,
+		.output = MEDIA_BUS_FMT_RGB565_1X16,
 	},
 	{
 		.code = MEDIA_BUS_FMT_BGR888_1X24,
 		.data_type = MIPI_CSI2_DATA_TYPE_RGB888,
 		.width = 24,
+		.output = MEDIA_BUS_FMT_RGB888_1X24,
 	},
 	/* RAW (Bayer and greyscale) formats. */
 	{
 		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
 		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
 		.width = 8,
+		.output = MEDIA_BUS_FMT_SBGGR8_1X8,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
 		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
 		.width = 8,
+		.output = MEDIA_BUS_FMT_SGBRG8_1X8,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
 		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
 		.width = 8,
+		.output = MEDIA_BUS_FMT_SGRBG8_1X8,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
 		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
 		.width = 8,
+		.output = MEDIA_BUS_FMT_SRGGB8_1X8,
 	}, {
 		.code = MEDIA_BUS_FMT_Y8_1X8,
 		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
 		.width = 8,
+		.output = MEDIA_BUS_FMT_Y8_1X8,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
 		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
 		.width = 10,
+		.output = MEDIA_BUS_FMT_SBGGR10_1X10,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
 		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
 		.width = 10,
+		.output = MEDIA_BUS_FMT_SGBRG10_1X10,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
 		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
 		.width = 10,
+		.output = MEDIA_BUS_FMT_SGRBG10_1X10,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
 		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
 		.width = 10,
+		.output = MEDIA_BUS_FMT_SRGGB10_1X10,
 	}, {
 		.code = MEDIA_BUS_FMT_Y10_1X10,
 		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
 		.width = 10,
+		.output = MEDIA_BUS_FMT_Y10_1X10,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
 		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
 		.width = 12,
+		.output = MEDIA_BUS_FMT_SBGGR12_1X12,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
 		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
 		.width = 12,
+		.output = MEDIA_BUS_FMT_SGBRG12_1X12,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
 		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
 		.width = 12,
+		.output = MEDIA_BUS_FMT_SGRBG12_1X12,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
 		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
 		.width = 12,
+		.output = MEDIA_BUS_FMT_SRGGB12_1X12,
 	}, {
 		.code = MEDIA_BUS_FMT_Y12_1X12,
 		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
 		.width = 12,
+		.output = MEDIA_BUS_FMT_Y12_1X12,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
 		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
 		.width = 14,
+		.output = MEDIA_BUS_FMT_SBGGR14_1X14,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
 		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
 		.width = 14,
+		.output = MEDIA_BUS_FMT_SGBRG14_1X14,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
 		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
 		.width = 14,
+		.output = MEDIA_BUS_FMT_SGRBG14_1X14,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
 		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
 		.width = 14,
+		.output = MEDIA_BUS_FMT_SRGGB14_1X14,
 	}
 };
 
@@ -1090,7 +1113,11 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 	/* Propagate the format from sink to source. */
 	fmt = mipi_csis_get_format(state, sd_state, sdformat->which,
 				   CSIS_PAD_SOURCE);
-	*fmt = sdformat->format;
+
+	/* The format on the source pad might change due to unpacking. */
+	fmt->code = csis_fmt->output;
+	fmt->width = sdformat->format.width;
+	fmt->height = sdformat->format.height;
 
 	/* Store the CSIS format descriptor for active formats. */
 	if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-- 
2.35.0

