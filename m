Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39B1525ACA6
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 16:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgIBOMd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 10:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727845AbgIBOLF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 10:11:05 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84703C061245
        for <linux-media@vger.kernel.org>; Wed,  2 Sep 2020 07:11:04 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id l17so5051338edq.12
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2020 07:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eFBNEdHaXPnLnMV8eTpWxIWl/gtT3P6hTg6otUGPU+0=;
        b=Nwh3sTpGCrpep8xBnJtw0wftk8KLVPcvoWUQM/Lu91EqKLEzApROkJ2eCnSXTkNcde
         gPSVhXwLuo6FFnScrhigyHH9Wbvs9gOQCgy3WJj8gKcz529494oeNyhuMT41OicF+kh7
         GUJ6EcWc7cmKoYO2beQHB7uxhisNCuvJoSU/nM+adeGVD0/6V48t8rm1fGyIv8eyFGp7
         oq5UiTclQJ+H3QdPZk82Lclxmy73fh9Ii2XAYp6nwmvpbhP2Jc2AhME+q6Oy4frCLLTR
         0h5Pr9gkiwdtkd95oKsWGmgyLrYMMSIZ8vhqDzeOZGpoE37+C4LD+r+YttknQbR3LnG1
         NIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eFBNEdHaXPnLnMV8eTpWxIWl/gtT3P6hTg6otUGPU+0=;
        b=mTq7PwsP71ECZzYHJ6La18WpEdjhm4Y3IViDC3djmGUToBfe4DVHiQmiXSW63fZhmM
         f2TpdMrkjK8+s2XD6Qx8MSCY+G382kw4m0tSsjh1hyoUsKsTnbvbjRpgpIrfjwzjj8jT
         BxriVbwvk8KgoJuZ4226HQoAo5T014vc0P6tv8iJOSOlsDkv4AAma+6OtCkW8naCOosW
         Zk/pNiuKK1q0GnX1KEkUs8iHfqQi7bYfcym+IyxcS9HVS/bqAPFwdYr/bNW6kVf3Drps
         oj1mcYGQs9BLECG4Dg/ZKt1X3nCqXtU9GOVvO/1eDT7nddp5Qcqw9nF571OZ7Q0A+fGg
         jJJA==
X-Gm-Message-State: AOAM530I2g8tBoISDsk7JSaRC3T5MfdW+jmcPGztMZHQq6dGMrxsJzpm
        GbHiIDNgm1EwAvr356HBtcmmqg==
X-Google-Smtp-Source: ABdhPJyeKxUAjckGee1vf3r0PmcLMO5Fw0qIrnsD42YCZY8Cjz3CSQAmIGROhy1XTIFet/63X0j5bA==
X-Received: by 2002:a50:f687:: with SMTP id d7mr227187edn.353.1599055862787;
        Wed, 02 Sep 2020 07:11:02 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:5cc2:d98c:ab6b:cb16])
        by smtp.gmail.com with ESMTPSA id h25sm4459336ejq.12.2020.09.02.07.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 07:11:01 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     dongchun.zhu@mediatek.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ben Kao <ben.kao@intel.com>, Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v1 1/2] media: ov8856: Add support for 1632x1224 mode
Date:   Wed,  2 Sep 2020 16:10:36 +0200
Message-Id: <20200902141037.240549-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

OV8856 supports 1632x1224 @ 60 FPS, which is added
in this commit.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/i2c/ov8856.c | 215 +++++++++++++++++++++++++++++++++++++
 1 file changed, 215 insertions(+)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 4ca27675cc5a..9b99affa90e2 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -528,6 +528,209 @@ static const struct ov8856_reg mode_1640x1232_regs[] = {
 	{0x5e00, 0x00}
 };
 
+static const struct ov8856_reg mode_1632x1224_regs[] = {
+	{0x0103, 0x01},
+	{0x0302, 0x3c},
+	{0x0303, 0x01},
+	{0x031e, 0x0c},
+	{0x3000, 0x20},
+	{0x3003, 0x08},
+	{0x300e, 0x20},
+	{0x3010, 0x00},
+	{0x3015, 0x84},
+	{0x3018, 0x72},
+	{0x3021, 0x23},
+	{0x3033, 0x24},
+	{0x3500, 0x00},
+	{0x3501, 0x4c},
+	{0x3502, 0xe0},
+	{0x3503, 0x08},
+	{0x3505, 0x83},
+	{0x3508, 0x01},
+	{0x3509, 0x80},
+	{0x350c, 0x00},
+	{0x350d, 0x80},
+	{0x350e, 0x04},
+	{0x350f, 0x00},
+	{0x3510, 0x00},
+	{0x3511, 0x02},
+	{0x3512, 0x00},
+	{0x3600, 0x72},
+	{0x3601, 0x40},
+	{0x3602, 0x30},
+	{0x3610, 0xc5},
+	{0x3611, 0x58},
+	{0x3612, 0x5c},
+	{0x3613, 0xca},
+	{0x3614, 0x60},
+	{0x3628, 0xff},
+	{0x3629, 0xff},
+	{0x362a, 0xff},
+	{0x3633, 0x10},
+	{0x3634, 0x10},
+	{0x3635, 0x10},
+	{0x3636, 0x10},
+	{0x3663, 0x08},
+	{0x3669, 0x34},
+	{0x366d, 0x00},
+	{0x366e, 0x08},
+	{0x3706, 0x86},
+	{0x370b, 0x7e},
+	{0x3714, 0x27},
+	{0x3730, 0x12},
+	{0x3733, 0x10},
+	{0x3764, 0x00},
+	{0x3765, 0x00},
+	{0x3769, 0x62},
+	{0x376a, 0x2a},
+	{0x376b, 0x30},
+	{0x3780, 0x00},
+	{0x3781, 0x24},
+	{0x3782, 0x00},
+	{0x3783, 0x23},
+	{0x3798, 0x2f},
+	{0x37a1, 0x60},
+	{0x37a8, 0x6a},
+	{0x37ab, 0x3f},
+	{0x37c2, 0x14},
+	{0x37c3, 0xf1},
+	{0x37c9, 0x80},
+	{0x37cb, 0x16},
+	{0x37cc, 0x16},
+	{0x37cd, 0x16},
+	{0x37ce, 0x16},
+	{0x3800, 0x00},
+	{0x3801, 0x00},
+	{0x3802, 0x00},
+	{0x3803, 0x0c},
+	{0x3804, 0x0c},
+	{0x3805, 0xdf},
+	{0x3806, 0x09},
+	{0x3807, 0xa3},
+	{0x3808, 0x06},
+	{0x3809, 0x60},
+	{0x380a, 0x04},
+	{0x380b, 0xc8},
+	{0x380c, 0x07},
+	{0x380d, 0x8c},
+	{0x380e, 0x09},
+	{0x380f, 0xb2},
+	{0x3810, 0x00},
+	{0x3811, 0x02},
+	{0x3812, 0x00},
+	{0x3813, 0x02},
+	{0x3814, 0x03},
+	{0x3815, 0x01},
+	{0x3816, 0x00},
+	{0x3817, 0x00},
+	{0x3818, 0x00},
+	{0x3819, 0x10},
+	{0x3820, 0x80},
+	{0x3821, 0x47},
+	{0x382a, 0x03},
+	{0x382b, 0x01},
+	{0x3830, 0x06},
+	{0x3836, 0x02},
+	{0x3862, 0x04},
+	{0x3863, 0x08},
+	{0x3cc0, 0x33},
+	{0x3d85, 0x17},
+	{0x3d8c, 0x73},
+	{0x3d8d, 0xde},
+	{0x4001, 0xe0},
+	{0x4003, 0x40},
+	{0x4008, 0x00},
+	{0x4009, 0x05},
+	{0x400a, 0x00},
+	{0x400b, 0x84},
+	{0x400f, 0x80},
+	{0x4010, 0xf0},
+	{0x4011, 0xff},
+	{0x4012, 0x02},
+	{0x4013, 0x01},
+	{0x4014, 0x01},
+	{0x4015, 0x01},
+	{0x4042, 0x00},
+	{0x4043, 0x80},
+	{0x4044, 0x00},
+	{0x4045, 0x80},
+	{0x4046, 0x00},
+	{0x4047, 0x80},
+	{0x4048, 0x00},
+	{0x4049, 0x80},
+	{0x4041, 0x03},
+	{0x404c, 0x20},
+	{0x404d, 0x00},
+	{0x404e, 0x20},
+	{0x4203, 0x80},
+	{0x4307, 0x30},
+	{0x4317, 0x00},
+	{0x4502, 0x50},
+	{0x4503, 0x08},
+	{0x4601, 0x80},
+	{0x4800, 0x44},
+	{0x4816, 0x53},
+	{0x481b, 0x50},
+	{0x481f, 0x27},
+	{0x4823, 0x3c},
+	{0x482b, 0x00},
+	{0x4831, 0x66},
+	{0x4837, 0x16},
+	{0x483c, 0x0f},
+	{0x484b, 0x05},
+	{0x5000, 0x77},
+	{0x5001, 0x0a},
+	{0x5003, 0xc8},
+	{0x5004, 0x04},
+	{0x5006, 0x00},
+	{0x5007, 0x00},
+	{0x502e, 0x03},
+	{0x5030, 0x41},
+	{0x5795, 0x00},
+	{0x5796, 0x10},
+	{0x5797, 0x10},
+	{0x5798, 0x73},
+	{0x5799, 0x73},
+	{0x579a, 0x00},
+	{0x579b, 0x28},
+	{0x579c, 0x00},
+	{0x579d, 0x16},
+	{0x579e, 0x06},
+	{0x579f, 0x20},
+	{0x57a0, 0x04},
+	{0x57a1, 0xa0},
+	{0x5780, 0x14},
+	{0x5781, 0x0f},
+	{0x5782, 0x44},
+	{0x5783, 0x02},
+	{0x5784, 0x01},
+	{0x5785, 0x01},
+	{0x5786, 0x00},
+	{0x5787, 0x04},
+	{0x5788, 0x02},
+	{0x5789, 0x0f},
+	{0x578a, 0xfd},
+	{0x578b, 0xf5},
+	{0x578c, 0xf5},
+	{0x578d, 0x03},
+	{0x578e, 0x08},
+	{0x578f, 0x0c},
+	{0x5790, 0x08},
+	{0x5791, 0x04},
+	{0x5792, 0x00},
+	{0x5793, 0x52},
+	{0x5794, 0xa3},
+	{0x59f8, 0x3d},
+	{0x5a08, 0x02},
+	{0x5b00, 0x02},
+	{0x5b01, 0x10},
+	{0x5b02, 0x03},
+	{0x5b03, 0xcf},
+	{0x5b05, 0x6c},
+	{0x5e00, 0x00},
+	{0x5e10, 0xfc}
+};
+
 static const char * const ov8856_test_pattern_menu[] = {
 	"Disabled",
 	"Standard Color Bar",
@@ -580,6 +783,18 @@ static const struct ov8856_mode supported_modes[] = {
 			.regs = mode_1640x1232_regs,
 		},
 		.link_freq_index = OV8856_LINK_FREQ_360MBPS,
+	},
+	{
+		.width = 1632,
+		.height = 1224,
+		.hts = 1932,
+		.vts_def = 2482,
+		.vts_min = 2482,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1632x1224_regs),
+			.regs = mode_1632x1224_regs,
+		},
+		.link_freq_index = OV8856_LINK_FREQ_360MBPS,
 	}
 };
 
-- 
2.25.1

