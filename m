Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92E3B3543C7
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 17:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235620AbhDEPzb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 11:55:31 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:5505 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235453AbhDEPzb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 11:55:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617638126; x=1649174126;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WRIebXFvjjcSVnO4hnmeCXGIzcHqfruIuVllDsesgsY=;
  b=g88Ums+jyG988iZZpoMo1+uHPO/Ts5EQ4uWTM6YNk6lunt+6dYFhl7To
   AbrvbWdhz2VBYZhuH7HzuycYxBFmKZ2psWBIMmFFMm4vk01CMGeLMVH+d
   mn4EAWRTjxBSWcMFit3U6FqPiV2ShDrx/R1DLKWwWMMY7hNhuasiWL59T
   49ibR4TfEG9d7nd+3xo0HTZKzxD8kzliD4939MInUei5SyKPsTg63NkZO
   p6SJNLsvNnuN65jQcrA9Nttb7ehMj4r+xSJqW/W8suqK8wQiqFvQ9/oWL
   9o6proR2xlhBUFR9WrKLydkNi+O9domSgcNcqW4dFi5siEodsFhud3idE
   A==;
IronPort-SDR: pYyq9H5j15U1kVIjYToa5ubtIbvuki7YCNB9QHQ5yDvETVQirLOTkgk6e+11xs6dvlDJkhGYHu
 123MQkLY78y1ZyYq9AHv9vImGXzjihuB4TTuQbc4EQTcqBFUGMFo1R9miOO9x6RS7sRgNA92Hi
 m06iGGgh9Z4mpXd9P7/5yZ1yf0dengewwD6k4GRne9Ca7MvsvXxQMwEeqfb1pcRn5NxKLbs2fe
 hw+WoK4HfiGofEsAkCnOpVFT5BAyFqcuhWLPkOvtp8PVmG/KwIIUn5W/2EfoEVAHRMSYgau0SU
 M3Q=
X-IronPort-AV: E=Sophos;i="5.81,307,1610434800"; 
   d="scan'208";a="115341801"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2021 08:55:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 08:55:24 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Apr 2021 08:55:07 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 16/30] media: atmel: atmel-isc: add his_entry to register offsets
Date:   Mon, 5 Apr 2021 18:50:51 +0300
Message-ID: <20210405155105.162529-17-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405155105.162529-1-eugen.hristev@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
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

