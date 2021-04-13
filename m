Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7CD235DD2F
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344812AbhDMLCu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:02:50 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:55046 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344857AbhDMLCY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311725; x=1649847725;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dwHh2lgmIFwmRuCUVIBOI8xHG4JWuUO2ua0AhzXB+fw=;
  b=CqNCKbFDya+DcXaPQkBoqf4i8K+SNvjWSdMw4WQ23zXgDlELTRwjS9Pc
   3Z9X6axb7dyQCG2Q4ei7/pw34eRznBjE5hvj4SB2jZxVR2dm/MUpsWaMa
   0/xDAfyXGuKxr+J4erlbC80mVWG5+s214/XEvbHbr4z4ed8hBgP8s+08i
   DZ6w9KWQ10pDwB24xW3Q7lACvRkX/6MO7hhniDWjou3bDulEXNfUohleC
   9TU6Ej4qtlk0tRFe6KkPST1sE+EAgSLR0SyESq4DCObG7yafTlCmK1UCe
   A5FqpERG58o5u+YtlCYR/1Z5uluAeHHvw+GQdDUJYYcnOc6DsA2DAhOS5
   g==;
IronPort-SDR: rW2uMN0vT40GaKvG3eOpik0LqFw/14GtdrafwcY8C4W4uUMEn4kmoH7M/GFwrhBZFeajmrFd7W
 dfPDaCNd+cQZOAztCeXPM3uX+yZ9EQMso/jbyapfdzALg76UXrOzZWZmMQIYbIdpWhkdVtXaD2
 lqfclGoR5S7YJ8AjnkYBrz/r1yn58sa3bRO+Lff0y/jdztZ3+uAMtr5viWteyojYfbbW/VGxc/
 oAtdlKZDICRC7/x1yKOUoflXfiRRqlowgM0OR9PLVMepGCksF5eQsijgm9MuOdI680SJhj4S8o
 UPQ=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="116250601"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 04:02:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 04:02:00 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 04:01:49 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 14/33] media: atmel: atmel-isc: add DMA to register offsets
Date:   Tue, 13 Apr 2021 13:57:12 +0300
Message-ID: <20210413105731.610028-15-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-1-eugen.hristev@microchip.com>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The DMA submodule is a part of the atmel-isc pipeline, and stands for
Direct Memory Access. It acts like a master on the AXI bus of the SoC, and
can directly write the RAM area with the pixel data from the ISC internal
sram.
Add dma to the reg offsets struct.
This will allow different products to have a different reg offset for this
particular module.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v3:
- added module explanation in commit message

 drivers/media/platform/atmel/atmel-isc-base.c | 19 ++++++++++++-------
 drivers/media/platform/atmel/atmel-isc-regs.h |  3 +++
 drivers/media/platform/atmel/atmel-isc.h      |  2 ++
 .../media/platform/atmel/atmel-sama5d2-isc.c  |  1 +
 4 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index aa7a9a7ca0e6..11121943d2cb 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -593,16 +593,20 @@ static void isc_start_dma(struct isc_device *isc)
 			   ISC_PFE_CFG0_COLEN | ISC_PFE_CFG0_ROWEN);
 
 	addr0 = vb2_dma_contig_plane_dma_addr(&isc->cur_frm->vb.vb2_buf, 0);
-	regmap_write(regmap, ISC_DAD0, addr0);
+	regmap_write(regmap, ISC_DAD0 + isc->offsets.dma, addr0);
 
 	switch (isc->config.fourcc) {
 	case V4L2_PIX_FMT_YUV420:
-		regmap_write(regmap, ISC_DAD1, addr0 + (sizeimage * 2) / 3);
-		regmap_write(regmap, ISC_DAD2, addr0 + (sizeimage * 5) / 6);
+		regmap_write(regmap, ISC_DAD1 + isc->offsets.dma,
+			     addr0 + (sizeimage * 2) / 3);
+		regmap_write(regmap, ISC_DAD2 + isc->offsets.dma,
+			     addr0 + (sizeimage * 5) / 6);
 		break;
 	case V4L2_PIX_FMT_YUV422P:
-		regmap_write(regmap, ISC_DAD1, addr0 + sizeimage / 2);
-		regmap_write(regmap, ISC_DAD2, addr0 + (sizeimage * 3) / 4);
+		regmap_write(regmap, ISC_DAD1 + isc->offsets.dma,
+			     addr0 + sizeimage / 2);
+		regmap_write(regmap, ISC_DAD2 + isc->offsets.dma,
+			     addr0 + (sizeimage * 3) / 4);
 		break;
 	default:
 		break;
@@ -610,7 +614,8 @@ static void isc_start_dma(struct isc_device *isc)
 
 	dctrl_dview = isc->config.dctrl_dview;
 
-	regmap_write(regmap, ISC_DCTRL, dctrl_dview | ISC_DCTRL_IE_IS);
+	regmap_write(regmap, ISC_DCTRL + isc->offsets.dma,
+		     dctrl_dview | ISC_DCTRL_IE_IS);
 	spin_lock(&isc->awb_lock);
 	regmap_write(regmap, ISC_CTRLEN, ISC_CTRL_CAPTURE);
 	spin_unlock(&isc->awb_lock);
@@ -723,7 +728,7 @@ static int isc_configure(struct isc_device *isc)
 	regmap_update_bits(regmap, ISC_RLP_CFG + isc->offsets.rlp,
 			   ISC_RLP_CFG_MODE_MASK, rlp_mode);
 
-	regmap_write(regmap, ISC_DCFG, dcfg);
+	regmap_write(regmap, ISC_DCFG + isc->offsets.dma, dcfg);
 
 	/* Set the pipeline */
 	isc_set_pipeline(isc, pipeline);
diff --git a/drivers/media/platform/atmel/atmel-isc-regs.h b/drivers/media/platform/atmel/atmel-isc-regs.h
index 0ab280ab59ec..4940998c82a2 100644
--- a/drivers/media/platform/atmel/atmel-isc-regs.h
+++ b/drivers/media/platform/atmel/atmel-isc-regs.h
@@ -247,6 +247,9 @@
 
 #define ISC_HIS_CFG_RAR			BIT(8)
 
+/* Offset for DMA register specific to sama5d2 product */
+#define ISC_SAMA5D2_DMA_OFFSET	0
+
 /* DMA Configuration Register */
 #define ISC_DCFG        0x000003e0
 #define ISC_DCFG_IMODE_PACKED8          0x0
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index 652285dc9f52..52a9199d65ee 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -152,6 +152,7 @@ struct isc_ctrls {
  * @sub420:		Offset for the SUB420 register
  * @rlp:		Offset for the RLP register
  * @his:		Offset for the HIS related registers
+ * @dma:		Offset for the DMA related registers
  */
 struct isc_reg_offsets {
 	u32 csc;
@@ -160,6 +161,7 @@ struct isc_reg_offsets {
 	u32 sub420;
 	u32 rlp;
 	u32 his;
+	u32 dma;
 };
 
 /*
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index 914de4ed63f3..12f56a71db40 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -239,6 +239,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->offsets.sub420 = ISC_SAMA5D2_SUB420_OFFSET;
 	isc->offsets.rlp = ISC_SAMA5D2_RLP_OFFSET;
 	isc->offsets.his = ISC_SAMA5D2_HIS_OFFSET;
+	isc->offsets.dma = ISC_SAMA5D2_DMA_OFFSET;
 
 	/* sama5d2-isc - 8 bits per beat */
 	isc->dcfg = ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
-- 
2.25.1

