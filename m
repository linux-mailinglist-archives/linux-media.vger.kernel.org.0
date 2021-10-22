Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38C6543734F
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 09:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232615AbhJVH5Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 03:57:24 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:47680 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232663AbhJVH5I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 03:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634889291; x=1666425291;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D0ieQhGQKRttt8Quef04SMrFGlqdtCHyoWYWeCfMDGk=;
  b=j5ywe2B79kAL8/06eutj2WJYe+fbw/DH70oUL4cgUVqkHiMrt8gX4TIA
   I8A1zeZgDejD+P4SwDpKGwGhxKvfWg8FyqIMYR6CiUZhyO4S8qkTI1AEi
   CjG9uefCH1gE10cN6fT/xm7jy+z45QSW6Ui1fmjEZkupNszjV4+LUYa1F
   hihRjGv1WoBuFrhax0AcjjWjv+w0y85mrFfg18EpS03GdZ4wYViPHyPs4
   Y9Vg5Ej8H+OxX1YBKFr1qhErUlnHpRnS/V8IsFYQPfeA5lFd0mvXrXW8B
   vWXeCLxCGbzN7rnwdmmWXIzG/k5nJYOL+vP+E+vPN6ZM6B8vVRlYWv/fI
   A==;
IronPort-SDR: YHOphYOD3Hes4fbLfCeCzTP158oEPByAbT/aC+ooqTu6zMPxpa/GuRvA/883Rl3Agc7hcrmnLX
 7u1uiSzGXTlyiXCag9R4wcv5BwI65XEDFbiUoU6Ni2ABFw0dnPYSz7qBZro1ydFdWCY4nPRcuF
 dsT3oou+7Hb3qbqzCWESmf8s6KcyN4CYs3/KEJmikScSFcTyRe4Xo7yOJHw+gRXJxRKSgsliFF
 kvW9mgLEmcRkujkWaVsFcD4OGd3BbyvlWFfk0AUs4nMVIMRNTufVSthBT5uBWIEGok36l3/3Zz
 VaeGt6YLMoXZtzKxl9M9di2x
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="134007238"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Oct 2021 00:54:50 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 00:54:50 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 00:54:47 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <jacopo@jmondi.org>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 18/21] media: atmel: atmel-sama5d2-isc: fix wrong mask in YUYV format check
Date:   Fri, 22 Oct 2021 10:52:44 +0300
Message-ID: <20211022075247.518880-19-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022075247.518880-1-eugen.hristev@microchip.com>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While this does not happen in production, this check should be done
versus the mask, as checking with the YCYC value may not include
some bits that may be set.
Is it correct and safe to check the whole mask.

Fixes: 123aaf816b95 ("media: atmel: atmel-sama5d2-isc: fix YUYV format")
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index 8c088ad899ea..6c9c5fb041d7 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -267,7 +267,7 @@ static void isc_sama5d2_config_rlp(struct isc_device *isc)
 	 * Thus, if the YCYC mode is selected, replace it with the
 	 * sama5d2-compliant mode which is YYCC .
 	 */
-	if ((rlp_mode & ISC_RLP_CFG_MODE_YCYC) == ISC_RLP_CFG_MODE_YCYC) {
+	if ((rlp_mode & ISC_RLP_CFG_MODE_MASK) == ISC_RLP_CFG_MODE_YCYC) {
 		rlp_mode &= ~ISC_RLP_CFG_MODE_MASK;
 		rlp_mode |= ISC_RLP_CFG_MODE_YYCC;
 	}
-- 
2.25.1

