Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6422272C17
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 18:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbgIUQ1P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 12:27:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:53804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726430AbgIUQ1M (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 12:27:12 -0400
Received: from localhost.localdomain (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D7EC239CF;
        Mon, 21 Sep 2020 16:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600705631;
        bh=/73PucA7rLFUdsCpc0sNMY95GLeNwHj1SqRRlksp7yg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=g0Hb441nRLDjViNMCb4/Fl1L+3bSrJoLz1wayFUKeg47nf/EjO5RnK1vzoXcqA6NP
         qw1M7tb/rYRRqBtBI2ExqquDAq2i3/giN0+HJMsPYwFLknJFiVDYOKTSaloXp4aUTN
         a/8g9fjywmE0WvvqwByi4Id2ERxgvUGQxFIIzDn4=
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
Subject: [PATCH 24/25] media: i2c: smiapp: simplify getting state container
Date:   Mon, 21 Sep 2020 18:23:41 +0200
Message-Id: <20200921162342.7348-24-krzk@kernel.org>
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
 drivers/media/i2c/smiapp/smiapp-core.c | 28 ++++++++++++--------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index 6fc0680a93d0..105ef29152e8 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -1185,8 +1185,7 @@ static int smiapp_setup_flash_strobe(struct smiapp_sensor *sensor)
 
 static int smiapp_power_on(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
+	struct v4l2_subdev *subdev = dev_get_drvdata(dev);
 	struct smiapp_subdev *ssd = to_smiapp_subdev(subdev);
 	/*
 	 * The sub-device related to the I2C device is always the
@@ -1199,14 +1198,14 @@ static int smiapp_power_on(struct device *dev)
 
 	rval = regulator_enable(sensor->vana);
 	if (rval) {
-		dev_err(&client->dev, "failed to enable vana regulator\n");
+		dev_err(dev, "failed to enable vana regulator\n");
 		return rval;
 	}
 	usleep_range(1000, 1000);
 
 	rval = clk_prepare_enable(sensor->ext_clk);
 	if (rval < 0) {
-		dev_dbg(&client->dev, "failed to enable xclk\n");
+		dev_dbg(dev, "failed to enable xclk\n");
 		goto out_xclk_fail;
 	}
 	usleep_range(1000, 1000);
@@ -1230,7 +1229,7 @@ static int smiapp_power_on(struct device *dev)
 	if (sensor->hwcfg->i2c_addr_alt) {
 		rval = smiapp_change_cci_addr(sensor);
 		if (rval) {
-			dev_err(&client->dev, "cci address change error\n");
+			dev_err(dev, "cci address change error\n");
 			goto out_cci_addr_fail;
 		}
 	}
@@ -1238,14 +1237,14 @@ static int smiapp_power_on(struct device *dev)
 	rval = smiapp_write(sensor, SMIAPP_REG_U8_SOFTWARE_RESET,
 			    SMIAPP_SOFTWARE_RESET);
 	if (rval < 0) {
-		dev_err(&client->dev, "software reset failed\n");
+		dev_err(dev, "software reset failed\n");
 		goto out_cci_addr_fail;
 	}
 
 	if (sensor->hwcfg->i2c_addr_alt) {
 		rval = smiapp_change_cci_addr(sensor);
 		if (rval) {
-			dev_err(&client->dev, "cci address change error\n");
+			dev_err(dev, "cci address change error\n");
 			goto out_cci_addr_fail;
 		}
 	}
@@ -1253,7 +1252,7 @@ static int smiapp_power_on(struct device *dev)
 	rval = smiapp_write(sensor, SMIAPP_REG_U16_COMPRESSION_MODE,
 			    SMIAPP_COMPRESSION_MODE_SIMPLE_PREDICTOR);
 	if (rval) {
-		dev_err(&client->dev, "compression mode set failed\n");
+		dev_err(dev, "compression mode set failed\n");
 		goto out_cci_addr_fail;
 	}
 
@@ -1261,28 +1260,28 @@ static int smiapp_power_on(struct device *dev)
 		sensor, SMIAPP_REG_U16_EXTCLK_FREQUENCY_MHZ,
 		sensor->hwcfg->ext_clk / (1000000 / (1 << 8)));
 	if (rval) {
-		dev_err(&client->dev, "extclk frequency set failed\n");
+		dev_err(dev, "extclk frequency set failed\n");
 		goto out_cci_addr_fail;
 	}
 
 	rval = smiapp_write(sensor, SMIAPP_REG_U8_CSI_LANE_MODE,
 			    sensor->hwcfg->lanes - 1);
 	if (rval) {
-		dev_err(&client->dev, "csi lane mode set failed\n");
+		dev_err(dev, "csi lane mode set failed\n");
 		goto out_cci_addr_fail;
 	}
 
 	rval = smiapp_write(sensor, SMIAPP_REG_U8_FAST_STANDBY_CTRL,
 			    SMIAPP_FAST_STANDBY_CTRL_IMMEDIATE);
 	if (rval) {
-		dev_err(&client->dev, "fast standby set failed\n");
+		dev_err(dev, "fast standby set failed\n");
 		goto out_cci_addr_fail;
 	}
 
 	rval = smiapp_write(sensor, SMIAPP_REG_U8_CSI_SIGNALLING_MODE,
 			    sensor->hwcfg->csi_signalling_mode);
 	if (rval) {
-		dev_err(&client->dev, "csi signalling mode set failed\n");
+		dev_err(dev, "csi signalling mode set failed\n");
 		goto out_cci_addr_fail;
 	}
 
@@ -1294,7 +1293,7 @@ static int smiapp_power_on(struct device *dev)
 
 	rval = smiapp_call_quirk(sensor, post_poweron);
 	if (rval) {
-		dev_err(&client->dev, "post_poweron quirks failed\n");
+		dev_err(dev, "post_poweron quirks failed\n");
 		goto out_cci_addr_fail;
 	}
 
@@ -1312,8 +1311,7 @@ static int smiapp_power_on(struct device *dev)
 
 static int smiapp_power_off(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
+	struct v4l2_subdev *subdev = dev_get_drvdata(dev);
 	struct smiapp_subdev *ssd = to_smiapp_subdev(subdev);
 	struct smiapp_sensor *sensor =
 		container_of(ssd, struct smiapp_sensor, ssds[0]);
-- 
2.17.1

