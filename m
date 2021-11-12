Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7707944E8DA
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 15:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235302AbhKLOc3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 09:32:29 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:24705 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235316AbhKLOc1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 09:32:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636727377; x=1668263377;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qOvatQr5WCLEOLjwEcdohe5rtMIJkAtFL76rRB+2+9U=;
  b=dsEa20siPcCgPayj8Fm82FsO68E8d10yqOybvLh8Wv+mSHTtYUAZdhdz
   2kVd1C7nUbxt2Kl54gisK++BoqkGwBGMxcaQqvKJiKzHJOyJuuDn9DB4N
   lpcI49kmMD0BB0iW9gcdnGGQg3VnO1ccGaHLIszi51UBQTQ+A/APgKXSX
   jHFR8HNSSzMmhybZC8ZI34eqYhaV+G/mGdKeNXVBirdHstOC869NJoKLX
   wVpuN/SLiUqFhKqtDWqaYUBj/ZKGcaRBYVlVY8Dw5qNN38ZmFqJMwE/5L
   5kCyvdCj2SFWsKIeg2lXpbUYySFd6+q0P0PPdq2o0xvi+QO30cA16cD+C
   A==;
IronPort-SDR: 7MusTqvd83MXhV8wrtM/himMZpN18vb+7AbFpgIgsyXogwMfMIU2vjWdAdwVN4Zbhe70/CgJYk
 fN4ONif+LdvLjDUe9UlkUtQGMK0zRecbpST7ykZ/lID2rKD6thqJFPkaJMQC+TBRnVP3tvBfKe
 2nlC5BNvBzZqmxCHi6uQNCmWYx186xpIFLC+aD66/7MOGYZndmeX9XjQ3GtgnL7paXUJ1pMg/x
 6p8ugopx9et/e6C/JhUo8cUDzMuq3ixyYAT1WXtOWkJufSgXcBQCFeVOWVGeJsRz9PAsIJ0EXY
 0qtLnnztdm04eQJayl0awQ+0
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="76260920"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Nov 2021 07:29:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 12 Nov 2021 07:29:36 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 12 Nov 2021 07:29:19 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jacopo@jmondi.org>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 17/25] ARM: multi_v7_defconfig: add atmel video pipeline modules
Date:   Fri, 12 Nov 2021 16:25:01 +0200
Message-ID: <20211112142509.2230884-18-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112142509.2230884-1-eugen.hristev@microchip.com>
References: <20211112142509.2230884-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add drivers for the atmel video capture pipeline: atmel isc, xisc and
microchip csi2dc.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 arch/arm/configs/multi_v7_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index c951aeed2138..92b7749a6df8 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -638,7 +638,10 @@ CONFIG_VIDEO_S5P_MIPI_CSIS=m
 CONFIG_VIDEO_EXYNOS_FIMC_LITE=m
 CONFIG_VIDEO_EXYNOS4_FIMC_IS=m
 CONFIG_VIDEO_RCAR_VIN=m
+CONFIG_VIDEO_ATMEL_ISC=m
+CONFIG_VIDEO_ATMEL_XISC=m
 CONFIG_VIDEO_ATMEL_ISI=m
+CONFIG_VIDEO_MICROCHIP_CSI2DC=m
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
 CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
-- 
2.25.1

