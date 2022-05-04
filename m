Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A824B51B1E7
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 00:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378995AbiEDWea (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 18:34:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379016AbiEDWe1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 18:34:27 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFC2A2DA86
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 15:30:47 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id n126-20020a1c2784000000b0038e8af3e788so1644613wmn.1
        for <linux-media@vger.kernel.org>; Wed, 04 May 2022 15:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pDvejTzpJvwXHbktCuIlyOmoW2YWSNPSBMElVA5ikBA=;
        b=DflcTHz9MVTv8BfxTKuGBP2dvOY6sASDYBzRhwr53i+M8AgojsumxBTvxZulnp5stZ
         dgYutaj3wLPPMHICCr9S5l0YEt273YE7S1vESE8E//bnNvNPbAtj5zXIYwC4mPrLNlvU
         th1NOxqB4Sd3YMiZQyNSoKiuVLVk8oX3mAzmu1OwHf1u1WfFyfMfpLRcXOEOejK0HJFd
         hTQD4BKZPc1opyRTi9vCUnMHjWfaK0fdCnfkBhmHKJemCfEJjOMJy3hUM5sdSUZrJEHJ
         wgfdzvRZfl6HA4MvEmNCMk1iL1t4ZzjzaSyhA7sOUSTc+YefssyS+5Ayd5cc66nyDGzg
         QXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pDvejTzpJvwXHbktCuIlyOmoW2YWSNPSBMElVA5ikBA=;
        b=EG0VHUh6vEL0u3H7SqObIyHGhJmPNaEu178UH+ASY3zfB4kyXJdcTWDA6Vzb3A7Ihz
         fsRUqlWlurVMVloLoRaa5gfsUXc0pyItgdAHS1Ic0HkoQ2Pz8KPMbZ1lcSXD1JZ7ZGZE
         Vdbjwu3Uplrju/RQIf3ZYKCOVH78zTap8I9OwXN846uPSleEUnk8+miUWlNk+o7BsKSi
         B2kx/HLJx0x4/QNsF4IXR/Rv7SNV9GcAANE/Tk8SbO1rNvy/N1DUHhidJmeU9v2yxBmC
         gkvWJjkRbbJv5piaNEtZSenoEawssoRgpT7u3AfSH1wICHT6sG76REWXdqq4iiLGm/iD
         MJIw==
X-Gm-Message-State: AOAM533BkP4Y5QIR6fFWDHaFX+TN4/S1QIz1/fGOZvP3N6c0V24ePD99
        rV73cAnWqEf9pwkLBRbSIAr8EWNuu6A=
X-Google-Smtp-Source: ABdhPJw1bsVfn4g8ueacMlzYuQGO4JPQoWj4monLf/cR65NS8gF5CqAa1r4S3eOxloTRvCSAV7PRgA==
X-Received: by 2002:a7b:c10d:0:b0:393:fbff:24a9 with SMTP id w13-20020a7bc10d000000b00393fbff24a9mr1438734wmi.53.1651703446320;
        Wed, 04 May 2022 15:30:46 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id h29-20020adfaa9d000000b0020c5253d913sm12501442wrc.95.2022.05.04.15.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 15:30:45 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v3 06/15] media: i2c: Add ov7251_pll_configure()
Date:   Wed,  4 May 2022 23:30:18 +0100
Message-Id: <20220504223027.3480287-7-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504223027.3480287-1-djrscally@gmail.com>
References: <20220504223027.3480287-1-djrscally@gmail.com>
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

Rather than having the pll settings hidden inside mode blobs, define
them in structs and use a dedicated function to set them. This makes
it simpler to extend the driver to support other frequencies for both
the external clock and desired link frequency.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:

	- Added commas to last items in arrays (Andy)

Changes in v2:

	- Updated to support different link-frequencies in addition to different
	external clock frequencies.

 drivers/media/i2c/ov7251.c | 175 ++++++++++++++++++++++++++++++-------
 1 file changed, 145 insertions(+), 30 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index f21119064b2d..3440077e8ba9 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -42,6 +42,16 @@
 #define OV7251_TIMING_FORMAT2_MIRROR	BIT(2)
 #define OV7251_PRE_ISP_00		0x5e00
 #define OV7251_PRE_ISP_00_TEST_PATTERN	BIT(7)
+#define OV7251_PLL1_PRE_DIV_REG		0x30b4
+#define OV7251_PLL1_MULT_REG		0x30b3
+#define OV7251_PLL1_DIVIDER_REG		0x30b1
+#define OV7251_PLL1_PIX_DIV_REG		0x30b0
+#define OV7251_PLL1_MIPI_DIV_REG	0x30b5
+#define OV7251_PLL2_PRE_DIV_REG		0x3098
+#define OV7251_PLL2_MULT_REG		0x3099
+#define OV7251_PLL2_DIVIDER_REG		0x309d
+#define OV7251_PLL2_SYS_DIV_REG		0x309a
+#define OV7251_PLL2_ADC_DIV_REG		0x309b
 
 struct reg_value {
 	u16 reg;
@@ -60,6 +70,36 @@ struct ov7251_mode_info {
 	struct v4l2_fract timeperframe;
 };
 
+struct ov7251_pll1_cfg {
+	unsigned int pre_div;
+	unsigned int mult;
+	unsigned int div;
+	unsigned int pix_div;
+	unsigned int mipi_div;
+};
+
+struct ov7251_pll2_cfg {
+	unsigned int pre_div;
+	unsigned int mult;
+	unsigned int div;
+	unsigned int sys_div;
+	unsigned int adc_div;
+};
+
+/*
+ * Rubbish ordering, but only PLL1 needs to have a separate configuration per
+ * link frequency and the array member needs to be last.
+ */
+struct ov7251_pll_cfgs {
+	const struct ov7251_pll2_cfg *pll2;
+	const struct ov7251_pll1_cfg *pll1[];
+};
+
+enum xclk_rate {
+	OV7251_24_MHZ,
+	OV7251_NUM_SUPPORTED_RATES
+};
+
 enum supported_link_freqs {
 	OV7251_LINK_FREQ_240_MHZ,
 	OV7251_NUM_SUPPORTED_LINK_FREQS
@@ -80,6 +120,7 @@ struct ov7251 {
 	struct regulator *core_regulator;
 	struct regulator *analog_regulator;
 
+	const struct ov7251_pll_cfgs *pll_cfgs;
 	enum supported_link_freqs link_freq_idx;
 	const struct ov7251_mode_info *current_mode;
 
@@ -106,6 +147,33 @@ static inline struct ov7251 *to_ov7251(struct v4l2_subdev *sd)
 	return container_of(sd, struct ov7251, sd);
 }
 
+static const struct ov7251_pll1_cfg ov7251_pll1_cfg_24_mhz_240_mhz = {
+	.pre_div = 0x03,
+	.mult = 0x64,
+	.div = 0x01,
+	.pix_div = 0x0a,
+	.mipi_div = 0x05,
+};
+
+static const struct ov7251_pll2_cfg ov7251_pll2_cfg_24_mhz = {
+	.pre_div = 0x04,
+	.mult = 0x28,
+	.div = 0x00,
+	.sys_div = 0x05,
+	.adc_div = 0x04,
+};
+
+static const struct ov7251_pll_cfgs ov7251_pll_cfgs_24_mhz = {
+	.pll2 = &ov7251_pll2_cfg_24_mhz,
+	.pll1 = {
+		[OV7251_LINK_FREQ_240_MHZ] = &ov7251_pll1_cfg_24_mhz_240_mhz,
+	},
+};
+
+static const struct ov7251_pll_cfgs *ov7251_pll_cfgs[] = {
+	[OV7251_24_MHZ] = &ov7251_pll_cfgs_24_mhz,
+};
+
 static const struct reg_value ov7251_global_init_setting[] = {
 	{ 0x0103, 0x01 },
 	{ 0x303b, 0x02 },
@@ -124,16 +192,6 @@ static const struct reg_value ov7251_setting_vga_30fps[] = {
 	{ 0x301c, 0xf0 },
 	{ 0x3023, 0x05 },
 	{ 0x3037, 0xf0 },
-	{ 0x3098, 0x04 }, /* pll2 pre divider */
-	{ 0x3099, 0x28 }, /* pll2 multiplier */
-	{ 0x309a, 0x05 }, /* pll2 sys divider */
-	{ 0x309b, 0x04 }, /* pll2 adc divider */
-	{ 0x309d, 0x00 }, /* pll2 divider */
-	{ 0x30b0, 0x0a }, /* pll1 pix divider */
-	{ 0x30b1, 0x01 }, /* pll1 divider */
-	{ 0x30b3, 0x64 }, /* pll1 multiplier */
-	{ 0x30b4, 0x03 }, /* pll1 pre divider */
-	{ 0x30b5, 0x05 }, /* pll1 mipi divider */
 	{ 0x3106, 0xda },
 	{ 0x3503, 0x07 },
 	{ 0x3509, 0x10 },
@@ -262,16 +320,6 @@ static const struct reg_value ov7251_setting_vga_60fps[] = {
 	{ 0x301c, 0x00 },
 	{ 0x3023, 0x05 },
 	{ 0x3037, 0xf0 },
-	{ 0x3098, 0x04 }, /* pll2 pre divider */
-	{ 0x3099, 0x28 }, /* pll2 multiplier */
-	{ 0x309a, 0x05 }, /* pll2 sys divider */
-	{ 0x309b, 0x04 }, /* pll2 adc divider */
-	{ 0x309d, 0x00 }, /* pll2 divider */
-	{ 0x30b0, 0x0a }, /* pll1 pix divider */
-	{ 0x30b1, 0x01 }, /* pll1 divider */
-	{ 0x30b3, 0x64 }, /* pll1 multiplier */
-	{ 0x30b4, 0x03 }, /* pll1 pre divider */
-	{ 0x30b5, 0x05 }, /* pll1 mipi divider */
 	{ 0x3106, 0xda },
 	{ 0x3503, 0x07 },
 	{ 0x3509, 0x10 },
@@ -400,16 +448,6 @@ static const struct reg_value ov7251_setting_vga_90fps[] = {
 	{ 0x301c, 0x00 },
 	{ 0x3023, 0x05 },
 	{ 0x3037, 0xf0 },
-	{ 0x3098, 0x04 }, /* pll2 pre divider */
-	{ 0x3099, 0x28 }, /* pll2 multiplier */
-	{ 0x309a, 0x05 }, /* pll2 sys divider */
-	{ 0x309b, 0x04 }, /* pll2 adc divider */
-	{ 0x309d, 0x00 }, /* pll2 divider */
-	{ 0x30b0, 0x0a }, /* pll1 pix divider */
-	{ 0x30b1, 0x01 }, /* pll1 divider */
-	{ 0x30b3, 0x64 }, /* pll1 multiplier */
-	{ 0x30b4, 0x03 }, /* pll1 pre divider */
-	{ 0x30b5, 0x05 }, /* pll1 mipi divider */
 	{ 0x3106, 0xda },
 	{ 0x3503, 0x07 },
 	{ 0x3509, 0x10 },
@@ -525,6 +563,10 @@ static const struct reg_value ov7251_setting_vga_90fps[] = {
 	{ 0x5001, 0x80 },
 };
 
+static const unsigned long supported_xclk_rates[] = {
+	[OV7251_24_MHZ] = 24000000,
+};
+
 static const s64 link_freq[] = {
 	[OV7251_LINK_FREQ_240_MHZ] = 240000000,
 };
@@ -696,6 +738,63 @@ static int ov7251_read_reg(struct ov7251 *ov7251, u16 reg, u8 *val)
 	return 0;
 }
 
+static int ov7251_pll_configure(struct ov7251 *ov7251)
+{
+	const struct ov7251_pll_cfgs *configs;
+	int ret;
+
+	configs = ov7251->pll_cfgs;
+
+	ret = ov7251_write_reg(ov7251, OV7251_PLL1_PRE_DIV_REG,
+			       configs->pll1[ov7251->link_freq_idx]->pre_div);
+	if (ret < 0)
+		return ret;
+
+	ret = ov7251_write_reg(ov7251, OV7251_PLL1_MULT_REG,
+			       configs->pll1[ov7251->link_freq_idx]->mult);
+	if (ret < 0)
+		return ret;
+	ret = ov7251_write_reg(ov7251, OV7251_PLL1_DIVIDER_REG,
+			       configs->pll1[ov7251->link_freq_idx]->div);
+	if (ret < 0)
+		return ret;
+
+	ret = ov7251_write_reg(ov7251, OV7251_PLL1_PIX_DIV_REG,
+			       configs->pll1[ov7251->link_freq_idx]->pix_div);
+	if (ret < 0)
+		return ret;
+
+	ret = ov7251_write_reg(ov7251, OV7251_PLL1_MIPI_DIV_REG,
+			       configs->pll1[ov7251->link_freq_idx]->mipi_div);
+	if (ret < 0)
+		return ret;
+
+	ret = ov7251_write_reg(ov7251, OV7251_PLL2_PRE_DIV_REG,
+			       configs->pll2->pre_div);
+	if (ret < 0)
+		return ret;
+
+	ret = ov7251_write_reg(ov7251, OV7251_PLL2_MULT_REG,
+			       configs->pll2->mult);
+	if (ret < 0)
+		return ret;
+
+	ret = ov7251_write_reg(ov7251, OV7251_PLL2_DIVIDER_REG,
+			       configs->pll2->div);
+	if (ret < 0)
+		return ret;
+
+	ret = ov7251_write_reg(ov7251, OV7251_PLL2_SYS_DIV_REG,
+			       configs->pll2->sys_div);
+	if (ret < 0)
+		return ret;
+
+	ret = ov7251_write_reg(ov7251, OV7251_PLL2_ADC_DIV_REG,
+			       configs->pll2->adc_div);
+
+	return ret;
+}
+
 static int ov7251_set_exposure(struct ov7251 *ov7251, s32 exposure)
 {
 	u16 reg;
@@ -1137,6 +1236,11 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
 	mutex_lock(&ov7251->lock);
 
 	if (enable) {
+		ret = ov7251_pll_configure(ov7251);
+		if (ret)
+			return dev_err_probe(ov7251->dev, ret,
+					     "error configuring PLLs\n");
+
 		ret = ov7251_set_register_array(ov7251,
 					ov7251->current_mode->data,
 					ov7251->current_mode->data_size);
@@ -1297,6 +1401,7 @@ static int ov7251_probe(struct i2c_client *client)
 	u8 chip_id_high, chip_id_low, chip_rev;
 	s64 pixel_rate;
 	int ret;
+	int i;
 
 	ov7251 = devm_kzalloc(dev, sizeof(struct ov7251), GFP_KERNEL);
 	if (!ov7251)
@@ -1335,6 +1440,16 @@ static int ov7251_probe(struct i2c_client *client)
 		dev_err(dev, "could not set xclk frequency\n");
 		return ret;
 	}
+	for (i = 0; i < ARRAY_SIZE(supported_xclk_rates); i++)
+		if (ov7251->xclk_freq == supported_xclk_rates[i])
+			break;
+
+	if (i == ARRAY_SIZE(supported_xclk_rates))
+		return dev_err_probe(dev, -EINVAL,
+				     "clock rate %u Hz is unsupported\n",
+				     ov7251->xclk_freq);
+
+	ov7251->pll_cfgs = ov7251_pll_cfgs[i];
 
 	ov7251->io_regulator = devm_regulator_get(dev, "vdddo");
 	if (IS_ERR(ov7251->io_regulator)) {
-- 
2.25.1

