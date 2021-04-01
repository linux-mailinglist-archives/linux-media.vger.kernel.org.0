Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03073351A4A
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235201AbhDAR6z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 13:58:55 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:19744 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235323AbhDAR4S (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 13:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617299778; x=1648835778;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/YR83v3iNrlSY/SHAVyK3TyP+czbbOylAO068334qq0=;
  b=DtQ0ytROQLt6J10MyOti81n0jIMiLa8unmnlXixMUxPS7tUabicT4lO1
   8ZO588nEWAblbmM5xFQ0aBF1q3IlDIDA1+MLAW43K68oB4PtkRqwlXtJi
   YZFo2shXvilYvdR+vV6cT9fJTmi/CI28OsAfeWasKGhlnz/PVLwvsrtEh
   Yb8HmiLrW25KWOiQYUbGS/E2uL2OQq+M0xrGaIogJt4EqSWPOOnMkV0+n
   am65k+Jg1r6psm4JSy/3WT1l8tsh9vn1X1IC/T2FUSjBLw4aCk1Y0uAng
   i4KSuson/zpxAeeEe4u9DxvFe0NGCIZMqsxlqywN/G5ou7ILV9QNUsl69
   A==;
IronPort-SDR: yvS4/gljrf6a27pksFWaPsv5agOFzG2VLbelUEmUc+KXWolwaLkc7SqJHZmN86vW0AqvHTZE/N
 da9xvk+QQwDeJZQE6jx5T2uQe+SH7NJSmuB1dW4SUzUYot0SIdnpPCh60Ku4zDxdrECpjILJFB
 2PvUMCqszUELo+JyXjDIQ8NGLFDTGLDVFjXSttgk+Yd/tmXe50yLjp4UsKF5055+Pp++JSn4no
 S5KSulRMJ4L1lIWVb9YStvhohSZMRi86WUnh29G5m88mF3HRp8foYXHfJ9bYXwMwTkmXXI4Z8B
 k7E=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="109338497"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:30:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:30:57 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:30:50 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 14/30] media: atmel: atmel-isc: add DMA to register offsets
Date:   Thu, 1 Apr 2021 14:27:07 +0300
Message-ID: <20210401112723.189107-15-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401112723.189107-1-eugen.hristev@microchip.com>
References: <20210401112723.189107-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add dma to the reg offsets struct.
This will allow different products to have a different reg offset for this
particular module.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
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
index 886dea8b7b1c..f583288f0503 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -236,6 +236,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->offsets.sub420 = ISC_SAMA5D2_SUB420_OFFSET;
 	isc->offsets.rlp = ISC_SAMA5D2_RLP_OFFSET;
 	isc->offsets.his = ISC_SAMA5D2_HIS_OFFSET;
+	isc->offsets.dma = ISC_SAMA5D2_DMA_OFFSET;
 
 	/* sama5d2-isc - 8 bits per beat */
 	isc->dcfg = ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
-- 
2.25.1

