Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E28F583F81
	for <lists+linux-media@lfdr.de>; Thu, 28 Jul 2022 15:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238876AbiG1NCy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jul 2022 09:02:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238655AbiG1NCv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jul 2022 09:02:51 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34CDE40BF8;
        Thu, 28 Jul 2022 06:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1659013370; x=1690549370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eUVoM8eILSRtiJWPnfEMpUTwJ5DdzPLtU9RvqhESVtc=;
  b=mgKv2/jhBf+FU4p2CY0+/kj+H9M49yi3LWTIUlLK7CI4ngQuu/3LsYub
   2cWVCMI6Aq4jS2Zfk/WSh/wNESoVVFhbAp6LMLD+9Iv2LssIfQ8iyABcn
   Yrkjhbbo042LTTfOGeYWsqCvN/vkSJJaShn1w1pHdR1sFKGxHxaPjvAEe
   ZnAxb8leT7/CUO3N20z5gLtfAdOvwRzLceCrGwqSJ13UxoGcJFt8LBeL8
   IZcv6rk7SKU/RqChR48Kgs1+Xmq7DUzXStJKZfopUBnZ/uRweBQgF3Tjo
   tedN3fZnp9gw56VJMnz5muH6suQc0fnsoffnWqvD6eolYuS7QwO45KiMS
   A==;
X-IronPort-AV: E=Sophos;i="5.93,198,1654552800"; 
   d="scan'208";a="25321373"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 28 Jul 2022 15:02:44 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 28 Jul 2022 15:02:44 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 28 Jul 2022 15:02:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1659013364; x=1690549364;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eUVoM8eILSRtiJWPnfEMpUTwJ5DdzPLtU9RvqhESVtc=;
  b=YOdtc5+BX264kYfXAYnzbuyq2GV6rqWe+yY23UlhE3vQRMbRE6cGp3jG
   fEH6KDyefpBciSMKxDZbbf98LEVtIHVfN6qYCkNjqOf7WrB9TBcSR+E6u
   bTyf7bQhbH/vIfqSncOeZARvgMH5Izf05EWLuhfDkiD9lg2lbzcOF8Ty0
   DGOjE4Hicvd91EQI3e/winH0YErI83sGSSMszDFr0JZNhKpkU2MgRGzlS
   5AVl5IxF0jqjD/rlj1ow+OA0A4AAf8Sox1WjjEfRjJp9g9BQYokHUx1NN
   WiMxQjKiAeujXAqH0/kEeagnElPDekSThnaTSMxxdl4hj4Ici4QL+gvUM
   A==;
X-IronPort-AV: E=Sophos;i="5.93,198,1654552800"; 
   d="scan'208";a="25321372"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 28 Jul 2022 15:02:44 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 138A2280056;
        Thu, 28 Jul 2022 15:02:44 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH v4 5/7] media: i2c: ov9282: Add regulator support
Date:   Thu, 28 Jul 2022 15:02:35 +0200
Message-Id: <20220728130237.3396663-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728130237.3396663-1-alexander.stein@ew.tq-group.com>
References: <20220728130237.3396663-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Need in case the sensors is supplied by a switchable regulator.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/ov9282.c | 39 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index c8d83a29f9bb..352dbe21a902 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -11,6 +11,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
@@ -55,6 +56,14 @@
 #define OV9282_REG_MIN		0x00
 #define OV9282_REG_MAX		0xfffff
 
+static const char * const ov9282_supply_names[] = {
+	"avdd",		/* Analog power */
+	"dovdd",	/* Digital I/O power */
+	"dvdd",		/* Digital core power */
+};
+
+#define OV9282_NUM_SUPPLIES ARRAY_SIZE(ov9282_supply_names)
+
 /**
  * struct ov9282_reg - ov9282 sensor register
  * @address: Register address
@@ -126,6 +135,7 @@ struct ov9282 {
 	struct media_pad pad;
 	struct gpio_desc *reset_gpio;
 	struct clk *inclk;
+	struct regulator_bulk_data supplies[OV9282_NUM_SUPPLIES];
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct v4l2_ctrl *link_freq_ctrl;
 	struct v4l2_ctrl *pclk_ctrl;
@@ -882,10 +892,19 @@ static int ov9282_power_on(struct device *dev)
 		goto error_reset;
 	}
 
+	ret = regulator_bulk_enable(ARRAY_SIZE(ov9282->supplies),
+				    ov9282->supplies);
+	if (ret) {
+		dev_err(dev, "Failed to enable regulators\n");
+		goto disable_clk;
+	}
+
 	usleep_range(400, 600);
 
 	return 0;
 
+disable_clk:
+	clk_disable_unprepare(ov9282->inclk);
 error_reset:
 	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
 
@@ -903,6 +922,8 @@ static int ov9282_power_off(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov9282 *ov9282 = to_ov9282(sd);
 
+	regulator_bulk_disable(ARRAY_SIZE(ov9282->supplies), ov9282->supplies);
+
 	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
 
 	clk_disable_unprepare(ov9282->inclk);
@@ -995,6 +1016,18 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	return 0;
 }
 
+static int ov9282_get_regulators(struct ov9282 *ov9282)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ov9282->supplies); i++)
+		ov9282->supplies[i].supply = ov9282_supply_names[i];
+
+	return devm_regulator_bulk_get(ov9282->dev,
+				       ARRAY_SIZE(ov9282->supplies),
+				       ov9282->supplies);
+}
+
 /**
  * ov9282_probe() - I2C client device binding
  * @client: pointer to i2c client device
@@ -1021,6 +1054,12 @@ static int ov9282_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	ret = ov9282_get_regulators(ov9282);
+	if (ret) {
+		dev_err(&client->dev, "Failed to get power regulators\n");
+		return ret;
+	}
+
 	mutex_init(&ov9282->mutex);
 
 	ret = ov9282_power_on(ov9282->dev);
-- 
2.25.1

