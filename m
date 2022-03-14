Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8AA4D890F
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 17:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242343AbiCNQ2u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 12:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243006AbiCNQ2s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 12:28:48 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF4C0BC17
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 09:27:38 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 2FC9A240002;
        Mon, 14 Mar 2022 16:27:34 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:OMNIVISION OV5670 SENSOR DRIVER)
Subject: [PATCH v2 5/8] media: i2c: ov5670: Probe GPIOs
Date:   Mon, 14 Mar 2022 17:27:11 +0100
Message-Id: <20220314162714.153970-6-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314162714.153970-1-jacopo@jmondi.org>
References: <20220314162714.153970-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
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
index 832355f65e52..1ecc3e549737 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -3,6 +3,7 @@
 
 #include <linux/acpi.h>
 #include <linux/clk.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -1845,6 +1846,10 @@ struct ov5670 {
 	/* Regulators */
 	struct regulator_bulk_data supplies[OV5670_NUM_SUPPLIES];
 
+	/* Power-down and reset gpios. */
+	struct gpio_desc *pwdn_gpio; /* PWDNB pin. */
+	struct gpio_desc *reset_gpio; /* XSHUTDOWN pin. */
+
 	/* To serialize asynchronus callbacks */
 	struct mutex mutex;
 
@@ -2497,6 +2502,23 @@ static int ov5670_regulators_probe(struct ov5670 *ov5670)
 				       ov5670->supplies);
 }
 
+static int ov5670_gpio_probe(struct ov5670 *ov5670)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
+
+	ov5670->pwdn_gpio = devm_gpiod_get_optional(&client->dev, "pwdn",
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
@@ -2535,6 +2557,12 @@ static int ov5670_probe(struct i2c_client *client)
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

