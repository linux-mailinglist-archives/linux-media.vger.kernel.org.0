Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C45E53543A8
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 17:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241740AbhDEPx4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 11:53:56 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:14552 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235683AbhDEPxz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 11:53:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617638028; x=1649174028;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XFUIMGcuk2LQccy9mIU7wH0R7YLi14N6pV7ElUM4/Mg=;
  b=IuHLq+VHYIrQ+YPzUvrmxmEPBDEDT3mV0HGLPhWqGv56B+KERsobp0NQ
   gaH6xAVwFlRvMPBfjx77HFU4SePLpwyNSDueW+khh24SCY3qT5vJCW3KB
   x3pgR7PJwPzTcBNKZaL9HChkHGG6OhCuXocNwozGM5uWjMAoIMJXQhBYI
   obUnzFOraEef73oWeoB2qCbSvnKxPJ/D8diZLgC6+p3xinDtzsej+uA1O
   HrcpD21k2f+46MQGBOCg0A5doSSbz2L+ubcahDUwsmL4BH84mQDzeiPGl
   eGjQEy4KoQcunKtt431b+8u5Yi3FS4TQzK22hDPioca0r00OChzuewA8T
   g==;
IronPort-SDR: GDsoAM5p8sj/qeh6anODI46y6g5HeJuFm4wRyRGd4veLgXtVO8HPpxgGk2OZ1gIZrp4Gda42ix
 SVcMMFRsB7UTt/ip182jsA8HyOYwslrEuMwkhAnLP3LEHHA417J+0GP7SYOrY4U/gpuqQnvJW/
 dJDXMaVb/66rgUVCHOTvlnPv6K0QY7cMwIYpHQJ+a6+9+fG+lymtcRjWQa6SzLXj/60FuHXGQe
 M0LPMFZ2nrMckbb4uJj2u69yKbj/GvJsMM3sgcYdqohwzdOa6MjQfHjEBqgthJDg5JqzTZt6Ez
 wsc=
X-IronPort-AV: E=Sophos;i="5.81,307,1610434800"; 
   d="scan'208";a="109700892"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2021 08:53:48 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 08:53:48 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Apr 2021 08:53:43 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 07/30] media: atmel: atmel-isc-base: add id to clock debug message
Date:   Mon, 5 Apr 2021 18:50:42 +0300
Message-ID: <20210405155105.162529-8-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405155105.162529-1-eugen.hristev@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
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

