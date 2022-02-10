Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0C34B0BB5
	for <lists+linux-media@lfdr.de>; Thu, 10 Feb 2022 12:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240478AbiBJLEG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Feb 2022 06:04:06 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240476AbiBJLEF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Feb 2022 06:04:05 -0500
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E613D100B
        for <linux-media@vger.kernel.org>; Thu, 10 Feb 2022 03:04:06 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id DAFE920000E;
        Thu, 10 Feb 2022 11:04:02 +0000 (UTC)
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
Subject: [PATCH v2 02/23] media: ov5604: Re-arrange modes definition
Date:   Thu, 10 Feb 2022 12:04:37 +0100
Message-Id: <20220210110458.152494-3-jacopo@jmondi.org>
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

The array of supported modes is close to unreadable.
Re-arrange it giving it some room to breath.

Cosmetic change only.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 141 +++++++++++++++++++++----------------
 1 file changed, 81 insertions(+), 60 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 01f4a075f86e..d8285be2bfa1 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -599,66 +599,87 @@ static const struct ov5640_mode_info ov5640_mode_init_data = {
 
 static const struct ov5640_mode_info
 ov5640_mode_data[OV5640_NUM_MODES] = {
-	{OV5640_MODE_QQVGA_160_120, SUBSAMPLING,
-	 OV5640_PIXEL_RATE_48M,
-	 160, 1896, 120, 984,
-	 ov5640_setting_QQVGA_160_120,
-	 ARRAY_SIZE(ov5640_setting_QQVGA_160_120),
-	 OV5640_30_FPS},
-	{OV5640_MODE_QCIF_176_144, SUBSAMPLING,
-	 OV5640_PIXEL_RATE_48M,
-	 176, 1896, 144, 984,
-	 ov5640_setting_QCIF_176_144,
-	 ARRAY_SIZE(ov5640_setting_QCIF_176_144),
-	 OV5640_30_FPS},
-	{OV5640_MODE_QVGA_320_240, SUBSAMPLING,
-	 OV5640_PIXEL_RATE_48M,
-	 320, 1896, 240, 984,
-	 ov5640_setting_QVGA_320_240,
-	 ARRAY_SIZE(ov5640_setting_QVGA_320_240),
-	 OV5640_30_FPS},
-	{OV5640_MODE_VGA_640_480, SUBSAMPLING,
-	 OV5640_PIXEL_RATE_48M,
-	 640, 1896, 480, 1080,
-	 ov5640_setting_VGA_640_480,
-	 ARRAY_SIZE(ov5640_setting_VGA_640_480),
-	 OV5640_60_FPS},
-	{OV5640_MODE_NTSC_720_480, SUBSAMPLING,
-	 OV5640_PIXEL_RATE_96M,
-	 720, 1896, 480, 984,
-	 ov5640_setting_NTSC_720_480,
-	 ARRAY_SIZE(ov5640_setting_NTSC_720_480),
-	OV5640_30_FPS},
-	{OV5640_MODE_PAL_720_576, SUBSAMPLING,
-	 OV5640_PIXEL_RATE_96M,
-	 720, 1896, 576, 984,
-	 ov5640_setting_PAL_720_576,
-	 ARRAY_SIZE(ov5640_setting_PAL_720_576),
-	 OV5640_30_FPS},
-	{OV5640_MODE_XGA_1024_768, SUBSAMPLING,
-	 OV5640_PIXEL_RATE_96M,
-	 1024, 1896, 768, 1080,
-	 ov5640_setting_XGA_1024_768,
-	 ARRAY_SIZE(ov5640_setting_XGA_1024_768),
-	 OV5640_30_FPS},
-	{OV5640_MODE_720P_1280_720, SUBSAMPLING,
-	 OV5640_PIXEL_RATE_124M,
-	 1280, 1892, 720, 740,
-	 ov5640_setting_720P_1280_720,
-	 ARRAY_SIZE(ov5640_setting_720P_1280_720),
-	 OV5640_30_FPS},
-	{OV5640_MODE_1080P_1920_1080, SCALING,
-	 OV5640_PIXEL_RATE_148M,
-	 1920, 2500, 1080, 1120,
-	 ov5640_setting_1080P_1920_1080,
-	 ARRAY_SIZE(ov5640_setting_1080P_1920_1080),
-	 OV5640_30_FPS},
-	{OV5640_MODE_QSXGA_2592_1944, SCALING,
-	 OV5640_PIXEL_RATE_168M,
-	 2592, 2844, 1944, 1968,
-	 ov5640_setting_QSXGA_2592_1944,
-	 ARRAY_SIZE(ov5640_setting_QSXGA_2592_1944),
-	 OV5640_15_FPS},
+	{
+		/* 160x120 */
+		OV5640_MODE_QQVGA_160_120, SUBSAMPLING,
+		OV5640_PIXEL_RATE_48M,
+		160, 1896, 120, 984,
+		ov5640_setting_QQVGA_160_120,
+		ARRAY_SIZE(ov5640_setting_QQVGA_160_120),
+		OV5640_30_FPS
+	}, {
+		/* 176x144 */
+		OV5640_MODE_QCIF_176_144, SUBSAMPLING,
+		OV5640_PIXEL_RATE_48M,
+		176, 1896, 144, 984,
+		ov5640_setting_QCIF_176_144,
+		ARRAY_SIZE(ov5640_setting_QCIF_176_144),
+		OV5640_30_FPS
+	}, {
+		/* 320x240 */
+		OV5640_MODE_QVGA_320_240, SUBSAMPLING,
+		OV5640_PIXEL_RATE_48M,
+		320, 1896, 240, 984,
+		ov5640_setting_QVGA_320_240,
+		ARRAY_SIZE(ov5640_setting_QVGA_320_240),
+		OV5640_30_FPS
+	}, {
+		/* 640x480 */
+		OV5640_MODE_VGA_640_480, SUBSAMPLING,
+		OV5640_PIXEL_RATE_48M,
+		640, 1896, 480, 1080,
+		ov5640_setting_VGA_640_480,
+		ARRAY_SIZE(ov5640_setting_VGA_640_480),
+		OV5640_60_FPS
+	}, {
+		/* 720x480 */
+		OV5640_MODE_NTSC_720_480, SUBSAMPLING,
+		OV5640_PIXEL_RATE_96M,
+		720, 1896, 480, 984,
+		ov5640_setting_NTSC_720_480,
+		ARRAY_SIZE(ov5640_setting_NTSC_720_480),
+		OV5640_30_FPS
+	}, {
+		/* 720x576 */
+		OV5640_MODE_PAL_720_576, SUBSAMPLING,
+		OV5640_PIXEL_RATE_96M,
+		720, 1896, 576, 984,
+		ov5640_setting_PAL_720_576,
+		ARRAY_SIZE(ov5640_setting_PAL_720_576),
+		OV5640_30_FPS
+	}, {
+		/* 1024x768 */
+		OV5640_MODE_XGA_1024_768, SUBSAMPLING,
+		OV5640_PIXEL_RATE_96M,
+		1024, 1896, 768, 1080,
+		ov5640_setting_XGA_1024_768,
+		ARRAY_SIZE(ov5640_setting_XGA_1024_768),
+		OV5640_30_FPS
+	}, {
+		/* 1280x720 */
+		OV5640_MODE_720P_1280_720, SUBSAMPLING,
+		OV5640_PIXEL_RATE_124M,
+		1280, 1892, 720, 740,
+		ov5640_setting_720P_1280_720,
+		ARRAY_SIZE(ov5640_setting_720P_1280_720),
+		OV5640_30_FPS
+	}, {
+		/* 1920x1080 */
+		OV5640_MODE_1080P_1920_1080, SCALING,
+		OV5640_PIXEL_RATE_148M,
+		1920, 2500, 1080, 1120,
+		ov5640_setting_1080P_1920_1080,
+		ARRAY_SIZE(ov5640_setting_1080P_1920_1080),
+		OV5640_30_FPS
+	}, {
+		/* 2592x1944 */
+		OV5640_MODE_QSXGA_2592_1944, SCALING,
+		OV5640_PIXEL_RATE_168M,
+		2592, 2844, 1944, 1968,
+		ov5640_setting_QSXGA_2592_1944,
+		ARRAY_SIZE(ov5640_setting_QSXGA_2592_1944),
+		OV5640_15_FPS
+	},
 };
 
 static int ov5640_init_slave_id(struct ov5640_dev *sensor)
-- 
2.35.0

