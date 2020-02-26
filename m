Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3878617014B
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 15:34:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727593AbgBZOeP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 09:34:15 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34865 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727459AbgBZOeP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 09:34:15 -0500
Received: by mail-lj1-f196.google.com with SMTP id q8so3363256ljb.2
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2020 06:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0h477ermyaM+1FlDGPMhooEHPslQQ+iIyNo16N6lH30=;
        b=ZadRuyI+FFxcE2dNAEHAd1OhUiX0NrofKC5yZpUstqiZF4nBd1Q15VYQVe5/8OVmg4
         /cdyqkMykHKcWpOECLjAZz1KNsZofkVNbxv7bHBJBAOLYjsgCZK7B/y4aJBcIpJKufRd
         A5uAi2vD/1okGLNMp5kZogD+TZCDdxx3LosStwDzF9bES82k1ItUxC/L5p/pU5zD3MZd
         ud855RQujs8EaG3qRnOyUAAQGTzqG/9HWc5bATeEsHRAxX1qiX/f4/K61mJ9PRfCZtjX
         Xf9awMFgsRcfvBs3+RLhxeqWihLVYL26hqScn9/GLeLbZV9VzqpGDU9ohHvRPVT7PEqq
         AHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0h477ermyaM+1FlDGPMhooEHPslQQ+iIyNo16N6lH30=;
        b=QT2AvCG4jrM1+wXg9y8XGv8nxwTKObAtc/9svywZF/3mev+DiYhhZJZ7VbCMFM8IBe
         duVkWtpjkkI8SlW9g9x7G74MwLQcIXJi6hn1TiwN0207i7/yT8pqbGqELlOx37S7NBDB
         Zu/0G+vyKKndZv172zoU65iYETsGepit00KdH5B83iFMg7yiQG8TdxIt8P8B04nGLNjO
         ROsob9XoaL4oQhO1sboDILRbe9bhabU3R8W3n98A8B/+/8nID/dSWcDUOMXbUMmdvEvy
         yua7BnZ3ZGsfIXF8144u1Kvo1rPSMrOWghWVPvoxzKy22KL9N8NoPgUGGunYyj9j57PP
         z/ng==
X-Gm-Message-State: APjAAAWIS14h2kIWjgXJpxVAc4xTqSXzyYSzXSCRqsISgaeNT30n3OIp
        f3HxiKLZPWHTTOnPqYH+xIpfuy715y/puw==
X-Google-Smtp-Source: APXvYqw0kTj3tH4RO6QGtj6pRdsTup80j7K1hu+ilnszpU6BO8XkM2y61Nxp3Cd3Dpu4yRpC/KD4lQ==
X-Received: by 2002:a2e:804f:: with SMTP id p15mr3198002ljg.184.1582727653252;
        Wed, 26 Feb 2020 06:34:13 -0800 (PST)
Received: from octa.pomac.com (c-1cdd225c.013-195-6c756e10.bbcust.telenor.se. [92.34.221.28])
        by smtp.gmail.com with ESMTPSA id w9sm1284931ljh.106.2020.02.26.06.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 06:34:12 -0800 (PST)
From:   Ian Kumlien <ian.kumlien@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, Ian Kumlien <ian.kumlien@gmail.com>
Subject: [PATCH] Fix build failure due to missing select REGMAP_I2C
Date:   Wed, 26 Feb 2020 15:34:05 +0100
Message-Id: <20200226143405.55303-1-ian.kumlien@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While upgrading from 5.5.2 -> 5.5.6 I was surprised by:
ld: drivers/media/i2c/tvp5150.o: in function `tvp5150_probe':
tvp5150.c:(.text+0x11ac): undefined reference to
`__devm_regmap_init_i2c'
make: *** [Makefile:1078: vmlinux] Error 1

The fix was quick enough, make VIDEO_TVP5150 select REGMAP_I2C
And a quick grep showed that it was needed by more targets.

Signed-off-by: Ian Kumlien <ian.kumlien@gmail.com>
---
 drivers/media/i2c/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index c68e002d26ea..1d1170de8c98 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -238,6 +238,7 @@ config VIDEO_ADV7604
 	tristate "Analog Devices ADV7604 decoder"
 	depends on VIDEO_V4L2 && I2C && VIDEO_V4L2_SUBDEV_API
 	depends on GPIOLIB || COMPILE_TEST
+	select REGMAP_I2C
 	select HDMI
 	select V4L2_FWNODE
 	help
@@ -379,6 +380,7 @@ config VIDEO_TVP5150
 	tristate "Texas Instruments TVP5150 video decoder"
 	depends on VIDEO_V4L2 && I2C
 	select V4L2_FWNODE
+	select REGMAP_I2C
 	help
 	  Support for the Texas Instruments TVP5150 video decoder.
 
@@ -584,6 +586,7 @@ config VIDEO_IMX214
 	tristate "Sony IMX214 sensor support"
 	depends on GPIOLIB && I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
 	depends on V4L2_FWNODE
+	select REGMAP_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX214 camera.
@@ -612,6 +615,7 @@ config VIDEO_IMX274
 config VIDEO_IMX290
 	tristate "Sony IMX290 sensor support"
 	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	select REGMAP_I2C
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -804,6 +808,7 @@ config VIDEO_OV7670
 config VIDEO_OV7740
 	tristate "OmniVision OV7740 sensor support"
 	depends on I2C && VIDEO_V4L2
+	select REGMAP_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV7740 VGA camera sensor.
-- 
2.25.1

