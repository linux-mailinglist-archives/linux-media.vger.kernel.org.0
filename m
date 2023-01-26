Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36E7467D248
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 17:59:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231806AbjAZQ7j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 11:59:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231809AbjAZQ7i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 11:59:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5993B5A830
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 08:59:35 -0800 (PST)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 595D11280;
        Thu, 26 Jan 2023 17:59:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674752370;
        bh=f2k9q7Re3peKyS0ZaIlRLeBjl/dNgG00PoMxS0pCk0o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Kbx2MAg9MXJm6e/F8AMUX/9yZ1wECvBh0YFDWSzhJ9zFK4GB4qUX1R8CYdx9l0ma+
         9WGL70WU0J5l5yBXtjAzTUTNdgwNQmyDwu9GVieqKr1yAPAJdLdbR03+MCfJFWWzqB
         lDeWAyjThu1BWua0E6pZr1dysUhmh9nTGZXrQCZI=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH v6 5/9] media: i2c: ov5670: Probe GPIOs
Date:   Thu, 26 Jan 2023 17:59:05 +0100
Message-Id: <20230126165909.121302-6-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126165909.121302-1-jacopo.mondi@ideasonboard.com>
References: <20230126165909.121302-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The OV5670 has a powerdown and reset pin, named respectively "PWDN" and
"XSHUTDOWN".

Optionally probe the gpios connected to the pins during the driver probe
routine.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5670.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index e71f13360480..0290f33f619d 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -3,6 +3,7 @@
 
 #include <linux/acpi.h>
 #include <linux/clk.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -1848,6 +1849,10 @@ struct ov5670 {
 	/* Regulators */
 	struct regulator_bulk_data supplies[OV5670_NUM_SUPPLIES];
 
+	/* Power-down and reset gpios. */
+	struct gpio_desc *pwdn_gpio; /* PWDNB pin. */
+	struct gpio_desc *reset_gpio; /* XSHUTDOWN pin. */
+
 	/* To serialize asynchronus callbacks */
 	struct mutex mutex;
 
@@ -2500,6 +2505,23 @@ static int ov5670_regulators_probe(struct ov5670 *ov5670)
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
@@ -2540,6 +2562,12 @@ static int ov5670_probe(struct i2c_client *client)
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
2.39.0

