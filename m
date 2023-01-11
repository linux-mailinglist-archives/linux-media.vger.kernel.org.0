Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D10E665967
	for <lists+linux-media@lfdr.de>; Wed, 11 Jan 2023 11:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235879AbjAKKxP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Jan 2023 05:53:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238461AbjAKKxG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Jan 2023 05:53:06 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA889101D
        for <linux-media@vger.kernel.org>; Wed, 11 Jan 2023 02:53:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 62A67B81AC7
        for <linux-media@vger.kernel.org>; Wed, 11 Jan 2023 10:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812CBC433EF;
        Wed, 11 Jan 2023 10:53:00 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 00/13] staging/media: remove most deprecated drivers
Date:   Wed, 11 Jan 2023 11:52:45 +0100
Message-Id: <20230111105258.547471-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We deprecated a lot of old drivers that did not use vb2, but either
implemented buffer handling themselves, or used the old vb1 framework.

This series deletes these drivers.

After this series, the only remaining deprecated driver is the atmel
driver.

The only two drivers that still use vb1 in mainline are cx18 and bttv.

Regards,

	Hans

Hans Verkuil (13):
  meye: remove this deprecated driver
  cpia2: remove deprecated driver
  fsl-viu: remove deprecated driver
  stkwebcam: remove deprecated driver
  zr364xx: remove deprecated driver
  vpfe_capture: remove deprecated davinci drivers
  tm6000: remove deprecated driver
  av7110: remove deprecated driver
  ttpci: remove deprecated driver
  saa7146: remove deprecated drivers
  dvbdev.h: remove DVB_DEVICE_VIDEO/AUDIO/OSD
  dvb_demux.h: remove av7110-private fields
  dvb_demux.h: remove write_to_decoder

 Documentation/admin-guide/media/cpia2.rst     |  145 -
 .../admin-guide/media/dvb-drivers.rst         |    1 -
 Documentation/admin-guide/media/dvb_intro.rst |    8 +-
 Documentation/admin-guide/media/meye.rst      |   93 -
 .../admin-guide/media/other-usb-cardlist.rst  |   14 -
 .../admin-guide/media/pci-cardlist.rst        |    5 -
 .../admin-guide/media/platform-cardlist.rst   |    1 -
 .../admin-guide/media/tm6000-cardlist.rst     |   83 -
 .../admin-guide/media/usb-cardlist.rst        |    7 -
 .../admin-guide/media/v4l-drivers.rst         |    2 -
 Documentation/admin-guide/media/zr364xx.rst   |  102 -
 .../driver-api/media/drivers/cpia2_devel.rst  |   56 -
 .../driver-api/media/drivers/index.rst        |    1 -
 .../userspace-api/media/drivers/index.rst     |    1 -
 .../userspace-api/media/drivers/meye-uapi.rst |   53 -
 MAINTAINERS                                   |   34 -
 drivers/media/common/b2c2/flexcop.c           |    1 -
 drivers/media/dvb-core/dvb_demux.c            |    6 -
 drivers/media/dvb-core/dvbdev.c               |    6 -
 drivers/media/firewire/firedtv-dvb.c          |    1 -
 drivers/media/pci/bt8xx/dvb-bt8xx.c           |    1 -
 drivers/media/pci/mantis/mantis_dvb.c         |    1 -
 drivers/media/pci/ngene/ngene-dvb.c           |    1 -
 drivers/media/pci/pt1/pt1.c                   |    1 -
 drivers/media/pci/smipcie/smipcie-main.c      |    1 -
 .../st/sti/c8sectpfe/c8sectpfe-common.c       |    1 -
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c   |    1 -
 drivers/media/usb/dvb-usb/dvb-usb-dvb.c       |    1 -
 drivers/media/usb/pvrusb2/pvrusb2-dvb.c       |    1 -
 .../media/usb/ttusb-budget/dvb-ttusb-budget.c |    1 -
 drivers/media/usb/ttusb-dec/ttusb_dec.c       |    1 -
 drivers/staging/media/Kconfig                 |    8 -
 drivers/staging/media/Makefile                |    8 -
 .../staging/media/deprecated/cpia2/Kconfig    |   13 -
 .../staging/media/deprecated/cpia2/Makefile   |    4 -
 drivers/staging/media/deprecated/cpia2/TODO   |    6 -
 .../staging/media/deprecated/cpia2/cpia2.h    |  475 ---
 .../media/deprecated/cpia2/cpia2_core.c       | 2434 --------------
 .../media/deprecated/cpia2/cpia2_registers.h  |  463 ---
 .../media/deprecated/cpia2/cpia2_usb.c        |  966 ------
 .../media/deprecated/cpia2/cpia2_v4l.c        | 1226 -------
 .../staging/media/deprecated/fsl-viu/Kconfig  |   15 -
 .../staging/media/deprecated/fsl-viu/Makefile |    2 -
 drivers/staging/media/deprecated/fsl-viu/TODO |    7 -
 .../media/deprecated/fsl-viu/fsl-viu.c        | 1599 ---------
 drivers/staging/media/deprecated/meye/Kconfig |   19 -
 .../staging/media/deprecated/meye/Makefile    |    2 -
 drivers/staging/media/deprecated/meye/TODO    |    6 -
 drivers/staging/media/deprecated/meye/meye.c  | 1814 ----------
 drivers/staging/media/deprecated/meye/meye.h  |  311 --
 .../staging/media/deprecated/saa7146/Kconfig  |    5 -
 .../staging/media/deprecated/saa7146/Makefile |    2 -
 .../media/deprecated/saa7146/av7110/Kconfig   |  106 -
 .../media/deprecated/saa7146/av7110/Makefile  |   23 -
 .../media/deprecated/saa7146/av7110/TODO      |    9 -
 .../av7110/audio-bilingual-channel-select.rst |   58 -
 .../saa7146/av7110/audio-channel-select.rst   |   57 -
 .../saa7146/av7110/audio-clear-buffer.rst     |   48 -
 .../saa7146/av7110/audio-continue.rst         |   48 -
 .../saa7146/av7110/audio-fclose.rst           |   51 -
 .../deprecated/saa7146/av7110/audio-fopen.rst |  103 -
 .../saa7146/av7110/audio-fwrite.rst           |   79 -
 .../saa7146/av7110/audio-get-capabilities.rst |   54 -
 .../saa7146/av7110/audio-get-status.rst       |   54 -
 .../deprecated/saa7146/av7110/audio-pause.rst |   49 -
 .../deprecated/saa7146/av7110/audio-play.rst  |   48 -
 .../saa7146/av7110/audio-select-source.rst    |   56 -
 .../saa7146/av7110/audio-set-av-sync.rst      |   58 -
 .../saa7146/av7110/audio-set-bypass-mode.rst  |   62 -
 .../saa7146/av7110/audio-set-id.rst           |   59 -
 .../saa7146/av7110/audio-set-mixer.rst        |   53 -
 .../saa7146/av7110/audio-set-mute.rst         |   62 -
 .../saa7146/av7110/audio-set-streamtype.rst   |   66 -
 .../deprecated/saa7146/av7110/audio-stop.rst  |   48 -
 .../media/deprecated/saa7146/av7110/audio.rst |   27 -
 .../saa7146/av7110/audio_data_types.rst       |  116 -
 .../saa7146/av7110/audio_function_calls.rst   |   30 -
 .../media/deprecated/saa7146/av7110/av7110.c  | 2919 -----------------
 .../media/deprecated/saa7146/av7110/av7110.h  |  315 --
 .../deprecated/saa7146/av7110/av7110_av.c     | 1681 ----------
 .../deprecated/saa7146/av7110/av7110_av.h     |   32 -
 .../deprecated/saa7146/av7110/av7110_ca.c     |  380 ---
 .../deprecated/saa7146/av7110/av7110_ca.h     |   15 -
 .../deprecated/saa7146/av7110/av7110_hw.c     | 1204 -------
 .../deprecated/saa7146/av7110/av7110_hw.h     |  496 ---
 .../deprecated/saa7146/av7110/av7110_ipack.c  |  404 ---
 .../deprecated/saa7146/av7110/av7110_ipack.h  |   13 -
 .../deprecated/saa7146/av7110/av7110_ir.c     |  158 -
 .../deprecated/saa7146/av7110/av7110_v4l.c    |  952 ------
 .../deprecated/saa7146/av7110/budget-patch.c  |  665 ----
 .../deprecated/saa7146/av7110/dvb_filter.c    |  115 -
 .../deprecated/saa7146/av7110/dvb_filter.h    |  242 --
 .../media/deprecated/saa7146/av7110/sp8870.c  |  609 ----
 .../media/deprecated/saa7146/av7110/sp8870.h  |   37 -
 .../saa7146/av7110/video-clear-buffer.rst     |   54 -
 .../saa7146/av7110/video-command.rst          |   96 -
 .../saa7146/av7110/video-continue.rst         |   57 -
 .../saa7146/av7110/video-fast-forward.rst     |   72 -
 .../saa7146/av7110/video-fclose.rst           |   51 -
 .../deprecated/saa7146/av7110/video-fopen.rst |  111 -
 .../saa7146/av7110/video-freeze.rst           |   61 -
 .../saa7146/av7110/video-fwrite.rst           |   79 -
 .../saa7146/av7110/video-get-capabilities.rst |   61 -
 .../saa7146/av7110/video-get-event.rst        |  105 -
 .../saa7146/av7110/video-get-frame-count.rst  |   65 -
 .../saa7146/av7110/video-get-pts.rst          |   69 -
 .../saa7146/av7110/video-get-size.rst         |   69 -
 .../saa7146/av7110/video-get-status.rst       |   72 -
 .../deprecated/saa7146/av7110/video-play.rst  |   57 -
 .../saa7146/av7110/video-select-source.rst    |   76 -
 .../saa7146/av7110/video-set-blank.rst        |   64 -
 .../av7110/video-set-display-format.rst       |   60 -
 .../saa7146/av7110/video-set-format.rst       |   82 -
 .../saa7146/av7110/video-set-streamtype.rst   |   61 -
 .../saa7146/av7110/video-slowmotion.rst       |   72 -
 .../saa7146/av7110/video-stillpicture.rst     |   61 -
 .../deprecated/saa7146/av7110/video-stop.rst  |   74 -
 .../saa7146/av7110/video-try-command.rst      |   66 -
 .../media/deprecated/saa7146/av7110/video.rst |   36 -
 .../saa7146/av7110/video_function_calls.rst   |   35 -
 .../deprecated/saa7146/av7110/video_types.rst |  248 --
 .../media/deprecated/saa7146/common/Kconfig   |   10 -
 .../media/deprecated/saa7146/common/Makefile  |    6 -
 .../media/deprecated/saa7146/common/saa7146.h |  472 ---
 .../deprecated/saa7146/common/saa7146_core.c  |  578 ----
 .../deprecated/saa7146/common/saa7146_fops.c  |  658 ----
 .../deprecated/saa7146/common/saa7146_hlp.c   | 1046 ------
 .../deprecated/saa7146/common/saa7146_i2c.c   |  421 ---
 .../deprecated/saa7146/common/saa7146_vbi.c   |  498 ---
 .../deprecated/saa7146/common/saa7146_video.c | 1286 --------
 .../deprecated/saa7146/common/saa7146_vv.h    |  266 --
 .../media/deprecated/saa7146/saa7146/Kconfig  |   48 -
 .../media/deprecated/saa7146/saa7146/Makefile |    6 -
 .../media/deprecated/saa7146/saa7146/TODO     |    7 -
 .../saa7146/saa7146/hexium_gemini.c           |  425 ---
 .../deprecated/saa7146/saa7146/hexium_orion.c |  496 ---
 .../media/deprecated/saa7146/saa7146/mxb.c    |  873 -----
 .../media/deprecated/saa7146/ttpci/Kconfig    |   95 -
 .../media/deprecated/saa7146/ttpci/Makefile   |   13 -
 .../media/deprecated/saa7146/ttpci/TODO       |    7 -
 .../deprecated/saa7146/ttpci/budget-av.c      | 1622 ---------
 .../deprecated/saa7146/ttpci/budget-ci.c      | 1574 ---------
 .../deprecated/saa7146/ttpci/budget-core.c    |  603 ----
 .../media/deprecated/saa7146/ttpci/budget.c   |  883 -----
 .../media/deprecated/saa7146/ttpci/budget.h   |  129 -
 .../media/deprecated/stkwebcam/Kconfig        |   18 -
 .../media/deprecated/stkwebcam/Makefile       |    5 -
 .../staging/media/deprecated/stkwebcam/TODO   |   12 -
 .../media/deprecated/stkwebcam/stk-sensor.c   |  587 ----
 .../media/deprecated/stkwebcam/stk-webcam.c   | 1434 --------
 .../media/deprecated/stkwebcam/stk-webcam.h   |  123 -
 .../staging/media/deprecated/tm6000/Kconfig   |   37 -
 .../staging/media/deprecated/tm6000/Makefile  |   14 -
 drivers/staging/media/deprecated/tm6000/TODO  |    7 -
 .../media/deprecated/tm6000/tm6000-alsa.c     |  440 ---
 .../media/deprecated/tm6000/tm6000-cards.c    | 1397 --------
 .../media/deprecated/tm6000/tm6000-core.c     |  916 ------
 .../media/deprecated/tm6000/tm6000-dvb.c      |  454 ---
 .../media/deprecated/tm6000/tm6000-i2c.c      |  317 --
 .../media/deprecated/tm6000/tm6000-input.c    |  503 ---
 .../media/deprecated/tm6000/tm6000-regs.h     |  588 ----
 .../media/deprecated/tm6000/tm6000-stds.c     |  623 ----
 .../media/deprecated/tm6000/tm6000-usb-isoc.h |   38 -
 .../media/deprecated/tm6000/tm6000-video.c    | 1703 ----------
 .../staging/media/deprecated/tm6000/tm6000.h  |  396 ---
 .../media/deprecated/vpfe_capture/Kconfig     |   58 -
 .../media/deprecated/vpfe_capture/Makefile    |    4 -
 .../media/deprecated/vpfe_capture/TODO        |    7 -
 .../deprecated/vpfe_capture/ccdc_hw_device.h  |   80 -
 .../deprecated/vpfe_capture/dm355_ccdc.c      |  934 ------
 .../deprecated/vpfe_capture/dm355_ccdc.h      |  308 --
 .../deprecated/vpfe_capture/dm355_ccdc_regs.h |  297 --
 .../deprecated/vpfe_capture/dm644x_ccdc.c     |  879 -----
 .../deprecated/vpfe_capture/dm644x_ccdc.h     |  171 -
 .../vpfe_capture/dm644x_ccdc_regs.h           |  140 -
 .../media/deprecated/vpfe_capture/isif.c      | 1127 -------
 .../media/deprecated/vpfe_capture/isif.h      |  518 ---
 .../media/deprecated/vpfe_capture/isif_regs.h |  256 --
 .../deprecated/vpfe_capture/vpfe_capture.c    | 1902 -----------
 .../staging/media/deprecated/zr364xx/Kconfig  |   18 -
 .../staging/media/deprecated/zr364xx/Makefile |    3 -
 drivers/staging/media/deprecated/zr364xx/TODO |    7 -
 .../media/deprecated/zr364xx/zr364xx.c        | 1635 ---------
 include/media/davinci/ccdc_types.h            |   30 -
 include/media/dvb_demux.h                     |   13 -
 include/media/dvbdev.h                        |   11 -
 include/uapi/linux/meye.h                     |   65 -
 include/uapi/linux/v4l2-controls.h            |    8 +-
 188 files changed, 7 insertions(+), 53789 deletions(-)
 delete mode 100644 Documentation/admin-guide/media/cpia2.rst
 delete mode 100644 Documentation/admin-guide/media/meye.rst
 delete mode 100644 Documentation/admin-guide/media/tm6000-cardlist.rst
 delete mode 100644 Documentation/admin-guide/media/zr364xx.rst
 delete mode 100644 Documentation/driver-api/media/drivers/cpia2_devel.rst
 delete mode 100644 Documentation/userspace-api/media/drivers/meye-uapi.rst
 delete mode 100644 drivers/staging/media/deprecated/cpia2/Kconfig
 delete mode 100644 drivers/staging/media/deprecated/cpia2/Makefile
 delete mode 100644 drivers/staging/media/deprecated/cpia2/TODO
 delete mode 100644 drivers/staging/media/deprecated/cpia2/cpia2.h
 delete mode 100644 drivers/staging/media/deprecated/cpia2/cpia2_core.c
 delete mode 100644 drivers/staging/media/deprecated/cpia2/cpia2_registers.h
 delete mode 100644 drivers/staging/media/deprecated/cpia2/cpia2_usb.c
 delete mode 100644 drivers/staging/media/deprecated/cpia2/cpia2_v4l.c
 delete mode 100644 drivers/staging/media/deprecated/fsl-viu/Kconfig
 delete mode 100644 drivers/staging/media/deprecated/fsl-viu/Makefile
 delete mode 100644 drivers/staging/media/deprecated/fsl-viu/TODO
 delete mode 100644 drivers/staging/media/deprecated/fsl-viu/fsl-viu.c
 delete mode 100644 drivers/staging/media/deprecated/meye/Kconfig
 delete mode 100644 drivers/staging/media/deprecated/meye/Makefile
 delete mode 100644 drivers/staging/media/deprecated/meye/TODO
 delete mode 100644 drivers/staging/media/deprecated/meye/meye.c
 delete mode 100644 drivers/staging/media/deprecated/meye/meye.h
 delete mode 100644 drivers/staging/media/deprecated/saa7146/Kconfig
 delete mode 100644 drivers/staging/media/deprecated/saa7146/Makefile
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/Kconfig
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/Makefile
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/TODO
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/audio-bilingual-channel-select.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/audio-channel-select.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/audio-clear-buffer.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/audio-continue.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/audio-fclose.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/audio-fopen.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/audio-fwrite.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/audio-get-capabilities.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/audio-get-status.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/audio-pause.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/audio-play.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/audio-select-source.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/audio-set-av-sync.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/audio-set-bypass-mode.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/audio-set-id.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/audio-set-mixer.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/audio-set-mute.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/audio-set-streamtype.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/audio-stop.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/audio.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/audio_data_types.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/audio_function_calls.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/av7110.c
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/av7110.h
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/av7110_av.c
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/av7110_av.h
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.c
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.h
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/av7110_hw.c
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/av7110_hw.h
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/av7110_ipack.c
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/av7110_ipack.h
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/av7110_ir.c
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/av7110_v4l.c
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/budget-patch.c
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/dvb_filter.c
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/dvb_filter.h
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/sp8870.c
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/sp8870.h
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video-clear-buffer.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video-command.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video-continue.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video-fast-forward.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video-fclose.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video-fopen.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video-freeze.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video-fwrite.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video-get-capabilities.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video-get-event.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video-get-frame-count.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video-get-pts.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video-get-size.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video-get-status.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video-play.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video-select-source.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video-set-blank.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video-set-display-format.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video-set-format.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video-set-streamtype.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video-slowmotion.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video-stillpicture.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video-stop.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video-try-command.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video_function_calls.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/video_types.rst
 delete mode 100644 drivers/staging/media/deprecated/saa7146/common/Kconfig
 delete mode 100644 drivers/staging/media/deprecated/saa7146/common/Makefile
 delete mode 100644 drivers/staging/media/deprecated/saa7146/common/saa7146.h
 delete mode 100644 drivers/staging/media/deprecated/saa7146/common/saa7146_core.c
 delete mode 100644 drivers/staging/media/deprecated/saa7146/common/saa7146_fops.c
 delete mode 100644 drivers/staging/media/deprecated/saa7146/common/saa7146_hlp.c
 delete mode 100644 drivers/staging/media/deprecated/saa7146/common/saa7146_i2c.c
 delete mode 100644 drivers/staging/media/deprecated/saa7146/common/saa7146_vbi.c
 delete mode 100644 drivers/staging/media/deprecated/saa7146/common/saa7146_video.c
 delete mode 100644 drivers/staging/media/deprecated/saa7146/common/saa7146_vv.h
 delete mode 100644 drivers/staging/media/deprecated/saa7146/saa7146/Kconfig
 delete mode 100644 drivers/staging/media/deprecated/saa7146/saa7146/Makefile
 delete mode 100644 drivers/staging/media/deprecated/saa7146/saa7146/TODO
 delete mode 100644 drivers/staging/media/deprecated/saa7146/saa7146/hexium_gemini.c
 delete mode 100644 drivers/staging/media/deprecated/saa7146/saa7146/hexium_orion.c
 delete mode 100644 drivers/staging/media/deprecated/saa7146/saa7146/mxb.c
 delete mode 100644 drivers/staging/media/deprecated/saa7146/ttpci/Kconfig
 delete mode 100644 drivers/staging/media/deprecated/saa7146/ttpci/Makefile
 delete mode 100644 drivers/staging/media/deprecated/saa7146/ttpci/TODO
 delete mode 100644 drivers/staging/media/deprecated/saa7146/ttpci/budget-av.c
 delete mode 100644 drivers/staging/media/deprecated/saa7146/ttpci/budget-ci.c
 delete mode 100644 drivers/staging/media/deprecated/saa7146/ttpci/budget-core.c
 delete mode 100644 drivers/staging/media/deprecated/saa7146/ttpci/budget.c
 delete mode 100644 drivers/staging/media/deprecated/saa7146/ttpci/budget.h
 delete mode 100644 drivers/staging/media/deprecated/stkwebcam/Kconfig
 delete mode 100644 drivers/staging/media/deprecated/stkwebcam/Makefile
 delete mode 100644 drivers/staging/media/deprecated/stkwebcam/TODO
 delete mode 100644 drivers/staging/media/deprecated/stkwebcam/stk-sensor.c
 delete mode 100644 drivers/staging/media/deprecated/stkwebcam/stk-webcam.c
 delete mode 100644 drivers/staging/media/deprecated/stkwebcam/stk-webcam.h
 delete mode 100644 drivers/staging/media/deprecated/tm6000/Kconfig
 delete mode 100644 drivers/staging/media/deprecated/tm6000/Makefile
 delete mode 100644 drivers/staging/media/deprecated/tm6000/TODO
 delete mode 100644 drivers/staging/media/deprecated/tm6000/tm6000-alsa.c
 delete mode 100644 drivers/staging/media/deprecated/tm6000/tm6000-cards.c
 delete mode 100644 drivers/staging/media/deprecated/tm6000/tm6000-core.c
 delete mode 100644 drivers/staging/media/deprecated/tm6000/tm6000-dvb.c
 delete mode 100644 drivers/staging/media/deprecated/tm6000/tm6000-i2c.c
 delete mode 100644 drivers/staging/media/deprecated/tm6000/tm6000-input.c
 delete mode 100644 drivers/staging/media/deprecated/tm6000/tm6000-regs.h
 delete mode 100644 drivers/staging/media/deprecated/tm6000/tm6000-stds.c
 delete mode 100644 drivers/staging/media/deprecated/tm6000/tm6000-usb-isoc.h
 delete mode 100644 drivers/staging/media/deprecated/tm6000/tm6000-video.c
 delete mode 100644 drivers/staging/media/deprecated/tm6000/tm6000.h
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/Kconfig
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/Makefile
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/TODO
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/ccdc_hw_device.h
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.c
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.h
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc_regs.h
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.c
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.h
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc_regs.h
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/isif.c
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/isif.h
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/isif_regs.h
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/vpfe_capture.c
 delete mode 100644 drivers/staging/media/deprecated/zr364xx/Kconfig
 delete mode 100644 drivers/staging/media/deprecated/zr364xx/Makefile
 delete mode 100644 drivers/staging/media/deprecated/zr364xx/TODO
 delete mode 100644 drivers/staging/media/deprecated/zr364xx/zr364xx.c
 delete mode 100644 include/media/davinci/ccdc_types.h
 delete mode 100644 include/uapi/linux/meye.h

-- 
2.39.0

