Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68265752B3
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 17:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389122AbfGYPdz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 11:33:55 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:46699 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389058AbfGYPdy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 11:33:54 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id qfkbhBJpkeD5bqfkehiRkU; Thu, 25 Jul 2019 17:33:52 +0200
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.4] Support RK3399 VP8 decoding, various fixes,
 rcar-vin improvements
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Message-ID: <71f1bbc8-6b98-968d-b3ec-f331d517124a@xs4all.nl>
Date:   Thu, 25 Jul 2019 17:33:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfCy/PnETjVDuBoFPIjMgTarKnOWd0ZKVAINyPR76K+rpojxhMk0vEvg2P6lTPMepWEFn/DqsvxjdbwFTcZcwk1qI/qjBRe3aaV19iLqPHB2CIP8DD68z
 zwxP1tGEG+bkSjOZZuQoFT9npdjXMAsHjKhWxzyCl8ElUnWCCZ88luJBQzFu7o6qga73BT1JpA/VBmzz0MkuZyOagDjLopZaRsU6ji2reaVnchQkNUOKr7lE
 XY7jbGYcyVNDQtjnFUXjsQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Please note the 'v4l2-dev: fix WARN_ON(!vdev->device_caps)' patch. Sorry about
that. I did test the original patch with vimc, but test-media doesn't actually
create a FAIL if a module can't be loaded. I'll fix that.

Other than that it's the usual fixes/cleanups and also it adds RK3399 VP8 decoding.

Regards,

	Hans

The following changes since commit 6ddb094a9f8c451c42bc7c58cfed22275e8a1e38:

  media: staging/intel-ipu3: Use dev_get_drvdata where possible (2019-07-25 06:45:46 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.4e2

for you to fetch changes up to bb636bb902862c0008d7cd96ebae38fe41656233:

  media: v4l2-core: introduce a helper to unregister a I2C subdev (2019-07-25 17:13:27 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Boris Brezillon (4):
      media: hantro: Simplify the controls creation logic
      media: hantro: Constify the control array
      media: hantro: Add hantro_get_{src, dst}_buf() helpers
      media: hantro: Add helpers to prepare/finish a run

Ezequiel Garcia (9):
      media: Don't default-enable "ancillary driver autoselect" if EMBEDDED
      media: Don't hide any menu if "ancillary drivers autoselect" is enabled
      media: hantro: Move VP8 common code
      media: v4l2-core: Cleanup Makefile
      media: v4l2-core: Module re-organization
      media: v4l2-core: move spi helpers out of v4l2-common.c
      media: v4l2-core: move i2c helpers out of v4l2-common.c
      media: v4l2-core: introduce a helper to unregister a SPI subdev
      media: v4l2-core: introduce a helper to unregister a I2C subdev

Francois Buergisser (1):
      media: hantro: Set DMA max segment size

Hans Verkuil (1):
      v4l2-dev: fix WARN_ON(!vdev->device_caps)

Hariprasad Kelam (1):
      staging: media: hantro: Remove call to memset after dma_alloc_coherent

Jeffy Chen (1):
      media: hantro: Support RK3399 VP8 decoding

Niklas Söderlund (4):
      rcar-vin: Rename VNDMR_DTMD_ARGB1555 to VNDMR_DTMD_ARGB
      rcar-vin: Add control for alpha component
      rcar-vin: Add support for RGB formats with alpha component
      rcar-vin: Always setup controls when opening video device

 drivers/media/Kconfig                                  |   2 +-
 drivers/media/dvb-frontends/Kconfig                    |   1 -
 drivers/media/i2c/Kconfig                              |   1 -
 drivers/media/platform/rcar-vin/rcar-core.c            |  53 +++-
 drivers/media/platform/rcar-vin/rcar-dma.c             |  44 +++-
 drivers/media/platform/rcar-vin/rcar-v4l2.c            |  40 +--
 drivers/media/platform/rcar-vin/rcar-vin.h             |   5 +
 drivers/media/spi/Kconfig                              |   1 -
 drivers/media/tuners/Kconfig                           |   1 -
 drivers/media/v4l2-core/Kconfig                        |   5 +
 drivers/media/v4l2-core/Makefile                       |  15 +-
 drivers/media/v4l2-core/v4l2-common.c                  | 210 ----------------
 drivers/media/v4l2-core/v4l2-dev.c                     |   4 +-
 drivers/media/v4l2-core/v4l2-device.c                  |  39 +--
 drivers/media/v4l2-core/v4l2-i2c.c                     | 167 +++++++++++++
 drivers/media/v4l2-core/v4l2-spi.c                     |  73 ++++++
 drivers/staging/media/hantro/Makefile                  |   1 +
 drivers/staging/media/hantro/hantro.h                  |  15 +-
 drivers/staging/media/hantro/hantro_drv.c              |  53 ++--
 drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c     |  14 +-
 drivers/staging/media/hantro/hantro_g1_vp8_dec.c       |  34 +--
 drivers/staging/media/hantro/hantro_h1_jpeg_enc.c      |  11 +-
 drivers/staging/media/hantro/hantro_hw.h               |   7 +
 drivers/staging/media/hantro/hantro_vp8.c              |  17 +-
 drivers/staging/media/hantro/rk3399_vpu_hw.c           |  22 +-
 drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c  |  12 +-
 drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c |  14 +-
 drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c   | 595 +++++++++++++++++++++++++++++++++++++++++++++
 include/media/v4l2-common.h                            | 150 +++++++++---
 29 files changed, 1199 insertions(+), 407 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-i2c.c
 create mode 100644 drivers/media/v4l2-core/v4l2-spi.c
 create mode 100644 drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
