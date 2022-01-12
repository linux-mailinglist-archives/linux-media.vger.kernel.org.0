Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E998048C508
	for <lists+linux-media@lfdr.de>; Wed, 12 Jan 2022 14:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353686AbiALNkW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jan 2022 08:40:22 -0500
Received: from ewsoutbound.kpnmail.nl ([195.121.94.168]:42138 "EHLO
        ewsoutbound.kpnmail.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353678AbiALNkU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jan 2022 08:40:20 -0500
X-KPN-MessageId: 15e615a0-73ad-11ec-8862-005056aba152
Received: from smtp.kpnmail.nl (unknown [10.31.155.40])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 15e615a0-73ad-11ec-8862-005056aba152;
        Wed, 12 Jan 2022 14:39:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:subject:from:to:mime-version:date:message-id;
        bh=kUw1q8lYwah89IDezIDUJ5tamVST3Smh2th+4LRUzSk=;
        b=hKI8x2uQLED5pMZKIJjSBa6NMdbzsUR0IEbx5p/T1084+wikW42D8L731h9+Iny+nOqMXVPQvsFge
         dMbmI6oH9WT1VuZzH81Kykw/VKPwOcrQjSALlGumWvGdznz1TFnRO1ot/ZQvFBDyNeQUdxXLtmLSec
         HCADzn5hoR3ZQ2Dhryiypuw43Wgtm0M9eKWasPaXJI3Ma3XxkE6S/wmjyRT9PiLCIXljS5GDw+Asmk
         SIDJ26w5b+thXN9+L31QUYJcJX+NxqdV76W9K3V0afh1vybMxQoinX5rWoeoXhlbWgOZ2e4ONCnvzj
         NAVto8Mc2NWUc88Z6tlEcxg2PgwrxPg==
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|+XjcYsfKoQv15JYK2X9t1a/X4V3u7I/N7+7UvK4tFyskXuQ6Al7doij9RmeV5DL
 aN3hHnugXgV/hVCrcc/ZYHw==
X-Originating-IP: 193.91.129.219
Received: from [192.168.2.10] (cdb815bc1.dhcp.as2116.net [193.91.129.219])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 2dc28d95-73ad-11ec-b76f-005056ab7584;
        Wed, 12 Jan 2022 14:40:18 +0100 (CET)
Message-ID: <282f0afd-0ed1-008d-1c0b-5a547fdb3d5e@xs4all.nl>
Date:   Wed, 12 Jan 2022 14:40:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     "Eugen.Hristev@microchip.com" <Eugen.Hristev@microchip.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.18] Add microchip csi2dc, atmel fixes, HEVC staging
 fixes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Note that the patches from Eugen are cherry-picked from this larger series:

https://patchwork.linuxtv.org/project/linux-media/cover/20211213134940.324266-1-eugen.hristev@microchip.com/

Specifically I picked patches 1-6, 8-9, 11, 16 and 18-22.

Regards,

	Hans

The following changes since commit 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c:

  media: ipu3-cio2: Add support for instantiating i2c-clients for VCMs (2021-12-16 20:58:56 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.18c

for you to fetch changes up to d95a0064b13926fc42d6da65a1ada0e98c8fdb13:

  media: hevc: Embedded indexes in RPS (2022-01-12 12:59:50 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benjamin Gaignard (2):
      media: hevc: Remove RPS named flags
      media: hevc: Embedded indexes in RPS

Eugen Hristev (13):
      MAINTAINERS: add microchip csi2dc
      dt-bindings: media: atmel: csi2dc: add bindings for microchip csi2dc
      media: atmel: introduce microchip csi2dc driver
      media: atmel: atmel-isc: split the clock code into separate source file
      media: atmel: atmel-isc: replace video device name with module name
      media: atmel: atmel-sama7g5-isc: fix ispck leftover
      media: atmel: atmel-isc-base: remove frameintervals VIDIOC
      media: atmel: atmel-isc-base: report frame sizes as full supported range
      media: atmel: atmel-isc-base: fix bytesperline value for planar formats
      media: atmel: atmel-isc-base: add wb debug messages
      media: atmel: atmel-isc-base: clamp wb gain coefficients
      media: atmel: atmel-sama7g5-isc: fix UYVY input format mbus_code typo
      media: atmel: atmel-isc: add raw Bayer 8bit 10bit output formats

 Documentation/devicetree/bindings/media/microchip,csi2dc.yaml | 197 +++++++++
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst     |  16 +-
 MAINTAINERS                                                   |  14 +-
 drivers/media/platform/Makefile                               |   1 +
 drivers/media/platform/atmel/Kconfig                          |  15 +
 drivers/media/platform/atmel/Makefile                         |   4 +-
 drivers/media/platform/atmel/atmel-isc-base.c                 | 397 +++---------------
 drivers/media/platform/atmel/atmel-isc-clk.c                  | 311 ++++++++++++++
 drivers/media/platform/atmel/atmel-isc.h                      |  11 +
 drivers/media/platform/atmel/atmel-sama5d2-isc.c              |  24 ++
 drivers/media/platform/atmel/atmel-sama7g5-isc.c              |  32 +-
 drivers/media/platform/atmel/microchip-csi2dc.c               | 806 +++++++++++++++++++++++++++++++++++++
 drivers/staging/media/hantro/hantro_g2_hevc_dec.c             |  27 +-
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c              |   2 +-
 include/media/hevc-ctrls.h                                    |   6 +-
 15 files changed, 1470 insertions(+), 393 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
 create mode 100644 drivers/media/platform/atmel/atmel-isc-clk.c
 create mode 100644 drivers/media/platform/atmel/microchip-csi2dc.c
