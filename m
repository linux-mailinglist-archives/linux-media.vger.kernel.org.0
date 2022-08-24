Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F033859F87D
	for <lists+linux-media@lfdr.de>; Wed, 24 Aug 2022 13:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235747AbiHXLSB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Aug 2022 07:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232143AbiHXLSB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Aug 2022 07:18:01 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47CF063F32
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 04:17:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C177CB823AB
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 11:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9DAAC433C1;
        Wed, 24 Aug 2022 11:17:54 +0000 (UTC)
Message-ID: <517fcea8-bc76-255c-da59-43c0b7f56486@xs4all.nl>
Date:   Wed, 24 Aug 2022 13:17:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.1] Clean up old vb1 terminology, deprecate most vb1
 drivers
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The first 6 patches of this series clean up some old incorrect vb1 terminology
and unused vb1 code. This makes it easier to find vb1 drivers and also
avoids confusion when vb1 terms are used in vb2 code.

The 7th patch adds a STAGING_MEDIA_DEPRECATED option and a 'deprecated'
directory and moves stkwebcam to that new directory. Hopefully this will
help Outreachy etc. volunteers to keep trying to patch deprecated drivers.

The remaining patches move other non-vb2 drivers to this deprecated
directory: cpia2, meye, zr364xx, tm6000, fsl-viu, some davinci drivers,
and saa7146. Finally the deprecated staging driver av7110 is moved to
deprecated/saa7146.

Note that the ttpci (using just the DVB part of saa7146) was deprecated
as well. It should be possible to extract it from the saa7146 driver
as a DVB-only driver, but I am not certain if that is worth the effort.

It's really very old hardware... (20+ years).

Regards,

	Hans

The following changes since commit 1ff8334f0a4e0be693066aafba195d25629d77aa:

  media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem driver (2022-08-21 08:42:26 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.1f

for you to fetch changes up to 0a83e0cc43ddcd926277777a0a13c299d05595d0:

  av7110: move to staging/media/deprecated/saa7146 (2022-08-24 12:49:36 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (15):
      media/pci/ngene/ngene.h: remove #ifdef NGENE_V4L
      vb2: videobuf -> videobuf2
      media/v4l2-mem2mem.h: rename 'videobuf' to 'vb2'
      media: platform: ti: avoid using 'videobuf' or 'video-buf'
      staging/media/omap4iss/iss_video.c: videobuf -> vb2
      media: avoid use of 'videobuf'
      staging/media: add a STAGING_MEDIA_DEPRECATED option
      cpia2: deprecate this driver
      meye: deprecate this driver
      zr364xx: deprecate this driver
      tm6000: deprecate this driver
      fsl-viu: deprecate this driver
      davinci: deprecate dm644x_ccdc, dm355_cddc and dm365_isif
      saa7146: deprecate hexium_gemini/orion, mxb and ttpci
      av7110: move to staging/media/deprecated/saa7146

 Documentation/driver-api/media/drivers/pxa_camera.rst                       |  2 +-
 MAINTAINERS                                                                 | 10 ++---
 drivers/media/common/Kconfig                                                |  1 -
 drivers/media/common/Makefile                                               |  2 +-
 drivers/media/common/videobuf2/videobuf2-core.c                             | 14 +++----
 drivers/media/common/videobuf2/videobuf2-dvb.c                              |  4 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c                             |  4 +-
 drivers/media/dvb-frontends/rtl2832_sdr.c                                   |  2 +-
 drivers/media/pci/Kconfig                                                   |  3 --
 drivers/media/pci/Makefile                                                  |  5 +--
 drivers/media/pci/ngene/ngene.h                                             | 78 ------------------------------------
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c                              |  2 +-
 drivers/media/platform/intel/pxa_camera.c                                   |  8 ++--
 drivers/media/platform/marvell/mcam-core.h                                  |  2 +-
 drivers/media/platform/nxp/Kconfig                                          | 12 ------
 drivers/media/platform/nxp/Makefile                                         |  1 -
 drivers/media/platform/renesas/vsp1/vsp1_video.c                            |  2 +-
 drivers/media/platform/samsung/exynos4-is/fimc-core.h                       |  2 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c                            |  2 +-
 drivers/media/platform/ti/am437x/am437x-vpfe.h                              |  2 +-
 drivers/media/platform/ti/davinci/Kconfig                                   | 49 ----------------------
 drivers/media/platform/ti/davinci/Makefile                                  |  4 --
 drivers/media/platform/ti/davinci/vpif.h                                    | 60 +++++++++++++--------------
 drivers/media/platform/ti/davinci/vpif_capture.c                            |  6 +--
 drivers/media/platform/ti/davinci/vpif_capture.h                            |  2 +-
 drivers/media/platform/ti/davinci/vpif_display.c                            |  6 +--
 drivers/media/platform/ti/davinci/vpif_display.h                            |  6 +--
 drivers/media/platform/ti/omap3isp/ispvideo.c                               |  2 +-
 drivers/media/test-drivers/vim2m.c                                          |  2 +-
 drivers/media/usb/Kconfig                                                   |  3 --
 drivers/media/usb/Makefile                                                  |  3 --
 drivers/media/usb/airspy/airspy.c                                           |  2 +-
 drivers/media/usb/au0828/au0828-video.c                                     |  4 +-
 drivers/media/usb/cx231xx/cx231xx-vbi.c                                     |  2 +-
 drivers/media/usb/cx231xx/cx231xx-video.c                                   |  2 +-
 drivers/media/usb/em28xx/em28xx-video.c                                     |  4 +-
 drivers/media/usb/msi2500/msi2500.c                                         |  2 +-
 drivers/media/usb/pvrusb2/pvrusb2-dvb.c                                     |  2 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c                                      |  6 +--
 drivers/staging/media/Kconfig                                               | 27 +++++++++++--
 drivers/staging/media/Makefile                                              | 10 ++++-
 drivers/staging/media/av7110/TODO                                           |  3 --
 drivers/{media/usb => staging/media/deprecated}/cpia2/Kconfig               |  5 ++-
 drivers/{media/usb => staging/media/deprecated}/cpia2/Makefile              |  0
 drivers/staging/media/deprecated/cpia2/TODO                                 |  6 +++
 drivers/{media/usb => staging/media/deprecated}/cpia2/cpia2.h               |  0
 drivers/{media/usb => staging/media/deprecated}/cpia2/cpia2_core.c          |  0
 drivers/{media/usb => staging/media/deprecated}/cpia2/cpia2_registers.h     |  0
 drivers/{media/usb => staging/media/deprecated}/cpia2/cpia2_usb.c           |  0
 drivers/{media/usb => staging/media/deprecated}/cpia2/cpia2_v4l.c           |  0
 drivers/staging/media/deprecated/fsl-viu/Kconfig                            | 15 +++++++
 drivers/staging/media/deprecated/fsl-viu/Makefile                           |  2 +
 drivers/staging/media/deprecated/fsl-viu/TODO                               |  7 ++++
 drivers/{media/platform/nxp => staging/media/deprecated/fsl-viu}/fsl-viu.c  |  0
 drivers/{media/pci => staging/media/deprecated}/meye/Kconfig                |  5 ++-
 drivers/{media/pci => staging/media/deprecated}/meye/Makefile               |  0
 drivers/staging/media/deprecated/meye/TODO                                  |  6 +++
 drivers/{media/pci => staging/media/deprecated}/meye/meye.c                 |  0
 drivers/{media/pci => staging/media/deprecated}/meye/meye.h                 |  0
 drivers/staging/media/deprecated/saa7146/Kconfig                            |  5 +++
 drivers/staging/media/deprecated/saa7146/Makefile                           |  2 +
 drivers/staging/media/{ => deprecated/saa7146}/av7110/Kconfig               | 20 +++++++--
 drivers/staging/media/{ => deprecated/saa7146}/av7110/Makefile              |  3 +-
 drivers/staging/media/deprecated/saa7146/av7110/TODO                        |  9 +++++
 .../{ => deprecated/saa7146}/av7110/audio-bilingual-channel-select.rst      |  0
 .../staging/media/{ => deprecated/saa7146}/av7110/audio-channel-select.rst  |  0
 .../staging/media/{ => deprecated/saa7146}/av7110/audio-clear-buffer.rst    |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-continue.rst    |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-fclose.rst      |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-fopen.rst       |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-fwrite.rst      |  0
 .../media/{ => deprecated/saa7146}/av7110/audio-get-capabilities.rst        |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-get-status.rst  |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-pause.rst       |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-play.rst        |  0
 .../staging/media/{ => deprecated/saa7146}/av7110/audio-select-source.rst   |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-set-av-sync.rst |  0
 .../staging/media/{ => deprecated/saa7146}/av7110/audio-set-bypass-mode.rst |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-set-id.rst      |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-set-mixer.rst   |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-set-mute.rst    |  0
 .../staging/media/{ => deprecated/saa7146}/av7110/audio-set-streamtype.rst  |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-stop.rst        |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/audio.rst             |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/audio_data_types.rst  |  0
 .../staging/media/{ => deprecated/saa7146}/av7110/audio_function_calls.rst  |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110.c              |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110.h              |  2 +-
 drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_av.c           |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_av.h           |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_ca.c           |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_ca.h           |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_hw.c           |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_hw.h           |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_ipack.c        |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_ipack.h        |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_ir.c           |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_v4l.c          |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/budget-patch.c        |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/dvb_filter.c          |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/dvb_filter.h          |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/sp8870.c              |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/sp8870.h              |  0
 .../staging/media/{ => deprecated/saa7146}/av7110/video-clear-buffer.rst    |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/video-command.rst     |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/video-continue.rst    |  0
 .../staging/media/{ => deprecated/saa7146}/av7110/video-fast-forward.rst    |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/video-fclose.rst      |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/video-fopen.rst       |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/video-freeze.rst      |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/video-fwrite.rst      |  0
 .../media/{ => deprecated/saa7146}/av7110/video-get-capabilities.rst        |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/video-get-event.rst   |  0
 .../staging/media/{ => deprecated/saa7146}/av7110/video-get-frame-count.rst |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/video-get-pts.rst     |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/video-get-size.rst    |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/video-get-status.rst  |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/video-play.rst        |  0
 .../staging/media/{ => deprecated/saa7146}/av7110/video-select-source.rst   |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/video-set-blank.rst   |  0
 .../media/{ => deprecated/saa7146}/av7110/video-set-display-format.rst      |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/video-set-format.rst  |  0
 .../staging/media/{ => deprecated/saa7146}/av7110/video-set-streamtype.rst  |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/video-slowmotion.rst  |  0
 .../staging/media/{ => deprecated/saa7146}/av7110/video-stillpicture.rst    |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/video-stop.rst        |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/video-try-command.rst |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/video.rst             |  0
 .../staging/media/{ => deprecated/saa7146}/av7110/video_function_calls.rst  |  0
 drivers/staging/media/{ => deprecated/saa7146}/av7110/video_types.rst       |  0
 .../common/saa7146 => staging/media/deprecated/saa7146/common}/Kconfig      |  0
 .../common/saa7146 => staging/media/deprecated/saa7146/common}/Makefile     |  0
 .../drv-intf => drivers/staging/media/deprecated/saa7146/common}/saa7146.h  |  0
 .../saa7146 => staging/media/deprecated/saa7146/common}/saa7146_core.c      |  2 +-
 .../saa7146 => staging/media/deprecated/saa7146/common}/saa7146_fops.c      |  2 +-
 .../saa7146 => staging/media/deprecated/saa7146/common}/saa7146_hlp.c       |  2 +-
 .../saa7146 => staging/media/deprecated/saa7146/common}/saa7146_i2c.c       |  2 +-
 .../saa7146 => staging/media/deprecated/saa7146/common}/saa7146_vbi.c       |  2 +-
 .../saa7146 => staging/media/deprecated/saa7146/common}/saa7146_video.c     |  2 +-
 .../staging/media/deprecated/saa7146/common}/saa7146_vv.h                   |  2 +-
 drivers/{media/pci => staging/media/deprecated/saa7146}/saa7146/Kconfig     | 15 +++++--
 drivers/{media/pci => staging/media/deprecated/saa7146}/saa7146/Makefile    |  0
 drivers/staging/media/deprecated/saa7146/saa7146/TODO                       |  7 ++++
 .../{media/pci => staging/media/deprecated/saa7146}/saa7146/hexium_gemini.c |  2 +-
 .../{media/pci => staging/media/deprecated/saa7146}/saa7146/hexium_orion.c  |  2 +-
 drivers/{media/pci => staging/media/deprecated/saa7146}/saa7146/mxb.c       |  2 +-
 drivers/{media/pci => staging/media/deprecated/saa7146}/ttpci/Kconfig       | 17 ++++++--
 drivers/{media/pci => staging/media/deprecated/saa7146}/ttpci/Makefile      |  0
 drivers/staging/media/deprecated/saa7146/ttpci/TODO                         |  7 ++++
 drivers/{media/pci => staging/media/deprecated/saa7146}/ttpci/budget-av.c   |  2 +-
 drivers/{media/pci => staging/media/deprecated/saa7146}/ttpci/budget-ci.c   |  0
 drivers/{media/pci => staging/media/deprecated/saa7146}/ttpci/budget-core.c |  0
 drivers/{media/pci => staging/media/deprecated/saa7146}/ttpci/budget.c      |  0
 drivers/{media/pci => staging/media/deprecated/saa7146}/ttpci/budget.h      |  2 +-
 drivers/staging/media/{ => deprecated}/stkwebcam/Kconfig                    |  0
 drivers/staging/media/{ => deprecated}/stkwebcam/Makefile                   |  0
 drivers/staging/media/{ => deprecated}/stkwebcam/TODO                       |  0
 drivers/staging/media/{ => deprecated}/stkwebcam/stk-sensor.c               |  0
 drivers/staging/media/{ => deprecated}/stkwebcam/stk-webcam.c               |  0
 drivers/staging/media/{ => deprecated}/stkwebcam/stk-webcam.h               |  0
 drivers/{media/usb => staging/media/deprecated}/tm6000/Kconfig              |  5 ++-
 drivers/{media/usb => staging/media/deprecated}/tm6000/Makefile             |  0
 drivers/staging/media/deprecated/tm6000/TODO                                |  7 ++++
 drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-alsa.c        |  0
 drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-cards.c       |  0
 drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-core.c        |  0
 drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-dvb.c         |  0
 drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-i2c.c         |  0
 drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-input.c       |  0
 drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-regs.h        |  0
 drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-stds.c        |  0
 drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-usb-isoc.h    |  0
 drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-video.c       |  0
 drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000.h             |  0
 drivers/staging/media/deprecated/vpfe_capture/Kconfig                       | 58 +++++++++++++++++++++++++++
 drivers/staging/media/deprecated/vpfe_capture/Makefile                      |  4 ++
 drivers/staging/media/deprecated/vpfe_capture/TODO                          |  7 ++++
 .../ti/davinci => staging/media/deprecated/vpfe_capture}/ccdc_hw_device.h   |  0
 .../ti/davinci => staging/media/deprecated/vpfe_capture}/dm355_ccdc.c       |  2 +-
 .../davinci => drivers/staging/media/deprecated/vpfe_capture}/dm355_ccdc.h  |  0
 .../ti/davinci => staging/media/deprecated/vpfe_capture}/dm355_ccdc_regs.h  |  0
 .../ti/davinci => staging/media/deprecated/vpfe_capture}/dm644x_ccdc.c      |  2 +-
 .../davinci => drivers/staging/media/deprecated/vpfe_capture}/dm644x_ccdc.h |  0
 .../ti/davinci => staging/media/deprecated/vpfe_capture}/dm644x_ccdc_regs.h |  0
 .../platform/ti/davinci => staging/media/deprecated/vpfe_capture}/isif.c    |  2 +-
 .../media/davinci => drivers/staging/media/deprecated/vpfe_capture}/isif.h  |  0
 .../ti/davinci => staging/media/deprecated/vpfe_capture}/isif_regs.h        |  0
 .../ti/davinci => staging/media/deprecated/vpfe_capture}/vpfe_capture.c     |  0
 drivers/{media/usb => staging/media/deprecated}/zr364xx/Kconfig             |  7 +++-
 drivers/{media/usb => staging/media/deprecated}/zr364xx/Makefile            |  0
 drivers/staging/media/deprecated/zr364xx/TODO                               |  7 ++++
 drivers/{media/usb => staging/media/deprecated}/zr364xx/zr364xx.c           |  0
 drivers/staging/media/omap4iss/iss_video.c                                  |  2 +-
 include/media/davinci/vpbe_display.h                                        |  6 +--
 include/media/v4l2-mem2mem.h                                                | 12 +++---
 include/media/videobuf2-core.h                                              | 16 ++++----
 include/media/videobuf2-dvb.h                                               |  2 +-
 197 files changed, 359 insertions(+), 302 deletions(-)
 delete mode 100644 drivers/staging/media/av7110/TODO
 rename drivers/{media/usb => staging/media/deprecated}/cpia2/Kconfig (66%)
 rename drivers/{media/usb => staging/media/deprecated}/cpia2/Makefile (100%)
 create mode 100644 drivers/staging/media/deprecated/cpia2/TODO
 rename drivers/{media/usb => staging/media/deprecated}/cpia2/cpia2.h (100%)
 rename drivers/{media/usb => staging/media/deprecated}/cpia2/cpia2_core.c (100%)
 rename drivers/{media/usb => staging/media/deprecated}/cpia2/cpia2_registers.h (100%)
 rename drivers/{media/usb => staging/media/deprecated}/cpia2/cpia2_usb.c (100%)
 rename drivers/{media/usb => staging/media/deprecated}/cpia2/cpia2_v4l.c (100%)
 create mode 100644 drivers/staging/media/deprecated/fsl-viu/Kconfig
 create mode 100644 drivers/staging/media/deprecated/fsl-viu/Makefile
 create mode 100644 drivers/staging/media/deprecated/fsl-viu/TODO
 rename drivers/{media/platform/nxp => staging/media/deprecated/fsl-viu}/fsl-viu.c (100%)
 rename drivers/{media/pci => staging/media/deprecated}/meye/Kconfig (73%)
 rename drivers/{media/pci => staging/media/deprecated}/meye/Makefile (100%)
 create mode 100644 drivers/staging/media/deprecated/meye/TODO
 rename drivers/{media/pci => staging/media/deprecated}/meye/meye.c (100%)
 rename drivers/{media/pci => staging/media/deprecated}/meye/meye.h (100%)
 create mode 100644 drivers/staging/media/deprecated/saa7146/Kconfig
 create mode 100644 drivers/staging/media/deprecated/saa7146/Makefile
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/Kconfig (82%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/Makefile (78%)
 create mode 100644 drivers/staging/media/deprecated/saa7146/av7110/TODO
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-bilingual-channel-select.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-channel-select.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-clear-buffer.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-continue.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-fclose.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-fopen.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-fwrite.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-get-capabilities.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-get-status.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-pause.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-play.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-select-source.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-set-av-sync.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-set-bypass-mode.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-set-id.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-set-mixer.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-set-mute.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-set-streamtype.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-stop.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio_data_types.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio_function_calls.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110.c (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110.h (99%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_av.c (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_av.h (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_ca.c (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_ca.h (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_hw.c (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_hw.h (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_ipack.c (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_ipack.h (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_ir.c (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_v4l.c (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/budget-patch.c (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/dvb_filter.c (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/dvb_filter.h (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/sp8870.c (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/sp8870.h (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-clear-buffer.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-command.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-continue.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-fast-forward.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-fclose.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-fopen.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-freeze.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-fwrite.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-get-capabilities.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-get-event.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-get-frame-count.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-get-pts.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-get-size.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-get-status.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-play.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-select-source.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-set-blank.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-set-display-format.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-set-format.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-set-streamtype.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-slowmotion.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-stillpicture.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-stop.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-try-command.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video_function_calls.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video_types.rst (100%)
 rename drivers/{media/common/saa7146 => staging/media/deprecated/saa7146/common}/Kconfig (100%)
 rename drivers/{media/common/saa7146 => staging/media/deprecated/saa7146/common}/Makefile (100%)
 rename {include/media/drv-intf => drivers/staging/media/deprecated/saa7146/common}/saa7146.h (100%)
 rename drivers/{media/common/saa7146 => staging/media/deprecated/saa7146/common}/saa7146_core.c (99%)
 rename drivers/{media/common/saa7146 => staging/media/deprecated/saa7146/common}/saa7146_fops.c (99%)
 rename drivers/{media/common/saa7146 => staging/media/deprecated/saa7146/common}/saa7146_hlp.c (99%)
 rename drivers/{media/common/saa7146 => staging/media/deprecated/saa7146/common}/saa7146_i2c.c (99%)
 rename drivers/{media/common/saa7146 => staging/media/deprecated/saa7146/common}/saa7146_vbi.c (99%)
 rename drivers/{media/common/saa7146 => staging/media/deprecated/saa7146/common}/saa7146_video.c (99%)
 rename {include/media/drv-intf => drivers/staging/media/deprecated/saa7146/common}/saa7146_vv.h (99%)
 rename drivers/{media/pci => staging/media/deprecated/saa7146}/saa7146/Kconfig (67%)
 rename drivers/{media/pci => staging/media/deprecated/saa7146}/saa7146/Makefile (100%)
 create mode 100644 drivers/staging/media/deprecated/saa7146/saa7146/TODO
 rename drivers/{media/pci => staging/media/deprecated/saa7146}/saa7146/hexium_gemini.c (99%)
 rename drivers/{media/pci => staging/media/deprecated/saa7146}/saa7146/hexium_orion.c (99%)
 rename drivers/{media/pci => staging/media/deprecated/saa7146}/saa7146/mxb.c (99%)
 rename drivers/{media/pci => staging/media/deprecated/saa7146}/ttpci/Kconfig (83%)
 rename drivers/{media/pci => staging/media/deprecated/saa7146}/ttpci/Makefile (100%)
 create mode 100644 drivers/staging/media/deprecated/saa7146/ttpci/TODO
 rename drivers/{media/pci => staging/media/deprecated/saa7146}/ttpci/budget-av.c (99%)
 rename drivers/{media/pci => staging/media/deprecated/saa7146}/ttpci/budget-ci.c (100%)
 rename drivers/{media/pci => staging/media/deprecated/saa7146}/ttpci/budget-core.c (100%)
 rename drivers/{media/pci => staging/media/deprecated/saa7146}/ttpci/budget.c (100%)
 rename drivers/{media/pci => staging/media/deprecated/saa7146}/ttpci/budget.h (98%)
 rename drivers/staging/media/{ => deprecated}/stkwebcam/Kconfig (100%)
 rename drivers/staging/media/{ => deprecated}/stkwebcam/Makefile (100%)
 rename drivers/staging/media/{ => deprecated}/stkwebcam/TODO (100%)
 rename drivers/staging/media/{ => deprecated}/stkwebcam/stk-sensor.c (100%)
 rename drivers/staging/media/{ => deprecated}/stkwebcam/stk-webcam.c (100%)
 rename drivers/staging/media/{ => deprecated}/stkwebcam/stk-webcam.h (100%)
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/Kconfig (84%)
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/Makefile (100%)
 create mode 100644 drivers/staging/media/deprecated/tm6000/TODO
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-alsa.c (100%)
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-cards.c (100%)
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-core.c (100%)
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-dvb.c (100%)
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-i2c.c (100%)
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-input.c (100%)
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-regs.h (100%)
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-stds.c (100%)
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-usb-isoc.h (100%)
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-video.c (100%)
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000.h (100%)
 create mode 100644 drivers/staging/media/deprecated/vpfe_capture/Kconfig
 create mode 100644 drivers/staging/media/deprecated/vpfe_capture/Makefile
 create mode 100644 drivers/staging/media/deprecated/vpfe_capture/TODO
 rename drivers/{media/platform/ti/davinci => staging/media/deprecated/vpfe_capture}/ccdc_hw_device.h (100%)
 rename drivers/{media/platform/ti/davinci => staging/media/deprecated/vpfe_capture}/dm355_ccdc.c (99%)
 rename {include/media/davinci => drivers/staging/media/deprecated/vpfe_capture}/dm355_ccdc.h (100%)
 rename drivers/{media/platform/ti/davinci => staging/media/deprecated/vpfe_capture}/dm355_ccdc_regs.h (100%)
 rename drivers/{media/platform/ti/davinci => staging/media/deprecated/vpfe_capture}/dm644x_ccdc.c (99%)
 rename {include/media/davinci => drivers/staging/media/deprecated/vpfe_capture}/dm644x_ccdc.h (100%)
 rename drivers/{media/platform/ti/davinci => staging/media/deprecated/vpfe_capture}/dm644x_ccdc_regs.h (100%)
 rename drivers/{media/platform/ti/davinci => staging/media/deprecated/vpfe_capture}/isif.c (99%)
 rename {include/media/davinci => drivers/staging/media/deprecated/vpfe_capture}/isif.h (100%)
 rename drivers/{media/platform/ti/davinci => staging/media/deprecated/vpfe_capture}/isif_regs.h (100%)
 rename drivers/{media/platform/ti/davinci => staging/media/deprecated/vpfe_capture}/vpfe_capture.c (100%)
 rename drivers/{media/usb => staging/media/deprecated}/zr364xx/Kconfig (65%)
 rename drivers/{media/usb => staging/media/deprecated}/zr364xx/Makefile (100%)
 create mode 100644 drivers/staging/media/deprecated/zr364xx/TODO
 rename drivers/{media/usb => staging/media/deprecated}/zr364xx/zr364xx.c (100%)
