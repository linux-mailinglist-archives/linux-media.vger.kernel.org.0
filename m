Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8C9935DD37
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344951AbhDMLDC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:03:02 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:41213 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344576AbhDMLCs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311748; x=1649847748;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TBEXU4Ly8SglyXAY2VWYA9gAClSi/maWKT5ll7y8lYs=;
  b=Iqv4uPitcgRjaB4Ub7TUtDuGy0QnkAaBchlxHuBHTdGpqri3TwMHV4cW
   AD8o3jrSSR1/VzW+E80oUHmBEp+0+HdBGAdHputWGCF0vcSC4Z8HtE84C
   708FMew55p5lVRIQdtVwDQPF42GQkx4zJ0LwwoPgJAD7pcJnW6y9RSbqC
   i5kI1jZAhGBVJZgdkAxCm9k1TIcDS0KDaxHdUXTGxD9OO1vLUqFFGju9l
   J5fJNf1Tux1dywNu4Wa3jHXW8WlQBkNFr9s2J6NDy84CoABqYuufAlH1z
   FJVy2h2euRri3LzZup8U+YdPkq+ytHFwW2c4MI0xdXtcfeac+ZG2V8fAi
   Q==;
IronPort-SDR: rPje9wVTK2VciKuw94ha8DYwNFhToMFtroUXx41II6bBYIRVLN00ifQPpccWdv3aSFN389G3/j
 DqDp3H2btenRBvBUnqAG4Z+McARfSU59KyGWI6WRxaJGML7Px0md4KemDtx+IrSNwuypHoWeLb
 2yEWVZvlmFt7y3Z+Ge5CZaFsjRNn5iXceTMCCXbyMcnBmWNk6EFTet0IMXBD/oKwglfJpi1aTD
 3eGE//dIuelcrSTzJ5w4hNHSP4mqyavm7uZfSRRI8/WW7vXYkRewCYV2Lj6NF3dc1BVfME3Xsg
 /5c=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="50928483"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 04:02:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 04:02:27 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 04:02:21 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 18/33] media: atmel: atmel-isc: extend pipeline with extra modules
Date:   Tue, 13 Apr 2021 13:57:16 +0300
Message-ID: <20210413105731.610028-19-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-1-eugen.hristev@microchip.com>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Newer ISC pipelines have the additional modules of
Defective Pixel Correction -> DPC itself,
Defective Pixel Correction -> Green Disparity Correction (DPC_GDC)
Defective Pixel Correction -> Black Level Correction (DPC_BLC)
Vertical and Horizontal Scaler -> VHXS

Some products have this full pipeline (sama7g5), other products do not (sama5d2)

Add the modules to the isc base, and also extend the register range to include
the modules.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c | 11 ++++++--
 drivers/media/platform/atmel/atmel-isc.h      | 28 +++++++++++--------
 2 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 2a619eef6aa3..66005cb3940f 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -2309,8 +2309,14 @@ int isc_pipeline_init(struct isc_device *isc)
 	struct regmap_field *regs;
 	unsigned int i;
 
-	/* WB-->CFA-->CC-->GAM-->CSC-->CBC-->SUB422-->SUB420 */
+	/*
+	 * DPCEN-->GDCEN-->BLCEN-->WB-->CFA-->CC-->
+	 * GAM-->VHXS-->CSC-->CBC-->SUB422-->SUB420
+	 */
 	const struct reg_field regfields[ISC_PIPE_LINE_NODE_NUM] = {
+		REG_FIELD(ISC_DPC_CTRL, 0, 0),
+		REG_FIELD(ISC_DPC_CTRL, 1, 1),
+		REG_FIELD(ISC_DPC_CTRL, 2, 2),
 		REG_FIELD(ISC_WB_CTRL, 0, 0),
 		REG_FIELD(ISC_CFA_CTRL, 0, 0),
 		REG_FIELD(ISC_CC_CTRL, 0, 0),
@@ -2318,6 +2324,7 @@ int isc_pipeline_init(struct isc_device *isc)
 		REG_FIELD(ISC_GAM_CTRL, 1, 1),
 		REG_FIELD(ISC_GAM_CTRL, 2, 2),
 		REG_FIELD(ISC_GAM_CTRL, 3, 3),
+		REG_FIELD(ISC_VHXS_CTRL, 0, 0),
 		REG_FIELD(ISC_CSC_CTRL + isc->offsets.csc, 0, 0),
 		REG_FIELD(ISC_CBC_CTRL + isc->offsets.cbc, 0, 0),
 		REG_FIELD(ISC_SUB422_CTRL + isc->offsets.sub422, 0, 0),
@@ -2336,7 +2343,7 @@ int isc_pipeline_init(struct isc_device *isc)
 }
 
 /* regmap configuration */
-#define ATMEL_ISC_REG_MAX    0xbfc
+#define ATMEL_ISC_REG_MAX    0xd5c
 const struct regmap_config isc_regmap_config = {
 	.reg_bits       = 32,
 	.reg_stride     = 4,
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index c5d956fd20a0..f574bcc3ba67 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -68,17 +68,21 @@ struct isc_format {
 };
 
 /* Pipeline bitmap */
-#define WB_ENABLE	BIT(0)
-#define CFA_ENABLE	BIT(1)
-#define CC_ENABLE	BIT(2)
-#define GAM_ENABLE	BIT(3)
-#define GAM_BENABLE	BIT(4)
-#define GAM_GENABLE	BIT(5)
-#define GAM_RENABLE	BIT(6)
-#define CSC_ENABLE	BIT(7)
-#define CBC_ENABLE	BIT(8)
-#define SUB422_ENABLE	BIT(9)
-#define SUB420_ENABLE	BIT(10)
+#define DPC_DPCENABLE	BIT(0)
+#define DPC_GDCENABLE	BIT(1)
+#define DPC_BLCENABLE	BIT(2)
+#define WB_ENABLE	BIT(3)
+#define CFA_ENABLE	BIT(4)
+#define CC_ENABLE	BIT(5)
+#define GAM_ENABLE	BIT(6)
+#define GAM_BENABLE	BIT(7)
+#define GAM_GENABLE	BIT(8)
+#define GAM_RENABLE	BIT(9)
+#define VHXS_ENABLE	BIT(10)
+#define CSC_ENABLE	BIT(11)
+#define CBC_ENABLE	BIT(12)
+#define SUB422_ENABLE	BIT(13)
+#define SUB420_ENABLE	BIT(14)
 
 #define GAM_ENABLES	(GAM_RENABLE | GAM_GENABLE | GAM_BENABLE | GAM_ENABLE)
 
@@ -142,7 +146,7 @@ struct isc_ctrls {
 	u32 hist_minmax[HIST_BAYER][2];
 };
 
-#define ISC_PIPE_LINE_NODE_NUM	11
+#define ISC_PIPE_LINE_NODE_NUM	15
 
 /*
  * struct isc_reg_offsets - ISC device register offsets
-- 
2.25.1

