Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3E7351E37
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237889AbhDASg2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:36:28 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:60700 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240278AbhDAS37 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 14:29:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617301800; x=1648837800;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ANYILC4KFHHPOqkn3Kt/JVVfmJ/GX8EhWAKE0t/gtX8=;
  b=LhYzEU+8cuDHUQP9CfxBHw/dnVN+toKUzlAyzjLAPqpkNVXwtLvMukOJ
   mKo3izcuXHV2CIHv2kQuEWdlDM3hN5cfwPaiuVKs7ZTA4cNq/R3FpvnSa
   GgwBVwMuDlBehrdUZeGFAJJVrQ7+CbMkbDeju0rW0ln+hkxPWjEPYwMno
   DQB2JVwc/nUScspDGh6NXEiEPfc2SR0EiG5ApUJp/CqevBwVSSoYMRD/m
   jSPg3zVsio3bCqYBVp/vlUNvm2GBBTjc2+7H64UdSo5gWCXHnJeL0T/0G
   Rz95ctVh7kVSAdfSUDgr8D8Ez3Gg6LX4UbDtOA4L4Pey/ct5dWQnqnMO9
   g==;
IronPort-SDR: Iz8F7oHxV6Abz+7VeBkfcXFpT9QpcizyiA6y8O6wWPqYn/JqBa179FmtHZefzDzRLk4Kw9bPN/
 4jKbh+sSl4eIQAN+I2Z6IhXnVUTf8LOvYq6WZhmtkACaVZPMoEAxymEQp/+fRK+XYT6FXcWI4q
 sfWekB/xd4SM7tUURRDGtzqkViZ/RvNt9kq0TV6TEQ5lvWMa8hRGYv6XIl1xBf+2ziHGEc4yBk
 DYE7g/prGfH64yQC0eQBvh5CeOA/UsNBhbyn4MQaaRWIuvFaAgCdMrwfFv4i+z5adsrXucamtS
 9YE=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="114976396"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:28:25 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:28:23 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:28:06 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 00/30] media: atmel: atmel-isc: add support for xisc
Date:   Thu, 1 Apr 2021 14:26:53 +0300
Message-ID: <20210401112723.189107-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series adds support for a variant of the ISC named XISC.
This block is present in the product named sama7g5.

I started by moving code around, the code which was specialized for sama5d2
type of ISC, to have it inside the dedicated sama5d2 file.

I added several new pipeline elements to the code base, which would be common
to sama5d2 and the new sama7g5, but only used by the new style pipeline.

I separated the input and output formats on a per-product separate array.

I added the new sama7g5 compatible driver for the xisc, which is similar with
the sama5d2, but with differences in terms of DT, clocks and callbacks to
specific operations.

I added the binding for the xisc by copying and modifying the existing
isc one. I know that it has to be converted to yaml, and I will do that if
it looks good.

Feedback is appreciated.
Thanks,
Eugen

Eugen Hristev (30):
  media: atmel: atmel-isc: specialize gamma table into product specific
  media: atmel: atmel-isc: specialize driver name constant
  media: atmel: atmel-isc: add checks for limiting frame sizes
  media: atmel: atmel-isc: specialize max width and max height
  media: atmel: atmel-isc: specialize dma cfg
  media: atmel: atmel-isc: extract CSC submodule config into separate
    function
  media: atmel: atmel-isc-base: add id to clock debug message
  media: atmel: atmel-isc: create register offsets struct
  media: atmel: atmel-isc: extract CBC submodule config into separate
    function
  media: atmel: atmel-isc: add CBC to the reg offsets struct
  media: atmel: atmel-isc: add SUB422 and SUB420 to register offsets
  media: atmel: atmel-isc: add RLP to register offsets
  media: atmel: atmel-isc: add HIS to register offsets
  media: atmel: atmel-isc: add DMA to register offsets
  media: atmel: atmel-isc: add support for version register
  media: atmel: atmel-isc: add his_entry to register offsets
  media: atmel: atmel-isc: add register description for additional
    modules
  media: atmel: atmel-isc: extend pipeline with extra modules
  media: atmel: atmel-isc: add CC initialization function
  media: atmel: atmel-isc: create product specific v4l2 controls config
  media: atmel: atmel-isc: create callback for DPC submodule product
    specific
  media: atmel: atmel-isc: create callback for GAM submodule product
    specific
  media: atmel: atmel-isc: create callback for RLP submodule product
    specific
  media: atmel: atmel-isc: move the formats list into product specific
    code
  media: atmel: atmel-isc: create an adapt pipeline callback for product
    specific
  media: atmel: atmel-isc-regs: add additional fields for sama7g5 type
    pipeline
  media: atmel: atmel-isc-base: add support for more formats and
    additional pipeline modules
  dt-bindings: media: atmel: add microchip-xisc binding
  media: atmel: atmel-isc-sama5d2: remove duplicate define
  media: atmel: atmel-isc: add microchip-xisc driver

 .../bindings/media/microchip-xisc.txt         |  64 ++
 drivers/media/platform/Makefile               |   1 +
 drivers/media/platform/atmel/Kconfig          |  11 +
 drivers/media/platform/atmel/Makefile         |   2 +
 drivers/media/platform/atmel/atmel-isc-base.c | 381 ++++-------
 drivers/media/platform/atmel/atmel-isc-regs.h | 133 +++-
 drivers/media/platform/atmel/atmel-isc.h      | 122 +++-
 .../media/platform/atmel/atmel-sama5d2-isc.c  | 300 +++++++-
 .../media/platform/atmel/atmel-sama7g5-isc.c  | 644 ++++++++++++++++++
 9 files changed, 1381 insertions(+), 277 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/microchip-xisc.txt
 create mode 100644 drivers/media/platform/atmel/atmel-sama7g5-isc.c

-- 
2.25.1

