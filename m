Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6202A391ABC
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 16:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235088AbhEZOv1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 10:51:27 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:36311 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235098AbhEZOv1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 10:51:27 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id lur1lVepNVN4klur4lMKiE; Wed, 26 May 2021 16:49:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622040594; bh=JnAY0VtXrMonpN/J9m8niZGAJrpoZwFngBEa/ohzipQ=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pmpiTiLtOvVncq5h2nN+hLxpxhXi/4pALkAQzKado52waAUCPMQ89OlT8qqBR5KjT
         txLuBCBJaXYrNda3NpMSpuxhciJG7MfTNqZ9vEJA9OVez7WadSp5OiUWJUkIzJXj2A
         LJ0bEWTsLguuOrrfRQSanzOg2xpN3CYhfFnOvDXHD1c6oakywm+rcTB0xsqxxFe8AT
         OXlzcStl5i8RU4LVuwuV4vjwc+UPHNcaJYoyDNKZnTnKdzmT2uxHxCrFPbGN6OUIWk
         J0MTicHmY8941DJPDMxZW/ovToj15fhKdFHds/PvCKt0oGDK/nPd0TNqtoPAjIDZOu
         qGQvKdbWlcp8A==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.14] Many fixes/enhancements
Message-ID: <eaf51bb1-fc4b-388e-7469-f608faf24032@xs4all.nl>
Date:   Wed, 26 May 2021 16:49:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfF8olC2vF0EqnlzAauolUhk57TcGDr+G7G8Y0WOYFrl69jKmv42y9pHBBdOJUxKDWgNpTqI6q/bKxncQKs95/UdrivoilYA9dz/pc0NaSZ8tas+sb2zN
 EXupSxq7SpNMwMTqhBTe4JNlur/OyQt6HG0tHLEtvEcEUVomxFD7MLOcZ7Xvj6WRFXlzTdHZWQlGyl3oA4z5eAjQfY9chg0AjdQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I think I got most if not all of the pending small fixes/enhancements in my
TODO list. This does not include atomisp cleanup patches, of which there are
still a bunch outstanding.

Regards,

	Hans

The following changes since commit 71c689dc2e732d4cb190aaf0edea73116b1611bd:

  media: v4l2-ctrls: split up into four source files (2021-05-25 17:03:29 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.14e

for you to fetch changes up to 6e639b4a57ba0b10054ce114efa05fb60fd7395e:

  media: videobuf-dma-sg: void function return statements are not generally useful (2021-05-26 16:41:22 +0200)


----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Andrzej Pietrasiewicz (2):
      media: hantro: Fix .buf_prepare
      media: cedrus: Fix .buf_prepare

Christophe JAILLET (1):
      media: ttpci: switch from 'pci_' to 'dma_' API

Colin Ian King (1):
      media: meson: vdec: remove redundant initialization of variable reg_cur

Corentin Labbe (5):
      staging: media: zoran: remove detect_guest_activity
      staging: media: zoran: multiple assignments should be avoided
      staging: media: zoran: remove blank line
      staging: media: zoran: fix kzalloc style
      staging: media: zoran: change asm header

Dan Carpenter (2):
      media: au0828: fix a NULL vs IS_ERR() check
      media: hantro: test the correct variable in probe()

Ding Senjie (1):
      media: mtk-vpu: Use devm_platform_ioremap_resource_byname

Evgeny Novikov (3):
      media: v4l: cadence: Handle errors of clk_prepare_enable()
      media: v4l: cadence: Handle errors of clk_prepare_enable()
      st-hva: Fix potential NULL pointer dereferences

Ezequiel Garcia (1):
      media: rkvdec: Fix .buf_prepare

Guenter Roeck (1):
      media: media/test_drivers: Drop unnecessary NULL check after container_of

Hans Verkuil (2):
      adv7842: support EDIDs up to 4 blocks
      uapi/linux/cec-funcs.h: set delay to 1 if unnused

Herman (3):
      drivers/media/usb/em28xx/em28xx-cards.c : fix typo issues
      drivers/media/platform/Rcar_jpu.c : fix typo issues
      drivers/media/usb/gspca/cpia1.c : fix spelling typo

Igor Matheus Andrade Torrente (1):
      media: em28xx: Fix possible memory leak of em28xx struct

Jiapeng Chong (2):
      media: atmel: atmel-isc: Remove redundant assignment to i
      media: st-delta: Remove redundant assignment to ret

Joe Richey (1):
      media: vicodec: Use _BITUL() macro in UAPI headers

Johan Hovold (5):
      media: dtv5100: fix control-request directions
      media: gspca/sq905: fix control-request direction
      media: gspca/gl860: fix zero-length control requests
      media: gspca/sunplus: fix zero-length control requests
      media: rtl28xxu: fix zero-length control request

Lv Yunlong (2):
      media:exynos4-is: Fix a use after free in isp_video_release
      media:v4l2-core: Avoid the dangling pointer in v4l2_fh_release

Niklas Söderlund (6):
      dt-bindings: media: renesas,vin: Add r8a77961 support
      dt-bindings: media: renesas,csi2: Add r8a77961 support
      media: dt-bindings: media: renesas,isp: Add bindings for ISP Channel Selector
      media: dt-bindings: media: renesas,vin: Add r8a779a0 support
      media: rcar-vin: Enable support for r8a77961
      media: rcar-csi2: Enable support for r8a77961

Paul Cercueil (1):
      dt-bindings: media: Document RDA5807 FM radio bindings

Pavel Skripkin (1):
      media: zr364xx: fix memory leak in zr364xx_start_readpipe

Rikard Falkeborn (1):
      media: radio: si4713: constify static struct v4l2_ioctl_ops

Tian Tao (1):
      media: camss: move to use request_irq by IRQF_NO_AUTOEN flag

Tong Zhang (1):
      media: bt878: do not schedule tasklet when it is not setup

Wang Qing (1):
      staging: media: zoran: fix some formatting issues

Wei Yongjun (1):
      media: imx: imx7_mipi_csis: Fix error return code in mipi_csis_async_register()

Yang Yingliang (3):
      media: saa7134: Remove unnecessary INIT_LIST_HEAD()
      media: bdisp: remove redundant dev_err call in bdisp_probe()
      staging: media: tegra-vde: add missing error return code in tegra_vde_probe()

Zhen Lei (1):
      media: tc358743: Fix error return code in tc358743_probe_of()

Zheyu Ma (1):
      media: bt8xx: Fix a missing check bug in bt878_probe

lijian (2):
      media: v4l2-dev.c: Modified the macro SET_VALID_IOCTL
      media: videobuf-dma-sg: void function return statements are not generally useful

 Documentation/devicetree/bindings/media/i2c/rda,rda5807.yaml |  67 +++++++++++++
 Documentation/devicetree/bindings/media/renesas,csi2.yaml    |   1 +
 Documentation/devicetree/bindings/media/renesas,isp.yaml     | 196 +++++++++++++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/media/renesas,vin.yaml     |  27 +++++-
 MAINTAINERS                                                  |   1 +
 drivers/media/i2c/adv7842.c                                  |  37 ++++++--
 drivers/media/i2c/tc358743.c                                 |   1 +
 drivers/media/pci/bt8xx/bt878.c                              |   6 +-
 drivers/media/pci/saa7134/saa7134-core.c                     |   1 -
 drivers/media/pci/ttpci/budget-core.c                        |   3 +-
 drivers/media/platform/atmel/atmel-isc-base.c                |   1 -
 drivers/media/platform/cadence/cdns-csi2rx.c                 |   8 +-
 drivers/media/platform/cadence/cdns-csi2tx.c                 |   8 +-
 drivers/media/platform/exynos4-is/fimc-isp-video.c           |   7 +-
 drivers/media/platform/mtk-vpu/mtk_vpu.c                     |   6 +-
 drivers/media/platform/qcom/camss/camss-csid.c               |   5 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c             |   5 +-
 drivers/media/platform/rcar-vin/rcar-core.c                  |   4 +
 drivers/media/platform/rcar-vin/rcar-csi2.c                  |   9 ++
 drivers/media/platform/rcar_jpu.c                            |   6 +-
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c                |   1 -
 drivers/media/platform/sti/delta/delta-v4l2.c                |   1 -
 drivers/media/platform/sti/hva/hva-hw.c                      |   3 +-
 drivers/media/radio/si4713/radio-platform-si4713.c           |   2 +-
 drivers/media/test-drivers/vim2m.c                           |   5 -
 drivers/media/usb/au0828/au0828-core.c                       |   4 +-
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c                      |   3 +-
 drivers/media/usb/dvb-usb/dtv5100.c                          |   7 +-
 drivers/media/usb/em28xx/em28xx-cards.c                      |   6 +-
 drivers/media/usb/em28xx/em28xx-input.c                      |   8 +-
 drivers/media/usb/gspca/cpia1.c                              |   5 +-
 drivers/media/usb/gspca/gl860/gl860.c                        |   4 +-
 drivers/media/usb/gspca/sq905.c                              |   2 +-
 drivers/media/usb/gspca/sunplus.c                            |   8 +-
 drivers/media/usb/zr364xx/zr364xx.c                          |   1 +
 drivers/media/v4l2-core/v4l2-dev.c                           |   5 +-
 drivers/media/v4l2-core/v4l2-fh.c                            |   1 +
 drivers/media/v4l2-core/videobuf-dma-sg.c                    |   1 -
 drivers/staging/media/hantro/hantro_drv.c                    |   4 +-
 drivers/staging/media/hantro/hantro_v4l2.c                   |   9 +-
 drivers/staging/media/imx/imx7-mipi-csis.c                   |   1 +
 drivers/staging/media/meson/vdec/vdec_helpers.c              |   2 +-
 drivers/staging/media/rkvdec/rkvdec.c                        |  10 +-
 drivers/staging/media/sunxi/cedrus/cedrus_video.c            |   8 +-
 drivers/staging/media/tegra-vde/vde.c                        |   3 +-
 drivers/staging/media/zoran/zoran.h                          |   1 -
 drivers/staging/media/zoran/zoran_card.c                     |   7 +-
 drivers/staging/media/zoran/zoran_device.c                   |  65 -------------
 drivers/staging/media/zoran/zoran_device.h                   |   2 -
 drivers/staging/media/zoran/zoran_driver.c                   |   6 +-
 drivers/staging/media/zoran/zr36016.c                        |   3 +-
 drivers/staging/media/zoran/zr36050.c                        |   5 +-
 drivers/staging/media/zoran/zr36060.c                        |   3 +-
 include/uapi/linux/cec-funcs.h                               |   2 +-
 include/uapi/linux/v4l2-controls.h                           |  23 ++---
 55 files changed, 461 insertions(+), 159 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/rda,rda5807.yaml
 create mode 100644 Documentation/devicetree/bindings/media/renesas,isp.yaml
