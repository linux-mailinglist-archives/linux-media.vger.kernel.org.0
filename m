Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D209262F93E
	for <lists+linux-media@lfdr.de>; Fri, 18 Nov 2022 16:27:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241819AbiKRP1B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Nov 2022 10:27:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233929AbiKRP1A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Nov 2022 10:27:00 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B737A62044
        for <linux-media@vger.kernel.org>; Fri, 18 Nov 2022 07:26:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6D166B8243E
        for <linux-media@vger.kernel.org>; Fri, 18 Nov 2022 15:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2C3C433D6;
        Fri, 18 Nov 2022 15:26:54 +0000 (UTC)
Message-ID: <ff1712bc-084d-a010-54a4-1d21f2bc8751@xs4all.nl>
Date:   Fri, 18 Nov 2022 16:26:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "eugen.hristev@microchip.com" <eugen.hristev@microchip.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.2] Various fixes, visl and MC microchip-isc
 replacement
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Besides a lot of fixes, this also adds the virtual 'visl' driver. This also
copies the non-MC atmel-isc driver to staging and renames the mainline driver
to microchip-isc and adds MC support.

Eventually in a few years the old atmel-isc driver can be removed. For now
keep it in staging/media/deprecated.

Regards,

	Hans

The following changes since commit a7bab6f8b73fe15a6181673149734a2756845dae:

  Merge tag 'br-v6.2e' of git://linuxtv.org/hverkuil/media_tree into media_stage (2022-11-15 11:55:54 +0000)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.2f

for you to fetch changes up to fc6836b3b142dd80fa6a1a2c2a3bde2b8095867d:

  media: atmel: atmel-isc: move to staging (2022-11-18 15:48:18 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Aakarsh Jain (3):
      media: s5p-mfc: fix usage of symbolic permissions to octal
      media: s5p-mfc:fix usage of Block comment alignment
      media: s5p-mfc: Optimisation of code to remove error message

Chen Zhongjin (1):
      media: vidtv: Fix use-after-free in vidtv_bridge_dvb_init()

Daniel Almeida (1):
      media: visl: add virtual stateless decoder driver

Deepak R Varma (1):
      staging: media: meson: vdec: use min() for comparison and assignment

Eugen Hristev (6):
      media: atmel: move microchip_csi2dc to dedicated microchip platform
      media: microchip: add ISC driver as Microchip ISC
      media: microchip: microchip-isc: prepare for media controller support
      media: microchip: microchip-isc: implement media controller
      media: microchip: microchip-isc: move media_pipeline_* to (un)prepare cb
      media: atmel: atmel-isc: move to staging

Hans Verkuil (3):
      media: admin-guide: cec.rst
      vb2: add (un)prepare_streaming queue ops
      vb2/au0828: move the v4l_vb2q_enable_media_source to the au0828 driver

Ian Cowan (1):
      staging: media: sunxi: cedrus: make vb2_ops struct definition const

Jammy Huang (1):
      media: aspeed: Use v4l2_dbg to replace v4l2_warn to avoid log spam

Jernej Skrabec (3):
      media: cedrus: Adjust buffer size based on codec
      media: cedrus: h265: Support decoding 10-bit frames
      media: cedrus: Relax HEVC SPS restrictions

Ming Qian (2):
      media: amphion: add lock around vdec_g_fmt
      media: amphion: apply vb2_queue_error instead of setting manually

Yang Yingliang (2):
      media: solo6x10: fix possible memory leak in solo_sysfs_init()
      media: mtk-jpegdec: add missing destroy_workqueue()

Yuan Can (2):
      media: platform: exynos4-is: Fix error handling in fimc_md_init()
      media: amphion: Fix error handling in vpu_driver_init()

 Documentation/admin-guide/media/cec-drivers.rst                                |   10 -
 Documentation/admin-guide/media/cec.rst                                        |  369 ++++++++
 Documentation/admin-guide/media/index.rst                                      |    3 +-
 Documentation/admin-guide/media/pulse8-cec.rst                                 |   13 -
 Documentation/admin-guide/media/v4l-drivers.rst                                |    1 +
 Documentation/admin-guide/media/visl.rst                                       |  175 ++++
 Documentation/userspace-api/media/cec/cec-pin-error-inj.rst                    |    2 +
 MAINTAINERS                                                                    |   15 +-
 drivers/media/common/videobuf2/videobuf2-core.c                                |   26 +-
 drivers/media/pci/solo6x10/solo6x10-core.c                                     |    1 +
 drivers/media/platform/Kconfig                                                 |    1 +
 drivers/media/platform/Makefile                                                |    1 +
 drivers/media/platform/amphion/vdec.c                                          |    2 +
 drivers/media/platform/amphion/vpu_drv.c                                       |    6 +-
 drivers/media/platform/amphion/vpu_v4l2.c                                      |   11 +-
 drivers/media/platform/aspeed/aspeed-video.c                                   |   16 +-
 drivers/media/platform/atmel/Kconfig                                           |   51 -
 drivers/media/platform/atmel/Makefile                                          |    7 -
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c                         |   10 +
 drivers/media/platform/microchip/Kconfig                                       |   61 ++
 drivers/media/platform/microchip/Makefile                                      |    9 +
 drivers/media/platform/{atmel => microchip}/microchip-csi2dc.c                 |    0
 drivers/media/platform/microchip/microchip-isc-base.c                          | 2040 ++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/microchip/microchip-isc-clk.c                           |  311 ++++++
 drivers/media/platform/microchip/microchip-isc-regs.h                          |  413 ++++++++
 drivers/media/platform/microchip/microchip-isc-scaler.c                        |  267 ++++++
 drivers/media/platform/microchip/microchip-isc.h                               |  400 ++++++++
 drivers/media/platform/microchip/microchip-sama5d2-isc.c                       |  683 ++++++++++++++
 drivers/media/platform/microchip/microchip-sama7g5-isc.c                       |  646 +++++++++++++
 drivers/media/platform/samsung/exynos4-is/fimc-core.c                          |    2 +-
 drivers/media/platform/samsung/exynos4-is/media-dev.c                          |    6 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c                               |   52 +-
 drivers/media/test-drivers/Kconfig                                             |    1 +
 drivers/media/test-drivers/Makefile                                            |    1 +
 drivers/media/test-drivers/vidtv/vidtv_bridge.c                                |   22 +-
 drivers/media/test-drivers/visl/Kconfig                                        |   29 +
 drivers/media/test-drivers/visl/Makefile                                       |    8 +
 drivers/media/test-drivers/visl/visl-core.c                                    |  541 +++++++++++
 drivers/media/test-drivers/visl/visl-debugfs.c                                 |  112 +++
 drivers/media/test-drivers/visl/visl-debugfs.h                                 |   40 +
 drivers/media/test-drivers/visl/visl-dec.c                                     |  499 ++++++++++
 drivers/media/test-drivers/visl/visl-dec.h                                     |   67 ++
 drivers/media/test-drivers/visl/visl-trace-fwht.h                              |   66 ++
 drivers/media/test-drivers/visl/visl-trace-h264.h                              |  349 +++++++
 drivers/media/test-drivers/visl/visl-trace-hevc.h                              |  405 ++++++++
 drivers/media/test-drivers/visl/visl-trace-mpeg2.h                             |   99 ++
 drivers/media/test-drivers/visl/visl-trace-points.c                            |   10 +
 drivers/media/test-drivers/visl/visl-trace-vp8.h                               |  156 +++
 drivers/media/test-drivers/visl/visl-trace-vp9.h                               |  292 ++++++
 drivers/media/test-drivers/visl/visl-video.c                                   |  767 +++++++++++++++
 drivers/media/test-drivers/visl/visl-video.h                                   |   27 +
 drivers/media/test-drivers/visl/visl.h                                         |  176 ++++
 drivers/media/usb/au0828/au0828-vbi.c                                          |    2 +
 drivers/media/usb/au0828/au0828-video.c                                        |    1 +
 drivers/staging/media/Kconfig                                                  |    1 +
 drivers/staging/media/Makefile                                                 |    1 +
 drivers/staging/media/deprecated/atmel/Kconfig                                 |   47 +
 drivers/staging/media/deprecated/atmel/Makefile                                |    8 +
 drivers/staging/media/deprecated/atmel/TODO                                    |   34 +
 drivers/{media/platform => staging/media/deprecated}/atmel/atmel-isc-base.c    |   20 +-
 drivers/{media/platform => staging/media/deprecated}/atmel/atmel-isc-clk.c     |    8 +-
 drivers/{media/platform => staging/media/deprecated}/atmel/atmel-isc-regs.h    |    0
 drivers/{media/platform => staging/media/deprecated}/atmel/atmel-isc.h         |   16 +-
 drivers/{media/platform => staging/media/deprecated}/atmel/atmel-sama5d2-isc.c |   18 +-
 drivers/{media/platform => staging/media/deprecated}/atmel/atmel-sama7g5-isc.c |   18 +-
 drivers/staging/media/meson/vdec/codec_vp9.c                                   |    7 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c                                    |   31 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h                                    |    3 +
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c                               |   35 +
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h                               |   16 +
 drivers/staging/media/sunxi/cedrus/cedrus_video.c                              |    6 +-
 include/media/videobuf2-core.h                                                 |   14 +
 72 files changed, 9365 insertions(+), 198 deletions(-)
 delete mode 100644 Documentation/admin-guide/media/cec-drivers.rst
 create mode 100644 Documentation/admin-guide/media/cec.rst
 delete mode 100644 Documentation/admin-guide/media/pulse8-cec.rst
 create mode 100644 Documentation/admin-guide/media/visl.rst
 create mode 100644 drivers/media/platform/microchip/Kconfig
 create mode 100644 drivers/media/platform/microchip/Makefile
 rename drivers/media/platform/{atmel => microchip}/microchip-csi2dc.c (100%)
 create mode 100644 drivers/media/platform/microchip/microchip-isc-base.c
 create mode 100644 drivers/media/platform/microchip/microchip-isc-clk.c
 create mode 100644 drivers/media/platform/microchip/microchip-isc-regs.h
 create mode 100644 drivers/media/platform/microchip/microchip-isc-scaler.c
 create mode 100644 drivers/media/platform/microchip/microchip-isc.h
 create mode 100644 drivers/media/platform/microchip/microchip-sama5d2-isc.c
 create mode 100644 drivers/media/platform/microchip/microchip-sama7g5-isc.c
 create mode 100644 drivers/media/test-drivers/visl/Kconfig
 create mode 100644 drivers/media/test-drivers/visl/Makefile
 create mode 100644 drivers/media/test-drivers/visl/visl-core.c
 create mode 100644 drivers/media/test-drivers/visl/visl-debugfs.c
 create mode 100644 drivers/media/test-drivers/visl/visl-debugfs.h
 create mode 100644 drivers/media/test-drivers/visl/visl-dec.c
 create mode 100644 drivers/media/test-drivers/visl/visl-dec.h
 create mode 100644 drivers/media/test-drivers/visl/visl-trace-fwht.h
 create mode 100644 drivers/media/test-drivers/visl/visl-trace-h264.h
 create mode 100644 drivers/media/test-drivers/visl/visl-trace-hevc.h
 create mode 100644 drivers/media/test-drivers/visl/visl-trace-mpeg2.h
 create mode 100644 drivers/media/test-drivers/visl/visl-trace-points.c
 create mode 100644 drivers/media/test-drivers/visl/visl-trace-vp8.h
 create mode 100644 drivers/media/test-drivers/visl/visl-trace-vp9.h
 create mode 100644 drivers/media/test-drivers/visl/visl-video.c
 create mode 100644 drivers/media/test-drivers/visl/visl-video.h
 create mode 100644 drivers/media/test-drivers/visl/visl.h
 create mode 100644 drivers/staging/media/deprecated/atmel/Kconfig
 create mode 100644 drivers/staging/media/deprecated/atmel/Makefile
 create mode 100644 drivers/staging/media/deprecated/atmel/TODO
 rename drivers/{media/platform => staging/media/deprecated}/atmel/atmel-isc-base.c (99%)
 rename drivers/{media/platform => staging/media/deprecated}/atmel/atmel-isc-clk.c (97%)
 rename drivers/{media/platform => staging/media/deprecated}/atmel/atmel-isc-regs.h (100%)
 rename drivers/{media/platform => staging/media/deprecated}/atmel/atmel-isc.h (96%)
 rename drivers/{media/platform => staging/media/deprecated}/atmel/atmel-sama5d2-isc.c (97%)
 rename drivers/{media/platform => staging/media/deprecated}/atmel/atmel-sama7g5-isc.c (97%)
