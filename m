Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31F6335DD16
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245111AbhDMLBS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:01:18 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:16971 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344356AbhDMLBA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:01:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311641; x=1649847641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9itboi6gqOjFSEGymjEiC6FR0AsxGOS+h9qzt7wDgPg=;
  b=qz16vN5mqOfaSqR2FRYhiX9trJZwT2aQ0xDnhFFMneVzBVoPfeusaVpk
   vAoWFqEfNj8sXZQAqoC8LUXKcqvoC24RkQOSuItF+8RW+4IJWlf1qOtL4
   1bHEAeMhQAjqxHuZMi9o2/qxLgS+1ZEiTG7LkVw31RgpQyIVPNEL2rVxv
   p1nhxWJOBUXF+t4LOpmHodXwWfUB0Yg347zftKMHaCLeZ2tBPZJLyPl0v
   n82E4p+lu+CG7YRTZPHM4fQxK6YWRqKwCiffg0cKg2utgn7HJiVal/KLR
   NrHm2TDsOdhd4LWD1z8RU2NcCuIMvMBdYQKvTfhV3Pt7KGj7e6HcvE1IK
   A==;
IronPort-SDR: caahwGNtZSGguS6+qBrBgtU6NxgjfprfbmbouuuqIfwTBR+VfntZ/amQ7oeHxfewOe9BIFJFVH
 UECAS6BXfPhyUJhWg18VOlCZps/5GrxzOm0rHszGertXzkAzSDZx7aSzv/HkBshlNhlCEX7N6m
 rD0rBFlVGmnRdGuhhZc/oXFF4BtDw7nVCzNXC++WNrv51qeldsXA/MBhLBvkc06+EyQdBERhKC
 pzCrXuaORa++IDVigtvji3lEGvW4OgLXNvcXozSepjwxpUi3n8wA6iw9VG1ChdG/1X2XMu7zLw
 gdg=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="116804103"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 04:00:41 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 04:00:40 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 04:00:21 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 08/33] media: atmel: atmel-isc: create register offsets struct
Date:   Tue, 13 Apr 2021 13:57:06 +0300
Message-ID: <20210413105731.610028-9-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-1-eugen.hristev@microchip.com>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Create a struct that holds register offsets that are product specific.
Add initially the CSC register.
This allows each product that contains a variant of the ISC to add their
own register offset.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c |  2 +-
 drivers/media/platform/atmel/atmel-isc-regs.h |  3 +++
 drivers/media/platform/atmel/atmel-isc.h      | 12 +++++++++++
 .../media/platform/atmel/atmel-sama5d2-isc.c  | 20 +++++++++++++------
 4 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index bc036e8ac4fe..019d931d1367 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -2311,7 +2311,7 @@ int isc_pipeline_init(struct isc_device *isc)
 		REG_FIELD(ISC_GAM_CTRL, 1, 1),
 		REG_FIELD(ISC_GAM_CTRL, 2, 2),
 		REG_FIELD(ISC_GAM_CTRL, 3, 3),
-		REG_FIELD(ISC_CSC_CTRL, 0, 0),
+		REG_FIELD(ISC_CSC_CTRL + isc->offsets.csc, 0, 0),
 		REG_FIELD(ISC_CBC_CTRL, 0, 0),
 		REG_FIELD(ISC_SUB422_CTRL, 0, 0),
 		REG_FIELD(ISC_SUB420_CTRL, 0, 0),
diff --git a/drivers/media/platform/atmel/atmel-isc-regs.h b/drivers/media/platform/atmel/atmel-isc-regs.h
index f1e160ed4351..5a65600c5f88 100644
--- a/drivers/media/platform/atmel/atmel-isc-regs.h
+++ b/drivers/media/platform/atmel/atmel-isc-regs.h
@@ -153,6 +153,9 @@
 /* ISC_Gamma Correction Green Entry Register */
 #define ISC_GAM_RENTRY	0x00000298
 
+/* Offset for CSC register specific to sama5d2 product */
+#define ISC_SAMA5D2_CSC_OFFSET	0
+
 /* Color Space Conversion Control Register */
 #define ISC_CSC_CTRL    0x00000398
 
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index bb0b4419deff..ef3a0451192d 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -144,6 +144,14 @@ struct isc_ctrls {
 
 #define ISC_PIPE_LINE_NODE_NUM	11
 
+/*
+ * struct isc_reg_offsets - ISC device register offsets
+ * @csc:		Offset for the CSC register
+ */
+struct isc_reg_offsets {
+	u32 csc;
+};
+
 /*
  * struct isc_device - ISC device driver data/config struct
  * @regmap:		Register map
@@ -195,6 +203,8 @@ struct isc_ctrls {
  *
  * @config_csc:		pointer to a function that initializes product
  *			specific CSC module
+ *
+ * @offsets:		struct holding the product specific register offsets
  */
 struct isc_device {
 	struct regmap		*regmap;
@@ -266,6 +276,8 @@ struct isc_device {
 	struct {
 		void (*config_csc)(struct isc_device *isc);
 	};
+
+	struct isc_reg_offsets		offsets;
 };
 
 extern struct isc_format formats_list[];
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index f041bd75090e..9e557d17e731 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -61,12 +61,18 @@ void isc_sama5d2_config_csc(struct isc_device *isc)
 	struct regmap *regmap = isc->regmap;
 
 	/* Convert RGB to YUV */
-	regmap_write(regmap, ISC_CSC_YR_YG, 0x42 | (0x81 << 16));
-	regmap_write(regmap, ISC_CSC_YB_OY, 0x19 | (0x10 << 16));
-	regmap_write(regmap, ISC_CSC_CBR_CBG, 0xFDA | (0xFB6 << 16));
-	regmap_write(regmap, ISC_CSC_CBB_OCB, 0x70 | (0x80 << 16));
-	regmap_write(regmap, ISC_CSC_CRR_CRG, 0x70 | (0xFA2 << 16));
-	regmap_write(regmap, ISC_CSC_CRB_OCR, 0xFEE | (0x80 << 16));
+	regmap_write(regmap, ISC_CSC_YR_YG + isc->offsets.csc,
+		     0x42 | (0x81 << 16));
+	regmap_write(regmap, ISC_CSC_YB_OY + isc->offsets.csc,
+		     0x19 | (0x10 << 16));
+	regmap_write(regmap, ISC_CSC_CBR_CBG + isc->offsets.csc,
+		     0xFDA | (0xFB6 << 16));
+	regmap_write(regmap, ISC_CSC_CBB_OCB + isc->offsets.csc,
+		     0x70 | (0x80 << 16));
+	regmap_write(regmap, ISC_CSC_CRR_CRG + isc->offsets.csc,
+		     0x70 | (0xFA2 << 16));
+	regmap_write(regmap, ISC_CSC_CRB_OCR + isc->offsets.csc,
+		     0xFEE | (0x80 << 16));
 }
 
 /* Gamma table with gamma 1/2.2 */
@@ -215,6 +221,8 @@ static int atmel_isc_probe(struct platform_device *pdev)
 
 	isc->config_csc = isc_sama5d2_config_csc;
 
+	isc->offsets.csc = ISC_SAMA5D2_CSC_OFFSET;
+
 	/* sama5d2-isc - 8 bits per beat */
 	isc->dcfg = ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
 
-- 
2.25.1

