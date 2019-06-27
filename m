Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89845589CD
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 20:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbfF0SWq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 14:22:46 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:43237 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbfF0SWq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 14:22:46 -0400
Received: by mail-qt1-f193.google.com with SMTP id w17so3488751qto.10
        for <linux-media@vger.kernel.org>; Thu, 27 Jun 2019 11:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vyQ6D0JdHOQKvn/W+MpALf6jQe/PU9B7lS9uUNLezSs=;
        b=uK/Pa4MSQ22p1jjgCAn8SUBYYQQd3GfHFSLoj818MmjC5u+VCoLHWVURN/LiZ+lZTx
         KPDeo1o9qKZd+64ntdiRMQ+Y1wvsJ+4e6/16HqUpAQE2pmh6PWtRMEcV47FOAz7Ku7Uw
         3T6JUiasGTcuEnf9Z210PoPHy1SRqY0fu/PuRhpgbZRFi+tYmfCOvXLvpMsmQ0AfJzuT
         Kcv+470pDH+zxxhm81kKf+g1p0MrRMqgT5Osi2PIJ/78DlF4On7oQ7rLispW6mRYfvCQ
         3Kma1wZ5+e93oBr5oGVG6Q0r5+d8mXwXbhfCjpkgO9fWLPiZJzQawM93wrBM0llE0vxS
         il5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vyQ6D0JdHOQKvn/W+MpALf6jQe/PU9B7lS9uUNLezSs=;
        b=tYUnbXkPGgH0RYIvRO65WyK6fiOl++bSY9BvVajjVFvAfihe/58LouBKwN+f0NRpfh
         FEWwv++KTCYTTdchdLSBPN5CC4Y+S19hFrVsZx+y1T77EuNihqRWfEGYNX+ZUlXPMqkI
         Mrg5WFbSYs/vHRdGSfzPRuzHDenLBYihLSOoHY143dly2SxXQvjmANOyhAkuRLPjUNot
         g25eGXtvSQycXTepgPkwDnikHFImsvUKyO1fz07H6ffrHArbLeV152FH0XVVVOJ7ZxoM
         DC/HcOW0HfuI7jdRCNT24mHUgS+Jy73loF3WAVlW/QYNi+t1KD7fcJc6EUZs6XZEVcKh
         SOFw==
X-Gm-Message-State: APjAAAV0ayQkCes+CInGlj48/SOk5adjymErugE62uta+pW/dRlE/oaK
        aeCal1WyDmB9/ZsPZdVezPo=
X-Google-Smtp-Source: APXvYqzYgB7fHzeFLnPaPWp/wRabVPCNWLsWT4a7VDo/IHteW5rFBHV+cMHUSN7c8mAMbGJfrB6mSg==
X-Received: by 2002:ac8:3098:: with SMTP id v24mr4287554qta.47.1561659765068;
        Thu, 27 Jun 2019 11:22:45 -0700 (PDT)
Received: from fabio-Latitude-E5450.am.freescale.net ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id 5sm1362170qkr.68.2019.06.27.11.22.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 11:22:44 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     sakari.ailus@iki.fi
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        todor.tomov@linaro.org, ezequiel@collabora.com,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 2/2] media: ov5645: Use regulator_bulk() functions
Date:   Thu, 27 Jun 2019 15:22:31 -0300
Message-Id: <20190627182231.11125-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190627182231.11125-1-festevam@gmail.com>
References: <20190627182231.11125-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The code can be simplified by using the regulator_bulk() functions,
so switch to it.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Retain the regulator enable ordering (Sakari)

 drivers/media/i2c/ov5645.c | 94 +++++++++-----------------------------
 1 file changed, 21 insertions(+), 73 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 4e302dc15177..9602b9201b3e 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -58,6 +58,15 @@
 #define OV5645_SDE_SAT_U		0x5583
 #define OV5645_SDE_SAT_V		0x5584
 
+/* regulator supplies */
+static const char * const ov5645_supply_name[] = {
+	"vdddo", /* Digital I/O (1.8V) supply */
+	"vdda",  /* Analog (2.8V) supply */
+	"vddd",  /* Digital Core (1.5V) supply */
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

