Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 054A144E8DE
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 15:29:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235236AbhKLOcl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 09:32:41 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:55353 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235145AbhKLOck (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 09:32:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636727390; x=1668263390;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QIlW9DbBMZJ7+M6XfWg1v8S4XbzujCKrn+C7a3HwsDQ=;
  b=l+ToTLLqCnDdoArPjyqsDL4lsYyequTKJJ89+Re5rWMs23xCvQ/66Zmz
   ps1SODbKKOqJuDTPNXqVviPrdpNT0HSZ836gIklMw+79TtXE1m1Fkt5qh
   4KfHjUdR761sI4gi/jV1OGw7R91zgtUl+vEqG35fTQGcSikIjyB41+mDU
   y6LX5CQSW8xjkBm5PMvrxz6/z+C+UU0nP+q72BHN4vOrihLX5FbQ8rlBN
   DxjCRaJwCoXGUdyaV8NMQPj2v6SkBecJ4DfPpgI0KaXCwumXKK/8s7ofH
   QOZcyxOPqNvRtkOO5JqryOWxE2WnPtjHK5vD1fUhejfoZJVmrBA9Tqeyc
   g==;
IronPort-SDR: amcE6qChjDHJVsWno9I8haaxsWfs4Nq3Zln7Jonw8COAxN7TF5CDs+QM5utbGdQlyT476q15YP
 p9Ixc05GzgVNahRSlt4s0pRIQkuyLs/xvsz/k8YDqs1eWKhhBXiWkjzexc0nlL2oG44qllqSbk
 rdY/+WsBZqOkMoadZk1x2oIKpxZGfbEtf6Z++kd0q5v0aOdw9Si+cjpHJ1zQvmWGTOxoRZUHUa
 NJxE5SO7gECXASlLHR5i361G0JLL5x+FhjxBvBsFzFn1QT/bgzdCRAEbUupHCwfDZ6yeGLchZo
 qITu8T0j/YyFANU3OxQxqihH
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="136388105"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Nov 2021 07:29:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 12 Nov 2021 07:29:49 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 12 Nov 2021 07:29:37 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jacopo@jmondi.org>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 18/25] media: atmel: atmel-sama5d2-isc: fix wrong mask in YUYV format check
Date:   Fri, 12 Nov 2021 16:25:02 +0200
Message-ID: <20211112142509.2230884-19-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112142509.2230884-1-eugen.hristev@microchip.com>
References: <20211112142509.2230884-1-eugen.hristev@microchip.com>
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
index a3e4c32a66c4..a8d4ba60d3ac 100644
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

