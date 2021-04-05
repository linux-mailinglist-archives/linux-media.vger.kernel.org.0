Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BEC1354394
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 17:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241664AbhDEPvu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 11:51:50 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:36121 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236221AbhDEPvu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 11:51:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617637904; x=1649173904;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IzWL5rMe178emJ/yAcOpVpD5OzbH2As9J+9cxuGn0Pw=;
  b=A3waNLpwEfvAiUbC6BgK4n5EG9I4gOmJSm8QtcfdRuvoDO7kFgFwkTNw
   JmbvIeLWwk4/2ZBXRd8FGB8Tad73zGA+wLDaJ65n+UrEKv7Gbe9d+jRKL
   U/A3S24rl3zJisn9XDuPvWtYDnQc4UKXwZJCDsIkVyTrh1r9JUER/4h1T
   iT/K4qVboPeLadqiN1JmFomgsjPKZhj/eWNUb+kmluss99OZFrZPsodA5
   2sV+3S8EXTjcyfgBrvULSGXtgXBawC2lGdYQp1c5gt0pOHIE/rZQyFjKg
   Obn2sZ0GTmvNqPw7gdQ8WzSKec6RVVsH9dXQvI3b+ji5xzvIcERYrRk73
   g==;
IronPort-SDR: o3t4j2y0EjXDeXDZpHFdMS3OyBfD3hRPyVZhv0TLCA7/MHgCWcYEe0A+wCcJ9XpUcZv4vsOVtJ
 hzL0Ik4StmbQaZy/65e41qbXf9DvKhq1U+AnX/EQdBwbqfk0drzjiqa+FQLxK2jDvFZF+Jm2Da
 fVE/3n7QE54KCmCE1NWh/8KfrxGR6dBC/AkedLpVyqgAmlmdEnK0NZSd1Tc87OPEyOl+KlgnT0
 XL7KNfnIoZiMsq28roqI0J4NdQO0hant5ZyolDxXkCN8UnbVKiN7tzWrXTPQek+0X8XoNf2SQn
 D3c=
X-IronPort-AV: E=Sophos;i="5.81,307,1610434800"; 
   d="scan'208";a="112481451"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2021 08:51:43 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 08:51:43 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Apr 2021 08:51:24 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 00/30] media: atmel: atmel-isc: add support for xisc
Date:   Mon, 5 Apr 2021 18:50:35 +0300
Message-ID: <20210405155105.162529-1-eugen.hristev@microchip.com>
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

Changes in v2:
- Fixed krobot warnings with W=1 regarding functions with no prototype
- Fixed new sama7g5 driver to use the new subdev fwnode API in kernel 5.12. my driver was
based on old 5.10 style API.

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
 .../media/platform/atmel/atmel-sama5d2-isc.c  | 311 ++++++++-
 .../media/platform/atmel/atmel-sama7g5-isc.c  | 643 ++++++++++++++++++
 9 files changed, 1391 insertions(+), 277 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/microchip-xisc.txt
 create mode 100644 drivers/media/platform/atmel/atmel-sama7g5-isc.c

-- 
2.25.1

