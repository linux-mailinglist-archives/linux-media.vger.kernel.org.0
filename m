Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC64272BD1
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 18:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbgIUQYF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 12:24:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:50776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728129AbgIUQYE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 12:24:04 -0400
Received: from localhost.localdomain (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 11EB0221E2;
        Mon, 21 Sep 2020 16:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600705443;
        bh=KZu/9fbJFYS6hZ02FrdG/DOINxrNaNLETJfM1t3B3/k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q/GtIB40x12sWPDzq/9jnVKfoAwlGTSrtS9dC+fBc53r8nTaRLXo1C2g6y/57BDXm
         deV+tjic+9k0WCraDwZGgOeb3zKPtFGxpPxWZyZmDlY0eYOzO6XxGgheCJX6YMBqV0
         q+yu4VoEbK1ZdJPI1XvlJfKEbSSVcoWnzE+HjqjE=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Shawn Tu <shawnx.tu@intel.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Wenyou Yang <wenyou.yang@microchip.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 02/25] media: i2c: imx219: simplify getting state container
Date:   Mon, 21 Sep 2020 18:23:19 +0200
Message-Id: <20200921162342.7348-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921162342.7348-1-krzk@kernel.org>
References: <20200921162342.7348-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pointer to 'struct v4l2_subdev' is stored in drvdata via
v4l2_i2c_subdev_init() so there is no point of a dance like:

    struct i2c_client *client = to_i2c_client(struct device *dev)
    struct v4l2_subdev *sd = i2c_get_clientdata(client);

This allows to remove local variable 'client' and few pointer
dereferences.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/media/i2c/imx219.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 1cee45e35355..d5349d1ca485 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1114,22 +1114,21 @@ static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
 /* Power/clock management functions */
 static int imx219_power_on(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx219 *imx219 = to_imx219(sd);
 	int ret;
 
 	ret = regulator_bulk_enable(IMX219_NUM_SUPPLIES,
 				    imx219->supplies);
 	if (ret) {
-		dev_err(&client->dev, "%s: failed to enable regulators\n",
+		dev_err(dev, "%s: failed to enable regulators\n",
 			__func__);
 		return ret;
 	}
 
 	ret = clk_prepare_enable(imx219->xclk);
 	if (ret) {
-		dev_err(&client->dev, "%s: failed to enable clock\n",
+		dev_err(dev, "%s: failed to enable clock\n",
 			__func__);
 		goto reg_off;
 	}
@@ -1148,8 +1147,7 @@ static int imx219_power_on(struct device *dev)
 
 static int imx219_power_off(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx219 *imx219 = to_imx219(sd);
 
 	gpiod_set_value_cansleep(imx219->reset_gpio, 0);
@@ -1161,8 +1159,7 @@ static int imx219_power_off(struct device *dev)
 
 static int __maybe_unused imx219_suspend(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx219 *imx219 = to_imx219(sd);
 
 	if (imx219->streaming)
@@ -1173,8 +1170,7 @@ static int __maybe_unused imx219_suspend(struct device *dev)
 
 static int __maybe_unused imx219_resume(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx219 *imx219 = to_imx219(sd);
 	int ret;
 
-- 
2.17.1

