Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 031A55013BC
	for <lists+linux-media@lfdr.de>; Thu, 14 Apr 2022 17:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344816AbiDNOZY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 10:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349429AbiDNOUI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 10:20:08 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 797AEA27EC
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 07:11:14 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id u3so7110773wrg.3
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 07:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eo7d7o1OtMwpdqCJpbeEvNSKLWc67zY7+ZWCbWv5/Vw=;
        b=no20RHpAWyr7dmRwZcAyyvT/XfIpQ4WWpxEG0H2Dh6T3UtAyaRgLIfHAGUsyHbZTVM
         KCLD+4C3ko3DOU2Bm0va1jbS7oD+rP1huS9RinSCzibGxawrsRFLMfBlpCBI8GtS5Uww
         K0TwJ6bYUCBfBO5cPqETHY9s9x1jGcgh4NERrbUvIz7gIQd4JdPJDar3fV64xx/MY+tQ
         QdRU9goJjnm53J2V42hQbU69ISn4F6OBn6Ta3xcbGDFamI8y7mV4MoJhPPVXGqFObbex
         LNTwMj+xDntKsHMrXfCtUEZGJxNG6I/++3snZ/tFdBhNJbDiiAOV/EbZEtKj/CniqJHu
         73Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eo7d7o1OtMwpdqCJpbeEvNSKLWc67zY7+ZWCbWv5/Vw=;
        b=oC0sjS3U2a+bZmQIJRsxqJ6rC9ZpyT7ToAqhHoID7aT87zS129txGYT2bky4aPaEOU
         ZEFn+b25NjFIGIS3nrl21q60g06PagJXn4pnp14gFDBqfmehamN7cJI3MNyciXs/GfLb
         0AkKViq1hEDaOPZT/WJWjYwk9lbhdpZODdwnyJyLRywfzquSH1WjF4/bn3dyWytUjURA
         DMrRepVOQNBEHfNIAfepwY16Tp7uleiHYDmZcjs7egFk66b4Sm7QDoeqYbVF9fE7W7FB
         lXOYejxqBPPYBToACphmdHb1xz0sTrjxo9yr5K7D0LvAzKT3Nf3OWBq4TpRfrneZZFm6
         yezQ==
X-Gm-Message-State: AOAM533aAnrUtu1Q42igVrHhQu8osJ17HhjuGDaFOjjq1dRrEHFomCGM
        fC3RCM8XixYYepXU5UaVqH3HeA==
X-Google-Smtp-Source: ABdhPJxvwdBc7TM4mXUFIoa4vM2Rwncv3jQRMspQhnRgTXJMH2YJHDlPL8r/i+CCRw3DqK6KFkLetQ==
X-Received: by 2002:a5d:4882:0:b0:207:97dd:111c with SMTP id g2-20020a5d4882000000b0020797dd111cmr2420435wrq.115.1649945472992;
        Thu, 14 Apr 2022 07:11:12 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 61-20020adf8043000000b00205e1d92a41sm1934551wrk.74.2022.04.14.07.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 07:11:12 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robert.foss@linaro.org, hfink@snap.com, jgrahsl@snap.com,
        dmitry.baryshkov@linaro.org, vladimir.zapolskiy@linaro.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v4 2/3] media: i2c: imx412: Add bulk regulator support
Date:   Thu, 14 Apr 2022 15:11:07 +0100
Message-Id: <20220414141108.1365476-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414141108.1365476-1-bryan.odonoghue@linaro.org>
References: <20220414141108.1365476-1-bryan.odonoghue@linaro.org>
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
 drivers/media/i2c/imx412.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index be3f6ea55559..6d0746d6c634 100644
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
@@ -128,6 +135,8 @@ struct imx412 {
 	struct media_pad pad;
 	struct gpio_desc *reset_gpio;
 	struct clk *inclk;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(imx412_supply_names)];
+	unsigned int num_supplies;
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct v4l2_ctrl *link_freq_ctrl;
 	struct v4l2_ctrl *pclk_ctrl;
@@ -946,6 +955,16 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
 		return -EINVAL;
 	}
 
+	/* Get optional DT defined regulators */
+	imx412->num_supplies = ARRAY_SIZE(imx412_supply_names);
+	for (i = 0; i < imx412->num_supplies; i++)
+		imx412->supplies[i].supply = imx412_supply_names[i];
+
+	ret = devm_regulator_bulk_get(imx412->dev, imx412->num_supplies,
+				      imx412->supplies);
+	if (ret)
+		return ret;
+
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!ep)
 		return -ENXIO;
@@ -1011,6 +1030,12 @@ static int imx412_power_on(struct device *dev)
 	struct imx412 *imx412 = to_imx412(sd);
 	int ret;
 
+	ret = regulator_bulk_enable(imx412->num_supplies, imx412->supplies);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable regulators\n");
+		return ret;
+	}
+
 	gpiod_set_value_cansleep(imx412->reset_gpio, 1);
 
 	ret = clk_prepare_enable(imx412->inclk);
@@ -1025,6 +1050,7 @@ static int imx412_power_on(struct device *dev)
 
 error_reset:
 	gpiod_set_value_cansleep(imx412->reset_gpio, 0);
+	regulator_bulk_disable(imx412->num_supplies, imx412->supplies);
 
 	return ret;
 }
@@ -1044,6 +1070,8 @@ static int imx412_power_off(struct device *dev)
 
 	clk_disable_unprepare(imx412->inclk);
 
+	regulator_bulk_disable(imx412->num_supplies, imx412->supplies);
+
 	return 0;
 }
 
-- 
2.35.1

