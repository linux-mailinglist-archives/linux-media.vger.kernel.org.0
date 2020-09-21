Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 522AD273556
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 23:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728518AbgIUVzk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 17:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbgIUVzh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 17:55:37 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2417BC061755;
        Mon, 21 Sep 2020 14:55:37 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id m6so14593521wrn.0;
        Mon, 21 Sep 2020 14:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=t6IkKnXa5tIfj0pEtiHch/id+y7KfUWCLs3pBM4+7Bw=;
        b=PINJawvQ9e9dquFTGr3zZx+5fm9L2BiwpAHxL74wVdUTWTQ89n3Kvz10/lWMYxqiY2
         xBYnD7L8FxZ7/R4caI6NUzLRu/mjXbSxlQ72Hg7c9skBQon3JaNsZZ/dZ+iUT7oUPUae
         P4zBqty9tOvDZEI/SBo72+1RWJPm9O/4e1ijPOi/4NA2qPOCP1C1B9VMaaLMzLo4nMFp
         6l/zp3Nl6a4SrEDiRFVU4FKXHIOl0+CeAbivhoM38DO6prMPg0bVyjEJpxCIfai6RV6L
         LBwSDQNcgoa/J4ukll6YHth/9asvcPFtlOsUUa42kCDDOtBAJCqq+8exPpT/Egr2rBQH
         pU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t6IkKnXa5tIfj0pEtiHch/id+y7KfUWCLs3pBM4+7Bw=;
        b=TDSbpRMTeoMlhyKlet9Byoy04bCSadOgzJzv3N+yN2L0HAXHJ9FCEPzQR/sELIkc6p
         oKgcqtNqn3YYAjb2XwbrmNHzYSXgfyFDlDdFdxZF7VpnEiijuSSS1VzKgbCASbbqe0Yt
         9g3aGemwTV2kwkQzFio5nb2piJxVkX6eXOfxq22up8LAL4qZkdZdAu/BbvsZn0PjWCXA
         sAFQl8IHGP1XjlJk/hKWQgar2rJcLyjk4k5HKJY0mnxZdvyLjeUqI62m4TxJRQyGXopm
         36Gwct0GHrmBPy5br7DfFfXX4AW590P684E9hdKw/1KonYa5XC3MzEpBTiga8ileqn83
         H84Q==
X-Gm-Message-State: AOAM5336m0AWV+9MVNz3rcRXTUuYSLEHTYh6J9N2QlRP5JlSippjxANR
        gmz7EpN5M7LXMxUwS6/YUfw=
X-Google-Smtp-Source: ABdhPJwWDNjkSOFG5QNhQ+EcOhRxbhHygXIASP2+2Z2iIZMH8zrj0Y480HY7ngQKNF4hGEBQ7ZqT6A==
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr1994655wrp.390.1600725335846;
        Mon, 21 Sep 2020 14:55:35 -0700 (PDT)
Received: from localhost.localdomain (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id t124sm1282200wmg.31.2020.09.21.14.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 14:55:35 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 4/5] staging: media: atomisp: Don't abort on error in module exit path
Date:   Mon, 21 Sep 2020 22:53:57 +0100
Message-Id: <20200921215359.45003-5-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921215359.45003-1-alex.dewar90@gmail.com>
References: <20200921215359.45003-1-alex.dewar90@gmail.com>
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
index d78014847e67..d446ee8e93db 100644
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
@@ -907,7 +907,6 @@ static int lm3554_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct lm3554 *flash = to_lm3554(sd);
-	int ret;
 
 	media_entity_cleanup(&flash->sd.entity);
 	v4l2_ctrl_handler_free(&flash->ctrl_handler);
@@ -917,16 +916,11 @@ static int lm3554_remove(struct i2c_client *client)
 
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

