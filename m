Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA0129123B
	for <lists+linux-media@lfdr.de>; Sat, 17 Oct 2020 16:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438267AbgJQOK4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Oct 2020 10:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438264AbgJQOKz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Oct 2020 10:10:55 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71525C0613CE;
        Sat, 17 Oct 2020 07:10:53 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 13so6166883wmf.0;
        Sat, 17 Oct 2020 07:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oVtD9RxYC46FZp/4Rt/dwhENN40PjOjFpcIMXcrNbK4=;
        b=hCV4R2HXld7SixgoJg0qXzjU6obJcCLi+EZoMPol7oN6NILOCux99UZYGVF9ec2rRG
         ENSezx9zYGBrrrh3BzVYpDR26imGQJfxjXBFHs9DEqNYKEjKFV31XK9Lx+yvTefNB1yS
         ALuec8B+Y4RAjk2YK+ulRJKxurSMRTIWdOXB0NMKHmwLqBG2UqaLRLYBIkkQ+Nd1Wzsy
         XVG5RRcxlX2dIb6jyr/2fwEKY7leazPqnY7WaiMJsVNcaa1infgSiufNIr6sH8sHWBg1
         1tIQnS0q59pf2drHoYy0Jhpn9EwAlKOmjeKtlIFyZasXYV+2go235s1yHasje9ffIyp2
         0dzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oVtD9RxYC46FZp/4Rt/dwhENN40PjOjFpcIMXcrNbK4=;
        b=RtdobqqZIwP9dCbU8nhAB3dgHctP1MjHlCca60fBUGYec6T2vlv0F0lzsXVt3s5Mbw
         gMgJwVodP3EL1Wd4ax1yK9O5FayT5EnUrSwMLTsopy5lUYlAGdADd7Rj5ohy4tPXT6aq
         962YBZ/MxbJXKIrDiuuyJKQDUAjujHS7caB7qQZbPWBYEQCFGeG6+lxsyUJQ4DoU6foe
         2Pr8PTfxzxodDoXcoqqVCMVYbiZ8eFfiaBMg/7IrCoOgB4UFkgnOBW8Mc5ZhTR2qR78Q
         fdgLYmqB6C9FtiSx6Yc4uwDrtAGKsCX7NhPNpwM8Swdtt167b5yG8kDG7BuDi9M/gI4a
         0BLA==
X-Gm-Message-State: AOAM530aL1veAWfrXA9J6V83DuzKNz8gJZuV4l7NX4ddX2mcbzeFUbiO
        ePvqNAc6/cvh6l2B5twYuwI=
X-Google-Smtp-Source: ABdhPJynHPJT6NIPtEuDClzehHGLcvQi2blrC9jrkrofTu+615BYm9ykBHnc/IFJf2y0RGOYDN1bfQ==
X-Received: by 2002:a1c:2901:: with SMTP id p1mr8947923wmp.170.1602943852107;
        Sat, 17 Oct 2020 07:10:52 -0700 (PDT)
Received: from localhost.localdomain (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id i33sm9130623wri.79.2020.10.17.07.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 07:10:51 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
To:     mchehab@kernel.org
Cc:     Alex Dewar <alex.dewar90@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] staging: media: atomisp: Don't abort on error in module exit path
Date:   Sat, 17 Oct 2020 15:09:44 +0100
Message-Id: <20201017140950.15989-3-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201017140950.15989-1-alex.dewar90@gmail.com>
References: <20201017140950.15989-1-alex.dewar90@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function lm3554_remove() checks for the return code for
lm3554_gpio_uninit() even though this is on the exit path and exits the
function, leaving the variable flash unfreed. Instead, print a warning and
free flash unconditionally.

Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 .../staging/media/atomisp/i2c/atomisp-lm3554.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
index 0043ae8e2ffa..44c41a0119a1 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
@@ -782,7 +782,7 @@ static int lm3554_gpio_init(struct i2c_client *client)
 	return 0;
 }
 
-static int lm3554_gpio_uninit(struct i2c_client *client)
+static void lm3554_gpio_uninit(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct lm3554 *flash = to_lm3554(sd);
@@ -791,13 +791,13 @@ static int lm3554_gpio_uninit(struct i2c_client *client)
 
 	ret = gpiod_direction_output(pdata->gpio_strobe, 0);
 	if (ret < 0)
-		return ret;
+		dev_err(&client->dev,
+			"gpio request/direction_output fail for gpio_strobe");
 
 	ret = gpiod_direction_output(pdata->gpio_reset, 0);
 	if (ret < 0)
-		return ret;
-
-	return 0;
+		dev_err(&client->dev,
+			"gpio request/direction_output fail for gpio_reset");
 }
 
 static void *lm3554_platform_data_func(struct i2c_client *client)
@@ -909,7 +909,6 @@ static int lm3554_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct lm3554 *flash = to_lm3554(sd);
-	int ret;
 
 	media_entity_cleanup(&flash->sd.entity);
 	v4l2_ctrl_handler_free(&flash->ctrl_handler);
@@ -919,16 +918,11 @@ static int lm3554_remove(struct i2c_client *client)
 
 	del_timer_sync(&flash->flash_off_delay);
 
-	ret = lm3554_gpio_uninit(client);
-	if (ret < 0)
-		goto fail;
+	lm3554_gpio_uninit(client);
 
 	kfree(flash);
 
 	return 0;
-fail:
-	dev_err(&client->dev, "gpio request/direction_output fail");
-	return ret;
 }
 
 static const struct dev_pm_ops lm3554_pm_ops = {
-- 
2.28.0

