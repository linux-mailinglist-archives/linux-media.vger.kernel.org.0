Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BEDF1F7623
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 11:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgFLJkh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 05:40:37 -0400
Received: from mga14.intel.com ([192.55.52.115]:63902 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbgFLJkh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 05:40:37 -0400
IronPort-SDR: eWdB0Kvp60qgh/jQ/A5Zb9V5KjISx0h9YhC167JhiXoXJRx8U8hVjMxgyuC1FyvnaHecvOxwao
 dPCYw2iBTRjg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2020 02:40:37 -0700
IronPort-SDR: KBQZU9z58rpqTwpu9tCbyKSjpBSSmOXZZ4wzJCaxBG9pFuVzBJrU6lU9y9hIxKQYKx40CZLVKJ
 9aokEKKkL2XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,502,1583222400"; 
   d="scan'208";a="289830522"
Received: from ipu5-build.bj.intel.com ([10.238.232.196])
  by orsmga002.jf.intel.com with ESMTP; 12 Jun 2020 02:40:34 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        sakari.ailus@linux.intel.com
Cc:     srinivas.kandagatla@linaro.org, tfiga@chromium.org,
        bingbu.cao@intel.com, bingbu.cao@linux.intel.com
Subject: [PATCH] media: ov2740: add NVMEM interface to read customized OTP data
Date:   Fri, 12 Jun 2020 17:42:02 +0800
Message-Id: <1591954922-14006-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Qingwu Zhang <qingwu.zhang@intel.com>

ov2740 includes 512bytes of one-time programmable memory and
256 bytes are reserved for customers which can be used to store
customized information. This patch provide an NVMEM interface
to support read out the customized data in OTP.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Qingwu Zhang <qingwu.zhang@intel.com>
---
 drivers/media/i2c/ov2740.c | 145 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 33025c6d23ac..fd0b6a903ec1 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -7,6 +7,8 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/nvmem-provider.h>
+#include <linux/regmap.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -59,6 +61,21 @@
 #define OV2740_TEST_PATTERN_ENABLE	BIT(7)
 #define OV2740_TEST_PATTERN_BAR_SHIFT	2
 
+/* ISP CTRL00 */
+#define OV2740_REG_ISP_CTRL00		0x5000
+/* ISP CTRL01 */
+#define OV2740_REG_ISP_CTRL01		0x5001
+/* Customer Addresses: 0x7010 - 0x710F */
+#define CUSTOMER_USE_OTP_SIZE		0x100
+/* OTP registers from sensor */
+#define OV2740_REG_OTP_CUSTOMER		0x7010
+
+struct nvm_data {
+	char *nvm_buffer;
+	struct nvmem_device *nvmem;
+	struct regmap *regmap;
+};
+
 enum {
 	OV2740_LINK_FREQ_360MHZ_INDEX,
 };
@@ -915,6 +932,130 @@ static int ov2740_remove(struct i2c_client *client)
 	return 0;
 }
 
+static int ov2740_load_otp_data(struct i2c_client *client, struct nvm_data *nvm)
+{
+	struct ov2740 *ov2740 = to_ov2740(i2c_get_clientdata(client));
+	u32 isp_ctrl00 = 0;
+	u32 isp_ctrl01 = 0;
+	int ret;
+
+	ret = ov2740_read_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, &isp_ctrl00);
+	if (ret) {
+		dev_err(&client->dev, "failed to read ISP CTRL00\n");
+		goto exit;
+	}
+	ret = ov2740_read_reg(ov2740, OV2740_REG_ISP_CTRL01, 1, &isp_ctrl01);
+	if (ret) {
+		dev_err(&client->dev, "failed to read ISP CTRL01\n");
+		goto exit;
+	}
+
+	/* Clear bit 5 of ISP CTRL00 */
+	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL00, 1,
+			       isp_ctrl00 & ~BIT(5));
+	if (ret) {
+		dev_err(&client->dev, "failed to write ISP CTRL00\n");
+		goto exit;
+	}
+
+	/* Clear bit 7 of ISP CTRL01 */
+	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1,
+			       isp_ctrl01 & ~BIT(7));
+	if (ret) {
+		dev_err(&client->dev, "failed to write ISP CTRL01\n");
+		goto exit;
+	}
+
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
+			       OV2740_MODE_STREAMING);
+	if (ret) {
+		dev_err(&client->dev, "failed to start streaming\n");
+		goto exit;
+	}
+
+	/*
+	 * Users are not allowed to access OTP-related registers and memory
+	 * during the 20 ms period after streaming starts (0x100 = 0x01).
+	 */
+	msleep(20);
+
+	ret = regmap_bulk_read(nvm->regmap, OV2740_REG_OTP_CUSTOMER,
+			       nvm->nvm_buffer, CUSTOMER_USE_OTP_SIZE);
+	if (ret) {
+		dev_err(&client->dev, "failed to read OTP data, ret %d\n", ret);
+		goto exit;
+	}
+
+	ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
+			 OV2740_MODE_STANDBY);
+	ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1, isp_ctrl01);
+	ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, isp_ctrl00);
+
+exit:
+	return ret;
+}
+
+static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
+			     size_t count)
+{
+	struct nvm_data *nvm = priv;
+
+	memcpy(val, nvm->nvm_buffer + off, count);
+
+	return 0;
+}
+
+static int ov2740_register_nvmem(struct i2c_client *client)
+{
+	struct nvm_data *nvm;
+	struct regmap_config regmap_config = { };
+	struct nvmem_config nvmem_config = { };
+	struct regmap *regmap;
+	struct device *dev = &client->dev;
+	int ret = 0;
+
+	nvm = devm_kzalloc(dev, sizeof(*nvm), GFP_KERNEL);
+	if (!nvm)
+		return -ENOMEM;
+
+	regmap_config.val_bits = 8;
+	regmap_config.reg_bits = 16;
+	regmap_config.disable_locking = true;
+	regmap = devm_regmap_init_i2c(client, &regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	nvm->regmap = regmap;
+
+	nvmem_config.name = dev_name(dev);
+	nvmem_config.dev = dev;
+	nvmem_config.read_only = true;
+	nvmem_config.root_only = true;
+	nvmem_config.owner = THIS_MODULE;
+	nvmem_config.compat = true;
+	nvmem_config.base_dev = dev;
+	nvmem_config.reg_read = ov2740_nvmem_read;
+	nvmem_config.reg_write = NULL;
+	nvmem_config.priv = nvm;
+	nvmem_config.stride = 1;
+	nvmem_config.word_size = 1;
+	nvmem_config.size = CUSTOMER_USE_OTP_SIZE;
+
+	nvm->nvmem = devm_nvmem_register(dev, &nvmem_config);
+	if (IS_ERR(nvm->nvmem))
+		return PTR_ERR(nvm->nvmem);
+
+	nvm->nvm_buffer = devm_kzalloc(dev, CUSTOMER_USE_OTP_SIZE, GFP_KERNEL);
+	if (!nvm->nvm_buffer)
+		return -ENOMEM;
+
+	ret = ov2740_load_otp_data(client, nvm);
+	if (ret)
+		dev_err(dev, "failed to load OTP data, ret %d\n", ret);
+
+	return ret;
+}
+
 static int ov2740_probe(struct i2c_client *client)
 {
 	struct ov2740 *ov2740;
@@ -964,6 +1105,10 @@ static int ov2740_probe(struct i2c_client *client)
 		goto probe_error_media_entity_cleanup;
 	}
 
+	ret = ov2740_register_nvmem(client);
+	if (ret)
+		dev_err(&client->dev, "register nvmem failed, ret %d\n", ret);
+
 	/*
 	 * Device is already turned on by i2c-core with ACPI domain PM.
 	 * Enable runtime PM and turn off the device.
-- 
2.7.4

