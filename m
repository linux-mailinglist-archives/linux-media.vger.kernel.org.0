Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE3766AAF4
	for <lists+linux-media@lfdr.de>; Sat, 14 Jan 2023 11:32:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjANKbk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Jan 2023 05:31:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjANKbj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Jan 2023 05:31:39 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5DDE6580
        for <linux-media@vger.kernel.org>; Sat, 14 Jan 2023 02:31:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7936760A2B
        for <linux-media@vger.kernel.org>; Sat, 14 Jan 2023 10:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574CDC433EF
        for <linux-media@vger.kernel.org>; Sat, 14 Jan 2023 10:31:35 +0000 (UTC)
Message-ID: <acd66bb5-af86-4d4c-4652-79e79b329714@xs4all.nl>
Date:   Sat, 14 Jan 2023 11:31:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.3] media: delete deprecated drivers
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

This series deletes the deprecated media drivers that do not use vb2
for streaming. They either implement this themselves, or use the old
vb1 framework.

It's all old hardware, and nobody (unsurprisingly) stepped up to do the
vb2 conversion.

Regards,

	Hans

The following changes since commit 6599e683db1bf22fee74302c47e31b9a42a1c3d2:

  Merge tag 'v6.2-rc1' into media_tree (2022-12-28 16:07:44 +0000)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.3b

for you to fetch changes up to d16237f79ac753e043ae9f7dc98551d6b6699111:

  dvb_demux.h: remove write_to_decoder (2023-01-14 11:27:07 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (16):
      meye: remove this deprecated driver
      cpia2: remove deprecated driver
      fsl-viu: remove deprecated driver
      stkwebcam: remove deprecated driver
      zr364xx: remove deprecated driver
      vpfe_capture: remove deprecated davinci drivers
      tm6000: remove deprecated driver
      av7110: stop building this deprecated driver
      av7110: remove deprecated documentation
      av7110: remove av7110* sources
      av7110: remove deprecated driver
      ttpci: remove deprecated driver
      saa7146: remove deprecated drivers
      dvbdev.h: remove DVB_DEVICE_VIDEO/AUDIO/OSD
      dvb_demux.h: remove av7110-private fields
      dvb_demux.h: remove write_to_decoder

 Documentation/admin-guide/media/cpia2.rst                                        |  145 --
 Documentation/admin-guide/media/dvb-drivers.rst                                  |    1 -
 Documentation/admin-guide/media/dvb_intro.rst                                    |    8 +-
 Documentation/admin-guide/media/meye.rst                                         |   93 --
 Documentation/admin-guide/media/other-usb-cardlist.rst                           |   14 -
 Documentation/admin-guide/media/pci-cardlist.rst                                 |    5 -
 Documentation/admin-guide/media/platform-cardlist.rst                            |    1 -
 Documentation/admin-guide/media/tm6000-cardlist.rst                              |   83 --
 Documentation/admin-guide/media/usb-cardlist.rst                                 |    7 -
 Documentation/admin-guide/media/v4l-drivers.rst                                  |    2 -
 Documentation/admin-guide/media/zr364xx.rst                                      |  102 --
 Documentation/driver-api/media/drivers/cpia2_devel.rst                           |   56 -
 Documentation/driver-api/media/drivers/index.rst                                 |    1 -
 Documentation/userspace-api/media/drivers/index.rst                              |    1 -
 Documentation/userspace-api/media/drivers/meye-uapi.rst                          |   53 -
 MAINTAINERS                                                                      |   34 -
 drivers/media/common/b2c2/flexcop.c                                              |    1 -
 drivers/media/dvb-core/dvb_demux.c                                               |    6 -
 drivers/media/dvb-core/dvbdev.c                                                  |    6 -
 drivers/media/firewire/firedtv-dvb.c                                             |    1 -
 drivers/media/pci/bt8xx/dvb-bt8xx.c                                              |    1 -
 drivers/media/pci/mantis/mantis_dvb.c                                            |    1 -
 drivers/media/pci/ngene/ngene-dvb.c                                              |    1 -
 drivers/media/pci/pt1/pt1.c                                                      |    1 -
 drivers/media/pci/smipcie/smipcie-main.c                                         |    1 -
 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-common.c                       |    1 -
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c                                      |    1 -
 drivers/media/usb/dvb-usb/dvb-usb-dvb.c                                          |    1 -
 drivers/media/usb/pvrusb2/pvrusb2-dvb.c                                          |    1 -
 drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c                                |    1 -
 drivers/media/usb/ttusb-dec/ttusb_dec.c                                          |    1 -
 drivers/staging/media/Kconfig                                                    |    8 -
 drivers/staging/media/Makefile                                                   |    8 -
 drivers/staging/media/deprecated/cpia2/Kconfig                                   |   13 -
 drivers/staging/media/deprecated/cpia2/Makefile                                  |    4 -
 drivers/staging/media/deprecated/cpia2/TODO                                      |    6 -
 drivers/staging/media/deprecated/cpia2/cpia2.h                                   |  475 ------
 drivers/staging/media/deprecated/cpia2/cpia2_core.c                              | 2434 -------------------------------
 drivers/staging/media/deprecated/cpia2/cpia2_registers.h                         |  463 ------
 drivers/staging/media/deprecated/cpia2/cpia2_usb.c                               |  966 ------------
 drivers/staging/media/deprecated/cpia2/cpia2_v4l.c                               | 1226 ----------------
 drivers/staging/media/deprecated/fsl-viu/Kconfig                                 |   15 -
 drivers/staging/media/deprecated/fsl-viu/Makefile                                |    2 -
 drivers/staging/media/deprecated/fsl-viu/TODO                                    |    7 -
 drivers/staging/media/deprecated/fsl-viu/fsl-viu.c                               | 1599 --------------------
 drivers/staging/media/deprecated/meye/Kconfig                                    |   19 -
 drivers/staging/media/deprecated/meye/Makefile                                   |    2 -
 drivers/staging/media/deprecated/meye/TODO                                       |    6 -
 drivers/staging/media/deprecated/meye/meye.c                                     | 1814 -----------------------
 drivers/staging/media/deprecated/meye/meye.h                                     |  311 ----
 drivers/staging/media/deprecated/saa7146/Kconfig                                 |    5 -
 drivers/staging/media/deprecated/saa7146/Makefile                                |    2 -
 drivers/staging/media/deprecated/saa7146/av7110/Kconfig                          |  106 --
 drivers/staging/media/deprecated/saa7146/av7110/Makefile                         |   23 -
 drivers/staging/media/deprecated/saa7146/av7110/TODO                             |    9 -
 .../staging/media/deprecated/saa7146/av7110/audio-bilingual-channel-select.rst   |   58 -
 drivers/staging/media/deprecated/saa7146/av7110/audio-channel-select.rst         |   57 -
 drivers/staging/media/deprecated/saa7146/av7110/audio-clear-buffer.rst           |   48 -
 drivers/staging/media/deprecated/saa7146/av7110/audio-continue.rst               |   48 -
 drivers/staging/media/deprecated/saa7146/av7110/audio-fclose.rst                 |   51 -
 drivers/staging/media/deprecated/saa7146/av7110/audio-fopen.rst                  |  103 --
 drivers/staging/media/deprecated/saa7146/av7110/audio-fwrite.rst                 |   79 -
 drivers/staging/media/deprecated/saa7146/av7110/audio-get-capabilities.rst       |   54 -
 drivers/staging/media/deprecated/saa7146/av7110/audio-get-status.rst             |   54 -
 drivers/staging/media/deprecated/saa7146/av7110/audio-pause.rst                  |   49 -
 drivers/staging/media/deprecated/saa7146/av7110/audio-play.rst                   |   48 -
 drivers/staging/media/deprecated/saa7146/av7110/audio-select-source.rst          |   56 -
 drivers/staging/media/deprecated/saa7146/av7110/audio-set-av-sync.rst            |   58 -
 drivers/staging/media/deprecated/saa7146/av7110/audio-set-bypass-mode.rst        |   62 -
 drivers/staging/media/deprecated/saa7146/av7110/audio-set-id.rst                 |   59 -
 drivers/staging/media/deprecated/saa7146/av7110/audio-set-mixer.rst              |   53 -
 drivers/staging/media/deprecated/saa7146/av7110/audio-set-mute.rst               |   62 -
 drivers/staging/media/deprecated/saa7146/av7110/audio-set-streamtype.rst         |   66 -
 drivers/staging/media/deprecated/saa7146/av7110/audio-stop.rst                   |   48 -
 drivers/staging/media/deprecated/saa7146/av7110/audio.rst                        |   27 -
 drivers/staging/media/deprecated/saa7146/av7110/audio_data_types.rst             |  116 --
 drivers/staging/media/deprecated/saa7146/av7110/audio_function_calls.rst         |   30 -
 drivers/staging/media/deprecated/saa7146/av7110/av7110.c                         | 2919 -------------------------------------
 drivers/staging/media/deprecated/saa7146/av7110/av7110.h                         |  315 ----
 drivers/staging/media/deprecated/saa7146/av7110/av7110_av.c                      | 1681 ---------------------
 drivers/staging/media/deprecated/saa7146/av7110/av7110_av.h                      |   32 -
 drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.c                      |  380 -----
 drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.h                      |   15 -
 drivers/staging/media/deprecated/saa7146/av7110/av7110_hw.c                      | 1204 ---------------
 drivers/staging/media/deprecated/saa7146/av7110/av7110_hw.h                      |  496 -------
 drivers/staging/media/deprecated/saa7146/av7110/av7110_ipack.c                   |  404 -----
 drivers/staging/media/deprecated/saa7146/av7110/av7110_ipack.h                   |   13 -
 drivers/staging/media/deprecated/saa7146/av7110/av7110_ir.c                      |  158 --
 drivers/staging/media/deprecated/saa7146/av7110/av7110_v4l.c                     |  952 ------------
 drivers/staging/media/deprecated/saa7146/av7110/budget-patch.c                   |  665 ---------
 drivers/staging/media/deprecated/saa7146/av7110/dvb_filter.c                     |  115 --
 drivers/staging/media/deprecated/saa7146/av7110/dvb_filter.h                     |  242 ---
 drivers/staging/media/deprecated/saa7146/av7110/sp8870.c                         |  609 --------
 drivers/staging/media/deprecated/saa7146/av7110/sp8870.h                         |   37 -
 drivers/staging/media/deprecated/saa7146/av7110/video-clear-buffer.rst           |   54 -
 drivers/staging/media/deprecated/saa7146/av7110/video-command.rst                |   96 --
 drivers/staging/media/deprecated/saa7146/av7110/video-continue.rst               |   57 -
 drivers/staging/media/deprecated/saa7146/av7110/video-fast-forward.rst           |   72 -
 drivers/staging/media/deprecated/saa7146/av7110/video-fclose.rst                 |   51 -
 drivers/staging/media/deprecated/saa7146/av7110/video-fopen.rst                  |  111 --
 drivers/staging/media/deprecated/saa7146/av7110/video-freeze.rst                 |   61 -
 drivers/staging/media/deprecated/saa7146/av7110/video-fwrite.rst                 |   79 -
 drivers/staging/media/deprecated/saa7146/av7110/video-get-capabilities.rst       |   61 -
 drivers/staging/media/deprecated/saa7146/av7110/video-get-event.rst              |  105 --
 drivers/staging/media/deprecated/saa7146/av7110/video-get-frame-count.rst        |   65 -
 drivers/staging/media/deprecated/saa7146/av7110/video-get-pts.rst                |   69 -
 drivers/staging/media/deprecated/saa7146/av7110/video-get-size.rst               |   69 -
 drivers/staging/media/deprecated/saa7146/av7110/video-get-status.rst             |   72 -
 drivers/staging/media/deprecated/saa7146/av7110/video-play.rst                   |   57 -
 drivers/staging/media/deprecated/saa7146/av7110/video-select-source.rst          |   76 -
 drivers/staging/media/deprecated/saa7146/av7110/video-set-blank.rst              |   64 -
 drivers/staging/media/deprecated/saa7146/av7110/video-set-display-format.rst     |   60 -
 drivers/staging/media/deprecated/saa7146/av7110/video-set-format.rst             |   82 --
 drivers/staging/media/deprecated/saa7146/av7110/video-set-streamtype.rst         |   61 -
 drivers/staging/media/deprecated/saa7146/av7110/video-slowmotion.rst             |   72 -
 drivers/staging/media/deprecated/saa7146/av7110/video-stillpicture.rst           |   61 -
 drivers/staging/media/deprecated/saa7146/av7110/video-stop.rst                   |   74 -
 drivers/staging/media/deprecated/saa7146/av7110/video-try-command.rst            |   66 -
 drivers/staging/media/deprecated/saa7146/av7110/video.rst                        |   36 -
 drivers/staging/media/deprecated/saa7146/av7110/video_function_calls.rst         |   35 -
 drivers/staging/media/deprecated/saa7146/av7110/video_types.rst                  |  248 ----
 drivers/staging/media/deprecated/saa7146/common/Kconfig                          |   10 -
 drivers/staging/media/deprecated/saa7146/common/Makefile                         |    6 -
 drivers/staging/media/deprecated/saa7146/common/saa7146.h                        |  472 ------
 drivers/staging/media/deprecated/saa7146/common/saa7146_core.c                   |  578 --------
 drivers/staging/media/deprecated/saa7146/common/saa7146_fops.c                   |  658 ---------
 drivers/staging/media/deprecated/saa7146/common/saa7146_hlp.c                    | 1046 -------------
 drivers/staging/media/deprecated/saa7146/common/saa7146_i2c.c                    |  421 ------
 drivers/staging/media/deprecated/saa7146/common/saa7146_vbi.c                    |  498 -------
 drivers/staging/media/deprecated/saa7146/common/saa7146_video.c                  | 1286 ----------------
 drivers/staging/media/deprecated/saa7146/common/saa7146_vv.h                     |  266 ----
 drivers/staging/media/deprecated/saa7146/saa7146/Kconfig                         |   48 -
 drivers/staging/media/deprecated/saa7146/saa7146/Makefile                        |    6 -
 drivers/staging/media/deprecated/saa7146/saa7146/TODO                            |    7 -
 drivers/staging/media/deprecated/saa7146/saa7146/hexium_gemini.c                 |  425 ------
 drivers/staging/media/deprecated/saa7146/saa7146/hexium_orion.c                  |  496 -------
 drivers/staging/media/deprecated/saa7146/saa7146/mxb.c                           |  873 -----------
 drivers/staging/media/deprecated/saa7146/ttpci/Kconfig                           |   95 --
 drivers/staging/media/deprecated/saa7146/ttpci/Makefile                          |   13 -
 drivers/staging/media/deprecated/saa7146/ttpci/TODO                              |    7 -
 drivers/staging/media/deprecated/saa7146/ttpci/budget-av.c                       | 1622 ---------------------
 drivers/staging/media/deprecated/saa7146/ttpci/budget-ci.c                       | 1574 --------------------
 drivers/staging/media/deprecated/saa7146/ttpci/budget-core.c                     |  603 --------
 drivers/staging/media/deprecated/saa7146/ttpci/budget.c                          |  883 -----------
 drivers/staging/media/deprecated/saa7146/ttpci/budget.h                          |  129 --
 drivers/staging/media/deprecated/stkwebcam/Kconfig                               |   18 -
 drivers/staging/media/deprecated/stkwebcam/Makefile                              |    5 -
 drivers/staging/media/deprecated/stkwebcam/TODO                                  |   12 -
 drivers/staging/media/deprecated/stkwebcam/stk-sensor.c                          |  587 --------
 drivers/staging/media/deprecated/stkwebcam/stk-webcam.c                          | 1434 ------------------
 drivers/staging/media/deprecated/stkwebcam/stk-webcam.h                          |  123 --
 drivers/staging/media/deprecated/tm6000/Kconfig                                  |   37 -
 drivers/staging/media/deprecated/tm6000/Makefile                                 |   14 -
 drivers/staging/media/deprecated/tm6000/TODO                                     |    7 -
 drivers/staging/media/deprecated/tm6000/tm6000-alsa.c                            |  440 ------
 drivers/staging/media/deprecated/tm6000/tm6000-cards.c                           | 1397 ------------------
 drivers/staging/media/deprecated/tm6000/tm6000-core.c                            |  916 ------------
 drivers/staging/media/deprecated/tm6000/tm6000-dvb.c                             |  454 ------
 drivers/staging/media/deprecated/tm6000/tm6000-i2c.c                             |  317 ----
 drivers/staging/media/deprecated/tm6000/tm6000-input.c                           |  503 -------
 drivers/staging/media/deprecated/tm6000/tm6000-regs.h                            |  588 --------
 drivers/staging/media/deprecated/tm6000/tm6000-stds.c                            |  623 --------
 drivers/staging/media/deprecated/tm6000/tm6000-usb-isoc.h                        |   38 -
 drivers/staging/media/deprecated/tm6000/tm6000-video.c                           | 1703 ----------------------
 drivers/staging/media/deprecated/tm6000/tm6000.h                                 |  396 -----
 drivers/staging/media/deprecated/vpfe_capture/Kconfig                            |   58 -
 drivers/staging/media/deprecated/vpfe_capture/Makefile                           |    4 -
 drivers/staging/media/deprecated/vpfe_capture/TODO                               |    7 -
 drivers/staging/media/deprecated/vpfe_capture/ccdc_hw_device.h                   |   80 -
 drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.c                       |  934 ------------
 drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.h                       |  308 ----
 drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc_regs.h                  |  297 ----
 drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.c                      |  879 -----------
 drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.h                      |  171 ---
 drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc_regs.h                 |  140 --
 drivers/staging/media/deprecated/vpfe_capture/isif.c                             | 1127 --------------
 drivers/staging/media/deprecated/vpfe_capture/isif.h                             |  518 -------
 drivers/staging/media/deprecated/vpfe_capture/isif_regs.h                        |  256 ----
 drivers/staging/media/deprecated/vpfe_capture/vpfe_capture.c                     | 1902 ------------------------
 drivers/staging/media/deprecated/zr364xx/Kconfig                                 |   18 -
 drivers/staging/media/deprecated/zr364xx/Makefile                                |    3 -
 drivers/staging/media/deprecated/zr364xx/TODO                                    |    7 -
 drivers/staging/media/deprecated/zr364xx/zr364xx.c                               | 1635 ---------------------
 include/media/davinci/ccdc_types.h                                               |   30 -
 include/media/dvb_demux.h                                                        |   13 -
 include/media/dvbdev.h                                                           |   11 -
 include/uapi/linux/meye.h                                                        |   65 -
 include/uapi/linux/v4l2-controls.h                                               |    8 +-
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
