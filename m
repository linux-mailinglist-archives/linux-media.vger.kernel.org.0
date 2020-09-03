Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5707125C8AF
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 20:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729047AbgICSZP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 14:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726543AbgICSZN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 14:25:13 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E810C061244;
        Thu,  3 Sep 2020 11:25:13 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id e11so5912164wme.0;
        Thu, 03 Sep 2020 11:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6TVg2OK2hGXGilOiMGa+DpJ5GeGbwsjFfDrzSkVbuKA=;
        b=AFN00XH7Eyre4NtFnj/KspJyhAtPGJ+unKamFXaWYl4W7R0xuq165WAyA44dz2PkSG
         uaBTPh/8ZiE6cKelB20/Rl48ewJvSG/W7L72LpWbKvJRjm7KZmCNWA1hmBcIkHZK1sry
         nrTb8bAixxow+1xSsZc+pziPclegbq7lI3l586tL9+Ft6p8RArmBfOPF+tUDbaO4+Id5
         eKHWls2Nm2iOa+tXaBkzi32/kBrYl6JkQ3f+0sCghxijLN7AXFR5SN65lUuOv37PmSpq
         5iSxbQnfMUvBhWkWxq91brfYFQYNN3aXVjUmKcJIwyfHkbCBVbHuEXtzDwTAv2as3JPH
         msyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6TVg2OK2hGXGilOiMGa+DpJ5GeGbwsjFfDrzSkVbuKA=;
        b=eTrtuOx6fD4VNeHX8nvZ2uWVNva/7Ah1y5xt3hhpM2OGewTnHx2vWNwtA7jEBZ54oA
         JDmYgyAXEk6C96+2TLJja5hJzGeV4pG2xm+2Gn79n7XeF8BUdjFosDKsWeJYbgCk2Wow
         1l5NMP1j5wdgVIRtbpjJBMgYW+IFTtJijBfZwuNpvEqoClm9fxAljfmBr9DPa21VtIp3
         u9LvVVecG9GGPyyNgXAexpH1wZb3U963u0NR+hdzZDChKdPhA7jJe3Hu6NPy1d5YfkZa
         rWl8hVOOrpbYzFs9lUrAJIlp704EfcakDvz6jk7YYKqPEOkDmuMhA0jj6xhL41XI+Qa1
         765A==
X-Gm-Message-State: AOAM5329cAo50zZTYAzBrBluCHWfk5kItiP7mmoOA81jcWN6K9OXtNxc
        wAuMHG4Wluf/iDr+juGof7k=
X-Google-Smtp-Source: ABdhPJztywUNWH4/E1kT1grqFBh/pHdE0KJ7zZ7jV/fTHF+EGgdPn57L6Zqc5Z1pGybImTyxd/7nPw==
X-Received: by 2002:a1c:b3c6:: with SMTP id c189mr3744522wmf.27.1599157511706;
        Thu, 03 Sep 2020 11:25:11 -0700 (PDT)
Received: from localhost.localdomain (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id c205sm5691139wmd.33.2020.09.03.11.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 11:25:11 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
To:     dan.carpenter@oracle.com
Cc:     Alex Dewar <alex.dewar90@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: media: atomisp: Fix error path in lm3554_probe()
Date:   Thu,  3 Sep 2020 19:24:51 +0100
Message-Id: <20200903182502.709300-1-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903173843.GF8299@kadam>
References: <20200903173843.GF8299@kadam>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The error path for lm3554_probe() contains a number of bugs, including:
 * resource leaks
 * jumping to error labels out of sequence
 * not setting the return value appropriately

Fix it up and give the labels more memorable names.

This issue has existed since the code was originally contributed in
commit a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2"),
although the code was subsequently removed altogether and then
reinstated with commit ad85094b293e ("Revert "media: staging: atomisp: Remove driver"").

Addresses-Coverity: 1496802 ("Resource leaks")
Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 .../media/atomisp/i2c/atomisp-lm3554.c        | 53 +++++++++++--------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
index 7ca7378b1859..cca10a4c2db0 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
@@ -833,7 +833,6 @@ static void *lm3554_platform_data_func(struct i2c_client *client)
 
 static int lm3554_probe(struct i2c_client *client)
 {
-	int err = 0;
 	struct lm3554 *flash;
 	unsigned int i;
 	int ret;
@@ -843,36 +842,38 @@ static int lm3554_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	flash->pdata = lm3554_platform_data_func(client);
-	if (IS_ERR(flash->pdata))
-		return PTR_ERR(flash->pdata);
+	if (IS_ERR(flash->pdata)) {
+		ret = PTR_ERR(flash->pdata);
+		goto err_free_flash;
+	}
 
 	v4l2_i2c_subdev_init(&flash->sd, client, &lm3554_ops);
 	flash->sd.internal_ops = &lm3554_internal_ops;
 	flash->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	flash->mode = ATOMISP_FLASH_MODE_OFF;
 	flash->timeout = LM3554_MAX_TIMEOUT / LM3554_TIMEOUT_STEPSIZE - 1;
-	ret =
-	    v4l2_ctrl_handler_init(&flash->ctrl_handler,
-				   ARRAY_SIZE(lm3554_controls));
+	ret = v4l2_ctrl_handler_init(&flash->ctrl_handler,
+				     ARRAY_SIZE(lm3554_controls));
 	if (ret) {
-		dev_err(&client->dev, "error initialize a ctrl_handler.\n");
-		goto fail2;
+		dev_err(&client->dev, "error initializing ctrl_handler");
+		goto err_unregister_sd;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(lm3554_controls); i++)
 		v4l2_ctrl_new_custom(&flash->ctrl_handler, &lm3554_controls[i],
 				     NULL);
 
-	if (flash->ctrl_handler.error) {
-		dev_err(&client->dev, "ctrl_handler error.\n");
-		goto fail2;
+	ret = flash->ctrl_handler.error;
+	if (ret) {
+		dev_err(&client->dev, "ctrl_handler error");
+		goto err_free_ctrl_handler;
 	}
 
 	flash->sd.ctrl_handler = &flash->ctrl_handler;
-	err = media_entity_pads_init(&flash->sd.entity, 0, NULL);
-	if (err) {
-		dev_err(&client->dev, "error initialize a media entity.\n");
-		goto fail1;
+	ret = media_entity_pads_init(&flash->sd.entity, 0, NULL);
+	if (ret) {
+		dev_err(&client->dev, "error initializing media entity");
+		goto err_free_ctrl_handler;
 	}
 
 	flash->sd.entity.function = MEDIA_ENT_F_FLASH;
@@ -881,20 +882,26 @@ static int lm3554_probe(struct i2c_client *client)
 
 	timer_setup(&flash->flash_off_delay, lm3554_flash_off_delay, 0);
 
-	err = lm3554_gpio_init(client);
-	if (err) {
+	ret = lm3554_gpio_init(client);
+	if (ret) {
 		dev_err(&client->dev, "gpio request/direction_output fail");
-		goto fail2;
+		goto err_del_timer;
 	}
-	return atomisp_register_i2c_module(&flash->sd, NULL, LED_FLASH);
-fail2:
+
+	ret = atomisp_register_i2c_module(&flash->sd, NULL, LED_FLASH);
+	if (!ret)
+		return 0;
+
+err_del_timer:
+	del_timer_sync(&flash->flash_off_delay);
 	media_entity_cleanup(&flash->sd.entity);
+err_free_ctrl_handler:
 	v4l2_ctrl_handler_free(&flash->ctrl_handler);
-fail1:
+err_unregister_sd:
 	v4l2_device_unregister_subdev(&flash->sd);
+err_free_flash:
 	kfree(flash);
-
-	return err;
+	return ret;
 }
 
 static int lm3554_remove(struct i2c_client *client)
-- 
2.28.0

