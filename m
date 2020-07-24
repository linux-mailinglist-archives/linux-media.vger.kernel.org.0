Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8165622BC99
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 05:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgGXDq6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jul 2020 23:46:58 -0400
Received: from mga14.intel.com ([192.55.52.115]:59541 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726642AbgGXDq6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jul 2020 23:46:58 -0400
IronPort-SDR: 75EqmmuHXLVqzO8/OnYfuWK3vnQpFWI0rJPDcMNKEPuzDBUAEEz6R7zqObBQ9D2BU87PbE2T+7
 ErnsCPVDVaEw==
X-IronPort-AV: E=McAfee;i="6000,8403,9691"; a="149845718"
X-IronPort-AV: E=Sophos;i="5.75,389,1589266800"; 
   d="scan'208";a="149845718"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 20:46:57 -0700
IronPort-SDR: zNh27Y0pasdPcK+l1KhKV6g2NKcPFNuUNudBY0vIISFTD5ovpJLLQLm+IlS3tONQJAMBNbOZRa
 TB7qj+LQbiVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,389,1589266800"; 
   d="scan'208";a="488599799"
Received: from ipu5-build.bj.intel.com ([10.238.232.196])
  by fmsmga006.fm.intel.com with ESMTP; 23 Jul 2020 20:46:55 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        senozhatsky@chromium.org
Cc:     bingbu.cao@intel.com, bingbu.cao@linux.intel.com,
        qingwu.zhang@intel.com
Subject: [PATCH v2] media: i2c: ov2740: get OTP data ready before nvmem registration
Date:   Fri, 24 Jul 2020 11:45:38 +0800
Message-Id: <1595562338-11864-1-git-send-email-bingbu.cao@intel.com>
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
v2: fix ktest robot warning
---
 drivers/media/i2c/ov2740.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index fd0b6a903ec1..bd0d45b0d43f 100644
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
@@ -1042,18 +1052,8 @@ static int ov2740_register_nvmem(struct i2c_client *client)
 	nvmem_config.size = CUSTOMER_USE_OTP_SIZE;
 
 	nvm->nvmem = devm_nvmem_register(dev, &nvmem_config);
-	if (IS_ERR(nvm->nvmem))
-		return PTR_ERR(nvm->nvmem);
 
-	nvm->nvm_buffer = devm_kzalloc(dev, CUSTOMER_USE_OTP_SIZE, GFP_KERNEL);
-	if (!nvm->nvm_buffer)
-		return -ENOMEM;
-
-	ret = ov2740_load_otp_data(client, nvm);
-	if (ret)
-		dev_err(dev, "failed to load OTP data, ret %d\n", ret);
-
-	return ret;
+	return PTR_ERR_OR_ZERO(nvm->nvmem);
 }
 
 static int ov2740_probe(struct i2c_client *client)
@@ -1107,7 +1107,7 @@ static int ov2740_probe(struct i2c_client *client)
 
 	ret = ov2740_register_nvmem(client);
 	if (ret)
-		dev_err(&client->dev, "register nvmem failed, ret %d\n", ret);
+		dev_warn(&client->dev, "register nvmem failed, ret %d\n", ret);
 
 	/*
 	 * Device is already turned on by i2c-core with ACPI domain PM.
-- 
2.7.4

