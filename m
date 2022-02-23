Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EBE84C1090
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 11:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239698AbiBWKoZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 05:44:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235666AbiBWKoZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 05:44:25 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F133460DA8
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 02:43:57 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id AD54A4000F;
        Wed, 23 Feb 2022 10:43:53 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH v3 17/27] media: ov5640: Change CSI-2 timings to comply with FPS
Date:   Wed, 23 Feb 2022 11:40:24 +0100
Message-Id: <20220223104034.91550-18-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220223104034.91550-1-jacopo@jmondi.org>
References: <20220223104034.91550-1-jacopo@jmondi.org>
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
index faef8f7101c0..cef485922352 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -596,8 +596,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
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
@@ -640,8 +640,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
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
@@ -684,8 +684,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
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
@@ -728,8 +728,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
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
@@ -773,7 +773,7 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 				.height	= 480,
 			},
 			.htot		= 1896,
-			.vblank_def	= 504,
+			.vblank_def	= 1206,
 		},
 		.reg_data	= ov5640_setting_low_res,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
@@ -817,7 +817,7 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 				.height	= 576,
 			},
 			.htot		= 1896,
-			.vblank_def	= 408,
+			.vblank_def	= 1110,
 		},
 		.reg_data	= ov5640_setting_low_res,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
@@ -859,7 +859,7 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 				.height	= 768,
 			},
 			.htot		= 1896,
-			.vblank_def	= 312,
+			.vblank_def	= 918,
 		},
 		.reg_data	= ov5640_setting_low_res,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
@@ -900,8 +900,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
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
@@ -944,8 +944,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
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
2.35.0

