Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A143CE33B
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 15:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbfJGNVL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 09:21:11 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42512 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728189AbfJGNVL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 09:21:11 -0400
Received: by mail-lj1-f193.google.com with SMTP id y23so13599815lje.9;
        Mon, 07 Oct 2019 06:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GX+ni17mNRYs8d+zDraCFt5XjyO8QrKC7e0GjBCgxpI=;
        b=ZrpnlfpoajhMTGD+dc7ahQIpQCzOyJR5LL9BNxN+LKiXujzPYb7w2/gT8bXXqBvlcf
         2CBKvCMsQWwSLwDW4GMNDVcKGIsm69209KTkTlrFvEAphMPlMQFhK2enJmhei0jxGPpo
         6/TmB5JwKj0/397PRQsotnqAFvyA86EI2wOHVKFLhpVWo5m0iUbxcXsAyW7T7TlpgsRH
         IhQ2CGwBoUbSegvpaFIpn4tJJa98kDX8DP+GPG1aPOea8FJysR/vc80hb6y4nP5bVrLf
         f1j0cumOAnF98L/BpDWvgnSrbip3D8BN+LJMyE8gTZHwez0OyghphKhL72Ac0BIg0++Q
         MjHA==
X-Gm-Message-State: APjAAAUVSl4l4pbVer9RZLX3g0GEIZATqbOVf43fOQKL336Pe5iPglOw
        KlT3oyjxyu4RUIQIRRU1m1gvvsiSTHc=
X-Google-Smtp-Source: APXvYqwTiyl7vXh7wBWQ+wrgodTUPtVV+DuJLHve45RSomE4YPDtbhkZ7EGbf6WB5oMfjWwBY+58Og==
X-Received: by 2002:a2e:9185:: with SMTP id f5mr16724482ljg.235.1570454468658;
        Mon, 07 Oct 2019 06:21:08 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id z14sm2687360lfh.30.2019.10.07.06.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 06:21:07 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v7 3/6] ad5820: Add support for enable pin
Date:   Mon,  7 Oct 2019 15:20:43 +0200
Message-Id: <20191007132050.27298-6-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007132050.27298-1-ribalda@kernel.org>
References: <20191007132050.27298-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds support for a programmable enable pin. It can be used in
situations where the ANA-vcc is not configurable (dummy-regulator), or
just to have a more fine control of the power saving.

The use of the enable pin is optional.

Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/media/i2c/Kconfig  |  2 +-
 drivers/media/i2c/ad5820.c | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 78dc64d7b0e7..30d460844dff 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -975,7 +975,7 @@ if MEDIA_CAMERA_SUPPORT
 
 config VIDEO_AD5820
 	tristate "AD5820 lens voice coil support"
-	depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
+	depends on GPIOLIB && I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
 	help
 	  This is a driver for the AD5820 camera lens voice coil.
 	  It is used for example in Nokia N900 (RX-51).
diff --git a/drivers/media/i2c/ad5820.c b/drivers/media/i2c/ad5820.c
index 7a49651f4d1f..76aab651f217 100644
--- a/drivers/media/i2c/ad5820.c
+++ b/drivers/media/i2c/ad5820.c
@@ -19,6 +19,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
+#include <linux/gpio/consumer.h>
 
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -47,6 +48,8 @@ struct ad5820_device {
 	u32 focus_ramp_time;
 	u32 focus_ramp_mode;
 
+	struct gpio_desc *enable_gpio;
+
 	struct mutex power_lock;
 	int power_count;
 
@@ -114,6 +117,8 @@ static int ad5820_power_off(struct ad5820_device *coil, bool standby)
 		ret = ad5820_update_hw(coil);
 	}
 
+	gpiod_set_value_cansleep(coil->enable_gpio, 0);
+
 	ret2 = regulator_disable(coil->vana);
 	if (ret)
 		return ret;
@@ -128,6 +133,8 @@ static int ad5820_power_on(struct ad5820_device *coil, bool restore)
 	if (ret < 0)
 		return ret;
 
+	gpiod_set_value_cansleep(coil->enable_gpio, 1);
+
 	if (restore) {
 		/* Restore the hardware settings. */
 		coil->standby = false;
@@ -138,6 +145,7 @@ static int ad5820_power_on(struct ad5820_device *coil, bool restore)
 	return 0;
 
 fail:
+	gpiod_set_value_cansleep(coil->enable_gpio, 0);
 	coil->standby = true;
 	regulator_disable(coil->vana);
 
@@ -304,6 +312,15 @@ static int ad5820_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	coil->enable_gpio = devm_gpiod_get_optional(&client->dev, "enable",
+						    GPIOD_OUT_LOW);
+	if (IS_ERR(coil->enable_gpio)) {
+		ret = PTR_ERR(coil->enable_gpio);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&client->dev, "could not get enable gpio\n");
+		return ret;
+	}
+
 	mutex_init(&coil->power_lock);
 
 	v4l2_i2c_subdev_init(&coil->subdev, client, &ad5820_ops);
-- 
2.23.0

