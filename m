Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8F8C35DD12
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344381AbhDMLAr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:00:47 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:16172 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244134AbhDMLAk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:00:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311621; x=1649847621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XFUIMGcuk2LQccy9mIU7wH0R7YLi14N6pV7ElUM4/Mg=;
  b=RaRt1AkjbFKqcFs8eHboiKPJmDsJUribPWsm4+GZ2ZpJHixvNPiOpUYT
   6aqsao8OSjEVPeUgcFLafVYh9wi6+re1uK7u48xJU+Yo2IKZpvo9x09ZL
   xYf3oYLgiZ5JD9pgQu6uFoPcKk53HZlC6Kx+cjx7TFozXrsycJE+OSGYI
   VgtmST0HjJr9aXMLuZ0LE/CyCIUxk9dq7X5lBzR3MWcNDb76BwlGfxK/W
   dZOGXZj9lfgr6SA4MqylBjMG5oNOl4tD0Oa7I7uMI6vQ7ypAtlMJvW9lw
   pcMEgGJwyTk2OVrFbjzeVDDUH718W8+2WOcQb2MkbUni72O5VMEqqsdU9
   A==;
IronPort-SDR: 6n04EHTnQ/NkRqG/RE2oofXsI7yFsYyBpWKhe7JtpH/gJRxN8MumUlfaiX2g+my0tfSu2Jg/Dj
 OGHJ7sMcBUQk0lhkgaDn0ASmXZp08WXCTIzgQI+u1hz33tcR2dnPlMS56lad8yyhVM35ECaglk
 DPf1O7rFWl4SCFDLBBFBgfl7VTnSBmnd4qttHvmvtYwZCtaCGZFzQS4HCSjn7k+gjH6fN1XIvj
 1t9lRlNUVhywU4miqH8590y4WQRkXv7FxkoFUjHZyR9TQAjBV1tuPM7kPibZSRMYyZ9GmgqY4q
 dcA=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="122829878"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 04:00:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 04:00:20 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 04:00:16 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 07/33] media: atmel: atmel-isc-base: add id to clock debug message
Date:   Tue, 13 Apr 2021 13:57:05 +0300
Message-ID: <20210413105731.610028-8-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-1-eugen.hristev@microchip.com>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the clock id to the debug message regarding clock setup

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 31f63ba90c71..bc036e8ac4fe 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -277,8 +277,8 @@ static int isc_clk_enable(struct clk_hw *hw)
 	unsigned long flags;
 	unsigned int status;
 
-	dev_dbg(isc_clk->dev, "ISC CLK: %s, div = %d, parent id = %d\n",
-		__func__, isc_clk->div, isc_clk->parent_id);
+	dev_dbg(isc_clk->dev, "ISC CLK: %s, id = %d, div = %d, parent id = %d\n",
+		__func__, id, isc_clk->div, isc_clk->parent_id);
 
 	spin_lock_irqsave(&isc_clk->lock, flags);
 	regmap_update_bits(regmap, ISC_CLKCFG,
-- 
2.25.1

