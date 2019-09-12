Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF458B0F4F
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 14:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731938AbfILM6O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 08:58:14 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:55764 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731927AbfILM6N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 08:58:13 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CCw8Xj092114;
        Thu, 12 Sep 2019 07:58:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568293089;
        bh=0nKBHKh658w9Px5pzqwSjEqC1c/Rx5bK6Y6t/EfyzZQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=UBeyn4YkgxIYm1x55j+fsSMCdunBZOiA1Os8hNurQcNgpMYFF2OuEzLqPFlY7MPbr
         BO0XKlMQfmAMjznEEL9/WZ4U+YX9okUsyPUEDtEFjVIG/5V7sPJpiViY7ZNcJgdG0v
         nTzYBCr7LFTtlHNEhg+6V1m/cPrJB7MIrYso1xCo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8CCw8Q2105924
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Sep 2019 07:58:08 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 07:58:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 07:58:08 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CCw4Zi095654;
        Thu, 12 Sep 2019 07:58:08 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 4/6] media: i2c: ov2659: Add optional powerdown gpio handling
Date:   Thu, 12 Sep 2019 08:00:05 -0500
Message-ID: <20190912130007.4469-5-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190912130007.4469-1-bparrot@ti.com>
References: <20190912130007.4469-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On some board it is possible that the sensor 'powerdown'
pin might be controlled with a gpio instead of being
tied to always powered.

This patch add support to specify an optional gpio
which will be set at probe time and remained on.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/i2c/Kconfig  |  2 +-
 drivers/media/i2c/ov2659.c | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 7eee1812bba3..315c1d8bdb7b 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -634,7 +634,7 @@ config VIDEO_OV2640
 config VIDEO_OV2659
 	tristate "OmniVision OV2659 sensor support"
 	depends on VIDEO_V4L2 && I2C
-	depends on MEDIA_CAMERA_SUPPORT
+	depends on MEDIA_CAMERA_SUPPORT && GPIOLIB
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index efbe6dc720e2..c64f73bef336 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -32,6 +32,8 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
+#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/videodev2.h>
@@ -232,6 +234,8 @@ struct ov2659 {
 	struct sensor_register *format_ctrl_regs;
 	struct ov2659_pll_ctrl pll;
 	int streaming;
+	/* used to control the sensor powerdownN pin */
+	struct gpio_desc *pwrdn_gpio;
 };
 
 static const struct sensor_register ov2659_init_regs[] = {
@@ -1391,6 +1395,7 @@ static int ov2659_probe(struct i2c_client *client)
 	struct v4l2_subdev *sd;
 	struct ov2659 *ov2659;
 	struct clk *clk;
+	struct gpio_desc *gpio;
 	int ret;
 
 	if (!pdata) {
@@ -1414,6 +1419,14 @@ static int ov2659_probe(struct i2c_client *client)
 	    ov2659->xvclk_frequency > 27000000)
 		return -EINVAL;
 
+	/* Optional gpio don't fail if not present */
+	gpio = devm_gpiod_get_optional(&client->dev, "powerdown",
+				       GPIOD_OUT_HIGH);
+	if (IS_ERR(gpio))
+		return PTR_ERR(gpio);
+
+	ov2659->pwrdn_gpio = gpio;
+
 	v4l2_ctrl_handler_init(&ov2659->ctrls, 2);
 	ov2659->link_frequency =
 			v4l2_ctrl_new_std(&ov2659->ctrls, &ov2659_ctrl_ops,
-- 
2.17.1

