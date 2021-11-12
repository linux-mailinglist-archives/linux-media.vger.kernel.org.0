Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92F4844E8D6
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 15:29:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235168AbhKLOcK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 09:32:10 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:46052 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235095AbhKLOcK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 09:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636727360; x=1668263360;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3aLq+6t34WawSD7x49jHw5NnHLDsUbXrYRwccy4TZv0=;
  b=eYC5LC4kvD5bJIHk+86AU9YZ+urQlX+IC24F7JEkmejOouf+5b1+bsV9
   lAXMECvYayE5uuvAQiIqDoBxC5RSg6/AVHyaOUSv+PC48GrD08bAQ/D9R
   DDlsG5dOV8ehCvSlbNPaAPXWON4XZg3xCvrQoFstwsDoVnCvT932ABcaa
   fl+ec4h82N/nXtSkGXL99qT2kDyTypLXdeVqFGGRqvlLjfMFcO5SbL6Lt
   EnJjAYNdZ8lcb5fO0Sbe0fKtzpsQSUxNUaZYiyE7KHysVVUCY5p+0aMRK
   POnglTRm3nRYjdhtsLzOwXrUVE8JOKddwSR1C2b/g6tBcdKUVQYzhXpEZ
   A==;
IronPort-SDR: 9QxbBZ9bAHAwSa4T6H1/A5DNB5NK7YtDoxahiZu3giaxKRm3Rj+7pvOocfnYgRgKwRoQ+l2cIk
 DqOv5pU5Dho0hfxQOQnimuYDbe9HUSLxeOqVowTiaSaGtX4L1T60bF+4ytVEhhGsVUw7hGR36e
 adeSlxoJ+8RhRWsVi7v5WA27wRt6Es3xLghOJZ22+jRzCQmUnZ6JUQW0l3EThLHOX0irUB0iHV
 8Rlqi7Gl8Y4B6OLCxT1fa9YcAQdTO1nRJSdjEsSF15hcaD9qGkiZ1zDdCG2OX8VtSvhRfujTO8
 l+Ltffs3AQe6EkLDK0Vt4Vcx
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="143154160"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Nov 2021 07:29:20 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 12 Nov 2021 07:29:18 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 12 Nov 2021 07:29:05 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jacopo@jmondi.org>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 16/25] ARM: configs: at91: sama7: add xisc and csi2dc
Date:   Fri, 12 Nov 2021 16:25:00 +0200
Message-ID: <20211112142509.2230884-17-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112142509.2230884-1-eugen.hristev@microchip.com>
References: <20211112142509.2230884-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable XISC and CSI2DC drivers.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 arch/arm/configs/sama7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/sama7_defconfig b/arch/arm/configs/sama7_defconfig
index 938aae4bd80b..15978f2ab4ea 100644
--- a/arch/arm/configs/sama7_defconfig
+++ b/arch/arm/configs/sama7_defconfig
@@ -126,6 +126,8 @@ CONFIG_MEDIA_SUPPORT_FILTER=y
 CONFIG_MEDIA_CAMERA_SUPPORT=y
 CONFIG_MEDIA_PLATFORM_SUPPORT=y
 CONFIG_V4L_PLATFORM_DRIVERS=y
+CONFIG_VIDEO_ATMEL_XISC=y
+CONFIG_VIDEO_MICROCHIP_CSI2DC=y
 CONFIG_VIDEO_IMX219=m
 CONFIG_VIDEO_IMX274=m
 CONFIG_VIDEO_OV5647=m
-- 
2.25.1

