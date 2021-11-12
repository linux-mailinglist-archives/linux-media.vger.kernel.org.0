Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAB2044E8AA
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 15:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235200AbhKLOaD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 09:30:03 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:12832 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235199AbhKLOaA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 09:30:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636727229; x=1668263229;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5D6cTlvwsiROHrhYuf0hoRjJstqTb9h4AVXLQ1Ljrek=;
  b=Y12qno/DMX3mevvK6VEUOvokdWsg3X1v5ROmh/sB6X6WnEYKGwZ/46fN
   tYWwpthJV7gs5BIkuvICVABEwh7yBXJUugiKsZfh+aBjO5DZcXWzagPNZ
   jPMgxs/1Mfcw7r1jd1ihVkDeOeoebFrY6GNqBmrg3St6N8KQD6alkmu+Y
   XDtOYek7FSdVz6z0hy+g9lEkTI/83wdd2vwh9jmIdYVrqsRC1/0bhju5v
   jNXa3EOYui89sT2KVLIGmDeClYnFE8iT9oTEZSgp3D4nWy6LFSAJKfqyG
   n8kpCqF3Zu9P/aswvB21MpmrNd7k7vcrH321BK9X1YMS1y8VxNC7iJtbc
   A==;
IronPort-SDR: P9FFzG4BQymaUUgZioYJKY4qMvf45s8IKz+cVWGG08EWsJLxLgoH8dQT2Selu7dH12ViPqoPHK
 D5dnM/lOM2dGujF0vtpF+egGJZa5tMeocjdJa3ZTx9KHa1fPsV8cnYo625X8813Nx4vf48PhE4
 UCO5LB07yDamHooz65O7EtBngXsEg3QyqSUwp1KzTPB74Q52u1DiVJRxZdD/wkNpUF5/zFTJ0c
 nz8DvaChF4CQkSI0cCGSy5BO9V3FS/bfFKUNtVFlQ45XNGs3Fd/8AZWkU/pC1fNxVyKKp0KE3I
 eCUtkhI5OhRA6/e3chc48etv
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="151718770"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Nov 2021 07:26:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 12 Nov 2021 07:26:40 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 12 Nov 2021 07:26:24 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jacopo@jmondi.org>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 04/25] MAINTAINERS: atmel-isc: add new file atmel-isc-clk.c
Date:   Fri, 12 Nov 2021 16:24:48 +0200
Message-ID: <20211112142509.2230884-5-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112142509.2230884-1-eugen.hristev@microchip.com>
References: <20211112142509.2230884-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new file atmel-isc-clk.c to MAINTAINERS entry.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 545c642c937f..bb7b48e3605c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12455,6 +12455,7 @@ S:	Supported
 F:	Documentation/devicetree/bindings/media/atmel,isc.yaml
 F:	Documentation/devicetree/bindings/media/microchip,xisc.yaml
 F:	drivers/media/platform/atmel/atmel-isc-base.c
+F:	drivers/media/platform/atmel/atmel-isc-clk.c
 F:	drivers/media/platform/atmel/atmel-isc-regs.h
 F:	drivers/media/platform/atmel/atmel-isc.h
 F:	drivers/media/platform/atmel/atmel-sama5d2-isc.c
-- 
2.25.1

