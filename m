Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED28273E20
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 11:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgIVJJq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 05:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgIVJJq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 05:09:46 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD7EC061755;
        Tue, 22 Sep 2020 02:09:46 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id o5so16149535wrn.13;
        Tue, 22 Sep 2020 02:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9Aesl8jwzB6h2AKl/DvTFdtB5ZWXuEURqgA0oOLGpZk=;
        b=VDVoXwPdoJzIDGxF1A9mAviiE0oyBHXTdSoaOLdOMRkoDxY/8EjbP/M/hoDlL05FOf
         iFKH0tIHHDHVnRiat7g7bcA+Hoq0o+i12qc6vh8Knf8/jUbDjMSJkvxWGJH6g6syZpNa
         YaQ0gxbJt9hsUsnMU7pEiPT/Cnx5LkQmCtXqSrP5mbYBaTJD98ohQ1d4tpvWixkjkLX1
         ehV98iaRuyhb5MiUaXUokNCajML3S57KeHYcpXzEfmOcg5RVJ6V6KStH7goxfbWjRtFf
         BnVmZiDA2d+8Uk5zcsrA9Pnn17BqWXFesH/HX/BaB9yggxlSnhSEVVPPr47B0hqC4K+r
         c1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Aesl8jwzB6h2AKl/DvTFdtB5ZWXuEURqgA0oOLGpZk=;
        b=re5dUTr29xFGpe/HmAncKpxFaFky0VmMjrGRdB7AYNbEA/cItHKXP0RYMo9cRQDD/J
         OoDkxk+UpOYZWeGOKxNXDOkRv77Q9Y8oSCKP+Rdj4MxD41mE7I/dw9P5uTsaXj+5sH5A
         vbrPH3WA7qmzamuLGGNf2nlYobHenJwqnxxjufSZKW6LTxetD51846cRBoy09B71/S/G
         V4sW9SqZkajRy5w2GpyU2GdJs9sbh38vqWJCzfi2fYfHXXxZSJJ/omluFyLPqzgOtsvB
         pY9j7D9hAtaL2hx/zeTaq0i6GUindXP9JelRA8Qi4Am0bXZdqFdcBwf2Y/r/HWRj+7KL
         hS9g==
X-Gm-Message-State: AOAM5306L8wBsgHXlaYQfilbfT3AJFPxPQWioPV/xfLiBqgii82fuKOE
        7Xryk4BxTBrUqiEwpn5JxI4=
X-Google-Smtp-Source: ABdhPJwwHB5mrPn87uWKoQZJjdNbWKBVf+VGCOSSjlZlRj5745cpIvJcM1poRmEQGc01rJ3g7/LCRw==
X-Received: by 2002:adf:e391:: with SMTP id e17mr3947261wrm.289.1600765784834;
        Tue, 22 Sep 2020 02:09:44 -0700 (PDT)
Received: from localhost.localdomain (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id u186sm3659332wmu.34.2020.09.22.02.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 02:09:44 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH REBASE 3/3] staging: media: atomisp: Don't abort on error in module exit path
Date:   Tue, 22 Sep 2020 10:09:10 +0100
Message-Id: <20200922090914.20702-4-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922090914.20702-1-alex.dewar90@gmail.com>
References: <21f18dc2-a1bc-0a37-0336-fc35170a40e9@gmail.com>
 <20200922090914.20702-1-alex.dewar90@gmail.com>
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
 .../staging/media/atomisp/i2c/atomisp-lm3554.c  | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
index 5e895586e80a..84c47c1f9eb4 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
@@ -794,7 +794,7 @@ static int lm3554_gpio_init(struct i2c_client *client)
 	return ret;
 }
 
-static int lm3554_gpio_uninit(struct i2c_client *client)
+static void lm3554_gpio_uninit(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct lm3554 *flash = to_lm3554(sd);
@@ -803,15 +803,16 @@ static int lm3554_gpio_uninit(struct i2c_client *client)
 
 	ret = gpio_direction_output(pdata->gpio_strobe, 0);
 	if (ret < 0)
-		return ret;
+		dev_err(&client->dev,
+			"gpio request/direction_output fail for gpio_strobe");
 
 	ret = gpio_direction_output(pdata->gpio_reset, 0);
 	if (ret < 0)
-		return ret;
+		dev_err(&client->dev,
+			"gpio request/direction_output fail for gpio_reset");
 
 	gpio_free(pdata->gpio_strobe);
 	gpio_free(pdata->gpio_reset);
-	return 0;
 }
 
 static void *lm3554_platform_data_func(struct i2c_client *client)
@@ -918,7 +919,6 @@ static int lm3554_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct lm3554 *flash = to_lm3554(sd);
-	int ret;
 
 	media_entity_cleanup(&flash->sd.entity);
 	v4l2_ctrl_handler_free(&flash->ctrl_handler);
@@ -928,16 +928,11 @@ static int lm3554_remove(struct i2c_client *client)
 
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

