Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8F583600CD
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 06:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbhDOEG1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 00:06:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbhDOEG0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 00:06:26 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B731C061574;
        Wed, 14 Apr 2021 21:06:03 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 31so534522pgn.13;
        Wed, 14 Apr 2021 21:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5okE2pNjTTIl5cI5vBAhcxTA0JhIWxKGfIW1DlM/nVc=;
        b=Ca2AWSv3XA6rjNJHwwHmVS5D1+lP5vAjQWRjq6oZzvFHILkiPrU8YSj4mRabHQpI/N
         XiGXoaEhvSfgWaT4UDcr8w8x9XxqHhmb5NqIqvuzGcgnQ1wOVKWvkAuSLR7Gc0MG7Raj
         z/qj6SiFCuH5gxzVOaaawsgaWKcMi7Qto2A8cfwIQyQJcKtn+w2VNkgtiKMWJSpy9rHQ
         jLX9JHqt4wMn+3c1Ek0kAKnEFr3gRCrhurEiD5mCZrlzOdz0Phv3pQoNQLBH3GezF7nn
         2T3sFDP5Aas4pHpYO+pswg8Z5aIPWe7DqK5sWoyETpcFzbYXMhDKPX/MJl6B4i6s5R7B
         /Cgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5okE2pNjTTIl5cI5vBAhcxTA0JhIWxKGfIW1DlM/nVc=;
        b=pCRMwaDyqbheeG+yImBF/QAfd3F68FMqsV2bZgsMGj6LedESvBKJNE1BTbmRaZUeTZ
         emt/Uya1/uR8ePhtSHAYc1VlLwmtuyyrG9OampO0Hg0uYo4qVt+M09s6UUm1uwnkFVpb
         jp49VwZe1L61nkxfvBaurkrt2MUA5sta/l9NCWM9tEWPSLy8ye7RJaxuAq8YdXcoJC9F
         ch5kXJdf/MI6ONtwOMpJrb7OrECHkTVUzbCgoK3NRF1+PMGlKNwbkBC2IEBbUaF6I+xk
         HqRRTjLBmcJvYlImicijJasfd7Ml2xBQjlthbW77wIO9BOvX+k9FNstBZWyNNIZlUt5T
         aK9w==
X-Gm-Message-State: AOAM533MlpfsHktuOWfSHW2XT/v0g8PCzBDHrztfNFfFt2dA4iyAg/qM
        aVtisM192HvcRpmigeimt7I=
X-Google-Smtp-Source: ABdhPJxXCM2VgJlCZBXJcwUQZVsSP4mmZOJBR0UN91zBxyHrFvAkHST7fZ5yMMgvM3F0TU5FvAmunQ==
X-Received: by 2002:a63:b509:: with SMTP id y9mr1663679pge.148.1618459563081;
        Wed, 14 Apr 2021 21:06:03 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id i17sm714406pfd.84.2021.04.14.21.05.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Apr 2021 21:06:02 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     krzysztof.kozlowski@canonical.com, robh+dt@kernel.org,
        shawnguo@kernel.org, krzk@kernel.org, linux@rempel-privat.de,
        s.riedmueller@phytec.de, matthias.schiffer@ew.tq-group.com,
        leoyang.li@nxp.com, arnd@arndb.de, olof@lixom.net,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        prabhakar.csengg@gmail.com, mchehab@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-media@vger.kernel.org, dillon min <dillon.minfei@gmail.com>
Subject: [PATCH v3 4/4] media: i2c: ov2659: Use clk_{prepare_enable,disable_unprepare}() to set xvclk on/off
Date:   Thu, 15 Apr 2021 12:05:35 +0800
Message-Id: <1618459535-8141-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618459535-8141-1-git-send-email-dillon.minfei@gmail.com>
References: <1618459535-8141-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

On some platform(imx6q), xvclk might not switch on in advance,
also for power save purpose, xvclk should not be always on.
so, add clk_prepare_enable(), clk_disable_unprepare() in driver
side to set xvclk on/off at proper stage.

Add following changes:
- add 'struct clk *clk;' in 'struct ov2659 {}'
- enable xvclk in ov2659_power_on()
- disable xvclk in ov2659_power_off()

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
v3: optimize commit message

 drivers/media/i2c/ov2659.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index 42f64175a6df..fb78a1cedc03 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -204,6 +204,7 @@ struct ov2659 {
 	struct i2c_client *client;
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *link_frequency;
+	struct clk *clk;
 	const struct ov2659_framesize *frame_size;
 	struct sensor_register *format_ctrl_regs;
 	struct ov2659_pll_ctrl pll;
@@ -1270,6 +1271,8 @@ static int ov2659_power_off(struct device *dev)
 
 	gpiod_set_value(ov2659->pwdn_gpio, 1);
 
+	clk_disable_unprepare(ov2659->clk);
+
 	return 0;
 }
 
@@ -1278,9 +1281,17 @@ static int ov2659_power_on(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct ov2659 *ov2659 = to_ov2659(sd);
+	int ret;
 
 	dev_dbg(&client->dev, "%s:\n", __func__);
 
+	ret = clk_prepare_enable(ov2659->clk);
+	if (ret) {
+		dev_err(&client->dev, "%s: failed to enable clock\n",
+			__func__);
+		return ret;
+	}
+
 	gpiod_set_value(ov2659->pwdn_gpio, 0);
 
 	if (ov2659->resetb_gpio) {
@@ -1425,7 +1436,6 @@ static int ov2659_probe(struct i2c_client *client)
 	const struct ov2659_platform_data *pdata = ov2659_get_pdata(client);
 	struct v4l2_subdev *sd;
 	struct ov2659 *ov2659;
-	struct clk *clk;
 	int ret;
 
 	if (!pdata) {
@@ -1440,11 +1450,11 @@ static int ov2659_probe(struct i2c_client *client)
 	ov2659->pdata = pdata;
 	ov2659->client = client;
 
-	clk = devm_clk_get(&client->dev, "xvclk");
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	ov2659->clk = devm_clk_get(&client->dev, "xvclk");
+	if (IS_ERR(ov2659->clk))
+		return PTR_ERR(ov2659->clk);
 
-	ov2659->xvclk_frequency = clk_get_rate(clk);
+	ov2659->xvclk_frequency = clk_get_rate(ov2659->clk);
 	if (ov2659->xvclk_frequency < 6000000 ||
 	    ov2659->xvclk_frequency > 27000000)
 		return -EINVAL;
@@ -1506,7 +1516,9 @@ static int ov2659_probe(struct i2c_client *client)
 	ov2659->frame_size = &ov2659_framesizes[2];
 	ov2659->format_ctrl_regs = ov2659_formats[0].format_ctrl_regs;
 
-	ov2659_power_on(&client->dev);
+	ret = ov2659_power_on(&client->dev);
+	if (ret < 0)
+		goto error;
 
 	ret = ov2659_detect(sd);
 	if (ret < 0)
-- 
2.7.4

