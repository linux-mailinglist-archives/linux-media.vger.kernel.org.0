Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 183BF35DD39
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344972AbhDMLDH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:03:07 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:24226 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344922AbhDMLC7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:02:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311760; x=1649847760;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+ci3BxOvgqOJkzLlshiYqigPnpc/QcaJhMcnuW3svJs=;
  b=jyv590TY0Pw7CKD66UvDZVYSJ9NFrt3c+PoRD7FBpmEFvNESss4GBgBo
   ELVKbI2N/VzjNfSEaIL5Gn84BIK8QqqxJnDYxRLvNk6svlE5wv3HZafXp
   AKgAu2Xs07wc05NTfgr0la+WovDnJeANF+hR0ajLWKf9gz80/csnZJs3q
   3rRZwkrDSIbcRLxna0YUcVbFybXKmP+wSNNVqURTv7J6l7METgHYyDjNt
   PsUhbbrTQdi/Y/Qn6AoxxB5ytyaD15QfZSMOwOGt9+qVlOVwkJckcQNNv
   gy8TvbYrfIUMp4Sz/jpNI9f8Wme/j9fcyWC1HrH7ywfy7rueZI2nUn7qh
   Q==;
IronPort-SDR: exVtRFyQKFzY0Zbtpy+5qWmJYpYRkn68WNne2TIeReBWFXmfGjPa+ZTIgW574Xtgt1K9nTbPBH
 1/qXMiGSTa8Ii2DvRtkOSYWFrEZ5WS44p9MV7pVcjg/bn64a+0NGezaDyvzHkL+79dO87a6Gxr
 J3nrHOsgGSO1HSOzwgPF0RUGT6APALna6Xz0akWmxlDsYBJRQvnWEahuDctHWH8A6SUMubfOAV
 zwB2WmnIvlgu8sC4R1e+JHV4S2UQsyXB8P7bGsrhMa5oPWivvhrjaAdpf/2e/H06PqITV54yZL
 iPs=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="110612093"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 04:02:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 04:02:39 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 04:02:28 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 19/33] media: atmel: atmel-isc: add CC initialization function
Date:   Tue, 13 Apr 2021 13:57:17 +0300
Message-ID: <20210413105731.610028-20-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-1-eugen.hristev@microchip.com>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CC submodule is a part of the atmel-isc pipeline, and stands for
Color Correction. It is used to apply gains and offsets to the
chroma (U, V) components of the YUV elements.
Implement the CC submodule initialization, as a product
specific function, which currently configures the neutral point in color
correction.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v3:
- added module description in commit message
Changes in v2:
- addded function prototype to avoid warning with W=1

 drivers/media/platform/atmel/atmel-isc-base.c    |  1 +
 drivers/media/platform/atmel/atmel-isc.h         |  3 +++
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 15 +++++++++++++++
 3 files changed, 19 insertions(+)

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
index 0ff13198d732..0ce8293622f9 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -56,6 +56,7 @@
 
 void isc_sama5d2_config_csc(struct isc_device *isc);
 void isc_sama5d2_config_cbc(struct isc_device *isc);
+void isc_sama5d2_config_cc(struct isc_device *isc);
 
 void isc_sama5d2_config_csc(struct isc_device *isc)
 {
@@ -86,6 +87,19 @@ void isc_sama5d2_config_cbc(struct isc_device *isc)
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
@@ -233,6 +247,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 
 	isc->config_csc = isc_sama5d2_config_csc;
 	isc->config_cbc = isc_sama5d2_config_cbc;
+	isc->config_cc = isc_sama5d2_config_cc;
 
 	isc->offsets.csc = ISC_SAMA5D2_CSC_OFFSET;
 	isc->offsets.cbc = ISC_SAMA5D2_CBC_OFFSET;
-- 
2.25.1

