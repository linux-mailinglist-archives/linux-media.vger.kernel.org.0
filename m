Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD892500DEE
	for <lists+linux-media@lfdr.de>; Thu, 14 Apr 2022 14:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243560AbiDNMsD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 08:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243603AbiDNMrm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 08:47:42 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0860591352
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 05:45:13 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id i82-20020a1c3b55000000b0038ccb70e239so1249580wma.3
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 05:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TetJ+YGsYwHxHTcrd6CDcsRlhEWmSBeG8bejCy5vik0=;
        b=sHmCdnt1ZcmOIKANo1zNafkUimL48nTnjspHryIIf4GNqM3OG847ZIfuxXUC7eIJte
         xHnph2xb4o4Y5CnIrHaJ215YtEBJ5yYdZhkihLa4+BdwXq9GiV4kZVMzTbqQiBliWDQA
         J3esgDxZ8mV5tc1YFcsj74o3NRNEfMoU6C1SG0jVGAKrxCcS/0sCEwwXXZ8vcZOkINdU
         mRsIFX8c6QV/hZGUzlNnOe1jvzf5IQWRj7EqBdSrYpSACg/T184t6HzLQ8oZg9PzKbFh
         DoBpoeNFSZsS4bcC90e1OjRqwuRGWKR1qpOldv2e8qe+LI0xvyS7lGc6G9HNNQwwcS1I
         9NCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TetJ+YGsYwHxHTcrd6CDcsRlhEWmSBeG8bejCy5vik0=;
        b=606tINrxjRHR0J9PN4VvH3dMa+XPd0k8imgL0ViAGxG+ptrhb3mNJ7U2xohtYJM32T
         7ARmusq511A4pU2JZDrPpO6C3r+61s9PgEgDC7I1eKGguMDy1X5Uh/ic45jbYrgOb8HX
         QHf6hPoJGA6jHHujVPu/sgthQZHqusM4PGR0ho15tsDwEPYdb9/NEw+nJMouO+icjKgz
         OmFc2m0qnyW70Pv7FP3CgZKxBaodp63ZyKSE3ekIE8DOipaHwSba73yhjetWqcBvQ5bJ
         cH8JOr5oU7NE02yeW3qB8oAkZFO3RfpHSaVtHbaubO20WAP32WUmjO9qTAnQVx6Ta1r6
         iyiA==
X-Gm-Message-State: AOAM532Dt2y6JPhr9FJLBPlnRJZTV53YLQK52NBpVS7S0cWfYasqJu9b
        pg7SCrwKD2srge9jfapftGMjxw==
X-Google-Smtp-Source: ABdhPJzgzi+xgXmcvzIYYpShgPyKz/+8o8j1HU+azeKTg5eIbw+q7MD6nXG5as3vktiUPWzAlVEwng==
X-Received: by 2002:a05:600c:4f0f:b0:38c:c8f5:73e7 with SMTP id l15-20020a05600c4f0f00b0038cc8f573e7mr2974869wmq.201.1649940311613;
        Thu, 14 Apr 2022 05:45:11 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d20-20020a05600c34d400b0038caf684679sm6350086wmq.0.2022.04.14.05.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 05:45:11 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robert.foss@linaro.org, hfink@snap.com, jgrahsl@snap.com,
        dmitry.baryshkov@linaro.org, vladimir.zapolskiy@linaro.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v3 2/2] media: i2c: imx412: Add bulk regulator support
Date:   Thu, 14 Apr 2022 13:45:05 +0100
Message-Id: <20220414124505.1329295-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414124505.1329295-1-bryan.odonoghue@linaro.org>
References: <20220414124505.1329295-1-bryan.odonoghue@linaro.org>
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
 drivers/media/i2c/imx412.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index be3f6ea55559..27170e641b53 100644
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
@@ -1011,10 +1030,19 @@ static int imx412_power_on(struct device *dev)
 	struct imx412 *imx412 = to_imx412(sd);
 	int ret;
 
+	ret = regulator_bulk_enable(imx412->num_supplies,
+				    imx412->supplies);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable regulators\n");
+		return ret;
+	}
+
 	gpiod_set_value_cansleep(imx412->reset_gpio, 1);
 
 	ret = clk_prepare_enable(imx412->inclk);
 	if (ret) {
+		regulator_bulk_disable(imx412->num_supplies,
+				       imx412->supplies);
 		dev_err(imx412->dev, "fail to enable inclk");
 		goto error_reset;
 	}
@@ -1044,6 +1072,9 @@ static int imx412_power_off(struct device *dev)
 
 	clk_disable_unprepare(imx412->inclk);
 
+	regulator_bulk_disable(imx412->num_supplies,
+			       imx412->supplies);
+
 	return 0;
 }
 
-- 
2.35.1

