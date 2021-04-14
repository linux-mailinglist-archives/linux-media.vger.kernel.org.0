Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C10B35EDD2
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 08:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349487AbhDNGww (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 02:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349466AbhDNGwk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 02:52:40 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51C04C061574;
        Tue, 13 Apr 2021 23:52:18 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id t22so9233298ply.1;
        Tue, 13 Apr 2021 23:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Lpn1kwcaUfGE65cGT0/6DjNShy2KH1H83CkqwOYpOyE=;
        b=VwqrlX7FgiEHnDw8lRpw/w9KQ6niiKdVnktrmyrmzhsBQuhngkuAISXztsI35uHqP1
         2deDSRWuOe6fSUFIkv1tcvesnqrolwkLY9dMVIxnZ4q4qnUf4PPyxYcroy5O+S8A92/w
         1Ll+MsNjKA/rNTuNEXfxk+f9fAVcUxAekDLSBHcRACOVma6SI5MdjKkZ0Qie6tgeKqVW
         ubRW6BkDVuzNt+XBScsHYbsDb5hnHYMHcRSlZ0p+mUXo5p6UdXpwszC+ACYnPeGw0j2R
         wB2iOlljx5xzO75/HW8bkqGLugdeUY99+yhXSCgUiBZ95CtIRXMptuA23Oj0ClOtcaIj
         YnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Lpn1kwcaUfGE65cGT0/6DjNShy2KH1H83CkqwOYpOyE=;
        b=UXJMJ54gEX+gXy+fSWA5skttIuETTQeYAXIm0WYa57grZczqk2i0CwTD7cxO9phisC
         PPEfbK5LnGFBARcaCDtW1C/YOkiXjJC+qfrgvJI/QlTjcBDnGbRD+8l6+o4QtWqLonud
         MKNeAD7n0dy5aq/JDx22V7o6LDDsqDqFCtPtc1rcjUlmo1fWa1AbGTtkUTaQ8b4XftzF
         dGJgJEbWGkdmCoI5hjvUqcHg1QvZ2iIxc18I/9WsSW9r3Ais7b909XJVjJ0hFZPNjFj6
         S1MHX/Pc4ZBuanI6FMHzr3NGCRwAQbsRypCO0x6+MXAK47JjHFWm9qCPI8NeKB+WLg44
         O4jQ==
X-Gm-Message-State: AOAM532o11su6gNEw4QOCV3mwQkWV3dWsjB4Xb3SaYGMkG89S+y9u9M+
        MrDHNdPVN/BJYhHQrqLe/2s=
X-Google-Smtp-Source: ABdhPJxgds7dzB9hZyvsNn/VMhn6kVi/lIJgpLjUQfvUYzbK2bQBJhw5zVbjc9XFo2HHZsvb4lWHCw==
X-Received: by 2002:a17:902:eccd:b029:ea:ed20:b646 with SMTP id a13-20020a170902eccdb02900eaed20b646mr16459119plh.4.1618383137963;
        Tue, 13 Apr 2021 23:52:17 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id r11sm3775736pjp.46.2021.04.13.23.52.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Apr 2021 23:52:17 -0700 (PDT)
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
Subject: [PATCH v2 3/4] media: i2c: ov2659: Add clk_prepare_enable(),  clk_disable_unprepare() to handle xvclk
Date:   Wed, 14 Apr 2021 14:51:56 +0800
Message-Id: <1618383117-17179-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618383117-17179-1-git-send-email-dillon.minfei@gmail.com>
References: <1618383117-17179-1-git-send-email-dillon.minfei@gmail.com>
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
v2: no changes

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

