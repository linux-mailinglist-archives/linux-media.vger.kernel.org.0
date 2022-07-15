Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8C0C575CB6
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 09:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231961AbiGOHtT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 03:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232280AbiGOHtK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 03:49:10 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E87A1248F1;
        Fri, 15 Jul 2022 00:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657871349; x=1689407349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WPEzwNrqt8+h8RK1E0wJLqv7Sc/l+LFqsghA9Y4/7l8=;
  b=jch64GeXzr++87m1JYj6/UOU2TPS3mxeJM6+k/czhUG31TJPOs5wLF/9
   3brpf4Motg9Yf7idO1uP7QFz9KuUn2+1XdZIfz44d+SCYF7aN3vNV1Koh
   M3zy+PjUp5Mmb9HCwwlHCVowwz0ZxbCL9P+EbWFXzVA1tZ/mPoygZdksr
   PVy0ZUssbUuFrqGA45y0utqxuisIZa7ebHj/fYuvfe1zXwySGKvR67/Dy
   lf16PSNh3hHORy+9HZZsH9w92S6muEjGwNpdczvU0XDgXYOIOBffX5UvW
   JhWEMerIOoxLhkh7LdWCZKMFkNSj2vRQzp61FKf7NZ435HtEccuYSPHts
   w==;
X-IronPort-AV: E=Sophos;i="5.92,273,1650924000"; 
   d="scan'208";a="25069090"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 15 Jul 2022 09:49:05 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 15 Jul 2022 09:49:05 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 15 Jul 2022 09:49:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657871345; x=1689407345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WPEzwNrqt8+h8RK1E0wJLqv7Sc/l+LFqsghA9Y4/7l8=;
  b=OPnCRgrnwCh6Aor5VAeOEH+fBccyiXMRQffdf5l1TqiUx3Chk+q8egQW
   YnagZdnRdoo1GqGmSE41x+l1mP1LX4nclKbWbLdA15qb+9QFIWSmnprqw
   B3nJ/tqQJzQYI2Bt5jTuauvr1DnmwuVuTOYpTx4u5WCoFcrkmyfEKFZzM
   MI3HwONlKymxMEy6FrYjqzCjew1wYA+hSpDmM6QGtE8LkvxnEshO6sOlh
   JvaK9iliFCIM1ytFO0n3HtHipL4+96jscgqd5LVRw+5Ew4+LcnDv26Vbv
   c1OM1wyG8o14EMihsB9+4ZB1xcVyTlLO5kY5PEw5Q6nXY7Ii1zYT2e3vI
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,273,1650924000"; 
   d="scan'208";a="25069089"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Jul 2022 09:49:04 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C67D6280072;
        Fri, 15 Jul 2022 09:49:04 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 5/6] media: i2c: ov9282: Add regulator support
Date:   Fri, 15 Jul 2022 09:48:57 +0200
Message-Id: <20220715074858.875808-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715074858.875808-1-alexander.stein@ew.tq-group.com>
References: <20220715074858.875808-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Need in case the sensors is supplied by a switchable regulator.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Remove error message for failed regulator_bulk_disable()
* Rename ov9282_configure_regulators to ov9282_get_regulators

 drivers/media/i2c/ov9282.c | 39 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 04fda8222e07..263cdffc558f 100644
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
@@ -127,6 +136,7 @@ struct ov9282 {
 	struct media_pad pad;
 	struct gpio_desc *reset_gpio;
 	struct clk *inclk;
+	struct regulator_bulk_data supplies[OV9282_NUM_SUPPLIES];
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct v4l2_ctrl *link_freq_ctrl;
 	struct v4l2_ctrl *pclk_ctrl;
@@ -883,10 +893,18 @@ static int ov9282_power_on(struct device *dev)
 		goto error_reset;
 	}
 
+	ret = regulator_bulk_enable(ARRAY_SIZE(ov9282->supplies), ov9282->supplies);
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
 
@@ -903,6 +921,9 @@ static int ov9282_power_off(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov9282 *ov9282 = to_ov9282(sd);
+	int ret;
+
+	regulator_bulk_disable(ARRAY_SIZE(ov9282->supplies), ov9282->supplies);
 
 	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
 
@@ -996,6 +1017,18 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
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
@@ -1022,6 +1055,12 @@ static int ov9282_probe(struct i2c_client *client)
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

