Return-Path: <linux-media+bounces-2601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1C88178ED
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 18:41:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07779B21016
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 17:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95DA772061;
	Mon, 18 Dec 2023 17:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0LS66qB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5789371468;
	Mon, 18 Dec 2023 17:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50e389473fcso1732643e87.2;
        Mon, 18 Dec 2023 09:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702921257; x=1703526057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvzWqKWWxtF7t1ieAaxj0+EbNjoeBeyf3ul7f1hfdkU=;
        b=j0LS66qBoldQQ8DRkaluVySVsyyE8lqf8AxBwyCfzg1fEa0rkZNPPs6FBrCsndp1DN
         h2AvryR7+8tj6kna1M6TwJr71g0h/4woIMR/GGZ23Zwn41czRJSxOpN0CdFSR+VVsXAK
         +TyCcuYNETrefASly96hrpvJQQm26kRdr+GyQysbskllWUzQvPm6pwf0r+jM0joHiKho
         AwNIO7I8cKSw8GSQCIoKkgkjAhpThV3bhsi9YQaLTT35blC9sU5GOhRIXqtCc+8QSANa
         qo955JMLaKaOEVPeFQGK+L7j3hckNw6Dm2Rkdb1/9JwxjxrjWG+DVwgZAaOYEPeFNHGv
         AbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702921257; x=1703526057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvzWqKWWxtF7t1ieAaxj0+EbNjoeBeyf3ul7f1hfdkU=;
        b=UvA/FLMmQefvKvolub9P35LwhKNALOQi9LLOMQBT/MOlz6STlK7V11D7yQj3ieHvWg
         VdBMOWRIwJJZPIlUCZf1IN9GrfXJ5D2EZg8Fewi0nEUPQTB3fpXrk46+aShmF+C933Rl
         l/7EaN60Dkhnd9H1Y9Px81N5R7CW14b02X6RiDou7t3aC7Tgh94x9MNTq3SbmYYJad7N
         vH3aJRdg8FcUnc1/zW8RGSplNzD//A86nIGlbOR7EJ9PuCO73FHCtQxNyKlWr1G6+oSo
         jV5m4u+5MlQ8EjDoA/UcN63kfoyb9mrke5kIJzW8aG4Jrv4cxDTBsm1HdYgHDh9yVLA4
         raBQ==
X-Gm-Message-State: AOJu0Yxt8cVXK7sDqRN/cNzp9DpqGHZf6QKPgdExjGlvXoDDIgxUQ8Cl
	VXjLHfAEGxqCa4cZLnRXU1chnzma3XpEzQ==
X-Google-Smtp-Source: AGHT+IFRZlYiV1RrtKLd/tt7YdaB8WYCS3mHUoi9HVIFDw+Sw/cPdJXGmipZyR1nbzVsPGbdrv/86w==
X-Received: by 2002:a05:6512:6e:b0:50e:20fe:2c66 with SMTP id i14-20020a056512006e00b0050e20fe2c66mr1950035lfo.46.1702921257312;
        Mon, 18 Dec 2023 09:40:57 -0800 (PST)
Received: from localhost ([83.149.246.185])
        by smtp.gmail.com with ESMTPSA id eq24-20020a056512489800b0050e233d2533sm803945lfb.159.2023.12.18.09.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 09:40:57 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: [PATCH v2 01/20] media: i2c: ov4689: Clean up and annotate the register table
Date: Mon, 18 Dec 2023 20:40:22 +0300
Message-ID: <20231218174042.794012-2-mike.rudenko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218174042.794012-1-mike.rudenko@gmail.com>
References: <20231218174042.794012-1-mike.rudenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many values in the register table are actually power-on
defaults. Remove those and also unused HDR exposures and gains.
Annotate the remaining values using the publicly available datasheet
to facilitate further development. No functional change intended.

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 drivers/media/i2c/ov4689.c | 203 +++++++++++++++++++++----------------
 1 file changed, 118 insertions(+), 85 deletions(-)

diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
index 403091651885..ff5213862974 100644
--- a/drivers/media/i2c/ov4689.c
+++ b/drivers/media/i2c/ov4689.c
@@ -3,7 +3,7 @@
  * ov4689 driver
  *
  * Copyright (C) 2017 Fuzhou Rockchip Electronics Co., Ltd.
- * Copyright (C) 2022 Mikhail Rudenko
+ * Copyright (C) 2022, 2023 Mikhail Rudenko
  */
 
 #include <linux/clk.h>
@@ -123,90 +123,123 @@ struct ov4689_gain_range {
  * mipi_datarate per lane 1008Mbps
  */
 static const struct regval ov4689_2688x1520_regs[] = {
-	{0x0103, 0x01}, {0x3638, 0x00}, {0x0300, 0x00},
-	{0x0302, 0x2a}, {0x0303, 0x00}, {0x0304, 0x03},
-	{0x030b, 0x00}, {0x030d, 0x1e}, {0x030e, 0x04},
-	{0x030f, 0x01}, {0x0312, 0x01}, {0x031e, 0x00},
-	{0x3000, 0x20}, {0x3002, 0x00}, {0x3018, 0x72},
-	{0x3020, 0x93}, {0x3021, 0x03}, {0x3022, 0x01},
-	{0x3031, 0x0a}, {0x303f, 0x0c}, {0x3305, 0xf1},
-	{0x3307, 0x04}, {0x3309, 0x29}, {0x3500, 0x00},
-	{0x3501, 0x60}, {0x3502, 0x00}, {0x3503, 0x04},
-	{0x3504, 0x00}, {0x3505, 0x00}, {0x3506, 0x00},
-	{0x3507, 0x00}, {0x3508, 0x00}, {0x3509, 0x80},
-	{0x350a, 0x00}, {0x350b, 0x00}, {0x350c, 0x00},
-	{0x350d, 0x00}, {0x350e, 0x00}, {0x350f, 0x80},
-	{0x3510, 0x00}, {0x3511, 0x00}, {0x3512, 0x00},
-	{0x3513, 0x00}, {0x3514, 0x00}, {0x3515, 0x80},
-	{0x3516, 0x00}, {0x3517, 0x00}, {0x3518, 0x00},
-	{0x3519, 0x00}, {0x351a, 0x00}, {0x351b, 0x80},
-	{0x351c, 0x00}, {0x351d, 0x00}, {0x351e, 0x00},
-	{0x351f, 0x00}, {0x3520, 0x00}, {0x3521, 0x80},
-	{0x3522, 0x08}, {0x3524, 0x08}, {0x3526, 0x08},
-	{0x3528, 0x08}, {0x352a, 0x08}, {0x3602, 0x00},
-	{0x3603, 0x40}, {0x3604, 0x02}, {0x3605, 0x00},
-	{0x3606, 0x00}, {0x3607, 0x00}, {0x3609, 0x12},
-	{0x360a, 0x40}, {0x360c, 0x08}, {0x360f, 0xe5},
-	{0x3608, 0x8f}, {0x3611, 0x00}, {0x3613, 0xf7},
-	{0x3616, 0x58}, {0x3619, 0x99}, {0x361b, 0x60},
-	{0x361c, 0x7a}, {0x361e, 0x79}, {0x361f, 0x02},
-	{0x3632, 0x00}, {0x3633, 0x10}, {0x3634, 0x10},
-	{0x3635, 0x10}, {0x3636, 0x15}, {0x3646, 0x86},
-	{0x364a, 0x0b}, {0x3700, 0x17}, {0x3701, 0x22},
-	{0x3703, 0x10}, {0x370a, 0x37}, {0x3705, 0x00},
-	{0x3706, 0x63}, {0x3709, 0x3c}, {0x370b, 0x01},
-	{0x370c, 0x30}, {0x3710, 0x24}, {0x3711, 0x0c},
-	{0x3716, 0x00}, {0x3720, 0x28}, {0x3729, 0x7b},
-	{0x372a, 0x84}, {0x372b, 0xbd}, {0x372c, 0xbc},
-	{0x372e, 0x52}, {0x373c, 0x0e}, {0x373e, 0x33},
-	{0x3743, 0x10}, {0x3744, 0x88}, {0x3745, 0xc0},
-	{0x374a, 0x43}, {0x374c, 0x00}, {0x374e, 0x23},
-	{0x3751, 0x7b}, {0x3752, 0x84}, {0x3753, 0xbd},
-	{0x3754, 0xbc}, {0x3756, 0x52}, {0x375c, 0x00},
-	{0x3760, 0x00}, {0x3761, 0x00}, {0x3762, 0x00},
-	{0x3763, 0x00}, {0x3764, 0x00}, {0x3767, 0x04},
-	{0x3768, 0x04}, {0x3769, 0x08}, {0x376a, 0x08},
-	{0x376b, 0x20}, {0x376c, 0x00}, {0x376d, 0x00},
-	{0x376e, 0x00}, {0x3773, 0x00}, {0x3774, 0x51},
-	{0x3776, 0xbd}, {0x3777, 0xbd}, {0x3781, 0x18},
-	{0x3783, 0x25}, {0x3798, 0x1b}, {0x3800, 0x00},
-	{0x3801, 0x08}, {0x3802, 0x00}, {0x3803, 0x04},
-	{0x3804, 0x0a}, {0x3805, 0x97}, {0x3806, 0x05},
-	{0x3807, 0xfb}, {0x3808, 0x0a}, {0x3809, 0x80},
-	{0x380a, 0x05}, {0x380b, 0xf0}, {0x380c, 0x0a},
-	{0x380d, 0x0e}, {0x380e, 0x06}, {0x380f, 0x12},
-	{0x3810, 0x00}, {0x3811, 0x08}, {0x3812, 0x00},
-	{0x3813, 0x04}, {0x3814, 0x01}, {0x3815, 0x01},
-	{0x3819, 0x01}, {0x3820, 0x00}, {0x3821, 0x06},
-	{0x3829, 0x00}, {0x382a, 0x01}, {0x382b, 0x01},
-	{0x382d, 0x7f}, {0x3830, 0x04}, {0x3836, 0x01},
-	{0x3837, 0x00}, {0x3841, 0x02}, {0x3846, 0x08},
-	{0x3847, 0x07}, {0x3d85, 0x36}, {0x3d8c, 0x71},
-	{0x3d8d, 0xcb}, {0x3f0a, 0x00}, {0x4000, 0xf1},
-	{0x4001, 0x40}, {0x4002, 0x04}, {0x4003, 0x14},
-	{0x400e, 0x00}, {0x4011, 0x00}, {0x401a, 0x00},
-	{0x401b, 0x00}, {0x401c, 0x00}, {0x401d, 0x00},
-	{0x401f, 0x00}, {0x4020, 0x00}, {0x4021, 0x10},
-	{0x4022, 0x07}, {0x4023, 0xcf}, {0x4024, 0x09},
-	{0x4025, 0x60}, {0x4026, 0x09}, {0x4027, 0x6f},
-	{0x4028, 0x00}, {0x4029, 0x02}, {0x402a, 0x06},
-	{0x402b, 0x04}, {0x402c, 0x02}, {0x402d, 0x02},
-	{0x402e, 0x0e}, {0x402f, 0x04}, {0x4302, 0xff},
-	{0x4303, 0xff}, {0x4304, 0x00}, {0x4305, 0x00},
-	{0x4306, 0x00}, {0x4308, 0x02}, {0x4500, 0x6c},
-	{0x4501, 0xc4}, {0x4502, 0x40}, {0x4503, 0x01},
-	{0x4601, 0xa7}, {0x4800, 0x04}, {0x4813, 0x08},
-	{0x481f, 0x40}, {0x4829, 0x78}, {0x4837, 0x10},
-	{0x4b00, 0x2a}, {0x4b0d, 0x00}, {0x4d00, 0x04},
-	{0x4d01, 0x42}, {0x4d02, 0xd1}, {0x4d03, 0x93},
-	{0x4d04, 0xf5}, {0x4d05, 0xc1}, {0x5000, 0xf3},
-	{0x5001, 0x11}, {0x5004, 0x00}, {0x500a, 0x00},
-	{0x500b, 0x00}, {0x5032, 0x00}, {0x5040, 0x00},
-	{0x5050, 0x0c}, {0x5500, 0x00}, {0x5501, 0x10},
-	{0x5502, 0x01}, {0x5503, 0x0f}, {0x8000, 0x00},
-	{0x8001, 0x00}, {0x8002, 0x00}, {0x8003, 0x00},
-	{0x8004, 0x00}, {0x8005, 0x00}, {0x8006, 0x00},
-	{0x8007, 0x00}, {0x8008, 0x00}, {0x3638, 0x00},
+	/* System control*/
+	{0x0103, 0x01}, /* SC_CTRL0103 software_reset = 1 */
+	{0x3000, 0x20}, /* SC_CMMN_PAD_OEN0 FSIN_output_enable = 1 */
+	{0x3021, 0x03}, /*
+			 * SC_CMMN_MISC_CTRL fst_stby_ctr = 0,
+			 * sleep_no_latch_enable = 0
+			 */
+
+	/* AEC PK */
+	{0x3503, 0x04}, /* AEC_MANUAL gain_input_as_sensor_gain_format = 1 */
+	{0x352a, 0x08}, /* DIG_GAIN_FRAC_LONG dig_gain_long[14:8] = 0x08 (2x) */
+
+	/* ADC and analog control*/
+	{0x3603, 0x40},
+	{0x3604, 0x02},
+	{0x3609, 0x12},
+	{0x360c, 0x08},
+	{0x360f, 0xe5},
+	{0x3608, 0x8f},
+	{0x3611, 0x00},
+	{0x3613, 0xf7},
+	{0x3616, 0x58},
+	{0x3619, 0x99},
+	{0x361b, 0x60},
+	{0x361e, 0x79},
+	{0x3634, 0x10},
+	{0x3635, 0x10},
+	{0x3636, 0x15},
+	{0x3646, 0x86},
+	{0x364a, 0x0b},
+
+	/* Sensor control */
+	{0x3700, 0x17},
+	{0x3701, 0x22},
+	{0x3703, 0x10},
+	{0x370a, 0x37},
+	{0x3706, 0x63},
+	{0x3709, 0x3c},
+	{0x370c, 0x30},
+	{0x3710, 0x24},
+	{0x3720, 0x28},
+	{0x3729, 0x7b},
+	{0x372b, 0xbd},
+	{0x372c, 0xbc},
+	{0x372e, 0x52},
+	{0x373c, 0x0e},
+	{0x373e, 0x33},
+	{0x3743, 0x10},
+	{0x3744, 0x88},
+	{0x3745, 0xc0},
+	{0x374c, 0x00},
+	{0x374e, 0x23},
+	{0x3751, 0x7b},
+	{0x3753, 0xbd},
+	{0x3754, 0xbc},
+	{0x3756, 0x52},
+	{0x376b, 0x20},
+	{0x3774, 0x51},
+	{0x3776, 0xbd},
+	{0x3777, 0xbd},
+	{0x3781, 0x18},
+	{0x3783, 0x25},
+	{0x3798, 0x1b},
+
+	/* Timing control */
+	{0x3801, 0x08}, /* H_CROP_START_L h_crop_start[7:0] = 0x08 */
+	{0x3805, 0x97}, /* H_CROP_END_L h_crop_end[7:0] = 0x97 */
+	{0x380c, 0x0a}, /* TIMING_HTS_H hts[14:8] = 0x0a */
+	{0x380d, 0x0e}, /* TIMING_HTS_L hts[7:0] = 0x0e */
+	{0x3811, 0x08}, /* H_WIN_OFF_L h_win_off[7:0] = 0x08*/
+	{0x3813, 0x04}, /* V_WIN_OFF_L v_win_off[7:0] = 0x04 */
+	{0x3819, 0x01}, /* VSYNC_END_L vsync_end_point[7:0] = 0x01 */
+	{0x3821, 0x06}, /* TIMING_FORMAT2 array_h_mirror = 1, digital_h_mirror = 1 */
+
+	/* OTP control */
+	{0x3d85, 0x36}, /* OTP_REG85 OTP_power_up_load_setting_enable = 1,
+			 * OTP_power_up_load_data_enable = 1,
+			 * OTP_bist_select = 1 (compare with zero)
+			 */
+	{0x3d8c, 0x71}, /* OTP_SETTING_STT_ADDRESS_H */
+	{0x3d8d, 0xcb}, /* OTP_SETTING_STT_ADDRESS_L */
+
+	/* BLC registers*/
+	{0x4001, 0x40}, /* DEBUG_MODE */
+	{0x401b, 0x00}, /* DEBUG_MODE */
+	{0x401d, 0x00}, /* DEBUG_MODE */
+	{0x401f, 0x00}, /* DEBUG_MODE */
+	{0x4020, 0x00}, /* ANCHOR_LEFT_START_H anchor_left_start[11:8] = 0 */
+	{0x4021, 0x10}, /* ANCHOR_LEFT_START_L anchor_left_start[7:0] = 0x10 */
+	{0x4022, 0x07}, /* ANCHOR_LEFT_END_H anchor_left_end[11:8] = 0x07 */
+	{0x4023, 0xcf}, /* ANCHOR_LEFT_END_L anchor_left_end[7:0] = 0xcf */
+	{0x4024, 0x09}, /* ANCHOR_RIGHT_START_H anchor_right_start[11:8] = 0x09 */
+	{0x4025, 0x60}, /* ANCHOR_RIGHT_START_L anchor_right_start[7:0] = 0x60 */
+	{0x4026, 0x09}, /* ANCHOR_RIGHT_END_H anchor_right_end[11:8] = 0x09 */
+	{0x4027, 0x6f}, /* ANCHOR_RIGHT_END_L anchor_right_end[7:0] = 0x6f */
+
+	/* ADC sync control */
+	{0x4500, 0x6c}, /* ADC_SYNC_CTRL */
+	{0x4503, 0x01}, /* ADC_SYNC_CTRL */
+
+	/* VFIFO */
+	{0x4601, 0xa7}, /* VFIFO_CTRL_01 r_vfifo_read_start[7:0] = 0xa7 */
+
+	/* Temperature monitor */
+	{0x4d00, 0x04}, /* TPM_CTRL_00 tmp_slope[15:8] = 0x04 */
+	{0x4d01, 0x42}, /* TPM_CTRL_01 tmp_slope[7:0] = 0x42 */
+	{0x4d02, 0xd1}, /* TPM_CTRL_02 tpm_offset[31:24] = 0xd1 */
+	{0x4d03, 0x93}, /* TPM_CTRL_03 tpm_offset[23:16] = 0x93 */
+	{0x4d04, 0xf5}, /* TPM_CTRL_04 tpm_offset[15:8]  = 0xf5 */
+	{0x4d05, 0xc1}, /* TPM_CTRL_05 tpm_offset[7:0]   = 0xc1 */
+
+	/* pre-ISP control */
+	{0x5050, 0x0c}, /* DEBUG_MODE */
+
+	/* OTP-DPC control */
+	{0x5501, 0x10}, /* OTP_DPC_START_L otp_start_address[7:0] = 0x10 */
+	{0x5503, 0x0f}, /* OTP_DPC_END_L otp_end_address[7:0] = 0x0f */
 	{REG_NULL, 0x00},
 };
 
-- 
2.43.0


