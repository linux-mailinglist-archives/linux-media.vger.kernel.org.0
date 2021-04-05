Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7663543A5
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 17:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241727AbhDEPxo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 11:53:44 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:14534 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236213AbhDEPxo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 11:53:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617638017; x=1649174017;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qEt4okPqTBKfkVGMRlM3SJNXAjm8F/OqBgR2LDMi8tg=;
  b=xJ4HhUHMOAXMcaHqX08kfBZ6LMOZj0l4E+0V7EjwxURGyi4G7TQCgY6C
   +N4DjRZGCPHjusZbUIshZ4Wna0Q2pHXZZiEiXt9SzK8lMaYMa2G7s56Qv
   EtW5qGSJaFNDM+Ne4bVLr4+J8a1fUBRb5acMVflSyMSPh1cADVv1CuIqN
   6opC4CSZpAEiuQaTDRDBfvi49bUue5A53A45UHC4/BkS45/du9oJPsPBC
   VLx2Zyj5ClUAhRfCTxugcLvcGtwrcgE0oYZqnL81xHWLCYk2v9YcyxX3+
   b9Qr2ELj3d8KWq3tsTwBqDryxONeilah2rgARj8iOMUOTcM3ETg4Q7xuO
   Q==;
IronPort-SDR: 3gjpP7pFVdAvJrre/STbdiI63Llin2VMBLUnKsU4ATINbApuEeDLj4JkIg7GruP2v9ySFD8Kwx
 ee8GBrkfv38QS0mG32+bpb7IYIK6OVxNP5QkuGA7BFTzkSyYncTS+59Swup4xRB4hoxajXgTTS
 j7WGWoXgj33QUPvdaRyfOd6Q5nsvvko7RVrxS96b38NYMc7ssrNL7PcLeO3hcQuWwp01qnm6P7
 Me5bCR5LdMx/Q00GQRi5H//2s6PpAxBvKpQp+I92a80Ai7ubVxHmtppQBNpE2hrL3qEUWWJZn+
 Zy4=
X-IronPort-AV: E=Sophos;i="5.81,307,1610434800"; 
   d="scan'208";a="109700878"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2021 08:53:37 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 08:53:37 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Apr 2021 08:53:27 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 06/30] media: atmel: atmel-isc: extract CSC submodule config into separate function
Date:   Mon, 5 Apr 2021 18:50:41 +0300
Message-ID: <20210405155105.162529-7-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405155105.162529-1-eugen.hristev@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSC submodule should be initialized in the product specific driver
as it's product specific. Other products can implement it differently.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v2:
- addded function prototype to avoid warning with W=1

 drivers/media/platform/atmel/atmel-isc-base.c   |  8 +-------
 drivers/media/platform/atmel/atmel-isc.h        |  7 +++++++
 .../media/platform/atmel/atmel-sama5d2-isc.c    | 17 +++++++++++++++++
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index ff40ee2e2759..31f63ba90c71 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -646,13 +646,7 @@ static void isc_set_pipeline(struct isc_device *isc, u32 pipeline)
 	regmap_bulk_write(regmap, ISC_GAM_GENTRY, gamma, GAMMA_ENTRIES);
 	regmap_bulk_write(regmap, ISC_GAM_RENTRY, gamma, GAMMA_ENTRIES);
 
-	/* Convert RGB to YUV */
-	regmap_write(regmap, ISC_CSC_YR_YG, 0x42 | (0x81 << 16));
-	regmap_write(regmap, ISC_CSC_YB_OY, 0x19 | (0x10 << 16));
-	regmap_write(regmap, ISC_CSC_CBR_CBG, 0xFDA | (0xFB6 << 16));
-	regmap_write(regmap, ISC_CSC_CBB_OCB, 0x70 | (0x80 << 16));
-	regmap_write(regmap, ISC_CSC_CRR_CRG, 0x70 | (0xFA2 << 16));
-	regmap_write(regmap, ISC_CSC_CRB_OCR, 0xFEE | (0x80 << 16));
+	isc->config_csc(isc);
 
 	regmap_write(regmap, ISC_CBC_BRIGHT, ctrls->brightness);
 	regmap_write(regmap, ISC_CBC_CONTRAST, ctrls->contrast);
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index d14ae096fbf6..bb0b4419deff 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -192,6 +192,9 @@ struct isc_ctrls {
  *
  * @max_width:		maximum frame width, dependent on the internal RAM
  * @max_height:		maximum frame height, dependent on the internal RAM
+ *
+ * @config_csc:		pointer to a function that initializes product
+ *			specific CSC module
  */
 struct isc_device {
 	struct regmap		*regmap;
@@ -259,6 +262,10 @@ struct isc_device {
 
 	u32		max_width;
 	u32		max_height;
+
+	struct {
+		void (*config_csc)(struct isc_device *isc);
+	};
 };
 
 extern struct isc_format formats_list[];
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index 6d9942dcd7c1..f041bd75090e 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -54,6 +54,21 @@
 
 #define ISC_CLK_MAX_DIV		255
 
+void isc_sama5d2_config_csc(struct isc_device *isc);
+
+void isc_sama5d2_config_csc(struct isc_device *isc)
+{
+	struct regmap *regmap = isc->regmap;
+
+	/* Convert RGB to YUV */
+	regmap_write(regmap, ISC_CSC_YR_YG, 0x42 | (0x81 << 16));
+	regmap_write(regmap, ISC_CSC_YB_OY, 0x19 | (0x10 << 16));
+	regmap_write(regmap, ISC_CSC_CBR_CBG, 0xFDA | (0xFB6 << 16));
+	regmap_write(regmap, ISC_CSC_CBB_OCB, 0x70 | (0x80 << 16));
+	regmap_write(regmap, ISC_CSC_CRR_CRG, 0x70 | (0xFA2 << 16));
+	regmap_write(regmap, ISC_CSC_CRB_OCR, 0xFEE | (0x80 << 16));
+}
+
 /* Gamma table with gamma 1/2.2 */
 const u32 isc_sama5d2_gamma_table[][GAMMA_ENTRIES] = {
 	/* 0 --> gamma 1/1.8 */
@@ -198,6 +213,8 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->max_width = ISC_SAMA5D2_MAX_SUPPORT_WIDTH;
 	isc->max_height = ISC_SAMA5D2_MAX_SUPPORT_HEIGHT;
 
+	isc->config_csc = isc_sama5d2_config_csc;
+
 	/* sama5d2-isc - 8 bits per beat */
 	isc->dcfg = ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
 
-- 
2.25.1

