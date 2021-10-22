Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED2C437326
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 09:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232404AbhJVH4Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 03:56:24 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:22728 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232324AbhJVH4Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 03:56:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634889239; x=1666425239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XEDYPt5D/N3RVUcKR9/1kimB4x9GpFaJKFi+qV15Yrg=;
  b=iyMc94ieMuNUsTAIwe/IvcVViW3ik8+eg3+P2CcA/8up1RPu+pWGW3+t
   3+i7mqlH5RT68W8po7KswoA0DRFhnzBsIWDO+tsduF/iXXEU4DLc51if1
   yWM3ML5DA4SJuXIwfeT/bKZEmakNfbBPkMCxtw46eOcb9bkXQ5LXOmbEX
   5/U/4+A+bNiphH/KozOqtF0XhRZh0yaEzZ5ZYfZ3wbbILWPSuIXmqELNm
   CHRgzGd5egQtOVvsayETbodjcrYRv5rJcmFK17CgYvPbhriyEV81qoiJ7
   5UK2+RMmzRd+KmR1X3+jbzjYl3jhM0yXaJpyvJaSTs2nSImyMwW1/eiL0
   g==;
IronPort-SDR: K+cFbPjU3jloI+pAo075LzbTT3GZFx10RMyyIt4dbdTl8SGND4M6yR7vLqAHlq1pHZ4oiv2PMD
 NUnSl70CjNgbkCrbQYxMnKjXM+9egoP/YLzvvbnxI4Sn9MY10bwHs/7AR0xh0J9x8WU94kjOPm
 hDM04ibFnYhEFiy0yIwEg6fFrSRxHF7s0PZMsrbYKSbAatslNXSVUhDMn1RAnlQVPRTMr6ZY1b
 APwCXgCvCc2uUkAHa1Bzc6K7DQLBnBPglnhfMgrZnaK/Zw7vV6+a3teCKtvC9tv3Shgpatp4cS
 13SNCbY3aMEWrZi3SrH08kr0
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="73928959"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Oct 2021 00:53:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 00:53:57 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 00:53:54 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <jacopo@jmondi.org>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 04/21] MAINTAINERS: atmel-isc: add new file atmel-isc-clk.c
Date:   Fri, 22 Oct 2021 10:52:30 +0300
Message-ID: <20211022075247.518880-5-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022075247.518880-1-eugen.hristev@microchip.com>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
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
index dab338f424db..e151716c8d1e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12279,6 +12279,7 @@ S:	Supported
 F:	Documentation/devicetree/bindings/media/atmel,isc.yaml
 F:	Documentation/devicetree/bindings/media/microchip,xisc.yaml
 F:	drivers/media/platform/atmel/atmel-isc-base.c
+F:	drivers/media/platform/atmel/atmel-isc-clk.c
 F:	drivers/media/platform/atmel/atmel-isc-regs.h
 F:	drivers/media/platform/atmel/atmel-isc.h
 F:	drivers/media/platform/atmel/atmel-sama5d2-isc.c
-- 
2.25.1

