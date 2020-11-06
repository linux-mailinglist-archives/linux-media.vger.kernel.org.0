Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C23F2A8F92
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 07:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgKFGnt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 01:43:49 -0500
Received: from mga11.intel.com ([192.55.52.93]:23052 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725828AbgKFGnt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Nov 2020 01:43:49 -0500
IronPort-SDR: nuns4aOjODvOOXSoGa/tT1z4LtCiDaPm9zNdmJSrBzxcIoLOQL7XJ44fSaw3879lu/pt6adT9R
 bwb2mULZ3oVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="166000809"
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="166000809"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:43:49 -0800
IronPort-SDR: VoE66q5NvP3WqE9PS39guQhI9r0hwWp4u9e2MvMfBOhc3BKMD3f5QSMnt9NcT4jVEwdmTB1Bhq
 NjVyJoA8jbTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="354596683"
Received: from ipu5-build.bj.intel.com ([10.238.232.196])
  by fmsmga004.fm.intel.com with ESMTP; 05 Nov 2020 22:43:47 -0800
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
Cc:     tfiga@chromium.org, senozhatsky@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com, qingwu.zhang@intel.com
Subject: [PATCH 2/2] media: ov2740: allow OTP data access during streaming
Date:   Fri,  6 Nov 2020 14:40:44 +0800
Message-Id: <1604644844-1551-2-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604644844-1551-1-git-send-email-bingbu.cao@intel.com>
References: <1604644844-1551-1-git-send-email-bingbu.cao@intel.com>
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
 drivers/media/i2c/ov2740.c | 135 ++++++++++++++++++++++++---------------------
 1 file changed, 71 insertions(+), 64 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 716c26c13c97..198ce5b37888 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -599,13 +599,84 @@ static void ov2740_update_pad_format(const struct ov2740_mode *mode,
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
+	ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
+			 OV2740_MODE_STANDBY);
+	ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1, isp_ctrl01);
+	ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, isp_ctrl00);
+
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
 
+	if (nvm && !nvm->ready) {
+		ret = ov2740_load_otp_data(nvm);
+		if (!ret)
+			nvm->ready = true;
+	}
+
 	link_freq_index = ov2740->cur_mode->link_freq_index;
 	reg_list = &link_freq_configs[link_freq_index].reg_list;
 	ret = ov2740_write_reg_list(ov2740, reg_list);
@@ -935,70 +1006,6 @@ static int ov2740_remove(struct i2c_client *client)
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
-	ret = ov2740_read_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, &isp_ctrl00);
-	if (ret) {
-		dev_err(&client->dev, "failed to read ISP CTRL00\n");
-		goto exit;
-	}
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
-		dev_err(&client->dev, "failed to write ISP CTRL00\n");
-		goto exit;
-	}
-
-	/* Clear bit 7 of ISP CTRL01 */
-	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1,
-			       isp_ctrl01 & ~BIT(7));
-	if (ret) {
-		dev_err(&client->dev, "failed to write ISP CTRL01\n");
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
-	ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
-			 OV2740_MODE_STANDBY);
-	ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1, isp_ctrl01);
-	ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, isp_ctrl00);
-
-exit:
-	return ret;
-}
-
 static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
 			     size_t count)
 {
-- 
2.7.4

