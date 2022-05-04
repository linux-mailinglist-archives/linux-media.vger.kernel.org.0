Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA0B51A504
	for <lists+linux-media@lfdr.de>; Wed,  4 May 2022 18:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353102AbiEDQP5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 12:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353101AbiEDQP5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 12:15:57 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B57B927FC8
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 09:12:20 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id D636D1BF20C;
        Wed,  4 May 2022 16:12:15 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     slongerbeam@gmail.com
Cc:     laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com, eddy.khan@vergesense.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v6 14/28] media: ov5640: Remove ov5640_mode_init_data
Date:   Wed,  4 May 2022 18:11:48 +0200
Message-Id: <20220504161153.185169-5-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504155157.184047-1-jacopo@jmondi.org>
References: <20220504155157.184047-1-jacopo@jmondi.org>
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

The ov5640_mode_init_data is a fictional sensor more which is used to
program the initial sensor settings.

It is only used to initialize the sensor and can be replaced
it with a throw-away mode which just wraps the register table.

Also rename the register table to drop the format from the name to make
it clear an actual sensor mode has to be applied after the initial
programming.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 67 ++++++--------------------------------
 1 file changed, 10 insertions(+), 57 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 0cab0f83c223..6edd38d6fb63 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -404,7 +404,7 @@ static inline bool ov5640_is_csi2(const struct ov5640_dev *sensor)
  * over i2c.
  */
 /* YUV422 UYVY VGA@30fps */
-static const struct reg_value ov5640_init_setting_30fps_VGA[] = {
+static const struct reg_value ov5640_init_setting[] = {
 	{0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
 	{0x3103, 0x03, 0, 0}, {0x3630, 0x36, 0, 0},
 	{0x3631, 0x0e, 0, 0}, {0x3632, 0xe2, 0, 0}, {0x3633, 0x12, 0, 0},
@@ -552,50 +552,6 @@ static const struct reg_value ov5640_setting_QSXGA_2592_1944[] = {
 	{0x3824, 0x02, 0, 0}, {0x5001, 0x83, 0, 70},
 };
 
-/* power-on sensor init reg table */
-static const struct ov5640_mode_info ov5640_mode_init_data = {
-		.id		= 0,
-		.dn_mode	= SUBSAMPLING,
-		.pixel_rate	= OV5640_PIXEL_RATE_96M,
-		.width	= 640,
-		.height	= 480,
-		.dvp_timings = {
-			.analog_crop = {
-				.left	= 0,
-				.top	= 4,
-				.width	= 2624,
-				.height	= 1944,
-			},
-			.crop = {
-				.left	= 16,
-				.top	= 6,
-				.width	= 640,
-				.height	= 480,
-			},
-			.htot		= 1896,
-			.vblank_def	= 504,
-		},
-		.csi2_timings = {
-			.analog_crop = {
-				.left	= OV5640_PIXEL_ARRAY_LEFT,
-				.top	= OV5640_PIXEL_ARRAY_TOP,
-				.width	= OV5640_PIXEL_ARRAY_WIDTH,
-				.height	= OV5640_PIXEL_ARRAY_HEIGHT,
-			},
-			.crop = {
-				.left	= 2,
-				.top	= 4,
-				.width	= 640,
-				.height	= 480,
-			},
-			.htot		= 1896,
-			.vblank_def	= 504,
-		},
-		.reg_data	= ov5640_init_setting_30fps_VGA,
-		.reg_data_size	= ARRAY_SIZE(ov5640_init_setting_30fps_VGA),
-		.max_fps	= OV5640_30_FPS
-};
-
 static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 	{
 		/* 160x120 */
@@ -1607,17 +1563,16 @@ static int ov5640_set_timings(struct ov5640_dev *sensor,
 	return 0;
 }
 
-static int ov5640_load_regs(struct ov5640_dev *sensor,
-			    const struct ov5640_mode_info *mode)
+static void ov5640_load_regs(struct ov5640_dev *sensor,
+			     const struct reg_value *regs, unsigned int regnum)
 {
-	const struct reg_value *regs = mode->reg_data;
 	unsigned int i;
 	u32 delay_ms;
 	u16 reg_addr;
 	u8 mask, val;
 	int ret = 0;
 
-	for (i = 0; i < mode->reg_data_size; ++i, ++regs) {
+	for (i = 0; i < regnum; ++i, ++regs) {
 		delay_ms = regs->delay_ms;
 		reg_addr = regs->reg_addr;
 		val = regs->val;
@@ -1639,8 +1594,6 @@ static int ov5640_load_regs(struct ov5640_dev *sensor,
 		if (delay_ms)
 			usleep_range(1000 * delay_ms, 1000 * delay_ms + 100);
 	}
-
-	return ov5640_set_timings(sensor, mode);
 }
 
 static int ov5640_set_autoexposure(struct ov5640_dev *sensor, bool on)
@@ -2093,7 +2046,8 @@ static int ov5640_set_mode_exposure_calc(struct ov5640_dev *sensor,
 		return ret;
 
 	/* Write capture setting */
-	ret = ov5640_load_regs(sensor, mode);
+	ov5640_load_regs(sensor, mode->reg_data, mode->reg_data_size);
+	ret = ov5640_set_timings(sensor, mode);
 	if (ret < 0)
 		return ret;
 
@@ -2217,7 +2171,8 @@ static int ov5640_set_mode_direct(struct ov5640_dev *sensor,
 		return -EINVAL;
 
 	/* Write capture setting */
-	return ov5640_load_regs(sensor, mode);
+	ov5640_load_regs(sensor, mode->reg_data, mode->reg_data_size);
+	return ov5640_set_timings(sensor, mode);
 }
 
 static int ov5640_set_mode(struct ov5640_dev *sensor)
@@ -2315,10 +2270,8 @@ static int ov5640_restore_mode(struct ov5640_dev *sensor)
 	int ret;
 
 	/* first load the initial register values */
-	ret = ov5640_load_regs(sensor, &ov5640_mode_init_data);
-	if (ret < 0)
-		return ret;
-	sensor->last_mode = &ov5640_mode_init_data;
+	ov5640_load_regs(sensor, ov5640_init_setting,
+			 ARRAY_SIZE(ov5640_init_setting));
 
 	ret = ov5640_mod_reg(sensor, OV5640_REG_SYS_ROOT_DIVIDER, 0x3f,
 			     (ilog2(OV5640_SCLK2X_ROOT_DIV) << 2) |
-- 
2.35.1

