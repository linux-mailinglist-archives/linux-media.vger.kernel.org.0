Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2148C3A1505
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 15:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233143AbhFINCr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 09:02:47 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:44815 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233028AbhFINCm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 09:02:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1623243647; x=1654779647;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BpqxinrRCUKxHtv0Qy6tpZJ1UbGKCSXrOA7Y3esQIFI=;
  b=VzzIJsk3ygiy6i8bKMk5AH1+cX+1PGtHEzyu64BQsb20GDZrc9psp/3f
   36Z3BOLnPqjE/05IEMimF1o4dgOmtnyiEpMQ+no8pC0m4bFx7XqDl2MAQ
   gnejNwcDMsQMzTeWLzS0/9Ebi+m2dCu0o4eMsOIT/LIHKTyWTIz8Iz+g6
   a7oZc8WE7UXzxvv2+f8iR7ayhLczrVZwD2T6Gd5AtWal+eKOyMboCbqO1
   djLaL2My2qnf+eUk4fXdTi4hxmd4YLRsPRyV2DzKo7Lqkj/gnFBTiw0aK
   uxXJwANLi/EAWckNCaWHjf8mIC9UzqnVIBRFVLXaSYJWk9Z5eC7EheKN5
   Q==;
IronPort-SDR: 8Jpmgq50PDtZkxIiug3oW4ArytJmqwG/a7/V07scvWkqzWVi43y8CzHJfopjUSoxeflBY74jiV
 XW6HqlI1z0HARlWuyIrdCMC/3gQm72OOmYTfI3LA0vAOxLz2EBjCu+LNsw/ktU/muWDdw4LNWf
 hLhuLiHzfZ2rsFZZ5LPFu0YTp97rGFlx2sBnuputlpTk8zdfXZSTAm1JzENmJ9RN2LGFcyNLr/
 hvmxs72IzaBBLFfWcZXX2a7MkzXyIhZJfyphFw/iZiXlFlA80iBtx59Vw0S/IRv48NtALqvKus
 ko8=
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; 
   d="scan'208";a="124643305"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jun 2021 06:00:46 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 9 Jun 2021 06:00:46 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 9 Jun 2021 06:00:45 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <hverkuil@xs4all.nl>
CC:     <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH] media: atmel: atmel-sama5d2-isc: fix YUYV format
Date:   Wed, 9 Jun 2021 16:00:28 +0300
Message-ID: <20210609130028.394348-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SAMA5D2 does not have the YCYC field for the RLP (rounding, limiting, packaging)
module.
The YCYC field is supposed to work with interleaved YUV formats like YUYV.
In SAMA5D2, we have to use YYCC field, which is used for both planar formats
like YUV420 and interleaved formats like YUYV.
Fix the according rlp callback to replace the generic YCYC field (which makes
more sense from a logical point of view) with the required YYCC field.

Fixes: 0733a77ae78c ("media: atmel: atmel-isc-base: add support for more formats and additional pipeline modules")
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Hello Hans,

This should go on top of my ISC series which you sent a PR for :
https://lore.kernel.org/linux-media/57e15ed1-61c7-0240-5bf3-115de3bbec9c@xs4all.nl/

I noticed this was introduced with one of the commits.
It would be great if it can go as a fix for 5.14 , if not together with the
initial series.

Thanks !
Eugen

 .../media/platform/atmel/atmel-sama5d2-isc.c    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index cab2989103f9..34efd12fef55 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -255,6 +255,23 @@ void isc_sama5d2_config_rlp(struct isc_device *isc)
 	struct regmap *regmap = isc->regmap;
 	u32 rlp_mode = isc->config.rlp_cfg_mode;
 
+	/*
+	 * In sama5d2, the YUV planar modes and the YUYV modes are treated
+	 * in the same way in RLP register.
+	 * Normally, YYCC mode should be Luma(n) - Color B(n) - Color R (n)
+	 * and YCYC should be Luma(n + 1) - Color B (n) - Luma (n) - Color R (n)
+	 * but in sama5d2, the YCYC mode does not exist, and YYCC must be
+	 * selected for both planar and interleaved modes, as in fact
+	 * both modes are supported.
+	 *
+	 * Thus, if the YCYC mode is selected, replace it with the
+	 * sama5d2-compliant mode which is YYCC .
+	 */
+	if ((rlp_mode & ISC_RLP_CFG_MODE_YCYC) == ISC_RLP_CFG_MODE_YCYC) {
+		rlp_mode &= ~ISC_RLP_CFG_MODE_MASK;
+		rlp_mode |= ISC_RLP_CFG_MODE_YYCC;
+	}
+
 	regmap_update_bits(regmap, ISC_RLP_CFG + isc->offsets.rlp,
 			   ISC_RLP_CFG_MODE_MASK, rlp_mode);
 }
-- 
2.25.1

