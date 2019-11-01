Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43398EC15E
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2019 11:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729789AbfKAKsb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Nov 2019 06:48:31 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:47327 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728242AbfKAKsb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 Nov 2019 06:48:31 -0400
Received: from [IPv6:2001:983:e9a7:1:8c66:a727:bbe6:d244]
 ([IPv6:2001:983:e9a7:1:8c66:a727:bbe6:d244])
        by smtp-cloud8.xs4all.net with ESMTPA
        id QUTjie4qUfrRWQUTkitieE; Fri, 01 Nov 2019 11:48:28 +0100
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.5] Fixes and enhancements
Message-ID: <5b66c0ee-a45d-c85c-7556-6f1bf3648203@xs4all.nl>
Date:   Fri, 1 Nov 2019 11:48:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfG7VN2oIKoHup9L6hXr3/hHXCED+PoFx6cGBvebaYh8xSO/lEjlGZ4Z87pcfTT4AvBUlIIVGD4fOhNmaiITAMWyVV9WezKSv4SDC6BFILwvAmOV/Fd7c
 71sbzOXEcLfTu7rqXyTe24BB5Uwa9GCDfKXBbEclNT//LldQHdYEwxUDn36bCp8iO7EBLoV3o86TH5WRpdgQhvcQCsr+YPz7aLVJm8R3w1SxwVNbe3Dldj38
 yRpcXnN/+gachnD1TZ8sapFDJ+N00criNJLHC/P+c5Y=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit a4260ea49547aa0c84c353f9de5998a0315d89fe:

  media: sun4i: Add H3 deinterlace driver (2019-10-24 19:07:59 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.5o

for you to fetch changes up to fd14a4c8061897a2e2158d7a70a30704593e48bb:

  media: staging/imx: Use a shorter name for driver (2019-11-01 11:44:38 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Andy Shevchenko (1):
      bt819: Reduce amount of F* words in the world

Biju Das (4):
      media: dt-bindings: rcar-vin: Add R8A774B1 support
      media: dt-bindings: rcar-csi2: Add R8A774B1 support
      media: rcar-vin: Enable support for R8A774B1
      media: rcar-csi2: Enable support for R8A774B1

Chris Paterson (1):
      MAINTAINERS: Update MAX2175 & R-Car DRIF driver maintainer email

Colin Ian King (3):
      media: cx231xx: remove redundant assignment to variable status
      media: imx7-mipi-csis: make array 'registers' static const, makes object smaller
      media: vpx3220: make array input_vals static, makes object smaller

Cristiane Naves (1):
      staging: media: allegro-dvt: remove bool comparison

Fabio Estevam (1):
      media: staging/imx: Use a shorter name for driver

Geert Uytterhoeven (2):
      media: fdp1: Fix R-Car M3-N naming in debug message
      media: dt-bindings: rcar_vin: Document RZ/G1 per-board settings

Janusz Krzysztofik (1):
      media: v4l2-subdev: Don't use __u32 internally

Johan Hovold (3):
      media: stkwebcam: fix runtime PM after driver unbind
      media: bdisp: fix memleak on release
      media: radio: wl1273: fix interrupt masking on release

Kangjie Lu (1):
      media: rcar_drif: fix a memory disclosure

Lucas Stach (1):
      media: coda: request to skip kernel mapping for decoded buffers

Niklas Söderlund (3):
      rcar-vin: Do not enumerate unsupported pixel formats
      rcar-vin: Define which hardware supports NV12
      rcar-vin: Add support for outputting NV12

Nishad Kamdar (1):
      media: xilinx: Use the correct style for SPDX License Identifier

Philipp Zabel (2):
      media: coda: fix deadlock between decoder picture run and start command
      media: s5p-jpeg: drop unused components from s5p_jpeg_q_data

Seung-Woo Kim (1):
      media: exynos4-is: Fix recursive locking in isp_video_release()

Vandana BN (1):
      v4l2-core: fix touch support in v4l_g_fmt

YueHaibing (1):
      staging: media: cedrus: use devm_platform_ioremap_resource() to simplify code

zhong jiang (1):
      media: v4l2-dv-timings: Use DIV_ROUND_CLOSEST directly to make it readable

 Documentation/devicetree/bindings/media/renesas,csi2.txt |  1 +
 Documentation/devicetree/bindings/media/renesas,vin.txt  |  5 ++--
 MAINTAINERS                                              |  4 ++--
 drivers/media/i2c/bt819.c                                |  2 +-
 drivers/media/i2c/vpx3220.c                              |  2 +-
 drivers/media/platform/coda/coda-common.c                |  5 ++--
 drivers/media/platform/exynos4-is/fimc-isp-video.c       |  2 +-
 drivers/media/platform/rcar-vin/rcar-core.c              | 10 ++++++++
 drivers/media/platform/rcar-vin/rcar-csi2.c              |  4 ++++
 drivers/media/platform/rcar-vin/rcar-dma.c               |  5 +++-
 drivers/media/platform/rcar-vin/rcar-v4l2.c              | 59 ++++++++++++++++++++++++++++++++++++++---------
 drivers/media/platform/rcar-vin/rcar-vin.h               |  2 ++
 drivers/media/platform/rcar_drif.c                       |  1 +
 drivers/media/platform/rcar_fdp1.c                       |  2 +-
 drivers/media/platform/s5p-jpeg/jpeg-core.c              |  1 -
 drivers/media/platform/s5p-jpeg/jpeg-core.h              |  2 --
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c            |  3 +--
 drivers/media/platform/xilinx/xilinx-dma.h               |  2 +-
 drivers/media/platform/xilinx/xilinx-vip.h               |  2 +-
 drivers/media/platform/xilinx/xilinx-vipp.h              |  2 +-
 drivers/media/platform/xilinx/xilinx-vtc.h               |  2 +-
 drivers/media/radio/radio-wl1273.c                       |  3 +--
 drivers/media/usb/cx231xx/cx231xx-avcore.c               |  2 +-
 drivers/media/usb/stkwebcam/stk-webcam.c                 |  3 +--
 drivers/media/v4l2-core/v4l2-dv-timings.c                |  2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c                     | 33 ++++++++++++++------------
 drivers/media/v4l2-core/v4l2-subdev.c                    |  6 ++---
 drivers/staging/media/allegro-dvt/nal-h264.c             |  2 +-
 drivers/staging/media/imx/imx-media-capture.c            |  6 +++--
 drivers/staging/media/imx/imx7-mipi-csis.c               |  2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c           |  4 +---
 31 files changed, 119 insertions(+), 62 deletions(-)
