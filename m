Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5062C351B74
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237694AbhDASIm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:08:42 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:19898 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236389AbhDASCY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 14:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617300144; x=1648836144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AQJEQgxg0dYK65pobo2TAYjrkhPkUnYyMd5LnexLNkE=;
  b=PAeYdoyFknBh07bZCFZgDsmn7O5ZIRv2fAQVOVC16jbOOArpo67AyC24
   04gyYNW9Lgs4OcsuUvDAxhjCZh87UuQlmi63Kc+XryYuZtkaTsPGUlIWz
   22LKlloGr1FLOhet7f3MD2Zc6nreXXP6OzgVaaOQHcirMWTYhkO/buCBl
   C24HtmwNxdWg7k1ILoa7yqoKkkTZlXTQjKAFVamnZ2Xa2a8OIE9lUN3Pp
   dXixxuROM7NoYMXHq9rPq5XFl75G66tsXE50r7B3lfHw5vaugVIFMc4UR
   aJQoB6UPxAsuR50NsK+1sYLNAGR6BbjXAthBL9Ea7sXRIKiIanAE9Y5Bw
   Q==;
IronPort-SDR: aHuXYiIkgG1ikQoj79SNHlhLiI0ZGhUhou2fTuJY15le9MnJe5LjgAahaPrlkCiDJ0Mv8rVIl2
 1tJ28oSSALsD/F2wBAuhI0MYM0tfru5E5cIHEJsTYsgoHbVAY6llasMbNJsCyxyU3NWs19SvQ1
 Akog63QJo5VhTLxHs7EZ0/6cd+Xf+/oUpSG0btxjswYGUNpVS0mwJdbfatBT+YF72dT3D82j1+
 AcctcWsYIuiB8eaCvLlqLNhm0VQDNHngDdfwDsch3Nik+5+j4vsidn5xijSPTRBnl4/u2VeYDN
 9+E=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="109338418"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:30:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:30:31 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:30:22 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 11/30] media: atmel: atmel-isc: add SUB422 and SUB420 to register offsets
Date:   Thu, 1 Apr 2021 14:27:04 +0300
Message-ID: <20210401112723.189107-12-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401112723.189107-1-eugen.hristev@microchip.com>
References: <20210401112723.189107-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add sub420 and sub422 to the reg offsets struct.
This will allow different products to have a different reg offset for these
particular modules.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c    | 4 ++--
 drivers/media/platform/atmel/atmel-isc-regs.h    | 4 ++++
 drivers/media/platform/atmel/atmel-isc.h         | 4 ++++
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 2 ++
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index d4bf7fd5929f..b2067d75499b 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -2311,8 +2311,8 @@ int isc_pipeline_init(struct isc_device *isc)
 		REG_FIELD(ISC_GAM_CTRL, 3, 3),
 		REG_FIELD(ISC_CSC_CTRL + isc->offsets.csc, 0, 0),
 		REG_FIELD(ISC_CBC_CTRL + isc->offsets.cbc, 0, 0),
-		REG_FIELD(ISC_SUB422_CTRL, 0, 0),
-		REG_FIELD(ISC_SUB420_CTRL, 0, 0),
+		REG_FIELD(ISC_SUB422_CTRL + isc->offsets.sub422, 0, 0),
+		REG_FIELD(ISC_SUB420_CTRL + isc->offsets.sub420, 0, 0),
 	};
 
 	for (i = 0; i < ISC_PIPE_LINE_NODE_NUM; i++) {
diff --git a/drivers/media/platform/atmel/atmel-isc-regs.h b/drivers/media/platform/atmel/atmel-isc-regs.h
index a5e2fe01ba9f..04839def6ef6 100644
--- a/drivers/media/platform/atmel/atmel-isc-regs.h
+++ b/drivers/media/platform/atmel/atmel-isc-regs.h
@@ -194,9 +194,13 @@
 #define ISC_CBC_CONTRAST	0x000003c0
 #define ISC_CBC_CONTRAST_MASK	GENMASK(11, 0)
 
+/* Offset for SUB422 register specific to sama5d2 product */
+#define ISC_SAMA5D2_SUB422_OFFSET	0
 /* Subsampling 4:4:4 to 4:2:2 Control Register */
 #define ISC_SUB422_CTRL 0x000003c4
 
+/* Offset for SUB420 register specific to sama5d2 product */
+#define ISC_SAMA5D2_SUB420_OFFSET	0
 /* Subsampling 4:2:2 to 4:2:0 Control Register */
 #define ISC_SUB420_CTRL 0x000003cc
 
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index b1fe93c93c61..fb7257872e7c 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -148,10 +148,14 @@ struct isc_ctrls {
  * struct isc_reg_offsets - ISC device register offsets
  * @csc:		Offset for the CSC register
  * @cbc:		Offset for the CBC register
+ * @sub422:		Offset for the SUB422 register
+ * @sub420:		Offset for the SUB420 register
  */
 struct isc_reg_offsets {
 	u32 csc;
 	u32 cbc;
+	u32 sub422;
+	u32 sub420;
 };
 
 /*
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index 275999314e61..1bf83959a9e4 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -232,6 +232,8 @@ static int atmel_isc_probe(struct platform_device *pdev)
 
 	isc->offsets.csc = ISC_SAMA5D2_CSC_OFFSET;
 	isc->offsets.cbc = ISC_SAMA5D2_CBC_OFFSET;
+	isc->offsets.sub422 = ISC_SAMA5D2_SUB422_OFFSET;
+	isc->offsets.sub420 = ISC_SAMA5D2_SUB420_OFFSET;
 
 	/* sama5d2-isc - 8 bits per beat */
 	isc->dcfg = ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
-- 
2.25.1

