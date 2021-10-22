Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB0E743731D
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 09:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbhJVH4F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 03:56:05 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:55648 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232223AbhJVH4E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 03:56:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634889227; x=1666425227;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JCeKmhJWxbf+RcCJcIJfFnVB9AI8YV+GSaNqCjDMXX4=;
  b=eZUpEJErzWlH/x/UOXeE/+KkmPQOfXn8Zci2AiVnIDrlkRgV1lEuMA9x
   eu3LeXGLnX8NHefJn0K74ukgwOX5zFerTL55zIAnRypVw/p9jfin+xOh3
   lyDSX5rKAYyJkdDaQxFZi0T6uHmVdVpXyqstxr2sfj95IVXK5koiaddxb
   XdJbrSr5Ck2dSlZejyicElrI+jzRqunOBM35/TcZzgeflVX274zYSqkzm
   Oak/UvcYrJNBkeEwWR0r19Z446wKdFWT7pNkoiAvkgAXS3+IundGMrvTY
   NIn8tABjz90o5vAwE5fb+GVC3eVd1skwUx+pMOLgNbT6OYppnBa/yMOMe
   w==;
IronPort-SDR: 2cISAF1DdtTbo4weyyW0yKrwm+zoT9mYmysUSs6euBZfpGfhNrDW6VS2KkkA2JAoP0Z9KxcruA
 0HcZiqFhd6940mtlq0nUkg+/pSLRcUPXcBKseOoHmPfrEm6x535St0VyD4k4RXVeiBvPjoa5r7
 SGvKP7vVfpaSSwfC0VqW8H53Md6EqpcV+Y+UmJHJp0bubNDSWKViHdBjC3WGofc/OYG2NCcxdj
 txBQiqXJ7U3xqv72WBht4DiCsFX5r9sbtvGc3hHusVxf19nuxqArTnLkrdRP64YYJT4aZluUAY
 eTBlzk5gv72AdtZ99i6g7Q66
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="149141115"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Oct 2021 00:53:46 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 00:53:46 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 00:53:42 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <jacopo@jmondi.org>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 01/21] MAINTAINERS: add microchip csi2dc
Date:   Fri, 22 Oct 2021 10:52:27 +0300
Message-ID: <20211022075247.518880-2-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022075247.518880-1-eugen.hristev@microchip.com>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add Microchip CSI2DC driver in the list.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 186cfab07504..dab338f424db 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12252,6 +12252,13 @@ L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
 F:	sound/soc/atmel
 
+MICROCHIP CSI2DC DRIVER
+M:	Eugen Hristev <eugen.hristev@microchip.com>
+L:	linux-media@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
+F:	drivers/media/platform/atmel/microchip-csi2dc.c
+
 MICROCHIP ECC DRIVER
 M:	Tudor Ambarus <tudor.ambarus@microchip.com>
 L:	linux-crypto@vger.kernel.org
-- 
2.25.1

