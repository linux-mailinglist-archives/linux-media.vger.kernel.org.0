Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60B2945A11A
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 12:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234718AbhKWLSu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 06:18:50 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:64626 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbhKWLSt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 06:18:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1637666142; x=1669202142;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kC31hnj9WPlZ84dBlAtnqPaxVZ19JscwubUD9amKJ4s=;
  b=efs7iKAvht8N7Nkl2lhpMrjY4bwj7/AvWqZx4x/RB2s6ON/q1/SA/35n
   Cqr/uzBJaKmAPkWk7xR3KSQlwrVuQs3rerZUZdNP46CUPfU3yYsqLsAl0
   uih09tORWmBCQlGzB2/XklXcUxu+Bs5ivWWrNUrfWxN8I5BMtuZ/Es2I5
   5vFyDrtZpqV0/GYiFiCecsmOJt4Dx866B0yh8DgEqBBOZcTz7NIzP083P
   j97GOFzWDijJb/60Wmfnavkss/DRpSDb+FK4rUTgk4qkBk/rhhZ5dUtX8
   2TSpXbQGmIJTHKFypAEoTCwz3bA3WGvYueM0EG2of2AYNvq5OCpaxgD3a
   g==;
IronPort-SDR: wnixdWkZMvTjZ7CrO78Cr4cPBSBKnMsGqxKiOPTAP2i7d+7sA8KtagOttoOHGytrEsVOnkh9ff
 VHaZX4f5lve31eGJTlhplG1SVYCT30xL3SefjDOiMDHYtSa+dmOAF5i4V5ogM+RZa7n9vCblI9
 f68U4uJN4KTuaShvAIqi7LFi9RlMKdiMW+RJizPF5i0aS9YgkbK9cgXYAPm4JDzbXX/2N4lOPF
 xoRNUahqpumfp5BmHLcqu/Lttrhq0Z36d5MDJBpl/JnU9Lzyd3/vgphHBDeYKx586dJqDvkARj
 WjKwAlRnlYlacIasW9ybaU24
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="144278723"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Nov 2021 04:15:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 23 Nov 2021 04:15:40 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 23 Nov 2021 04:15:32 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <leonl@leopardimaging.com>, <linux-media@vger.kernel.org>
CC:     <skomatineni@nvidia.com>, <sakari.ailus@linux.intel.com>,
        <luca@lucaceresoli.net>, <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 1/2] media: i2c: imx274: simplify probe function by adding local variable dev
Date:   Tue, 23 Nov 2021 13:15:20 +0200
Message-ID: <20211123111521.593863-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplify probe function by adding a local variable dev instead of using
&client->dev all the time.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/i2c/imx274.c | 39 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 25a4ef8f6187..e31f006b10d9 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -1961,23 +1961,23 @@ static int imx274_probe(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd;
 	struct stimx274 *imx274;
+	struct device *dev = &client->dev;
 	int ret;
 
 	/* initialize imx274 */
-	imx274 = devm_kzalloc(&client->dev, sizeof(*imx274), GFP_KERNEL);
+	imx274 = devm_kzalloc(dev, sizeof(*imx274), GFP_KERNEL);
 	if (!imx274)
 		return -ENOMEM;
 
 	mutex_init(&imx274->lock);
 
-	imx274->inck = devm_clk_get_optional(&client->dev, "inck");
+	imx274->inck = devm_clk_get_optional(dev, "inck");
 	if (IS_ERR(imx274->inck))
 		return PTR_ERR(imx274->inck);
 
-	ret = imx274_regulators_get(&client->dev, imx274);
+	ret = imx274_regulators_get(dev, imx274);
 	if (ret) {
-		dev_err(&client->dev,
-			"Failed to get power regulators, err: %d\n", ret);
+		dev_err(dev, "Failed to get power regulators, err: %d\n", ret);
 		return ret;
 	}
 
@@ -1996,7 +1996,7 @@ static int imx274_probe(struct i2c_client *client)
 	/* initialize regmap */
 	imx274->regmap = devm_regmap_init_i2c(client, &imx274_regmap_config);
 	if (IS_ERR(imx274->regmap)) {
-		dev_err(&client->dev,
+		dev_err(dev,
 			"regmap init failed: %ld\n", PTR_ERR(imx274->regmap));
 		ret = -ENODEV;
 		goto err_regmap;
@@ -2013,34 +2013,32 @@ static int imx274_probe(struct i2c_client *client)
 	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
 	ret = media_entity_pads_init(&sd->entity, 1, &imx274->pad);
 	if (ret < 0) {
-		dev_err(&client->dev,
+		dev_err(dev,
 			"%s : media entity init Failed %d\n", __func__, ret);
 		goto err_regmap;
 	}
 
 	/* initialize sensor reset gpio */
-	imx274->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
+	imx274->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						     GPIOD_OUT_HIGH);
 	if (IS_ERR(imx274->reset_gpio)) {
 		if (PTR_ERR(imx274->reset_gpio) != -EPROBE_DEFER)
-			dev_err(&client->dev, "Reset GPIO not setup in DT");
+			dev_err(dev, "Reset GPIO not setup in DT");
 		ret = PTR_ERR(imx274->reset_gpio);
 		goto err_me;
 	}
 
 	/* power on the sensor */
-	ret = imx274_power_on(&client->dev);
+	ret = imx274_power_on(dev);
 	if (ret < 0) {
-		dev_err(&client->dev,
-			"%s : imx274 power on failed\n", __func__);
+		dev_err(dev, "%s : imx274 power on failed\n", __func__);
 		goto err_me;
 	}
 
 	/* initialize controls */
 	ret = v4l2_ctrl_handler_init(&imx274->ctrls.handler, 4);
 	if (ret < 0) {
-		dev_err(&client->dev,
-			"%s : ctrl handler init Failed\n", __func__);
+		dev_err(dev, "%s : ctrl handler init Failed\n", __func__);
 		goto err_power_off;
 	}
 
@@ -2083,23 +2081,22 @@ static int imx274_probe(struct i2c_client *client)
 	/* register subdevice */
 	ret = v4l2_async_register_subdev(sd);
 	if (ret < 0) {
-		dev_err(&client->dev,
-			"%s : v4l2_async_register_subdev failed %d\n",
+		dev_err(dev, "%s : v4l2_async_register_subdev failed %d\n",
 			__func__, ret);
 		goto err_ctrls;
 	}
 
-	pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(&client->dev);
-	pm_runtime_idle(&client->dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_idle(dev);
 
-	dev_info(&client->dev, "imx274 : imx274 probe success !\n");
+	dev_info(dev, "imx274 : imx274 probe success !\n");
 	return 0;
 
 err_ctrls:
 	v4l2_ctrl_handler_free(&imx274->ctrls.handler);
 err_power_off:
-	imx274_power_off(&client->dev);
+	imx274_power_off(dev);
 err_me:
 	media_entity_cleanup(&sd->entity);
 err_regmap:
-- 
2.25.1

