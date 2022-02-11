Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 170D64B2206
	for <lists+linux-media@lfdr.de>; Fri, 11 Feb 2022 10:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348608AbiBKJdn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Feb 2022 04:33:43 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbiBKJdn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Feb 2022 04:33:43 -0500
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E34A1037
        for <linux-media@vger.kernel.org>; Fri, 11 Feb 2022 01:33:41 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 9596560008;
        Fri, 11 Feb 2022 09:33:35 +0000 (UTC)
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
Subject: [v2.1] media: ov5640: Rework analog crop rectangles
Date:   Fri, 11 Feb 2022 10:34:32 +0100
Message-Id: <20220211093432.41977-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220210110458.152494-11-jacopo@jmondi.org>
References: <20220210110458.152494-11-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The OV5640 pixel array is composed as:
- vertically: 16 dummy columns, 2592 valid ones and 16 dummy columns for
  a total of 2624 columns
- horizontally: 8 optical black lines, 6 dummy ones, 1944 valid and 6
  dummies for a total of 1964 lines

Adjust the analog crop rectangle in all modes to:
- Skip the first 16 dummy columns
- Skip the first 14 black/dummy lines
- Pass the whole valid pixel array size to the ISP for all modes except
  1024x768, 720p and 1080p which are obtained by cropping the valid pixel array.

Adjust how timings is programmed to comply with the new definitions.

Tested in RGB565, UYVY, RGB565 and RGB888 modes.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5640.c | 120 +++++++++++++++++++++----------------
 1 file changed, 68 insertions(+), 52 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index f817f865ad16..232afd4d906a 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -626,14 +626,14 @@ static const struct ov5640_mode_info ov5640_mode_init_data = {
 		.dn_mode	= SUBSAMPLING,
 		.pixel_rate	= OV5640_PIXEL_RATE_96M,
 		.analog_crop = {
-			.left	= 0,
-			.top	= 4,
-			.width	= 2623,
-			.height	= 1947,
+			.left	= OV5640_PIXEL_ARRAY_LEFT,
+			.top	= OV5640_PIXEL_ARRAY_TOP,
+			.width	= OV5640_PIXEL_ARRAY_WIDTH,
+			.height	= OV5640_PIXEL_ARRAY_HEIGHT,
 		},
 		.crop = {
-			.left	= 16,
-			.top	= 6,
+			.left	= 2,
+			.top	= 4,
 			.width	= 640,
 			.height	= 480,
 		},
@@ -644,22 +644,23 @@ static const struct ov5640_mode_info ov5640_mode_init_data = {
 		.max_fps	= OV5640_30_FPS
 };

-static const struct ov5640_mode_info
-ov5640_mode_data[OV5640_NUM_MODES] = {
+static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 	{
 		/* 160x120 */
 		.id		= OV5640_MODE_QQVGA_160_120,
 		.dn_mode	= SUBSAMPLING,
 		.pixel_rate	= OV5640_PIXEL_RATE_48M,
 		.analog_crop = {
-			.left	= 0,
-			.top	= 4,
-			.width	= 2623,
-			.height	= 1947,
+			/* Feed the full valid pixel array to the ISP. */
+			.left	= OV5640_PIXEL_ARRAY_LEFT,
+			.top	= OV5640_PIXEL_ARRAY_TOP,
+			.width	= OV5640_PIXEL_ARRAY_WIDTH,
+			.height	= OV5640_PIXEL_ARRAY_HEIGHT,
 		},
 		.crop = {
-			.left	= 16,
-			.top	= 6,
+			/* Maintain a minimum digital crop processing margins. */
+			.left	= 2,
+			.top	= 4,
 			.width	= 160,
 			.height	= 120,
 		},
@@ -674,14 +675,16 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 		.dn_mode	= SUBSAMPLING,
 		.pixel_rate	= OV5640_PIXEL_RATE_48M,
 		.analog_crop = {
-			.left	= 0,
-			.top	= 4,
-			.width	= 2623,
-			.height	= 1947,
+			/* Feed the full valid pixel array to the ISP. */
+			.left	= OV5640_PIXEL_ARRAY_LEFT,
+			.top	= OV5640_PIXEL_ARRAY_TOP,
+			.width	= OV5640_PIXEL_ARRAY_WIDTH,
+			.height	= OV5640_PIXEL_ARRAY_HEIGHT,
 		},
 		.crop = {
-			.left	= 16,
-			.top	= 6,
+			/* Maintain a minimum digital crop processing margins. */
+			.left	= 2,
+			.top	= 4,
 			.width	= 176,
 			.height	= 144,
 		},
@@ -696,14 +699,16 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 		.dn_mode	= SUBSAMPLING,
 		.pixel_rate	= OV5640_PIXEL_RATE_48M,
 		.analog_crop = {
-			.left	= 0,
-			.top	= 4,
-			.width	= 2623,
-			.height	= 1947,
+			/* Feed the full valid pixel array to the ISP. */
+			.left	= OV5640_PIXEL_ARRAY_LEFT,
+			.top	= OV5640_PIXEL_ARRAY_TOP,
+			.width	= OV5640_PIXEL_ARRAY_WIDTH,
+			.height	= OV5640_PIXEL_ARRAY_HEIGHT,
 		},
 		.crop = {
-			.left	= 16,
-			.top	= 6,
+			/* Maintain a minimum digital crop processing margins. */
+			.left	= 2,
+			.top	= 4,
 			.width	= 320,
 			.height	= 240,
 		},
@@ -718,14 +723,16 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 		.dn_mode	= SUBSAMPLING,
 		.pixel_rate	= OV5640_PIXEL_RATE_48M,
 		.analog_crop = {
-			.left	= 0,
-			.top	= 4,
-			.width	= 2623,
-			.height	= 1947,
+			/* Feed the full valid pixel array to the ISP. */
+			.left	= OV5640_PIXEL_ARRAY_LEFT,
+			.top	= OV5640_PIXEL_ARRAY_TOP,
+			.width	= OV5640_PIXEL_ARRAY_WIDTH,
+			.height	= OV5640_PIXEL_ARRAY_HEIGHT,
 		},
 		.crop = {
-			.left	= 16,
-			.top	= 6,
+			/* Maintain a minimum digital crop processing margins. */
+			.left	= 2,
+			.top	= 4,
 			.width	= 640,
 			.height	= 480,
 		},
@@ -740,12 +747,14 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 		.dn_mode	= SUBSAMPLING,
 		.pixel_rate	= OV5640_PIXEL_RATE_96M,
 		.analog_crop = {
-			.left	= 0,
-			.top	= 4,
-			.width	= 2623,
-			.height	= 1947,
+			/* Feed the full valid pixel array to the ISP. */
+			.left	= OV5640_PIXEL_ARRAY_LEFT,
+			.top	= OV5640_PIXEL_ARRAY_TOP,
+			.width	= OV5640_PIXEL_ARRAY_WIDTH,
+			.height	= OV5640_PIXEL_ARRAY_HEIGHT,
 		},
 		.crop = {
+			/* Maintain a minimum digital crop processing margins. */
 			.left	= 56,
 			.top	= 60,
 			.width	= 720,
@@ -762,12 +771,14 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 		.dn_mode	= SUBSAMPLING,
 		.pixel_rate	= OV5640_PIXEL_RATE_96M,
 		.analog_crop = {
-			.left	= 0,
-			.top	= 4,
-			.width	= 2623,
-			.height	= 1947,
+			/* Feed the full valid pixel array to the ISP. */
+			.left	= OV5640_PIXEL_ARRAY_LEFT,
+			.top	= OV5640_PIXEL_ARRAY_TOP,
+			.width	= OV5640_PIXEL_ARRAY_WIDTH,
+			.height	= OV5640_PIXEL_ARRAY_HEIGHT,
 		},
 		.crop = {
+			/* Maintain a minimum digital crop processing margins. */
 			.left	= 56,
 			.top	= 6,
 			.width	= 720,
@@ -786,8 +797,8 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 		.analog_crop = {
 			.left	= 0,
 			.top	= 4,
-			.width	= 2623,
-			.height	= 1947,
+			.width	= OV5640_NATIVE_WIDTH,
+			.height	= OV5640_PIXEL_ARRAY_HEIGHT,
 		},
 		.crop = {
 			.left	= 16,
@@ -808,8 +819,8 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 		.analog_crop = {
 			.left	= 0,
 			.top	= 250,
-			.width	= 2623,
-			.height	= 1705,
+			.width	= 2624,
+			.height	= 1456,
 		},
 		.crop = {
 			.left	= 16,
@@ -828,12 +839,14 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 		.dn_mode	= SCALING,
 		.pixel_rate	= OV5640_PIXEL_RATE_148M,
 		.analog_crop = {
+			/* Crop the full valid pixel array in the center. */
 			.left	= 336,
 			.top	= 434,
-			.width	= 2287,
-			.height	= 1521,
+			.width	= 1952,
+			.height	= 1088,
 		},
 		.crop = {
+			/* Maintain a larger digital crop processing margins. */
 			.left	= 16,
 			.top	= 4,
 			.width	= 1920,
@@ -850,16 +863,17 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 		.dn_mode	= SCALING,
 		.pixel_rate	= OV5640_PIXEL_RATE_168M,
 		.analog_crop = {
+			/* Give more processing margin to full resolution. */
 			.left	= 0,
 			.top	= 0,
-			.width	= 2623,
-			.height	= 1951,
+			.width	= OV5640_NATIVE_WIDTH,
+			.height	= 1952,
 		},
 		.crop = {
 			.left	= 16,
 			.top	= 4,
-			.width	= 2592,
-			.height	= 1944,
+			.width	= OV5640_PIXEL_ARRAY_WIDTH,
+			.height	= OV5640_PIXEL_ARRAY_HEIGHT,
 		},
 		.htot		= 2844,
 		.vblank_def	= 24,
@@ -1384,11 +1398,13 @@ static int ov5640_set_timings(struct ov5640_dev *sensor,
 	if (ret < 0)
 		return ret;

-	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_HW, analog_crop->width);
+	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_HW,
+				 analog_crop->width + analog_crop->left - 1);
 	if (ret < 0)
 		return ret;

-	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_VH, analog_crop->height);
+	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_VH,
+				 analog_crop->height + analog_crop->top - 1);
 	if (ret < 0)
 		return ret;

--
2.35.0

