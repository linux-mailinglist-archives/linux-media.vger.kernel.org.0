Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7323D44E8A0
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 15:27:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235144AbhKLO3w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 09:29:52 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:12832 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235134AbhKLO3v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 09:29:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636727220; x=1668263220;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5Ykrc77zXqjDZcK7PJuiGa4d3XlDx6pKdtXEGGeehUM=;
  b=sO+Mct9RVj2D3zLhz3lRkJ7+c11fu2EbNy0qpQksFx99vrzYBxl6/0rL
   ROtt7zFIU40MZY8h9HS06iww0BgwjL7PcfzB95nKF3dkjqsdluc+5fk1n
   uxi3ivxNszeQI9asu7nUssiQbQNqWx3gzdYIbh7O51Qlb2myHLHqGhjK7
   1u2f5sIDXooJhLH2HDNBpu7Y3LCgpyIPOEJCtbwpSXPp8xSySZZH7OYb3
   sbGv+3rQGT04X+hpX+3UcIaWDQZmvSBKYX4GokFzKCyvQFXaTcQTUQFM0
   M4eiRpowq2PbKsZuNQN0SNJRsuS1yF+ZuyWdPduo0FywEmW/qKuPyUhNS
   w==;
IronPort-SDR: GVI+464TtpD4ouZP2eFFyDwaXpuGCKSPAXjjibzON5xewaCmsRl57kMTY/Joiu/Ed4roZthl1t
 rxQ7SedNs6Gx8pIY0j9E5AathjOudGYeWHXj5nG3Vf8p4YdFwLdKcZ23OrgrJd2VgfRG2063GK
 Datn1fT6CxbWJHLoOC/8dNezV88IY8sWBL/CtymEBSu+Z5IMpglWfQU0A+G2gSluAKuw7GoFn9
 fAIovzaIvqpdId6KZNXjVxxbheId3szkmn1OtZnGb7ebZOGwVfJc0oC4z5j85lSsn6UG9RpBFV
 +pmH3/WH3JwoWPWx07AOBnOt
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="151718676"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Nov 2021 07:25:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 12 Nov 2021 07:25:48 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 12 Nov 2021 07:25:42 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jacopo@jmondi.org>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 01/25] MAINTAINERS: add microchip csi2dc
Date:   Fri, 12 Nov 2021 16:24:45 +0200
Message-ID: <20211112142509.2230884-2-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112142509.2230884-1-eugen.hristev@microchip.com>
References: <20211112142509.2230884-1-eugen.hristev@microchip.com>
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
index 486bdf97f754..545c642c937f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12422,6 +12422,13 @@ L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
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

