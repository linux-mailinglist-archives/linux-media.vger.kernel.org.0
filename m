Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC03B3543F9
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 17:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239439AbhDEP7f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 11:59:35 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:42043 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238495AbhDEP7e (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 11:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617638368; x=1649174368;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=moq1d9N+xas3Sok1/bzQQTjVgaigAE5SM0QmiyTE3dk=;
  b=pboNS23tuDRkUNFMwezTc26F0oRBS2OUFbQK9YNSKSzEDnZ66hCz3T+J
   E8ocBGu8PUZcN84YmUrc0RvkXJ0hT/sK7obYdlMyntXorwx81Cm99lhs9
   1mOU84E6E6pWTwslrM6uhtw+M0AvNaFuxx7pc5ZB0yA6smbwBVY+aMix8
   Ix2A3PGf6pBkVv0WGDbr+0aNraeTj7ZcrfOMp2S8ISUkOiVAlBe+PKhMH
   z0xGnHmwfQqwAoOi5mHMcllHcTFP5Hdmtq7GArq6NHl95vGtaR4tk+aVZ
   lmEz731sKLOa2u7v+cfAz+mNGk+hjVd32h4b/B4Me1sQcahuOA8rjzfOk
   g==;
IronPort-SDR: 6eSdg6/WHlQA4dUWAQvmfrCLGERNpOgka/5Or0UKoAv/IGpnhb4iA4ii2UmRYmoy7NtO0g9lLj
 0+XjQAz1zv3Lha8i+NvsyJHZ7o/GTD/J6gNgyQ7jDk3n3girQcasqa2E33BzNHnRQ+OBfcO+TS
 /AMkaOIdNfycSi7Xu+XwsGcEcQwcVdW4mwOzmzhB1vBGB0wxQg0ZQ0I9JzqAUq7BzhyuXkV1q7
 OoNScr4sQe1W3QDe7PKs1mCiIf5KYvUaoivwc3yNhDGe0e6VMrbYNkz5Pp6cPXZw4Ev9atLhSY
 aPI=
X-IronPort-AV: E=Sophos;i="5.81,307,1610434800"; 
   d="scan'208";a="50026997"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2021 08:59:28 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 08:59:27 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Apr 2021 08:59:19 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 29/30] media: atmel: atmel-isc-sama5d2: remove duplicate define
Date:   Mon, 5 Apr 2021 18:51:04 +0300
Message-ID: <20210405155105.162529-30-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405155105.162529-1-eugen.hristev@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
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
index b2ace528b260..213a2ecc7c66 100644
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

