Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0418455564
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 08:17:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243710AbhKRHU3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 02:20:29 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:36503 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243690AbhKRHUX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 02:20:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1637219844; x=1668755844;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zRAeZCYa4NAS9qCMxMUo8oi7QA94Zfv6TYf1xH0Ja3U=;
  b=g/7BRzHZyFmU8Fdq9t8oFtzFpHlREWTQ4hRnw5cGeuO9qBC/QE9bN+4j
   Rd38LqL3RZERUAeITekEPFkn/jas49cEZ8eGFnw8KKmmCTdswdG6XF/tG
   81/98ePE02Jez566IWAXL8ZGOXC1P9VeRmDCwn/uiw3hlKjrnKGa1XA+4
   Y9DbTjmu+gUPJ2bAPfcgnBlQQ0j3UGIlLaEklW04KiMX065wfuNC78ysw
   v5BDf8ts+WHD6zE+NYkVbWleWVURoj1b8W0xRtpCalff4awBLYy74PECx
   Kt4qRC0rmci6aWjIj97C4nT0fI6oguA7D632l6s7dMZ1PFGDn/i9cdJDT
   g==;
IronPort-SDR: +bz2zeS6C0DvXqQFYzZvTXE/jpSCZN7TusASMM0A5wIJi+AjpugurLAsjLnPGu1VJtS0Lxf5j3
 FwsioPLat75VPWVMMareCWjkzPBiyeCm783ZA00YwjCvnQo0/fecukgdCJzT0OoVOnjiIXbf9a
 vS90lp9mZeniImff5yiqIanhTegSNto5wX8vB5ehYgE6HminU+78lCv1JVwjydO0bSx1ae5aBZ
 1PfxRybhwue2SGEm3/HhDpcRHbFHF1S97vjAcdH/K6Qfx2fLnYlrIMC6RzhzI9ohmHB5IbMknG
 S0VAept0HtUxWRA6xfn0Kh23
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; 
   d="scan'208";a="76837084"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Nov 2021 00:17:23 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 18 Nov 2021 00:17:23 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 18 Nov 2021 00:17:20 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <leonl@leopardimaging.com>, <linux-media@vger.kernel.org>
CC:     <skomatineni@nvidia.com>, <sakari.ailus@linux.intel.com>,
        <luca@lucaceresoli.net>, <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH] media: i2c: imx274: fix trivial typo expsoure/exposure
Date:   Thu, 18 Nov 2021 09:17:15 +0200
Message-ID: <20211118071715.280548-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix typo expsoure/exposure

Fixes: 0985dd306f72 ("media: imx274: V4l2 driver for Sony imx274 CMOS sensor")
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/i2c/imx274.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 6e63fdcc5e46..106706abc72a 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -1515,7 +1515,7 @@ static int imx274_s_stream(struct v4l2_subdev *sd, int on)
 			goto fail;
 
 		/*
-		 * update frame rate & expsoure. if the last mode is different,
+		 * update frame rate & exposure. if the last mode is different,
 		 * HMAX could be changed. As the result, frame rate & exposure
 		 * are changed.
 		 * gain is not affected.
-- 
2.25.1

