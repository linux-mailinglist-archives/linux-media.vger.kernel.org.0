Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C71B35DD2E
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344884AbhDMLCt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:02:49 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:24175 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344853AbhDMLCY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311724; x=1649847724;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Nz2K1lpqGeTsaJJ5/JbHz6dYZwbhFbuGCzjN9yCEQnw=;
  b=19gGGBV+PhSG28/4jBzVVMnS2CNxAWih/ibn6U+SlT5CwqHvQ0Lc93TO
   BuDB4axhbOnFmqC05Do9bFOTv8V5bvIdvgfZ3aupaO22u+MTo5Pg09JNf
   f1jy3ClxhxwQ0Oq3tkhW1l1HaZ76HpDMbdkT8zCQoumuOoHfuOJtaJ2gt
   VUNMR/4S/Qg3uX47Kn1j3X08WEA+3+Pj/V1L3AsMdMUA1UpDE05kEsp6+
   EGEFbYsjzBCQ+V7uivgpkp/W8VqH7hGurEWkXbujtSvebDHK/JkdT4sQB
   KGIg0zI6UZzNpu8wdNSzjulD62t44+joI+/H5lJ/+k+APO2R9zBzPv26B
   g==;
IronPort-SDR: EPuOzF0yQ2YYc27r1O6hfq0/Wfo//ETyH1taHodGr1n1g9qHVGpM6GdK6frFF+Ng0binB08XNO
 4TfRNI6lC9IP5PfVdwFoxbMQL5Bq6p/bMiHzIym7ToP1OpQHHJbh+vmSe40VNfcnW+ZNJYd1n7
 M7qjZduV1p23/h/kbvZXsDauwg409bQWUg8X0d5Bi1nfy3ARdfHzPEvBvXVZr+crVakEpNC7EX
 +OKsiopxvopOxWVHZr0OYkAlAd9HUQgynDWoNVKq7gSFozNoks3D/6EnmEVa2/cEchqBx29STk
 0sY=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="110611976"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 04:02:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 04:02:04 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 04:02:00 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 15/33] media: atmel: atmel-isc: add support for version register
Date:   Tue, 13 Apr 2021 13:57:13 +0300
Message-ID: <20210413105731.610028-16-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-1-eugen.hristev@microchip.com>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for version register and print it at probe time.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-regs.h    | 5 +++++
 drivers/media/platform/atmel/atmel-isc.h         | 2 ++
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 5 +++++
 3 files changed, 12 insertions(+)

diff --git a/drivers/media/platform/atmel/atmel-isc-regs.h b/drivers/media/platform/atmel/atmel-isc-regs.h
index 4940998c82a2..344668dcfcf4 100644
--- a/drivers/media/platform/atmel/atmel-isc-regs.h
+++ b/drivers/media/platform/atmel/atmel-isc-regs.h
@@ -295,6 +295,11 @@
 /* DMA Address 2 Register */
 #define ISC_DAD2        0x000003fc
 
+/* Offset for version register specific to sama5d2 product */
+#define ISC_SAMA5D2_VERSION_OFFSET	0
+/* Version Register */
+#define ISC_VERSION	0x0000040c
+
 /* Histogram Entry */
 #define ISC_HIS_ENTRY	0x00000410
 
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index 52a9199d65ee..676a5be1ee8c 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -153,6 +153,7 @@ struct isc_ctrls {
  * @rlp:		Offset for the RLP register
  * @his:		Offset for the HIS related registers
  * @dma:		Offset for the DMA related registers
+ * @version:		Offset for the version register
  */
 struct isc_reg_offsets {
 	u32 csc;
@@ -162,6 +163,7 @@ struct isc_reg_offsets {
 	u32 rlp;
 	u32 his;
 	u32 dma;
+	u32 version;
 };
 
 /*
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index 12f56a71db40..10b70d4b04c4 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -192,6 +192,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	struct isc_subdev_entity *subdev_entity;
 	int irq;
 	int ret;
+	u32 ver;
 
 	isc = devm_kzalloc(dev, sizeof(*isc), GFP_KERNEL);
 	if (!isc)
@@ -240,6 +241,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->offsets.rlp = ISC_SAMA5D2_RLP_OFFSET;
 	isc->offsets.his = ISC_SAMA5D2_HIS_OFFSET;
 	isc->offsets.dma = ISC_SAMA5D2_DMA_OFFSET;
+	isc->offsets.version = ISC_SAMA5D2_VERSION_OFFSET;
 
 	/* sama5d2-isc - 8 bits per beat */
 	isc->dcfg = ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
@@ -335,6 +337,9 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	pm_request_idle(dev);
 
+	regmap_read(isc->regmap, ISC_VERSION + isc->offsets.version, &ver);
+	dev_info(dev, "Microchip ISC version %x\n", ver);
+
 	return 0;
 
 cleanup_subdev:
-- 
2.25.1

