Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 537A73543BD
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 17:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241797AbhDEPyx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 11:54:53 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:14644 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235800AbhDEPyw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 11:54:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617638086; x=1649174086;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=98JvnLOs2M6C/Dh71ZzByydfYGYWfmEvEFUTgz5OSTo=;
  b=yxj2+UvLsK64GB3B1VBoU1QyjlErvNPGyO2sCNkxUYLZCChG5XinD69o
   DApk8+1RGM7Yn+JtQpUzmsIRa/Q9v43jvlPdzVNkBgKJp2pAhXuMuVJx0
   VKlxzt3l5l67qBuAj/FdUigtvhCMYao793rNxVxgwnMExVlTvDXF1VadS
   jOCEuz5VGU/KnEhC6Wo5iSEtms+Yx5/zxRUAMFWanygclyeTN6MiXDLx6
   77BHTMta+wxqPFYXqAxB9BfmIEDWv5v50GHAPDV1DUWhH2Jq3ZaTIOmfg
   banSRpDM+EmqfKiX6fDyP87ilvsDKcNMNeh56rf29wck6oUHe84M1iyjR
   g==;
IronPort-SDR: djk3sZ3oFw1RpkI2IZ1jjpyZskfd5lSKh8527jiXa7xJ54xyCmnVasNUxC/x2tSINDn/YbX0+a
 dwFTJfdVbBVeW1f/Yd379OklhE9vwZTB8qEqFBUBiVkscgEHtX6Molw47SfBUZBJ2JUzYUa8Ok
 gJ0QcVbxtKEAGmkC/c3NCPsdpm/70OXFjzWgrNWl8YOCjP4OGiSvErMriBkS8HQDKk+7yu0ev8
 5RbsA3ENakgyXNDyRcxF8R+UhGgTuM4sfW9Eo5gipCBrZfXtEhQnmqpYU9ghdYZH+z6EvfeLLm
 GT4=
X-IronPort-AV: E=Sophos;i="5.81,307,1610434800"; 
   d="scan'208";a="109701051"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2021 08:54:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 08:54:41 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Apr 2021 08:54:23 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 13/30] media: atmel: atmel-isc: add HIS to register offsets
Date:   Mon, 5 Apr 2021 18:50:48 +0300
Message-ID: <20210405155105.162529-14-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405155105.162529-1-eugen.hristev@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
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
index dd3f8e50a8d4..914de4ed63f3 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -238,6 +238,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->offsets.sub422 = ISC_SAMA5D2_SUB422_OFFSET;
 	isc->offsets.sub420 = ISC_SAMA5D2_SUB420_OFFSET;
 	isc->offsets.rlp = ISC_SAMA5D2_RLP_OFFSET;
+	isc->offsets.his = ISC_SAMA5D2_HIS_OFFSET;
 
 	/* sama5d2-isc - 8 bits per beat */
 	isc->dcfg = ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
-- 
2.25.1

