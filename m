Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29E6137255A
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 07:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbhEDFL0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 May 2021 01:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbhEDFLZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 May 2021 01:11:25 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974B5C06138D;
        Mon,  3 May 2021 22:10:29 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id m124so367286pgm.13;
        Mon, 03 May 2021 22:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DDm+IUuMuEMjBqzuCfuKqp0I9bKlFQdWahJfgNfmLoE=;
        b=iNp//tlggIAsYmIJCRwYiOelXJRiE3KlLPgXSXL6Q0m5bbK0CmMVr5Yuq69hj8DQaZ
         vIIgDS3OBWyzBOs+RLM1CHdHf7AEoRO40KJeg/lV1aTUuEnC8somJAX9Uc+XCSlGCIB+
         s2zenw0p2hCY++2nFxSUbHwZaPB9ARlozIWk8JTY723AdR3iMyczNNMcxoOZAvCL/OfM
         YbHzvLlXEhNa3Pld7EhInBW4F5yDIBRx8J6chx+aRhXWIaygOTw82TUF49ArVSHWx5wA
         novmsqVBIwF13UE0RUt/xSyMDNn1+gxH1KbNzaTqNasD3dQcU0rkCXoeatUA7fURvBqG
         aA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DDm+IUuMuEMjBqzuCfuKqp0I9bKlFQdWahJfgNfmLoE=;
        b=Bvep0cYED5j6roaymbZoK/pwFsUjdyQiEJ5zGFNSlXs5/qtwfifflpFWVJ3exdbxyv
         Bs3T2XHOvBM443bylMSZ/Z9bWGxYvJ/5exHm34yO54YDYnpniT8UDu6yB8zcZwk2hu3o
         7NtPyHOlR4JF31H+S3erA1bBWIupcEV0fl8/62E5qejKSPc/Hf92kU4NDIIAS0d4d4v5
         zSP1nr4N8LIq2nJxmnSQzSCJIe8qYiaJffrrotcrONOvOY5rcqk/gIgkotyjMaHiVsiv
         teOJVXJkEqjPyTOuPyAd/QS6CqsW0uvyDAt+NBJuwU4FIOCZCYOv4XYLn5j1yM1q4YNK
         0mIg==
X-Gm-Message-State: AOAM533h9zHRM8ZpIp+A+xs51Lt3tuUOMbnmQU2I8a/G4n6Fgz+bUfKd
        qmvV4ERm1e9T1o+uldge9kM=
X-Google-Smtp-Source: ABdhPJxkTWRtPHQxkUHQa52Xfb4Or/HEoVTVXpdYypHtdj+NbF1l0aq6p8mgWQqsW/BdrDwEJcHZvw==
X-Received: by 2002:a63:38d:: with SMTP id 135mr13391680pgd.285.1620105029188;
        Mon, 03 May 2021 22:10:29 -0700 (PDT)
Received: from localhost.localdomain ([63.143.61.57])
        by smtp.gmail.com with ESMTPSA id 3sm10457815pff.132.2021.05.03.22.10.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 May 2021 22:10:28 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     festevam@gmail.com, shawnguo@kernel.org, s.riedmueller@phytec.de,
        matthias.schiffer@ew.tq-group.com, leoyang.li@nxp.com,
        arnd@arndb.de, olof@lixom.net, s.hauer@pengutronix.de,
        kernel@pengutronix.de, prabhakar.csengg@gmail.com,
        mchehab@kernel.org, mchehab+huawei@kernel.org
Cc:     krzysztof.kozlowski@canonical.com, krzk@kernel.org,
        robh+dt@kernel.org, linux@rempel-privat.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-media@vger.kernel.org, Dillon Min <dillon.minfei@gmail.com>
Subject: [PATCH v5 4/4] media: i2c: ov2659: Use clk_{prepare_enable,disable_unprepare}() to set xvclk on/off
Date:   Tue,  4 May 2021 13:09:53 +0800
Message-Id: <1620104993-5850-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1620104993-5850-1-git-send-email-dillon.minfei@gmail.com>
References: <1620104993-5850-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

On some platform(imx6q), xvclk might not switch on in advance,
also for power save purpose, xvclk should not be always on.
so, add clk_prepare_enable(), clk_disable_unprepare() in driver
side to set xvclk on/off at proper stage.

Add following changes:
- add 'struct clk *clk;' in 'struct ov2659 {}'
- enable xvclk in ov2659_power_on()
- disable xvclk in ov2659_power_off()

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Acked-by: Lad Prabhakar <prabhakar.csengg@gmail.com>
---

v5:
- no code change, just change my git author name from lower case to higher case
- add 'Acked-by: Lad Prabhakar <prabhakar.csengg@gmail.com>'

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
1.9.1

