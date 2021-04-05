Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 667693543B2
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 17:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241806AbhDEPyO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 11:54:14 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:14576 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236161AbhDEPyG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 11:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617638040; x=1649174040;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qixaoOoS6G5y4Lp/2bypowj426ioyHUaH1KSheoHqaY=;
  b=KOxEBgf9V4TghI5RmiTQf7bjcW+qAy7EuauQW+Nel1FefV/GyBwN32IR
   R14GIu0CmTUNL9BgeuPiJBWhYvH5c5XSpe9/NpZSpRhTjmBZc5c+QCJXi
   UQ3CAvkHIyxnkg68+tLTx500Au/7tN3VZgI1zJgF/SKDQxLv0sr9+8j0e
   aeAZAtkK3kAwinwkn2By82NT3YMI24IEY6Qq0SBePIS8w2P4AbGspqvLk
   sHieNaW9PBA2VTC1VPuupEEsFWu07VYhHpOJ1zrz03PDqsW6Z3lIofiHo
   wQ/TX1Cibj2m4XD766+laAOegdJl0OKinbjUD7aeV5WOdzVeTajHofVuq
   Q==;
IronPort-SDR: O3B3V0/4Q5NJjy2DLKnUxXEZI7OrcMfoBvlfy+9EG8T94sBwa1Bb9bjYK7SYVKDwetHlCrrFC8
 uCV0dBT4J0twwCDsbPAS5dRsSlI8rl1ySxZDdNuRMX7460u6NFcZbH3DmdBAPsjhZ+icRDcnfg
 E8yU6uU95HrKsCHji74zcIWV4/ekMG7EJ15i/Ue7IDPtFM1iY5XB7xck85SsO88GxT8N3p96aT
 mqQyuHTE6glnCDbhIoOsSlNesPrB7smaa4Y9iQDKchAdvXY/VUmqhGCa3N9zHVKhWXBBkJXrZ6
 V4k=
X-IronPort-AV: E=Sophos;i="5.81,307,1610434800"; 
   d="scan'208";a="109700919"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2021 08:53:59 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 08:53:59 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Apr 2021 08:53:52 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 10/30] media: atmel: atmel-isc: add CBC to the reg offsets struct
Date:   Mon, 5 Apr 2021 18:50:45 +0300
Message-ID: <20210405155105.162529-11-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405155105.162529-1-eugen.hristev@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
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

