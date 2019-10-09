Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D75C9D103B
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 15:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731152AbfJINfh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 09:35:37 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:56037 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729883AbfJINfh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Oct 2019 09:35:37 -0400
Received: from [IPv6:2001:983:e9a7:1:2801:e038:f2c3:e060] ([IPv6:2001:983:e9a7:1:2801:e038:f2c3:e060])
        by smtp-cloud7.xs4all.net with ESMTPA
        id IC7pih3KojZ8vIC7qiIBp2; Wed, 09 Oct 2019 15:35:34 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.5] Various fixes/enhancements
Message-ID: <5ebf6d7f-8a1d-8665-fe72-78df3849ae5b@xs4all.nl>
Date:   Wed, 9 Oct 2019 15:35:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfLDuvxIioGHuhx+X+9CdJmlVXdbQGoJuhZmTYDMBy9KGVM9exOmKkOr5mE3mMUyQaBf9FHkOmZbSXxaEgOSls6siVFS6GYlxYXAW01LOzbD/+8o0DNr/
 EGaNmskugmMocTSA9ORyEe5X6InDrLWt9HyUnZuU9iTMUrA2W0he7Rbih8gDx5u+p84P0hVqmu2p6/Z2cHtFSCbewegN0kK33DrDWpC99b87NKgKTMLx0jIN
 jEDYge4ohIvs+9/5I7NRxPTNIcc4QYBgoVNM0ziStII=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 219031a6e7dff52a066e8b074adc0697f501e3d3:

  media: venus: fix build on 32bit environments (2019-10-08 13:46:36 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.5i

for you to fetch changes up to 2bb7c843ebb8401eaa772bfbe5031c6d1fa9fea7:

  media: platform: Use devm_platform_ioremap_resource() in two functions (2019-10-09 15:16:56 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Alan Stern (2):
      media: usbvision: Fix invalid accesses after device disconnect
      media: usbvision: Fix races among open, close, and disconnect

Amol Grover (1):
      staging: media: imx: Fix alignment to match open parenthesis

Christophe JAILLET (2):
      media: v4l: cadence: Fix how unsued lanes are handled in 'csi2rx_start()'
      cx88: Fix some error handling path in 'cx8800_initdev()'

Colin Ian King (2):
      media: cx18: make array mapping static, makes object smaller
      media: gspca: make array st6422_bridge_init static, makes object smaller

Daniel Gonzalez Cabanelas (1):
      media: cx88: Add support for NotOnlyTV LV3H card

Geert Uytterhoeven (1):
      media: i2c: Use div64_ul() for u64-by-unsigned-long divide

Jeeeun Evans (1):
      staging: media: imx: Use devm_platform_ioremap_resource().

Markus Elfring (1):
      media: platform: Use devm_platform_ioremap_resource() in two functions

Navid Emamdoost (2):
      media: gspca: null check create_singlethread_workqueue
      media: usb: null check create_singlethread_workqueue

Niklas Söderlund (3):
      rcar-vin: Rename wrongly named rectangle
      rcar-vin: Create compose rectangle where it is used
      rcar-vin: Use bytes per line instead of width for UV offset

Steve Longerbeam (2):
      media: imx: Move capture device init to registered
      media: imx: Move pads init to probe

Wei Yongjun (1):
      media: vimc: Fix error return code in vimc_register_devices()

Yizhuo (1):
      media/pci/ivtv: Variable vbi.type could be uninitialized if macro v4l2_subdev_call set __result an error code

YueHaibing (1):
      media: cx231xx: remove duplicated include from cx231xx-417.c

 drivers/media/i2c/max2175.c                            |  4 ++--
 drivers/media/pci/cx18/cx18-ioctl.c                    |  2 +-
 drivers/media/pci/cx88/cx88-cards.c                    | 43 +++++++++++++++++++++++++++++++++++++++++
 drivers/media/pci/cx88/cx88-dvb.c                      |  1 +
 drivers/media/pci/cx88/cx88-video.c                    | 11 +++++++----
 drivers/media/pci/cx88/cx88.h                          |  1 +
 drivers/media/pci/ivtv/ivtv-vbi.c                      |  2 +-
 drivers/media/platform/cadence/cdns-csi2rx.c           |  2 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c |  8 +-------
 drivers/media/platform/rcar-vin/rcar-core.c            |  7 +------
 drivers/media/platform/rcar-vin/rcar-dma.c             |  4 ++--
 drivers/media/platform/rcar-vin/rcar-v4l2.c            | 38 +++++++++++++++++-------------------
 drivers/media/platform/vimc/vimc-core.c                |  4 +++-
 drivers/media/usb/cx231xx/cx231xx-417.c                |  1 -
 drivers/media/usb/gspca/sq905.c                        |  3 +++
 drivers/media/usb/gspca/sq905c.c                       |  3 +++
 drivers/media/usb/gspca/stv06xx/stv06xx_st6422.c       |  2 +-
 drivers/media/usb/usbvision/usbvision-video.c          | 29 +++++++++++++++++++++++-----
 drivers/staging/media/imx/imx-ic-prp.c                 | 25 +++++++++---------------
 drivers/staging/media/imx/imx-ic-prpencvf.c            | 51 +++++++++++++++++++++++++++----------------------
 drivers/staging/media/imx/imx-media-capture.c          | 15 ++++++++-------
 drivers/staging/media/imx/imx-media-csi.c              | 41 +++++++++++++++++++++------------------
 drivers/staging/media/imx/imx-media-vdic.c             | 27 +++++++++++---------------
 drivers/staging/media/imx/imx6-mipi-csi2.c             | 27 ++++++++++++--------------
 drivers/staging/media/imx/imx7-media-csi.c             | 38 +++++++++++++++++++-----------------
 drivers/staging/media/imx/imx7-mipi-csis.c             | 27 ++++++++------------------
 26 files changed, 231 insertions(+), 185 deletions(-)
