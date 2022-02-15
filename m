Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4142D4B7B02
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 00:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243391AbiBOXIJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 18:08:09 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241021AbiBOXII (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 18:08:08 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 777447673
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 15:07:57 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id k1so496691wrd.8
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 15:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MxqhPZOXPwbXKo4y5/HVVtSgWtZWBVp/Awnv44fZ+28=;
        b=PFjGE5cUjTAsyq8sEP1qsdQ4fQXio8XK8/mFZDCcSUPrnh+yjxkLr22NjqN1HGZtQx
         BRwHCYUYBK76JebNMUrpebFy16orqK083VypJC2cWUSeoqlC3aFnInKtpJctWmuVnNIz
         jdTuUqQfLoOHcdNVh47JQjGXsE3mMq79kXV4i2WH9NyrhLwPC+sXxTRiqFCMCA/5y7GY
         BFtgPJ7wOeizdfrbYfnOdm6zbRhYdZ1mUB5nCi5KDPuSTMVSoP8ps8LHvSOf+IzZbmrI
         /ZIzRR4W7wYqjNvIYicg5CwpOxKuNi3Lb+PUjrSXwBojEUqFNmsl0Xnlgyu7pEMU9LAw
         xdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MxqhPZOXPwbXKo4y5/HVVtSgWtZWBVp/Awnv44fZ+28=;
        b=aO82fUaPPTasMVLnWterL+S8Z5LP3GuJ/1n97M0fh8TaV+bIbBKZtsKDq+mKquzf+Q
         Pzca+wot7XFHa/BaVF4R+qAxWXDRzI2MlqxUy97/UXzNqinYhqEk+f90eMDePQ4LDUV9
         06L1auhstGl50HeAcPnJaiF4Qin4+Y4ogxgy50AjHD5dG1VT4TIBYLaB8OHxHpjP+sHT
         /yS0b3heJwEqNY1vOYpvfe6/gl/4DcUBeK/fZmUGrzmdL4gm7/rtxnNNsx8vPqI8D6Xt
         ib0D111mALtrJK+Wo2Rd3+rUE028k3SqwEAWVdTRw7xPLWENJJCyBj4LpeZUd2MaAevF
         9r8A==
X-Gm-Message-State: AOAM533fpoR/DDUPqF7+fHcgSOyzjdPxiisX3mjDcEc5RLuZsqkZ6TEC
        ynFJpztfMZ0N9ygukCWPnxcFTiJCvBYmqg==
X-Google-Smtp-Source: ABdhPJy4KpPSuRhrlepnXjBl5FtwQ5s8pBBO9n2tpCCUtD/xzSlYmazEGmHMmUFsb8XEV6aFol9eRg==
X-Received: by 2002:adf:cf12:0:b0:1e3:25ac:7b25 with SMTP id o18-20020adfcf12000000b001e325ac7b25mr201603wrj.196.1644966476082;
        Tue, 15 Feb 2022 15:07:56 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id w18sm16956590wrl.62.2022.02.15.15.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 15:07:55 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH 06/10] media: i2c: Add support for 19.2MHz clock to ov7251
Date:   Tue, 15 Feb 2022 23:07:33 +0000
Message-Id: <20220215230737.1870630-7-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220215230737.1870630-1-djrscally@gmail.com>
References: <20220215230737.1870630-1-djrscally@gmail.com>
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
Surface line of tablets; this provides a 19.2MHz external clock. Add
the ability to support that rate to the driver by defining a new set
of PLL configs. Extend the clock handling in .probe() to check for
either supported frequency.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/i2c/ov7251.c | 61 ++++++++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 809450b5a99a..92605ecdfaa4 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -134,10 +134,19 @@ static inline struct ov7251 *to_ov7251(struct v4l2_subdev *sd)
 }
 
 enum xclk_rate {
+	OV7251_19_2_MHZ,
 	OV7251_24_MHZ,
 	OV7251_NUM_SUPPORTED_RATES
 };
 
+static const struct ov7251_pll1_config ov7251_pll1_config_19_2_mhz = {
+	.pre_div = 0x03,
+	.mult = 0x4b,
+	.div = 0x01,
+	.pix_div = 0x0a,
+	.mipi_div = 0x05
+};
+
 static const struct ov7251_pll1_config ov7251_pll1_config_24_mhz = {
 	.pre_div = 0x03,
 	.mult = 0x64,
@@ -146,6 +155,14 @@ static const struct ov7251_pll1_config ov7251_pll1_config_24_mhz = {
 	.mipi_div = 0x05
 };
 
+static const struct ov7251_pll2_config ov7251_pll2_config_19_2_mhz = {
+	.pre_div = 0x04,
+	.mult = 0x32,
+	.div = 0x00,
+	.sys_div = 0x05,
+	.adc_div = 0x04
+};
+
 static const struct ov7251_pll2_config ov7251_pll2_config_24_mhz = {
 	.pre_div = 0x04,
 	.mult = 0x28,
@@ -154,12 +171,18 @@ static const struct ov7251_pll2_config ov7251_pll2_config_24_mhz = {
 	.adc_div = 0x04
 };
 
+static const struct ov7251_pll_configs ov7251_pll_configs_19_2_mhz = {
+	.pll1 = &ov7251_pll1_config_19_2_mhz,
+	.pll2 = &ov7251_pll2_config_19_2_mhz
+};
+
 static const struct ov7251_pll_configs ov7251_pll_configs_24_mhz = {
 	.pll1 = &ov7251_pll1_config_24_mhz,
 	.pll2 = &ov7251_pll2_config_24_mhz
 };
 
 static const struct ov7251_pll_configs *ov7251_pll_configs[] = {
+	[OV7251_19_2_MHZ] = &ov7251_pll_configs_19_2_mhz,
 	[OV7251_24_MHZ] = &ov7251_pll_configs_24_mhz
 };
 
@@ -553,6 +576,7 @@ static const struct reg_value ov7251_setting_vga_90fps[] = {
 };
 
 static const unsigned long supported_xclk_rates[] = {
+	[OV7251_19_2_MHZ] = 19200000,
 	[OV7251_24_MHZ] = 24000000,
 };
 
@@ -1423,6 +1447,7 @@ static int ov7251_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct ov7251 *ov7251;
 	u8 chip_id_high, chip_id_low, chip_rev;
+	unsigned int rate = 0;
 	int ret;
 	int i;
 
@@ -1438,35 +1463,39 @@ static int ov7251_probe(struct i2c_client *client)
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
 
+	if (i == ARRAY_SIZE(supported_xclk_rates))
+		return dev_err_probe(dev, -EINVAL,
+				     "clock rate %u Hz is unsupported\n",
+				     ov7251->xclk_freq);
+
 	ov7251->pll_configs = ov7251_pll_configs[i];
 
 	ov7251->io_regulator = devm_regulator_get(dev, "vdddo");
-- 
2.25.1

