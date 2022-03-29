Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 455744EA9FE
	for <lists+linux-media@lfdr.de>; Tue, 29 Mar 2022 11:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234384AbiC2JEo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Mar 2022 05:04:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbiC2JEn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Mar 2022 05:04:43 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF2321F0815
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 02:03:00 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 5C10E10000A;
        Tue, 29 Mar 2022 09:02:57 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:OMNIVISION OV5670 SENSOR DRIVER)
Subject: [PATCH v3 5/8] media: i2c: ov5670: Probe GPIOs
Date:   Tue, 29 Mar 2022 11:01:30 +0200
Message-Id: <20220329090133.338073-6-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329090133.338073-1-jacopo@jmondi.org>
References: <20220329090133.338073-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The OV5670 has a powerdown and reset pin, named respectively "PWDN" and
"XSHUTDOWN".

Optionally probe the gpios connected to the pins during the driver probe
routine.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5670.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 9ddd259a4015..9e69b4008917 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -3,6 +3,7 @@
 
 #include <linux/acpi.h>
 #include <linux/clk.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -1843,6 +1844,10 @@ struct ov5670 {
 	/* Regulators */
 	struct regulator_bulk_data supplies[OV5670_NUM_SUPPLIES];
 
+	/* Power-down and reset gpios. */
+	struct gpio_desc *pwdn_gpio; /* PWDNB pin. */
+	struct gpio_desc *reset_gpio; /* XSHUTDOWN pin. */
+
 	/* To serialize asynchronus callbacks */
 	struct mutex mutex;
 
@@ -2495,6 +2500,23 @@ static int ov5670_regulators_probe(struct ov5670 *ov5670)
 				       ov5670->supplies);
 }
 
+static int ov5670_gpio_probe(struct ov5670 *ov5670)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
+
+	ov5670->pwdn_gpio = devm_gpiod_get_optional(&client->dev, "powerdown",
+						    GPIOD_OUT_LOW);
+	if (IS_ERR(ov5670->pwdn_gpio))
+		return PTR_ERR(ov5670->pwdn_gpio);
+
+	ov5670->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
+						     GPIOD_OUT_LOW);
+	if (IS_ERR(ov5670->reset_gpio))
+		return PTR_ERR(ov5670->reset_gpio);
+
+	return 0;
+}
+
 static int ov5670_probe(struct i2c_client *client)
 {
 	struct ov5670 *ov5670;
@@ -2536,6 +2558,12 @@ static int ov5670_probe(struct i2c_client *client)
 		goto error_print;
 	}
 
+	ret = ov5670_gpio_probe(ov5670);
+	if (ret) {
+		err_msg = "GPIO probe failed";
+		goto error_print;
+	}
+
 	full_power = acpi_dev_state_d0(&client->dev);
 	if (full_power) {
 		/* Check module identity */
-- 
2.35.1

