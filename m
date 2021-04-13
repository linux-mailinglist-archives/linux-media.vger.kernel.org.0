Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA9E535DD32
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238660AbhDMLCw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:02:52 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:24194 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344859AbhDMLCd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:02:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311733; x=1649847733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WRIebXFvjjcSVnO4hnmeCXGIzcHqfruIuVllDsesgsY=;
  b=1yMoVPKqV35OJwDKlgJ2PlUWTktVVeZ1OXJOSxuQbTQwpSFpemAo9Tpn
   06bcDQuHHISjWifS8Rvo38JIiLzWKDi/Cr1BK3Gzen402jZaTDW1an8pH
   jmFxoic1fCssXqJoksrf6wgo14LZs9lMjYUU34Rykj9I9hxj92kvawRDH
   +dOAG6J61aHeFVpob7GQwSQ4yNBATkdkVhl9R2Ff8nJ0rFmdR6T6eVj41
   Z8Mh7FdJaoKXfCxW2hmIg/xwSDb3J9LgM8lb17z/VijEWKNuh9ZYemGAG
   sJxvh2035Q2ZLMCNAcOw+SGbmb31kI7tbbAkkZNe7O8NsuwuhRXDRwg1R
   g==;
IronPort-SDR: tCWjPusKC4IBHeqiHnxIokd2wXp6mqxY7mwwxJq8foWbm8Y3d8NZCr6lOGITwqONjDSD6s/zD2
 thtRKhYXbnyt9Jp7s8eNjBut5snuH9IaM/As/8vrBVYq9SUHOq4Ei8OdioHXjlTrdlMaqRkVLx
 o5QYRVSQ6x6XvBviZxl+Twl9em/WFAolIvLKxNWbo5N/JyzJnKXVvmE1+p8fsfeobqtHxHZO0m
 GzB2mBMVauYjGYr/Y6siwdc/Ed6PVL/FIEAKESx0yOno2XMyyHl95MoRFadeQ9VTywkgOuZg19
 pRs=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="110611986"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 04:02:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 04:02:11 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 04:02:04 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 16/33] media: atmel: atmel-isc: add his_entry to register offsets
Date:   Tue, 13 Apr 2021 13:57:14 +0300
Message-ID: <20210413105731.610028-17-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-1-eugen.hristev@microchip.com>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add his_entry to the reg offsets struct.
This will allow different products to have a different reg offset for this
particular module.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c    | 3 ++-
 drivers/media/platform/atmel/atmel-isc-regs.h    | 2 ++
 drivers/media/platform/atmel/atmel-isc.h         | 2 ++
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 1 +
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 11121943d2cb..2a619eef6aa3 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -1672,7 +1672,8 @@ static void isc_hist_count(struct isc_device *isc, u32 *min, u32 *max)
 	*min = 0;
 	*max = HIST_ENTRIES;
 
-	regmap_bulk_read(regmap, ISC_HIS_ENTRY, hist_entry, HIST_ENTRIES);
+	regmap_bulk_read(regmap, ISC_HIS_ENTRY + isc->offsets.his_entry,
+			 hist_entry, HIST_ENTRIES);
 
 	*hist_count = 0;
 	/*
diff --git a/drivers/media/platform/atmel/atmel-isc-regs.h b/drivers/media/platform/atmel/atmel-isc-regs.h
index 344668dcfcf4..a15c13e1a833 100644
--- a/drivers/media/platform/atmel/atmel-isc-regs.h
+++ b/drivers/media/platform/atmel/atmel-isc-regs.h
@@ -300,6 +300,8 @@
 /* Version Register */
 #define ISC_VERSION	0x0000040c
 
+/* Offset for version register specific to sama5d2 product */
+#define ISC_SAMA5D2_HIS_ENTRY_OFFSET	0
 /* Histogram Entry */
 #define ISC_HIS_ENTRY	0x00000410
 
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index 676a5be1ee8c..c5d956fd20a0 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -154,6 +154,7 @@ struct isc_ctrls {
  * @his:		Offset for the HIS related registers
  * @dma:		Offset for the DMA related registers
  * @version:		Offset for the version register
+ * @his_entry:		Offset for the HIS entries registers
  */
 struct isc_reg_offsets {
 	u32 csc;
@@ -164,6 +165,7 @@ struct isc_reg_offsets {
 	u32 his;
 	u32 dma;
 	u32 version;
+	u32 his_entry;
 };
 
 /*
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index 10b70d4b04c4..0ff13198d732 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -242,6 +242,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->offsets.his = ISC_SAMA5D2_HIS_OFFSET;
 	isc->offsets.dma = ISC_SAMA5D2_DMA_OFFSET;
 	isc->offsets.version = ISC_SAMA5D2_VERSION_OFFSET;
+	isc->offsets.his_entry = ISC_SAMA5D2_HIS_ENTRY_OFFSET;
 
 	/* sama5d2-isc - 8 bits per beat */
 	isc->dcfg = ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
-- 
2.25.1

