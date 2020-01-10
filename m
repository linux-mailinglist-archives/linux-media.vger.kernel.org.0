Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 624971372B0
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 17:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728638AbgAJQSn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 11:18:43 -0500
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:25289 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728500AbgAJQSn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 11:18:43 -0500
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
  Claudiu.Beznea@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Claudiu.Beznea@microchip.com";
  x-sender="Claudiu.Beznea@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Claudiu.Beznea@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Claudiu.Beznea@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: bgvyRviLtSMBagCbW5xU15eyDlYUnS2bKX3SApzPK+ZELkixZqoDg+qhOMwxYIVA+B81vBgAh4
 ppcuQyjdNHfre+ii56Ui0NDTNRyalmYKsAZwv7Y5N4StRauxz+AIxC6ZeLkAy0WkVr3zZswTpO
 ycLeK0lAg4BY5nkGnFCiVtmYJlN5R4cebLc3cwgAzPHcX8DmpXiiCQGUGsPhbNv8wX4QPUlWx3
 3IlYCASxr2soI/fh9+iytkkHg8n3/Yrz8/wmRBH9CWxEb+H7syfZEGmAnIdK8lyzQeD7gnPaBg
 a/Q=
X-IronPort-AV: E=Sophos;i="5.69,417,1571727600"; 
   d="scan'208";a="60748306"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Jan 2020 09:18:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 10 Jan 2020 09:18:40 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.85.251) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Fri, 10 Jan 2020 09:18:32 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>, <vkoul@kernel.org>,
        <eugen.hristev@microchip.com>, <jic23@kernel.org>,
        <knaack.h@gmx.de>, <lars@metafoo.de>, <pmeerw@pmeerw.net>,
        <mchehab@kernel.org>, <lee.jones@linaro.org>,
        <radu_nicolae.pirea@upb.ro>, <richard.genoud@gmail.com>,
        <tudor.ambarus@microchip.com>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <wg@grandegger.com>,
        <mkl@pengutronix.de>, <a.zummo@towertech.it>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-can@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 00/17] add device tree for SAM9X60 SoC and SAM9X60-EK board
Date:   Fri, 10 Jan 2020 18:17:52 +0200
Message-ID: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series add device tree for SAM9X60 SoC and SAM9X60-EK board.
Allong with these, there are patches that documents some compatibles
for SAM9X60's IPs.

Changes in v2:
- replace patch "dt-bindings: at_xdmac: add entry for microchip compatibles"
  by patches:
	- dt-bindings: at_xdmac: add microchip,sam9x60-dma
	- dt-bindings: at_xdmac: remove wildcard.
- replace patch "dt-bindings: atmel-usart: add microchip,<chip>-usart"
  by patches:
	- dt-bindings: atmel-usart: add microchip,sam9x60-{usart, dbgu}
	- dt-bindings: atmel-usart: remove wildcard
- remove patch "dt-bindings: spi_atmel: add microchip,sam9x60-spi"
  as it was accepted
- collect reviewed-by tags

Claudiu Beznea (16):
  dt-bindings: at_xdmac: remove wildcard.
  dt-bindings: at_xdmac: add microchip,sam9x60-dma
  dt-bindings: atmel-can: add microchip,sam9x60-can
  dt-bindings: atmel-tcb: add microchip,sam9x60-tcb
  dt-bindings: atmel-isi: add microchip,sam9x60-isi
  dt-bindings: at91-sama5d2_adc: add microchip,sam9x60-adc
  dt-bindings: atmel-matrix: add microchip,sam9x60-matrix
  dt-bindings: atmel-nand: add microchip,sam9x60-pmecc
  dt-bindings: atmel-sysreg: add microchip,sam9x60-ddramc
  dt-bindings: atmel-smc: add microchip,sam9x60-smc
  dt-bindings: atmel-gpbr: add microchip,sam9x60-gpbr
  dt-bindings: atmel,at91rm9200-rtc: add microchip,sam9x60-rtc
  dt-bindings: atmel-usart: remove wildcard
  dt-bindings: atmel-usart: add microchip,sam9x60-{usart, dbgu}
  dt-bindings: arm: add sam9x60-ek board
  ARM: at91/defconfig: enable MMC_SDHCI_OF_AT91 and MICROCHIP_PIT64B

Sandeep Sheriker Mallikarjun (1):
  ARM: dts: at91: sam9x60: add device tree for soc and board

 .../devicetree/bindings/arm/atmel-at91.yaml        |   6 +
 .../devicetree/bindings/arm/atmel-sysregs.txt      |   1 +
 .../devicetree/bindings/dma/atmel-xdma.txt         |   4 +-
 .../bindings/iio/adc/at91-sama5d2_adc.txt          |   2 +-
 .../devicetree/bindings/media/atmel-isi.txt        |   2 +-
 .../devicetree/bindings/mfd/atmel-gpbr.txt         |   4 +-
 .../devicetree/bindings/mfd/atmel-matrix.txt       |   1 +
 .../devicetree/bindings/mfd/atmel-smc.txt          |   1 +
 .../devicetree/bindings/mfd/atmel-tcb.txt          |   4 +-
 .../devicetree/bindings/mfd/atmel-usart.txt        |  11 +-
 .../devicetree/bindings/mtd/atmel-nand.txt         |   1 +
 .../devicetree/bindings/net/can/atmel-can.txt      |   3 +-
 .../bindings/rtc/atmel,at91rm9200-rtc.txt          |   3 +-
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/at91-sam9x60ek.dts               | 647 +++++++++++++++++++
 arch/arm/boot/dts/sam9x60.dtsi                     | 691 +++++++++++++++++++++
 arch/arm/configs/at91_dt_defconfig                 |   4 +
 17 files changed, 1373 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm/boot/dts/at91-sam9x60ek.dts
 create mode 100644 arch/arm/boot/dts/sam9x60.dtsi

-- 
2.7.4

