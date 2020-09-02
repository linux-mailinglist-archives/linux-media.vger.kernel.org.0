Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CACE225B40A
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 20:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728111AbgIBSn7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 14:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728047AbgIBSn6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 14:43:58 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA5A5C061244;
        Wed,  2 Sep 2020 11:43:57 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id t10so508698wrv.1;
        Wed, 02 Sep 2020 11:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UKk0FikPFSnv2wlgEYZiX1TTnSriok/p6lQGPIKn3B8=;
        b=YU9/MzA5Xfr3hz+eiBR3BSbV89vqkeWvzNr6+qXwIbDW+DS7o4ok2Lpr1oAP3E9Fv2
         EgRkgvM3ELkiqDu6fREZPNELXRy+JXBZeKK7yCQX16KbDg879r+85zhYgbLB/2CSLOPa
         T8+pKX0a5pXYKVjmqXoENXclcUdsICKUm10d/EgEZmNOYQDMUewoKhXIG4BZ0Z4xpSP9
         aDS9xfj7dVocMJARiyawFRZxY307R6RgqiE+mUx86pEQeqQjJwiZ8Uv4lLHhFn92iGdm
         h9zqEbbzaWh91f6LmopjVwlq073Zx0enuj5vUFIYEOKmZQTedDt90ITXvSoUB5Hsi7wJ
         xZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UKk0FikPFSnv2wlgEYZiX1TTnSriok/p6lQGPIKn3B8=;
        b=ZJwGpMJjUeo6d+6LJVmzN3qG+0zgip37xGqiKgpDQwXTNXNbP4QabiHWbjMDejBV9r
         iTgts3MuUi2yz1HskcmhOfFDZqTw436trpaehi4nHmRlB2ZCuCFSWSMwkAh4Ab7rTO4j
         dFxxUHKoKcd4FoQ4O/iQ3gzfwD8V+InicXRIANKGcfESxSLkR7jvPBa3XYgIo0QhMB79
         VhriKZSThYqmqiHxzvvQZ1TRmJqj0M9/CpLNj7V9oHPm0K/V/CnTrDdLtj9RSx8VpwOW
         PVmXuQxatKBh2l59D+XZ3WUEg19wHzUk6thZww2Ki05Rksmrl2p1aD3mcLag0nxjpuIL
         vItw==
X-Gm-Message-State: AOAM533uDwTtnG3wx5ayXsCpQysCQXWzi5u7jMFjY2nth7R6Rv3PJIJs
        BF0XyCRJoHLiUBm87UqWjnw=
X-Google-Smtp-Source: ABdhPJxkaoiLsTUQO7T2dIlHN18eiRrmRwRn8OeMgrU5jihup2RN5cDNezt0rf3blbWyMPHHwKvSYA==
X-Received: by 2002:adf:fa02:: with SMTP id m2mr1662464wrr.273.1599072236550;
        Wed, 02 Sep 2020 11:43:56 -0700 (PDT)
Received: from localhost.localdomain (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id g18sm818276wru.27.2020.09.02.11.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 11:43:56 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
Cc:     Alex Dewar <alex.dewar90@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: Fix error path in lm3554_probe()
Date:   Wed,  2 Sep 2020 19:41:50 +0100
Message-Id: <20200902184207.479525-1-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
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

Addresses-Coverity: ("Resource leak")
Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 .../media/atomisp/i2c/atomisp-lm3554.c        | 47 ++++++++++---------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
index 7ca7378b1859..9aad6721fc84 100644
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
@@ -881,20 +882,22 @@ static int lm3554_probe(struct i2c_client *client)
 
 	timer_setup(&flash->flash_off_delay, lm3554_flash_off_delay, 0);
 
-	err = lm3554_gpio_init(client);
-	if (err) {
+	ret = lm3554_gpio_init(client);
+	if (ret) {
 		dev_err(&client->dev, "gpio request/direction_output fail");
-		goto fail2;
+		goto err_cleanup_entity;
 	}
 	return atomisp_register_i2c_module(&flash->sd, NULL, LED_FLASH);
-fail2:
+
+err_cleanup_entity:
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

