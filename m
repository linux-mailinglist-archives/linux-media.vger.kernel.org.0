Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9BE2437340
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 09:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232515AbhJVH4z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 03:56:55 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:55701 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232521AbhJVH4t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 03:56:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634889272; x=1666425272;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HpLWhRHVJkMruImhcz3J99RgIOqwGY9UOr7XCdVVWF8=;
  b=lkHlbIKSU7qzGyKDr8m0XmjAdqpgq4/v9LDJxS97CAzpb0CCm8X3K8NG
   f0dy6jKdW+IFV93CQoc7K5HhpliFSdVQDtxezOx7HjWyWGHKKGyVmuHBM
   NHhBPRIXvH4Zjp7Hx4xuMkiY7s2r3rJFTMN/FbLHDUx03hKtod9Lyn9xh
   EEOc8ue/JJdTybg8jEXS60kAqB2X3ET/KM58d/Uj4HeUw9EmXAOEVcNZE
   d8BCpt/jX5S2mvdFOeFmBt7ih1xqQm1KGxOgLP21nflIdu5ZGH3UsA+Vl
   jbj2C3gySMDk4ppct2H+WAT0At7ItE7h3jr4ByZZnX1p0DFVbt0Ih01sY
   A==;
IronPort-SDR: d7sz6h8s3+cDiY2A2PBWaMWxq6uMS5fPnGfLfxMonKZHFZAVzm+NAPuBqgmbFhj7s/U8Zx8WDu
 pIV7B6bK+9ncuhFWAf7csqcowqOfoZaqAu38axwIaSXi6KxaGe51R5wguB79yFWHcoSaP7BvWz
 AKnw2WDhTnEkb2SjKYwfX/9cWJhA5PE8Z4h3R4o0WMo/QhkNHiSUtZMfBuifUMQTUaLNqOLeKT
 PyYSbAvvrgQcnryrESCxfELIzTzcaz9N+xcsx3Rw4Jwkoqmk+ExI6/h4dQNrYNkgE8AEME3oZq
 3H5CZYgpIpYcScyIMhHap/5M
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="149141258"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Oct 2021 00:54:32 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 00:54:32 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 00:54:29 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <jacopo@jmondi.org>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 13/21] MAINTAINERS: atmel-isc: add new file atmel-isc-mc.c
Date:   Fri, 22 Oct 2021 10:52:39 +0300
Message-ID: <20211022075247.518880-14-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022075247.518880-1-eugen.hristev@microchip.com>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new file atmel-isc-mc.c to MAINTAINERS entry.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e151716c8d1e..228363d2afe7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12280,6 +12280,7 @@ F:	Documentation/devicetree/bindings/media/atmel,isc.yaml
 F:	Documentation/devicetree/bindings/media/microchip,xisc.yaml
 F:	drivers/media/platform/atmel/atmel-isc-base.c
 F:	drivers/media/platform/atmel/atmel-isc-clk.c
+F:	drivers/media/platform/atmel/atmel-isc-mc.c
 F:	drivers/media/platform/atmel/atmel-isc-regs.h
 F:	drivers/media/platform/atmel/atmel-isc.h
 F:	drivers/media/platform/atmel/atmel-sama5d2-isc.c
-- 
2.25.1

