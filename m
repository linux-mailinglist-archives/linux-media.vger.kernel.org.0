Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7CB351A509
	for <lists+linux-media@lfdr.de>; Wed,  4 May 2022 18:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353110AbiEDQQS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 12:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353108AbiEDQQR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 12:16:17 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69FF3289B5
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 09:12:39 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 896D21BF20B;
        Wed,  4 May 2022 16:12:34 +0000 (UTC)
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
Subject: [PATCH v6 19/28] media: ov5640: Change CSI-2 timings to comply with FPS
Date:   Wed,  4 May 2022 18:11:53 +0200
Message-Id: <20220504161153.185169-10-jacopo@jmondi.org>
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

Now that the frame duration can be controlled by tuning the VBLANK
duration in CSI-2 mode, fix all modes definitions to comply with the
reported FPS.

All modes run at 30 FPS except for full-resolution mode 2592x1944
which runs at 15FPS.

Tested on a 2 data lanes setup in UYVY and RGB565 modes in CSI-2 mode.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index a17fcb39410d..8391e920ef79 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -598,8 +598,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 				.width	= 160,
 				.height	= 120,
 			},
-			.htot		= 1896,
-			.vblank_def	= 864,
+			.htot		= 1600,
+			.vblank_def	= 878,
 		},
 		.reg_data	= ov5640_setting_low_res,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
@@ -643,8 +643,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 				.width	= 176,
 				.height	= 144,
 			},
-			.htot		= 1896,
-			.vblank_def	= 840,
+			.htot		= 1600,
+			.vblank_def	= 854,
 		},
 		.reg_data	= ov5640_setting_low_res,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
@@ -688,8 +688,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 				.width	= 320,
 				.height	= 240,
 			},
-			.htot		= 1896,
-			.vblank_def	= 744,
+			.htot		= 1600,
+			.vblank_def	= 760,
 		},
 		.reg_data	= ov5640_setting_low_res,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
@@ -733,8 +733,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 				.width	= 640,
 				.height	= 480,
 			},
-			.htot		= 1896,
-			.vblank_def	= 600,
+			.htot		= 1600,
+			.vblank_def	= 520,
 		},
 		.reg_data	= ov5640_setting_low_res,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
@@ -778,7 +778,7 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 				.height	= 480,
 			},
 			.htot		= 1896,
-			.vblank_def	= 504,
+			.vblank_def	= 1206,
 		},
 		.reg_data	= ov5640_setting_low_res,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
@@ -822,7 +822,7 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 				.height	= 576,
 			},
 			.htot		= 1896,
-			.vblank_def	= 408,
+			.vblank_def	= 1110,
 		},
 		.reg_data	= ov5640_setting_low_res,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
@@ -865,7 +865,7 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 				.height	= 768,
 			},
 			.htot		= 1896,
-			.vblank_def	= 312,
+			.vblank_def	= 918,
 		},
 		.reg_data	= ov5640_setting_low_res,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
@@ -907,8 +907,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 				.width	= 1280,
 				.height	= 720,
 			},
-			.htot		= 1892,
-			.vblank_def	= 20,
+			.htot		= 1600,
+			.vblank_def	= 560,
 		},
 		.reg_data	= ov5640_setting_720P_1280_720,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_720P_1280_720),
@@ -952,8 +952,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 				.width	= 1920,
 				.height	= 1080,
 			},
-			.htot		= 2500,
-			.vblank_def	= 40,
+			.htot		= 2234,
+			.vblank_def	= 24,
 		},
 		.reg_data	= ov5640_setting_1080P_1920_1080,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_1080P_1920_1080),
-- 
2.35.1

