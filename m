Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 447304FAEE6
	for <lists+linux-media@lfdr.de>; Sun, 10 Apr 2022 18:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240658AbiDJQd3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Apr 2022 12:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240648AbiDJQd1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Apr 2022 12:33:27 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EF61DEF8
        for <linux-media@vger.kernel.org>; Sun, 10 Apr 2022 09:31:16 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id u17-20020a05600c211100b0038eaf4cdaaeso1962574wml.1
        for <linux-media@vger.kernel.org>; Sun, 10 Apr 2022 09:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N+Sd3XQqKZuKjlUjPG3x4ncDDe97DiTcIqhqg+djNQQ=;
        b=Q7ocK6N0ggpuHGZsHmzBa/+PGDmMECjwx7kMe1uFNFageuCax9ty6xIb1PFQvfOfoB
         QeR5GXymp9iIMdo7wXpI1OBofgXcp3zVUH3WJ64rv64o6IKBJnYzh6BQ8nkOiuW6GwIn
         DJ4FdLkFGx2JiBGlzBNJBDt51ndoLW5m1jC9Hkhu6TSy2xe3TCsVBLoxzD6s+imAOp28
         b5+dsY9lSHgLpZSX22gLdXXBDrT63PBEv5FT/MP9fiTaQ6jzCppgrzn+2RCQC53Vq1xR
         jlJB2lM8NXb3F/vkgOm5+QVMUOQ4pzNzRccf59Rc6JZyN2gW1OdC33l84ULH0iziewqx
         4NiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N+Sd3XQqKZuKjlUjPG3x4ncDDe97DiTcIqhqg+djNQQ=;
        b=T4rf3K/ACXHiMVd4ffwfLB62tCFhH1uHuGhXld6bCuLBSKebMEYoaPkliASdH0PCfz
         kVWqxEjAHH3Nl+SRlJx5K8qdMz9NyxW5ybVrBCM28Ql42fbI9pCH5At1oblV44lNGDns
         VMrTiDVS7ZbIS0RGt+WSmoGH6IODAUFzoy1xirv5Txdh0gwZg2pwn2NtmN59TCgUSfc5
         nOlOvneIIXjY4V+lBaTqX53LRsxuf7l9L5zYr0mtIgMA0jwM7CNjj+++GjX4SFHO5ceB
         mzVCyEj9ldzf15wiUgsRdvr7NlbdfKGLKE6wVDI66uD7lIkCiiyYZsWqUsnbqmAu6MzI
         iYLg==
X-Gm-Message-State: AOAM530Jt3MjmGFM98inDJf4zzo22sMinhB2IpOJDI6COZ7TdHidw17+
        XtaTeFk2l6xTdZlAZdXbbOJ+qA==
X-Google-Smtp-Source: ABdhPJzSe612r8SEwzwUK0+Pvg4NnP8evvLcJg2H+zwJJRykU7NyQGrWpq8bSAJjF5Z4oWQxqCxl9w==
X-Received: by 2002:a05:600c:4e8b:b0:38c:73d4:adb5 with SMTP id f11-20020a05600c4e8b00b0038c73d4adb5mr26026902wmq.34.1649608274686;
        Sun, 10 Apr 2022 09:31:14 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l6-20020a1c2506000000b0038e6fe8e8d8sm20616139wml.5.2022.04.10.09.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 09:31:14 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     robert.foss@linaro.org, hfink@snap.com, jgrahsl@snap.com,
        dmitry.baryshkov@linaro.org, vladimir.zapolskiy@linaro.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH 2/2] media: i2c: imx412: Add bulk regulator support
Date:   Sun, 10 Apr 2022 17:31:09 +0100
Message-Id: <20220410163109.3501513-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220410163109.3501513-1-bryan.odonoghue@linaro.org>
References: <20220410163109.3501513-1-bryan.odonoghue@linaro.org>
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

