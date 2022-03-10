Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9A804D47C0
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 14:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242202AbiCJNJ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 08:09:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233180AbiCJNJ4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 08:09:56 -0500
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 012E714ACB2
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 05:08:52 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id A89762000B;
        Thu, 10 Mar 2022 13:08:49 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:OMNIVISION OV5670 SENSOR DRIVER)
Subject: [PATCH 4/6] media: i2c: ov5670: Probe GPIOs
Date:   Thu, 10 Mar 2022 14:08:27 +0100
Message-Id: <20220310130829.96001-5-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310130829.96001-1-jacopo@jmondi.org>
References: <20220310130829.96001-1-jacopo@jmondi.org>
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
---
 drivers/media/i2c/ov5670.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index cba310aec011..ca5191d043ce 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -1842,6 +1842,10 @@ struct ov5670 {
 	/* Regulators */
 	struct regulator_bulk_data supplies[OV5670_NUM_SUPPLIES];
 
+	/* Power-down and reset gpios. */
+	struct gpio_desc *pwdn_gpio; /* PWDNB pin. */
+	struct gpio_desc *reset_gpio; /* XSHUTDOWN pin. */
+
 	/* To serialize asynchronus callbacks */
 	struct mutex mutex;
 
@@ -2494,6 +2498,23 @@ static int ov5670_regulators_probe(struct ov5670 *ov5670)
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
@@ -2522,6 +2543,12 @@ static int ov5670_probe(struct i2c_client *client)
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

