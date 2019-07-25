Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4BAE74969
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 10:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389900AbfGYIxp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 04:53:45 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:56647 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389905AbfGYIxp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 04:53:45 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id qZVLhCf8BLqASqZVOhSSBr; Thu, 25 Jul 2019 10:53:42 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.4] Various fixes, removal of davince_vpfe, bcm2048
Message-ID: <0a30f1e2-1869-770d-4d56-7bc4c2abf0e9@xs4all.nl>
Date:   Thu, 25 Jul 2019 10:53:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfODa49cg/MLBpddHIER+L9nRBiKhPzTskmLr4i18cL5SPIBsELjrjoeEXZLrByzHg6T7aBctJb/IR9nWd0xJtKccdHUdjWwrucOpL0cuQBrCG8U+Grn9
 dlrx1VDNCTqVd5D3+SE/YrDnFQkesDeFajLFgy1spktdWjZEHgCKxVZATFBpNJJCkMZHohmvXU4+rQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit e2727ec58c113c2c95cbb75f6a129bd1fa0bf761:

  media: vimc.rst: add vimc-streamer source documentation (2019-07-23 11:55:00 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.4d

for you to fetch changes up to 73799e9d5776150e2d358d654f4045d352cb3fd3:

  vivid: fix typo: use -> user (2019-07-25 10:06:56 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Arnd Bergmann (1):
      media: staging: davinci: remove vpfe driver

Dmitry Osipenko (1):
      media: dt: bindings: tegra-vde: Document new optional IOMMU property

Ezequiel Garcia (1):
      media: v4l: ctrls: Add debug messages

Guillaume Tucker (1):
      media: vivid: fix device init when no_error_inj=1 and fb disabled

Hans Verkuil (6):
      v4l2-dev/ioctl: require non-zero device_caps, verify sane querycap results
      sh_veu: convert to struct v4l2_fh
      davinci/vpfe_capture.c: drop unused format descriptions
      am437x: remove unused struct vpfe_pixel_format
      staging/media/bcm2048: remove driver
      vivid: fix typo: use -> user

Joe Perches (1):
      staging: media: cedrus: Fix misuse of GENMASK macro

Lubomir Rintel (1):
      media: marvell-ccic: mmp: add MODULE_DEVICE_TABLE

Luke Nowakowski-Krijger (1):
      media: hdpvr: Add device num check and handling

Niklas Söderlund (2):
      rcar-vin: Clean up correct notifier in error path
      rcar-vin: Centralize black listing of pixel formats

 Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt |    2 +
 Documentation/media/kapi/v4l2-dev.rst                        |    1 +
 drivers/media/platform/am437x/am437x-vpfe.h                  |    6 -
 drivers/media/platform/davinci/vpfe_capture.c                |   51 +-
 drivers/media/platform/marvell-ccic/mmp-driver.c             |    1 +
 drivers/media/platform/omap3isp/ispvideo.c                   |    4 +-
 drivers/media/platform/rcar-vin/rcar-core.c                  |    2 +-
 drivers/media/platform/rcar-vin/rcar-dma.c                   |    2 +-
 drivers/media/platform/rcar-vin/rcar-v4l2.c                  |   23 +-
 drivers/media/platform/rcar-vin/rcar-vin.h                   |    4 +-
 drivers/media/platform/sh_veu.c                              |    5 +
 drivers/media/platform/vivid/vivid-core.c                    |    4 +-
 drivers/media/platform/vivid/vivid-ctrls.c                   |    2 +-
 drivers/media/usb/hdpvr/hdpvr-core.c                         |   12 +-
 drivers/media/v4l2-core/v4l2-ctrls.c                         |  126 +-
 drivers/media/v4l2-core/v4l2-dev.c                           |    3 +
 drivers/media/v4l2-core/v4l2-ioctl.c                         |   35 +-
 drivers/media/v4l2-core/v4l2-subdev.c                        |    6 +-
 drivers/staging/media/Kconfig                                |    4 -
 drivers/staging/media/Makefile                               |    2 -
 drivers/staging/media/bcm2048/Kconfig                        |   14 -
 drivers/staging/media/bcm2048/Makefile                       |    2 -
 drivers/staging/media/bcm2048/TODO                           |   24 -
 drivers/staging/media/bcm2048/radio-bcm2048.c                | 2689 --------------------------------------
 drivers/staging/media/bcm2048/radio-bcm2048.h                |   26 -
 drivers/staging/media/davinci_vpfe/Kconfig                   |   13 -
 drivers/staging/media/davinci_vpfe/Makefile                  |   11 -
 drivers/staging/media/davinci_vpfe/TODO                      |   38 -
 drivers/staging/media/davinci_vpfe/davinci-vpfe-mc.txt       |  154 ---
 drivers/staging/media/davinci_vpfe/davinci_vpfe_user.h       | 1287 ------------------
 drivers/staging/media/davinci_vpfe/dm365_ipipe.c             | 1857 --------------------------
 drivers/staging/media/davinci_vpfe/dm365_ipipe.h             |  174 ---
 drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.c          | 1038 ---------------
 drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.h          |  556 --------
 drivers/staging/media/davinci_vpfe/dm365_ipipeif.c           | 1070 ---------------
 drivers/staging/media/davinci_vpfe/dm365_ipipeif.h           |  228 ----
 drivers/staging/media/davinci_vpfe/dm365_ipipeif_user.h      |   90 --
 drivers/staging/media/davinci_vpfe/dm365_isif.c              | 2097 -----------------------------
 drivers/staging/media/davinci_vpfe/dm365_isif.h              |  200 ---
 drivers/staging/media/davinci_vpfe/dm365_isif_regs.h         |  291 -----
 drivers/staging/media/davinci_vpfe/dm365_resizer.c           | 1995 ----------------------------
 drivers/staging/media/davinci_vpfe/dm365_resizer.h           |  241 ----
 drivers/staging/media/davinci_vpfe/vpfe.h                    |   83 --
 drivers/staging/media/davinci_vpfe/vpfe_mc_capture.c         |  716 ----------
 drivers/staging/media/davinci_vpfe/vpfe_mc_capture.h         |   90 --
 drivers/staging/media/davinci_vpfe/vpfe_video.c              | 1646 -----------------------
 drivers/staging/media/davinci_vpfe/vpfe_video.h              |  150 ---
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h             |    2 +-
 include/media/davinci/vpfe_capture.h                         |    2 +-
 include/media/v4l2-ctrls.h                                   |    9 +-
 include/media/v4l2-ioctl.h                                   |    2 +
 51 files changed, 191 insertions(+), 16899 deletions(-)
 delete mode 100644 drivers/staging/media/bcm2048/Kconfig
 delete mode 100644 drivers/staging/media/bcm2048/Makefile
 delete mode 100644 drivers/staging/media/bcm2048/TODO
 delete mode 100644 drivers/staging/media/bcm2048/radio-bcm2048.c
 delete mode 100644 drivers/staging/media/bcm2048/radio-bcm2048.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/Kconfig
 delete mode 100644 drivers/staging/media/davinci_vpfe/Makefile
 delete mode 100644 drivers/staging/media/davinci_vpfe/TODO
 delete mode 100644 drivers/staging/media/davinci_vpfe/davinci-vpfe-mc.txt
 delete mode 100644 drivers/staging/media/davinci_vpfe/davinci_vpfe_user.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_ipipe.c
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_ipipe.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.c
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_ipipeif.c
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_ipipeif.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_ipipeif_user.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_isif.c
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_isif.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_isif_regs.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_resizer.c
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_resizer.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/vpfe.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/vpfe_mc_capture.c
 delete mode 100644 drivers/staging/media/davinci_vpfe/vpfe_mc_capture.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/vpfe_video.c
 delete mode 100644 drivers/staging/media/davinci_vpfe/vpfe_video.h
