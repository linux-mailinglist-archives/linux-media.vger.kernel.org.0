Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B23ED3543D0
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 17:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238650AbhDEP4g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 11:56:36 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:43619 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235453AbhDEP4g (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 11:56:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617638190; x=1649174190;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c7kkGNZaIvu+iWN3XmHs+l32xpFQTaZ7LU9lPeNNP0I=;
  b=0mLkBP00QQBK0sMBQpTGMDv3KzarldlUkiP7D8yecTO5ynrBGXRVbR4w
   bjvMBnZ2urF3blfdmp/UTF2dYiKBvqCg95dO9ZYNjE6yUXoe+BN1lX7jb
   j1qFH2JouhGytwmFcYXkaJSdphz16vU8Z61Kd/xU4IKfvvzuLikjyZxoq
   DKmHVK6n5Kqpufr9B2LNfidJUGzo+lG/gj6lzRrjRdBtcc0H7ZWLLIRAp
   dyhKyZrb4tbaKbCRth8qvAozYjDEoPZb/7tvup+F4KgzjXSdvc2gkacbu
   0GCE+PQaDz/z0RCgozLQ9c5EievO+0+b/RGFbC8PG5vDXVE9H93E7ttjx
   Q==;
IronPort-SDR: jBDT7cilrzOETe2J+DkF26QcdkzlhrOtfTkHozrN27lrDm3seZwUa6pp+aopHWTa/gZrYf7TeE
 6u0/wEutdiF/b28WIQVljuRv/W9djR9szvgHqZ6FR21IsfiS+FlGXnBLXy8wVgOYVHFBn/kxwt
 VM2oL8nphF7A1TEE59zbtAyqfhSqrqPdAk/spqgx/zm4qyz5FeFStQD1BRUCcU9biBa6bDdQoy
 0vpvwtm2oc3feOT799apE9RhXhAFTJsDwv+SerCCcJoryWUfSqMCyCUnQVZOLcHIcvH17GsH8V
 SmU=
X-IronPort-AV: E=Sophos;i="5.81,307,1610434800"; 
   d="scan'208";a="115869630"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2021 08:56:29 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 08:56:29 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Apr 2021 08:56:07 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 19/30] media: atmel: atmel-isc: add CC initialization function
Date:   Mon, 5 Apr 2021 18:50:54 +0300
Message-ID: <20210405155105.162529-20-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405155105.162529-1-eugen.hristev@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement the color correction (CC) submodule initialization, as a product
specific function, which currently configures the neutral point in color
correction.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v2:
- addded function prototype to avoid warning with W=1

 drivers/media/platform/atmel/atmel-isc-base.c    |  1 +
 drivers/media/platform/atmel/atmel-isc.h         |  3 +++
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 15 +++++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 66005cb3940f..182903803c05 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -653,6 +653,7 @@ static void isc_set_pipeline(struct isc_device *isc, u32 pipeline)
 
 	isc->config_csc(isc);
 	isc->config_cbc(isc);
+	isc->config_cc(isc);
 }
 
 static int isc_update_profile(struct isc_device *isc)
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index f574bcc3ba67..a5f8d5001381 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -225,6 +225,8 @@ struct isc_reg_offsets {
  *			specific CSC module
  * @config_cbc:		pointer to a function that initializes product
  *			specific CBC module
+ * @config_cc:		pointer to a function that initializes product
+ *			specific CC module
  *
  * @offsets:		struct holding the product specific register offsets
  */
@@ -298,6 +300,7 @@ struct isc_device {
 	struct {
 		void (*config_csc)(struct isc_device *isc);
 		void (*config_cbc)(struct isc_device *isc);
+		void (*config_cc)(struct isc_device *isc);
 	};
 
 	struct isc_reg_offsets		offsets;
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index 0ff13198d732..0ce8293622f9 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -56,6 +56,7 @@
 
 void isc_sama5d2_config_csc(struct isc_device *isc);
 void isc_sama5d2_config_cbc(struct isc_device *isc);
+void isc_sama5d2_config_cc(struct isc_device *isc);
 
 void isc_sama5d2_config_csc(struct isc_device *isc)
 {
@@ -86,6 +87,19 @@ void isc_sama5d2_config_cbc(struct isc_device *isc)
 		     isc->ctrls.contrast);
 }
 
+void isc_sama5d2_config_cc(struct isc_device *isc)
+{
+	struct regmap *regmap = isc->regmap;
+
+	/* Configure each register at the neutral fixed point 1.0 or 0.0 */
+	regmap_write(regmap, ISC_CC_RR_RG, (1 << 8));
+	regmap_write(regmap, ISC_CC_RB_OR, 0);
+	regmap_write(regmap, ISC_CC_GR_GG, (1 << 8) << 16);
+	regmap_write(regmap, ISC_CC_GB_OG, 0);
+	regmap_write(regmap, ISC_CC_BR_BG, 0);
+	regmap_write(regmap, ISC_CC_BB_OB, (1 << 8));
+}
+
 /* Gamma table with gamma 1/2.2 */
 const u32 isc_sama5d2_gamma_table[][GAMMA_ENTRIES] = {
 	/* 0 --> gamma 1/1.8 */
@@ -233,6 +247,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 
 	isc->config_csc = isc_sama5d2_config_csc;
 	isc->config_cbc = isc_sama5d2_config_cbc;
+	isc->config_cc = isc_sama5d2_config_cc;
 
 	isc->offsets.csc = ISC_SAMA5D2_CSC_OFFSET;
 	isc->offsets.cbc = ISC_SAMA5D2_CBC_OFFSET;
-- 
2.25.1

