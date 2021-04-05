Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2EBA3543C4
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 17:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236488AbhDEPzN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 11:55:13 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:36396 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236340AbhDEPzN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 11:55:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617638107; x=1649174107;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Nz2K1lpqGeTsaJJ5/JbHz6dYZwbhFbuGCzjN9yCEQnw=;
  b=mQnoVJ9fmU6xFPgKha8T4WrdbUPOvZ0SR/NQJrqz6IXjaUc7KvowA0fN
   m0XoTlR8NAha3yALutpJEPmXwRePIqgA5W9CDyVmkFmjLmk8ogFZu+mat
   uw/FkmMAaB3qTBibkPolXD4lOZA7XFs6SAj79W8VRmgDHB7DCFjIIlZ5x
   w1HbwYRT6Yp4lduUx07JOZakjDnHm40t6LhERxZmsXv86xqTFNi+j4uar
   FftFgFtW2zJq+LlybzobTsVGJ9oxe4BiacyOHjHaqOLZmuxpI+RbYX4y0
   kxOUcrWcMRHQeyDDGaFmVcxslC0mi8IR27eSET4n4IO8UpqvQAbo2mfZ+
   w==;
IronPort-SDR: gEoKe1vpx2KJCkDQsR5frC7IZKfbofg9dJFJoo16dtVGCriwdZBk9+PzU/84lF5YwZSB2Lh7mE
 o13cV397Xdpf1k2YNJFFBJifiiWX9LMvBJR7SmY1SeAmPZKgjpF5b5bsgCLi2/9d7hVQy3BsH+
 BfG8SnjeEhdUcAtacOt7fMXSAvvwwaODD1uV5s0xFYmJO80hXb3yYrcj+TIYJgs2ePeJi47AQb
 Y9dpEVCNYfKSrY1r2wiOE8MP7Bb62y2szX1yfSrQkf2mANOQ2H4esQ83LIQdsqcGK3Bfpzev1H
 r3I=
X-IronPort-AV: E=Sophos;i="5.81,307,1610434800"; 
   d="scan'208";a="112481795"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2021 08:55:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 08:55:06 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Apr 2021 08:54:58 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 15/30] media: atmel: atmel-isc: add support for version register
Date:   Mon, 5 Apr 2021 18:50:50 +0300
Message-ID: <20210405155105.162529-16-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405155105.162529-1-eugen.hristev@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
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

