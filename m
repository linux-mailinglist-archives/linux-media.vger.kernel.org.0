Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7AD229F1C9
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 17:42:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725892AbgJ2Qmw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 12:42:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:51242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725811AbgJ2Qmw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 12:42:52 -0400
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4DDC7206F4;
        Thu, 29 Oct 2020 16:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603989771;
        bh=rufIZfzUwOusZfJ1S3FbaAtyMqLXFNBtqVRmnNQKp9A=;
        h=From:To:Cc:Subject:Date:From;
        b=kIpUB8eIpOBHJ3mcZyOKOz9gfjlmEbM7nNA0P7TO76BruUFneh5kRmB55KrisMZha
         p/6XZa2/8dIf51hsJbyZnd/VdMtE5xwKWdSVj5JeRdhkUbi180AT+27R/IgIEh5hY9
         zLRoQLiEP7u3oUNEJUhJNsO19gBeiAzip6QZbx/s=
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
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND PATCH 01/25] media: i2c: imx214: simplify getting state container
Date:   Thu, 29 Oct 2020 17:42:15 +0100
Message-Id: <20201029164239.84240-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pointer to 'struct v4l2_subdev' is stored in drvdata via
v4l2_i2c_subdev_init() so there is no point of a dance like:

    struct i2c_client *client = to_i2c_client(struct device *dev)
    struct v4l2_subdev *sd = i2c_get_clientdata(client);

This allows to remove local variable 'client' and few pointer
dereferences.  White at it, use 'dev' directly instead of 'imx214->dev'.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/media/i2c/imx214.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 1ef5af9a8c8b..dc27c3678f18 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -431,14 +431,13 @@ static inline struct imx214 *to_imx214(struct v4l2_subdev *sd)
 
 static int __maybe_unused imx214_power_on(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx214 *imx214 = to_imx214(sd);
 	int ret;
 
 	ret = regulator_bulk_enable(IMX214_NUM_SUPPLIES, imx214->supplies);
 	if (ret < 0) {
-		dev_err(imx214->dev, "failed to enable regulators: %d\n", ret);
+		dev_err(dev, "failed to enable regulators: %d\n", ret);
 		return ret;
 	}
 
@@ -447,7 +446,7 @@ static int __maybe_unused imx214_power_on(struct device *dev)
 	ret = clk_prepare_enable(imx214->xclk);
 	if (ret < 0) {
 		regulator_bulk_disable(IMX214_NUM_SUPPLIES, imx214->supplies);
-		dev_err(imx214->dev, "clk prepare enable failed\n");
+		dev_err(dev, "clk prepare enable failed\n");
 		return ret;
 	}
 
@@ -459,8 +458,7 @@ static int __maybe_unused imx214_power_on(struct device *dev)
 
 static int __maybe_unused imx214_power_off(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx214 *imx214 = to_imx214(sd);
 
 	gpiod_set_value_cansleep(imx214->enable_gpio, 0);
@@ -910,8 +908,7 @@ static int imx214_parse_fwnode(struct device *dev)
 
 static int __maybe_unused imx214_suspend(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx214 *imx214 = to_imx214(sd);
 
 	if (imx214->streaming)
@@ -922,8 +919,7 @@ static int __maybe_unused imx214_suspend(struct device *dev)
 
 static int __maybe_unused imx214_resume(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx214 *imx214 = to_imx214(sd);
 	int ret;
 
-- 
2.25.1

