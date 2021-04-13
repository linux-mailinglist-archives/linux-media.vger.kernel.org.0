Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 875DE35DCF5
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 12:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344223AbhDMK7F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 06:59:05 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:18418 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244506AbhDMK7E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 06:59:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311525; x=1649847525;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YdGpj5pJyD3xcZj1C/WFa0LCBD0YJ41qa3FnAsfPwnI=;
  b=WlEJ4Gw072kSGrBkO0AMMsy/EqheU9uAGCbr3aZ4vX+MYYQEnnPfCPnO
   bzny24Fn1MIxNDeQGhjJGh7f9g8gZtJu59I5QHWyjwQPw/P3QAGMLp5Aa
   OuixRbhR1//yjz4Hzt0GrE/moxyRwmDIVBp059wVFDBkfX0g5LtmunrMF
   7vo47Ewohyml5yKwWpsvumul9/k+YXPTybqMzykIyZpLdZ6k36pD6U4NV
   uTVyCTddRVkc6iN/gn7LSFnWDX3TMHN4fhhU/20FV62Kosd5wvZVHoIyB
   q/vLBm291SgCFz85qHmq9SlTfpFM24IQN7XD77EN/wN41nbwwtorTesAA
   g==;
IronPort-SDR: hPtFseEXoz7fZgjIdiZHg0KEknt/iAh6oxij95TdFjXVbDv3G+vv3jhNVHQrc0vDSbqXOaByAL
 LVoPcFwuGlfzvXMhH4UyXLNkfaeYgLXCX0aQaWDx7eG+4Cj31lA7unCHdlN7FwUwdaG8zdJG+N
 0tE14lxyIqtXHa1Q0tN3pe49f6k3mlCELRl5MHhTnbaRkwe6Xklz5DDEO4TdVQReOdmyjg5s1Y
 DQCHjFOSAXzIXnz1eEkFxfGew5XKPHznZ1mSkO8vzJTtTywetFOFxsAgXHavOKo1gIN5895Fcj
 TAU=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="50928209"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 03:58:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 03:58:43 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 03:58:16 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 00/33] media: atmel: atmel-isc: add support for xisc
Date:   Tue, 13 Apr 2021 13:56:58 +0300
Message-ID: <20210413105731.610028-1-eugen.hristev@microchip.com>
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

I converted the atmel-isc binding to yaml format, and added the new binding in yaml
format.

Feedback is appreciated.
Thanks,
Eugen

Changes in v3:
- Adapted commit messages for several commits to explain several acronyms, especially
for submodule names
- Converted atmel-isc binding to yaml
- Converted microchip-xisc binding to yaml
- Updated MAINTAINERS

Changes in v2:
- Fixed krobot warnings with W=1 regarding functions with no prototype
- Fixed new sama7g5 driver to use the new subdev fwnode API in kernel 5.12. my driver was
based on old 5.10 style API.

Eugen Hristev (33):
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
  media: atmel: atmel-isc-sama5d2: remove duplicate define
  dt-bindings: media: atmel-isc: convert to yaml
  dt-bindings: media: add microchip,xisc device bindings
  media: atmel: atmel-isc: add microchip-xisc driver
  MAINTAINERS: update ISC driver bindings file
  MAINTAINERS: add xisc files to isc driver entry

 .../devicetree/bindings/media/atmel,isc.yaml  | 115 ++++
 .../devicetree/bindings/media/atmel-isc.txt   |  65 --
 .../bindings/media/microchip,xisc.yaml        | 129 ++++
 MAINTAINERS                                   |   4 +-
 drivers/media/platform/Makefile               |   1 +
 drivers/media/platform/atmel/Kconfig          |  11 +
 drivers/media/platform/atmel/Makefile         |   2 +
 drivers/media/platform/atmel/atmel-isc-base.c | 381 ++++-------
 drivers/media/platform/atmel/atmel-isc-regs.h | 133 +++-
 drivers/media/platform/atmel/atmel-isc.h      | 122 +++-
 .../media/platform/atmel/atmel-sama5d2-isc.c  | 311 ++++++++-
 .../media/platform/atmel/atmel-sama7g5-isc.c  | 643 ++++++++++++++++++
 12 files changed, 1574 insertions(+), 343 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/atmel,isc.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/atmel-isc.txt
 create mode 100644 Documentation/devicetree/bindings/media/microchip,xisc.yaml
 create mode 100644 drivers/media/platform/atmel/atmel-sama7g5-isc.c

-- 
2.25.1

