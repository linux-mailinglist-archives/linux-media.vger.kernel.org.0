Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9825444E8CA
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 15:28:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235276AbhKLOb1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 09:31:27 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:34254 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235271AbhKLObY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 09:31:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636727313; x=1668263313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sKbVrxgYFr2ZiFWOE6rmZDYLHb2dxaRg7LJ3WkMKeU0=;
  b=Coth8M5mtkqO7UlR3WK57EyJ92dz6UcGwDQfVOFRUWcQdj3yjtavoct1
   MET9bCluKrS+kvyl/4pzbIbceDNvO4krVPr77Rj3f+IEQS3N1U+FgmPVK
   p+uyyMxqK2ggdHGIsGzyLijFIjzMexDHv8zrg0D47PKL2HFif9G1oJXzU
   q2XI3DSjMdSujdQSZ0nvcbYdbEuZqUTG0AdDL3KWLLtXk1ilPZUxRVJ1a
   cEIeGb5rL/LBmoe+v2eIHP3CPysU0XNwNzv9Z+cLb6Yz/td7RC9ya7JV9
   wsNZpGG3UjvDM0K43Oxucxwsh+rstDM5pdhdYohGDXBaB7Fy9dklAvxCQ
   Q==;
IronPort-SDR: V+h6Wn97tIf13F+wRxsmggoTz4BWrQGGPTRrCJwKHXcmZ/wtF/0xsLuBBhOjrl/rNYqKYpYlrG
 Sv4pB2HgtHfLytrzqzD4wmDsWbudXXd13Fl3YGj1D11ekqBPVy9G3K3C8lCMNVtTJIm8aXyCY5
 cdZnc/TQ4UVDU52F+0rfb+lXQmU1NdlK6z0mlWdCVN3Zj/FGinsfbpK8fyDb/M+/J1/o2Ntnod
 MgEQVvIRcIdXEjo+1kuLrcZPbPuwF8bikZW158iVbB/rXhOzcspO9H/SkYoCzBHlQ05vBv2XxO
 NdSG0EBYqowdJmg/I/xTBCt2
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="143729722"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Nov 2021 07:28:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 12 Nov 2021 07:28:32 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 12 Nov 2021 07:28:27 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jacopo@jmondi.org>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 13/25] MAINTAINERS: atmel-isc: add new file atmel-isc-mc.c
Date:   Fri, 12 Nov 2021 16:24:57 +0200
Message-ID: <20211112142509.2230884-14-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112142509.2230884-1-eugen.hristev@microchip.com>
References: <20211112142509.2230884-1-eugen.hristev@microchip.com>
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
index bb7b48e3605c..ed9ec0a426df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12456,6 +12456,7 @@ F:	Documentation/devicetree/bindings/media/atmel,isc.yaml
 F:	Documentation/devicetree/bindings/media/microchip,xisc.yaml
 F:	drivers/media/platform/atmel/atmel-isc-base.c
 F:	drivers/media/platform/atmel/atmel-isc-clk.c
+F:	drivers/media/platform/atmel/atmel-isc-mc.c
 F:	drivers/media/platform/atmel/atmel-isc-regs.h
 F:	drivers/media/platform/atmel/atmel-isc.h
 F:	drivers/media/platform/atmel/atmel-sama5d2-isc.c
-- 
2.25.1

