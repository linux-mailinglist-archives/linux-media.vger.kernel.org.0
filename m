Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87ED3351B6F
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237257AbhDASIh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:08:37 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:64963 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235267AbhDASCK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 14:02:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617300130; x=1648836130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K54yuKq9sUa4dY4BiiebxXOounI4ch3hrCDmlYNhKJ8=;
  b=nCxzGKoFUwJMbKypBSAXGVgOhZSh4e8Ar8Ddtn4D45J4+4GjpUHCFBXt
   yQwS4qQYsaF44uNUvCSdF5QsjhmNwrSTL6OgY5uGm3557V2L7dPi9NDf4
   KwqXT8xDrIkIapde7cOg74IriaI7pkfF5cX5aX+91tGtWi50BUMETNOzM
   7mzTxySSCHFPqErv6BFvGTqUlWnerAYrJfvpvhJk3u5c7IMj9UxgTDl1D
   pjL+OjefmQGDVvooHTOuP2G7/qrLRIGLrqd4Oz9uv4cHX0j+ZGmdW5th8
   oAPR9LbPjFlG4v7ocBQN4s+A7RAkOQeFO1pF8afA+kFc6eT6VFP49Rmv1
   Q==;
IronPort-SDR: /3Bi1d/8iERvZBn8x0xCGIz2wTAttakwMf7+3KsUb/BtHSmThSWv1s99lYbLV++Y2daGk7EqPD
 hYt4E39Q2m92tcEI8TAqrbvt+t/mvva+RjKOpb6clbo6m+OkoEHV9xTjvvgKYBmA1Nx/zMJzZ+
 F9UgoTmjv82XlN8YEdeE+UKnp6VfeAs5/zPORSU4/H8DRANswcevW8ic45z+4H9o8L2MO/ec5f
 HTKJwZ1TG5wg+0YqBREfalBFit1boOG62gqUeiCKvoQwHtuzU0TqFHOZRzaWQseaG26Ybt5agb
 b24=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="49670751"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:29:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:29:57 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:29:47 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 08/30] media: atmel: atmel-isc: create register offsets struct
Date:   Thu, 1 Apr 2021 14:27:01 +0300
Message-ID: <20210401112723.189107-9-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401112723.189107-1-eugen.hristev@microchip.com>
References: <20210401112723.189107-1-eugen.hristev@microchip.com>
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
index d9f06daffdf8..3b076b87454e 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -59,12 +59,18 @@ void isc_sama5d2_config_csc(struct isc_device *isc)
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
@@ -213,6 +219,8 @@ static int atmel_isc_probe(struct platform_device *pdev)
 
 	isc->config_csc = isc_sama5d2_config_csc;
 
+	isc->offsets.csc = ISC_SAMA5D2_CSC_OFFSET;
+
 	/* sama5d2-isc - 8 bits per beat */
 	isc->dcfg = ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
 
-- 
2.25.1

