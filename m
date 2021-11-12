Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7FC444E8B1
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 15:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235145AbhKLOaj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 09:30:39 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:24587 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235074AbhKLOai (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 09:30:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636727268; x=1668263268;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wUeEYEPhDkhIE88VVyIbkTbuZnTPC/eMEm62GBFIfCg=;
  b=WZ2JlkxRpJdsP1O82S893RWWJXhX+NHHWEecGiWjjB8dbqHx4Ub5mgVm
   VlapWwaUCSnogLyABBLU+aw/9nGs18rzJKocMmFB5TGeUpte2IUmjENIk
   kcSNaUCnx+8wX3z2lRUx101uo134sZfse9pJOP9oxOMIV0NtMdcMCdUfL
   L8T+I/7TlvpYX2Pq+Kdhsww/KNOuTaRngfEs6kSXVgD+TegYj2WJFLdDv
   BiPdYOuj20pVR5xJrpKrNExs4NQDkEvSSp9pRSSHw2ThXLWlqDqwGPV8x
   HrIPXStS8a4ETB6NBg1lHv/UO5Q2frXNMtWz0Z92gRh++v35Ws6b8OYqi
   A==;
IronPort-SDR: hMu0IYDHkiJsqBW2rePq6oqxpKYKboWWi6MF8Hj0BfbPdAZ7kfKpbdpJQLpkSct0Bpw5FUjaqZ
 +npU42Ba+nyxjd/hJS43zKpVPpaPYdmG9jKWFHF9s+VrIcQWlB4cSDUfb8MYfYPIRIchxalPzZ
 aHL1qSdqP5jm40ZeQuPJcL5DRns19lx5oy4zWbebND8X9PMkKMojEyOmDv2ZPfrAfcK7BVrDql
 tKyjRdhBlihHprFOmHhwJ1yF1kq9Rv2osBAgBGmSkTl6Q5GQ7cPLHjBb3I+KO/49u3BPI44TTf
 RORBKEhQdm8gMOLOSvSrZmdX
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="76260784"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Nov 2021 07:27:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 12 Nov 2021 07:27:47 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 12 Nov 2021 07:27:25 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jacopo@jmondi.org>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 07/25] media: atmel: atmel-sama7g5-isc: fix ispck leftover
Date:   Fri, 12 Nov 2021 16:24:51 +0200
Message-ID: <20211112142509.2230884-8-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112142509.2230884-1-eugen.hristev@microchip.com>
References: <20211112142509.2230884-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ispck is not used for sama7g5 variant of the ISC.
Calls to ispck have to be removed also from module insert/removal.

Fixes: d7f26849ed7c ("media: atmel: fix the ispck initialization")
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/platform/atmel/atmel-sama7g5-isc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-sama7g5-isc.c b/drivers/media/platform/atmel/atmel-sama7g5-isc.c
index 5d1c76f680f3..2b1082295c13 100644
--- a/drivers/media/platform/atmel/atmel-sama7g5-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama7g5-isc.c
@@ -556,7 +556,6 @@ static int microchip_xisc_remove(struct platform_device *pdev)
 
 	v4l2_device_unregister(&isc->v4l2_dev);
 
-	clk_disable_unprepare(isc->ispck);
 	clk_disable_unprepare(isc->hclock);
 
 	isc_clk_cleanup(isc);
@@ -568,7 +567,6 @@ static int __maybe_unused xisc_runtime_suspend(struct device *dev)
 {
 	struct isc_device *isc = dev_get_drvdata(dev);
 
-	clk_disable_unprepare(isc->ispck);
 	clk_disable_unprepare(isc->hclock);
 
 	return 0;
@@ -583,10 +581,6 @@ static int __maybe_unused xisc_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(isc->ispck);
-	if (ret)
-		clk_disable_unprepare(isc->hclock);
-
 	return ret;
 }
 
-- 
2.25.1

