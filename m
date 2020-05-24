Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCEF1E0252
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2020 21:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388297AbgEXTZs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 May 2020 15:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388243AbgEXTZn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 May 2020 15:25:43 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65A26C05BD43
        for <linux-media@vger.kernel.org>; Sun, 24 May 2020 12:25:43 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id e125so9393333lfd.1
        for <linux-media@vger.kernel.org>; Sun, 24 May 2020 12:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cA0rxP4uX8r0J5dTgAkrFDikDC5/+iYQEYBegCVDUX8=;
        b=bXZUmt4Q97nbHMur0+wddhj6NHibdNegK7WYEBHb3FXq/cXll1GDGCXmku19BFj5Nv
         AcWpGD1X351yyzB/DqYBq+8mBFu/9qUShZ/hNApIK/U6hgV0yj+5azJO1hbH2k+eGM17
         C8D0jT6d+q8N1+XN67HUr0foWANMbTV/C3yJElLdOIEhjVmNbzaYplzsxINkXKKjSrZC
         +FTaMiqnHoM1cU8EyhRdDSF+Gcfv/daIYVmennTR/D/Bhr5GLZPL5fL+mbRsoYEG4GiI
         arQy37b7UuNXnMroZHstTyInswcMLqrzyvk4ECcYUGfayRJd+UoigQu2fAxTY6HqVbmu
         caqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cA0rxP4uX8r0J5dTgAkrFDikDC5/+iYQEYBegCVDUX8=;
        b=Ttf+YuqLO8MTf/AMunoxiLgCM4/nU5WsGTyA7xMSRSUnVLo0aEXaHShvX9PXeBkNL+
         xonRTv+wDCyoYJeIQm4ciiEhs0oxsUOTQ1Cdo707O0ep9uh3/Etf09XXvJQpRweRrbbr
         TGESFoW/1cxbVYYBSjhL9O7QoVT126X2MQ4ekY274dA9VY25xPMkNuJwFBJx6gmquzEb
         qGSTEm2WEMBRZQoDPEo4sY0aIJJpI1Dt/Z+qvMfYPh3BKlZn1jQpU0fh33SuJOCee7oj
         Y5cvy5wYi821tRwGeAd3f1LiClIk8rA+dkXl5EoNWOEpL2Nf9wchVKtRcgD0ExpeXsB6
         EM7A==
X-Gm-Message-State: AOAM530VV5NMwS9UNBMwL7PiU0itCA06fgl1G+iijdheyrovJ+qVoBt1
        qcGChcP3bxzfwo4/0TMWX93FBQ==
X-Google-Smtp-Source: ABdhPJx0C0ywxASkq6HnfsazUJ4P8BtoLgib8fabRATVLYdBjqfrmIXTOinQ/nOYpw6Gk5h9DHeF+w==
X-Received: by 2002:ac2:4143:: with SMTP id c3mr12541402lfi.131.1590348341928;
        Sun, 24 May 2020 12:25:41 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id v10sm3878137lja.23.2020.05.24.12.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 12:25:41 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v3 03/10] media: i2c: imx290: fix reset GPIO pin handling
Date:   Sun, 24 May 2020 22:24:58 +0300
Message-Id: <20200524192505.20682-4-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200524192505.20682-1-andrey.konovalov@linaro.org>
References: <20200524192505.20682-1-andrey.konovalov@linaro.org>
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

