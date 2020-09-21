Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EEC5273542
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 23:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727724AbgIUVyi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 17:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727321AbgIUVyi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 17:54:38 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC554C061755;
        Mon, 21 Sep 2020 14:54:37 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id m6so14589705wrn.0;
        Mon, 21 Sep 2020 14:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PaPRo0XlQ3Tqwwdz0cCFZ//U/ydF76ExJKyjshRmBL8=;
        b=mQUGkUWQXgqJEx41Ikk5Hdh7OPWSBXJZuQRhZ573ys5Jn+iXZng7yrOfOJdle52rq6
         WCjDXE+d0JTrgWfcWYzco+9iZy1HiqbWrJ1afABFQMAPIgn6g4sx4UNyWaLO6oTSeScI
         ysLB2YvjfZKPrk4aP+t1b+kZGbQpqlOPWQ0wC7RKH5mkTG6/wOhwgM4xs4jPkizGYByR
         eSP3tzX0t59A6+6wGR8cia4SHmqYuenVKkiTWttPHaqhQNnvGuCT69HGf+kzUsb7LVPq
         nFvJN+A0y6niiO9CDkISYt6BWMJc6H56DuZ92LRJXN6j9tI5y+3+Tk8eUygv0idkc2mn
         WyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PaPRo0XlQ3Tqwwdz0cCFZ//U/ydF76ExJKyjshRmBL8=;
        b=Dra2w7q2blZWS7ZE8HhPHyB9GEwbbFgiFMs13lsV7ISHSDhjtAEbWvglQf9eGEoA8a
         OhDMBSJR2QisV9TtD1BWTrntSB9Rat8MvXkHVYLnVIyYj0ZWBS5tLqzQYUsRlbAwOhxZ
         Cd4UAmjrWlPhRuI4yKxWicJdwZGcyRvco+Op0YVL0t3so3ULXQv9VGQyIbI3aX5/hnlc
         HTJLsRiAPFk2ng3NW86Osap5PdJmtNnszU3XQNmg6Z5wEyFOrMtAK2Pyek+rSNdoLYEw
         CNxzlBfC2EfeJkw+mLpcrk6Rr46h8zS5FOcgJ4AgMDlpG6ttIvY4XhU2ZdAUtkmEjm5M
         ZM0g==
X-Gm-Message-State: AOAM531ldbeJj4lkm8Py+hIBJwEUpGUoS/PQWp8p/Ucz0ke5mB0JwJLr
        LO/EV+EcAmYCGJZoPYomYfYDGoqXOEsRegAV
X-Google-Smtp-Source: ABdhPJwOrXQsNVkLMNJRRUIBZMRIVAg+clona6i8/KWzTK0i1abl4qfa8y4dIMttSgtqUWMSYcL6BQ==
X-Received: by 2002:adf:dcd1:: with SMTP id x17mr1983338wrm.150.1600725276670;
        Mon, 21 Sep 2020 14:54:36 -0700 (PDT)
Received: from localhost.localdomain (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id t124sm1282200wmg.31.2020.09.21.14.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 14:54:36 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 1/5] staging: media: atomisp: Fix error path in lm3554_probe()
Date:   Mon, 21 Sep 2020 22:53:51 +0100
Message-Id: <20200921215359.45003-2-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921215359.45003-1-alex.dewar90@gmail.com>
References: <20200921215359.45003-1-alex.dewar90@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
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

