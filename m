Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04B91EDA98
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 09:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbfKDIbX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 03:31:23 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:54219 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726441AbfKDIbX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Nov 2019 03:31:23 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id RXldiZho09P9bRXlgiV9mj; Mon, 04 Nov 2019 09:31:21 +0100
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL v2 FOR v5.5] Fixes and enhancements
Message-ID: <3db3e4e9-c403-7e63-7b0f-dd8dfa76ebcd@xs4all.nl>
Date:   Mon, 4 Nov 2019 09:31:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfEBJUkASp2FsaoZVKhsrgLxOc1rhl2WWKMujoklUcdy39gaVMVsvdz3DqAbE4CtAK4RD10nrYNMHmuzW7e9MnTxs+0huzYrPbVLyD0oxTganNhjJ3OE6
 J5IwHhGi9yE9qUVQ1sz2IpStrQ76hxYwgjbxuZ51e+R/GUZceU3TlZ+rCCy0VGeimcaW56BXaWCJiA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes since v1:

Dropped patch "media: stkwebcam: fix runtime PM after driver unbind" as it is
already merged upstream.

Regards,

	Hans

The following changes since commit a4260ea49547aa0c84c353f9de5998a0315d89fe:

  media: sun4i: Add H3 deinterlace driver (2019-10-24 19:07:59 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.5o

for you to fetch changes up to fc8ef8941162f8c8f4a701608f4dd65ab5dedb59:

  media: staging/imx: Use a shorter name for driver (2019-11-04 09:27:11 +0100)

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

Johan Hovold (2):
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
 MAINTAINERS                                              |  4 +--
 drivers/media/i2c/bt819.c                                |  2 +-
 drivers/media/i2c/vpx3220.c                              |  2 +-
 drivers/media/platform/coda/coda-common.c                |  5 ++--
 drivers/media/platform/exynos4-is/fimc-isp-video.c       |  2 +-
 drivers/media/platform/rcar-vin/rcar-core.c              | 10 ++++++++
 drivers/media/platform/rcar-vin/rcar-csi2.c              |  4 +++
 drivers/media/platform/rcar-vin/rcar-dma.c               |  5 +++-
 drivers/media/platform/rcar-vin/rcar-v4l2.c              | 59 +++++++++++++++++++++++++++++++++++---------
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
 drivers/media/v4l2-core/v4l2-dv-timings.c                |  2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c                     | 33 ++++++++++++++-----------
 drivers/media/v4l2-core/v4l2-subdev.c                    |  6 ++---
 drivers/staging/media/allegro-dvt/nal-h264.c             |  2 +-
 drivers/staging/media/imx/imx-media-capture.c            |  6 +++--
 drivers/staging/media/imx/imx7-mipi-csis.c               |  2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c           |  4 +--
 30 files changed, 118 insertions(+), 60 deletions(-)
