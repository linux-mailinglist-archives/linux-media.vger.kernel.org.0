Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A653750294C
	for <lists+linux-media@lfdr.de>; Fri, 15 Apr 2022 14:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351076AbiDOMDX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Apr 2022 08:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353084AbiDOMDO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Apr 2022 08:03:14 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFEC66AA74
        for <linux-media@vger.kernel.org>; Fri, 15 Apr 2022 05:00:03 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id m14so10431116wrb.6
        for <linux-media@vger.kernel.org>; Fri, 15 Apr 2022 05:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d1y641nRGtjN50xjMNw5/o57jqZADQ8uigdFPEkJTyU=;
        b=gymdzLmCMoEPCVTZMbYMa+Yc3PkIVZg2v+9QxYPYaBgIWr2uhGjeotsMXVo0ja1kWu
         kjwdhjc7tFhfE5IpC9Rtw3rLNRqz86f0GSdLXvhXjJ5d7QgnPLNBEv1OvqyPezFr5SPJ
         9EWNFSi6uyHmdxaloiVggwcF3mM/Ta/ikHNiemO45TC8FGCs2/lJyLgJrSQTgvbhjfsK
         IQQwgbfo2dXFnDbs/M2x7bf140VtGAUSToqcRrvWRC2FE+M0xhFNjt6uYyTTIuBQcOYD
         aaNNwTVuwLfcLO9K/n2OD+nvI7plEc/6pcvQxK0gFTPKgegJH8ZqNDr5ygvVM4PL/BC+
         xSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d1y641nRGtjN50xjMNw5/o57jqZADQ8uigdFPEkJTyU=;
        b=wO+t8UC64uI1VTz4JKajVtT0lyykTd9lDBd4G5Ias1WnUZCyyEDL2QRXglcdb+Eh6O
         4MxKtn7KP8YU/oHPWqxRedUBXLXJh50dunbKieB7Hd8VPnIyuE+ZC9ByUxbKbYfJXMkb
         BEAAM/pbOQ1HQuOoJKuqDiT/jDBcs1nypVwjx/AewV7KaZrpsHWyb8YZfd3/b97olS/b
         g2jKbZ+mcXLehLm6pV7fJVyP5nwdzjoUxS1O2KV3AHUTLn4DIgZucdnDuQIc2SgLPmW6
         t86/xFTT3BLmQLLVVOw/mBwoHZeT5Hfq92JkWpNQkmlC8fnQqNjZ39byCntXIvuCqk3O
         UHMw==
X-Gm-Message-State: AOAM530fg44s1sh3c1kj1BD144f3fyJEpn/87eI8m9kU12F2dGZMbIWL
        iYIIPdiVoJIC8LUXj+OESpvkbA==
X-Google-Smtp-Source: ABdhPJyH6Ovh1R3/6pCX22brV+JOSgbCvt1cq88CdvUGW7aioz3V9VJIJO98IwqosBm8jbVa4CEe3w==
X-Received: by 2002:adf:f54a:0:b0:207:a746:e7 with SMTP id j10-20020adff54a000000b00207a74600e7mr5650813wrp.82.1650024002354;
        Fri, 15 Apr 2022 05:00:02 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bg8-20020a05600c3c8800b0038e4c5967besm5328568wmb.3.2022.04.15.05.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 05:00:01 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robert.foss@linaro.org, hfink@snap.com, jgrahsl@snap.com,
        dmitry.baryshkov@linaro.org, vladimir.zapolskiy@linaro.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v5 4/4] media: i2c: imx412: Add bulk regulator support
Date:   Fri, 15 Apr 2022 12:59:54 +0100
Message-Id: <20220415115954.1649217-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415115954.1649217-1-bryan.odonoghue@linaro.org>
References: <20220415115954.1649217-1-bryan.odonoghue@linaro.org>
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

Depending on the platform we may need to enable and disable three separate
regulators for the imx412.

- DOVDD
Digital I/O power

- AVDD
Analog power

- DVDD
Digital core power

The addition of these regulators shouldn't affect existing users using
fixed-on/firmware-controlled regulators.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/imx412.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index 84279a680873..1795a6180d60 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -11,6 +11,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
@@ -101,6 +102,12 @@ struct imx412_mode {
 	struct imx412_reg_list reg_list;
 };
 
+static const char * const imx412_supply_names[] = {
+	"dovdd",	/* Digital I/O power */
+	"avdd",		/* Analog power */
+	"dvdd",		/* Digital core power */
+};
+
 /**
  * struct imx412 - imx412 sensor device structure
  * @dev: Pointer to generic device
@@ -128,6 +135,7 @@ struct imx412 {
 	struct media_pad pad;
 	struct gpio_desc *reset_gpio;
 	struct clk *inclk;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(imx412_supply_names)];
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct v4l2_ctrl *link_freq_ctrl;
 	struct v4l2_ctrl *pclk_ctrl;
@@ -946,6 +954,16 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
 		return -EINVAL;
 	}
 
+	/* Get optional DT defined regulators */
+	for (i = 0; i < ARRAY_SIZE(imx412_supply_names); i++)
+		imx412->supplies[i].supply = imx412_supply_names[i];
+
+	ret = devm_regulator_bulk_get(imx412->dev,
+				      ARRAY_SIZE(imx412_supply_names),
+				      imx412->supplies);
+	if (ret)
+		return ret;
+
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!ep)
 		return -ENXIO;
@@ -1011,6 +1029,13 @@ static int imx412_power_on(struct device *dev)
 	struct imx412 *imx412 = to_imx412(sd);
 	int ret;
 
+	ret = regulator_bulk_enable(ARRAY_SIZE(imx412_supply_names),
+				    imx412->supplies);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable regulators\n");
+		return ret;
+	}
+
 	gpiod_set_value_cansleep(imx412->reset_gpio, 0);
 
 	ret = clk_prepare_enable(imx412->inclk);
@@ -1025,6 +1050,8 @@ static int imx412_power_on(struct device *dev)
 
 error_reset:
 	gpiod_set_value_cansleep(imx412->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(imx412_supply_names),
+			       imx412->supplies);
 
 	return ret;
 }
@@ -1044,6 +1071,9 @@ static int imx412_power_off(struct device *dev)
 
 	gpiod_set_value_cansleep(imx412->reset_gpio, 1);
 
+	regulator_bulk_disable(ARRAY_SIZE(imx412_supply_names),
+			       imx412->supplies);
+
 	return 0;
 }
 
-- 
2.35.1

