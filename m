Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF191E0249
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2020 21:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388202AbgEXTZh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 May 2020 15:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387807AbgEXTZh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 May 2020 15:25:37 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D145EC05BD43
        for <linux-media@vger.kernel.org>; Sun, 24 May 2020 12:25:36 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id m18so18543027ljo.5
        for <linux-media@vger.kernel.org>; Sun, 24 May 2020 12:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xeJmQRJvkh8fRKHXAH/W536lRiSffIGCx+R099ed5PQ=;
        b=kcK3yrH4g4ts5H42rI7JP7vzXPX5ac10GjBC78+fEwYXQ3xZZpe9hpb7780Aet7sPu
         xaOopB6kTv3WLbIteq/l/ZlkTGa0IIAljayEsDG5Xhf/lutDdWeg6GFCGpjOr2Vvo2B3
         qPhOFBVuH/CquAHzfHkFJFtlHJ9ice2Wgsbb5A6DxzbPeQmJQ4INkwahmq/0YipuFFT0
         GeSvG0rKpIesgav6Oft8aO4BWDVkaW9fvA+h+VgH3GXCnJjN8Q3BpRjj703BjzvdbX9K
         2A5OKmiM6aZ2Y9bR9xuRVHh3eeBWjw5O3qbZhtwhlJwCQk4aJxXA0M75OZYXxJni35qu
         tyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xeJmQRJvkh8fRKHXAH/W536lRiSffIGCx+R099ed5PQ=;
        b=eSl/7mulGEzkDdl5CIpHI5aZmgx1AqtvAP5yWyYcHfY8KY6df7GXdsLtkRRujuLkCm
         E4hPt/KdE8sHrWHNnkOVupmvu8TKAS29bleElr2o6yn/Pm2XdiniJBI9yXpDept98vIf
         HxcoZI2nDS3oJ9r5RKOCyN7NFSqKzPX0ydNH5S8hrGFoSgHL8vX7VxkNFANdHvfeoqoC
         SbmWP32DSAy1wOINS8THTX1wKpFilcvHm1VAyb4aUSKHdDOHarjxKhGrb1dCqu41Oih4
         BpCh8F4f17A8Et390DuKfwpf+wITMUdV5cWkwX/VAYzOzUrxj9iXvaFpD7hAkt2srlGX
         iCPg==
X-Gm-Message-State: AOAM531YlXJW8XPUctd3EfN/qIgJmeygb98IabNGsDgrmgfWwXe81eYE
        UkTvdwgz/R0z0Hz1/ByvyckdEiRCZhy3cA==
X-Google-Smtp-Source: ABdhPJyZWmTTulqXDsNX7SFmBuKS+wkGmszWbb8/SsBCZAbUcqm2vhW7VXLbW742ya3E0gZXk1U0Lg==
X-Received: by 2002:a2e:b6cd:: with SMTP id m13mr12974189ljo.242.1590348335341;
        Sun, 24 May 2020 12:25:35 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id v10sm3878137lja.23.2020.05.24.12.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 12:25:34 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v3 01/10] media: i2c: imx290: set the format before VIDIOC_SUBDEV_G_FMT is called
Date:   Sun, 24 May 2020 22:24:56 +0300
Message-Id: <20200524192505.20682-2-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200524192505.20682-1-andrey.konovalov@linaro.org>
References: <20200524192505.20682-1-andrey.konovalov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the current driver 'media-ctl -p' issued right after the imx290 driver
is loaded prints:
pad0: Source
             [fmt:unknown/0x0]

The format value of zero is due to the current_format field of the imx290
struct not being initialized yet.

As imx290_entity_init_cfg() calls imx290_set_fmt(), the current_mode field
is also initialized, so the line which set current_mode to a default value
in driver's probe() function is no longer needed.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/media/i2c/imx290.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index f7678e5a5d87..2d8c38ffe2f0 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -722,9 +722,6 @@ static int imx290_probe(struct i2c_client *client)
 		goto free_err;
 	}
 
-	/* Set default mode to max resolution */
-	imx290->current_mode = &imx290_modes[0];
-
 	/* get system clock (xclk) */
 	imx290->xclk = devm_clk_get(dev, "xclk");
 	if (IS_ERR(imx290->xclk)) {
@@ -809,6 +806,9 @@ static int imx290_probe(struct i2c_client *client)
 		goto free_ctrl;
 	}
 
+	/* Initialize the frame format (this also sets imx290->current_mode) */
+	imx290_entity_init_cfg(&imx290->sd, NULL);
+
 	ret = v4l2_async_register_subdev(&imx290->sd);
 	if (ret < 0) {
 		dev_err(dev, "Could not register v4l2 device\n");
-- 
2.17.1

