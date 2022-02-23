Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A80D4C0642
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 01:36:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236394AbiBWAgs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 19:36:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231518AbiBWAgr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 19:36:47 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B4915C666
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 16:36:21 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id y24so15732396lfg.1
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 16:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MmYTKwlBwBECPCckdawOiBeY5OcJ5zYGIimKZOFZE10=;
        b=pv6DK+ut88L1dgjxl8XAzbyhDnxaw5Ygi1DQ7FHgHbPYM4YuWq/a4ISwjy8OkiJo7l
         pjCI6SXfOtjKya3g+Nr+54fPMbQzBUsF9ANWQOR6MDR4PP7/WUJNFAe/E8LN8IUmMN1i
         DVTPPUjNQSZsmpIg+njsW8LFSrFsptRxfgwUAV7GuAiG9zSGa25sESO4sB5Yjdh4ZtyV
         Cib7o4pt321CA2dGrjKxYGiGls+p8DK3kwvAjU83WWMpd2JJjUngWnrgcOBO19MEtC9H
         lBUIFY5xPSAg/GvZCakzICtNsCLXMsOCkk1eqn3cX+I64TcgfJ7uueoC8ouG3Yas4GoV
         m6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MmYTKwlBwBECPCckdawOiBeY5OcJ5zYGIimKZOFZE10=;
        b=qZiHXxmowtefi1Zbk9+05R2iXoqkWnuneLGInucj6cOB0uMEn4u+5QEuFlWQG9zPC5
         bn/zrjuGnOTOOI9YmCSM4eLQADUH2COz3hay5psI7l8YP0vISD4VX0A9a/EftirEBpAd
         fP5yogvSlU/Q2H3S2ULAyfnPgNmCrc19EJv//U1ijtjUB/WihjsMq9RQeyMyABe9hqdM
         315/ztCzH6ti+DTqnkj184j+Wou7Fh95iq1bRpZdJPuAdyTsiBMGjMCshfTyjxdtEqR0
         i0GFyMOPDwD1CRAFe1yr+1dJ6FK0KPUWISJdbcbLl837Z9yEjGOOACXRS4TAlsO90NeM
         JdPQ==
X-Gm-Message-State: AOAM530s/M6J8ugTB+CDXodYdS18x19RrrLcXydTlzhFghP9Njp9WZYt
        gts3T8KMBUVToehugKlFB6U7WA==
X-Google-Smtp-Source: ABdhPJyo/lt4z9dn3NALJft2ONgSni0Uk3TLjQTEnMlZVIFrrOFIbMj5AylwJ4o/0pcH0ttLUkLn7g==
X-Received: by 2002:a05:6512:3e14:b0:429:6e79:ca87 with SMTP id i20-20020a0565123e1400b004296e79ca87mr18536374lfv.163.1645576579395;
        Tue, 22 Feb 2022 16:36:19 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id g8sm1885210lja.15.2022.02.22.16.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 16:36:19 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] media: adv7183: Convert to GPIO descriptors
Date:   Wed, 23 Feb 2022 01:34:16 +0100
Message-Id: <20220223003416.106671-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver is using two GPIO numbers passed as platform data.

No board file in the kernel defines this however, so we can
just change the mechanism without side effects.

Let's just switch it to use GPIO descriptors and add some
comments on how to provide these.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/media/i2c/adv7183.c | 51 ++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/adv7183.c b/drivers/media/i2c/adv7183.c
index 92cafdea3f1f..ba746a19fd39 100644
--- a/drivers/media/i2c/adv7183.c
+++ b/drivers/media/i2c/adv7183.c
@@ -7,7 +7,7 @@
 
 #include <linux/delay.h>
 #include <linux/errno.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -28,8 +28,8 @@ struct adv7183 {
 	v4l2_std_id std; /* Current set standard */
 	u32 input;
 	u32 output;
-	unsigned reset_pin;
-	unsigned oe_pin;
+	struct gpio_desc *reset_pin;
+	struct gpio_desc *oe_pin;
 	struct v4l2_mbus_framefmt fmt;
 };
 
@@ -465,9 +465,9 @@ static int adv7183_s_stream(struct v4l2_subdev *sd, int enable)
 	struct adv7183 *decoder = to_adv7183(sd);
 
 	if (enable)
-		gpio_set_value(decoder->oe_pin, 0);
+		gpiod_set_value(decoder->oe_pin, 1);
 	else
-		gpio_set_value(decoder->oe_pin, 1);
+		gpiod_set_value(decoder->oe_pin, 0);
 	udelay(1);
 	return 0;
 }
@@ -531,7 +531,6 @@ static int adv7183_probe(struct i2c_client *client,
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
-	const unsigned *pin_array;
 
 	/* Check if the adapter supports the needed features */
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
@@ -540,29 +539,28 @@ static int adv7183_probe(struct i2c_client *client,
 	v4l_info(client, "chip found @ 0x%02x (%s)\n",
 			client->addr << 1, client->adapter->name);
 
-	pin_array = client->dev.platform_data;
-	if (pin_array == NULL)
-		return -EINVAL;
-
 	decoder = devm_kzalloc(&client->dev, sizeof(*decoder), GFP_KERNEL);
 	if (decoder == NULL)
 		return -ENOMEM;
 
-	decoder->reset_pin = pin_array[0];
-	decoder->oe_pin = pin_array[1];
-
-	if (devm_gpio_request_one(&client->dev, decoder->reset_pin,
-				  GPIOF_OUT_INIT_LOW, "ADV7183 Reset")) {
-		v4l_err(client, "failed to request GPIO %d\n", decoder->reset_pin);
-		return -EBUSY;
-	}
-
-	if (devm_gpio_request_one(&client->dev, decoder->oe_pin,
-				  GPIOF_OUT_INIT_HIGH,
-				  "ADV7183 Output Enable")) {
-		v4l_err(client, "failed to request GPIO %d\n", decoder->oe_pin);
-		return -EBUSY;
-	}
+	/*
+	 * Requesting high will assert reset, the line should be
+	 * flagged as active low in descriptor table or machine description.
+	 */
+	decoder->reset_pin = devm_gpiod_get(&client->dev, "reset",
+					    GPIOD_OUT_HIGH);
+	if (IS_ERR(decoder->reset_pin))
+		return PTR_ERR(decoder->reset_pin);
+	gpiod_set_consumer_name(decoder->reset_pin, "ADV7183 Reset");
+	/*
+	 * Requesting low will start with output disabled, the line should be
+	 * flagged as active low in descriptor table or machine description.
+	 */
+	decoder->oe_pin = devm_gpiod_get(&client->dev, "oe",
+					 GPIOD_OUT_LOW);
+	if (IS_ERR(decoder->oe_pin))
+		return PTR_ERR(decoder->oe_pin);
+	gpiod_set_consumer_name(decoder->reset_pin, "ADV7183 Output Enable");
 
 	sd = &decoder->sd;
 	v4l2_i2c_subdev_init(sd, client, &adv7183_ops);
@@ -594,7 +592,8 @@ static int adv7183_probe(struct i2c_client *client,
 	/* reset chip */
 	/* reset pulse width at least 5ms */
 	mdelay(10);
-	gpio_set_value(decoder->reset_pin, 1);
+	/* De-assert reset line (descriptor tagged active low) */
+	gpiod_set_value(decoder->reset_pin, 0);
 	/* wait 5ms before any further i2c writes are performed */
 	mdelay(5);
 
-- 
2.34.1

