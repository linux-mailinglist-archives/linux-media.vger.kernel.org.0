Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA3953543EF
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 17:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239385AbhDEP6v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 11:58:51 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:36706 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238110AbhDEP6v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 11:58:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617638325; x=1649174325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JB3dr1U/DWt6qBqOVHSGXJCImGHTndPyXb9YXu64Mas=;
  b=Ax6og4SLW0hgQaymfBw0bWOZFRuSs8X6M7dEmmlfnEyVC8FbbuI0oL8M
   7RKd5/FtFyS7AL5sRWNhRFZoVMr+tFjAifJej6y+VKFKh69HmGV+UzM5n
   5tu9ljXYeruEreS1CgGDGepQglvaLo8eMTeHGYyMwuWEWkMFznO7g4PxX
   fH+8BT5vqoveIu+XbIZVxxhUeNVpwFsUtLLhFf3rEqm7Y0i3lGb/p8Xb5
   7w+FS40U497b1E6h1J3m0WPQu3RdQy0GvJMREaWbhvqgxGWv5Vgli3o6s
   RTWbxSyAiXSYHoO5SGNZvKz5/7fzLyF4MVabm3jdyUbFjoa/AKfdR/m70
   A==;
IronPort-SDR: 9/jxeI8/LRrrN+Dtft/TboiQNFFs4IBBcAqcCQKFaYQ7NWiwmZzkv2Hv5dIYCwDCjmo5B1G+7n
 M86IzkJB31e9zB7gTzKmH2An/SpVd3xnWUv0GBuEO85ty6Gc0ABK1TwoAvwNGrcaqBr0Tdhud/
 HXMXVEHXqTaE2XEYPeXfeOnFrrUvmMzKH0lIsaXQ+we2FDM7wBu7Nph6sV3DzbnHL2pR7hJkPb
 fVYOhu93+nhZdE/mYDTa36tkOsSFFFMH1nFOiLBud4MiwDNLXQE7I6kMjW6v2pb89TdyVMbbF2
 Mi0=
X-IronPort-AV: E=Sophos;i="5.81,307,1610434800"; 
   d="scan'208";a="112482201"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2021 08:58:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 08:58:44 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Apr 2021 08:58:13 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 26/30] media: atmel: atmel-isc-regs: add additional fields for sama7g5 type pipeline
Date:   Mon, 5 Apr 2021 18:51:01 +0300
Message-ID: <20210405155105.162529-27-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405155105.162529-1-eugen.hristev@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add additional fields for registers present in sama7g5 type pipeline.
Extend register masks for additional bits in sama7g5 type pipeline registers.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-regs.h | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-regs.h b/drivers/media/platform/atmel/atmel-isc-regs.h
index 457eed74cda9..5f99bf7717c1 100644
--- a/drivers/media/platform/atmel/atmel-isc-regs.h
+++ b/drivers/media/platform/atmel/atmel-isc-regs.h
@@ -289,8 +289,18 @@
 #define ISC_RLP_CFG_MODE_ARGB32         0xa
 #define ISC_RLP_CFG_MODE_YYCC           0xb
 #define ISC_RLP_CFG_MODE_YYCC_LIMITED   0xc
+#define ISC_RLP_CFG_MODE_YCYC           0xd
 #define ISC_RLP_CFG_MODE_MASK           GENMASK(3, 0)
 
+#define ISC_RLP_CFG_LSH			BIT(5)
+
+#define ISC_RLP_CFG_YMODE_YUYV		(3 << 6)
+#define ISC_RLP_CFG_YMODE_YVYU		(2 << 6)
+#define ISC_RLP_CFG_YMODE_VYUY		(0 << 6)
+#define ISC_RLP_CFG_YMODE_UYVY		(1 << 6)
+
+#define ISC_RLP_CFG_YMODE_MASK		GENMASK(7, 6)
+
 /* Offset for HIS register specific to sama5d2 product */
 #define ISC_SAMA5D2_HIS_OFFSET	0
 /* Histogram Control Register */
@@ -332,13 +342,15 @@
 #define ISC_DCFG_YMBSIZE_BEATS4         (0x1 << 4)
 #define ISC_DCFG_YMBSIZE_BEATS8         (0x2 << 4)
 #define ISC_DCFG_YMBSIZE_BEATS16        (0x3 << 4)
-#define ISC_DCFG_YMBSIZE_MASK           GENMASK(5, 4)
+#define ISC_DCFG_YMBSIZE_BEATS32        (0x4 << 4)
+#define ISC_DCFG_YMBSIZE_MASK           GENMASK(6, 4)
 
 #define ISC_DCFG_CMBSIZE_SINGLE         (0x0 << 8)
 #define ISC_DCFG_CMBSIZE_BEATS4         (0x1 << 8)
 #define ISC_DCFG_CMBSIZE_BEATS8         (0x2 << 8)
 #define ISC_DCFG_CMBSIZE_BEATS16        (0x3 << 8)
-#define ISC_DCFG_CMBSIZE_MASK           GENMASK(9, 8)
+#define ISC_DCFG_CMBSIZE_BEATS32        (0x4 << 8)
+#define ISC_DCFG_CMBSIZE_MASK           GENMASK(10, 8)
 
 /* DMA Control Register */
 #define ISC_DCTRL       0x000003e4
-- 
2.25.1

