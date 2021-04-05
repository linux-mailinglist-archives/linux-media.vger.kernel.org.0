Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B37883543C1
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 17:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235412AbhDEPzM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 11:55:12 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:41670 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235800AbhDEPzM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 11:55:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617638105; x=1649174105;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CQkb4IExAKDrVuv3iiDWRy50ZELyNRT/536nsdhHPZM=;
  b=ECZa/Pyzalk81hi9l2j/kDseq88aYvXco/1CVXHSxprReWDef8D5QpZ2
   8l6xO6u2nX+/seCBwue7jabVRFD1uFSf7dg9EvdGtyyGqzsW5dWdBqUa6
   5SktIC4KASmdkZwp7kJ/sPHq3KZHLzSeXTtHnV5bQYCn2BfQKad91Tqrc
   OfBfGzIRuiQsfojQs6AGFR8pIiUy/yYgxiHrbqZ/tCbDCa45Eypi/OE6U
   dIbJhpSWa3t9nQ6v/npznwBjEuQLGnFguE3sI97tNQJOfMgvCyvtx7Flx
   WvWzw7ixYfyvX9X7t5SeRdX+tGn8mnAwbkCt2jePPVmZl86tNQG8odtCa
   g==;
IronPort-SDR: 8eISSk471XhK4Jo6ZgVbBXFGNxIh0NmCGOhAWMwBuutne8T0ymkts+XP9Vp8sTR/GyqMjm+16L
 w36ovq/wxXnmkc795DCvR7cqWNtsMoeqBP+RgPG8Az5HJGpOE+q7D2s1LNCkwS0/0TSx/OoxWL
 /QFh+80+TLXR30XNO2+Lwp2QfpUTD1+H7SxtjL4oWKQKbofr9ZyWMsmMGUhcJxGTs7UiGQfP5A
 wXbWHhOis4JSK76Bhm+f6rB5mOowVl/3USkoEQ8Q1ZB+FWavqtIt+HemPI0+zXpczmL3lOugnz
 g6g=
X-IronPort-AV: E=Sophos;i="5.81,307,1610434800"; 
   d="scan'208";a="50026658"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2021 08:55:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 08:54:53 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Apr 2021 08:54:42 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 14/30] media: atmel: atmel-isc: add DMA to register offsets
Date:   Mon, 5 Apr 2021 18:50:49 +0300
Message-ID: <20210405155105.162529-15-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405155105.162529-1-eugen.hristev@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
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

