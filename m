Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8E91F0D01
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2020 18:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbgFGQay (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Jun 2020 12:30:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgFGQaw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Jun 2020 12:30:52 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CEB8C08C5C5
        for <linux-media@vger.kernel.org>; Sun,  7 Jun 2020 09:30:52 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id s1so17519422ljo.0
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2020 09:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cA0rxP4uX8r0J5dTgAkrFDikDC5/+iYQEYBegCVDUX8=;
        b=ASfk4mbizWj5L7lpupyxEymymo/ZPFF5KNCbDMYF6Et1/uJaP800Mfx0DoYPGapzb3
         hv+HiIqeR8Jmk4vCo83x/+lGNoqGIhXXzuS7cqSUerNNvoyN+x+fG13WxaDOjJb1P7zY
         Hq00PryzQhJZ5KYXKmAzcJzfwntzokREZ+XswmdY6VcJHEszaNWj2fnnA1Pab+RGwv8b
         hQxJ7lsbe7/eI/X8X/Vo44h3opbHOiIy5xfS29Vu0NQ7uivA+7aD2UN+EMTD/qlmCC+U
         ml+/P1OFSTs+7tzsHv2dzm7qCRG1MvFt5+YpubFXKPhydNo/YV+sVDIvl7zNr8I2E3iJ
         M3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cA0rxP4uX8r0J5dTgAkrFDikDC5/+iYQEYBegCVDUX8=;
        b=k4UWuVGX25TmwPF6lb4UrxPY3tdJufwdWew3189GfmQLbVWcptcLsxPFto7JMez0Y/
         E/6Fa6MApNY37jcgyIGW7P2aFpne7YTmkAYtJQuroQW13gBDy06m8ybMzs5jTNQsPVMQ
         tAO8n0R9xvwRMRRbbLLVWZkVN3ETt3W2pUv+tbbOKE6mm0GN3I2tVRmjLavOaK2jwRtB
         GC5D5OyYm80ims3o0CR1nUE1GKAnnpqwjg7j11q7zxYMeGmkueL8BDgI0JIkvyW2L7+U
         4rJnCCDCLlu+ZeqeID3QFwe7qAXqGU6ipvBIqr55nCIBLjreDXrEyu4NVbnFExuWyhT5
         X5NQ==
X-Gm-Message-State: AOAM531QrDtGAsOGUX5u+6w0y5CUrumhatTG0BO86YGiSjskqlaC08zq
        J0tEw4ZH1oLFmrDN5RZ2rfljXQ==
X-Google-Smtp-Source: ABdhPJyjLyOxmRLxqc1IiL0wIQLnC2WD0apwurqLMvIwHjY92oYJs7K6WG3OlmNqcFSoR6JrCrCN7w==
X-Received: by 2002:a2e:1412:: with SMTP id u18mr9629998ljd.309.1591547450613;
        Sun, 07 Jun 2020 09:30:50 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id l7sm1726511ljj.55.2020.06.07.09.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 09:30:50 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v4 03/10] media: i2c: imx290: fix reset GPIO pin handling
Date:   Sun,  7 Jun 2020 19:30:18 +0300
Message-Id: <20200607163025.8409-4-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200607163025.8409-1-andrey.konovalov@linaro.org>
References: <20200607163025.8409-1-andrey.konovalov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to https://www.kernel.org/doc/Documentation/gpio/consumer.txt,

- all of the gpiod_set_value_xxx() functions operate with the *logical* value.
So in imx290_power_on() the reset signal should be cleared/de-asserted with
gpiod_set_value_cansleep(imx290->rst_gpio, 0), and in imx290_power_off() the
value of 1 must be used to apply/assert the reset to the sensor. In the device
tree the reset pin is described as GPIO_ACTIVE_LOW, and gpiod_set_value_xxx()
functions take this into account,

- when devm_gpiod_get_optional() is called with GPIOD_ASIS, the GPIO is not
initialized, and the direction must be set later; using a GPIO
without setting its direction first is illegal and will result in undefined
behavior. Fix this by using GPIOD_OUT_HIGH instead of GPIOD_ASIS (this asserts
the reset signal to the sensor initially).

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/media/i2c/imx290.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index d0322f9a8856..7b1de1f0c8b7 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -628,7 +628,7 @@ static int imx290_power_on(struct device *dev)
 	}
 
 	usleep_range(1, 2);
-	gpiod_set_value_cansleep(imx290->rst_gpio, 1);
+	gpiod_set_value_cansleep(imx290->rst_gpio, 0);
 	usleep_range(30000, 31000);
 
 	return 0;
@@ -641,7 +641,7 @@ static int imx290_power_off(struct device *dev)
 	struct imx290 *imx290 = to_imx290(sd);
 
 	clk_disable_unprepare(imx290->xclk);
-	gpiod_set_value_cansleep(imx290->rst_gpio, 0);
+	gpiod_set_value_cansleep(imx290->rst_gpio, 1);
 	regulator_bulk_disable(IMX290_NUM_SUPPLIES, imx290->supplies);
 
 	return 0;
@@ -757,7 +757,8 @@ static int imx290_probe(struct i2c_client *client)
 		goto free_err;
 	}
 
-	imx290->rst_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_ASIS);
+	imx290->rst_gpio = devm_gpiod_get_optional(dev, "reset",
+						   GPIOD_OUT_HIGH);
 	if (IS_ERR(imx290->rst_gpio)) {
 		dev_err(dev, "Cannot get reset gpio\n");
 		ret = PTR_ERR(imx290->rst_gpio);
-- 
2.17.1

