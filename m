Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD219CFBD
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 14:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731159AbfHZMmf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 08:42:35 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:36479 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730339AbfHZMmf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 08:42:35 -0400
Received: from [IPv6:2001:983:e9a7:1:3421:ddcd:2260:77e4] ([IPv6:2001:983:e9a7:1:3421:ddcd:2260:77e4])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 2EKOiw4ORzaKO2EKPiF0Bs; Mon, 26 Aug 2019 14:42:33 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.4] Various fixes/enhancements
Message-ID: <fa71c2b9-1267-b437-e5ac-cead7dca37a8@xs4all.nl>
Date:   Mon, 26 Aug 2019 14:42:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHLt/BGHGSlyCmT79rr1M6ngcnei996pZ/uYAIOEFjQokHB4tJo1KB1q9aDtSaFw76MTJvVzHkuc+QQxNG5qtZOF/+vy3FxRisaX9Rke8rlmYO//S6QD
 viGoE4FPR9XHKWslmmcL5EDamK1yLmSvEikTXTSkvlwjoHMd7Do292B4QeZgpumbs3mU69f3yYLYDzIBiyXHoVe4rfYoE5gdlbf1eX4L2oNlp7HVacudJfHk
 nHh9OB6LCuqwjlBXGLgOLex84KTz5ekxXBCc+Un8zVU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit a8ef0488cc592921a917362cca66af4a601987b9:

  media: imx: add csc/scaler mem2mem device (2019-08-26 06:34:41 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.4o

for you to fetch changes up to 8a3213804b075beaddd948f98afc4b0bf77bc033:

  media: v4l2-core: Remove BUG() from i2c and spi helpers (2019-08-26 14:22:50 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Colin Ian King (1):
      media: hdpvr: remove redundant assignment to retval

Ezequiel Garcia (6):
      media: v4l2-core: Module re-organization
      media: v4l2-core: move spi helpers out of v4l2-common.c
      media: v4l2-core: move i2c helpers out of v4l2-common.c
      media: v4l2-core: introduce a helper to unregister a spi subdev
      media: v4l2-core: introduce a helper to unregister a i2c subdev
      media: v4l2-core: Remove BUG() from i2c and spi helpers

Hans de Goede (1):
      sn9c20x: Add MSI MS-1039 laptop to flip_dmi_table

Jae Hyun Yoo (1):
      media: aspeed: fix an incorrect return code on buffer allocation failure

Jonas Karlman (1):
      media: hantro: Enable VP8 decoding on RK3328

Maciej S. Szmigiero (2):
      media: saa7134: keep demod i2c gate closed on Medion 7134
      media: saa7134: fix terminology around saa7134_i2c_eeprom_md7134_gate()

Souptick Joarder (1):
      usbvision: Remove dead code

Wenwen Wang (5):
      media: cpia2_usb: fix memory leaks
      media: usb: cx231xx-417: fix a memory leak bug
      media: saa7146: add cleanup in hexium_attach()
      media: fdp1: Fix a memory leak bug
      media: ti-vpe: Add cleanup in vpdma_list_cleanup()

Wolfram Sang (2):
      media: i2c: adv7511-v4l2: drop check because i2c_unregister_device() is NULL safe
      media: i2c: adv7842: drop check because i2c_unregister_device() is NULL safe

 drivers/media/i2c/adv7511-v4l2.c              |   6 +-
 drivers/media/i2c/adv7842.c                   |  33 +++------
 drivers/media/pci/saa7134/saa7134-dvb.c       |  14 ++++
 drivers/media/pci/saa7134/saa7134-i2c.c       |  12 ++--
 drivers/media/pci/saa7146/hexium_gemini.c     |   3 +
 drivers/media/platform/aspeed-video.c         |   1 +
 drivers/media/platform/rcar_fdp1.c            |   1 +
 drivers/media/platform/ti-vpe/vpdma.c         |  10 +--
 drivers/media/usb/cpia2/cpia2_usb.c           |   4 ++
 drivers/media/usb/cx231xx/cx231xx-417.c       |   1 +
 drivers/media/usb/gspca/sn9c20x.c             |   7 ++
 drivers/media/usb/hdpvr/hdpvr-i2c.c           |   6 +-
 drivers/media/usb/usbvision/usbvision-video.c |  10 ---
 drivers/media/v4l2-core/Kconfig               |   5 ++
 drivers/media/v4l2-core/Makefile              |   5 +-
 drivers/media/v4l2-core/v4l2-common.c         | 214 ----------------------------------------------------------
 drivers/media/v4l2-core/v4l2-dev.c            |   4 +-
 drivers/media/v4l2-core/v4l2-device.c         |  39 ++---------
 drivers/media/v4l2-core/v4l2-i2c.c            | 168 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-spi.c            |  73 ++++++++++++++++++++
 drivers/staging/media/hantro/rk3399_vpu_hw.c  |   2 +-
 include/media/v4l2-common.h                   | 150 +++++++++++++++++++++++++++++-----------
 22 files changed, 426 insertions(+), 342 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-i2c.c
 create mode 100644 drivers/media/v4l2-core/v4l2-spi.c
