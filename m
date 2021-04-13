Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 142FE35DD59
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345242AbhDMLE0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:04:26 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:41342 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345214AbhDMLEX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:04:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311844; x=1649847844;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JB3dr1U/DWt6qBqOVHSGXJCImGHTndPyXb9YXu64Mas=;
  b=oCrY6O5KJBcTk0FDJS2QeAGTDgDH0VKHdgVCp8DXmrPmUljxAEuSUkLC
   0OMiyi/THlBjqGWLyrRsmhLh5Q9Ys32lyIo0p0fw1OmwvdAtl5apBpZTC
   nCUmudwwgDDZzFYow4skUZbaxLjGL1LKsETT30+Ma5M73kMR7sofXGDdv
   /HeLg3LzhChFCZwCA5+yzsxIWgtneW700z1bKfxyN44bLI/b93yn0C7Fw
   WjXLNys3C4FtXQbCG6Z3Ay+vkzK/IruWQjMSCErj8BnaokJ3alVInBgb1
   IniHzHvijk1eL5ZIqGHmi2Dl4GKxwis/5PZjsNz9pkE65wjcXvyIiJ76k
   w==;
IronPort-SDR: l+2hnROyZWlN/Dpn77O7Lo0ARX/4QjzIlfRSjmtttKfMu6l5hIxLm4SXIIHeYouE20rWNjCzWG
 4Sg4do1R8zrfP6q3xNWQ2HoVQbO8jCtEhktt31rS3r6+jTfSTbVVyns7j024Ki88Haz0BS3yza
 byB6mChIQ+N76DxYjIVkTVokXinVhpyt8rFpIh4K4hv9yHdPtBHb+/dHFyi92yVHkbyV45/Q8I
 BrjLIbXLsBuV+avJrDUfOKh1ei2yscbAQrsr5aciVzw79dRjrC8Kz/Jou4RiZvhLWjvql2ZZps
 IGE=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="50928612"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 04:04:03 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 04:04:03 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 04:03:45 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 26/33] media: atmel: atmel-isc-regs: add additional fields for sama7g5 type pipeline
Date:   Tue, 13 Apr 2021 13:57:24 +0300
Message-ID: <20210413105731.610028-27-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-1-eugen.hristev@microchip.com>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
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

