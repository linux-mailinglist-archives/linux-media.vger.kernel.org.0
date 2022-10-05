Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8426C5F575C
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 17:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230391AbiJEPVP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 11:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbiJEPVM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 11:21:12 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FCFC47BB9
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 08:21:10 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id n12so6869867wrp.10
        for <linux-media@vger.kernel.org>; Wed, 05 Oct 2022 08:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=P23Toul+yvAg8ITdVewN9IrDo8XBNapLz1MZzgSmTS0=;
        b=hDHB7YmBPbaHebgrwJQZ13/uqZUZ8Gj9imN0rHpkqRHwUEYj9myvf8RrrIHrOTqE5W
         HjlW9es1urBPchOjrKqlXoB6tmC4jfYgcYW/upTs63e0rq1oAyymdTPsZ5Tmj3pA1T/B
         ZTGpZJ73Ga+onccSR42hTfhRR68yaa88Eo+sWY491qLCJTTw/PZjYcEVB64anB8+y2w2
         Ldo56FKgIFd5QkzLtiE4LGxtq8hkF39ueqjw10KZGnyioAb/uOlrU67Rc86/ndR3gUZT
         fFHfkDIEd0H38B7fzHc4c/XjWA5zVC7TZYK7cmqOUmxd1AbZ3BM3e7qX3ze95C72KFgs
         BA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=P23Toul+yvAg8ITdVewN9IrDo8XBNapLz1MZzgSmTS0=;
        b=7SYoAalt26gOZ1fuiLhtgb7wEyuq9Ms4dddtYdmD6xl1RC8byAT5NRi2Saogel1muO
         y9XsfXQfhhVXkbkAiFh2OFXC3YIRtJH13ik/619c9sBP//KTTEJB00o+yib2QU/0ZDp5
         wWe4Nvkfy98VgjI40Hh7/XCMHEOklIjwkmbtDOxlJrIeKa199g+Nou0Lrsy6wT0FpRGK
         0lVWVLuQ3pzgST4npfj3uJXe1VN0y1DTurIFx5jYK992vHOWBGr+DeMp3Nu8ynfpBIwM
         IgQRIGoSrrfukT5GGrkSOkbiM8ujRIAXwArEkn690ipig25empl8e7lk5Sabc4qQKHpK
         7PUQ==
X-Gm-Message-State: ACrzQf3FzFtISSnmJiqQ0+Q2CO6jvQEV/ldk8QmxuHpiPi+Fhms1JTvF
        UwiCHtRGVDTiDlDWsIcFplDiBg==
X-Google-Smtp-Source: AMsMyM4mODtW+t0PJdpmPEnDU9xx0k32mkrSIOuL2GCqzCOJD3SN1VbkyHovJSd9xTWuj5Np9MdgNw==
X-Received: by 2002:a5d:654f:0:b0:22d:ac82:f870 with SMTP id z15-20020a5d654f000000b0022dac82f870mr180639wrv.7.1664983268707;
        Wed, 05 Oct 2022 08:21:08 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id p2-20020a05600c1d8200b003b4764442f0sm2306854wms.11.2022.10.05.08.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:21:08 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 2/2] media: i2c: ov9282: Add support for regulators.
Date:   Wed,  5 Oct 2022 16:20:18 +0100
Message-Id: <20221005152018.3783890-3-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221005152018.3783890-1-dave.stevenson@raspberrypi.com>
References: <20221005152018.3783890-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The sensor takes 3 supply rails - AVDD, DVDD, and DOVDD.

Add hooks into the regulator framework for each of these
regulators.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ov9282.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 2e0b315801e5..699fc5b753b4 100644
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
@@ -128,6 +137,7 @@ struct ov9282 {
 	struct media_pad pad;
 	struct gpio_desc *reset_gpio;
 	struct clk *inclk;
+	struct regulator_bulk_data supplies[OV9282_NUM_SUPPLIES];
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct v4l2_ctrl *link_freq_ctrl;
 	struct v4l2_ctrl *pclk_ctrl;
@@ -767,6 +777,18 @@ static int ov9282_detect(struct ov9282 *ov9282)
 	return 0;
 }
 
+static int ov9282_configure_regulators(struct ov9282 *ov9282)
+{
+	unsigned int i;
+
+	for (i = 0; i < OV9282_NUM_SUPPLIES; i++)
+		ov9282->supplies[i].supply = ov9282_supply_names[i];
+
+	return devm_regulator_bulk_get(ov9282->dev,
+				       OV9282_NUM_SUPPLIES,
+				       ov9282->supplies);
+}
+
 /**
  * ov9282_parse_hw_config() - Parse HW configuration and check if supported
  * @ov9282: pointer to ov9282 device
@@ -803,6 +825,12 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
 		return PTR_ERR(ov9282->inclk);
 	}
 
+	ret = ov9282_configure_regulators(ov9282);
+	if (ret) {
+		dev_err(ov9282->dev, "Failed to get power regulators\n");
+		return ret;
+	}
+
 	rate = clk_get_rate(ov9282->inclk);
 	if (rate != OV9282_INCLK_RATE) {
 		dev_err(ov9282->dev, "inclk frequency mismatch");
@@ -874,6 +902,12 @@ static int ov9282_power_on(struct device *dev)
 	struct ov9282 *ov9282 = to_ov9282(sd);
 	int ret;
 
+	ret = regulator_bulk_enable(OV9282_NUM_SUPPLIES, ov9282->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators\n");
+		return ret;
+	}
+
 	usleep_range(400, 600);
 
 	gpiod_set_value_cansleep(ov9282->reset_gpio, 1);
@@ -891,6 +925,8 @@ static int ov9282_power_on(struct device *dev)
 error_reset:
 	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
 
+	regulator_bulk_disable(OV9282_NUM_SUPPLIES, ov9282->supplies);
+
 	return ret;
 }
 
@@ -909,6 +945,8 @@ static int ov9282_power_off(struct device *dev)
 
 	clk_disable_unprepare(ov9282->inclk);
 
+	regulator_bulk_disable(OV9282_NUM_SUPPLIES, ov9282->supplies);
+
 	return 0;
 }
 
-- 
2.34.1

