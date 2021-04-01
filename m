Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE8CA351A7C
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235378AbhDASBn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:01:43 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:1272 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235352AbhDAR6J (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 13:58:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617299889; x=1648835889;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4b/HIspMjMe9EaUqpqUCEm+c5tUwE7L+PCPp/jb42Rw=;
  b=FWDnVqZv39cgRL9B896gzrEVw3TlkH0dHgBcQn9VP0Rw3tt++UD0OgHu
   3cTOPbpa6F8cKbe006x4Xu5KDLrPwRD0vqPcbT4G7RrMcmj9RqLxNFWsg
   w3ANIXMUlpSY8l1hkrWUxCcuzrip3JTHicDyQg1ouBx1MLB46L7IdnEwS
   fY6PQUPQxpI34ivQWVDXdWrsSEn5wkIYBReFf/c5S4glZrWafgkrZ4Cpg
   rQVqDW/eafdD+HcHrnfr5OSLvyzSupIcxY6iWzi6Lu+2x1fb3H6NKLsTL
   4gztNgWlJGAqhRqsAsM1v2q0Q78MRUjk8BA7mzTcUZMtedCIfJ/OEFVNt
   A==;
IronPort-SDR: 3hCNdH3UU/E4IwG4WTukniJTubDVLPWK8Y5dpaofTQCKmjrMxrZZumx4MhleX2RAGJgxPOxMXt
 c4tbdNtPxgBm/r2zICOwMzjrq/f2sxxEIkaebdkMv2g3SXoMmRQQZcz/yekRp1F+jhRtRb+ie2
 fafjANLPapeqVlQsedeihruhm3QJL+mRh80pOMC5mavH6nXAe7e8lL1pQLDOHjziuA1HXtVk17
 URBYIN0M2JVM+GXAbBb/lOjmkF7siw4b1AV6CAsW6e8/+tj2+dzy7R3cbQvdXegyNNXQi5ghRc
 Xn8=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="49671243"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:34:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:34:34 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:34:33 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 29/30] media: atmel: atmel-isc-sama5d2: remove duplicate define
Date:   Thu, 1 Apr 2021 14:27:22 +0300
Message-ID: <20210401112723.189107-30-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401112723.189107-1-eugen.hristev@microchip.com>
References: <20210401112723.189107-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove a duplicate definition of clock max divider

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index c5687fb5b022..b34c3ab0b888 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -52,8 +52,6 @@
 #define ISC_SAMA5D2_MAX_SUPPORT_WIDTH   2592
 #define ISC_SAMA5D2_MAX_SUPPORT_HEIGHT  1944
 
-#define ISC_CLK_MAX_DIV		255
-
 #define ISC_SAMA5D2_PIPELINE \
 	(WB_ENABLE | CFA_ENABLE | CC_ENABLE | GAM_ENABLES | CSC_ENABLE | \
 	CBC_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
-- 
2.25.1

