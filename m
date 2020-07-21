Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89590227C90
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 12:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728508AbgGUKJX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 06:09:23 -0400
Received: from mga17.intel.com ([192.55.52.151]:40672 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728006AbgGUKJX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 06:09:23 -0400
IronPort-SDR: OAFXhQAiwso5bvNcwh+8c61T8cB2aNLSzERaodRBbkFP0e7bb4LjMDv+WAuKRcDug13YRdu41C
 6+nTC+PHBfsw==
X-IronPort-AV: E=McAfee;i="6000,8403,9688"; a="130172369"
X-IronPort-AV: E=Sophos;i="5.75,378,1589266800"; 
   d="scan'208";a="130172369"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2020 03:09:23 -0700
IronPort-SDR: wMp3eiv3fS5BwAd094SnffvGSEpCu7rrmHHBxxAg4hGYRyD9Z0vKI130/J4zlv9xixOBg76y3s
 6qUtE7YcP3YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,378,1589266800"; 
   d="scan'208";a="462023645"
Received: from ipu5-build.bj.intel.com ([10.238.232.196])
  by orsmga005.jf.intel.com with ESMTP; 21 Jul 2020 03:09:20 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        senozhatsky@chromium.org
Cc:     bingbu.cao@intel.com, bingbu.cao@linux.intel.com,
        qingwu.zhang@intel.com
Subject: [PATCH] media: i2c: ov2740: get OTP data ready before nvmem registration
Date:   Tue, 21 Jul 2020 18:11:35 +0800
Message-Id: <1595326295-25213-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The OTP data was not ready after registered as nvmem device, it is
risky as the nvmem read may happen once the device exists, this patch
get the OTP data ready before registering the nvmem device. OTP data
missing should not break the normal camera sensor probe, so use a
warning instead of an error message.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Qingwu Zhang <qingwu.zhang@intel.com>
Suggested-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/i2c/ov2740.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index fd0b6a903ec1..ae4b58da7be4 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1018,6 +1018,10 @@ static int ov2740_register_nvmem(struct i2c_client *client)
 	if (!nvm)
 		return -ENOMEM;
 
+	nvm->nvm_buffer = devm_kzalloc(dev, CUSTOMER_USE_OTP_SIZE, GFP_KERNEL);
+	if (!nvm->nvm_buffer)
+		return -ENOMEM;
+
 	regmap_config.val_bits = 8;
 	regmap_config.reg_bits = 16;
 	regmap_config.disable_locking = true;
@@ -1027,6 +1031,12 @@ static int ov2740_register_nvmem(struct i2c_client *client)
 
 	nvm->regmap = regmap;
 
+	ret = ov2740_load_otp_data(client, nvm);
+	if (ret) {
+		dev_err(dev, "failed to load OTP data, ret %d\n", ret);
+		return ret;
+	}
+
 	nvmem_config.name = dev_name(dev);
 	nvmem_config.dev = dev;
 	nvmem_config.read_only = true;
@@ -1045,15 +1055,7 @@ static int ov2740_register_nvmem(struct i2c_client *client)
 	if (IS_ERR(nvm->nvmem))
 		return PTR_ERR(nvm->nvmem);
 
-	nvm->nvm_buffer = devm_kzalloc(dev, CUSTOMER_USE_OTP_SIZE, GFP_KERNEL);
-	if (!nvm->nvm_buffer)
-		return -ENOMEM;
-
-	ret = ov2740_load_otp_data(client, nvm);
-	if (ret)
-		dev_err(dev, "failed to load OTP data, ret %d\n", ret);
-
-	return ret;
+	return 0;
 }
 
 static int ov2740_probe(struct i2c_client *client)
@@ -1107,7 +1109,7 @@ static int ov2740_probe(struct i2c_client *client)
 
 	ret = ov2740_register_nvmem(client);
 	if (ret)
-		dev_err(&client->dev, "register nvmem failed, ret %d\n", ret);
+		dev_warn(&client->dev, "register nvmem failed, ret %d\n", ret);
 
 	/*
 	 * Device is already turned on by i2c-core with ACPI domain PM.
-- 
2.7.4

