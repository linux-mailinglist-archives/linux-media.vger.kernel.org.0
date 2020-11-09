Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0922AB1D5
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 08:42:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729673AbgKIHmq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 02:42:46 -0500
Received: from mga14.intel.com ([192.55.52.115]:32594 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728951AbgKIHmq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Nov 2020 02:42:46 -0500
IronPort-SDR: IR9jEhAnAuNPcXD11X+uyfAFeaUndhc+aW+kn0/Ccop3hCr+I4YvbrWBlHov3neJ9yA5r4sZGe
 cvSYUFZI/JVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9799"; a="168978965"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="168978965"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2020 23:42:45 -0800
IronPort-SDR: MpVCi7tbqlsJDUjfNlgDiPBRi1ds0979CauO+52ssPqH4Xo2KiUaI7j8wRYfRLRopWmiK+IaD2
 E70w+6Y7aRIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="540732825"
Received: from ipu5-build.bj.intel.com ([10.238.232.196])
  by orsmga005.jf.intel.com with ESMTP; 08 Nov 2020 23:42:43 -0800
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
Cc:     tfiga@chromium.org, senozhatsky@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com, qingwu.zhang@intel.com
Subject: [PATCH v2 2/2] media: ov2740: allow OTP data access during streaming
Date:   Mon,  9 Nov 2020 15:39:41 +0800
Message-Id: <1604907581-2808-2-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604907581-2808-1-git-send-email-bingbu.cao@intel.com>
References: <1604907581-2808-1-git-send-email-bingbu.cao@intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

OTP data access of ov2740 need enable the streaming mode to load
and it could be done in any time, so driver need allow the OTP
data access during streaming instead of return EBUSY, this patch
try to read the OTP data out in STREAMON if OTP data is not ready
before first time streaming start.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/ov2740.c | 175 +++++++++++++++++++++++----------------------
 1 file changed, 89 insertions(+), 86 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 4bb4fe4bcab6..bbe554a48c16 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -599,13 +599,102 @@ static void ov2740_update_pad_format(const struct ov2740_mode *mode,
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
+	if (nvm->ready)
+		return 0;
+
+	ret = ov2740_read_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, &isp_ctrl00);
+	if (ret) {
+		dev_err(&client->dev, "failed to read ISP CTRL00\n");
+		goto exit;
+	}
+
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
+		dev_err(&client->dev, "failed to set ISP CTRL00\n");
+		goto exit;
+	}
+
+	/* Clear bit 7 of ISP CTRL01 */
+	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1,
+			       isp_ctrl01 & ~BIT(7));
+	if (ret) {
+		dev_err(&client->dev, "failed to set ISP CTRL01\n");
+		goto exit;
+	}
+
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
+			       OV2740_MODE_STREAMING);
+	if (ret) {
+		dev_err(&client->dev, "failed to set streaming mode\n");
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
+
+	nvm->ready = true;
+exit:
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
@@ -935,92 +1024,6 @@ static int ov2740_remove(struct i2c_client *client)
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
-	if (nvm->ready)
-		return 0;
-
-	ret = ov2740_read_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, &isp_ctrl00);
-	if (ret) {
-		dev_err(&client->dev, "failed to read ISP CTRL00\n");
-		goto exit;
-	}
-
-	ret = ov2740_read_reg(ov2740, OV2740_REG_ISP_CTRL01, 1, &isp_ctrl01);
-	if (ret) {
-		dev_err(&client->dev, "failed to read ISP CTRL01\n");
-		goto exit;
-	}
-
-	/* Clear bit 5 of ISP CTRL00 */
-	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL00, 1,
-			       isp_ctrl00 & ~BIT(5));
-	if (ret) {
-		dev_err(&client->dev, "failed to set ISP CTRL00\n");
-		goto exit;
-	}
-
-	/* Clear bit 7 of ISP CTRL01 */
-	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1,
-			       isp_ctrl01 & ~BIT(7));
-	if (ret) {
-		dev_err(&client->dev, "failed to set ISP CTRL01\n");
-		goto exit;
-	}
-
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
-			       OV2740_MODE_STREAMING);
-	if (ret) {
-		dev_err(&client->dev, "failed to set streaming mode\n");
-		goto exit;
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
-		goto exit;
-	}
-
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
-			       OV2740_MODE_STANDBY);
-	if (ret) {
-		dev_err(&client->dev, "failed to set streaming mode\n");
-		goto exit;
-	}
-
-	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1, isp_ctrl01);
-	if (ret) {
-		dev_err(&client->dev, "failed to set ISP CTRL01\n");
-		goto exit;
-	}
-
-	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, isp_ctrl00);
-	if (ret) {
-		dev_err(&client->dev, "failed to set ISP CTRL00\n");
-		goto exit;
-	}
-
-	nvm->ready = true;
-exit:
-	return ret;
-}
-
 static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
 			     size_t count)
 {
-- 
2.7.4

