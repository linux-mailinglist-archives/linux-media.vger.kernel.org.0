Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BCA9351B04
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237682AbhDASEI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:04:08 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:20061 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237541AbhDASAW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 14:00:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617300022; x=1648836022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+X6BGvSt1VLnTLPppX+gBlHPzID6mcWeaE9aLHzxe58=;
  b=HT5NntrFMFmnE3iGDHIWHgLKEHCPKSb0glEC9ihejlbfIadNfsg5Bfdl
   4/3ekt/jeGtzeIuaYIxeSK33Xr0TOT+YnL953Uh2+Oz5y9xXwzyATsM1h
   DNkMUkCF6jTJgaKtf9aDBJ4B8VpiZADsj0xiLg1hTGNGMzmx41fACBzAc
   /WEKFKrmfxf+MB1saAcOVBXK1lOHHIbQPwlDadbGtJTiLtTSLL8ZeKJ5c
   rsHsHz227/P6HMYVGEV1oZCt0o2v+69brtUUcIO6TLIxn+8kOQpNof1UC
   ZLmXSfCMDJ5THh69wBvOBMsvqUV2PyHxBiZ5iswL1xkTl0jJJ+ORPyfuV
   A==;
IronPort-SDR: EuZxxln5XO2wuqNiPf7CLQvEz/L/qNTDs/EJImY6OLxguPYIqC0ZZaAgvEyYFTFkgES/7CwYr4
 Y/gnfjhmazctFeei3THHdek6kR4xo1tHAjMbiskWwQraO2v/Q6aypBNrJC1u6XkRkxQRGWUrkU
 VFlYT2JMe/rl9FYLt4I/MHCQncPeF0ZgbIAoCSHNhN5O3h6VNxd+yUU7LbmPkmbKNY9VLU5H17
 y8RO6B8ddE/lcfG5x0BX3Cj522X8VhI//278Nv9xsh+ow4RhhhQp1dtUAt3cmbdKBP1z9bJSbt
 z/I=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="109338789"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:33:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:33:56 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:33:41 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 22/30] media: atmel: atmel-isc: create callback for GAM submodule product specific
Date:   Thu, 1 Apr 2021 14:27:15 +0300
Message-ID: <20210401112723.189107-23-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401112723.189107-1-eugen.hristev@microchip.com>
References: <20210401112723.189107-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Create a product specific callback for initializing the GAM submodule
of the pipeline.
For sama5d2 product, there is no special configuration at this moment,
thus this function is a noop.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c    | 1 +
 drivers/media/platform/atmel/atmel-isc.h         | 3 +++
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 6 ++++++
 3 files changed, 10 insertions(+)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 1f7116abc61a..bd24e0c99613 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -655,6 +655,7 @@ static void isc_set_pipeline(struct isc_device *isc, u32 pipeline)
 	isc->config_csc(isc);
 	isc->config_cbc(isc);
 	isc->config_cc(isc);
+	isc->config_gam(isc);
 }
 
 static int isc_update_profile(struct isc_device *isc)
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index d6cd85a4c3e9..1e6988f1876e 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -229,6 +229,8 @@ struct isc_reg_offsets {
  *			specific CBC module
  * @config_cc:		pointer to a function that initializes product
  *			specific CC module
+ * @config_gam:		pointer to a function that initializes product
+ *			specific GAMMA module
  * @config_ctrls:	pointer to a functoin that initializes product
  *			specific v4l2 controls.
  *
@@ -306,6 +308,7 @@ struct isc_device {
 		void (*config_csc)(struct isc_device *isc);
 		void (*config_cbc)(struct isc_device *isc);
 		void (*config_cc)(struct isc_device *isc);
+		void (*config_gam)(struct isc_device *isc);
 
 		void (*config_ctrls)(struct isc_device *isc,
 				     const struct v4l2_ctrl_ops *ops);
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index ae906126ffb8..f5863bf3ac32 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -112,6 +112,11 @@ void isc_sama5d2_config_dpc(struct isc_device *isc)
 	/* This module is not present on sama5d2 pipeline */
 }
 
+void isc_sama5d2_config_gam(struct isc_device *isc)
+{
+	/* No specific gamma configuration */
+}
+
 /* Gamma table with gamma 1/2.2 */
 const u32 isc_sama5d2_gamma_table[][GAMMA_ENTRIES] = {
 	/* 0 --> gamma 1/1.8 */
@@ -261,6 +266,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->config_csc = isc_sama5d2_config_csc;
 	isc->config_cbc = isc_sama5d2_config_cbc;
 	isc->config_cc = isc_sama5d2_config_cc;
+	isc->config_gam = isc_sama5d2_config_gam;
 	isc->config_ctrls = isc_sama5d2_config_ctrls;
 
 	isc->offsets.csc = ISC_SAMA5D2_CSC_OFFSET;
-- 
2.25.1

