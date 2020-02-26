Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7AB9170AFB
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 23:00:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbgBZWAS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 17:00:18 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45886 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727503AbgBZWAS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 17:00:18 -0500
Received: by mail-lf1-f68.google.com with SMTP id z5so452561lfd.12
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2020 14:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QErWqDNx6ma/Mrb8WHfJQvYV3gtMn9M2hXBvJASL1DQ=;
        b=wYKAQgnBinTi8kDWS/NFRHJMD9GAw64zo5eozb9jwu2ChqYkoQlXLHXWHQVd3wtOjx
         0PJP8a70J3eYoSwneNct4ohjl/G2sxiTQtadgLWWQ7+yAgUCniFoEkwrLJJdIaEamhzm
         fH7FFCHX8YfoX4CiAtHkTM9NMi2DfykIHP56AieGZaH11al+OXbnMQqcX1jw3fT39yqy
         xV4DEMJ2qzTv2M+OQsfzC+Uh2I7HY+xa24g0WpFno4lldbm0eU6gqNCftwmgWLK8rGRi
         vKmUeRijS2PSQJzxlUcdnYgK7ifhxW1WUVUOfOijGfV+UbM7NF6WphUnhFryjbDrUhxs
         DCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QErWqDNx6ma/Mrb8WHfJQvYV3gtMn9M2hXBvJASL1DQ=;
        b=FjZ6T1f8xyeOy4nrc+Xfvky41wgqhBGSXfiwagQioWtHAy/otRbIDUKQckSiAJPHMw
         25u9n7X0A+39wCuY/V9Nd3seJ85i0C1ph98WfFU48N2GgGEEIkHGeP7ljsYlgiyQolrw
         buLSirtPS66WM+Z9mo3qKnmfTUnKY7p83ljDoNSXu5u5t4Tkg6A621omzHFWAxzVNikL
         JpWKPq4/SjHJIl+i3hRadskFGgzLuknbNZzL8CSbHhgSsekhGmDROlnErDa9Hbj2eBWR
         w4Low5NPzzUDm5uL5J2yvOmTxiNENH2XAZtQUgICfa+j3bwunPyy59ak8xNgae4e6vhW
         oV4w==
X-Gm-Message-State: ANhLgQ3pMxXY/h2D0cLUR/G1R+4zlXExnf1dbq5HYsNP4UEyfgBLstd5
        TXYyyR53LQU9aAdvPBIsjLFwuA==
X-Google-Smtp-Source: ADFU+vsIMS6/a2zeGP/md2OrcANipbEX9d3cbZW7MWcbV0NSirOCb9TdCOsgHRjqrLaNdaE40a3eGA==
X-Received: by 2002:a19:878a:: with SMTP id j132mr357831lfd.83.1582754416436;
        Wed, 26 Feb 2020 14:00:16 -0800 (PST)
Received: from localhost.localdomain (95-28-65-22.broadband.corbina.ru. [95.28.65.22])
        by smtp.googlemail.com with ESMTPSA id a9sm316856lfr.37.2020.02.26.14.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 14:00:15 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi
Cc:     linux-media@vger.kernel.org, manivannan.sadhasivam@linaro.org,
        peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH 3/3] media: i2c: imx290: fix reset GPIO pin handling
Date:   Thu, 27 Feb 2020 00:59:13 +0300
Message-Id: <20200226215913.10631-4-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226215913.10631-1-andrey.konovalov@linaro.org>
References: <20200226215913.10631-1-andrey.konovalov@linaro.org>
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

