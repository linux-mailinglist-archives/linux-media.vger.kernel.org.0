Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3882B351A83
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235536AbhDASBq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:01:46 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:19898 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236628AbhDAR6T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 13:58:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617299900; x=1648835900;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MFJmyfx6WKWCPMiE879BubSdjCxUsUZViec4erdNPGQ=;
  b=ZCM1d8tomC0trSLdukUfj99852fBkTsnqbY+U8yvdlks3on13lqq+EZj
   tavoVwRLpgg8+BvXZheoFk11zsR49E+E98DET80EFfeY4yx2zku1s73tL
   OyBUngzkYtOnjNCl8pItTP+zU38vVZ2QtXV92nDrxDucYX02D9XCQZvWn
   ncLlb4OdaGePehY1hyqyrfMWz+xmPKuup+zFQQKhIeccgEAXLLU9ZLv5X
   X1eukWuCRKEAN9jmNHaa09wTjbYKdDnimi5x5jpawrTtZmOJqPm2Eqoj6
   imzyqavc2kEMAfN6db62jj6wBQSUJJhV5hz9Ripd7AjWNgkiFHzPChyhe
   g==;
IronPort-SDR: pi3R2LS2JZK4aOl4ooAisLWKTf2pUMyK1YD+tNiv/502EFOW8QiEd33iNnV8Ed/VqQ7bTglTXv
 pdlsGCzFwpQzhvB9pnRExVxQoV6IM6Aqibh0sNXpw0ulYaVkxVtyJEmhj+QqnVl0CdxYXYVHeA
 2U9JIpBtkFsA4sMf08UHiu0v8o5acBBJcXca5M+dV16XEQSJr9RXcFjz64x42k+UK/DeOFP8eh
 mmJagZyIXPGaqxwZ04ooXywVmHhzsd6KxywOmKEI6bcERolw5y5WmarnQkUlciXOgSTvqt8XC1
 8G0=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="109338642"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:31:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:31:45 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:31:19 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 16/30] media: atmel: atmel-isc: add his_entry to register offsets
Date:   Thu, 1 Apr 2021 14:27:09 +0300
Message-ID: <20210401112723.189107-17-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401112723.189107-1-eugen.hristev@microchip.com>
References: <20210401112723.189107-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add his_entry to the reg offsets struct.
This will allow different products to have a different reg offset for this
particular module.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c    | 3 ++-
 drivers/media/platform/atmel/atmel-isc-regs.h    | 2 ++
 drivers/media/platform/atmel/atmel-isc.h         | 2 ++
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 1 +
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 11121943d2cb..2a619eef6aa3 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -1672,7 +1672,8 @@ static void isc_hist_count(struct isc_device *isc, u32 *min, u32 *max)
 	*min = 0;
 	*max = HIST_ENTRIES;
 
-	regmap_bulk_read(regmap, ISC_HIS_ENTRY, hist_entry, HIST_ENTRIES);
+	regmap_bulk_read(regmap, ISC_HIS_ENTRY + isc->offsets.his_entry,
+			 hist_entry, HIST_ENTRIES);
 
 	*hist_count = 0;
 	/*
diff --git a/drivers/media/platform/atmel/atmel-isc-regs.h b/drivers/media/platform/atmel/atmel-isc-regs.h
index 344668dcfcf4..a15c13e1a833 100644
--- a/drivers/media/platform/atmel/atmel-isc-regs.h
+++ b/drivers/media/platform/atmel/atmel-isc-regs.h
@@ -300,6 +300,8 @@
 /* Version Register */
 #define ISC_VERSION	0x0000040c
 
+/* Offset for version register specific to sama5d2 product */
+#define ISC_SAMA5D2_HIS_ENTRY_OFFSET	0
 /* Histogram Entry */
 #define ISC_HIS_ENTRY	0x00000410
 
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index 676a5be1ee8c..c5d956fd20a0 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -154,6 +154,7 @@ struct isc_ctrls {
  * @his:		Offset for the HIS related registers
  * @dma:		Offset for the DMA related registers
  * @version:		Offset for the version register
+ * @his_entry:		Offset for the HIS entries registers
  */
 struct isc_reg_offsets {
 	u32 csc;
@@ -164,6 +165,7 @@ struct isc_reg_offsets {
 	u32 his;
 	u32 dma;
 	u32 version;
+	u32 his_entry;
 };
 
 /*
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index 500618240fc2..da516f2f5ca9 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -239,6 +239,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->offsets.his = ISC_SAMA5D2_HIS_OFFSET;
 	isc->offsets.dma = ISC_SAMA5D2_DMA_OFFSET;
 	isc->offsets.version = ISC_SAMA5D2_VERSION_OFFSET;
+	isc->offsets.his_entry = ISC_SAMA5D2_HIS_ENTRY_OFFSET;
 
 	/* sama5d2-isc - 8 bits per beat */
 	isc->dcfg = ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
-- 
2.25.1

