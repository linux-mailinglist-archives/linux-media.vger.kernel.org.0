Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 103464FB15F
	for <lists+linux-media@lfdr.de>; Mon, 11 Apr 2022 03:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244226AbiDKBdv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Apr 2022 21:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244227AbiDKBdu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Apr 2022 21:33:50 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2392B3EA9D
        for <linux-media@vger.kernel.org>; Sun, 10 Apr 2022 18:31:38 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id r13so20804875wrr.9
        for <linux-media@vger.kernel.org>; Sun, 10 Apr 2022 18:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N+Sd3XQqKZuKjlUjPG3x4ncDDe97DiTcIqhqg+djNQQ=;
        b=AWN2Hrv4psLo6G9lENTC2PigdvnCG4+GGNTd9d2xN2xrtdCNJu7yCw8oHPjqxuLKGH
         aWVSBsSrLmelnVnFMltar6ec4486c/lpxJYLLIn9gI9c9r9c6nTTz6/e2hdwHGJ16Ag7
         4PjPX3w3pO9mlNkORMfOTuGDpOyiL78yGqAalrZmp9mXG/J3SRd0VQA5QQZ4K8GazAQX
         aAGXJ50VJx5eyWFwK4VOyumWeZ0yvYtG6s5x7xpxvZcazjpiea6qRvCppLpwT5H58iBr
         gbw6ZU0H+0mvXRmheQYtPsTsx/I4/v3eGRcTK/2x1Ndw5JfHfybgGi5biQib0wxk0giz
         Fttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N+Sd3XQqKZuKjlUjPG3x4ncDDe97DiTcIqhqg+djNQQ=;
        b=NlZZtu5XxCxhhD0rIH/aVvhnPE09hJytEWlZpmGHQjO5AA7abcaj67vgM//mFlkPLw
         2pIE/vok21eTySOg7gmnTcJzhGl/5FZYVxaNxoA0/4E3fhEWRG5u7DzuT8r/58WJnIT4
         4wXUKRU/g0ij3eplmzXfEw0pT6BxwXBQjOQ1nYD0FLYgoGvgmhvIUp+48d1WsDZPR/A7
         5Kr/NpIED3oaqC+2KVMePTfo9OtzcG1BCk87fL9bychg73mY3v4n5HGN6DWMmiJBrvND
         jO19JJNMY4SCre/DrekHr78x/vqBiAybGiKw4SayULy5pXVcEYP/k9auRYJMA4YOEbLi
         OdfQ==
X-Gm-Message-State: AOAM5337n4Chz8usilX6iHV4o8nNRHyQPILUIWVMMjAj+NKoC6+ru2LC
        EzFLpU0RE1umaoS7Uoepm7EYiA==
X-Google-Smtp-Source: ABdhPJwdit9ufgaeV7A8lq0+RA/xIZAjjtZ8xW1wVja+YAFOecwW8dpobQ6RENdabY4Fg/iKwvdNvg==
X-Received: by 2002:a05:6000:1d93:b0:205:e0af:e079 with SMTP id bk19-20020a0560001d9300b00205e0afe079mr22340416wrb.525.1649640696684;
        Sun, 10 Apr 2022 18:31:36 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id w1-20020a5d6081000000b002061b616b83sm15862934wrt.39.2022.04.10.18.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 18:31:36 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     robert.foss@linaro.org, hfink@snap.com, jgrahsl@snap.com,
        dmitry.baryshkov@linaro.org, vladimir.zapolskiy@linaro.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v2 2/2] media: i2c: imx412: Add bulk regulator support
Date:   Mon, 11 Apr 2022 02:31:31 +0100
Message-Id: <20220411013131.3553098-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411013131.3553098-1-bryan.odonoghue@linaro.org>
References: <20220411013131.3553098-1-bryan.odonoghue@linaro.org>
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

