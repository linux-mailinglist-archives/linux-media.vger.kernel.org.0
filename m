Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E850A4FAEFA
	for <lists+linux-media@lfdr.de>; Sun, 10 Apr 2022 18:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243620AbiDJQiO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Apr 2022 12:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243610AbiDJQiL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Apr 2022 12:38:11 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB70D3AA71
        for <linux-media@vger.kernel.org>; Sun, 10 Apr 2022 09:35:59 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id v2so6004374wrv.6
        for <linux-media@vger.kernel.org>; Sun, 10 Apr 2022 09:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N+Sd3XQqKZuKjlUjPG3x4ncDDe97DiTcIqhqg+djNQQ=;
        b=lRS8goDMmhJ8AO3N2b6iyEPldFjLSg9hLeE9o6SnZQ+uI8nOY/CGHxZhXwykqJVrRz
         NI/O+kF5ufuTkek+62d9qCko/u27PkX7nHrH6WAC3MbLklLZNTeM6ArOSA7TmSGaAKdx
         Mg9kHxIP7O3wUOVN5sSR7HPBqbp3hQEVOfPMAyk5lMS1YgP9RSoRkkSzY0SzeQWiaOmv
         h3x1teK3j7Y9ybKw30PrMa2CP723aJB11cmR5R5u6CYW+amcH47+fWEAPwuqgqAvkUcQ
         Y0Z2giAu6y5yrgiNgx2SuXwEq2EoqvsqyHeNTQOfDTKG3W9I8AkbjfXgAHDCzvxv9avn
         0DSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N+Sd3XQqKZuKjlUjPG3x4ncDDe97DiTcIqhqg+djNQQ=;
        b=3i+UytgNoQ3Kzf34A6CcIA0ZoDYlROI3FaZjdEA0PbDfzudM2QmC1Ibi1CJXxHUi+A
         +OQaSLUEbfTdx8Vyn/i6M/b+C5kXVBxzf/Yl/YFvkeiDkJz5fGNRGAGFJ8KhmODOrkTh
         FIUIGn0lHMPDDKT2FFJR05grzwC5a3L20TBCk6h/i3nlzUrNbRCFB/Vmh2Bt1pX+nwPi
         2YxwbWIF38FY7GDdf4YC7fQ8j/j6hTd9vV3H0TEnBIfpaY6N03HzntfqfdpgbRnGgOYI
         0DrvcuME8HggclTIDmT+Y3EBqsrSUvxspLsuhIUpuCt0IU2HoIfNr2bX8XrC+cgk+oSZ
         vOPQ==
X-Gm-Message-State: AOAM530WvYknYGFAHceVuuUB3UI2hZvwfbVzOAd9KHldG62DcjoVIppy
        pbYO3DWoAdA9PSmFsPlznuqhsw==
X-Google-Smtp-Source: ABdhPJxiB8rHOcBtzMcYz8dLUCJBTdi5gOLU1jiHYbblbip2+AxEhSPKHEysx/bOsTmAM2Xmib9gbg==
X-Received: by 2002:adf:8063:0:b0:205:e19e:2bc1 with SMTP id 90-20020adf8063000000b00205e19e2bc1mr21921598wrk.177.1649608558383;
        Sun, 10 Apr 2022 09:35:58 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id a7-20020adffb87000000b00207982c7f4dsm6500126wrr.67.2022.04.10.09.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 09:35:57 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     robert.foss@linaro.org, hfink@snap.com, jgrahsl@snap.com,
        dmitry.baryshkov@linaro.org, vladimir.zapolskiy@linaro.org,
        bryan.odonoghue@linaro.org
Subject: [RESEND PATCH 2/2] media: i2c: imx412: Add bulk regulator support
Date:   Sun, 10 Apr 2022 17:35:53 +0100
Message-Id: <20220410163553.3501938-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220410163553.3501938-1-bryan.odonoghue@linaro.org>
References: <20220410163553.3501938-1-bryan.odonoghue@linaro.org>
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
 drivers/media/i2c/imx412.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index be3f6ea55559..44b92718b6cf 100644
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
+	int num_supplies;
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct v4l2_ctrl *link_freq_ctrl;
 	struct v4l2_ctrl *pclk_ctrl;
@@ -946,6 +955,17 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
 		return -EINVAL;
 	}
 
+	/* Get optional DT defined regulators */
+	imx412->num_supplies = ARRAY_SIZE(imx412_supply_names);
+	for (i = 0; i < imx412->num_supplies; i++)
+		imx412->supplies[i].supply = imx412_supply_names[i];
+
+	ret = devm_regulator_bulk_get(imx412->dev,
+				      imx412->num_supplies,
+				      imx412->supplies);
+	if (ret)
+		return ret;
+
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!ep)
 		return -ENXIO;
@@ -1011,6 +1031,13 @@ static int imx412_power_on(struct device *dev)
 	struct imx412 *imx412 = to_imx412(sd);
 	int ret;
 
+	ret = regulator_bulk_enable(imx412->num_supplies,
+				    imx412->supplies);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable regulators\n");
+		goto error_reset;
+	}
+
 	gpiod_set_value_cansleep(imx412->reset_gpio, 1);
 
 	ret = clk_prepare_enable(imx412->inclk);
@@ -1044,6 +1071,9 @@ static int imx412_power_off(struct device *dev)
 
 	clk_disable_unprepare(imx412->inclk);
 
+	regulator_bulk_disable(imx412->num_supplies,
+			       imx412->supplies);
+
 	return 0;
 }
 
-- 
2.35.1

