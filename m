Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1171A5751F
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 01:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbfFZX52 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 19:57:28 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:34500 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbfFZX52 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 19:57:28 -0400
Received: by mail-qk1-f195.google.com with SMTP id t8so243050qkt.1
        for <linux-media@vger.kernel.org>; Wed, 26 Jun 2019 16:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DEEJulwShIfTQ+jCi5R2D2uGALf51jPgHwPrnLE1F10=;
        b=Q30cLD2Fz3Gt2oBk6F2pFrGeDwGcH4kjINk3fRX6dRVbvQZ+pkx0AcUInfwoSnFzgl
         l6CCtqV4oYvUzF1ZrFKE/UfCODeT7ibbcdPTnz95HQUlmgf8CHGQGI55uowUrStoZFoY
         T2gZmUSMYQyy6qsvD5GPqIxikQ3rL9bF9ZBgEM3BhAVUx3WxvKQICXxZfiq/SIg0AIUk
         Qa0isbgqHOpByfeHsWPPx335Mux8s3A8bgja0v03VkKrgnPBP4yRVPhzuvq8mw/DpeUE
         i8ZQsaexUM/jIAq5roRe5PKpMRVvBaF2SlnVvY/CmSFRqg455cIbRLU/T6a83QGCSUiR
         md9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DEEJulwShIfTQ+jCi5R2D2uGALf51jPgHwPrnLE1F10=;
        b=d1KVrYCHPAJDYmgtGtg6PGQduvQCWtzhuY+iU97i3RhcYrzPNvAVgwj7sbILOnCmqA
         6jbMOoDae375+0f88oKlKouKpKb4unpt4qBOtqhHqUFoQP8+VkuAY25hoT26gsskAE3g
         tmbxOUwUZwGH1HS+hkAPDUw10EBroCWJqWlxTN0t1yGs93TQCph8Qoo1XF2Hw6nXuTdT
         jLHZRsKGGVi7spwMCDam9k0gmKbHSjEEBg+IEn71DX4hAKoX2SS9LcAxQexVztNc0auu
         G/zHgjF6MIhen8q8tE1hLjvIIYp2Bejhq5pkhzZ/8wMYFa6E6GL8u+dBkWEHHp/6NjSK
         C/Hg==
X-Gm-Message-State: APjAAAV68VBcNSJ2LF5k/FwDd4Esxlgt7z7Xofi1r150AxNL+H/xd3Oa
        BnSFH8W68kHdq/da5/AbNtA=
X-Google-Smtp-Source: APXvYqzY2P9TMJwyhGdcu0CsP0y5n+urVHKPikS6j7/de+duDXBwr8Si/qIfXZILA3V7yTXxGW6F4w==
X-Received: by 2002:a37:83c4:: with SMTP id f187mr709876qkd.380.1561593446763;
        Wed, 26 Jun 2019 16:57:26 -0700 (PDT)
Received: from fabio-Latitude-E5450.am.freescale.net ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id w16sm264022qtc.41.2019.06.26.16.57.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 16:57:26 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     mchehab@kernel.org
Cc:     hverkuil-cisco@xs4all.nl, todor.tomov@linaro.org,
        ezequiel@collabora.com, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] media: ov5645: Use regulator_bulk() functions
Date:   Wed, 26 Jun 2019 20:56:14 -0300
Message-Id: <20190626235614.26587-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190626235614.26587-1-festevam@gmail.com>
References: <20190626235614.26587-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The code can be simplified by using the regulator_bulk() functions,
so switch to it.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/media/i2c/ov5645.c | 94 +++++++++-----------------------------
 1 file changed, 21 insertions(+), 73 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 4e302dc15177..a37ae5d5ff12 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -58,6 +58,15 @@
 #define OV5645_SDE_SAT_U		0x5583
 #define OV5645_SDE_SAT_V		0x5584
 
+/* regulator supplies */
+static const char * const ov5645_supply_name[] = {
+	"vdddo", /* Digital I/O (1.8V) supply */
+	"vddd",  /* Digital Core (1.5V) supply */
+	"vdda",  /* Analog (2.8V) supply */
+};
+
+#define OV5645_NUM_SUPPLIES ARRAY_SIZE(ov5645_supply_name)
+
 struct reg_value {
 	u16 reg;
 	u8 val;
@@ -82,9 +91,7 @@ struct ov5645 {
 	struct v4l2_rect crop;
 	struct clk *xclk;
 
-	struct regulator *io_regulator;
-	struct regulator *core_regulator;
-	struct regulator *analog_regulator;
+	struct regulator_bulk_data supplies[OV5645_NUM_SUPPLIES];
 
 	const struct ov5645_mode_info *current_mode;
 
@@ -529,55 +536,6 @@ static const struct ov5645_mode_info ov5645_mode_info_data[] = {
 	},
 };
 
-static int ov5645_regulators_enable(struct ov5645 *ov5645)
-{
-	int ret;
-
-	ret = regulator_enable(ov5645->io_regulator);
-	if (ret < 0) {
-		dev_err(ov5645->dev, "set io voltage failed\n");
-		return ret;
-	}
-
-	ret = regulator_enable(ov5645->analog_regulator);
-	if (ret) {
-		dev_err(ov5645->dev, "set analog voltage failed\n");
-		goto err_disable_io;
-	}
-
-	ret = regulator_enable(ov5645->core_regulator);
-	if (ret) {
-		dev_err(ov5645->dev, "set core voltage failed\n");
-		goto err_disable_analog;
-	}
-
-	return 0;
-
-err_disable_analog:
-	regulator_disable(ov5645->analog_regulator);
-err_disable_io:
-	regulator_disable(ov5645->io_regulator);
-
-	return ret;
-}
-
-static void ov5645_regulators_disable(struct ov5645 *ov5645)
-{
-	int ret;
-
-	ret = regulator_disable(ov5645->core_regulator);
-	if (ret < 0)
-		dev_err(ov5645->dev, "core regulator disable failed\n");
-
-	ret = regulator_disable(ov5645->analog_regulator);
-	if (ret < 0)
-		dev_err(ov5645->dev, "analog regulator disable failed\n");
-
-	ret = regulator_disable(ov5645->io_regulator);
-	if (ret < 0)
-		dev_err(ov5645->dev, "io regulator disable failed\n");
-}
-
 static int ov5645_write_reg(struct ov5645 *ov5645, u16 reg, u8 val)
 {
 	u8 regbuf[3];
@@ -676,15 +634,14 @@ static int ov5645_set_power_on(struct ov5645 *ov5645)
 {
 	int ret;
 
-	ret = ov5645_regulators_enable(ov5645);
-	if (ret < 0) {
+	ret = regulator_bulk_enable(OV5645_NUM_SUPPLIES, ov5645->supplies);
+	if (ret < 0)
 		return ret;
-	}
 
 	ret = clk_prepare_enable(ov5645->xclk);
 	if (ret < 0) {
 		dev_err(ov5645->dev, "clk prepare enable failed\n");
-		ov5645_regulators_disable(ov5645);
+		regulator_bulk_disable(OV5645_NUM_SUPPLIES, ov5645->supplies);
 		return ret;
 	}
 
@@ -704,7 +661,7 @@ static void ov5645_set_power_off(struct ov5645 *ov5645)
 	gpiod_set_value_cansleep(ov5645->rst_gpio, 1);
 	gpiod_set_value_cansleep(ov5645->enable_gpio, 0);
 	clk_disable_unprepare(ov5645->xclk);
-	ov5645_regulators_disable(ov5645);
+	regulator_bulk_disable(OV5645_NUM_SUPPLIES, ov5645->supplies);
 }
 
 static int ov5645_s_power(struct v4l2_subdev *sd, int on)
@@ -1089,6 +1046,7 @@ static int ov5645_probe(struct i2c_client *client,
 	struct device_node *endpoint;
 	struct ov5645 *ov5645;
 	u8 chip_id_high, chip_id_low;
+	unsigned int i;
 	u32 xclk_freq;
 	int ret;
 
@@ -1146,23 +1104,13 @@ static int ov5645_probe(struct i2c_client *client,
 		return ret;
 	}
 
-	ov5645->io_regulator = devm_regulator_get(dev, "vdddo");
-	if (IS_ERR(ov5645->io_regulator)) {
-		dev_err(dev, "cannot get io regulator\n");
-		return PTR_ERR(ov5645->io_regulator);
-	}
-
-	ov5645->core_regulator = devm_regulator_get(dev, "vddd");
-	if (IS_ERR(ov5645->core_regulator)) {
-		dev_err(dev, "cannot get core regulator\n");
-		return PTR_ERR(ov5645->core_regulator);
-	}
+	for (i = 0; i < OV5645_NUM_SUPPLIES; i++)
+		ov5645->supplies[i].supply = ov5645_supply_name[i];
 
-	ov5645->analog_regulator = devm_regulator_get(dev, "vdda");
-	if (IS_ERR(ov5645->analog_regulator)) {
-		dev_err(dev, "cannot get analog regulator\n");
-		return PTR_ERR(ov5645->analog_regulator);
-	}
+	ret = devm_regulator_bulk_get(dev, OV5645_NUM_SUPPLIES,
+				      ov5645->supplies);
+	if (ret < 0)
+		return ret;
 
 	ov5645->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
 	if (IS_ERR(ov5645->enable_gpio)) {
-- 
2.17.1

