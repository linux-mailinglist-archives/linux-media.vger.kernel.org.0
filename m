Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7A0443734D
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 09:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbhJVH5X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 03:57:23 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:17462 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232573AbhJVH5F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 03:57:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634889288; x=1666425288;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QSPFjxfXba29mpcA0AuoqTxyv540cTpqNP1ZdHCYLbU=;
  b=DYMhi9kE0TBLIqvmO+TTddzgjMH2iSaUij85UitYFrdAHkeX6lQR8w1W
   XFFUhcBE0U6I7VFOrcU30/xun2oJ8ZK4bcpmDWDiUvEHMmIycPvN7kS6C
   Y2+6kbotp2CqCBH4Hc0SIKEknvJl/Iw2Q00sH6R19A3cY24Sgz3COEYsZ
   I0xaT7hCi88dsU/gu1hcplpT10MRiLjDBmPTKYpcGqeBumU9AIMz91OYh
   94Hzzia+H/ecoZcwN6izU0PL8tdUE6lyzaEZtlFDfbScoqA5h6K5AgRtG
   Yu0ymIvpSbz/4pk2yorynV0hHGbFM0xQ4O0h3derP16pmvFg33B2DpIZY
   g==;
IronPort-SDR: vRkuhleayvIZc0sRRD/1oc8Uzy9QiwYq/IMnaKvs9mfFFJ/Fwz1KjGdM1mSV5uRZfGNzCpsLja
 +Ud+pNMmYjEgoEpdLpwCqE1p7p46AZr0YokcGtvbMWSI8PQPUznkAKGNYvU4DKMYH3QyTFRk+8
 BFFnMmMPD1h4MIgy+oA8FfUbGMsxxCLAYBt6Np78GDGrwoU/eTLaC5zGgqTWRGJ2sEV6Gd5eaw
 eaDmIZdwObb8K0UkYmi/jmbjDL4GVKiftdDKTzRoURsXUGwAAXpzRIIftgoBClMQDg4eUx7gQE
 rZKtOMeGgkZ24ujY8GPEDjkw
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="136538145"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Oct 2021 00:54:47 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 00:54:46 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 00:54:43 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <jacopo@jmondi.org>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 17/21] ARM: multi_v7_defconfig: add atmel video pipeline modules
Date:   Fri, 22 Oct 2021 10:52:43 +0300
Message-ID: <20211022075247.518880-18-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022075247.518880-1-eugen.hristev@microchip.com>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
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
index b4f74454f20f..03ea4d0ca242 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -654,7 +654,10 @@ CONFIG_VIDEO_S5P_MIPI_CSIS=m
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

