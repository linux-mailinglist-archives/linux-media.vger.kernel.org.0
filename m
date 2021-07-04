Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEA213BB1E1
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 01:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbhGDXNZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Jul 2021 19:13:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:48918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232589AbhGDXMV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 4 Jul 2021 19:12:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 44780613FC;
        Sun,  4 Jul 2021 23:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625440131;
        bh=kzLbysrn0WTVXqGNPCytiyLqvBomL/QjZ69Hv/nPQ3Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B1lFkl8pkFSY9NITnSHshJhstHNwCzVN1wefQyiyJGJVE/F/jvl5uXyEFhgTQHMgu
         ZFlm5lQYzloGIgY8OMDN/bPi40r2kfQ/JNhuM0FUp+bU8rhET3Q/qH5vMu1oaLAfrU
         +TDu/RAWZi6Fjjl9WCvA/zJ+4ZjtbPRYMu56AfuIBr3PZWJ+unX3HWQiQWvbb+mCLd
         Sgu6ldKiFUZ0D4BtC9gnVTsppJU3VhK/mIch9T//OIDq5JUR/QfbjJkgK4eqf9vm4f
         TOV+WZatrDeeTpiAKTO6ytyZsoUhCrugvxHtmJmnjmmlCEupoQqXzdFyOCxMnMQ/kH
         oFDG4nnp12x6A==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dillon Min <dillon.minfei@gmail.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 34/70] media: i2c: ov2659: Use clk_{prepare_enable,disable_unprepare}() to set xvclk on/off
Date:   Sun,  4 Jul 2021 19:07:27 -0400
Message-Id: <20210704230804.1490078-34-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210704230804.1490078-1-sashal@kernel.org>
References: <20210704230804.1490078-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

[ Upstream commit 24786ccd9c80fdb05494aa4d90fcb8f34295c193 ]

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
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
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
2.30.2

