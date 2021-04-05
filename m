Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD473543B4
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 17:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236185AbhDEPyP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 11:54:15 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:14593 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238204AbhDEPyO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 11:54:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617638048; x=1649174048;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JqXfHp4bsUuUwj+v0W0xbdRUW7UuWTLQzGx+Q3UCSH4=;
  b=bsbL0/WhATgxgUormaSvMxgS2uAS46jHHhmz7qwfU7tzUMNcrFdXNbdW
   RnFU+YO7zMUUNNLrJhOda3OAzz++wEYj9uKX3SS+JjVT/mYbMeAQABueU
   vQkNjZ5yQKRdrkXhZKXnSmoW9SEzqWUziWIS3QlnLCieUFsWmvaTJVbZf
   FAZ7M1KQYmXkcdQ1JxqwGeH+DHpGBQ3Mj4nbKODiDjbuzSU5nYMk/myVC
   fW73xj07Ya6/Y6L+GVLsYFwrmV37GWSkGLRHn67FmhrKcB1geSQYUaqx6
   wvhP/DFZNRmQDad7Njg+kkz0vddoDEd0qn/m0muM4f9fAJMiqOAy/fPps
   g==;
IronPort-SDR: sxeWNe39TcMN4gP5R1V6YR9kI3AjiPT0R/IUY5R4mdBsbx4rOl3L2voHTbjsbJ+g3lc0m2vQqL
 p07H8RrySAkBEBmobvaqwpVBdI4TMszo2D/OI8sro1ZtzPcEaUVL4fLuXTO8jk9mM2G9hazg4A
 LQbbyr+WI8peSK0EXeN8O9DB63m85nBRzqz3BWjv6AAIJHwHP6N3Pi5Byq7/yRbAwzmEim5mSW
 ohsVlbIbH2JMyWuHXo2mAdAZN/zpVeSGZ7dYgoZOa8iFpWC8ykRSXvv8P2Sc2BGAidBqRvH/xi
 k1o=
X-IronPort-AV: E=Sophos;i="5.81,307,1610434800"; 
   d="scan'208";a="109700956"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2021 08:54:08 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 08:54:08 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Apr 2021 08:54:02 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 11/30] media: atmel: atmel-isc: add SUB422 and SUB420 to register offsets
Date:   Mon, 5 Apr 2021 18:50:46 +0300
Message-ID: <20210405155105.162529-12-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405155105.162529-1-eugen.hristev@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
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
index c3037244e01e..943793fbc791 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -235,6 +235,8 @@ static int atmel_isc_probe(struct platform_device *pdev)
 
 	isc->offsets.csc = ISC_SAMA5D2_CSC_OFFSET;
 	isc->offsets.cbc = ISC_SAMA5D2_CBC_OFFSET;
+	isc->offsets.sub422 = ISC_SAMA5D2_SUB422_OFFSET;
+	isc->offsets.sub420 = ISC_SAMA5D2_SUB420_OFFSET;
 
 	/* sama5d2-isc - 8 bits per beat */
 	isc->dcfg = ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
-- 
2.25.1

