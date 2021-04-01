Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8DB6351B71
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237688AbhDASIk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:08:40 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:65126 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236115AbhDASCK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 14:02:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617300130; x=1648836130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ulWPoLeocs+dWVdplnwdGoF96XkQIYb0xWpMWXdJoE4=;
  b=RZ/kBsuQGYcFmfVw5B+wq2ydXc1VnBixG6ACkigVgD6swtfntGSBSf6I
   C5r1pcvufI3m9j9y+QJY3udhTxavzMapIfr2+j+b3/OaegvTFZWo7mNO5
   LZdNKRTZhiYyiCX06A3fxyfwhEQ+NZBRBN0KLThDNwd5eLbBFlNscB10T
   8bPUhvQjVRtXSP3dTjmJN5jKrC5K7MhcRT9EnZty0jurpLPhQSMzOvpmY
   HOKi5QdNkj3yWpCqN5dFNLno3V9RXxnGcuCjOEGG1J02e/jhStfPe9Zna
   YsBHHo9142bKpJaVvaVg7CHewSVpBU4zxMmIQ+Jc2ibK4i35ADeQzDih/
   g==;
IronPort-SDR: vTxUdd3X09eBaYNmsnATbhEL0/HNrhmF6nry/K5R4lSr11pCDUF22ZXrnkiovcr5TeeMXvYa6D
 dHsMQJ9EejqXR0W+eAUfLAxQigqsQCSQSYG0zlw9Q0sL73kSBn6XNXqUcvvmzuly68Lvu+n7kp
 cA1aHnCX0Ibc45J7lRSfd634dLdVOJnIwKD5LJG6vrtk2OQn30EbTSRXjZR+1K3HkOjXtuxfOo
 XdepAjnCyx9IaooF47fQX0qeIiIc4OOGRoFhW0MucptDHG9Mjbz5bBdS/pQw9Hry/EsfDGmbry
 mik=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="49670788"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:30:11 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:30:11 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:29:59 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 09/30] media: atmel: atmel-isc: extract CBC submodule config into separate function
Date:   Thu, 1 Apr 2021 14:27:02 +0300
Message-ID: <20210401112723.189107-10-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401112723.189107-1-eugen.hristev@microchip.com>
References: <20210401112723.189107-1-eugen.hristev@microchip.com>
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
 drivers/media/platform/atmel/atmel-isc-base.c    | 4 +---
 drivers/media/platform/atmel/atmel-isc.h         | 3 +++
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 9 +++++++++
 3 files changed, 13 insertions(+), 3 deletions(-)

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
index 3b076b87454e..36bf15a9607d 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -73,6 +73,14 @@ void isc_sama5d2_config_csc(struct isc_device *isc)
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
@@ -218,6 +226,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->max_height = ISC_SAMA5D2_MAX_SUPPORT_HEIGHT;
 
 	isc->config_csc = isc_sama5d2_config_csc;
+	isc->config_cbc = isc_sama5d2_config_cbc;
 
 	isc->offsets.csc = ISC_SAMA5D2_CSC_OFFSET;
 
-- 
2.25.1

