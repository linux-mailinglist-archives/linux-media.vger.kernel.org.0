Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43BD0366432
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 05:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235042AbhDUDu4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 23:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235008AbhDUDur (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 23:50:47 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE2FC06138F;
        Tue, 20 Apr 2021 20:49:31 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id a12so27401337pfc.7;
        Tue, 20 Apr 2021 20:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=syxVRnkuORiuxVC3x3JHzejHdJyYju0fZMcok/+Zg/U=;
        b=mGuWz00rSagy0fM3KEAHYzQyW3PjHGpT75+41xTIy21z9uTeLYmPLHg/UJWaX8puOH
         zJ/SSXJLQGvL5O23A3LKhH8njEP7SEmL6uJLf3GbhM+ftWlHuhixxQm6G9aLAPmySe3u
         mO8eN+dVZa3tt59N4SUx1dWWRbm8nv0C40yay88PMSty6woytJl5ZqkghT86FYXRzaTD
         qJ3RaPwc7pBJBjkhHAa0xJcIYhlv7L3pJDvXYLEpf6YiIdNb/cnnpPVqvWN5N15w5kA9
         9FzoExa/j4bHLy2DUqKgskTe1aH2yWtl62z3ywLS0j5DDDtkDtv71b8e0h00edOa9VBm
         SQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=syxVRnkuORiuxVC3x3JHzejHdJyYju0fZMcok/+Zg/U=;
        b=iK44ENNzBa/lGQRMyk/PWXO1ObS9hD4Watx1LCWYu9Jj9AOIKBTEeZmmZ8epieg6QM
         iM1cUrIAjJbfnbWBTzr3+kngHfDrtvLb+uKWjZ+KTvhAhgt6GRKGu31x90uTj53jInja
         50J3btx+iGJIq8TanVFLyXPxwvQnl/apL8bRLsxQ1YFeTj4Dq7PYBnWpWgsDz4v3P6gZ
         TE02bdSdBXXf33fOQkqESGEN/eY7iqVsEIaaeCFXdTzpnBoM4AzMpQ4wj5sjX+PXMz4j
         zgsfJ+k9tXqUkX1BAu+0sCF+ogZ961LIoMp71UDYZvX/efXuOAcWMeh9RTjvP5MYkVfe
         +rXQ==
X-Gm-Message-State: AOAM531+DNHvKLt094y84yABsLQE99N+kgR7oyJO2SZ9j2qXIQH0IKj5
        qE0pDNP17iqnXJqzQBqPbTk=
X-Google-Smtp-Source: ABdhPJytKG0jhPRD66R1JT/Y6Z0Ht5LdA6hnzqxjsT/udSFB7ol1cX3ixT/9Jz4hLwGlKDx/4upupg==
X-Received: by 2002:a17:90a:b78d:: with SMTP id m13mr9040857pjr.47.1618976970680;
        Tue, 20 Apr 2021 20:49:30 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id s43sm382555pfw.164.2021.04.20.20.49.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Apr 2021 20:49:30 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     festevam@gmail.com, shawnguo@kernel.org, s.riedmueller@phytec.de,
        matthias.schiffer@ew.tq-group.com, leoyang.li@nxp.com,
        arnd@arndb.de, olof@lixom.net, s.hauer@pengutronix.de,
        kernel@pengutronix.de, prabhakar.csengg@gmail.com,
        mchehab@kernel.org
Cc:     krzysztof.kozlowski@canonical.com, krzk@kernel.org,
        robh+dt@kernel.org, linux@rempel-privat.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-media@vger.kernel.org, dillon min <dillon.minfei@gmail.com>
Subject: [PATCH v4 4/4] media: i2c: ov2659: Use clk_{prepare_enable,disable_unprepare}() to set xvclk on/off
Date:   Wed, 21 Apr 2021 11:48:58 +0800
Message-Id: <1618976938-20834-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618976938-20834-1-git-send-email-dillon.minfei@gmail.com>
References: <1618976938-20834-1-git-send-email-dillon.minfei@gmail.com>
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
v4: no changes

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

