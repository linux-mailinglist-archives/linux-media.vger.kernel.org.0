Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8512F43734B
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 09:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232624AbhJVH5W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 03:57:22 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:13639 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232615AbhJVH5A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 03:57:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634889283; x=1666425283;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3aLq+6t34WawSD7x49jHw5NnHLDsUbXrYRwccy4TZv0=;
  b=MLlqq7AzKZTRuOiHtMixZ0b6ATjA/CNY7vtgNaAMzy3Lq7/4ePvaJXaU
   erCUhe25D51raQIwg0pxSuxkwVu1Ggn1dDzj/w/4Z6F4/kecdcEhzzJco
   374W7i8C7CRFHc/ChooI6d0htPq/JGtpPaS5tQCaTnfDE1TaZPMVF5WBN
   tg65ZBcW2gvZU9vb0oAfzivWHcGHZLbw8HIUYfz1j8w1gyX3N4Yi5y6Wn
   GVcn8E5TNptSjunLFt6VmswBlQg6cPk3IP0o1cvHvD3cIWt8f2isD8n1y
   fBQr5lS4W+9iUfXl7em5dH92+MdfWi4dyu1FpEbS9lP7QGP2KlLi0Gurz
   Q==;
IronPort-SDR: H/EP0NVZkOR+SpcDtUhy70BhjWOBpL9EibPOBD1uVBeXvh1+W8x4OdK9cvdH1iO4vWSXPsnrz0
 xTP1wygDqDsGOpIDuGuWJJ7xvVZZuRJkxFVmxPjMBaPeMolojBTeISynPL2LTkrWEfYoNl/2Ry
 U94ej0E1UDhkece5em7PsCCpal65XdxRfWhy20P99E15Lt9HdlI+ZGo1rp1vnH0vSgIsyELvvj
 y7+b2/61mzBfL7rGlEozK33FC++OeEej8QCPEonKs8g374mj11X/8oNak9zNTBfa4a6m7+y7PQ
 f+tzkdu+Rcjt4GGmaJvzti8n
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="141320555"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Oct 2021 00:54:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 00:54:42 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 00:54:39 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <jacopo@jmondi.org>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 16/21] ARM: configs: at91: sama7: add xisc and csi2dc
Date:   Fri, 22 Oct 2021 10:52:42 +0300
Message-ID: <20211022075247.518880-17-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022075247.518880-1-eugen.hristev@microchip.com>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
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

