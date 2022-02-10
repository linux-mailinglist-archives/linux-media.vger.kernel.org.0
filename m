Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4F44B0BB8
	for <lists+linux-media@lfdr.de>; Thu, 10 Feb 2022 12:04:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240490AbiBJLEO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Feb 2022 06:04:14 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240476AbiBJLEK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Feb 2022 06:04:10 -0500
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13439100B
        for <linux-media@vger.kernel.org>; Thu, 10 Feb 2022 03:04:11 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 4C130200005;
        Thu, 10 Feb 2022 11:04:08 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 04/23] media: ov5640: Associate bpp with formats
Date:   Thu, 10 Feb 2022 12:04:39 +0100
Message-Id: <20220210110458.152494-5-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220210110458.152494-1-jacopo@jmondi.org>
References: <20220210110458.152494-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Associate the bit depth to each format supported by the sensor.

The bpp will be used to calculate the line length.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 73 ++++++++++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index ce3d38eadb86..71404d064045 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -150,24 +150,69 @@ enum ov5640_format_mux {
 	OV5640_FMT_MUX_RAW_CIP,
 };
 
-struct ov5640_pixfmt {
+static const struct ov5640_pixfmt {
 	u32 code;
 	u32 colorspace;
+	u8 bpp;
+} ov5640_formats[] = {
+	{
+		.code = MEDIA_BUS_FMT_JPEG_1X8,
+		.colorspace = V4L2_COLORSPACE_JPEG,
+		.bpp = 16,
+	}, {
+		.code = MEDIA_BUS_FMT_UYVY8_2X8,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.bpp = 16,
+	}, {
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.bpp = 16,
+	}, {
+		.code = MEDIA_BUS_FMT_YUYV8_2X8,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.bpp = 16,
+	}, {
+		.code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.bpp = 16,
+	}, {
+		.code = MEDIA_BUS_FMT_RGB565_2X8_LE,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.bpp = 16,
+	}, {
+		.code = MEDIA_BUS_FMT_RGB565_2X8_BE,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.bpp = 16,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.bpp = 8,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.bpp = 8
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.bpp = 8,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.bpp = 8,
+	},
 };
 
-static const struct ov5640_pixfmt ov5640_formats[] = {
-	{ MEDIA_BUS_FMT_JPEG_1X8, V4L2_COLORSPACE_JPEG, },
-	{ MEDIA_BUS_FMT_UYVY8_2X8, V4L2_COLORSPACE_SRGB, },
-	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_COLORSPACE_SRGB, },
-	{ MEDIA_BUS_FMT_YUYV8_2X8, V4L2_COLORSPACE_SRGB, },
-	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_COLORSPACE_SRGB, },
-	{ MEDIA_BUS_FMT_RGB565_2X8_LE, V4L2_COLORSPACE_SRGB, },
-	{ MEDIA_BUS_FMT_RGB565_2X8_BE, V4L2_COLORSPACE_SRGB, },
-	{ MEDIA_BUS_FMT_SBGGR8_1X8, V4L2_COLORSPACE_SRGB, },
-	{ MEDIA_BUS_FMT_SGBRG8_1X8, V4L2_COLORSPACE_SRGB, },
-	{ MEDIA_BUS_FMT_SGRBG8_1X8, V4L2_COLORSPACE_SRGB, },
-	{ MEDIA_BUS_FMT_SRGGB8_1X8, V4L2_COLORSPACE_SRGB, },
-};
+static u32 ov5640_code_to_bpp(u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ov5640_formats); ++i) {
+		if (ov5640_formats[i].code == code)
+			return ov5640_formats[i].bpp;
+	}
+
+	return 0;
+}
 
 /*
  * FIXME: remove this when a subdev API becomes available
-- 
2.35.0

