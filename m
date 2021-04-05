Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5C723543CA
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 17:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235896AbhDEPzz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 11:55:55 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:43539 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235453AbhDEPzz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 11:55:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617638148; x=1649174148;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eEFZK/hSf05itEILHRf197/MjzOOVQu1dFzDN6v4vnA=;
  b=tLii0qJkmhHDewF2pH7YZyGgKR4j2HN1OnNg/uGbGerVzzZ3n78mS3dy
   JkILF89K2a0aMgG25axcZBrYM4tPMWYK7aamQUcy7WhWbTeC7YCQ07bjU
   2EpPQ7oTP+BXgXfF3VPlX9vlsp5fKdv49HEFMUs1mY0Fd1iZ7pDARDRqk
   TQdr2t0WGBXsIiO1+kHTMTCZA1YTXL1ms3ZoT+OH98M6IGAW+meozH26Z
   Z6DwsR85stKjMczaSYaHnaWfATmN3JQJbY9da+YZ9Ko2ONfHA1V37DRZO
   K/3NeDWnY3SNwURjgEbLTXqdZn8Ibkddi1h5bweAUwmQtGicWn1WedT9R
   w==;
IronPort-SDR: ycrgj04Sxxhrqe8UkRP/OOKVdx4UcTmq5SAChhZyl+oFtSqnxdEYpCeESfqnpRFMOJohei5aYa
 s9NXRrgIaJvsiSDqIS413pjN2SdRJkI2769jRsZw7yh+MLj0ox6+2KXKMmr9Ux/BcIZDDH0yjB
 96BKwgP3eOcx5aY77PSz/epp24G6wRxZ4GIt5xwtHbh2/z2AoNK5j3rBJJll6Ym8w2jCzKOlQw
 oErniOkO5qPCdhUg+ehhXSe+/yVriyFKYzqHp/nyungw1L4+egtt3EYJWZjIBjzKvaGKsJ0tQb
 l+Y=
X-IronPort-AV: E=Sophos;i="5.81,307,1610434800"; 
   d="scan'208";a="115869574"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2021 08:55:48 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 08:55:48 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Apr 2021 08:55:27 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 17/30] media: atmel: atmel-isc: add register description for additional modules
Date:   Mon, 5 Apr 2021 18:50:52 +0300
Message-ID: <20210405155105.162529-18-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405155105.162529-1-eugen.hristev@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add register description for additional pipeline modules: the
Defective Pixel Correction (DPC) and the Vertical and Horizontal Scaler(VHXS)

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-regs.h | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/media/platform/atmel/atmel-isc-regs.h b/drivers/media/platform/atmel/atmel-isc-regs.h
index a15c13e1a833..457eed74cda9 100644
--- a/drivers/media/platform/atmel/atmel-isc-regs.h
+++ b/drivers/media/platform/atmel/atmel-isc-regs.h
@@ -90,6 +90,46 @@
 #define ISC_INT_DDONE		BIT(8)
 #define ISC_INT_HISDONE		BIT(12)
 
+/* ISC DPC Control Register */
+#define ISC_DPC_CTRL	0x40
+
+#define ISC_DPC_CTRL_DPCEN	BIT(0)
+#define ISC_DPC_CTRL_GDCEN	BIT(1)
+#define ISC_DPC_CTRL_BLCEN	BIT(2)
+
+/* ISC DPC Config Register */
+#define ISC_DPC_CFG	0x44
+
+#define ISC_DPC_CFG_BAYSEL_SHIFT	0
+
+#define ISC_DPC_CFG_EITPOL		BIT(4)
+
+#define ISC_DPC_CFG_TA_ENABLE		BIT(14)
+#define ISC_DPC_CFG_TC_ENABLE		BIT(13)
+#define ISC_DPC_CFG_TM_ENABLE		BIT(12)
+
+#define ISC_DPC_CFG_RE_MODE		BIT(17)
+
+#define ISC_DPC_CFG_GDCCLP_SHIFT	20
+#define ISC_DPC_CFG_GDCCLP_MASK		GENMASK(22, 20)
+
+#define ISC_DPC_CFG_BLOFF_SHIFT		24
+#define ISC_DPC_CFG_BLOFF_MASK		GENMASK(31, 24)
+
+#define ISC_DPC_CFG_BAYCFG_SHIFT	0
+#define ISC_DPC_CFG_BAYCFG_MASK		GENMASK(1, 0)
+/* ISC DPC Threshold Median Register */
+#define ISC_DPC_THRESHM	0x48
+
+/* ISC DPC Threshold Closest Register */
+#define ISC_DPC_THRESHC	0x4C
+
+/* ISC DPC Threshold Average Register */
+#define ISC_DPC_THRESHA	0x50
+
+/* ISC DPC STatus Register */
+#define ISC_DPC_SR	0x54
+
 /* ISC White Balance Control Register */
 #define ISC_WB_CTRL     0x00000058
 
@@ -153,6 +193,33 @@
 /* ISC_Gamma Correction Green Entry Register */
 #define ISC_GAM_RENTRY	0x00000298
 
+/* ISC VHXS Control Register */
+#define ISC_VHXS_CTRL	0x398
+
+/* ISC VHXS Source Size Register */
+#define ISC_VHXS_SS	0x39C
+
+/* ISC VHXS Destination Size Register */
+#define ISC_VHXS_DS	0x3A0
+
+/* ISC Vertical Factor Register */
+#define ISC_VXS_FACT	0x3a4
+
+/* ISC Horizontal Factor Register */
+#define ISC_HXS_FACT	0x3a8
+
+/* ISC Vertical Config Register */
+#define ISC_VXS_CFG	0x3ac
+
+/* ISC Horizontal Config Register */
+#define ISC_HXS_CFG	0x3b0
+
+/* ISC Vertical Tap Register */
+#define ISC_VXS_TAP	0x3b4
+
+/* ISC Horizontal Tap Register */
+#define ISC_HXS_TAP	0x434
+
 /* Offset for CSC register specific to sama5d2 product */
 #define ISC_SAMA5D2_CSC_OFFSET	0
 
-- 
2.25.1

