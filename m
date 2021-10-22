Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEE53437319
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 09:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbhJVH4A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 03:56:00 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:55648 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231773AbhJVH4A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 03:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634889223; x=1666425223;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=y+D2FT5j/LnL8Qi8aQ+TfjOl9CoE/Lrl6PtCtaRjKGg=;
  b=H4QgZT9xpVpyP0p8zEZg6uuqCmCyyFmMC7tP3lWrIobmsYUDvpBLC90p
   oX/eeW5NuZYXcIxDajOtkqhlan6nztEY1MMReDzrQoAOqKEQla1EyJRTs
   idyV/DC/JuGhLw3Foz6nGIjpFZ20sz+ch1YtOLykYWROpmkBdm50QD8Ax
   Gk8WjGf50Uk4nOZm/vCfGU3YrLnqwfvJQexDOQiGeAdr8AcITYQgqKjXn
   OotNukvllbFitK0NPAZ34b9vsykZLrrNf+zr6uyWx2oP9VNBiLOvF7D3f
   vq4ykCS7+DF2KkQnLNPKLHatreIIegq5xyNxqXRT5gk0bvgUUPo+82zGa
   A==;
IronPort-SDR: 9OpEuHiaqkKxHlZNKOn0MdTfU1kpWH1SRmNmjyHpOOr6EKaHUwnMz0Y83XpVwU5RzRzIYUx1Q6
 WK+CXusf3hib6LAJ5wB5FpVkZGoigRwbnNlMyIG2nIeTAJdEOI/vw/jqvi/uwPe7YVnXuzR/iF
 9TtivW6wG1Q8WSNyYgpC20+19eXUKJJZZ4ukqWa3b53WYuEgogrRwc8KgkrwwGbWNLotS45uBe
 +rQgBeRW8Ws3kLiQL/Y+L9CmVGUm8Ev2tA4hU4C4oF75BYYDNG+Cw406Nk6oNs5TTZPtk/Ma5B
 tlaGHQ76YvJUlXdTvwZ6evcB
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="149141099"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Oct 2021 00:53:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 00:53:41 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 00:53:38 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <jacopo@jmondi.org>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 00/21] media: atmel: atmel-isc: implement media controller
Date:   Fri, 22 Oct 2021 10:52:26 +0300
Message-ID: <20211022075247.518880-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series is a first attempt to support media controller in the atmel
ISC and XISC drivers.
This series also includes the csi2dc driver which was previously sent in a
separate series:
https://www.spinics.net/lists/linux-media/msg181042.html
https://www.spinics.net/lists/linux-media/msg181044.html
The driver now addresses comments received in latest v5 series from last year.

The series includes some minor changes and fixes that improve the isc common
code base, like removing the enum frameintervals VIDIOC, fixing bytesperline
for planar formats, etc.

Many thanks to folks from libcamera who helped a lot with understanding
how a media controller driver should behave.

Feedback is welcome !


Eugen Hristev (21):
  MAINTAINERS: add microchip csi2dc
  dt-bindings: media: atmel: csi2dc: add bindings for microchip csi2dc
  media: atmel: introduce microchip csi2dc driver
  MAINTAINERS: atmel-isc: add new file atmel-isc-clk.c
  media: atmel: atmel-isc: split the clock code into separate source
    file
  media: atmel: atmel-isc: replace video device name with module name
  media: atmel: atmel-sama7g5-isc: fix ispck leftover
  media: atmel: atmel-isc-base: use streaming status when queueing
    buffers
  media: atmel: atmel-isc-base: remove frameintervals VIDIOC
  media: atmel: atmel-isc-base: report frame sizes as full supported
    range
  media: atmel: atmel-isc-base: implement mbus_code support in enumfmt
  media: atmel: atmel-isc-base: fix bytesperline value for planar
    formats
  MAINTAINERS: atmel-isc: add new file atmel-isc-mc.c
  media: atmel: atmel-isc: implement media controller
  ARM: dts: at91: sama7g5: add nodes for video capture
  ARM: configs: at91: sama7: add xisc and csi2dc
  ARM: multi_v7_defconfig: add atmel video pipeline modules
  media: atmel: atmel-sama5d2-isc: fix wrong mask in YUYV format check
  media: atmel: atmel-isc-base: use mutex to lock awb workqueue from
    streaming
  media: atmel: atmel-isc-base: add wb debug messages
  media: atmel: atmel-isc-base: clamp wb gain coefficients

 .../bindings/media/microchip,csi2dc.yaml      | 149 ++++
 MAINTAINERS                                   |   9 +
 arch/arm/boot/dts/sama7g5.dtsi                |  49 ++
 arch/arm/configs/multi_v7_defconfig           |   3 +
 arch/arm/configs/sama7_defconfig              |   2 +
 drivers/media/platform/atmel/Kconfig          |  15 +
 drivers/media/platform/atmel/Makefile         |   3 +-
 drivers/media/platform/atmel/atmel-isc-base.c | 515 ++++---------
 drivers/media/platform/atmel/atmel-isc-clk.c  | 316 ++++++++
 drivers/media/platform/atmel/atmel-isc-mc.c   | 235 ++++++
 drivers/media/platform/atmel/atmel-isc.h      |  33 +
 .../media/platform/atmel/atmel-sama5d2-isc.c  |  16 +-
 .../media/platform/atmel/atmel-sama7g5-isc.c  |  18 +-
 .../media/platform/atmel/microchip-csi2dc.c   | 700 ++++++++++++++++++
 14 files changed, 1686 insertions(+), 377 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
 create mode 100644 drivers/media/platform/atmel/atmel-isc-clk.c
 create mode 100644 drivers/media/platform/atmel/atmel-isc-mc.c
 create mode 100644 drivers/media/platform/atmel/microchip-csi2dc.c

-- 
2.25.1

