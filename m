Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69AF0351A46
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235625AbhDAR6x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 13:58:53 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:19898 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236019AbhDAR4S (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 13:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617299778; x=1648835778;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BqgkVlx1wDp81RVlVAWD1R2MET36e/zdD/q1Q3pa2Q8=;
  b=15wxNN/OWoj/Vw75Ff+M8EWwbnrW+Kn0ERGEFQywLRYeFCwz5nQF/Xth
   2RY8pm9mZRu6k8l3BcCGSygerhT4v/Rg2Srcj6NklFxX4uv+AWPB5PkC6
   TH7zMfK83u5G6LWQxmvwA8vR5R8ENJl3j/ZSMVFqnWdR5f9mIB8cVLZmm
   Vr1O2PfGK461watd0pQ1itrimfheymi7J7rnhwuyoJyCKgr6mWI3BI3s4
   9QIJT/blii/rFdK7FYhoVHlhQ3Gy6dF7UuwX2wW6mvqp3dSOinqYHldpg
   J/Io17sbgGGA+jHBcX8C/CktYwWmSmTliZWoLH+l5gMdTCMLUog43VQXs
   g==;
IronPort-SDR: YoXY73OsGRQmf/DhN558yxVBXQevyaWCEVCmzF+TO7fCU1h9tvQmc05TgvDUsgDT16B6Aq+Z7r
 R/Vu8BDxPrN6QYnJqn4n0odsjqJ18L5DcwxJlqVb/DXy1jdlSLrUGrK4NQByW/g+haBn4FvprS
 yNjUg8ND8no8vMvDBxYZGKJlVcP/2TP7KlDkGkOzKmK7waWXJeKzT2W6i7++efMjESlC23S5sl
 dJ5OpTWv4xzT0EgeDQ5H5+Y0KD2GJpnNyssDKIvo9nUozzvV+Om6Q6Mgdbq4l1Zd0nCGavYLyr
 N1I=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="109338577"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:31:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:31:19 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:31:03 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 15/30] media: atmel: atmel-isc: add support for version register
Date:   Thu, 1 Apr 2021 14:27:08 +0300
Message-ID: <20210401112723.189107-16-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401112723.189107-1-eugen.hristev@microchip.com>
References: <20210401112723.189107-1-eugen.hristev@microchip.com>
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
index f583288f0503..500618240fc2 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -189,6 +189,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	struct isc_subdev_entity *subdev_entity;
 	int irq;
 	int ret;
+	u32 ver;
 
 	isc = devm_kzalloc(dev, sizeof(*isc), GFP_KERNEL);
 	if (!isc)
@@ -237,6 +238,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->offsets.rlp = ISC_SAMA5D2_RLP_OFFSET;
 	isc->offsets.his = ISC_SAMA5D2_HIS_OFFSET;
 	isc->offsets.dma = ISC_SAMA5D2_DMA_OFFSET;
+	isc->offsets.version = ISC_SAMA5D2_VERSION_OFFSET;
 
 	/* sama5d2-isc - 8 bits per beat */
 	isc->dcfg = ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
@@ -332,6 +334,9 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	pm_request_idle(dev);
 
+	regmap_read(isc->regmap, ISC_VERSION + isc->offsets.version, &ver);
+	dev_info(dev, "Microchip ISC version %x\n", ver);
+
 	return 0;
 
 cleanup_subdev:
-- 
2.25.1

