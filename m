Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2700451CC6E
	for <lists+linux-media@lfdr.de>; Fri,  6 May 2022 01:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386558AbiEEXIF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 19:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386549AbiEEXIA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 19:08:00 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3EA05EDCA
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 16:04:19 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id w4so7848240wrg.12
        for <linux-media@vger.kernel.org>; Thu, 05 May 2022 16:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4QnDOy68DEZab1Oa8M/WsGaHMMp+EPQkeloWsfecpE8=;
        b=l8sCO4iXimDrRRGKYFS7Pm4oubZ7s/QjbW8EF2VAFY278a2zU5Td8BecitXPbmXTJs
         7B2Rvb1cNRCROjYAwPLbTy1fHoRzirWN46E07dlRWCrKNyc3lu9ASWQ1mudI4lhrOasO
         WJxK1coVas2XyEHY1hIGvBa+W0Jus5W/zRbvmTg6jJ3fIxMClb0lfz17TUhYnT/EUWjz
         dHihXt+PpfWh6cKhbuQowfs+SixXmZt4hcOXRe2vpyMkgbXV8WXN8iaM0L446T3ZHZbA
         swUUQ1tEYGo1ALbXreKNEkLGXVY/O1xkeKWriat+MX8QENZmLED6B5QV23KOcQrVL3EV
         v6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4QnDOy68DEZab1Oa8M/WsGaHMMp+EPQkeloWsfecpE8=;
        b=6e/gAmkkR6s8MvYtbpGY1e0w1+PVKNQJN/KlJr2yyJlcobMY0Xj/mN6/bbC9jACHaB
         0WihdclqbdPZOZ76Ck+0kRIdeKckiFghidYCsZSnyOpNuIoNw3TfWGDn56BWpMoTR5HU
         nRdnIO+B3b7ZY4cnwfAyo6jsU6T5hnpH2NYNCFQ3JfUtAlCyVA+OQwwr+M0uiu0mCzUn
         S1y1+ouZB2U5dlwMudtoC4Gp4Me9YYPr69PH4dU6DBltb4Ap9yzSw6RwkphBeDo/TEII
         TDVR/cl6maqGMI9ak8I369y11aYpDvhyxX8PF38SVPFLzQ0Hsn4u6kV7ujsNblTGDiTN
         swZA==
X-Gm-Message-State: AOAM533SzgVT8pPG7kgnaJnU3g/anfZVB1f/6kBcbfg8n8W2B090BhpV
        IrEIRF+rrxhadI4as4R3eq3oT6eRItQ=
X-Google-Smtp-Source: ABdhPJxvZbpgJea7z/IaAfGrHQi9mSvvtceHKL/mKteRM8veBO9vu03VPR4ArU7gVyCZhwRjU3jQhQ==
X-Received: by 2002:adf:dd92:0:b0:20a:d831:222f with SMTP id x18-20020adfdd92000000b0020ad831222fmr266068wrl.401.1651791858413;
        Thu, 05 May 2022 16:04:18 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id o20-20020a05600c339400b003942a244f33sm6782130wmp.12.2022.05.05.16.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 16:04:18 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v4 07/15] media: i2c: Add support for new frequencies to ov7251
Date:   Fri,  6 May 2022 00:03:54 +0100
Message-Id: <20220505230402.449643-8-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505230402.449643-1-djrscally@gmail.com>
References: <20220505230402.449643-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The OV7251 sensor is used as the IR camera sensor on the Microsoft
Surface line of tablets; this provides a 19.2MHz external clock, and
the Windows driver for this sensor configures a 319.2MHz link freq to
the CSI-2 receiver. Add the ability to support those rate to the
driver by defining a new set of PLL configs.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v4:

	- Fixed the unused variable

Changes in v3:

	- Added commas to last items in arrays (Andy)

Changes in v2:

	- Added support for 319.2MHz link frequency

 drivers/media/i2c/ov7251.c | 93 +++++++++++++++++++++++++++++---------
 1 file changed, 72 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 484c9f13fe97..98848b3f62a9 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -96,12 +96,14 @@ struct ov7251_pll_cfgs {
 };
 
 enum xclk_rate {
+	OV7251_19_2_MHZ,
 	OV7251_24_MHZ,
 	OV7251_NUM_SUPPORTED_RATES
 };
 
 enum supported_link_freqs {
 	OV7251_LINK_FREQ_240_MHZ,
+	OV7251_LINK_FREQ_319_2_MHZ,
 	OV7251_NUM_SUPPORTED_LINK_FREQS
 };
 
@@ -147,6 +149,22 @@ static inline struct ov7251 *to_ov7251(struct v4l2_subdev *sd)
 	return container_of(sd, struct ov7251, sd);
 }
 
+static const struct ov7251_pll1_cfg ov7251_pll1_cfg_19_2_mhz_240_mhz = {
+	.pre_div = 0x03,
+	.mult = 0x4b,
+	.div = 0x01,
+	.pix_div = 0x0a,
+	.mipi_div = 0x05,
+};
+
+static const struct ov7251_pll1_cfg ov7251_pll1_cfg_19_2_mhz_319_2_mhz = {
+	.pre_div = 0x01,
+	.mult = 0x85,
+	.div = 0x04,
+	.pix_div = 0x0a,
+	.mipi_div = 0x05,
+};
+
 static const struct ov7251_pll1_cfg ov7251_pll1_cfg_24_mhz_240_mhz = {
 	.pre_div = 0x03,
 	.mult = 0x64,
@@ -155,6 +173,22 @@ static const struct ov7251_pll1_cfg ov7251_pll1_cfg_24_mhz_240_mhz = {
 	.mipi_div = 0x05,
 };
 
+static const struct ov7251_pll1_cfg ov7251_pll1_cfg_24_mhz_319_2_mhz = {
+	.pre_div = 0x05,
+	.mult = 0x85,
+	.div = 0x02,
+	.pix_div = 0x0a,
+	.mipi_div = 0x05,
+};
+
+static const struct ov7251_pll2_cfg ov7251_pll2_cfg_19_2_mhz = {
+	.pre_div = 0x04,
+	.mult = 0x32,
+	.div = 0x00,
+	.sys_div = 0x05,
+	.adc_div = 0x04,
+};
+
 static const struct ov7251_pll2_cfg ov7251_pll2_cfg_24_mhz = {
 	.pre_div = 0x04,
 	.mult = 0x28,
@@ -163,14 +197,24 @@ static const struct ov7251_pll2_cfg ov7251_pll2_cfg_24_mhz = {
 	.adc_div = 0x04,
 };
 
+static const struct ov7251_pll_cfgs ov7251_pll_cfgs_19_2_mhz = {
+	.pll2 = &ov7251_pll2_cfg_19_2_mhz,
+	.pll1 = {
+		[OV7251_LINK_FREQ_240_MHZ] = &ov7251_pll1_cfg_19_2_mhz_240_mhz,
+		[OV7251_LINK_FREQ_319_2_MHZ] = &ov7251_pll1_cfg_19_2_mhz_319_2_mhz,
+	},
+};
+
 static const struct ov7251_pll_cfgs ov7251_pll_cfgs_24_mhz = {
 	.pll2 = &ov7251_pll2_cfg_24_mhz,
 	.pll1 = {
 		[OV7251_LINK_FREQ_240_MHZ] = &ov7251_pll1_cfg_24_mhz_240_mhz,
+		[OV7251_LINK_FREQ_319_2_MHZ] = &ov7251_pll1_cfg_24_mhz_319_2_mhz,
 	},
 };
 
 static const struct ov7251_pll_cfgs *ov7251_pll_cfgs[] = {
+	[OV7251_19_2_MHZ] = &ov7251_pll_cfgs_19_2_mhz,
 	[OV7251_24_MHZ] = &ov7251_pll_cfgs_24_mhz,
 };
 
@@ -564,15 +608,18 @@ static const struct reg_value ov7251_setting_vga_90fps[] = {
 };
 
 static const unsigned long supported_xclk_rates[] = {
+	[OV7251_19_2_MHZ] = 19200000,
 	[OV7251_24_MHZ] = 24000000,
 };
 
 static const s64 link_freq[] = {
 	[OV7251_LINK_FREQ_240_MHZ] = 240000000,
+	[OV7251_LINK_FREQ_319_2_MHZ] = 319200000,
 };
 
 static const s64 pixel_rates[] = {
 	[OV7251_LINK_FREQ_240_MHZ] = 48000000,
+	[OV7251_LINK_FREQ_319_2_MHZ] = 63840000,
 };
 
 static const struct ov7251_mode_info ov7251_mode_info_data[] = {
@@ -1397,6 +1444,7 @@ static int ov7251_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct ov7251 *ov7251;
 	u8 chip_id_high, chip_id_low, chip_rev;
+	unsigned int rate = 0, clk_rate = 0;
 	s64 pixel_rate;
 	int ret;
 	int i;
@@ -1413,31 +1461,34 @@ static int ov7251_probe(struct i2c_client *client)
 		return ret;
 
 	/* get system clock (xclk) */
-	ov7251->xclk = devm_clk_get(dev, "xclk");
-	if (IS_ERR(ov7251->xclk)) {
-		dev_err(dev, "could not get xclk");
-		return PTR_ERR(ov7251->xclk);
-	}
-
+	ov7251->xclk = devm_clk_get_optional(dev, NULL);
+	if (IS_ERR(ov7251->xclk))
+		return dev_err_probe(dev, PTR_ERR(ov7251->xclk),
+				     "could not get xclk");
+
+	/*
+	 * We could have either a 24MHz or 19.2MHz clock rate from either DT or
+	 * ACPI. We also need to support the IPU3 case which will have both an
+	 * external clock AND a clock-frequency property.
+	 */
 	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
-				       &ov7251->xclk_freq);
-	if (ret) {
-		dev_err(dev, "could not get xclk frequency\n");
-		return ret;
-	}
+				       &rate);
+	if (ret && !ov7251->xclk)
+		return dev_err_probe(dev, ret, "invalid clock config\n");
 
-	/* external clock must be 24MHz, allow 1% tolerance */
-	if (ov7251->xclk_freq < 23760000 || ov7251->xclk_freq > 24240000) {
-		dev_err(dev, "external clock frequency %u is not supported\n",
-			ov7251->xclk_freq);
-		return -EINVAL;
-	}
+	clk_rate = clk_get_rate(ov7251->xclk);
+	ov7251->xclk_freq = clk_rate ? clk_rate : rate;
 
-	ret = clk_set_rate(ov7251->xclk, ov7251->xclk_freq);
-	if (ret) {
-		dev_err(dev, "could not set xclk frequency\n");
-		return ret;
+	if (ov7251->xclk_freq == 0)
+		return dev_err_probe(dev, -EINVAL, "invalid clock frequency\n");
+
+	if (!ret && ov7251->xclk) {
+		ret = clk_set_rate(ov7251->xclk, rate);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to set clock rate\n");
 	}
+
 	for (i = 0; i < ARRAY_SIZE(supported_xclk_rates); i++)
 		if (ov7251->xclk_freq == supported_xclk_rates[i])
 			break;
-- 
2.25.1

