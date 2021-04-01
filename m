Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E039E351A86
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234207AbhDASBs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:01:48 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:19744 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236626AbhDAR6T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 13:58:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617299900; x=1648835900;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XeaF4eWaLDP8UECnNygoHMfnBPpBZkWuK4VeDitjExs=;
  b=uWBDjuGVnGupI3tSt2rc34qZKfxr3jpQAEVaIvnhAKHdBHYnXJ2kqDjD
   mchzH5xcRXCRYGWTD5MafjCQqmo9ETFZAEw7VHKFGt64uRcFPYwX8nqTV
   v7fUSOo/D917Kynf3CqxdY5DsfcWVG7FZIeMSGKOU2OIQXJBYCaNDejgM
   Va2BIzUxC1fkazwFOzw9yqyNvyM+3wkF0j2AdFhXJl84xcZgfCCiPI/c0
   jb3TulboaJNhezfxqYs2wqli9AHFOjEreL7oXeDYysB+kChHWv+gMwL3N
   kfvsv2e8UtEs8M014UjPAuJfSIrI3yjPFpN2i2GY/IDPsqRG7hLY2vnOS
   g==;
IronPort-SDR: 5Xp65OnpDItby1PclhVcvOpXV4PBTBlrhnfxkvg0zUGs488fPh1nlWZE/d2wfMd5xgOULGTQBu
 dSEe3hhG/DaPrHs8pdJULyRzoZw9rd14h6BBCpXOWRepTgtPHczaw+QUpuZWNXIvKwJBGNaTbO
 VtDiGPKhjDaiOq+Rfm4Q9fbxcCfkEKx0vBAW81snti3YF7KyeybghBxw/8RtpF4z3bvQXLRqhz
 PmnxdcTV6kfmYeYAaya8qLD7pM8A50cUciznFbSpv66TxPz/Us+jY9Z+9odNsDgvEmkhP5H1Nz
 Ui0=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="109338722"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:33:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:33:02 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:32:40 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 19/30] media: atmel: atmel-isc: add CC initialization function
Date:   Thu, 1 Apr 2021 14:27:12 +0300
Message-ID: <20210401112723.189107-20-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401112723.189107-1-eugen.hristev@microchip.com>
References: <20210401112723.189107-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement the color correction (CC) submodule initialization, as a product
specific function, which currently configures the neutral point in color
correction.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c    |  1 +
 drivers/media/platform/atmel/atmel-isc.h         |  3 +++
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 14 ++++++++++++++
 3 files changed, 18 insertions(+)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 66005cb3940f..182903803c05 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -653,6 +653,7 @@ static void isc_set_pipeline(struct isc_device *isc, u32 pipeline)
 
 	isc->config_csc(isc);
 	isc->config_cbc(isc);
+	isc->config_cc(isc);
 }
 
 static int isc_update_profile(struct isc_device *isc)
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index f574bcc3ba67..a5f8d5001381 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -225,6 +225,8 @@ struct isc_reg_offsets {
  *			specific CSC module
  * @config_cbc:		pointer to a function that initializes product
  *			specific CBC module
+ * @config_cc:		pointer to a function that initializes product
+ *			specific CC module
  *
  * @offsets:		struct holding the product specific register offsets
  */
@@ -298,6 +300,7 @@ struct isc_device {
 	struct {
 		void (*config_csc)(struct isc_device *isc);
 		void (*config_cbc)(struct isc_device *isc);
+		void (*config_cc)(struct isc_device *isc);
 	};
 
 	struct isc_reg_offsets		offsets;
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index da516f2f5ca9..917d10baa525 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -83,6 +83,19 @@ void isc_sama5d2_config_cbc(struct isc_device *isc)
 		     isc->ctrls.contrast);
 }
 
+void isc_sama5d2_config_cc(struct isc_device *isc)
+{
+	struct regmap *regmap = isc->regmap;
+
+	/* Configure each register at the neutral fixed point 1.0 or 0.0 */
+	regmap_write(regmap, ISC_CC_RR_RG, (1 << 8));
+	regmap_write(regmap, ISC_CC_RB_OR, 0);
+	regmap_write(regmap, ISC_CC_GR_GG, (1 << 8) << 16);
+	regmap_write(regmap, ISC_CC_GB_OG, 0);
+	regmap_write(regmap, ISC_CC_BR_BG, 0);
+	regmap_write(regmap, ISC_CC_BB_OB, (1 << 8));
+}
+
 /* Gamma table with gamma 1/2.2 */
 const u32 isc_sama5d2_gamma_table[][GAMMA_ENTRIES] = {
 	/* 0 --> gamma 1/1.8 */
@@ -230,6 +243,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 
 	isc->config_csc = isc_sama5d2_config_csc;
 	isc->config_cbc = isc_sama5d2_config_cbc;
+	isc->config_cc = isc_sama5d2_config_cc;
 
 	isc->offsets.csc = ISC_SAMA5D2_CSC_OFFSET;
 	isc->offsets.cbc = ISC_SAMA5D2_CBC_OFFSET;
-- 
2.25.1

