Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2823543AB
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 17:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241747AbhDEPx5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 11:53:57 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:5357 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241739AbhDEPx4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 11:53:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617638031; x=1649174031;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9itboi6gqOjFSEGymjEiC6FR0AsxGOS+h9qzt7wDgPg=;
  b=plwyXK+KAWUHogHoN4Ki/OJgdwBAN6MQpfazHi8F9g3cL6m2qXZ5IkNX
   t4MiQP+9mtZTm5gBC0F7MLmlGCb3KR/i1KALkhIwPZ5Ly78Mf97W5FSFa
   e72YzxHEvKPAoJlvAK1gl8lIBylt1GBgw/b50zh6dhlbLP648kJ2HMzMh
   Q0VEaRNz4XOW42fnKPVJHAPR+bGU1WPdBQccvkGE7nomtgrdxcXBs6Dc6
   E0UPpIuwZqQh+EGGA2RgZKjN32j5rp2EqBMw+L/EGg/UWgS2V+mLugArY
   Q41tu1N0LLfVPFnEWxemLe5IqjF4h670/gwwPMro9978ydImbuS3pmiOg
   w==;
IronPort-SDR: OXiJdOyoUpW1xZyWk48GaLSPHQWgwiYIkFN/4pxX0Tu5VXU2lm81u2gfOxI9wgfAyGrnEyFOqL
 41i6MsrR5XT8c8GwLX1aKN8Bbt39+DywY2WducisGDE3JUlINEci1BPaLXQelwRXU6WrTSWfyY
 WXZ29HDBzWAmrsfof29dvsYs4UXoyEn27cTEcVwLBNwkhbYpJ8i5mMVxpDrnKi8vrMIeCKgXhh
 dX4rwxFRxYqYj291AA/vqqh4jHmsPTib04Km/tajjIYv031gcsXFKJFCWef9ZWC33DrVqwT4P0
 YiM=
X-IronPort-AV: E=Sophos;i="5.81,307,1610434800"; 
   d="scan'208";a="115341618"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2021 08:53:51 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 08:53:50 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Apr 2021 08:53:48 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 08/30] media: atmel: atmel-isc: create register offsets struct
Date:   Mon, 5 Apr 2021 18:50:43 +0300
Message-ID: <20210405155105.162529-9-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405155105.162529-1-eugen.hristev@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
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

