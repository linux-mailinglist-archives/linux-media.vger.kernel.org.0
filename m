Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84091437331
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 09:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232471AbhJVH4f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 03:56:35 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:55701 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232403AbhJVH4X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 03:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634889246; x=1666425246;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6BOv8t6XXiIv6cggJ4nA8XW7gOqf6UXOIahF6kB4/v4=;
  b=qcCb2TQ+GWAp1s7NXwQ1ZxETtc48AwNJix+1DWNiuYCy5O8T9wvZq+l4
   v95KWC6ovI0X/6m+uqnd3SRV5s6GR0wdCvP5O85ae7H7faEDBH4z3iFsF
   SgENHDyVkuwZgW90T9xx2jF2lDWHpoFiJDoO4rgzup78K4jJHHMBnFPjX
   82HINy3JevuWiw9QR2KMjRs0NjerOE/V2k8qX5v4C4k0650IlDPDjwRIz
   U1NQpHFJCRV2vGIoLh3qFrJZyfgMc4Hh4JXB7Eu2nuxTquwCd9hgNNUAZ
   c4TzwX3Vl4d2nUvE9nRF413cHytzTfbeUoqkaJY8p8mxkTJVWOZKgHu7I
   g==;
IronPort-SDR: OlS2KaopDJCX//rpSBhrtdHebAKks669tV0QOW9GSDw8ZNyqYaX4FgcXYlH5MLAidr6wKfSv2Y
 Ce7csUHW21y2p19P5hYthSO4OMnr7kyuepcQNSD933DTaB/s6hwt22EhpYYvnJunxhvKEcDmqn
 ZqleZ0L1Y4QqG7nNiURg5OqzbWTtS3hUtk8Lq7/3vmoRikTAnlQl4sxCXIcv5YDhivVA7hNlRC
 8Wxg6w3aq50ZxULfoFQ2KVcNNCLuYyHpb5odyrLwnhLhFh1gVCJBMxl+vyh27f5vrSjcwrluea
 cdayXOuo0JebuajjX/Sz7nHR
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="149141186"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Oct 2021 00:54:05 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 00:54:05 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 00:54:02 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <jacopo@jmondi.org>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 06/21] media: atmel: atmel-isc: replace video device name with module name
Date:   Fri, 22 Oct 2021 10:52:32 +0300
Message-ID: <20211022075247.518880-7-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022075247.518880-1-eugen.hristev@microchip.com>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To have consistency with future media controller development,
replace the video device name with KBUILD_MODNAME.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index f532fd03e807..f3e89a892373 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -1887,7 +1887,7 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
 	}
 
 	/* Register video device */
-	strscpy(vdev->name, "microchip-isc", sizeof(vdev->name));
+	strscpy(vdev->name, KBUILD_MODNAME, sizeof(vdev->name));
 	vdev->release		= video_device_release_empty;
 	vdev->fops		= &isc_fops;
 	vdev->ioctl_ops		= &isc_ioctl_ops;
-- 
2.25.1

