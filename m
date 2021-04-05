Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE123543AF
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 17:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241762AbhDEPyB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 11:54:01 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:57531 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241752AbhDEPx6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 11:53:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617638032; x=1649174032;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rdvIzi/L0XfqY6KKlPcjVlfFG0pyj+7V8L1NdsX9Lig=;
  b=zYz+Ve3VgwWR055YoZL9uRYVZBrpxap2XnGc0p1b9OVqGfeG91vv5Aox
   jbT6I3C5t7/O3XnbwklkmQVNCZ634mX1IUb9hleQtpHECEGtDbl4ElBKB
   FDWk0ug0KSwlAfDozEwACTjWKYoGLh9RRbdZwdTFt2Ga/WIeEmG1JdC1N
   PBIIySyNzjwBvObNXS10B2q+bvd6kKrKt8IB5CF0XgWD4CWKVb2je0POx
   9A/af/MrAjpFIUg3SiX5Fr3b1n6WfjUSm6an9/3fQed7JXdgRcdGXIXkZ
   qdYc28MO9OffbrxBmna55wS/gnxLzEODqgVZIdF71c79gsVZeHCFbt+tV
   Q==;
IronPort-SDR: WtJgYnqNL5CmEJ8R3HnPg1XfChDTB9ZfFOLEK3ua4FPT0DTsk6M4HvlDQmbAqs328keik1D8ku
 Ic4/Tw2BcUVeHo91iagkOFynsSEymrju+Guxg6igr41TZT8S/niXkhFNymNJXtmjiZi8OD/uKU
 3kSmpWojtCoS6OOOGuWc+4I2Ytvc205o5ClX79W4mGhc4flfoupUllTw264cHbGXw+6VRVnTkd
 YSqYTbQeLwpTURVNKyPhL/oWDS2VElcX2I2oBfvGJ8CO0PRuUYmVkZTXmUXN2qptJCiobRNCSd
 WIs=
X-IronPort-AV: E=Sophos;i="5.81,307,1610434800"; 
   d="scan'208";a="121808146"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2021 08:53:52 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 08:53:52 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Apr 2021 08:53:50 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 09/30] media: atmel: atmel-isc: extract CBC submodule config into separate function
Date:   Mon, 5 Apr 2021 18:50:44 +0300
Message-ID: <20210405155105.162529-10-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405155105.162529-1-eugen.hristev@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CBC submodule should be initialized in the product specific driver
as it's product specific. Other products can implement it differently

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v2:
- addded function prototype to avoid warning with W=1

 drivers/media/platform/atmel/atmel-isc-base.c    |  4 +---
 drivers/media/platform/atmel/atmel-isc.h         |  3 +++
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 10 ++++++++++
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 019d931d1367..446fe232956b 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -647,9 +647,7 @@ static void isc_set_pipeline(struct isc_device *isc, u32 pipeline)
 	regmap_bulk_write(regmap, ISC_GAM_RENTRY, gamma, GAMMA_ENTRIES);
 
 	isc->config_csc(isc);
-
-	regmap_write(regmap, ISC_CBC_BRIGHT, ctrls->brightness);
-	regmap_write(regmap, ISC_CBC_CONTRAST, ctrls->contrast);
+	isc->config_cbc(isc);
 }
 
 static int isc_update_profile(struct isc_device *isc)
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index ef3a0451192d..cb47932197b1 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -203,6 +203,8 @@ struct isc_reg_offsets {
  *
  * @config_csc:		pointer to a function that initializes product
  *			specific CSC module
+ * @config_cbc:		pointer to a function that initializes product
+ *			specific CBC module
  *
  * @offsets:		struct holding the product specific register offsets
  */
@@ -275,6 +277,7 @@ struct isc_device {
 
 	struct {
 		void (*config_csc)(struct isc_device *isc);
+		void (*config_cbc)(struct isc_device *isc);
 	};
 
 	struct isc_reg_offsets		offsets;
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index 9e557d17e731..66b92fa1c752 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -55,6 +55,7 @@
 #define ISC_CLK_MAX_DIV		255
 
 void isc_sama5d2_config_csc(struct isc_device *isc);
+void isc_sama5d2_config_cbc(struct isc_device *isc);
 
 void isc_sama5d2_config_csc(struct isc_device *isc)
 {
@@ -75,6 +76,14 @@ void isc_sama5d2_config_csc(struct isc_device *isc)
 		     0xFEE | (0x80 << 16));
 }
 
+void isc_sama5d2_config_cbc(struct isc_device *isc)
+{
+	struct regmap *regmap = isc->regmap;
+
+	regmap_write(regmap, ISC_CBC_BRIGHT, isc->ctrls.brightness);
+	regmap_write(regmap, ISC_CBC_CONTRAST, isc->ctrls.contrast);
+}
+
 /* Gamma table with gamma 1/2.2 */
 const u32 isc_sama5d2_gamma_table[][GAMMA_ENTRIES] = {
 	/* 0 --> gamma 1/1.8 */
@@ -220,6 +229,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->max_height = ISC_SAMA5D2_MAX_SUPPORT_HEIGHT;
 
 	isc->config_csc = isc_sama5d2_config_csc;
+	isc->config_cbc = isc_sama5d2_config_cbc;
 
 	isc->offsets.csc = ISC_SAMA5D2_CSC_OFFSET;
 
-- 
2.25.1

