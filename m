Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF50D2B49E8
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 16:52:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730558AbgKPPug (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 10:50:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730328AbgKPPug (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 10:50:36 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29622C0613CF
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 07:50:36 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id 7so25088633ejm.0
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 07:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NIl6OKgajPZ2VwIMALbBfQrvT3Qo8x6Qcgh1OwsRyEA=;
        b=MEmRn7BT65f2gwRnTuEEmIYWJHHSAQFAyQjzUMOU6HDdkW99F895QaFdJ/YXzvApKp
         E0Z0WxC9b6yHpBeuMRJJ5bTMSX5rbvsz6S8z1XkqbyjtvXD5P1svFBp3y+kx5gNmzmeO
         0VVahk54AGIJArDpgUfOBcaQegBxH7MH+yf6/bSulI3AnoODfgLpQetAN32ijtRK9n7Z
         PakXCHFhbA8XVq2tOhx5iD1e3WGnE9FDupYWHwCYjq/6Vuo6dfr+j9XSyZ1tVMV6xSTa
         ZhnShJvF7IMIYpCH2IDdscwT7ArE1K6ExPaeASqymImRMqY2BdHQ2a6OmimWrrBR+QPX
         Othg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NIl6OKgajPZ2VwIMALbBfQrvT3Qo8x6Qcgh1OwsRyEA=;
        b=UKfoKDLg+dJYy3nvvDJhvQZyCUhymSfDFxaDDj2oS0D9lbS4Z8yxnk3VSE7e/q48tB
         6mgLLoe1dBGAQomGDR3LNLQ4vpUHnrCYuLKPylhErPoAelW2u1rHGxTsJjh80rsgVJyU
         lr8W729KZI7SDi2ojmUV4eY9Nx2zYB9W9nWgDHHc7qcTe4uNRPdk2Vdh8hBnI9Qv8K56
         bRIHahNERU25ZxghJxnhaCb6l9INX3XUNEuz5G/tiIpnBPPYkLQxirp2byaz1RBa/OhP
         2CMsfkFB/YYToLQibRjW8GFopC4FZiLogu7oA8HYcYSeQQi9z02lLPSO63U054dL4Hbd
         PfBQ==
X-Gm-Message-State: AOAM531R2sOf1e42cQI/ozq1t/VqJscSLObwK7drWePwiw3I6PC8ObyR
        2LIUbDK3BxFzwEzxjJaF699LUg==
X-Google-Smtp-Source: ABdhPJwptfhtcrTJUWOgY83HSLRkpk+228izqlJgWhBzDA/A8UWmpl2MBiIDtLq9JShR8VW96zzpZg==
X-Received: by 2002:a17:906:c41:: with SMTP id t1mr15060747ejf.19.1605541834834;
        Mon, 16 Nov 2020 07:50:34 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:fa2:d302:39cc:d633])
        by smtp.gmail.com with ESMTPSA id m2sm10466689edp.48.2020.11.16.07.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 07:50:34 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     dongchun.zhu@mediatek.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ben Kao <ben.kao@intel.com>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH] media: ov8856: Remove 3280x2464 mode
Date:   Mon, 16 Nov 2020 16:50:08 +0100
Message-Id: <20201116155008.118124-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove the 3280x2464 mode as it can't be reproduced and yields
an output resolution of 3264x2448 instead of the desired one.

Furthermore the 3264x2448 resolution is the highest resolution
that the product brief lists.

Since 3280x2464 neither works correctly nor seems to be supported
by the sensor, let's remove it.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/i2c/ov8856.c | 202 -------------------------------------
 1 file changed, 202 deletions(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 2f4ceaa80593..3365d19a303d 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -148,196 +148,6 @@ static const struct ov8856_reg mipi_data_rate_360mbps[] = {
 	{0x031e, 0x0c},
 };
 
-static const struct ov8856_reg mode_3280x2464_regs[] = {
-	{0x3000, 0x20},
-	{0x3003, 0x08},
-	{0x300e, 0x20},
-	{0x3010, 0x00},
-	{0x3015, 0x84},
-	{0x3018, 0x72},
-	{0x3021, 0x23},
-	{0x3033, 0x24},
-	{0x3500, 0x00},
-	{0x3501, 0x9a},
-	{0x3502, 0x20},
-	{0x3503, 0x08},
-	{0x3505, 0x83},
-	{0x3508, 0x01},
-	{0x3509, 0x80},
-	{0x350c, 0x00},
-	{0x350d, 0x80},
-	{0x350e, 0x04},
-	{0x350f, 0x00},
-	{0x3510, 0x00},
-	{0x3511, 0x02},
-	{0x3512, 0x00},
-	{0x3600, 0x72},
-	{0x3601, 0x40},
-	{0x3602, 0x30},
-	{0x3610, 0xc5},
-	{0x3611, 0x58},
-	{0x3612, 0x5c},
-	{0x3613, 0xca},
-	{0x3614, 0x20},
-	{0x3628, 0xff},
-	{0x3629, 0xff},
-	{0x362a, 0xff},
-	{0x3633, 0x10},
-	{0x3634, 0x10},
-	{0x3635, 0x10},
-	{0x3636, 0x10},
-	{0x3663, 0x08},
-	{0x3669, 0x34},
-	{0x366e, 0x10},
-	{0x3706, 0x86},
-	{0x370b, 0x7e},
-	{0x3714, 0x23},
-	{0x3730, 0x12},
-	{0x3733, 0x10},
-	{0x3764, 0x00},
-	{0x3765, 0x00},
-	{0x3769, 0x62},
-	{0x376a, 0x2a},
-	{0x376b, 0x30},
-	{0x3780, 0x00},
-	{0x3781, 0x24},
-	{0x3782, 0x00},
-	{0x3783, 0x23},
-	{0x3798, 0x2f},
-	{0x37a1, 0x60},
-	{0x37a8, 0x6a},
-	{0x37ab, 0x3f},
-	{0x37c2, 0x04},
-	{0x37c3, 0xf1},
-	{0x37c9, 0x80},
-	{0x37cb, 0x16},
-	{0x37cc, 0x16},
-	{0x37cd, 0x16},
-	{0x37ce, 0x16},
-	{0x3800, 0x00},
-	{0x3801, 0x00},
-	{0x3802, 0x00},
-	{0x3803, 0x06},
-	{0x3804, 0x0c},
-	{0x3805, 0xdf},
-	{0x3806, 0x09},
-	{0x3807, 0xa7},
-	{0x3808, 0x0c},
-	{0x3809, 0xd0},
-	{0x380a, 0x09},
-	{0x380b, 0xa0},
-	{0x380c, 0x07},
-	{0x380d, 0x88},
-	{0x380e, 0x09},
-	{0x380f, 0xb8},
-	{0x3810, 0x00},
-	{0x3811, 0x00},
-	{0x3812, 0x00},
-	{0x3813, 0x01},
-	{0x3814, 0x01},
-	{0x3815, 0x01},
-	{0x3816, 0x00},
-	{0x3817, 0x00},
-	{0x3818, 0x00},
-	{0x3819, 0x10},
-	{0x3820, 0x80},
-	{0x3821, 0x46},
-	{0x382a, 0x01},
-	{0x382b, 0x01},
-	{0x3830, 0x06},
-	{0x3836, 0x02},
-	{0x3862, 0x04},
-	{0x3863, 0x08},
-	{0x3cc0, 0x33},
-	{0x3d85, 0x17},
-	{0x3d8c, 0x73},
-	{0x3d8d, 0xde},
-	{0x4001, 0xe0},
-	{0x4003, 0x40},
-	{0x4008, 0x00},
-	{0x4009, 0x0b},
-	{0x400a, 0x00},
-	{0x400b, 0x84},
-	{0x400f, 0x80},
-	{0x4010, 0xf0},
-	{0x4011, 0xff},
-	{0x4012, 0x02},
-	{0x4013, 0x01},
-	{0x4014, 0x01},
-	{0x4015, 0x01},
-	{0x4042, 0x00},
-	{0x4043, 0x80},
-	{0x4044, 0x00},
-	{0x4045, 0x80},
-	{0x4046, 0x00},
-	{0x4047, 0x80},
-	{0x4048, 0x00},
-	{0x4049, 0x80},
-	{0x4041, 0x03},
-	{0x404c, 0x20},
-	{0x404d, 0x00},
-	{0x404e, 0x20},
-	{0x4203, 0x80},
-	{0x4307, 0x30},
-	{0x4317, 0x00},
-	{0x4503, 0x08},
-	{0x4601, 0x80},
-	{0x4800, 0x44},
-	{0x4816, 0x53},
-	{0x481b, 0x58},
-	{0x481f, 0x27},
-	{0x4837, 0x16},
-	{0x483c, 0x0f},
-	{0x484b, 0x05},
-	{0x5000, 0x57},
-	{0x5001, 0x0a},
-	{0x5004, 0x04},
-	{0x502e, 0x03},
-	{0x5030, 0x41},
-	{0x5780, 0x14},
-	{0x5781, 0x0f},
-	{0x5782, 0x44},
-	{0x5783, 0x02},
-	{0x5784, 0x01},
-	{0x5785, 0x01},
-	{0x5786, 0x00},
-	{0x5787, 0x04},
-	{0x5788, 0x02},
-	{0x5789, 0x0f},
-	{0x578a, 0xfd},
-	{0x578b, 0xf5},
-	{0x578c, 0xf5},
-	{0x578d, 0x03},
-	{0x578e, 0x08},
-	{0x578f, 0x0c},
-	{0x5790, 0x08},
-	{0x5791, 0x04},
-	{0x5792, 0x00},
-	{0x5793, 0x52},
-	{0x5794, 0xa3},
-	{0x5795, 0x02},
-	{0x5796, 0x20},
-	{0x5797, 0x20},
-	{0x5798, 0xd5},
-	{0x5799, 0xd5},
-	{0x579a, 0x00},
-	{0x579b, 0x50},
-	{0x579c, 0x00},
-	{0x579d, 0x2c},
-	{0x579e, 0x0c},
-	{0x579f, 0x40},
-	{0x57a0, 0x09},
-	{0x57a1, 0x40},
-	{0x59f8, 0x3d},
-	{0x5a08, 0x02},
-	{0x5b00, 0x02},
-	{0x5b01, 0x10},
-	{0x5b02, 0x03},
-	{0x5b03, 0xcf},
-	{0x5b05, 0x6c},
-	{0x5e00, 0x00}
-};
-
 static const struct ov8856_reg mode_3264x2448_regs[] = {
 	{0x0103, 0x01},
 	{0x0302, 0x3c},
@@ -963,18 +773,6 @@ static const struct ov8856_link_freq_config link_freq_configs[] = {
 };
 
 static const struct ov8856_mode supported_modes[] = {
-	{
-		.width = 3280,
-		.height = 2464,
-		.hts = 1928,
-		.vts_def = 2488,
-		.vts_min = 2488,
-		.reg_list = {
-			.num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
-			.regs = mode_3280x2464_regs,
-		},
-		.link_freq_index = OV8856_LINK_FREQ_720MBPS,
-	},
 	{
 		.width = 3264,
 		.height = 2448,
-- 
2.27.0

