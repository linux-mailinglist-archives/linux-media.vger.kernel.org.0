Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E89A351AF7
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235615AbhDASEA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:04:00 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:65126 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237491AbhDASAI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 14:00:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617300008; x=1648836008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5CAS53/++Li9k7hQhqqVrVX32Fe/I7vzDF5LZE6z+Fw=;
  b=tve5o87hYXhgcATGI3mARhMo3y4t4nZ9vDLe7xSvoAam25EnOVq6lKpL
   1e95fpvXcDLO/W19Xqu69C0jjpMMZKOCy8ojMtCQAmt/CkXIgwmK4AgTN
   JZx32NKN5NTe3aO4KXs1mJ/j5J4DSZ1CF1YmnESgFOQRFHMKV8hRGnywO
   e9agsov45EPn1LjmJetrFr3vuQdByCPFxmYJg14GHX78cDRHHklwKLDKL
   +wPr85gsRwvlKM1FYtgfLjVvhfU8CUJpN2iVdiGgS6ajRXFQzSnttrGBU
   j2fag6cvlYngl2bEtp8DHx7o65d2iX58EbVMfysHNkdNzCBcxbAgtXcrJ
   A==;
IronPort-SDR: TEWygatqKULbCqx2GqeWXPLSHFjDohr7tQEH0FL4I+ISoX/q9wXmwXrcuMA+pjgWprAhc/8ckR
 kAJabgLbicB6zDKEyY+774Xp+zgnQafhFhXxW/CxN7qoynLoO5lNTFEuxZWUrHQcx2PBMQBy9s
 mWXBVwFLPt2XXcHUQjlzmV/tk6wqNDYWl3p3oOw+OGl5rGsBDaiG1Xp1vXMndvAlufFCosVlbs
 HFnBqmSxnSJVV9dOJb87ihvS7JbmsmfjtS5JyEI3sB55MOYFjcFyUhvCuHIYmTph7iGEZiPfgP
 RQ0=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="49670823"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:30:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:30:21 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:30:16 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 10/30] media: atmel: atmel-isc: add CBC to the reg offsets struct
Date:   Thu, 1 Apr 2021 14:27:03 +0300
Message-ID: <20210401112723.189107-11-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401112723.189107-1-eugen.hristev@microchip.com>
References: <20210401112723.189107-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add cbc to the reg offsets struct. This will allow different products
to have a different reg offset for this particular module.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c    | 2 +-
 drivers/media/platform/atmel/atmel-isc-regs.h    | 3 +++
 drivers/media/platform/atmel/atmel-isc.h         | 2 ++
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 7 +++++--
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 446fe232956b..d4bf7fd5929f 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -2310,7 +2310,7 @@ int isc_pipeline_init(struct isc_device *isc)
 		REG_FIELD(ISC_GAM_CTRL, 2, 2),
 		REG_FIELD(ISC_GAM_CTRL, 3, 3),
 		REG_FIELD(ISC_CSC_CTRL + isc->offsets.csc, 0, 0),
-		REG_FIELD(ISC_CBC_CTRL, 0, 0),
+		REG_FIELD(ISC_CBC_CTRL + isc->offsets.cbc, 0, 0),
 		REG_FIELD(ISC_SUB422_CTRL, 0, 0),
 		REG_FIELD(ISC_SUB420_CTRL, 0, 0),
 	};
diff --git a/drivers/media/platform/atmel/atmel-isc-regs.h b/drivers/media/platform/atmel/atmel-isc-regs.h
index 5a65600c5f88..a5e2fe01ba9f 100644
--- a/drivers/media/platform/atmel/atmel-isc-regs.h
+++ b/drivers/media/platform/atmel/atmel-isc-regs.h
@@ -177,6 +177,9 @@
 /* Color Space Conversion CRB OCR Register */
 #define ISC_CSC_CRB_OCR	0x000003b0
 
+/* Offset for CBC register specific to sama5d2 product */
+#define ISC_SAMA5D2_CBC_OFFSET	0
+
 /* Contrast And Brightness Control Register */
 #define ISC_CBC_CTRL    0x000003b4
 
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index cb47932197b1..b1fe93c93c61 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -147,9 +147,11 @@ struct isc_ctrls {
 /*
  * struct isc_reg_offsets - ISC device register offsets
  * @csc:		Offset for the CSC register
+ * @cbc:		Offset for the CBC register
  */
 struct isc_reg_offsets {
 	u32 csc;
+	u32 cbc;
 };
 
 /*
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index 36bf15a9607d..275999314e61 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -77,8 +77,10 @@ void isc_sama5d2_config_cbc(struct isc_device *isc)
 {
 	struct regmap *regmap = isc->regmap;
 
-	regmap_write(regmap, ISC_CBC_BRIGHT, isc->ctrls.brightness);
-	regmap_write(regmap, ISC_CBC_CONTRAST, isc->ctrls.contrast);
+	regmap_write(regmap, ISC_CBC_BRIGHT + isc->offsets.cbc,
+		     isc->ctrls.brightness);
+	regmap_write(regmap, ISC_CBC_CONTRAST + isc->offsets.cbc,
+		     isc->ctrls.contrast);
 }
 
 /* Gamma table with gamma 1/2.2 */
@@ -229,6 +231,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->config_cbc = isc_sama5d2_config_cbc;
 
 	isc->offsets.csc = ISC_SAMA5D2_CSC_OFFSET;
+	isc->offsets.cbc = ISC_SAMA5D2_CBC_OFFSET;
 
 	/* sama5d2-isc - 8 bits per beat */
 	isc->dcfg = ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
-- 
2.25.1

