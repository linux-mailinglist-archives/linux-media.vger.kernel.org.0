Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E21A142AD6F
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 21:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233210AbhJLTsW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 15:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232145AbhJLTsW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 15:48:22 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04380C061570
        for <linux-media@vger.kernel.org>; Tue, 12 Oct 2021 12:46:20 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id i15so913334uap.0
        for <linux-media@vger.kernel.org>; Tue, 12 Oct 2021 12:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=jvxgRd8YxGNgcUbs08KjHruyLVddDgpA1yDFDwiPukM=;
        b=Ztopj+aQ+s1iwk14nTROpLv4jNvUXXapHHemwEP96ihC4ZMxec5uul/5rGJoPgYvVr
         qWVdWEMFXydHBLet4pqJJ6+wAzwGbt2153L+unDLEdSzGgaI/TgLwbVkB6v5S6synmTk
         iXOiNlApQqssScXfoyEpQ5RmanBZqzgnJBOLMcelfTAzQfomZ2McuhPejsGMDdf/bpbN
         SVxlufxAz4eZoGI7H+43GJFhZa6IVAbtmX4Dt0av2dwgMZbU2lZJ+JrRVawJD0tSrkFa
         fKRuQzC/2KLUjk17vIAnKvIIjwIeWgLIdrX/oBN6JeGThpbw6/u5QzY3vDLFxmi3imPs
         zl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=jvxgRd8YxGNgcUbs08KjHruyLVddDgpA1yDFDwiPukM=;
        b=5iZAp1Rs14uHglQ5XBnkFL1sXowjKzCb/P36zhkil5mgZWsCBOSuWnWKYgt8+/eiVH
         RNDUmOKG0jh8plC/hx1onTVlLxs+RKVShfleLy1zuO7ZJy71fpEumGzv0RoXlAoSLVJL
         ab8KR4JVz3rebsCD1tLOD0VoAHJR64iw3a2VWvgAIIGPrabcOuJD/kDcybkNvFVaOytF
         a9V7wzE+wV4yRx0QwmtCWztgN3g1tZrikHCRbQT87oAjCKacQcFPtGlQpTosTxT4lEBH
         PTtEp2QDD4+3cJM3xsCy9uH5yFOWcYk+7CwAGAlfhl86PUNLGrR5VPQ5TAfXx3wWtR6Q
         3Xig==
X-Gm-Message-State: AOAM53322vgL08pX7bi2jQgihiwr4tRx1CrvXDbER9ojOFoB0WN0W0K3
        ptLBE0g9TqGf+O1ndLAE9rAUfU+Ky2U9Hbb1
X-Google-Smtp-Source: ABdhPJzx0n+J9qsQyaRKqPHUA7R+y/TNzuuxldhR8N0cATxljXVxnBwjZTplz+A+UWHCwEee6Vtm1w==
X-Received: by 2002:a05:6102:38c6:: with SMTP id k6mr8360143vst.59.1634067978908;
        Tue, 12 Oct 2021 12:46:18 -0700 (PDT)
Received: from fedora ([187.64.134.142])
        by smtp.gmail.com with ESMTPSA id h21sm4795449vsl.14.2021.10.12.12.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 12:46:18 -0700 (PDT)
Date:   Tue, 12 Oct 2021 16:46:15 -0300
From:   =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>
To:     linux-media@vger.kernel.org
Cc:     a.hajda@samsung.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Subject: [PATCH] s5c73m3: adding gpiod support for the s5c73m3
Message-ID: <YWXmB3yHDeR9ORN7@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Removing old gpiod interface and replacing it for the gpiod consumer
interface.

Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
 drivers/media/i2c/s5c73m3/s5c73m3-core.c | 25 +++++++++++++-----------
 include/media/i2c/s5c73m3.h              |  3 ++-
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
index e2b88c5e4f98..0c69a3fc7ebe 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -10,7 +10,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/firmware.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/media.h>
@@ -1349,9 +1349,9 @@ static int s5c73m3_oif_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 static int s5c73m3_gpio_set_value(struct s5c73m3 *priv, int id, u32 val)
 {
-	if (!gpio_is_valid(priv->gpio[id].gpio))
+	if (!priv->gpio[id].gpio)
 		return 0;
-	gpio_set_value(priv->gpio[id].gpio, !!val);
+	gpiod_set_value(priv->gpio[id].gpio, !!val);
 	return 1;
 }
 
@@ -1548,20 +1548,24 @@ static int s5c73m3_configure_gpios(struct s5c73m3 *state)
 	static const char * const gpio_names[] = {
 		"S5C73M3_STBY", "S5C73M3_RST"
 	};
+	static const char * const prop_names[] = {
+		"standby", "xshutdown",
+	};
+
 	struct i2c_client *c = state->i2c_client;
 	struct s5c73m3_gpio *g = state->gpio;
-	int ret, i;
+	int i;
 
 	for (i = 0; i < GPIO_NUM; ++i) {
-		unsigned int flags = GPIOF_DIR_OUT;
+		unsigned int flags = GPIOD_OUT_LOW;
 		if (g[i].level)
-			flags |= GPIOF_INIT_HIGH;
-		ret = devm_gpio_request_one(&c->dev, g[i].gpio, flags,
-					    gpio_names[i]);
-		if (ret) {
+			flags = GPIOD_OUT_HIGH;
+		g[i].gpio = devm_gpiod_get_optional(&c->dev, prop_names[i],
+				flags);
+		if (IS_ERR(g[i].gpio)) {
 			v4l2_err(c, "failed to request gpio %s\n",
 				 gpio_names[i]);
-			return ret;
+			return PTR_ERR(g[i].gpio);
 		}
 	}
 	return 0;
@@ -1586,7 +1590,6 @@ static int s5c73m3_parse_gpios(struct s5c73m3 *state)
 				prop_names[i]);
 			return -EINVAL;
 		}
-		state->gpio[i].gpio = ret;
 		state->gpio[i].level = !(of_flags & OF_GPIO_ACTIVE_LOW);
 	}
 	return 0;
diff --git a/include/media/i2c/s5c73m3.h b/include/media/i2c/s5c73m3.h
index a51f1025ba1c..41e2235f0626 100644
--- a/include/media/i2c/s5c73m3.h
+++ b/include/media/i2c/s5c73m3.h
@@ -17,6 +17,7 @@
 #ifndef MEDIA_S5C73M3__
 #define MEDIA_S5C73M3__
 
+#include <linux/gpio/consumer.h>
 #include <linux/videodev2.h>
 #include <media/v4l2-mediabus.h>
 
@@ -26,7 +27,7 @@
  * @level: indicates active state of the @gpio
  */
 struct s5c73m3_gpio {
-	int gpio;
+	struct gpio_desc *gpio;
 	int level;
 };
 
-- 
2.31.1

