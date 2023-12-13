Return-Path: <linux-media+bounces-2122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C808B80D47D
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 18:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA6891C2156B
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 17:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E36C4F203;
	Mon, 11 Dec 2023 17:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lClXnxi7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B782ECD;
	Mon, 11 Dec 2023 09:50:48 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2cc2683fdaaso7667281fa.0;
        Mon, 11 Dec 2023 09:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702317046; x=1702921846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5aS1x6VnzG7ul/dczzaIUU7WHV34y2x/02/ro4MEmKE=;
        b=lClXnxi7WyJ8KSCXrx35k2Pfsd7/R4KsMbHxH9SHAAlgZzQm9LrtUY2jt9x/2OhhgV
         QCFYY4rlxsv+oeNICFgn32rbaRU8uj75QkpmjDBPA4QRHozKdTFhknn8miCZfs80yK56
         EpYe1Rq8tUhRzgmUb9sBXuAqBO3YqwUz4sLroO6pWulu6WkqLQN1hAIGEYN7ZubYZMH9
         sVC/5sKb4WkU6oW2XdynvNUaiMgMqXHQAM6iMTYapyQaLHDvgLCD9fQ5C785UshwwiRM
         feLc7BZLr4SQxAg+P3arX7J4ouaPPSRj9cQ5sRxqLEOp4FO8X7iInBb8ZNoi30ojlYbD
         71IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702317046; x=1702921846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5aS1x6VnzG7ul/dczzaIUU7WHV34y2x/02/ro4MEmKE=;
        b=KSgE6vnyN/8n8khXRz6hI0UNMqyaIfKQT9PApHieYSt3HInZDh9AEFf66m7UYgH/d9
         0i/OhEIHejcDxwKOz6+F56vtWrkODxAHta5NlASBlFRky2HGDP75/rYFTFhn0szljr5f
         PaJGNkFInQ4tIMvyvqycetxQrdgeX5wCJL8rQCCV8q94jlN++vDTIUG49W6ChOiR9QZh
         UpQIMJ33KYRH//GJp6PF7B7xvsY1gA6H3r/KG4iCS71+Rb5vZfRueETFY+2baCDkOXn0
         WOWFlUHaXojui11a6bcjQnLbhtmN7Tq7cPqO0JvC44i6fvJAxwZYS42CyrjS00uWOIzZ
         2pYw==
X-Gm-Message-State: AOJu0YxdXUrotTEcZJaEaNsjm/vISLl0J6/CT2Uum5nX+cHmQ6aib7ja
	yQOLA1I+TvrnMKB9Djw6m5ftHHzJIWeihEj/
X-Google-Smtp-Source: AGHT+IEjO0sTAC+MbEfcNvxnFmdfiPg3aJbAVEPyThUnbloIPJAID5V4UEKV8fgxwP/FXKEvUBFsTA==
X-Received: by 2002:a05:651c:987:b0:2cb:29f4:c96e with SMTP id b7-20020a05651c098700b002cb29f4c96emr3690639ljq.21.1702317045787;
        Mon, 11 Dec 2023 09:50:45 -0800 (PST)
Received: from localhost ([83.149.246.185])
        by smtp.gmail.com with ESMTPSA id b7-20020a2e9887000000b002ca0050bf36sm1285472ljj.73.2023.12.11.09.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 09:50:45 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: [PATCH 03/19] media: i2c: ov4689: CCI conversion
Date: Mon, 11 Dec 2023 20:50:06 +0300
Message-ID: <20231211175023.1680247-4-mike.rudenko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211175023.1680247-1-mike.rudenko@gmail.com>
References: <20231211175023.1680247-1-mike.rudenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the i2c register accesses to utilize the CCI helper library
rather than relying on driver-specific functions. There are no
intended functional changes.

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/ov4689.c | 361 ++++++++++++++-----------------------
 2 files changed, 140 insertions(+), 222 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 59ee0ca2c978..adf71d2b3b03 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -374,6 +374,7 @@ config VIDEO_OV2740
 config VIDEO_OV4689
 	tristate "OmniVision OV4689 sensor support"
 	depends on GPIOLIB
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor-level driver for the OmniVision
 	  OV4689 camera.
diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
index 53dcfc8685d4..51a15810cb1d 100644
--- a/drivers/media/i2c/ov4689.c
+++ b/drivers/media/i2c/ov4689.c
@@ -15,45 +15,39 @@
 #include <linux/regulator/consumer.h>
 #include <media/media-entity.h>
 #include <media/v4l2-async.h>
+#include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-subdev.h>
 #include <media/v4l2-fwnode.h>
 
+#define OV4689_REG_CHIP_ID		CCI_REG16(0x300a)
 #define CHIP_ID				0x004688
-#define OV4689_REG_CHIP_ID		0x300a
 
-#define OV4689_XVCLK_FREQ		24000000
-
-#define OV4689_REG_CTRL_MODE		0x0100
+#define OV4689_REG_CTRL_MODE		CCI_REG8(0x0100)
 #define OV4689_MODE_SW_STANDBY		0x0
 #define OV4689_MODE_STREAMING		BIT(0)
 
-#define OV4689_REG_EXPOSURE		0x3500
+#define OV4689_REG_EXPOSURE		CCI_REG24(0x3500)
 #define OV4689_EXPOSURE_MIN		4
 #define OV4689_EXPOSURE_STEP		1
 #define OV4689_VTS_MAX			0x7fff
 
-#define OV4689_REG_GAIN_H		0x3508
-#define OV4689_REG_GAIN_L		0x3509
+#define OV4689_REG_GAIN_H		CCI_REG8(0x3508)
+#define OV4689_REG_GAIN_L		CCI_REG8(0x3509)
 #define OV4689_GAIN_H_MASK		0x07
 #define OV4689_GAIN_H_SHIFT		8
 #define OV4689_GAIN_L_MASK		0xff
 #define OV4689_GAIN_STEP		1
 #define OV4689_GAIN_DEFAULT		0x80
 
-#define OV4689_REG_TEST_PATTERN		0x5040
+#define OV4689_REG_TEST_PATTERN		CCI_REG8(0x5040)
 #define OV4689_TEST_PATTERN_ENABLE	0x80
 #define OV4689_TEST_PATTERN_DISABLE	0x0
 
-#define OV4689_REG_VTS			0x380e
-
-#define REG_NULL			0xFFFF
-
-#define OV4689_REG_VALUE_08BIT		1
-#define OV4689_REG_VALUE_16BIT		2
-#define OV4689_REG_VALUE_24BIT		3
+#define OV4689_REG_VTS			CCI_REG16(0x380e)
 
 #define OV4689_LANES			4
+#define OV4689_XVCLK_FREQ		24000000
 
 static const char *const ov4689_supply_names[] = {
 	"avdd", /* Analog power */
@@ -61,11 +55,6 @@ static const char *const ov4689_supply_names[] = {
 	"dvdd", /* Digital core power */
 };
 
-struct regval {
-	u16 addr;
-	u8 val;
-};
-
 enum ov4689_mode_id {
 	OV4689_MODE_2688_1520 = 0,
 	OV4689_NUM_MODES,
@@ -84,11 +73,13 @@ struct ov4689_mode {
 	u32 sensor_height;
 	u32 crop_top;
 	u32 crop_left;
-	const struct regval *reg_list;
+	const struct cci_reg_sequence *reg_list;
+	unsigned int num_regs;
 };
 
 struct ov4689 {
 	struct i2c_client *client;
+	struct regmap *regmap;
 	struct clk *xvclk;
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *pwdn_gpio;
@@ -122,125 +113,124 @@ struct ov4689_gain_range {
  * max_framerate 30fps
  * mipi_datarate per lane 1008Mbps
  */
-static const struct regval ov4689_2688x1520_regs[] = {
+static const struct cci_reg_sequence ov4689_2688x1520_regs[] = {
 	/* System control*/
-	{0x0103, 0x01}, /* SC_CTRL0103 software_reset = 1 */
-	{0x3000, 0x20}, /* SC_CMMN_PAD_OEN0 FSIN_output_enable = 1 */
-	{0x3021, 0x03}, /*
-			 * SC_CMMN_MISC_CTRL fst_stby_ctr = 0,
-			 * sleep_no_latch_enable = 0
-			 */
+	{CCI_REG8(0x0103), 0x01}, /* SC_CTRL0103 software_reset = 1 */
+	{CCI_REG8(0x3000), 0x20}, /* SC_CMMN_PAD_OEN0 FSIN_output_enable = 1 */
+	{CCI_REG8(0x3021), 0x03}, /*
+				   * SC_CMMN_MISC_CTRL fst_stby_ctr = 0,
+				   * sleep_no_latch_enable = 0
+				   */
 
 	/* AEC PK */
-	{0x3503, 0x04}, /* AEC_MANUAL gain_input_as_sensor_gain_format = 1 */
-	{0x352a, 0x08}, /* DIG_GAIN_FRAC_LONG dig_gain_long[14:8] = 0x08 (2x) */
+	{CCI_REG8(0x3503), 0x04}, /* AEC_MANUAL gain_input_as_sensor_gain_format = 1 */
+	{CCI_REG8(0x352a), 0x08}, /* DIG_GAIN_FRAC_LONG dig_gain_long[14:8] = 0x08 (2x) */
 
 	/* ADC and analog control*/
-	{0x3603, 0x40},
-	{0x3604, 0x02},
-	{0x3609, 0x12},
-	{0x360c, 0x08},
-	{0x360f, 0xe5},
-	{0x3608, 0x8f},
-	{0x3611, 0x00},
-	{0x3613, 0xf7},
-	{0x3616, 0x58},
-	{0x3619, 0x99},
-	{0x361b, 0x60},
-	{0x361e, 0x79},
-	{0x3634, 0x10},
-	{0x3635, 0x10},
-	{0x3636, 0x15},
-	{0x3646, 0x86},
-	{0x364a, 0x0b},
+	{CCI_REG8(0x3603), 0x40},
+	{CCI_REG8(0x3604), 0x02},
+	{CCI_REG8(0x3609), 0x12},
+	{CCI_REG8(0x360c), 0x08},
+	{CCI_REG8(0x360f), 0xe5},
+	{CCI_REG8(0x3608), 0x8f},
+	{CCI_REG8(0x3611), 0x00},
+	{CCI_REG8(0x3613), 0xf7},
+	{CCI_REG8(0x3616), 0x58},
+	{CCI_REG8(0x3619), 0x99},
+	{CCI_REG8(0x361b), 0x60},
+	{CCI_REG8(0x361e), 0x79},
+	{CCI_REG8(0x3634), 0x10},
+	{CCI_REG8(0x3635), 0x10},
+	{CCI_REG8(0x3636), 0x15},
+	{CCI_REG8(0x3646), 0x86},
+	{CCI_REG8(0x364a), 0x0b},
 
 	/* Sensor control */
-	{0x3700, 0x17},
-	{0x3701, 0x22},
-	{0x3703, 0x10},
-	{0x370a, 0x37},
-	{0x3706, 0x63},
-	{0x3709, 0x3c},
-	{0x370c, 0x30},
-	{0x3710, 0x24},
-	{0x3720, 0x28},
-	{0x3729, 0x7b},
-	{0x372b, 0xbd},
-	{0x372c, 0xbc},
-	{0x372e, 0x52},
-	{0x373c, 0x0e},
-	{0x373e, 0x33},
-	{0x3743, 0x10},
-	{0x3744, 0x88},
-	{0x3745, 0xc0},
-	{0x374c, 0x00},
-	{0x374e, 0x23},
-	{0x3751, 0x7b},
-	{0x3753, 0xbd},
-	{0x3754, 0xbc},
-	{0x3756, 0x52},
-	{0x376b, 0x20},
-	{0x3774, 0x51},
-	{0x3776, 0xbd},
-	{0x3777, 0xbd},
-	{0x3781, 0x18},
-	{0x3783, 0x25},
-	{0x3798, 0x1b},
+	{CCI_REG8(0x3700), 0x17},
+	{CCI_REG8(0x3701), 0x22},
+	{CCI_REG8(0x3703), 0x10},
+	{CCI_REG8(0x370a), 0x37},
+	{CCI_REG8(0x3706), 0x63},
+	{CCI_REG8(0x3709), 0x3c},
+	{CCI_REG8(0x370c), 0x30},
+	{CCI_REG8(0x3710), 0x24},
+	{CCI_REG8(0x3720), 0x28},
+	{CCI_REG8(0x3729), 0x7b},
+	{CCI_REG8(0x372b), 0xbd},
+	{CCI_REG8(0x372c), 0xbc},
+	{CCI_REG8(0x372e), 0x52},
+	{CCI_REG8(0x373c), 0x0e},
+	{CCI_REG8(0x373e), 0x33},
+	{CCI_REG8(0x3743), 0x10},
+	{CCI_REG8(0x3744), 0x88},
+	{CCI_REG8(0x3745), 0xc0},
+	{CCI_REG8(0x374c), 0x00},
+	{CCI_REG8(0x374e), 0x23},
+	{CCI_REG8(0x3751), 0x7b},
+	{CCI_REG8(0x3753), 0xbd},
+	{CCI_REG8(0x3754), 0xbc},
+	{CCI_REG8(0x3756), 0x52},
+	{CCI_REG8(0x376b), 0x20},
+	{CCI_REG8(0x3774), 0x51},
+	{CCI_REG8(0x3776), 0xbd},
+	{CCI_REG8(0x3777), 0xbd},
+	{CCI_REG8(0x3781), 0x18},
+	{CCI_REG8(0x3783), 0x25},
+	{CCI_REG8(0x3798), 0x1b},
 
 	/* Timing control */
-	{0x3801, 0x08}, /* H_CROP_START_L h_crop_start[7:0] = 0x08 */
-	{0x3805, 0x97}, /* H_CROP_END_L h_crop_end[7:0] = 0x97 */
-	{0x380c, 0x0a}, /* TIMING_HTS_H hts[14:8] = 0x0a */
-	{0x380d, 0x0e}, /* TIMING_HTS_L hts[7:0] = 0x0e */
-	{0x3811, 0x08}, /* H_WIN_OFF_L h_win_off[7:0] = 0x08*/
-	{0x3813, 0x04}, /* V_WIN_OFF_L v_win_off[7:0] = 0x04 */
-	{0x3819, 0x01}, /* VSYNC_END_L vsync_end_point[7:0] = 0x01 */
-	{0x3821, 0x06}, /* TIMING_FORMAT2 array_h_mirror = 1, digital_h_mirror = 1 */
+	{CCI_REG8(0x3801), 0x08}, /* H_CROP_START_L h_crop_start[7:0] = 0x08 */
+	{CCI_REG8(0x3805), 0x97}, /* H_CROP_END_L h_crop_end[7:0] = 0x97 */
+	{CCI_REG8(0x380c), 0x0a}, /* TIMING_HTS_H hts[14:8] = 0x0a */
+	{CCI_REG8(0x380d), 0x0e}, /* TIMING_HTS_L hts[7:0] = 0x0e */
+	{CCI_REG8(0x3811), 0x08}, /* H_WIN_OFF_L h_win_off[7:0] = 0x08*/
+	{CCI_REG8(0x3813), 0x04}, /* V_WIN_OFF_L v_win_off[7:0] = 0x04 */
+	{CCI_REG8(0x3819), 0x01}, /* VSYNC_END_L vsync_end_point[7:0] = 0x01 */
+	{CCI_REG8(0x3821), 0x06}, /* TIMING_FORMAT2 array_h_mirror = 1, digital_h_mirror = 1 */
 
 	/* OTP control */
-	{0x3d85, 0x36}, /* OTP_REG85 OTP_power_up_load_setting_enable = 1,
-			 * OTP_power_up_load_data_enable = 1,
-			 * OTP_bist_select = 1 (compare with zero)
-			 */
-	{0x3d8c, 0x71}, /* OTP_SETTING_STT_ADDRESS_H */
-	{0x3d8d, 0xcb}, /* OTP_SETTING_STT_ADDRESS_L */
+	{CCI_REG8(0x3d85), 0x36}, /* OTP_REG85 OTP_power_up_load_setting_enable = 1,
+				   * OTP_power_up_load_data_enable = 1,
+				   * OTP_bist_select = 1 (compare with zero)
+				   */
+	{CCI_REG8(0x3d8c), 0x71}, /* OTP_SETTING_STT_ADDRESS_H */
+	{CCI_REG8(0x3d8d), 0xcb}, /* OTP_SETTING_STT_ADDRESS_L */
 
 	/* BLC registers*/
-	{0x4001, 0x40}, /* DEBUG_MODE */
-	{0x401b, 0x00}, /* DEBUG_MODE */
-	{0x401d, 0x00}, /* DEBUG_MODE */
-	{0x401f, 0x00}, /* DEBUG_MODE */
-	{0x4020, 0x00}, /* ANCHOR_LEFT_START_H anchor_left_start[11:8] = 0 */
-	{0x4021, 0x10}, /* ANCHOR_LEFT_START_L anchor_left_start[7:0] = 0x10 */
-	{0x4022, 0x07}, /* ANCHOR_LEFT_END_H anchor_left_end[11:8] = 0x07 */
-	{0x4023, 0xcf}, /* ANCHOR_LEFT_END_L anchor_left_end[7:0] = 0xcf */
-	{0x4024, 0x09}, /* ANCHOR_RIGHT_START_H anchor_right_start[11:8] = 0x09 */
-	{0x4025, 0x60}, /* ANCHOR_RIGHT_START_L anchor_right_start[7:0] = 0x60 */
-	{0x4026, 0x09}, /* ANCHOR_RIGHT_END_H anchor_right_end[11:8] = 0x09 */
-	{0x4027, 0x6f}, /* ANCHOR_RIGHT_END_L anchor_right_end[7:0] = 0x6f */
+	{CCI_REG8(0x4001), 0x40}, /* DEBUG_MODE */
+	{CCI_REG8(0x401b), 0x00}, /* DEBUG_MODE */
+	{CCI_REG8(0x401d), 0x00}, /* DEBUG_MODE */
+	{CCI_REG8(0x401f), 0x00}, /* DEBUG_MODE */
+	{CCI_REG8(0x4020), 0x00}, /* ANCHOR_LEFT_START_H anchor_left_start[11:8] = 0 */
+	{CCI_REG8(0x4021), 0x10}, /* ANCHOR_LEFT_START_L anchor_left_start[7:0] = 0x10 */
+	{CCI_REG8(0x4022), 0x07}, /* ANCHOR_LEFT_END_H anchor_left_end[11:8] = 0x07 */
+	{CCI_REG8(0x4023), 0xcf}, /* ANCHOR_LEFT_END_L anchor_left_end[7:0] = 0xcf */
+	{CCI_REG8(0x4024), 0x09}, /* ANCHOR_RIGHT_START_H anchor_right_start[11:8] = 0x09 */
+	{CCI_REG8(0x4025), 0x60}, /* ANCHOR_RIGHT_START_L anchor_right_start[7:0] = 0x60 */
+	{CCI_REG8(0x4026), 0x09}, /* ANCHOR_RIGHT_END_H anchor_right_end[11:8] = 0x09 */
+	{CCI_REG8(0x4027), 0x6f}, /* ANCHOR_RIGHT_END_L anchor_right_end[7:0] = 0x6f */
 
 	/* ADC sync control */
-	{0x4500, 0x6c}, /* ADC_SYNC_CTRL */
-	{0x4503, 0x01}, /* ADC_SYNC_CTRL */
+	{CCI_REG8(0x4500), 0x6c}, /* ADC_SYNC_CTRL */
+	{CCI_REG8(0x4503), 0x01}, /* ADC_SYNC_CTRL */
 
 	/* VFIFO */
-	{0x4601, 0xa7}, /* VFIFO_CTRL_01 r_vfifo_read_start[7:0] = 0xa7 */
+	{CCI_REG8(0x4601), 0xa7}, /* VFIFO_CTRL_01 r_vfifo_read_start[7:0] = 0xa7 */
 
 	/* Temperature monitor */
-	{0x4d00, 0x04}, /* TPM_CTRL_00 tmp_slope[15:8] = 0x04 */
-	{0x4d01, 0x42}, /* TPM_CTRL_01 tmp_slope[7:0] = 0x42 */
-	{0x4d02, 0xd1}, /* TPM_CTRL_02 tpm_offset[31:24] = 0xd1 */
-	{0x4d03, 0x93}, /* TPM_CTRL_03 tpm_offset[23:16] = 0x93 */
-	{0x4d04, 0xf5}, /* TPM_CTRL_04 tpm_offset[15:8]  = 0xf5 */
-	{0x4d05, 0xc1}, /* TPM_CTRL_05 tpm_offset[7:0]   = 0xc1 */
+	{CCI_REG8(0x4d00), 0x04}, /* TPM_CTRL_00 tmp_slope[15:8] = 0x04 */
+	{CCI_REG8(0x4d01), 0x42}, /* TPM_CTRL_01 tmp_slope[7:0] = 0x42 */
+	{CCI_REG8(0x4d02), 0xd1}, /* TPM_CTRL_02 tpm_offset[31:24] = 0xd1 */
+	{CCI_REG8(0x4d03), 0x93}, /* TPM_CTRL_03 tpm_offset[23:16] = 0x93 */
+	{CCI_REG8(0x4d04), 0xf5}, /* TPM_CTRL_04 tpm_offset[15:8]  = 0xf5 */
+	{CCI_REG8(0x4d05), 0xc1}, /* TPM_CTRL_05 tpm_offset[7:0]   = 0xc1 */
 
 	/* pre-ISP control */
-	{0x5050, 0x0c}, /* DEBUG_MODE */
+	{CCI_REG8(0x5050), 0x0c}, /* DEBUG_MODE */
 
 	/* OTP-DPC control */
-	{0x5501, 0x10}, /* OTP_DPC_START_L otp_start_address[7:0] = 0x10 */
-	{0x5503, 0x0f}, /* OTP_DPC_END_L otp_end_address[7:0] = 0x0f */
-	{REG_NULL, 0x00},
+	{CCI_REG8(0x5501), 0x10}, /* OTP_DPC_START_L otp_start_address[7:0] = 0x10 */
+	{CCI_REG8(0x5503), 0x0f}, /* OTP_DPC_END_L otp_end_address[7:0] = 0x0f */
 };
 
 static const struct ov4689_mode supported_modes[] = {
@@ -258,6 +248,7 @@ static const struct ov4689_mode supported_modes[] = {
 		.vts_def = 1554,
 		.pixel_rate = 480000000,
 		.reg_list = ov4689_2688x1520_regs,
+		.num_regs = ARRAY_SIZE(ov4689_2688x1520_regs),
 	},
 };
 
@@ -310,83 +301,6 @@ static const struct ov4689_gain_range ov4689_gain_ranges[] = {
 	},
 };
 
-/* Write registers up to 4 at a time */
-static int ov4689_write_reg(struct i2c_client *client, u16 reg, u32 len,
-			    u32 val)
-{
-	u32 buf_i, val_i;
-	__be32 val_be;
-	u8 *val_p;
-	u8 buf[6];
-
-	if (len > 4)
-		return -EINVAL;
-
-	buf[0] = reg >> 8;
-	buf[1] = reg & 0xff;
-
-	val_be = cpu_to_be32(val);
-	val_p = (u8 *)&val_be;
-	buf_i = 2;
-	val_i = 4 - len;
-
-	while (val_i < 4)
-		buf[buf_i++] = val_p[val_i++];
-
-	if (i2c_master_send(client, buf, len + 2) != len + 2)
-		return -EIO;
-
-	return 0;
-}
-
-static int ov4689_write_array(struct i2c_client *client,
-			      const struct regval *regs)
-{
-	int ret = 0;
-	u32 i;
-
-	for (i = 0; ret == 0 && regs[i].addr != REG_NULL; i++)
-		ret = ov4689_write_reg(client, regs[i].addr,
-				       OV4689_REG_VALUE_08BIT, regs[i].val);
-
-	return ret;
-}
-
-/* Read registers up to 4 at a time */
-static int ov4689_read_reg(struct i2c_client *client, u16 reg, unsigned int len,
-			   u32 *val)
-{
-	__be16 reg_addr_be = cpu_to_be16(reg);
-	struct i2c_msg msgs[2];
-	__be32 data_be = 0;
-	u8 *data_be_p;
-	int ret;
-
-	if (len > 4 || !len)
-		return -EINVAL;
-
-	data_be_p = (u8 *)&data_be;
-	/* Write register address */
-	msgs[0].addr = client->addr;
-	msgs[0].flags = 0;
-	msgs[0].len = 2;
-	msgs[0].buf = (u8 *)&reg_addr_be;
-
-	/* Read data from register */
-	msgs[1].addr = client->addr;
-	msgs[1].flags = I2C_M_RD;
-	msgs[1].len = len;
-	msgs[1].buf = &data_be_p[4 - len];
-
-	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
-	if (ret != ARRAY_SIZE(msgs))
-		return -EIO;
-
-	*val = be32_to_cpu(data_be);
-
-	return 0;
-}
-
 static void ov4689_fill_fmt(const struct ov4689_mode *mode,
 			    struct v4l2_mbus_framefmt *fmt)
 {
@@ -460,8 +374,8 @@ static int ov4689_enable_test_pattern(struct ov4689 *ov4689, u32 pattern)
 	else
 		val = OV4689_TEST_PATTERN_DISABLE;
 
-	return ov4689_write_reg(ov4689->client, OV4689_REG_TEST_PATTERN,
-				OV4689_REG_VALUE_08BIT, val);
+	return cci_write(ov4689->regmap, OV4689_REG_TEST_PATTERN,
+			 val, NULL);
 }
 
 static int ov4689_get_selection(struct v4l2_subdev *sd,
@@ -505,8 +419,10 @@ static int ov4689_s_stream(struct v4l2_subdev *sd, int on)
 		if (ret < 0)
 			goto unlock_and_return;
 
-		ret = ov4689_write_array(ov4689->client,
-					 ov4689->cur_mode->reg_list);
+		ret = cci_multi_reg_write(ov4689->regmap,
+					  ov4689->cur_mode->reg_list,
+					  ov4689->cur_mode->num_regs,
+					  NULL);
 		if (ret) {
 			pm_runtime_put(&client->dev);
 			goto unlock_and_return;
@@ -518,17 +434,15 @@ static int ov4689_s_stream(struct v4l2_subdev *sd, int on)
 			goto unlock_and_return;
 		}
 
-		ret = ov4689_write_reg(ov4689->client, OV4689_REG_CTRL_MODE,
-				       OV4689_REG_VALUE_08BIT,
-				       OV4689_MODE_STREAMING);
+		ret = cci_write(ov4689->regmap, OV4689_REG_CTRL_MODE,
+				OV4689_MODE_STREAMING, NULL);
 		if (ret) {
 			pm_runtime_put(&client->dev);
 			goto unlock_and_return;
 		}
 	} else {
-		ov4689_write_reg(ov4689->client, OV4689_REG_CTRL_MODE,
-				 OV4689_REG_VALUE_08BIT,
-				 OV4689_MODE_SW_STANDBY);
+		cci_write(ov4689->regmap, OV4689_REG_CTRL_MODE,
+			  OV4689_MODE_SW_STANDBY, NULL);
 		pm_runtime_put(&client->dev);
 	}
 
@@ -693,26 +607,23 @@ static int ov4689_set_ctrl(struct v4l2_ctrl *ctrl)
 	switch (ctrl->id) {
 	case V4L2_CID_EXPOSURE:
 		/* 4 least significant bits of exposure are fractional part */
-		ret = ov4689_write_reg(ov4689->client, OV4689_REG_EXPOSURE,
-				       OV4689_REG_VALUE_24BIT, ctrl->val << 4);
+		ret = cci_write(ov4689->regmap, OV4689_REG_EXPOSURE,
+				ctrl->val << 4, NULL);
 		break;
 	case V4L2_CID_ANALOGUE_GAIN:
 		ret = ov4689_map_gain(ov4689, ctrl->val, &sensor_gain);
 
-		ret = ret ?:
-			ov4689_write_reg(ov4689->client, OV4689_REG_GAIN_H,
-					 OV4689_REG_VALUE_08BIT,
-					 (sensor_gain >> OV4689_GAIN_H_SHIFT) &
-					 OV4689_GAIN_H_MASK);
-		ret = ret ?:
-			ov4689_write_reg(ov4689->client, OV4689_REG_GAIN_L,
-					 OV4689_REG_VALUE_08BIT,
-					 sensor_gain & OV4689_GAIN_L_MASK);
+		cci_write(ov4689->regmap, OV4689_REG_GAIN_H,
+			  (sensor_gain >> OV4689_GAIN_H_SHIFT) &
+			  OV4689_GAIN_H_MASK, &ret);
+
+		cci_write(ov4689->regmap, OV4689_REG_GAIN_L,
+			  sensor_gain & OV4689_GAIN_L_MASK,
+			  &ret);
 		break;
 	case V4L2_CID_VBLANK:
-		ret = ov4689_write_reg(ov4689->client, OV4689_REG_VTS,
-				       OV4689_REG_VALUE_16BIT,
-				       ctrl->val + ov4689->cur_mode->height);
+		ret = cci_write(ov4689->regmap, OV4689_REG_VTS,
+				ctrl->val + ov4689->cur_mode->height, NULL);
 		break;
 	case V4L2_CID_TEST_PATTERN:
 		ret = ov4689_enable_test_pattern(ov4689, ctrl->val);
@@ -817,18 +728,17 @@ static int ov4689_check_sensor_id(struct ov4689 *ov4689,
 				  struct i2c_client *client)
 {
 	struct device *dev = &ov4689->client->dev;
-	u32 id = 0;
+	u64 id = 0;
 	int ret;
 
-	ret = ov4689_read_reg(client, OV4689_REG_CHIP_ID,
-			      OV4689_REG_VALUE_16BIT, &id);
+	ret = cci_read(ov4689->regmap, OV4689_REG_CHIP_ID, &id, NULL);
 	if (ret) {
 		dev_err(dev, "Cannot read sensor ID\n");
 		return ret;
 	}
 
 	if (id != CHIP_ID) {
-		dev_err(dev, "Unexpected sensor ID %06x, expected %06x\n",
+		dev_err(dev, "Unexpected sensor ID %06llx, expected %06x\n",
 			id, CHIP_ID);
 		return -ENODEV;
 	}
@@ -938,6 +848,13 @@ static int ov4689_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
+	ov4689->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(ov4689->regmap)) {
+		ret = PTR_ERR(ov4689->regmap);
+		dev_err(dev, "failed to initialize CCI: %d\n", ret);
+		return ret;
+	}
+
 	ov4689->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(ov4689->reset_gpio)) {
-- 
2.43.0


