Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4890335DD25
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344669AbhDMLCI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:02:08 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:24143 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236494AbhDMLCC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311703; x=1649847703;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mWUF5WO+LMK2zinnvrhdZoL9RLmN49w72UCDrsLSB14=;
  b=DfWxmzCIQP8j5Y+mikpDSLt7i35votbez+wtFNy7x2JsKCn7FcbhFupk
   wDps4giwMfUsbopL12dkLtxXkEwV8pgGqXqFu0toBkpuZNT7HLQQHJbEe
   tWqGa/Ylt8q1Kh71Rh0bed3c5mQsy63uqlLnkUPolHvwe14D27jcMPL5M
   bmxN/nHhUtyi/WwoxtE6VeT0xZBim14VS/WSkfcFdKVl5EUyY/h02da1s
   /osz6nJSHMre6k1ZabpSwaESiWCEHAjKhT8P56yVG7CIvATrEyw8MgGo8
   ab4udnEZI4KzLlnXawcltLg5uLcPbGZqjVJnFuGqWz9wUaMedfIH/6aiw
   Q==;
IronPort-SDR: 66XRoqAIivml1EHE8Ye8EGHwXxdmrn+ipueOlTrVTc37gKHn3FZOEcbeyX9tJaqaKWakHLhmGR
 ekNaOJqcjRhk9Uka2a17ElVsOnPYZ9c0tPYYv/fjcXX5pB2Ptohveo36KCTxJIV1X+spZR/xJ3
 TEFWWrVew9RxvJkUww2bxstoHum4zSc92Qi874IyG5ic/bfGfx4GVCusQdXgEdN/M62Tw5rTgM
 wiL3z3PBfyEZ+gL/t3KSpwVJHDJD6Z5hMj/VdX7kiC0mfEnOIn7Q0tsb8nsmpmmsUrMMbR/0zh
 s5o=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="110611909"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 04:01:41 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 04:01:29 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 04:01:23 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 12/33] media: atmel: atmel-isc: add RLP to register offsets
Date:   Tue, 13 Apr 2021 13:57:10 +0300
Message-ID: <20210413105731.610028-13-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-1-eugen.hristev@microchip.com>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The RLP submodule is a part of the atmel-isc pipeline, and stands for
Rounding,Limiting and Packaging. It used to extract specific data from the
ISC pipeline. For example if we want to output greyscale 8 bit, we would
use limiting to 8 bits, and packaging to Luma component only.
Add rlp to the reg offsets struct.
This will allow different products to have a different reg offset for this
particular module.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v3:
- add module description in commit message

 drivers/media/platform/atmel/atmel-isc-base.c    | 4 ++--
 drivers/media/platform/atmel/atmel-isc-regs.h    | 2 ++
 drivers/media/platform/atmel/atmel-isc.h         | 2 ++
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 1 +
 4 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index b2067d75499b..317172959370 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -718,8 +718,8 @@ static int isc_configure(struct isc_device *isc)
 
 	regmap_update_bits(regmap, ISC_PFE_CFG0, mask, pfe_cfg0);
 
-	regmap_update_bits(regmap, ISC_RLP_CFG, ISC_RLP_CFG_MODE_MASK,
-			   rlp_mode);
+	regmap_update_bits(regmap, ISC_RLP_CFG + isc->offsets.rlp,
+			   ISC_RLP_CFG_MODE_MASK, rlp_mode);
 
 	regmap_write(regmap, ISC_DCFG, dcfg);
 
diff --git a/drivers/media/platform/atmel/atmel-isc-regs.h b/drivers/media/platform/atmel/atmel-isc-regs.h
index 04839def6ef6..2205484e04fc 100644
--- a/drivers/media/platform/atmel/atmel-isc-regs.h
+++ b/drivers/media/platform/atmel/atmel-isc-regs.h
@@ -204,6 +204,8 @@
 /* Subsampling 4:2:2 to 4:2:0 Control Register */
 #define ISC_SUB420_CTRL 0x000003cc
 
+/* Offset for RLP register specific to sama5d2 product */
+#define ISC_SAMA5D2_RLP_OFFSET	0
 /* Rounding, Limiting and Packing Configuration Register */
 #define ISC_RLP_CFG     0x000003d0
 
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index fb7257872e7c..b7d4e7fab570 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -150,12 +150,14 @@ struct isc_ctrls {
  * @cbc:		Offset for the CBC register
  * @sub422:		Offset for the SUB422 register
  * @sub420:		Offset for the SUB420 register
+ * @rlp:		Offset for the RLP register
  */
 struct isc_reg_offsets {
 	u32 csc;
 	u32 cbc;
 	u32 sub422;
 	u32 sub420;
+	u32 rlp;
 };
 
 /*
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index 943793fbc791..dd3f8e50a8d4 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -237,6 +237,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->offsets.cbc = ISC_SAMA5D2_CBC_OFFSET;
 	isc->offsets.sub422 = ISC_SAMA5D2_SUB422_OFFSET;
 	isc->offsets.sub420 = ISC_SAMA5D2_SUB420_OFFSET;
+	isc->offsets.rlp = ISC_SAMA5D2_RLP_OFFSET;
 
 	/* sama5d2-isc - 8 bits per beat */
 	isc->dcfg = ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
-- 
2.25.1

