Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7400535DD1E
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238847AbhDMLBj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:01:39 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:17042 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237049AbhDMLBg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:01:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311676; x=1649847676;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xujB/V0ANsjaS23XCfBGiQcBwh4C7oLpXBibigw9X1M=;
  b=17HA5Ob/PhoZnLlEErn92DECaXJ0xdnyjKmnznYzLkAmA4peGdHXeiUW
   TpFJqGGYkPDrwsqR/jD2O5ODaWWm5XKNsbFlg99BzaApMapb+xJYJ+W9N
   3/2rsC66IWooFgy/PuYmpvRSKXUWIHv3s9TKwc/PHoYw2m56PuZd9ROmR
   oLoXSjU/+LWStoUpGL92UWfJ4VDo3KOHA/PbSfE31mpJkS4Hv7qzEfWCf
   7Nu2km7G76n+pGWUnmZrbTUQPRKGnzj7IAG+vEUIvX+O4zpytXYiqG6JB
   ZXm5YnZikDuQib2+EfrSwZfaXWb2pvieexzB6zcRo0H9rR05rp8KKGtnF
   Q==;
IronPort-SDR: 0FnAOMBR/clBXkwwL+nVdTfE51fLHDnPcBSUMbetTOSbNgnymgG/OTkmLX+LGz9QU69pq9zypQ
 0HJHVhEhGoYBSti1jqzF9+FJGGcEFj7xsNl44VWZK8mHwJxkKrKVuDggsoRS8wsHy5s9NxQa94
 iyhqAxGo/2TgVI0M6s664eGS8ll1L7BtVgL9A1iyVkAh4D/0idUCaJa+CPGGjLXULA7nA3IFwT
 lFAejY4qXgdWnI+pb41Ih8y74zdMRZuL63U49diZ7Gpmg7Mt4bT6Dq3XB40IMHDV4pqNdcsE6y
 Mxg=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="116804161"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 04:01:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 04:01:16 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 04:01:05 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 10/33] media: atmel: atmel-isc: add CBC to the reg offsets struct
Date:   Tue, 13 Apr 2021 13:57:08 +0300
Message-ID: <20210413105731.610028-11-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-1-eugen.hristev@microchip.com>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CBC submodule is a part of the atmel-isc pipeline, and stands for
Contrast Brightness Control. It is used to apply gains and offsets to the
luma (Y) and chroma (U, V) components of the YUV elements.
Add cbc to the reg offsets struct. This will allow different products
to have a different reg offset for this particular module.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v3:
- add module explanation in commit message

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
index 66b92fa1c752..c3037244e01e 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -80,8 +80,10 @@ void isc_sama5d2_config_cbc(struct isc_device *isc)
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
@@ -232,6 +234,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->config_cbc = isc_sama5d2_config_cbc;
 
 	isc->offsets.csc = ISC_SAMA5D2_CSC_OFFSET;
+	isc->offsets.cbc = ISC_SAMA5D2_CBC_OFFSET;
 
 	/* sama5d2-isc - 8 bits per beat */
 	isc->dcfg = ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
-- 
2.25.1

