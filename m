Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B16D44E8AE
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 15:27:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233894AbhKLOa1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 09:30:27 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:12885 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235096AbhKLOaV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 09:30:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636727251; x=1668263251;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=szwLENg9eGEahRxwM5kjaS6EGD+dZeAptjmdZDyt9iY=;
  b=JqqazyRmXTixy6KUh+TGv4VyCtAMWQoBYC9o4L9gkGLG5s8qMwKYJP42
   DLp8mq4pIJtd8xC1cRaa4VJWPEZwGb/0iW/O6UOp/0eXBs/QxujfQx4Is
   bAfddJvpeO+Bm6A6+STrY9usp2Nn0sSgspOOrJ789xmJqkK+bn6QHhKEx
   MWmYsSJmvgvMGYlgbL0d9XCf8znN9Pm3QaQNymsQefnKtORCSZpg1xHws
   YMlMxtlXPPFT+HzsL55yu9MPmiJWZHF2reAgal34Yb0VALc/9JwTliMo5
   KrgSRa599Kp8IsEsebN0U4ETqROu0tL2A0gTn6Z7AQoF9Rw7+UFcgr0qe
   g==;
IronPort-SDR: BpZjack7KPZFTX+yfMhviN7avtWNurstEjb9lN03Gx/4v5ea+jLp3FLIX8HmUFXv3MfuyrOpxq
 VvtYEjUEwb7idEfeyngb1/zephWbl03D3dIoWly17umGBlBh3fRmJO0eqikmYM1sl9fDCzsSJl
 hhKtYfBSvwzrosk7c7qT2Ri5gH6vJ8jmRQ032vcCOatyVTwfozX4VErhf1pJ9NZ5wk1+nmfDnd
 oAy3M1Q8bGLW4lxTrX7kWfoluDljzGtpqvtfXj8qOJ3o6boaSe40M+7ZT24B64ru0p9Iwpv5U7
 3dkHA35Jzu8kfwlASmjumLNW
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="151718839"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Nov 2021 07:27:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 12 Nov 2021 07:27:24 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 12 Nov 2021 07:26:58 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jacopo@jmondi.org>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 06/25] media: atmel: atmel-isc: replace video device name with module name
Date:   Fri, 12 Nov 2021 16:24:50 +0200
Message-ID: <20211112142509.2230884-7-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112142509.2230884-1-eugen.hristev@microchip.com>
References: <20211112142509.2230884-1-eugen.hristev@microchip.com>
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
index 58f468d32613..26a6090f056c 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -1886,7 +1886,7 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
 	}
 
 	/* Register video device */
-	strscpy(vdev->name, "microchip-isc", sizeof(vdev->name));
+	strscpy(vdev->name, KBUILD_MODNAME, sizeof(vdev->name));
 	vdev->release		= video_device_release_empty;
 	vdev->fops		= &isc_fops;
 	vdev->ioctl_ops		= &isc_ioctl_ops;
-- 
2.25.1

