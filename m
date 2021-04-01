Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50435351B8A
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237861AbhDASIz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:08:55 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:44187 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237776AbhDASEY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 14:04:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617300265; x=1648836265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cV7pIY+3sDQXdVwlrzAphNU2hs+f8yThuBN6ce6+z0o=;
  b=ClitHeteAvlwnJKHxydInBonhn66It6h6AAN7ivN8vpfJnzQ3+cL6t4K
   nDrEiR7Jp7d3VP8XL5y9wDaziir/er5mtS+2TpVOCCHwL29zsJd/l26g/
   N66f8Bom9QQpr4GdTcuWJSafN9fUsdnXt5sG0UadKWWd2LLJ4aCmJ7l2O
   E4qaBbZ6a4DWN6MpkBZzEXk7FXbNZTYdHspCAAh258bYuiMcg7E95MJei
   4zfepol8xcf/GQk0IfaJSqXXnRN3aVWfTeRDyUCz3yLxeefn9x+2J7Cad
   tG8yau4V/qc4mabxqltXn9HhXpk9C5yOnkLZsts0mp7A2EnayXO8rs6Wd
   g==;
IronPort-SDR: opE8pjPQjyD/WifVyxrUAyEkCTEsAbOlD1H3TIxzGmckIlNSTNZL0EdrgXj5YMn5kXbrMUw7WB
 8a4lqUV97kh4Xf+oHo/II29jrl6q9xOaIVUYY1hXM0OWeqS1yHH7H5SlIFINj8ugME9f3ifVwx
 Z74RVUqfrAiCD4QO50N3zJJuyGa/sHmMDU51/yHoxdCDdAcFrQ0uE97PsxHqJuO3yG6gsnFBey
 4Ax4o7fpQkxniOsAyKLpaF00/lRMEJc7t9JsZiM+D4dmTbKWlOQvuOXTbbBYSVgyuHRfgCxr+J
 DYw=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="112132544"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:30:51 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:30:50 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:30:39 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 13/30] media: atmel: atmel-isc: add HIS to register offsets
Date:   Thu, 1 Apr 2021 14:27:06 +0300
Message-ID: <20210401112723.189107-14-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401112723.189107-1-eugen.hristev@microchip.com>
References: <20210401112723.189107-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add his to the reg offsets struct.
This will allow different products to have a different reg offset for this
particular module.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c    | 11 +++++++----
 drivers/media/platform/atmel/atmel-isc-regs.h    |  2 ++
 drivers/media/platform/atmel/atmel-isc.h         |  2 ++
 drivers/media/platform/atmel/atmel-sama5d2-isc.c |  1 +
 4 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 317172959370..aa7a9a7ca0e6 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -678,12 +678,13 @@ static void isc_set_histogram(struct isc_device *isc, bool enable)
 	struct isc_ctrls *ctrls = &isc->ctrls;
 
 	if (enable) {
-		regmap_write(regmap, ISC_HIS_CFG,
+		regmap_write(regmap, ISC_HIS_CFG + isc->offsets.his,
 			     ISC_HIS_CFG_MODE_GR |
 			     (isc->config.sd_format->cfa_baycfg
 					<< ISC_HIS_CFG_BAYSEL_SHIFT) |
 					ISC_HIS_CFG_RAR);
-		regmap_write(regmap, ISC_HIS_CTRL, ISC_HIS_CTRL_EN);
+		regmap_write(regmap, ISC_HIS_CTRL + isc->offsets.his,
+			     ISC_HIS_CTRL_EN);
 		regmap_write(regmap, ISC_INTEN, ISC_INT_HISDONE);
 		ctrls->hist_id = ISC_HIS_CFG_MODE_GR;
 		isc_update_profile(isc);
@@ -692,7 +693,8 @@ static void isc_set_histogram(struct isc_device *isc, bool enable)
 		ctrls->hist_stat = HIST_ENABLED;
 	} else {
 		regmap_write(regmap, ISC_INTDIS, ISC_INT_HISDONE);
-		regmap_write(regmap, ISC_HIS_CTRL, ISC_HIS_CTRL_DIS);
+		regmap_write(regmap, ISC_HIS_CTRL + isc->offsets.his,
+			     ISC_HIS_CTRL_DIS);
 
 		ctrls->hist_stat = HIST_DISABLED;
 	}
@@ -1821,7 +1823,8 @@ static void isc_awb_work(struct work_struct *w)
 			ctrls->awb = ISC_WB_NONE;
 		}
 	}
-	regmap_write(regmap, ISC_HIS_CFG, hist_id | baysel | ISC_HIS_CFG_RAR);
+	regmap_write(regmap, ISC_HIS_CFG + isc->offsets.his,
+		     hist_id | baysel | ISC_HIS_CFG_RAR);
 	isc_update_profile(isc);
 	/* if awb has been disabled, we don't need to start another histogram */
 	if (ctrls->awb)
diff --git a/drivers/media/platform/atmel/atmel-isc-regs.h b/drivers/media/platform/atmel/atmel-isc-regs.h
index 2205484e04fc..0ab280ab59ec 100644
--- a/drivers/media/platform/atmel/atmel-isc-regs.h
+++ b/drivers/media/platform/atmel/atmel-isc-regs.h
@@ -224,6 +224,8 @@
 #define ISC_RLP_CFG_MODE_YYCC_LIMITED   0xc
 #define ISC_RLP_CFG_MODE_MASK           GENMASK(3, 0)
 
+/* Offset for HIS register specific to sama5d2 product */
+#define ISC_SAMA5D2_HIS_OFFSET	0
 /* Histogram Control Register */
 #define ISC_HIS_CTRL	0x000003d4
 
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index b7d4e7fab570..652285dc9f52 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -151,6 +151,7 @@ struct isc_ctrls {
  * @sub422:		Offset for the SUB422 register
  * @sub420:		Offset for the SUB420 register
  * @rlp:		Offset for the RLP register
+ * @his:		Offset for the HIS related registers
  */
 struct isc_reg_offsets {
 	u32 csc;
@@ -158,6 +159,7 @@ struct isc_reg_offsets {
 	u32 sub422;
 	u32 sub420;
 	u32 rlp;
+	u32 his;
 };
 
 /*
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index 32c05eb1c16d..886dea8b7b1c 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -235,6 +235,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->offsets.sub422 = ISC_SAMA5D2_SUB422_OFFSET;
 	isc->offsets.sub420 = ISC_SAMA5D2_SUB420_OFFSET;
 	isc->offsets.rlp = ISC_SAMA5D2_RLP_OFFSET;
+	isc->offsets.his = ISC_SAMA5D2_HIS_OFFSET;
 
 	/* sama5d2-isc - 8 bits per beat */
 	isc->dcfg = ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
-- 
2.25.1

