Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2805B35DD1D
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344371AbhDMLBg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:01:36 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:16284 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236816AbhDMLBf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:01:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311676; x=1649847676;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w3e8V74dSAc5cJIImGJdcXQcAw8LOiR5lNwCf9yK9zA=;
  b=M9y1Nm2Go5VKaK49Pr0/kqyFYKmPPSipHd7CS0Eg+c+jBcn07dW6Cb9m
   wXXMtIFUpE5qtFOM2xFfm/3WIqzpnWJdFpfLcGUSCbpyEQiN0kWzC7s2E
   afKScL4G0HBx3wCKfPhydHxOkbIpbHvUQM1iewhwhFSPcDlmPkU4S0MWx
   JnKt7evpZqeVDfBYnpaZmmsn8QPPSr27l60xdpRVC0NS2DSCnyrzH8+CK
   0WckCaX1dYOk+mBvKZmmx/4Xv9T+BeSYWxm4vIXn2dPtDsOjp+ZxJk6H/
   GNzb1x68vv3bjPU1zJucShwMUFCjInJFZYFGwF4fkPZN74WmG40Iz5TVD
   g==;
IronPort-SDR: RTWfy48RoRiU7rSQ4OkOW+0d1XkA5swAUTJwF7jxqbKp5W1XLdl4yiEmX/zNSE1z+AywRm4nYa
 63CbHXyHOwM9Hl4b9DwHfa1kfwRGAQgQozSUxgHAneDiBXQ7jxf3OVItXoLDJ2rgPg8rDjbYBl
 cnfi1Dm7rwbhA9fe3BGCBl+LAmPLk1/ePigZp+oUsXbueeQh/OSeq9XTtSiJqylUWNmQn8+/IK
 DgWop5Gl88ep1kq4XibBaacVqMB0N36Xg5ZQj3HP43B67jREECoYnwVWz/XpWUoOCJmvQveW4d
 a8Q=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="122830008"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 04:01:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 04:01:03 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 04:00:41 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 09/33] media: atmel: atmel-isc: extract CBC submodule config into separate function
Date:   Tue, 13 Apr 2021 13:57:07 +0300
Message-ID: <20210413105731.610028-10-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-1-eugen.hristev@microchip.com>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CBC submodule is a part of the atmel-isc pipeline, and stands for
Contrast Brightness Control. It is used to apply gains and offsets to the
luma (Y) and chroma (U, V) components of the YUV elements.
The CBC submodule should be initialized in the product specific driver
as it's product specific. Other products can implement it differently

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v3:
- added module description explanation
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

