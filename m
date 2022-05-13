Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7451F5263A9
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345226AbiEMOQV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345179AbiEMOQF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:16:05 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38F7087234
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652451363; x=1683987363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dQTHQlAKocxC9MzStzfQS9a55GYhtUrTm5MuMI42U+w=;
  b=Qyho95e60whB7xx5WcAavprmUP5iJX0b1d4WMJAk4FMs+/ctoGon5/sM
   0CbavUlHQz2MMsBTTy3CuAgSTwl2BVYpfQQBnLAgEec4FgaVbfLxP4WaG
   M43W94frbTdaFdtFbm4NueAi88UKohJE8d6d0wJlmT1Vi4/iQ0uTdoVIo
   pIzeRnGjSJ4KbXU6ZtQfHyFccM8POKG25ttyu8VjqrmExefKBYyP24Xck
   Uz4nKHj+2izLlI79cNv+3QzLJMn9/N10SZetoJ2g5UHZKh9Vz57syl4v2
   Q/D+fIWUkrc9QJoe0EgB3Qyp/RI2xXUB50gIxEVG3k63ua6RhvkAllcTw
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="269984505"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="269984505"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:02 -0700
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="659103656"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:15:58 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 452FA21435;
        Fri, 13 May 2022 17:15:50 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1npW57-0001g8-HK; Fri, 13 May 2022 17:15:49 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        mirela.rabulea@nxp.com, xavier.roumegue@oss.nxp.com,
        tomi.valkeinen@ideasonboard.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, Eugen.Hristev@microchip.com,
        jbrunet@baylibre.com, paul.elder@ideasonboard.com,
        eddy.khan@vergesense.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v7 10/28] media: ov5640: Split DVP and CSI-2 timings
Date:   Fri, 13 May 2022 17:15:30 +0300
Message-Id: <20220513141548.6344-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
References: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacopo Mondi <jacopo@jmondi.org>

Separate the timings for the DVP mode from the timings for the CSI-2
mode in the ov5640 modes definition.

The CSI-2 timings will deviate from the DVP ones as the clock tree is
calculated differently.

In CSI-2 mode change the analog crop rectangles as the OV5640 pixel
array is composed as:
- vertically: 16 dummy columns, 2592 valid ones and 16 dummy columns for
  a total of 2624 columns
- horizontally: 8 optical black lines, 6 dummy ones, 1944 valid and 6
  dummies for a total of 1964 lines

Adjust the analog crop rectangle in CSI-2 mode to:
- Skip the first 16 dummy columns
- Skip the first 14 black/dummy lines
- Pass the whole valid pixel array size to the ISP for all modes except
  1024x768, 720p and 1080p which are obtained by cropping the valid pixel
  array.

Tested in RGB565, UYVY and RGB888 modes in CSI-2 mode.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Acked-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Tested-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov5640.c | 582 ++++++++++++++++++++++++++-----------
 1 file changed, 420 insertions(+), 162 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 1c30018470c54..8bb8a463dc7dc 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -29,6 +29,13 @@
 #define OV5640_XCLK_MIN  6000000
 #define OV5640_XCLK_MAX 54000000
 
+#define OV5640_NATIVE_WIDTH		2624
+#define OV5640_NATIVE_HEIGHT		1964
+#define OV5640_PIXEL_ARRAY_TOP		14
+#define OV5640_PIXEL_ARRAY_LEFT		16
+#define OV5640_PIXEL_ARRAY_WIDTH	2592
+#define OV5640_PIXEL_ARRAY_HEIGHT	1944
+
 #define OV5640_DEFAULT_SLAVE_ID 0x3c
 
 #define OV5640_LINK_RATE_MAX		490000000U
@@ -269,21 +276,32 @@ struct reg_value {
 	u32 delay_ms;
 };
 
-struct ov5640_mode_info {
-	enum ov5640_mode_id id;
-	enum ov5640_downsize_mode dn_mode;
-	enum ov5640_pixel_rate_id pixel_rate;
+struct ov5640_timings {
 	/* Analog crop rectangle. */
 	struct v4l2_rect analog_crop;
 	/* Visibile crop: from analog crop top-left corner. */
 	struct v4l2_rect crop;
-	/* Total pixels per line: crop.width + fixed hblank. */
+	/* Total pixels per line: width + fixed hblank. */
 	u32 htot;
-	/* Default vertical blanking: frame height = crop.height + vblank. */
+	/* Default vertical blanking: frame height = height + vblank. */
 	u32 vblank_def;
+};
+
+struct ov5640_mode_info {
+	enum ov5640_mode_id id;
+	enum ov5640_downsize_mode dn_mode;
+	enum ov5640_pixel_rate_id pixel_rate;
+
+	unsigned int width;
+	unsigned int height;
+
+	struct ov5640_timings dvp_timings;
+	struct ov5640_timings csi2_timings;
+
 	const struct reg_value *reg_data;
 	u32 reg_data_size;
-	/* DVP only; ignored in MIPI mode. */
+
+	/* Used by s_frame_interval only. */
 	u32 max_fps;
 };
 
@@ -629,46 +647,87 @@ static const struct ov5640_mode_info ov5640_mode_init_data = {
 		.id		= 0,
 		.dn_mode	= SUBSAMPLING,
 		.pixel_rate	= OV5640_PIXEL_RATE_96M,
-		.analog_crop = {
-			.left	= 0,
-			.top	= 4,
-			.width	= 2624,
-			.height	= 1944,
+		.width	= 640,
+		.height	= 480,
+		.dvp_timings = {
+			.analog_crop = {
+				.left	= 0,
+				.top	= 4,
+				.width	= 2624,
+				.height	= 1944,
+			},
+			.crop = {
+				.left	= 16,
+				.top	= 6,
+				.width	= 640,
+				.height	= 480,
+			},
+			.htot		= 1896,
+			.vblank_def	= 504,
 		},
-		.crop = {
-			.left	= 16,
-			.top	= 6,
-			.width	= 640,
-			.height	= 480,
+		.csi2_timings = {
+			.analog_crop = {
+				.left	= OV5640_PIXEL_ARRAY_LEFT,
+				.top	= OV5640_PIXEL_ARRAY_TOP,
+				.width	= OV5640_PIXEL_ARRAY_WIDTH,
+				.height	= OV5640_PIXEL_ARRAY_HEIGHT,
+			},
+			.crop = {
+				.left	= 2,
+				.top	= 4,
+				.width	= 640,
+				.height	= 480,
+			},
+			.htot		= 1896,
+			.vblank_def	= 504,
 		},
-		.htot		= 1896,
-		.vblank_def	= 504,
 		.reg_data	= ov5640_init_setting_30fps_VGA,
 		.reg_data_size	= ARRAY_SIZE(ov5640_init_setting_30fps_VGA),
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
-		.analog_crop = {
-			.left	= 0,
-			.top	= 4,
-			.width	= 2624,
-			.height	= 1944,
+		.width		= 160,
+		.height		= 120,
+		.dvp_timings = {
+			.analog_crop = {
+				.left	= 0,
+				.top	= 4,
+				.width	= 2624,
+				.height	= 1944,
+			},
+			.crop = {
+				.left	= 16,
+				.top	= 6,
+				.width	= 160,
+				.height	= 120,
+			},
+			.htot		= 1896,
+			.vblank_def	= 864,
 		},
-		.crop = {
-			.left	= 16,
-			.top	= 6,
-			.width	= 160,
-			.height	= 120,
+		.csi2_timings = {
+			/* Feed the full valid pixel array to the ISP. */
+			.analog_crop = {
+				.left	= OV5640_PIXEL_ARRAY_LEFT,
+				.top	= OV5640_PIXEL_ARRAY_TOP,
+				.width	= OV5640_PIXEL_ARRAY_WIDTH,
+				.height	= OV5640_PIXEL_ARRAY_HEIGHT,
+			},
+			/* Maintain a minimum processing margin. */
+			.crop = {
+				.left	= 2,
+				.top	= 4,
+				.width	= 160,
+				.height	= 120,
+			},
+			.htot		= 1896,
+			.vblank_def	= 864,
 		},
-		.htot		= 1896,
-		.vblank_def	= 864,
 		.reg_data	= ov5640_setting_QQVGA_160_120,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QQVGA_160_120),
 		.max_fps	= OV5640_30_FPS
@@ -677,20 +736,42 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 		.id		= OV5640_MODE_QCIF_176_144,
 		.dn_mode	= SUBSAMPLING,
 		.pixel_rate	= OV5640_PIXEL_RATE_48M,
-		.analog_crop = {
-			.left	= 0,
-			.top	= 4,
-			.width	= 2624,
-			.height	= 1944,
+		.width		= 176,
+		.height		= 144,
+		.dvp_timings = {
+			.analog_crop = {
+				.left	= 0,
+				.top	= 4,
+				.width	= 2624,
+				.height	= 1944,
+			},
+			.crop = {
+				.left	= 16,
+				.top	= 6,
+				.width	= 176,
+				.height	= 144,
+			},
+			.htot		= 1896,
+			.vblank_def	= 840,
 		},
-		.crop = {
-			.left	= 16,
-			.top	= 6,
-			.width	= 176,
-			.height	= 144,
+		.csi2_timings = {
+			/* Feed the full valid pixel array to the ISP. */
+			.analog_crop = {
+				.left	= OV5640_PIXEL_ARRAY_LEFT,
+				.top	= OV5640_PIXEL_ARRAY_TOP,
+				.width	= OV5640_PIXEL_ARRAY_WIDTH,
+				.height	= OV5640_PIXEL_ARRAY_HEIGHT,
+			},
+			/* Maintain a minimum processing margin. */
+			.crop = {
+				.left	= 2,
+				.top	= 4,
+				.width	= 176,
+				.height	= 144,
+			},
+			.htot		= 1896,
+			.vblank_def	= 840,
 		},
-		.htot		= 1896,
-		.vblank_def	= 840,
 		.reg_data	= ov5640_setting_QCIF_176_144,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QCIF_176_144),
 		.max_fps	= OV5640_30_FPS
@@ -698,21 +779,43 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 		/* 320x240 */
 		.id		= OV5640_MODE_QVGA_320_240,
 		.dn_mode	= SUBSAMPLING,
+		.width		= 320,
+		.height		= 240,
 		.pixel_rate	= OV5640_PIXEL_RATE_48M,
-		.analog_crop = {
-			.left	= 0,
-			.top	= 4,
-			.width	= 2624,
-			.height	= 1944,
+		.dvp_timings = {
+			.analog_crop = {
+				.left	= 0,
+				.top	= 4,
+				.width	= 2624,
+				.height	= 1944,
+			},
+			.crop = {
+				.left	= 16,
+				.top	= 6,
+				.width	= 320,
+				.height	= 240,
+			},
+			.htot		= 1896,
+			.vblank_def	= 744,
 		},
-		.crop = {
-			.left	= 16,
-			.top	= 6,
-			.width	= 320,
-			.height	= 240,
+		.csi2_timings = {
+			/* Feed the full valid pixel array to the ISP. */
+			.analog_crop = {
+				.left	= OV5640_PIXEL_ARRAY_LEFT,
+				.top	= OV5640_PIXEL_ARRAY_TOP,
+				.width	= OV5640_PIXEL_ARRAY_WIDTH,
+				.height	= OV5640_PIXEL_ARRAY_HEIGHT,
+			},
+			/* Maintain a minimum processing margin. */
+			.crop = {
+				.left	= 2,
+				.top	= 4,
+				.width	= 320,
+				.height	= 240,
+			},
+			.htot		= 1896,
+			.vblank_def	= 744,
 		},
-		.htot		= 1896,
-		.vblank_def	= 744,
 		.reg_data	= ov5640_setting_QVGA_320_240,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QVGA_320_240),
 		.max_fps	= OV5640_30_FPS
@@ -721,20 +824,42 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 		.id		= OV5640_MODE_VGA_640_480,
 		.dn_mode	= SUBSAMPLING,
 		.pixel_rate	= OV5640_PIXEL_RATE_48M,
-		.analog_crop = {
-			.left	= 0,
-			.top	= 4,
-			.width	= 2624,
-			.height	= 1944,
+		.width		= 640,
+		.height		= 480,
+		.dvp_timings = {
+			.analog_crop = {
+				.left	= 0,
+				.top	= 4,
+				.width	= 2624,
+				.height	= 1944,
+			},
+			.crop = {
+				.left	= 16,
+				.top	= 6,
+				.width	= 640,
+				.height	= 480,
+			},
+			.htot		= 1896,
+			.vblank_def	= 600,
 		},
-		.crop = {
-			.left	= 16,
-			.top	= 6,
-			.width	= 640,
-			.height	= 480,
+		.csi2_timings = {
+			/* Feed the full valid pixel array to the ISP. */
+			.analog_crop = {
+				.left	= OV5640_PIXEL_ARRAY_LEFT,
+				.top	= OV5640_PIXEL_ARRAY_TOP,
+				.width	= OV5640_PIXEL_ARRAY_WIDTH,
+				.height	= OV5640_PIXEL_ARRAY_HEIGHT,
+			},
+			/* Maintain a minimum processing margin. */
+			.crop = {
+				.left	= 2,
+				.top	= 4,
+				.width	= 640,
+				.height	= 480,
+			},
+			.htot		= 1896,
+			.vblank_def	= 600,
 		},
-		.htot		= 1896,
-		.vblank_def	= 600,
 		.reg_data	= ov5640_setting_VGA_640_480,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_VGA_640_480),
 		.max_fps	= OV5640_60_FPS
@@ -742,21 +867,42 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 		/* 720x480 */
 		.id		= OV5640_MODE_NTSC_720_480,
 		.dn_mode	= SUBSAMPLING,
+		.width		= 720,
+		.height		= 480,
 		.pixel_rate	= OV5640_PIXEL_RATE_96M,
-		.analog_crop = {
-			.left	= 0,
-			.top	= 4,
-			.width	= 2624,
-			.height	= 1944,
+		.dvp_timings = {
+			.analog_crop = {
+				.left	= 0,
+				.top	= 4,
+				.width	= 2624,
+				.height	= 1944,
+			},
+			.crop = {
+				.left	= 56,
+				.top	= 60,
+				.width	= 720,
+				.height	= 480,
+			},
+			.htot		= 1896,
+			.vblank_def	= 504,
 		},
-		.crop = {
-			.left	= 56,
-			.top	= 60,
-			.width	= 720,
-			.height	= 480,
+		.csi2_timings = {
+			/* Feed the full valid pixel array to the ISP. */
+			.analog_crop = {
+				.left	= OV5640_PIXEL_ARRAY_LEFT,
+				.top	= OV5640_PIXEL_ARRAY_TOP,
+				.width	= OV5640_PIXEL_ARRAY_WIDTH,
+				.height	= OV5640_PIXEL_ARRAY_HEIGHT,
+			},
+			.crop = {
+				.left	= 56,
+				.top	= 60,
+				.width	= 720,
+				.height	= 480,
+			},
+			.htot		= 1896,
+			.vblank_def	= 504,
 		},
-		.htot		= 1896,
-		.vblank_def	= 504,
 		.reg_data	= ov5640_setting_NTSC_720_480,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_NTSC_720_480),
 		.max_fps	= OV5640_30_FPS
@@ -764,21 +910,42 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 		/* 720x576 */
 		.id		= OV5640_MODE_PAL_720_576,
 		.dn_mode	= SUBSAMPLING,
+		.width		= 720,
+		.height		= 576,
 		.pixel_rate	= OV5640_PIXEL_RATE_96M,
-		.analog_crop = {
-			.left	= 0,
-			.top	= 4,
-			.width	= 2624,
-			.height	= 1944,
+		.dvp_timings = {
+			.analog_crop = {
+				.left	= 0,
+				.top	= 4,
+				.width	= 2624,
+				.height	= 1944,
+			},
+			.crop = {
+				.left	= 56,
+				.top	= 6,
+				.width	= 720,
+				.height	= 576,
+			},
+			.htot		= 1896,
+			.vblank_def	= 408,
 		},
-		.crop = {
-			.left	= 56,
-			.top	= 6,
-			.width	= 720,
-			.height	= 576,
+		.csi2_timings = {
+			/* Feed the full valid pixel array to the ISP. */
+			.analog_crop = {
+				.left	= OV5640_PIXEL_ARRAY_LEFT,
+				.top	= OV5640_PIXEL_ARRAY_TOP,
+				.width	= OV5640_PIXEL_ARRAY_WIDTH,
+				.height	= OV5640_PIXEL_ARRAY_HEIGHT,
+			},
+			.crop = {
+				.left	= 56,
+				.top	= 6,
+				.width	= 720,
+				.height	= 576,
+			},
+			.htot		= 1896,
+			.vblank_def	= 408,
 		},
-		.htot		= 1896,
-		.vblank_def	= 408,
 		.reg_data	= ov5640_setting_PAL_720_576,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_PAL_720_576),
 		.max_fps	= OV5640_30_FPS
@@ -787,20 +954,40 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 		.id		= OV5640_MODE_XGA_1024_768,
 		.dn_mode	= SUBSAMPLING,
 		.pixel_rate	= OV5640_PIXEL_RATE_96M,
-		.analog_crop = {
-			.left	= 0,
-			.top	= 4,
-			.width	= 2624,
-			.height	= 1944,
+		.width		= 1024,
+		.height		= 768,
+		.dvp_timings = {
+			.analog_crop = {
+				.left	= 0,
+				.top	= 4,
+				.width	= 2624,
+				.height	= 1944,
+			},
+			.crop = {
+				.left	= 16,
+				.top	= 6,
+				.width	= 1024,
+				.height	= 768,
+			},
+			.htot		= 1896,
+			.vblank_def	= 312,
 		},
-		.crop = {
-			.left	= 16,
-			.top	= 6,
-			.width	= 1024,
-			.height	= 768,
+		.csi2_timings = {
+			.analog_crop = {
+				.left	= 0,
+				.top	= 4,
+				.width	= OV5640_NATIVE_WIDTH,
+				.height	= OV5640_PIXEL_ARRAY_HEIGHT,
+			},
+			.crop = {
+				.left	= 16,
+				.top	= 6,
+				.width	= 1024,
+				.height	= 768,
+			},
+			.htot		= 1896,
+			.vblank_def	= 312,
 		},
-		.htot		= 1896,
-		.vblank_def	= 312,
 		.reg_data	= ov5640_setting_XGA_1024_768,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_XGA_1024_768),
 		.max_fps	= OV5640_30_FPS
@@ -809,20 +996,40 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 		.id		= OV5640_MODE_720P_1280_720,
 		.dn_mode	= SUBSAMPLING,
 		.pixel_rate	= OV5640_PIXEL_RATE_124M,
-		.analog_crop = {
-			.left	= 0,
-			.top	= 250,
-			.width	= 2624,
-			.height	= 1456,
+		.width		= 1280,
+		.height		= 720,
+		.dvp_timings = {
+			.analog_crop = {
+				.left	= 0,
+				.top	= 250,
+				.width	= 2624,
+				.height	= 1456,
+			},
+			.crop = {
+				.left	= 16,
+				.top	= 4,
+				.width	= 1280,
+				.height	= 720,
+			},
+			.htot		= 1892,
+			.vblank_def	= 20,
 		},
-		.crop = {
-			.left	= 16,
-			.top	= 4,
-			.width	= 1280,
-			.height	= 720,
+		.csi2_timings = {
+			.analog_crop = {
+				.left	= 0,
+				.top	= 250,
+				.width	= 2624,
+				.height	= 1456,
+			},
+			.crop = {
+				.left	= 16,
+				.top	= 4,
+				.width	= 1280,
+				.height	= 720,
+			},
+			.htot		= 1892,
+			.vblank_def	= 20,
 		},
-		.htot		= 1892,
-		.vblank_def	= 20,
 		.reg_data	= ov5640_setting_720P_1280_720,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_720P_1280_720),
 		.max_fps	= OV5640_30_FPS
@@ -831,20 +1038,42 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 		.id		= OV5640_MODE_1080P_1920_1080,
 		.dn_mode	= SCALING,
 		.pixel_rate	= OV5640_PIXEL_RATE_148M,
-		.analog_crop = {
-			.left	= 336,
-			.top	= 434,
-			.width	= 1952,
-			.height	= 1088,
+		.width		= 1920,
+		.height		= 1080,
+		.dvp_timings = {
+			.analog_crop = {
+				.left	= 336,
+				.top	= 434,
+				.width	= 1952,
+				.height	= 1088,
+			},
+			.crop = {
+				.left	= 16,
+				.top	= 4,
+				.width	= 1920,
+				.height	= 1080,
+			},
+			.htot		= 2500,
+			.vblank_def	= 40,
 		},
-		.crop = {
-			.left	= 16,
-			.top	= 4,
-			.width	= 1920,
-			.height	= 1080,
+		.csi2_timings = {
+			/* Crop the full valid pixel array in the center. */
+			.analog_crop = {
+				.left	= 336,
+				.top	= 434,
+				.width	= 1952,
+				.height	= 1088,
+			},
+			/* Maintain a larger processing margins. */
+			.crop = {
+				.left	= 16,
+				.top	= 4,
+				.width	= 1920,
+				.height	= 1080,
+			},
+			.htot		= 2500,
+			.vblank_def	= 40,
 		},
-		.htot		= 2500,
-		.vblank_def	= 40,
 		.reg_data	= ov5640_setting_1080P_1920_1080,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_1080P_1920_1080),
 		.max_fps	= OV5640_30_FPS
@@ -853,20 +1082,41 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 		.id		= OV5640_MODE_QSXGA_2592_1944,
 		.dn_mode	= SCALING,
 		.pixel_rate	= OV5640_PIXEL_RATE_168M,
-		.analog_crop = {
-			.left	= 0,
-			.top	= 0,
-			.width	= 2624,
-			.height	= 1952,
+		.width		= OV5640_PIXEL_ARRAY_WIDTH,
+		.height		= OV5640_PIXEL_ARRAY_HEIGHT,
+		.dvp_timings = {
+			.analog_crop = {
+				.left	= 0,
+				.top	= 0,
+				.width	= 2624,
+				.height	= 1952,
+			},
+			.crop = {
+				.left	= 16,
+				.top	= 4,
+				.width	= 2592,
+				.height	= 1944,
+			},
+			.htot		= 2844,
+			.vblank_def	= 24,
 		},
-		.crop = {
-			.left	= 16,
-			.top	= 4,
-			.width	= 2592,
-			.height	= 1944,
+		.csi2_timings = {
+			/* Give more processing margin to full resolution. */
+			.analog_crop = {
+				.left	= 0,
+				.top	= 0,
+				.width	= OV5640_NATIVE_WIDTH,
+				.height	= 1952,
+			},
+			.crop = {
+				.left	= 16,
+				.top	= 4,
+				.width	= 2592,
+				.height	= 1944,
+			},
+			.htot		= 2844,
+			.vblank_def	= 24,
 		},
-		.htot		= 2844,
-		.vblank_def	= 24,
 		.reg_data	= ov5640_setting_QSXGA_2592_1944,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QSXGA_2592_1944),
 		.max_fps	= OV5640_15_FPS
@@ -1276,9 +1526,10 @@ static int ov5640_set_mipi_pclk(struct ov5640_dev *sensor)
 static u32 ov5640_calc_pixel_rate(struct ov5640_dev *sensor)
 {
 	const struct ov5640_mode_info *mode = sensor->current_mode;
+	const struct ov5640_timings *timings = &mode->dvp_timings;
 	u32 rate;
 
-	rate = mode->htot * (mode->crop.height + mode->vblank_def);
+	rate = timings->htot * (timings->crop.height + timings->vblank_def);
 	rate *= ov5640_framerates[sensor->current_fr];
 
 	return rate;
@@ -1362,21 +1613,20 @@ static int ov5640_set_jpeg_timings(struct ov5640_dev *sensor,
 	if (ret < 0)
 		return ret;
 
-	ret = ov5640_write_reg16(sensor, OV5640_REG_VFIFO_HSIZE,
-				 mode->crop.width);
+	ret = ov5640_write_reg16(sensor, OV5640_REG_VFIFO_HSIZE, mode->width);
 	if (ret < 0)
 		return ret;
 
-	return ov5640_write_reg16(sensor, OV5640_REG_VFIFO_VSIZE,
-				  mode->crop.height);
+	return ov5640_write_reg16(sensor, OV5640_REG_VFIFO_VSIZE, mode->height);
 }
 
 /* download ov5640 settings to sensor through i2c */
 static int ov5640_set_timings(struct ov5640_dev *sensor,
 			      const struct ov5640_mode_info *mode)
 {
-	const struct v4l2_rect *analog_crop = &mode->analog_crop;
-	const struct v4l2_rect *crop = &mode->crop;
+	const struct ov5640_timings *timings;
+	const struct v4l2_rect *analog_crop;
+	const struct v4l2_rect *crop;
 	int ret;
 
 	if (sensor->fmt.code == MEDIA_BUS_FMT_JPEG_1X8) {
@@ -1385,6 +1635,14 @@ static int ov5640_set_timings(struct ov5640_dev *sensor,
 			return ret;
 	}
 
+	if (ov5640_is_csi2(sensor))
+		timings = &mode->csi2_timings;
+	else
+		timings = &mode->dvp_timings;
+
+	analog_crop = &timings->analog_crop;
+	crop = &timings->crop;
+
 	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_HS,
 				 analog_crop->left);
 	if (ret < 0)
@@ -1413,20 +1671,20 @@ static int ov5640_set_timings(struct ov5640_dev *sensor,
 	if (ret < 0)
 		return ret;
 
-	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_DVPHO, crop->width);
+	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_DVPHO, mode->width);
 	if (ret < 0)
 		return ret;
 
-	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_DVPVO, crop->height);
+	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_DVPVO, mode->height);
 	if (ret < 0)
 		return ret;
 
-	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_HTS, mode->htot);
+	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_HTS, timings->htot);
 	if (ret < 0)
 		return ret;
 
 	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_VTS,
-				 crop->height + mode->vblank_def);
+				 mode->height + timings->vblank_def);
 	if (ret < 0)
 		return ret;
 
@@ -1858,11 +2116,11 @@ ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
 
 	mode = v4l2_find_nearest_size(ov5640_mode_data,
 				      ARRAY_SIZE(ov5640_mode_data),
-				      crop.width, crop.height, width, height);
+				      width, height, width, height);
 
 	if (!mode ||
 	    (!nearest &&
-	     (mode->crop.width != width || mode->crop.height != height)))
+	     (mode->width != width || mode->height != height)))
 		return NULL;
 
 	/* Check to see if the current mode exceeds the max frame rate */
@@ -2546,8 +2804,8 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
 	mode = ov5640_find_mode(sensor, fr, fmt->width, fmt->height, true);
 	if (!mode)
 		return -EINVAL;
-	fmt->width = mode->crop.width;
-	fmt->height = mode->crop.height;
+	fmt->width = mode->width;
+	fmt->height = mode->height;
 
 	if (new_mode)
 		*new_mode = mode;
@@ -3185,9 +3443,9 @@ static int ov5640_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index >= OV5640_NUM_MODES)
 		return -EINVAL;
 
-	fse->min_width = ov5640_mode_data[fse->index].crop.width;
+	fse->min_width = ov5640_mode_data[fse->index].width;
 	fse->max_width = fse->min_width;
-	fse->min_height = ov5640_mode_data[fse->index].crop.height;
+	fse->min_height = ov5640_mode_data[fse->index].height;
 	fse->max_height = fse->min_height;
 
 	return 0;
@@ -3251,16 +3509,16 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
 	mode = sensor->current_mode;
 
 	frame_rate = ov5640_try_frame_interval(sensor, &fi->interval,
-					       mode->crop.width,
-					       mode->crop.height);
+					       mode->width,
+					       mode->height);
 	if (frame_rate < 0) {
 		/* Always return a valid frame interval value */
 		fi->interval = sensor->frame_interval;
 		goto out;
 	}
 
-	mode = ov5640_find_mode(sensor, frame_rate, mode->crop.width,
-				mode->crop.height, true);
+	mode = ov5640_find_mode(sensor, frame_rate, mode->width,
+				mode->height, true);
 	if (!mode) {
 		ret = -EINVAL;
 		goto out;
-- 
2.30.2

