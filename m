Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E05A35DD0F
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344307AbhDMLAi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:00:38 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:23964 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244209AbhDMLAd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:00:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311614; x=1649847614;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pH48Tc572HvJwSIsoUpSTK9L3gtt65iz4UV50SeY754=;
  b=MIguziRhjMcyd4qXswNPlqiKNu8yyLSHLVS+HdqlyziigYyZEqJEadRz
   3g0oRGZj8sdd9FnwcOpEpuOrHti3iMSyLsqRIj9u84UP0UHmlMR5q7BVI
   vRTG/H6O0JmVYsZmhrD9bYpWxZol7U+PJ4rCd/U3vrvpPm0BATc8omOll
   8sa7QThC9CCDGKAsd6sOB8zXM0G7nydU8fzbok0j1/LXFFodx2rBt+Zpy
   95rQhNmaqM2dzr3iL5L+cdpdmGbquVlwFKfw42gguht3Jbm2U4gRKtOzL
   uJDA/QvoXJE8bPgvUUH3Qk6BZn/9HQ/pCZtyvNELmuIEKTqS4M7RV+Jai
   Q==;
IronPort-SDR: 3b5L1MmKuonAFQHBjxKNZraVIfY+CcwEv8jdo7KTGv+LlneIzFHq66Taa8ayLjDVkBDvWcT6RB
 KllPvWmXGH1tYGv+AN6qN2t0mbPGRnT3unZ7Hc/v0HV7vcPwyjD0Hb0wKsdgmjPXIOBItX2mGw
 PRlCym+IpUa5TD1Jh7NMyf4qATmHNGpQAwaXXbIGWtHcNAcjk1zJC8/BQZFdhQsBIrtID8bIOd
 mpAwvfQkhMQyNVAVCk33i5tm5IbIuC24pBKnLeMYA9r43QCN0F8xPEkW5DXYcgMFVFC0cRHKgd
 NMQ=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="110611765"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 04:00:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 04:00:13 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 03:59:57 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 06/33] media: atmel: atmel-isc: extract CSC submodule config into separate function
Date:   Tue, 13 Apr 2021 13:57:04 +0300
Message-ID: <20210413105731.610028-7-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-1-eugen.hristev@microchip.com>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSC submodule is a part of the atmel-isc pipeline, and stands for
Color Space Conversion. It is used to apply a matrix transformation to
RGB pixels to convert them to the YUV components.
The CSC submodule should be initialized in the product specific driver
as it's product specific. Other products can implement it differently.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v3:
- added explanation regarding CSC acronym
Changes in v2:
- addded function prototype to avoid warning with W=1

 drivers/media/platform/atmel/atmel-isc-base.c   |  8 +-------
 drivers/media/platform/atmel/atmel-isc.h        |  7 +++++++
 .../media/platform/atmel/atmel-sama5d2-isc.c    | 17 +++++++++++++++++
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index ff40ee2e2759..31f63ba90c71 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -646,13 +646,7 @@ static void isc_set_pipeline(struct isc_device *isc, u32 pipeline)
 	regmap_bulk_write(regmap, ISC_GAM_GENTRY, gamma, GAMMA_ENTRIES);
 	regmap_bulk_write(regmap, ISC_GAM_RENTRY, gamma, GAMMA_ENTRIES);
 
-	/* Convert RGB to YUV */
-	regmap_write(regmap, ISC_CSC_YR_YG, 0x42 | (0x81 << 16));
-	regmap_write(regmap, ISC_CSC_YB_OY, 0x19 | (0x10 << 16));
-	regmap_write(regmap, ISC_CSC_CBR_CBG, 0xFDA | (0xFB6 << 16));
-	regmap_write(regmap, ISC_CSC_CBB_OCB, 0x70 | (0x80 << 16));
-	regmap_write(regmap, ISC_CSC_CRR_CRG, 0x70 | (0xFA2 << 16));
-	regmap_write(regmap, ISC_CSC_CRB_OCR, 0xFEE | (0x80 << 16));
+	isc->config_csc(isc);
 
 	regmap_write(regmap, ISC_CBC_BRIGHT, ctrls->brightness);
 	regmap_write(regmap, ISC_CBC_CONTRAST, ctrls->contrast);
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index d14ae096fbf6..bb0b4419deff 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -192,6 +192,9 @@ struct isc_ctrls {
  *
  * @max_width:		maximum frame width, dependent on the internal RAM
  * @max_height:		maximum frame height, dependent on the internal RAM
+ *
+ * @config_csc:		pointer to a function that initializes product
+ *			specific CSC module
  */
 struct isc_device {
 	struct regmap		*regmap;
@@ -259,6 +262,10 @@ struct isc_device {
 
 	u32		max_width;
 	u32		max_height;
+
+	struct {
+		void (*config_csc)(struct isc_device *isc);
+	};
 };
 
 extern struct isc_format formats_list[];
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index 6d9942dcd7c1..f041bd75090e 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -54,6 +54,21 @@
 
 #define ISC_CLK_MAX_DIV		255
 
+void isc_sama5d2_config_csc(struct isc_device *isc);
+
+void isc_sama5d2_config_csc(struct isc_device *isc)
+{
+	struct regmap *regmap = isc->regmap;
+
+	/* Convert RGB to YUV */
+	regmap_write(regmap, ISC_CSC_YR_YG, 0x42 | (0x81 << 16));
+	regmap_write(regmap, ISC_CSC_YB_OY, 0x19 | (0x10 << 16));
+	regmap_write(regmap, ISC_CSC_CBR_CBG, 0xFDA | (0xFB6 << 16));
+	regmap_write(regmap, ISC_CSC_CBB_OCB, 0x70 | (0x80 << 16));
+	regmap_write(regmap, ISC_CSC_CRR_CRG, 0x70 | (0xFA2 << 16));
+	regmap_write(regmap, ISC_CSC_CRB_OCR, 0xFEE | (0x80 << 16));
+}
+
 /* Gamma table with gamma 1/2.2 */
 const u32 isc_sama5d2_gamma_table[][GAMMA_ENTRIES] = {
 	/* 0 --> gamma 1/1.8 */
@@ -198,6 +213,8 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->max_width = ISC_SAMA5D2_MAX_SUPPORT_WIDTH;
 	isc->max_height = ISC_SAMA5D2_MAX_SUPPORT_HEIGHT;
 
+	isc->config_csc = isc_sama5d2_config_csc;
+
 	/* sama5d2-isc - 8 bits per beat */
 	isc->dcfg = ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
 
-- 
2.25.1

