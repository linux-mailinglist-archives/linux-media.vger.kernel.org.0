Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05ACF4C3A23
	for <lists+linux-media@lfdr.de>; Fri, 25 Feb 2022 01:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234390AbiBYAIy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 19:08:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231324AbiBYAIx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 19:08:53 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C004145AE1
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 16:08:22 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id r10so2049067wrp.3
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 16:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uzjSs4c+NZZGvcoWY4trqe+R7NwU6OMkmweVmrlNbRQ=;
        b=ZYuAfx8awsvnsqYzJQsnOG0FyVhlw7zLu3G4/AcpS8z+9cAgzsaxe1cS6uo1ueuJZo
         veTh940pKHswIIZVnjPpFUEqb/CikK3IeQfbo2J0re9VTjy/1t+60xs8LzmB2pOh8EWa
         Gy9Pp+YTfrLC99OgtbwfE6HsE9RzEqfw7oT8NcCZuqj1dLH2hiv5WFCy1zYgZ5UeYfAh
         2fQzat0Qls/7U/gB2Bgnpak1BNcvhFIT6uvSd/TvLnvix6CnxcTfEa8IRhCZoVTScGLq
         rjOQqpBB3WhcbiTLDuEcXQRzv+SVxvkvS9f+RHm3NLSZ5QJWWG44hQ2UUydZJvix8MFz
         pqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uzjSs4c+NZZGvcoWY4trqe+R7NwU6OMkmweVmrlNbRQ=;
        b=C6f0ck+BSn55dQSZusdC94dyWNhkIwLscwsLkk55aFlNSYbeuXddGZyKlWnFRqvLGy
         /Dw4lMPi8Uw/SWFBk7eQOP3cHyx0mXBpqQ/TD2Xwtd5tErWk62ujwhn+uQunnk1X26mw
         8vk+aG/3FZzOSaL04C5xFzvRo8kfRMnJr+AQdbiC8fJlckkUy7Umdcpw5CelJEVCvIsX
         whQXLz0xAgflP16fwj9VlrDZUMSbbzncRNfikEPwj9BSOLKZ0Lpc9ROc3zwR8Dql9MOy
         KU3ceUloiYpupfHL1/3+EpPL0+lWrduVeapzwA0TvKKgrlcAYSsRQo1H74tydNYvkg1e
         FDBw==
X-Gm-Message-State: AOAM532aVOCohLH7leVTJ+dYQ9ouRrFvJjh9W0k8EJylJVCOFhquMCk1
        e8PqJl8+o31r4g7Zc0Wwx01MMMcryjGV+Q==
X-Google-Smtp-Source: ABdhPJxJnyijLRMJ+kaco9cdJ1vu/V8//IO6Dgf3Ontim7m6Ud/mPFJh/YmVQachFgWxKj9fPCtZxg==
X-Received: by 2002:a5d:4528:0:b0:1ee:ea7f:b97d with SMTP id j8-20020a5d4528000000b001eeea7fb97dmr2467667wra.593.1645747700853;
        Thu, 24 Feb 2022 16:08:20 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id a3-20020adfe5c3000000b001e68a5e1c20sm742668wrn.4.2022.02.24.16.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 16:08:20 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v2 07/11] media: i2c: Add support for new frequencies to ov7251
Date:   Fri, 25 Feb 2022 00:07:49 +0000
Message-Id: <20220225000753.511996-8-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225000753.511996-1-djrscally@gmail.com>
References: <20220225000753.511996-1-djrscally@gmail.com>
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
Changes in v2:

	- Added support for 319.2MHz link frequency

 drivers/media/i2c/ov7251.c | 79 ++++++++++++++++++++++++++++++--------
 1 file changed, 63 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 4e88bbf4d828..d4843e797568 100644
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
+	.mipi_div = 0x05
+};
+
+static const struct ov7251_pll1_cfg ov7251_pll1_cfg_19_2_mhz_319_2_mhz = {
+	.pre_div = 0x01,
+	.mult = 0x85,
+	.div = 0x04,
+	.pix_div = 0x0a,
+	.mipi_div = 0x05
+};
+
 static const struct ov7251_pll1_cfg ov7251_pll1_cfg_24_mhz_240_mhz = {
 	.pre_div = 0x03,
 	.mult = 0x64,
@@ -155,6 +173,22 @@ static const struct ov7251_pll1_cfg ov7251_pll1_cfg_24_mhz_240_mhz = {
 	.mipi_div = 0x05
 };
 
+static const struct ov7251_pll1_cfg ov7251_pll1_cfg_24_mhz_319_2_mhz = {
+	.pre_div = 0x05,
+	.mult = 0x85,
+	.div = 0x02,
+	.pix_div = 0x0a,
+	.mipi_div = 0x05
+};
+
+static const struct ov7251_pll2_cfg ov7251_pll2_cfg_19_2_mhz = {
+	.pre_div = 0x04,
+	.mult = 0x32,
+	.div = 0x00,
+	.sys_div = 0x05,
+	.adc_div = 0x04
+};
+
 static const struct ov7251_pll2_cfg ov7251_pll2_cfg_24_mhz = {
 	.pre_div = 0x04,
 	.mult = 0x28,
@@ -163,14 +197,24 @@ static const struct ov7251_pll2_cfg ov7251_pll2_cfg_24_mhz = {
 	.adc_div = 0x04
 };
 
+static const struct ov7251_pll_cfgs ov7251_pll_cfgs_19_2_mhz = {
+	.pll2 = &ov7251_pll2_cfg_19_2_mhz,
+	.pll1 = {
+		[OV7251_LINK_FREQ_240_MHZ] = &ov7251_pll1_cfg_19_2_mhz_240_mhz,
+		[OV7251_LINK_FREQ_319_2_MHZ] = &ov7251_pll1_cfg_19_2_mhz_319_2_mhz,
+	}
+};
+
 static const struct ov7251_pll_cfgs ov7251_pll_cfgs_24_mhz = {
 	.pll2 = &ov7251_pll2_cfg_24_mhz,
 	.pll1 = {
 		[OV7251_LINK_FREQ_240_MHZ] = &ov7251_pll1_cfg_24_mhz_240_mhz,
+		[OV7251_LINK_FREQ_319_2_MHZ] = &ov7251_pll1_cfg_24_mhz_319_2_mhz,
 	}
 };
 
 static const struct ov7251_pll_cfgs *ov7251_pll_cfgs[] = {
+	[OV7251_19_2_MHZ] = &ov7251_pll_cfgs_19_2_mhz,
 	[OV7251_24_MHZ] = &ov7251_pll_cfgs_24_mhz
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
@@ -1400,6 +1447,7 @@ static int ov7251_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct ov7251 *ov7251;
 	u8 chip_id_high, chip_id_low, chip_rev;
+	unsigned int rate = 0;
 	s64 pixel_rate;
 	int ret;
 	int i;
@@ -1416,31 +1464,30 @@ static int ov7251_probe(struct i2c_client *client)
 		return ret;
 
 	/* get system clock (xclk) */
-	ov7251->xclk = devm_clk_get(dev, "xclk");
+	ov7251->xclk = devm_clk_get(dev, NULL);
 	if (IS_ERR(ov7251->xclk)) {
 		dev_err(dev, "could not get xclk");
 		return PTR_ERR(ov7251->xclk);
 	}
 
+	/*
+	 * We could have either a 24MHz or 19.2MHz clock rate from either dt or
+	 * ACPI. We also need to support the IPU3 case which will have both an
+	 * external clock AND a clock-frequency property.
+	 */
 	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
-				       &ov7251->xclk_freq);
-	if (ret) {
-		dev_err(dev, "could not get xclk frequency\n");
-		return ret;
+				       &rate);
+	if (!ret && ov7251->xclk) {
+		ret = clk_set_rate(ov7251->xclk, rate);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to set clock rate\n");
+	} else if (ret && !ov7251->xclk) {
+		return dev_err_probe(dev, ret, "invalid clock config\n");
 	}
 
-	/* external clock must be 24MHz, allow 1% tolerance */
-	if (ov7251->xclk_freq < 23760000 || ov7251->xclk_freq > 24240000) {
-		dev_err(dev, "external clock frequency %u is not supported\n",
-			ov7251->xclk_freq);
-		return -EINVAL;
-	}
+	ov7251->xclk_freq = rate ? rate : clk_get_rate(ov7251->xclk);
 
-	ret = clk_set_rate(ov7251->xclk, ov7251->xclk_freq);
-	if (ret) {
-		dev_err(dev, "could not set xclk frequency\n");
-		return ret;
-	}
 	for (i = 0; i < ARRAY_SIZE(supported_xclk_rates); i++)
 		if (ov7251->xclk_freq == supported_xclk_rates[i])
 			break;
-- 
2.25.1

