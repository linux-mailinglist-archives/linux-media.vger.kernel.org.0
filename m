Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9CB2AB1D4
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 08:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729647AbgKIHmn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 02:42:43 -0500
Received: from mga14.intel.com ([192.55.52.115]:32594 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728951AbgKIHmn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Nov 2020 02:42:43 -0500
IronPort-SDR: V/k9dtaP1GKiIOoGgWmY9T8fxaTlmwdUpIrjFRajsSygn2uZK9LUs4Vycc73bsqZ+A7pYgMhqm
 nHbP1NoDF/2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9799"; a="168978958"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="168978958"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2020 23:42:43 -0800
IronPort-SDR: RSTqC0O4+Cs/qJrdGNM6inyXOjreHPvaSJ4zvYXQo996ECWSmGs3i5hqFVlWVhtvPvlRXmpccz
 8T6wWy+a7a9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="540732803"
Received: from ipu5-build.bj.intel.com ([10.238.232.196])
  by orsmga005.jf.intel.com with ESMTP; 08 Nov 2020 23:42:40 -0800
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
Cc:     tfiga@chromium.org, senozhatsky@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com, qingwu.zhang@intel.com
Subject: [PATCH v2 1/2] media: ov2740: only do OTP data read on demand from user
Date:   Mon,  9 Nov 2020 15:39:40 +0800
Message-Id: <1604907581-2808-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

OTP data access of ov2740 in probe need power up, it may cause
the camera flash LED blink during probe if the LED use same power
rail with camera, this patch move the OTP data access out of
probe, it will only occur on demand from user by nvmem sysfs.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Qingwu Zhang <qingwu.zhang@intel.com>
---
 drivers/media/i2c/ov2740.c | 87 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 66 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 64ecb6917dd3..4bb4fe4bcab6 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -71,9 +71,11 @@
 #define OV2740_REG_OTP_CUSTOMER		0x7010
 
 struct nvm_data {
-	char *nvm_buffer;
+	struct i2c_client *client;
 	struct nvmem_device *nvmem;
 	struct regmap *regmap;
+	char *nvm_buffer;
+	bool ready;
 };
 
 enum {
@@ -335,6 +337,9 @@ struct ov2740 {
 
 	/* Streaming on/off */
 	bool streaming;
+
+	/* NVM data inforamtion */
+	struct nvm_data *nvm;
 };
 
 static inline struct ov2740 *to_ov2740(struct v4l2_subdev *subdev)
@@ -930,18 +935,26 @@ static int ov2740_remove(struct i2c_client *client)
 	return 0;
 }
 
-static int ov2740_load_otp_data(struct i2c_client *client, struct nvm_data *nvm)
+static int ov2740_load_otp_data(struct nvm_data *nvm)
 {
+	struct i2c_client *client = nvm->client;
 	struct ov2740 *ov2740 = to_ov2740(i2c_get_clientdata(client));
 	u32 isp_ctrl00 = 0;
 	u32 isp_ctrl01 = 0;
 	int ret;
 
+	if (!nvm)
+		return -EINVAL;
+
+	if (nvm->ready)
+		return 0;
+
 	ret = ov2740_read_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, &isp_ctrl00);
 	if (ret) {
 		dev_err(&client->dev, "failed to read ISP CTRL00\n");
 		goto exit;
 	}
+
 	ret = ov2740_read_reg(ov2740, OV2740_REG_ISP_CTRL01, 1, &isp_ctrl01);
 	if (ret) {
 		dev_err(&client->dev, "failed to read ISP CTRL01\n");
@@ -952,7 +965,7 @@ static int ov2740_load_otp_data(struct i2c_client *client, struct nvm_data *nvm)
 	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL00, 1,
 			       isp_ctrl00 & ~BIT(5));
 	if (ret) {
-		dev_err(&client->dev, "failed to write ISP CTRL00\n");
+		dev_err(&client->dev, "failed to set ISP CTRL00\n");
 		goto exit;
 	}
 
@@ -960,14 +973,14 @@ static int ov2740_load_otp_data(struct i2c_client *client, struct nvm_data *nvm)
 	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1,
 			       isp_ctrl01 & ~BIT(7));
 	if (ret) {
-		dev_err(&client->dev, "failed to write ISP CTRL01\n");
+		dev_err(&client->dev, "failed to set ISP CTRL01\n");
 		goto exit;
 	}
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
 			       OV2740_MODE_STREAMING);
 	if (ret) {
-		dev_err(&client->dev, "failed to start streaming\n");
+		dev_err(&client->dev, "failed to set streaming mode\n");
 		goto exit;
 	}
 
@@ -984,11 +997,26 @@ static int ov2740_load_otp_data(struct i2c_client *client, struct nvm_data *nvm)
 		goto exit;
 	}
 
-	ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
-			 OV2740_MODE_STANDBY);
-	ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1, isp_ctrl01);
-	ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, isp_ctrl00);
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
+			       OV2740_MODE_STANDBY);
+	if (ret) {
+		dev_err(&client->dev, "failed to set streaming mode\n");
+		goto exit;
+	}
+
+	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1, isp_ctrl01);
+	if (ret) {
+		dev_err(&client->dev, "failed to set ISP CTRL01\n");
+		goto exit;
+	}
+
+	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, isp_ctrl00);
+	if (ret) {
+		dev_err(&client->dev, "failed to set ISP CTRL00\n");
+		goto exit;
+	}
 
+	nvm->ready = true;
 exit:
 	return ret;
 }
@@ -997,20 +1025,38 @@ static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
 			     size_t count)
 {
 	struct nvm_data *nvm = priv;
+	struct v4l2_subdev *sd = i2c_get_clientdata(nvm->client);
+	struct device *dev = &nvm->client->dev;
+	struct ov2740 *ov2740 = to_ov2740(sd);
+	int ret = 0;
 
-	memcpy(val, nvm->nvm_buffer + off, count);
+	mutex_lock(&ov2740->mutex);
 
-	return 0;
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(dev);
+		goto exit;
+	}
+
+	ret = ov2740_load_otp_data(nvm);
+	if (!ret)
+		memcpy(val, nvm->nvm_buffer + off, count);
+
+	pm_runtime_put(dev);
+exit:
+	mutex_unlock(&ov2740->mutex);
+	return ret;
 }
 
-static int ov2740_register_nvmem(struct i2c_client *client)
+static int ov2740_register_nvmem(struct i2c_client *client,
+				 struct ov2740 *ov2740)
 {
 	struct nvm_data *nvm;
 	struct regmap_config regmap_config = { };
 	struct nvmem_config nvmem_config = { };
 	struct regmap *regmap;
 	struct device *dev = &client->dev;
-	int ret = 0;
+	int ret;
 
 	nvm = devm_kzalloc(dev, sizeof(*nvm), GFP_KERNEL);
 	if (!nvm)
@@ -1028,12 +1074,7 @@ static int ov2740_register_nvmem(struct i2c_client *client)
 		return PTR_ERR(regmap);
 
 	nvm->regmap = regmap;
-
-	ret = ov2740_load_otp_data(client, nvm);
-	if (ret) {
-		dev_err(dev, "failed to load OTP data, ret %d\n", ret);
-		return ret;
-	}
+	nvm->client = client;
 
 	nvmem_config.name = dev_name(dev);
 	nvmem_config.dev = dev;
@@ -1051,7 +1092,11 @@ static int ov2740_register_nvmem(struct i2c_client *client)
 
 	nvm->nvmem = devm_nvmem_register(dev, &nvmem_config);
 
-	return PTR_ERR_OR_ZERO(nvm->nvmem);
+	ret = PTR_ERR_OR_ZERO(nvm->nvmem);
+	if (!ret)
+		ov2740->nvm = nvm;
+
+	return ret;
 }
 
 static int ov2740_probe(struct i2c_client *client)
@@ -1103,7 +1148,7 @@ static int ov2740_probe(struct i2c_client *client)
 		goto probe_error_media_entity_cleanup;
 	}
 
-	ret = ov2740_register_nvmem(client);
+	ret = ov2740_register_nvmem(client, ov2740);
 	if (ret)
 		dev_warn(&client->dev, "register nvmem failed, ret %d\n", ret);
 
-- 
2.7.4

