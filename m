Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C78584A4960
	for <lists+linux-media@lfdr.de>; Mon, 31 Jan 2022 15:32:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236976AbiAaOce (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jan 2022 09:32:34 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:37487 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236919AbiAaOce (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jan 2022 09:32:34 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id EB449FF812;
        Mon, 31 Jan 2022 14:32:29 +0000 (UTC)
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
Subject: [PATCH 09/21] media: ov5640: Remove ov5640_mode_init_data
Date:   Mon, 31 Jan 2022 15:32:33 +0100
Message-Id: <20220131143245.128089-10-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131143245.128089-1-jacopo@jmondi.org>
References: <20220131143245.128089-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
---
 drivers/media/i2c/ov5640.c | 32 +++++---------------------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index d966cca78e92..1e2f37c93f0d 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -348,7 +348,7 @@ static inline bool ov5640_is_mipi(struct ov5640_dev *sensor)
  * over i2c.
  */
 /* YUV422 UYVY VGA@30fps */
-static const struct reg_value ov5640_init_setting_30fps_VGA[] = {
+static const struct reg_value ov5640_init_setting[] = {
 	{0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
 	{0x3103, 0x03, 0, 0}, {0x3630, 0x36, 0, 0},
 	{0x3631, 0x0e, 0, 0}, {0x3632, 0xe2, 0, 0}, {0x3633, 0x12, 0, 0},
@@ -586,30 +586,6 @@ static const struct reg_value ov5640_setting_QSXGA_2592_1944[] = {
 	{0x3824, 0x02, 0, 0}, {0x5001, 0x83, 0, 70},
 };
 
-/* power-on sensor init reg table */
-static const struct ov5640_mode_info ov5640_mode_init_data = {
-		.id		= 0,
-		.dn_mode	= SUBSAMPLING,
-		.pixel_rate	= OV5640_PIXEL_RATE_96M,
-		.analog_crop = {
-			.left	= 0,
-			.top	= 4,
-			.width	= 2623,
-			.height	= 1947,
-		},
-		.crop = {
-			.left	= 16,
-			.top	= 6,
-			.width	= 640,
-			.height	= 480,
-		},
-		.ppl		= 1896,
-		.vblank_def	= 504,
-		.reg_data	= ov5640_init_setting_30fps_VGA,
-		.reg_data_size	= ARRAY_SIZE(ov5640_init_setting_30fps_VGA),
-		.max_fps	= OV5640_30_FPS
-};
-
 static const struct ov5640_mode_info
 ov5640_mode_data[OV5640_NUM_MODES] = {
 	{
@@ -2117,13 +2093,15 @@ static int ov5640_set_framefmt(struct ov5640_dev *sensor,
 /* restore the last set video mode after chip power-on */
 static int ov5640_restore_mode(struct ov5640_dev *sensor)
 {
+	struct ov5640_mode_info init_data = {};
 	int ret;
 
 	/* first load the initial register values */
-	ret = ov5640_load_regs(sensor, &ov5640_mode_init_data);
+	init_data.reg_data = ov5640_init_setting;
+	init_data.reg_data_size = ARRAY_SIZE(ov5640_init_setting);
+	ret = ov5640_load_regs(sensor, &init_data);
 	if (ret < 0)
 		return ret;
-	sensor->last_mode = &ov5640_mode_init_data;
 
 	ret = ov5640_mod_reg(sensor, OV5640_REG_SYS_ROOT_DIVIDER, 0x3f,
 			     (ilog2(OV5640_SCLK2X_ROOT_DIV) << 2) |
-- 
2.35.0

