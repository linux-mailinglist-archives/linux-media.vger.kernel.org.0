Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3C0351B95
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236770AbhDASI5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:08:57 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:19744 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237779AbhDASEY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 14:04:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617300265; x=1648836265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XhzC42OpEuuZbRiFkhPyJBwbf2DhtCryGSIJP5xQ8GU=;
  b=B+LYfF/DH505Hxs39Y/0+KyKuroRzohIJD8DVzKl4PGXM0jzAXMo0CHJ
   DgAmlyMvWH5FijDNy/28KsuU9msGvslb0YjP89Lr3nMoKyBJGK45/gsRI
   G/gv8rWO9L5wTlogT6o3Yz4dxugiBCVuy+Qu5Y+gNNF+ydjKCEBtf4rJx
   RdIsYxM3ujE59LeuIwYbTS6NrHjJFH9ThAufGqvDvKkYn/v90qN45QUcM
   uH1R1JW22YdP0nAGqo1cZTWTus6q+9O+WR9txzBUYS1fIQUdP8ywZkJx3
   hNhHPD5esjXP8ZhwkFFuaxXPSbHJYM17mFQmr3gYFTEKyo7PMNhnznPin
   A==;
IronPort-SDR: +o8ycAI5mnJ5QRwL5cPiEwkq6mnsQYtDiUNWm1eSY+OI+ppWNLoD+867TnwLQm8sQJPaALldH+
 AL1yOuE/rPQdUjdxxwVMacYUpXBetb/TcVaCgQVYwhIVYe1XPAfcepy390NmygU3joAy7VCU/b
 t5iarpO8TG+WCdMM6fMyfE4PECM7hHq41PH/MTWOwSOyl3mEf99GADqjEYs5/lXYUU87fDupkN
 sa9Oo5PVSAjlEEX5o+gm4tXUXZDlpu4MpYWTKwBgrLCSssqKqS4+NvpVUhyfm10Lj/q5tbZQHa
 zpU=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="109338449"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:30:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:30:38 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:30:32 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 12/30] media: atmel: atmel-isc: add RLP to register offsets
Date:   Thu, 1 Apr 2021 14:27:05 +0300
Message-ID: <20210401112723.189107-13-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401112723.189107-1-eugen.hristev@microchip.com>
References: <20210401112723.189107-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add rlp to the reg offsets struct.
This will allow different products to have a different reg offset for this
particular module.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c    | 4 ++--
 drivers/media/platform/atmel/atmel-isc-regs.h    | 2 ++
 drivers/media/platform/atmel/atmel-isc.h         | 2 ++
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 1 +
 4 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index b2067d75499b..317172959370 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -718,8 +718,8 @@ static int isc_configure(struct isc_device *isc)
 
 	regmap_update_bits(regmap, ISC_PFE_CFG0, mask, pfe_cfg0);
 
-	regmap_update_bits(regmap, ISC_RLP_CFG, ISC_RLP_CFG_MODE_MASK,
-			   rlp_mode);
+	regmap_update_bits(regmap, ISC_RLP_CFG + isc->offsets.rlp,
+			   ISC_RLP_CFG_MODE_MASK, rlp_mode);
 
 	regmap_write(regmap, ISC_DCFG, dcfg);
 
diff --git a/drivers/media/platform/atmel/atmel-isc-regs.h b/drivers/media/platform/atmel/atmel-isc-regs.h
index 04839def6ef6..2205484e04fc 100644
--- a/drivers/media/platform/atmel/atmel-isc-regs.h
+++ b/drivers/media/platform/atmel/atmel-isc-regs.h
@@ -204,6 +204,8 @@
 /* Subsampling 4:2:2 to 4:2:0 Control Register */
 #define ISC_SUB420_CTRL 0x000003cc
 
+/* Offset for RLP register specific to sama5d2 product */
+#define ISC_SAMA5D2_RLP_OFFSET	0
 /* Rounding, Limiting and Packing Configuration Register */
 #define ISC_RLP_CFG     0x000003d0
 
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index fb7257872e7c..b7d4e7fab570 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -150,12 +150,14 @@ struct isc_ctrls {
  * @cbc:		Offset for the CBC register
  * @sub422:		Offset for the SUB422 register
  * @sub420:		Offset for the SUB420 register
+ * @rlp:		Offset for the RLP register
  */
 struct isc_reg_offsets {
 	u32 csc;
 	u32 cbc;
 	u32 sub422;
 	u32 sub420;
+	u32 rlp;
 };
 
 /*
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index 1bf83959a9e4..32c05eb1c16d 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -234,6 +234,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->offsets.cbc = ISC_SAMA5D2_CBC_OFFSET;
 	isc->offsets.sub422 = ISC_SAMA5D2_SUB422_OFFSET;
 	isc->offsets.sub420 = ISC_SAMA5D2_SUB420_OFFSET;
+	isc->offsets.rlp = ISC_SAMA5D2_RLP_OFFSET;
 
 	/* sama5d2-isc - 8 bits per beat */
 	isc->dcfg = ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
-- 
2.25.1

