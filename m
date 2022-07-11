Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD08756D7A3
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 10:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbiGKIRA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 04:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbiGKIQw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 04:16:52 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E49B1DA6D;
        Mon, 11 Jul 2022 01:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657527411; x=1689063411;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l0d36+69eYrkkbVW1c3AnF9c2X+JUGK0g9stTZsQnb4=;
  b=JfJnzemUScsReuFTPEdYqJe0bLs70QkBkOZWd043faB0mJWkb5NEOZSQ
   fswyfEY+NUzgKoogZ3u3HlBX+rndzaFyKbm0CKZg0wjhyRm2ODJEOdoGd
   eG6hofP9b/1lW0ihshcY1DDASbhky2Rmlh0o5UobuEK6IoOGoR6GSWeRs
   1uPOPb/0dW7Rq8AIoCriKh83kvC/qtF5QxQRolbuIPSaln4eV/VCmuEcU
   0NfTX0WUY3Nyq6ItiZuWqsgB4QQb+++71bLqWGgeH1/4CkpcDssc1LqOK
   kl8EOmk9+h3wME20rlJ1G55lyxNQaOTTYPU+oEtULuHmdW0SqQ5tcegGc
   A==;
X-IronPort-AV: E=Sophos;i="5.92,262,1650924000"; 
   d="scan'208";a="24967080"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 11 Jul 2022 10:16:43 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 11 Jul 2022 10:16:43 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 11 Jul 2022 10:16:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657527403; x=1689063403;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l0d36+69eYrkkbVW1c3AnF9c2X+JUGK0g9stTZsQnb4=;
  b=QeuBaYzUVPiuBc5OhsWiS3LPUt3vP/tzcj0yDSk5sBBr3YAW3owx0l8o
   AUvfW/KuIpL7IKfPV+PH++QXcnuTuQ//Gzubmu55QSE8VURXoZjQ3Huw/
   hAAIuRu5Dk3ZZYbmpbMGvpG4uMw8Hh1Q+NnDln/Wm+psEwd4mwiYpr1Mv
   IW0I6FvFl6RfH1H3NxPhSvC/0RZLYcUINUj3C6P8zeIuP0VlXBOecpdHH
   SLiNAd1EoF7vGUVfpoO5RxPfcqQrmEnzWm5HHDMPbsn60PBcgTRYv7dDF
   nyn5Dzl273lMathz4x8znknvUl/X7lvp+AVVtr/FlROHXd0UbRVTMUU8a
   w==;
X-IronPort-AV: E=Sophos;i="5.92,262,1650924000"; 
   d="scan'208";a="24967079"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Jul 2022 10:16:43 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6BA92280078;
        Mon, 11 Jul 2022 10:16:43 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 5/6] media: i2c: ov9282: Add regulator support
Date:   Mon, 11 Jul 2022 10:16:38 +0200
Message-Id: <20220711081639.150153-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711081639.150153-1-alexander.stein@ew.tq-group.com>
References: <20220711081639.150153-1-alexander.stein@ew.tq-group.com>
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
 drivers/media/i2c/ov9282.c | 41 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 04fda8222e07..c3faf11a99b5 100644
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
 
@@ -903,6 +921,11 @@ static int ov9282_power_off(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov9282 *ov9282 = to_ov9282(sd);
+	int ret;
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(ov9282->supplies), ov9282->supplies);
+	if (ret)
+		dev_err(ov9282->dev, "Failed to disable supplies: %d\n", ret);
 
 	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
 
@@ -996,6 +1019,18 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	return 0;
 }
 
+static int ov9282_configure_regulators(struct ov9282 *ov9282)
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
@@ -1022,6 +1057,12 @@ static int ov9282_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	ret = ov9282_configure_regulators(ov9282);
+	if (ret) {
+		dev_err(&client->dev, "Failed to get power regulators\n");
+		return ret;
+	}
+
 	mutex_init(&ov9282->mutex);
 
 	ret = ov9282_power_on(ov9282->dev);
-- 
2.25.1

