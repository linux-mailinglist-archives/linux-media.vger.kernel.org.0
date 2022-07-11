Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0E8D5604A8
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 17:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234282AbiF2P34 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 11:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234238AbiF2P3v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 11:29:51 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A30731349
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 08:29:47 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id lw20so33377623ejb.4
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 08:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l2qHBG28ZF/0BqgZtfUZ2wwyoD54f6fad9bi6YF6qP8=;
        b=FRoTeRJqWCXMpSSGoW1bC/hsa/32en5X3gVT+hCgpFEGgM87veNqIMQuAIj8RWjY1k
         3p2yOfDv+2OYvfXmloEK4W8SnOEwp91O/CVDpCqE1fLeE+trcEUZc+fpphXk+OWsdlMo
         MaMGsG4ZUOEFFccUovby8Mq4Yciw+urnI51wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l2qHBG28ZF/0BqgZtfUZ2wwyoD54f6fad9bi6YF6qP8=;
        b=Gr1AOZmBG+LnjXYk4XkZ6zfKB2G2t90wgvWQfLi1bjYs3azJTzKuU8tDiBebgoV89U
         fAMmB7RsOlyRESGG9EgRenghfFm7Jz7homgKguc/c7YPdcMCnpGs6qVQEhJUPfphNH8I
         CjLin3Wqh5bdBI1fcUkatLJxjMaOJzC9P3XAZLahdS/PeRfbmlckO5iIhENbc7Mkw7fR
         YjccOBupk4iDrtrX2VBHdwBjJ8nazgnl2Fyf1vdKk4P8gey22aFfo1bhiJW9J/Y0QEOd
         eSXbFCHDKJ12nWGbDCCq760y1ZBjS7aJVTiusRi8lYFChG1Bx56bhC8xYKI1Hmm+5kKU
         gLGw==
X-Gm-Message-State: AJIora817zwXDr1WNCkUhirB8oVTBYqSwxLgqoHtPOFWWFwCObS+Hvtn
        DM/8mRWruFUOKjOExB4IyYA8cA==
X-Google-Smtp-Source: AGRyM1s/fjJ/aZb6Nsgih4XdqPsiZQ+zrFpgSyyMiLHkBeFX8zNWoYgZNCQOUUHA69KHpga9AC3Psg==
X-Received: by 2002:a17:906:2086:b0:712:1257:77bf with SMTP id 6-20020a170906208600b00712125777bfmr4043969ejq.655.1656516585942;
        Wed, 29 Jun 2022 08:29:45 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-58-216.cust.vodafonedsl.it. [188.217.58.216])
        by smtp.gmail.com with ESMTPSA id h1-20020a1709063c0100b006feec47dae9sm7821853ejg.157.2022.06.29.08.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 08:29:45 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     tommaso.merciai@amarulasolutions.com
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] media: ov5693: rename clk into xvclk
Date:   Wed, 29 Jun 2022 17:29:30 +0200
Message-Id: <20220629152933.422990-4-tommaso.merciai@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220629152933.422990-1-tommaso.merciai@amarulasolutions.com>
References: <20220629152933.422990-1-tommaso.merciai@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename clk pdata pointer into xvclk (system clock input).
Same for clk_rate into xvclk_rate. This is more explicit

Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
---
 drivers/media/i2c/ov5693.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 9e84468d920e..d2adc5513a21 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -157,7 +157,7 @@ struct ov5693_device {
 	struct gpio_desc *reset;
 	struct gpio_desc *powerdown;
 	struct regulator_bulk_data supplies[OV5693_NUM_SUPPLIES];
-	struct clk *clk;
+	struct clk *xvclk;
 
 	struct ov5693_mode {
 		struct v4l2_rect crop;
@@ -794,7 +794,7 @@ static void ov5693_sensor_powerdown(struct ov5693_device *ov5693)
 
 	regulator_bulk_disable(OV5693_NUM_SUPPLIES, ov5693->supplies);
 
-	clk_disable_unprepare(ov5693->clk);
+	clk_disable_unprepare(ov5693->xvclk);
 }
 
 static int ov5693_sensor_powerup(struct ov5693_device *ov5693)
@@ -804,7 +804,7 @@ static int ov5693_sensor_powerup(struct ov5693_device *ov5693)
 	gpiod_set_value_cansleep(ov5693->reset, 1);
 	gpiod_set_value_cansleep(ov5693->powerdown, 1);
 
-	ret = clk_prepare_enable(ov5693->clk);
+	ret = clk_prepare_enable(ov5693->xvclk);
 	if (ret) {
 		dev_err(ov5693->dev, "Failed to enable clk\n");
 		goto fail_power;
@@ -1390,7 +1390,7 @@ static int ov5693_check_hwcfg(struct ov5693_device *ov5693)
 static int ov5693_probe(struct i2c_client *client)
 {
 	struct ov5693_device *ov5693;
-	u32 clk_rate;
+	u32 xvclk_rate;
 	int ret = 0;
 
 	ov5693 = devm_kzalloc(&client->dev, sizeof(*ov5693), GFP_KERNEL);
@@ -1408,16 +1408,16 @@ static int ov5693_probe(struct i2c_client *client)
 
 	v4l2_i2c_subdev_init(&ov5693->sd, client, &ov5693_ops);
 
-	ov5693->clk = devm_clk_get(&client->dev, "xvclk");
-	if (IS_ERR(ov5693->clk)) {
+	ov5693->xvclk = devm_clk_get(&client->dev, "xvclk");
+	if (IS_ERR(ov5693->xvclk)) {
 		dev_err(&client->dev, "Error getting clock\n");
-		return PTR_ERR(ov5693->clk);
+		return PTR_ERR(ov5693->xvclk);
 	}
 
-	clk_rate = clk_get_rate(ov5693->clk);
-	if (clk_rate != OV5693_XVCLK_FREQ)
+	xvclk_rate = clk_get_rate(ov5693->xvclk);
+	if (xvclk_rate != OV5693_XVCLK_FREQ)
 		dev_warn(&client->dev, "Found clk freq %u, expected %u\n",
-			 clk_rate, OV5693_XVCLK_FREQ);
+			 xvclk_rate, OV5693_XVCLK_FREQ);
 
 	ret = ov5693_configure_gpios(ov5693);
 	if (ret)
-- 
2.25.1

