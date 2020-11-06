Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 664F72A8F91
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 07:43:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726226AbgKFGnr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 01:43:47 -0500
Received: from mga11.intel.com ([192.55.52.93]:23052 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725828AbgKFGnr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Nov 2020 01:43:47 -0500
IronPort-SDR: tddEHV1bQvGH7jSDVhSBq3sxMO5kOvJgIYCcWUDhZU2MTjGqgVndlnNutNfMzaAPQZZCdfw4uO
 FeFbQm4eF1Tg==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="166000802"
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="166000802"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:43:46 -0800
IronPort-SDR: XXZSWhoTYETnLoDOSsIs+4oCkJyvKWzdTn6alWUpeZ+ggTC9odKpcUo7d44qTLm8WHPj/Yfs1U
 s4HeHz/ahnNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="354596663"
Received: from ipu5-build.bj.intel.com ([10.238.232.196])
  by fmsmga004.fm.intel.com with ESMTP; 05 Nov 2020 22:43:44 -0800
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
Cc:     tfiga@chromium.org, senozhatsky@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com, qingwu.zhang@intel.com
Subject: [PATCH 1/2] media: ov2740: only do OTP data read on demand from user
Date:   Fri,  6 Nov 2020 14:40:43 +0800
Message-Id: <1604644844-1551-1-git-send-email-bingbu.cao@intel.com>
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
 drivers/media/i2c/ov2740.c | 63 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 48 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 64ecb6917dd3..716c26c13c97 100644
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
@@ -930,8 +935,9 @@ static int ov2740_remove(struct i2c_client *client)
 	return 0;
 }
 
-static int ov2740_load_otp_data(struct i2c_client *client, struct nvm_data *nvm)
+static int ov2740_load_otp_data(struct nvm_data *nvm)
 {
+	struct i2c_client *client = nvm->client;
 	struct ov2740 *ov2740 = to_ov2740(i2c_get_clientdata(client));
 	u32 isp_ctrl00 = 0;
 	u32 isp_ctrl01 = 0;
@@ -967,7 +973,7 @@ static int ov2740_load_otp_data(struct i2c_client *client, struct nvm_data *nvm)
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
 			       OV2740_MODE_STREAMING);
 	if (ret) {
-		dev_err(&client->dev, "failed to start streaming\n");
+		dev_err(&client->dev, "failed to set streaming mode\n");
 		goto exit;
 	}
 
@@ -997,20 +1003,48 @@ static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
 			     size_t count)
 {
 	struct nvm_data *nvm = priv;
+	struct v4l2_subdev *sd = i2c_get_clientdata(nvm->client);
+	struct device *dev = &nvm->client->dev;
+	struct ov2740 *ov2740 = to_ov2740(sd);
+	int ret = 0;
+
+	mutex_lock(&ov2740->mutex);
 
-	memcpy(val, nvm->nvm_buffer + off, count);
+	if (!nvm->ready) {
+		if (ov2740->streaming) {
+			ret = -EBUSY;
+			goto exit;
+		}
 
-	return 0;
+		ret = pm_runtime_get_sync(dev);
+		if (ret < 0) {
+			pm_runtime_put_noidle(dev);
+			goto exit;
+		}
+		ret = ov2740_load_otp_data(nvm);
+		if (!ret)
+			nvm->ready = true;
+		pm_runtime_put(dev);
+	}
+
+exit:
+	mutex_unlock(&ov2740->mutex);
+
+	if (!ret)
+		memcpy(val, nvm->nvm_buffer + off, count);
+
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
@@ -1028,12 +1062,7 @@ static int ov2740_register_nvmem(struct i2c_client *client)
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
@@ -1051,7 +1080,11 @@ static int ov2740_register_nvmem(struct i2c_client *client)
 
 	nvm->nvmem = devm_nvmem_register(dev, &nvmem_config);
 
-	return PTR_ERR_OR_ZERO(nvm->nvmem);
+	ret = PTR_ERR_OR_ZERO(nvm->nvmem);
+	if (!ret)
+		ov2740->nvm = nvm;
+
+	return ret;
 }
 
 static int ov2740_probe(struct i2c_client *client)
@@ -1103,7 +1136,7 @@ static int ov2740_probe(struct i2c_client *client)
 		goto probe_error_media_entity_cleanup;
 	}
 
-	ret = ov2740_register_nvmem(client);
+	ret = ov2740_register_nvmem(client, ov2740);
 	if (ret)
 		dev_warn(&client->dev, "register nvmem failed, ret %d\n", ret);
 
-- 
2.7.4

