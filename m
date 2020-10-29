Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC8829F1CE
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 17:43:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726517AbgJ2QnA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 12:43:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:51386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726407AbgJ2QnA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 12:43:00 -0400
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 82C9E21548;
        Thu, 29 Oct 2020 16:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603989779;
        bh=uk9rGJ4+N1u1qnJ9IKKuVxqrudCSLJSlLDbCV6jBqDY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IDjw44w21QmtZs1Au7YBvPinl2v59/UfgZdJ6gUgSAyG4kGzRVgLLrsKD80VsEaXH
         O9ETMzUMQDGluL+ppSjn8H0mKqTpgLb08+0g3fq+LmlKuT1Zw7O6diSTDLwC2wbd1U
         IyvNV1PDqqEjiIibbDVfeKIco4b4h67lq8S3f5N8=
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
Subject: [RESEND PATCH 03/25] media: i2c: imx290: simplify getting state container
Date:   Thu, 29 Oct 2020 17:42:17 +0100
Message-Id: <20201029164239.84240-3-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201029164239.84240-1-krzk@kernel.org>
References: <20201029164239.84240-1-krzk@kernel.org>
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
dereferences.  White at it, use 'dev' directly instead of 'imx290->dev'.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/media/i2c/imx290.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index adcddf3204f7..6319a42057d2 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -842,20 +842,19 @@ static int imx290_set_data_lanes(struct imx290 *imx290)
 
 static int imx290_power_on(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx290 *imx290 = to_imx290(sd);
 	int ret;
 
 	ret = clk_prepare_enable(imx290->xclk);
 	if (ret) {
-		dev_err(imx290->dev, "Failed to enable clock\n");
+		dev_err(dev, "Failed to enable clock\n");
 		return ret;
 	}
 
 	ret = regulator_bulk_enable(IMX290_NUM_SUPPLIES, imx290->supplies);
 	if (ret) {
-		dev_err(imx290->dev, "Failed to enable regulators\n");
+		dev_err(dev, "Failed to enable regulators\n");
 		clk_disable_unprepare(imx290->xclk);
 		return ret;
 	}
@@ -872,8 +871,7 @@ static int imx290_power_on(struct device *dev)
 
 static int imx290_power_off(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx290 *imx290 = to_imx290(sd);
 
 	clk_disable_unprepare(imx290->xclk);
-- 
2.25.1

