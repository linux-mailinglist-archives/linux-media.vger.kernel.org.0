Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69EA344E89A
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 15:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235035AbhKLO2b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 09:28:31 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:51712 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231718AbhKLO2b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 09:28:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636727140; x=1668263140;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rgh69Aka38+wNe9PcLbeZQ3RfJdiFvu3KYCjuQBZciE=;
  b=xser0l3cekUeGQAr4syIGRDqm93yRVDmpyQCsMf0OO9ULm9qdE1xJKZj
   MYr8nw8s5cKbVgDVLVJpFtBK6wVB/eESZUR4M+JuMvHIQr+HjfhYLL6qB
   wc8NsuTLTepbJQAAe8BW1CF8GoNdd5b7sAwQWGXZ975ZVQp/b39CNbIYI
   DBZ/b+omi5vndg/zKhC83T73ReI96jX0vSQ75UN9uo4E6JQdCfWw1NrSQ
   DquQZY94BQwUIxskmgxz2VNZK6mFSur6k8uX25q+IOfEUs9FoYZEQo1qe
   CA0h5h9VvdT3R7m3aOCL1yuCGNX9KlLqYOkci9kDJ6Y4oPqSFhZc4Rw1Q
   Q==;
IronPort-SDR: vWmOqrKR1QW6KA5o66Xy8DcxWLVwCHRqFVV0Z6j0UW39z2JAFb8p2MecPxPgctaWsSlFMRMJsW
 8i9jDNYP5KaQxmq4bAvNOYcvDVPMxtXKS+YoFK7xASITpwH33/GCGEcpJgJSIe2TlVvvsx0U7f
 U2SRcSdNwAa0ovA5V1ODuqtW3RRSocAwwMNyl0FD3Ti3GPnP8AHFdEh9Z4xF6EbSPE+ANjRfqN
 IFwg3QHF3PEHZKSXNus4ixoTnLb1RLtqaiqw7R91Cwiyc7cVyROWfGMfxDFqiivvd94i3NDZfq
 NBu+R5Rn22f7V6IEcV6cZssi
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="143729456"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Nov 2021 07:25:39 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 12 Nov 2021 07:25:39 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 12 Nov 2021 07:25:28 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jacopo@jmondi.org>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 00/25] media: atmel: atmel-isc: implement media controller
Date:   Fri, 12 Nov 2021 16:24:44 +0200
Message-ID: <20211112142509.2230884-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series is the v2 of the series that attempts to support media controller
in the atmel ISC and XISC drivers.
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

Changes in v2:
- integrated many changes suggested by Jacopo in the review of the v1 series.
- add a few new patches


Eugen Hristev (25):
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
  media: atmel: atmel-sama7g5-isc: fix UYVY input format mbus_code typo
  media: atmel: atmel-isc: add raw Bayer 8bit 10bit output formats
  media: atmel: atmel-isc: compact the controller formats list
  media: atmel: atmel-isc: change format propagation to subdev into only
    verification

 .../bindings/media/microchip,csi2dc.yaml      | 159 ++++
 MAINTAINERS                                   |   9 +
 arch/arm/boot/dts/sama7g5.dtsi                |  49 ++
 arch/arm/configs/multi_v7_defconfig           |   3 +
 arch/arm/configs/sama7_defconfig              |   2 +
 drivers/media/platform/Makefile               |   1 +
 drivers/media/platform/atmel/Kconfig          |  15 +
 drivers/media/platform/atmel/Makefile         |   4 +-
 drivers/media/platform/atmel/atmel-isc-base.c | 788 ++++++-----------
 drivers/media/platform/atmel/atmel-isc-clk.c  | 311 +++++++
 drivers/media/platform/atmel/atmel-isc-mc.c   | 287 +++++++
 drivers/media/platform/atmel/atmel-isc.h      |  49 ++
 .../media/platform/atmel/atmel-sama5d2-isc.c  |  59 +-
 .../media/platform/atmel/atmel-sama7g5-isc.c  |  72 +-
 .../media/platform/atmel/microchip-csi2dc.c   | 797 ++++++++++++++++++
 15 files changed, 2036 insertions(+), 569 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
 create mode 100644 drivers/media/platform/atmel/atmel-isc-clk.c
 create mode 100644 drivers/media/platform/atmel/atmel-isc-mc.c
 create mode 100644 drivers/media/platform/atmel/microchip-csi2dc.c

-- 
2.25.1

