Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92EB635DD5F
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345323AbhDMLE5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:04:57 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:24380 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244788AbhDMLEz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:04:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311875; x=1649847875;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=moq1d9N+xas3Sok1/bzQQTjVgaigAE5SM0QmiyTE3dk=;
  b=rH3ciS1Sv5evJZc0MoJ2csGVNUoE39UYH3tqVQw2RZd49/v+v0rVT77F
   iHdndTTahMgXGcvUAUqFO8SqzYFkx40P9wYCA9J3jwnri+zeCCHu4hjqh
   /MwEQKOItoE+tCY31T5DG1c+yXlnH1DbuzCy4TtjP7HBlynb6RFMGv5mJ
   LC6BZclPTWpppFOcQUpR+wosWPYWYuIPSEedQx4CLVyNuhFjSivl7OX3M
   BgwPrXhOP4e8nn86nDujTs6cTXs4s57pi6xB+dzdu9/Z9DyzxnweUYjft
   3x0y62hYvvbpfRxVJ7nA4FtUf4G5Qf2r7Gn6PxKBE1+StQnBH57Vv33Af
   w==;
IronPort-SDR: ykPGhTNcPkg2XOm72YXOZerNkcXObtQubnFpksAei2iinQbMYRJ9YJVwFwbjsAvCwVxQ/X/Cgb
 sFMZLYs+Jbh09J9VoQFyNIWQ7tgMgkuexpoRrHmBLgVG+SMWHjs0+S79mlFMcWIAYnDdkzZdnT
 6MPpfKLKkyr8zOcJzegMSCZNySCIUuZvJJf+AxYypKGqm+SGuUS3KSlVAFZBMBzdbZ+q1pB+LS
 IkuROWgC+MORx7HvBWW7n08umrOaTlo6ymne2ZcsQcTFHq90AAwukqunfsDv7kINNwJx0Fv/JE
 qXY=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="110612279"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 04:04:35 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 04:04:35 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 04:04:23 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 28/33] media: atmel: atmel-isc-sama5d2: remove duplicate define
Date:   Tue, 13 Apr 2021 13:57:26 +0300
Message-ID: <20210413105731.610028-29-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-1-eugen.hristev@microchip.com>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
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

