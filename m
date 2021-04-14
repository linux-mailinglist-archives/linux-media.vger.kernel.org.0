Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93AD535ED05
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 08:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349108AbhDNGOo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 02:14:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349113AbhDNGOa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 02:14:30 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81A29C06138D;
        Tue, 13 Apr 2021 23:14:07 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id d10so13654082pgf.12;
        Tue, 13 Apr 2021 23:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LqBjgru/kZiv2kgZDvT4GDl1IMrvGcwQ/GofAyAsCoI=;
        b=ILVyUIH8LNRoWIsR8w+ffysuuD7sGt7bSRwJ5vSEBW1HE/UDmLzroSVgfI3YaQqbDG
         rfzopRxQEczTvaUNt5pl6+bQLK1wo0B82wV+SWiwJryyP85zX9BhNRmLo/fJcM87KGa2
         2xW5mR6ut6SHPbls0SEsmGzp0fjcm9lefFszcXAnIXYnJyGlSbv2ZBK1kRsqDoN0DJrW
         TMIgz5GSKQfjWz/08rwLLzPHbpdS45WLN+HeWBvPWXVQjEAUr2e+aA7H0JvhdWLGLixT
         THqqH5JF7Xq4b7f6gL6OARny5WCOORGXr1MaTcAS9Zywg1sm+3NYRQJKy8tzWwF3g+Iu
         IPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LqBjgru/kZiv2kgZDvT4GDl1IMrvGcwQ/GofAyAsCoI=;
        b=ZuZdVJGJ5EGNdXC/tYxyxme5C2kgmCny8JAXTt/LEY/Rp739X9zGeexGHjS0VoOOoQ
         D6BXFmPWR6Wu0VLrp8Te/muxUMrDPCvl7K3Xepm4kyCyhQu5HLsBEtEJKNCafwPEZ+ex
         pcRBOB1WNIaEIvRIuZ8ztto1BRVDFJGZJV33Fp42EUdq/4RJrUTzPh2XWl+E+lP64ILU
         zQ4iUJ5/32FQ1tINjPnwjQvffP1G5fV+8F2LEXkfi88xepAlaSnnqGaAxpt5P7Sv2rMS
         BqGau6QzrNHXMjjvtRS29SO3+qBcR0Wi5LSMthIxuDS9bjA3FwT6495gU8h8VEyKHGLS
         zVKg==
X-Gm-Message-State: AOAM532EPpRxPsDV/owPSdb2GBoVeECwBOAaeX+t1nuv0auLrOfQClRu
        Pt2aUc/ucR/xmXQkaK9GBDI=
X-Google-Smtp-Source: ABdhPJxZJd6FW5aeYTCVQO81obZYLNmzCqikb4NF3fjOEO6+8Uuo6fjuWAE7hyZL6xN5nqFskaLxrw==
X-Received: by 2002:a65:62d7:: with SMTP id m23mr36562496pgv.244.1618380847472;
        Tue, 13 Apr 2021 23:14:07 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id d17sm13629071pfn.60.2021.04.13.23.14.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Apr 2021 23:14:07 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     robh+dt@kernel.org, shawnguo@kernel.org, krzk@kernel.org,
        linux@rempel-privat.de, s.riedmueller@phytec.de,
        matthias.schiffer@ew.tq-group.com, leoyang.li@nxp.com,
        arnd@arndb.de, olof@lixom.net, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        prabhakar.csengg@gmail.com, mchehab@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-media@vger.kernel.org, dillon min <dillon.minfei@gmail.com>
Subject: [PATCH v1 3/3] media: i2c: ov2659: Add clk_prepare_enable(), clk_disable_unprepare() to handle xvclk
Date:   Wed, 14 Apr 2021 14:13:47 +0800
Message-Id: <1618380827-16056-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618380827-16056-1-git-send-email-dillon.minfei@gmail.com>
References: <1618380827-16056-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

For power save purpose, xvclk might not be always on.
need add clk_prepare_enable(), clk_disable_unprepare() at driver
side to set xvclk on/off at proper stage.

Add following changes:
- add 'struct clk *clk' in 'struct ov2659'
- enable xvclk in ov2659_power_on()
- disable xvclk in ov2659_power_off()

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
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

