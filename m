Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4D935DD6F
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345162AbhDMLGP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:06:15 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:24488 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345203AbhDMLGH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:06:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311947; x=1649847947;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VNqcykOxbU6kJ4qHtYBpGj+eFMB+dRAI0BPM/d1F42A=;
  b=td4gz5fKDEeH/vi4LYMKyr88G6rF7nFxUVpVhZHjIHBOLoNhjteODbXh
   i7GWn9fEE09yvKDBjv4s7yQwZDzDxLl7scEcZXQvGbq3TXDXUbqA/Jo2j
   cw64hUcPwvOIMO9brEQF0D6vTVjTb4hKPjCdtsTLOdZ4+xB3G6xje9CJb
   qVJ5l0XXXF27UH5na7LzlrqfXkvuDR0R4TIPcM3QTXqjSGaJn5lLeWBwo
   AtLZdaBPVR74Apc17vzo12hUMMgasLUoBZkV9Q7caKSAVMSSU89UZvuBI
   GrV/HEofP69SfBQdIVVhXPtMo1YUqIBplwraDQTXtgw2oqVODlBas1cQo
   g==;
IronPort-SDR: KUFI80JPkQAsVlxqBM25gTtpNe8USNw+v4tjhp8cIKIim757j3Cf0pWO5u4Z97BaQRz8LfeSl/
 WFxl9rQA1o1NOt8JXnWrJBcZtM9zwLeuVAbjSJoOpWlOFYNkU862yE7KjllhbkbY4oiPQw9zWW
 zaLu165Ol1amr/KAsqiqIGCv3+NVBRbnSlwIcZw/DaMbU74c6eU86fKBgRIMn5GZiW0jmjfhwq
 82tF8WqvFf7yaPgOXbgwv+JcYy6CSao/xZSU8UYmgsCopsl6equYewzUI3hdT4eLiX+wrELJPn
 2iM=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="110612382"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 04:05:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 04:05:47 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 04:05:33 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 33/33] MAINTAINERS: add xisc files to isc driver entry
Date:   Tue, 13 Apr 2021 13:57:31 +0300
Message-ID: <20210413105731.610028-34-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-1-eugen.hristev@microchip.com>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add XISC driver and binding files to the ISC driver entry.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 95e3c7b7f934..451f2f0bed0b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11721,10 +11721,12 @@ M:	Eugen Hristev <eugen.hristev@microchip.com>
 L:	linux-media@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/media/atmel,isc.yaml
+F:	Documentation/devicetree/bindings/media/microchip,xisc.yaml
 F:	drivers/media/platform/atmel/atmel-isc-base.c
 F:	drivers/media/platform/atmel/atmel-isc-regs.h
 F:	drivers/media/platform/atmel/atmel-isc.h
 F:	drivers/media/platform/atmel/atmel-sama5d2-isc.c
+F:	drivers/media/platform/atmel/atmel-sama7g5-isc.c
 F:	include/linux/atmel-isc-media.h
 
 MICROCHIP ISI DRIVER
-- 
2.25.1

