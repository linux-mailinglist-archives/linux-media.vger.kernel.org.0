Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 886222B148D
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 04:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbgKMDJ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 22:09:57 -0500
Received: from mga02.intel.com ([134.134.136.20]:20339 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725965AbgKMDJ4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 22:09:56 -0500
IronPort-SDR: h8tdViv2E/BQDTE/RLSu9wfa7Lx9x7F2RoEYM6GEmYC8NLvhzrFCqIXfmGHZNQMmxxe4xL/kAh
 X7OqZAGlF1Cw==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="157439084"
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; 
   d="scan'208";a="157439084"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 19:09:56 -0800
IronPort-SDR: WuDtk/uVu/KsogS+n0wIUwNPW3q9HOy1uRhYdjMtucF78hbJel5mre4S1rFEndYuICqVqYMOZW
 s9CmP1YoXrNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; 
   d="scan'208";a="532410033"
Received: from ipu5-build.bj.intel.com ([10.238.232.196])
  by fmsmga005.fm.intel.com with ESMTP; 12 Nov 2020 19:09:54 -0800
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        tfiga@chromium.org
Cc:     senozhatsky@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH v4 2/2] media: ov2740: allow OTP data access during streaming
Date:   Fri, 13 Nov 2020 11:06:58 +0800
Message-Id: <1605236818-25292-2-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605236818-25292-1-git-send-email-bingbu.cao@intel.com>
References: <1605236818-25292-1-git-send-email-bingbu.cao@intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

OTP data access of ov2740 need enable the streaming mode to load
and it could be done in any time, so driver need allow the OTP
data access during streaming instead of return EBUSY, this patch
try to read the OTP data out in STREAMON if OTP data is not ready
before first time streaming start.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Qingwu Zhang <qingwu.zhang@intel.com>
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
---
 drivers/media/i2c/ov2740.c | 189 +++++++++++++++++++++++----------------------
 1 file changed, 96 insertions(+), 93 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 16a1e4e16dd8..99016546cbec 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -598,13 +598,109 @@ static void ov2740_update_pad_format(const struct ov2740_mode *mode,
 	fmt->field = V4L2_FIELD_NONE;
 }
 
+static int ov2740_load_otp_data(struct nvm_data *nvm)
+{
+	struct i2c_client *client = nvm->client;
+	struct ov2740 *ov2740 = to_ov2740(i2c_get_clientdata(client));
+	u32 isp_ctrl00 = 0;
+	u32 isp_ctrl01 = 0;
+	int ret;
+
+	if (!nvm)
+		return -EINVAL;
+
+	if (nvm->nvm_buffer)
+		return 0;
+
+	nvm->nvm_buffer = kzalloc(CUSTOMER_USE_OTP_SIZE, GFP_KERNEL);
+	if (!nvm->nvm_buffer)
+		return -ENOMEM;
+
+	ret = ov2740_read_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, &isp_ctrl00);
+	if (ret) {
+		dev_err(&client->dev, "failed to read ISP CTRL00\n");
+		goto err;
+	}
+
+	ret = ov2740_read_reg(ov2740, OV2740_REG_ISP_CTRL01, 1, &isp_ctrl01);
+	if (ret) {
+		dev_err(&client->dev, "failed to read ISP CTRL01\n");
+		goto err;
+	}
+
+	/* Clear bit 5 of ISP CTRL00 */
+	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL00, 1,
+			       isp_ctrl00 & ~BIT(5));
+	if (ret) {
+		dev_err(&client->dev, "failed to set ISP CTRL00\n");
+		goto err;
+	}
+
+	/* Clear bit 7 of ISP CTRL01 */
+	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1,
+			       isp_ctrl01 & ~BIT(7));
+	if (ret) {
+		dev_err(&client->dev, "failed to set ISP CTRL01\n");
+		goto err;
+	}
+
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
+			       OV2740_MODE_STREAMING);
+	if (ret) {
+		dev_err(&client->dev, "failed to set streaming mode\n");
+		goto err;
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
+		goto err;
+	}
+
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
+			       OV2740_MODE_STANDBY);
+	if (ret) {
+		dev_err(&client->dev, "failed to set streaming mode\n");
+		goto err;
+	}
+
+	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1, isp_ctrl01);
+	if (ret) {
+		dev_err(&client->dev, "failed to set ISP CTRL01\n");
+		goto err;
+	}
+
+	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, isp_ctrl00);
+	if (ret) {
+		dev_err(&client->dev, "failed to set ISP CTRL00\n");
+		goto err;
+	}
+
+	return 0;
+err:
+	kfree(nvm->nvm_buffer);
+	nvm->nvm_buffer = NULL;
+
+	return ret;
+}
+
 static int ov2740_start_streaming(struct ov2740 *ov2740)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
+	struct nvm_data *nvm = ov2740->nvm;
 	const struct ov2740_reg_list *reg_list;
 	int link_freq_index;
 	int ret = 0;
 
+	ov2740_load_otp_data(nvm);
+
 	link_freq_index = ov2740->cur_mode->link_freq_index;
 	reg_list = &link_freq_configs[link_freq_index].reg_list;
 	ret = ov2740_write_reg_list(ov2740, reg_list);
@@ -934,99 +1030,6 @@ static int ov2740_remove(struct i2c_client *client)
 	return 0;
 }
 
-static int ov2740_load_otp_data(struct nvm_data *nvm)
-{
-	struct i2c_client *client = nvm->client;
-	struct ov2740 *ov2740 = to_ov2740(i2c_get_clientdata(client));
-	u32 isp_ctrl00 = 0;
-	u32 isp_ctrl01 = 0;
-	int ret;
-
-	if (!nvm)
-		return -EINVAL;
-
-	if (nvm->nvm_buffer)
-		return 0;
-
-	nvm->nvm_buffer = kzalloc(CUSTOMER_USE_OTP_SIZE, GFP_KERNEL);
-	if (!nvm->nvm_buffer)
-		return -ENOMEM;
-
-	ret = ov2740_read_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, &isp_ctrl00);
-	if (ret) {
-		dev_err(&client->dev, "failed to read ISP CTRL00\n");
-		goto err;
-	}
-
-	ret = ov2740_read_reg(ov2740, OV2740_REG_ISP_CTRL01, 1, &isp_ctrl01);
-	if (ret) {
-		dev_err(&client->dev, "failed to read ISP CTRL01\n");
-		goto err;
-	}
-
-	/* Clear bit 5 of ISP CTRL00 */
-	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL00, 1,
-			       isp_ctrl00 & ~BIT(5));
-	if (ret) {
-		dev_err(&client->dev, "failed to set ISP CTRL00\n");
-		goto err;
-	}
-
-	/* Clear bit 7 of ISP CTRL01 */
-	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1,
-			       isp_ctrl01 & ~BIT(7));
-	if (ret) {
-		dev_err(&client->dev, "failed to set ISP CTRL01\n");
-		goto err;
-	}
-
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
-			       OV2740_MODE_STREAMING);
-	if (ret) {
-		dev_err(&client->dev, "failed to set streaming mode\n");
-		goto err;
-	}
-
-	/*
-	 * Users are not allowed to access OTP-related registers and memory
-	 * during the 20 ms period after streaming starts (0x100 = 0x01).
-	 */
-	msleep(20);
-
-	ret = regmap_bulk_read(nvm->regmap, OV2740_REG_OTP_CUSTOMER,
-			       nvm->nvm_buffer, CUSTOMER_USE_OTP_SIZE);
-	if (ret) {
-		dev_err(&client->dev, "failed to read OTP data, ret %d\n", ret);
-		goto err;
-	}
-
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
-			       OV2740_MODE_STANDBY);
-	if (ret) {
-		dev_err(&client->dev, "failed to set streaming mode\n");
-		goto err;
-	}
-
-	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1, isp_ctrl01);
-	if (ret) {
-		dev_err(&client->dev, "failed to set ISP CTRL01\n");
-		goto err;
-	}
-
-	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, isp_ctrl00);
-	if (ret) {
-		dev_err(&client->dev, "failed to set ISP CTRL00\n");
-		goto err;
-	}
-
-	return 0;
-err:
-	kfree(nvm->nvm_buffer);
-	nvm->nvm_buffer = NULL;
-
-	return ret;
-}
-
 static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
 			     size_t count)
 {
-- 
2.7.4

