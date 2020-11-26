Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3D9D2C5342
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 12:50:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733296AbgKZLtj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 06:49:39 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:42797 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727632AbgKZLti (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 06:49:38 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kiFmH-0001r3-0x; Thu, 26 Nov 2020 11:49:33 +0000
From:   Colin King <colin.king@canonical.com>
To:     Tianshu Qiu <tian.shu.qiu@intel.com>,
        Shawn Tu <shawnx.tu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Qingwu Zhang <qingwu.zhang@intel.com>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: ov2740: fix dereference before null check on pointer nvm
Date:   Thu, 26 Nov 2020 11:49:32 +0000
Message-Id: <20201126114932.1984730-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently pointer nvm is being dereferenced before it is being null
checked.  Fix this by moving the assignments of pointers client and
ov2740 so that are after the null check hence avoiding any potential
null pointer dereferences on pointer nvm.

Fixes: 5e6fd339b68d ("media: ov2740: allow OTP data access during streaming")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/i2c/ov2740.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 99016546cbec..b41a90c2aed5 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -600,8 +600,8 @@ static void ov2740_update_pad_format(const struct ov2740_mode *mode,
 
 static int ov2740_load_otp_data(struct nvm_data *nvm)
 {
-	struct i2c_client *client = nvm->client;
-	struct ov2740 *ov2740 = to_ov2740(i2c_get_clientdata(client));
+	struct i2c_client *client;
+	struct ov2740 *ov2740;
 	u32 isp_ctrl00 = 0;
 	u32 isp_ctrl01 = 0;
 	int ret;
@@ -612,6 +612,9 @@ static int ov2740_load_otp_data(struct nvm_data *nvm)
 	if (nvm->nvm_buffer)
 		return 0;
 
+	client = nvm->client;
+	ov2740 = to_ov2740(i2c_get_clientdata(client));
+
 	nvm->nvm_buffer = kzalloc(CUSTOMER_USE_OTP_SIZE, GFP_KERNEL);
 	if (!nvm->nvm_buffer)
 		return -ENOMEM;
-- 
2.29.2

