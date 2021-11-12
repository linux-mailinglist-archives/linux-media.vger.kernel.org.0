Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C29EE44E8EB
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 15:30:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235235AbhKLOdb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 09:33:31 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:23483 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234942AbhKLOda (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 09:33:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636727439; x=1668263439;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zZ8vw5n+IADsTxBeKLeMDfqdHRLqoiSyX/5v63a+ngw=;
  b=TgLMRJkwdS9R0vn6S84ZQP46zfY0RHCZV4TTjpRR1tM/nQh8Rr2/+8J5
   fadZ4RjD0tHXFm/mTGEfCZLqUepP8K+NdID/w38NcRvnNSxkY0Cd9PZFk
   bpLVn4TAuPxW7mAfx0It9LlRq/NvuFiEPFKdCkab81mbwkj+9B9bq4A7F
   TWBZuUtjs5CQqBzzxbAoLpbJFr5IVb822B/5kkz2BpotZuFZ5QwhYRJGN
   K83tpHP0+zmUaEuHOFmkYAEm8vkfHpN9UjIziKUFK/FUA2N4GUmHOaREa
   PA1IBYM9Ez+U4C8uutWe/CGxqTRZZMNJmtnW8UC9Adwsm9d8vuzVltKWq
   g==;
IronPort-SDR: j4zJq0jH/39FPaJlg/0woeS3bGeBIQy3ZL2nOWSDwzARrJYPf2AwAo8abG1rwpnWblbHRWPIHn
 hUlef097KQvQDs5E3hwWP4vuidr5i7b1Nek4H8fPWboCV12QebMDchREl9JkmLbUHMx3ZWqZOI
 Lb0CNY2LtKRAmOPXhMH580bUitAOBdVzcAKivGQuN6AJMQwBMpRud3TpWOUBG6E8vtmktVAi13
 5LsSbaC1jGrshBghSbioxUSp2G6gwkhLzH1I+cePZUM+0KLUmPKPsiMdJ+uVVHjquKEprHjU9D
 eb3xizGZ6PL7e76JUJafzep5
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="136388182"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Nov 2021 07:30:39 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 12 Nov 2021 07:30:39 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 12 Nov 2021 07:30:27 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jacopo@jmondi.org>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 22/25] media: atmel: atmel-sama7g5-isc: fix UYVY input format mbus_code typo
Date:   Fri, 12 Nov 2021 16:25:06 +0200
Message-ID: <20211112142509.2230884-23-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112142509.2230884-1-eugen.hristev@microchip.com>
References: <20211112142509.2230884-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the mbus code for UYVY input format type to the right color rotation.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-sama7g5-isc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/atmel/atmel-sama7g5-isc.c b/drivers/media/platform/atmel/atmel-sama7g5-isc.c
index d2ac80b1ccc3..38721bd902e2 100644
--- a/drivers/media/platform/atmel/atmel-sama7g5-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama7g5-isc.c
@@ -188,7 +188,7 @@ static struct isc_format sama7g5_formats_list[] = {
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_UYVY,
-		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
+		.mbus_code	= MEDIA_BUS_FMT_UYVY8_2X8,
 		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_EIGHT,
 	},
 	{
-- 
2.25.1

