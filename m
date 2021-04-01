Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F39A351B7A
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237635AbhDASIp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:08:45 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:20061 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236386AbhDASCY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 14:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617300144; x=1648836144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XFUIMGcuk2LQccy9mIU7wH0R7YLi14N6pV7ElUM4/Mg=;
  b=pfrmYSUlKLYv7+6fkqwlqThXpJzIjGtyZaM7eR2B30pAUnMxap1oeL/D
   aJZW89X3GuHamuIi13fgyIr/M6V/9ssFIEPec49rL/WSezkH0U/5WIKwS
   9RqxnbPt22IKe6ZpewCID/NJ4nDqxJQYrPFJQEKupkrZ75K/+wJS+wtwG
   E/D1pbFQqblFOcIlxWCVAc9KnjKn7FuXoey12Fgzgi4BR4XSRH/foAp1U
   3mvIyWC+B66Ll0OWB2oi1RC+gY58LoY/sbIbTS0u30sdatJBDWUuto7mX
   qHQz7/BG3yYXC/PKG4jYFdeCp3A+5KjRmEZjf9AOvyXzavRZk/cKSuW5K
   Q==;
IronPort-SDR: 6+rrsr41a9Bw6kQQ7Fh0/d5m4vGlH9QKgJsbaNvv10O3x5ESPfJwhvmWnZUIY6bc/SaViTI8Wm
 7hK3CRlyoRiPxzt/n77SXDMySZ9DBnyexsfEStD1NxDsrHNqSkldXnbmsq1pqsv4l7m6nbr0fe
 wjJ0CBhsC5VnthGoEp0daQP/k6avxFLVSqzM+eH0tuvDNxUjAsKdQefH+7mKjqjXZFZ41m7YUy
 ky0qgq4i2sv8TIXVX3cwZFaiJbrV7F2cXkCakd07iAxreQTDfzpEgLq9uvUfw97EFA0NfltPEL
 sQc=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="109338258"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:29:37 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:29:37 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:29:19 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 07/30] media: atmel: atmel-isc-base: add id to clock debug message
Date:   Thu, 1 Apr 2021 14:27:00 +0300
Message-ID: <20210401112723.189107-8-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401112723.189107-1-eugen.hristev@microchip.com>
References: <20210401112723.189107-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the clock id to the debug message regarding clock setup

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 31f63ba90c71..bc036e8ac4fe 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -277,8 +277,8 @@ static int isc_clk_enable(struct clk_hw *hw)
 	unsigned long flags;
 	unsigned int status;
 
-	dev_dbg(isc_clk->dev, "ISC CLK: %s, div = %d, parent id = %d\n",
-		__func__, isc_clk->div, isc_clk->parent_id);
+	dev_dbg(isc_clk->dev, "ISC CLK: %s, id = %d, div = %d, parent id = %d\n",
+		__func__, id, isc_clk->div, isc_clk->parent_id);
 
 	spin_lock_irqsave(&isc_clk->lock, flags);
 	regmap_update_bits(regmap, ISC_CLKCFG,
-- 
2.25.1

