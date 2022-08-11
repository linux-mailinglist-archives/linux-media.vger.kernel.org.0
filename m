Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06CB058F9ED
	for <lists+linux-media@lfdr.de>; Thu, 11 Aug 2022 11:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234970AbiHKJSG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Aug 2022 05:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234987AbiHKJR6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Aug 2022 05:17:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B71793536
        for <linux-media@vger.kernel.org>; Thu, 11 Aug 2022 02:17:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A9ABDB81F99
        for <linux-media@vger.kernel.org>; Thu, 11 Aug 2022 09:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC8DC433C1;
        Thu, 11 Aug 2022 09:17:50 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/9] Deprecate old non-vb2 drivers
Date:   Thu, 11 Aug 2022 11:17:40 +0200
Message-Id: <20220811091749.3956641-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series deprecates the cpia2, meye, zr364xx, tm6000,
fsl-viu, dm644x_ccdc, dm355_cddc, dm365_isif, hexium_gemini/orion,
mxb and ttpci drivers.

The cpia2 and meye drivers do not use either vb2 or vb1, and the
other drivers use vb1 instead of vb2.

Note: the DVB ttpci driver (saa7146 based) can probably be kept
if someone would be willing to disentangle it from the saa7146
common code that's shared between DVB and V4L2 drivers. But it
is such old hardware that I am not sure it is worth the effort.

After this series the only remaining drivers in mainline that
still use vb1 are cx18 and bt8xx.

Regards,

	Hans

Hans Verkuil (9):
  staging/media: add a STAGING_MEDIA_DEPRECATED option
  cpia2: deprecate this driver
  meye: deprecate this driver
  zr364xx: deprecate this driver
  tm6000: deprecate this driver
  fsl-viu: deprecate this driver
  davinci: deprecate dm644x_ccdc, dm355_cddc and dm365_isif
  saa7146: deprecate hexium_gemini/orion, mxb and ttpci
  av7110: move to staging/media/deprecated/saa7146

 drivers/media/common/Kconfig                  |  1 -
 drivers/media/common/Makefile                 |  2 +-
 drivers/media/pci/Kconfig                     |  3 -
 drivers/media/pci/Makefile                    |  5 +-
 drivers/media/platform/nxp/Kconfig            | 12 ----
 drivers/media/platform/nxp/Makefile           |  1 -
 drivers/media/platform/ti/davinci/Kconfig     | 49 ----------------
 drivers/media/platform/ti/davinci/Makefile    |  4 --
 drivers/media/usb/Kconfig                     |  3 -
 drivers/media/usb/Makefile                    |  3 -
 drivers/staging/media/Kconfig                 | 27 +++++++--
 drivers/staging/media/Makefile                | 10 +++-
 drivers/staging/media/av7110/TODO             |  3 -
 .../media/deprecated}/cpia2/Kconfig           |  5 +-
 .../media/deprecated}/cpia2/Makefile          |  0
 drivers/staging/media/deprecated/cpia2/TODO   |  6 ++
 .../media/deprecated}/cpia2/cpia2.h           |  0
 .../media/deprecated}/cpia2/cpia2_core.c      |  0
 .../media/deprecated}/cpia2/cpia2_registers.h |  0
 .../media/deprecated}/cpia2/cpia2_usb.c       |  0
 .../media/deprecated}/cpia2/cpia2_v4l.c       |  0
 .../staging/media/deprecated/fsl-viu/Kconfig  | 17 ++++++
 .../staging/media/deprecated/fsl-viu/Makefile |  2 +
 drivers/staging/media/deprecated/fsl-viu/TODO |  8 +++
 .../media/deprecated/fsl-viu}/fsl-viu.c       |  0
 .../media/deprecated}/meye/Kconfig            |  5 +-
 .../media/deprecated}/meye/Makefile           |  0
 drivers/staging/media/deprecated/meye/TODO    |  6 ++
 .../media/deprecated}/meye/meye.c             |  0
 .../media/deprecated}/meye/meye.h             |  0
 .../staging/media/deprecated/saa7146/Kconfig  |  5 ++
 .../staging/media/deprecated/saa7146/Makefile |  2 +
 .../{ => deprecated/saa7146}/av7110/Kconfig   | 20 +++++--
 .../{ => deprecated/saa7146}/av7110/Makefile  |  3 +-
 .../media/deprecated/saa7146/av7110/TODO      |  9 +++
 .../av7110/audio-bilingual-channel-select.rst |  0
 .../saa7146}/av7110/audio-channel-select.rst  |  0
 .../saa7146}/av7110/audio-clear-buffer.rst    |  0
 .../saa7146}/av7110/audio-continue.rst        |  0
 .../saa7146}/av7110/audio-fclose.rst          |  0
 .../saa7146}/av7110/audio-fopen.rst           |  0
 .../saa7146}/av7110/audio-fwrite.rst          |  0
 .../av7110/audio-get-capabilities.rst         |  0
 .../saa7146}/av7110/audio-get-status.rst      |  0
 .../saa7146}/av7110/audio-pause.rst           |  0
 .../saa7146}/av7110/audio-play.rst            |  0
 .../saa7146}/av7110/audio-select-source.rst   |  0
 .../saa7146}/av7110/audio-set-av-sync.rst     |  0
 .../saa7146}/av7110/audio-set-bypass-mode.rst |  0
 .../saa7146}/av7110/audio-set-id.rst          |  0
 .../saa7146}/av7110/audio-set-mixer.rst       |  0
 .../saa7146}/av7110/audio-set-mute.rst        |  0
 .../saa7146}/av7110/audio-set-streamtype.rst  |  0
 .../saa7146}/av7110/audio-stop.rst            |  0
 .../{ => deprecated/saa7146}/av7110/audio.rst |  0
 .../saa7146}/av7110/audio_data_types.rst      |  0
 .../saa7146}/av7110/audio_function_calls.rst  |  0
 .../{ => deprecated/saa7146}/av7110/av7110.c  |  0
 .../{ => deprecated/saa7146}/av7110/av7110.h  |  2 +-
 .../saa7146}/av7110/av7110_av.c               |  0
 .../saa7146}/av7110/av7110_av.h               |  0
 .../saa7146}/av7110/av7110_ca.c               |  0
 .../saa7146}/av7110/av7110_ca.h               |  0
 .../saa7146}/av7110/av7110_hw.c               |  0
 .../saa7146}/av7110/av7110_hw.h               |  0
 .../saa7146}/av7110/av7110_ipack.c            |  0
 .../saa7146}/av7110/av7110_ipack.h            |  0
 .../saa7146}/av7110/av7110_ir.c               |  0
 .../saa7146}/av7110/av7110_v4l.c              |  0
 .../saa7146}/av7110/budget-patch.c            |  0
 .../saa7146}/av7110/dvb_filter.c              |  0
 .../saa7146}/av7110/dvb_filter.h              |  0
 .../{ => deprecated/saa7146}/av7110/sp8870.c  |  0
 .../{ => deprecated/saa7146}/av7110/sp8870.h  |  0
 .../saa7146}/av7110/video-clear-buffer.rst    |  0
 .../saa7146}/av7110/video-command.rst         |  0
 .../saa7146}/av7110/video-continue.rst        |  0
 .../saa7146}/av7110/video-fast-forward.rst    |  0
 .../saa7146}/av7110/video-fclose.rst          |  0
 .../saa7146}/av7110/video-fopen.rst           |  0
 .../saa7146}/av7110/video-freeze.rst          |  0
 .../saa7146}/av7110/video-fwrite.rst          |  0
 .../av7110/video-get-capabilities.rst         |  0
 .../saa7146}/av7110/video-get-event.rst       |  0
 .../saa7146}/av7110/video-get-frame-count.rst |  0
 .../saa7146}/av7110/video-get-pts.rst         |  0
 .../saa7146}/av7110/video-get-size.rst        |  0
 .../saa7146}/av7110/video-get-status.rst      |  0
 .../saa7146}/av7110/video-play.rst            |  0
 .../saa7146}/av7110/video-select-source.rst   |  0
 .../saa7146}/av7110/video-set-blank.rst       |  0
 .../av7110/video-set-display-format.rst       |  0
 .../saa7146}/av7110/video-set-format.rst      |  0
 .../saa7146}/av7110/video-set-streamtype.rst  |  0
 .../saa7146}/av7110/video-slowmotion.rst      |  0
 .../saa7146}/av7110/video-stillpicture.rst    |  0
 .../saa7146}/av7110/video-stop.rst            |  0
 .../saa7146}/av7110/video-try-command.rst     |  0
 .../{ => deprecated/saa7146}/av7110/video.rst |  0
 .../saa7146}/av7110/video_function_calls.rst  |  0
 .../saa7146}/av7110/video_types.rst           |  0
 .../media/deprecated/saa7146/common}/Kconfig  |  0
 .../media/deprecated/saa7146/common}/Makefile |  0
 .../deprecated/saa7146/common}/saa7146.h      |  0
 .../deprecated/saa7146/common}/saa7146_core.c |  2 +-
 .../deprecated/saa7146/common}/saa7146_fops.c |  2 +-
 .../deprecated/saa7146/common}/saa7146_hlp.c  |  2 +-
 .../deprecated/saa7146/common}/saa7146_i2c.c  |  2 +-
 .../deprecated/saa7146/common}/saa7146_vbi.c  |  2 +-
 .../saa7146/common}/saa7146_video.c           |  2 +-
 .../deprecated/saa7146/common}/saa7146_vv.h   |  2 +-
 .../media/deprecated/saa7146}/saa7146/Kconfig | 15 ++++-
 .../deprecated/saa7146}/saa7146/Makefile      |  0
 .../media/deprecated/saa7146/saa7146/TODO     |  7 +++
 .../saa7146}/saa7146/hexium_gemini.c          |  2 +-
 .../saa7146}/saa7146/hexium_orion.c           |  2 +-
 .../media/deprecated/saa7146}/saa7146/mxb.c   |  2 +-
 .../media/deprecated/saa7146}/ttpci/Kconfig   | 17 ++++--
 .../media/deprecated/saa7146}/ttpci/Makefile  |  0
 .../media/deprecated/saa7146/ttpci/TODO       |  7 +++
 .../deprecated/saa7146}/ttpci/budget-av.c     |  2 +-
 .../deprecated/saa7146}/ttpci/budget-ci.c     |  0
 .../deprecated/saa7146}/ttpci/budget-core.c   |  0
 .../media/deprecated/saa7146}/ttpci/budget.c  |  0
 .../media/deprecated/saa7146}/ttpci/budget.h  |  2 +-
 .../media/{ => deprecated}/stkwebcam/Kconfig  |  0
 .../media/{ => deprecated}/stkwebcam/Makefile |  0
 .../media/{ => deprecated}/stkwebcam/TODO     |  0
 .../{ => deprecated}/stkwebcam/stk-sensor.c   |  0
 .../{ => deprecated}/stkwebcam/stk-webcam.c   |  0
 .../{ => deprecated}/stkwebcam/stk-webcam.h   |  0
 .../media/deprecated}/tm6000/Kconfig          |  5 +-
 .../media/deprecated}/tm6000/Makefile         |  0
 drivers/staging/media/deprecated/tm6000/TODO  |  8 +++
 .../media/deprecated}/tm6000/tm6000-alsa.c    |  0
 .../media/deprecated}/tm6000/tm6000-cards.c   |  0
 .../media/deprecated}/tm6000/tm6000-core.c    |  0
 .../media/deprecated}/tm6000/tm6000-dvb.c     |  0
 .../media/deprecated}/tm6000/tm6000-i2c.c     |  0
 .../media/deprecated}/tm6000/tm6000-input.c   |  0
 .../media/deprecated}/tm6000/tm6000-regs.h    |  0
 .../media/deprecated}/tm6000/tm6000-stds.c    |  0
 .../deprecated}/tm6000/tm6000-usb-isoc.h      |  0
 .../media/deprecated}/tm6000/tm6000-video.c   |  0
 .../media/deprecated}/tm6000/tm6000.h         |  0
 .../media/deprecated/vpfe_capture/Kconfig     | 58 +++++++++++++++++++
 .../media/deprecated/vpfe_capture/Makefile    |  4 ++
 .../media/deprecated/vpfe_capture/TODO        |  8 +++
 .../deprecated/vpfe_capture}/ccdc_hw_device.h |  0
 .../deprecated/vpfe_capture}/dm355_ccdc.c     |  2 +-
 .../deprecated/vpfe_capture}/dm355_ccdc.h     |  0
 .../vpfe_capture}/dm355_ccdc_regs.h           |  0
 .../deprecated/vpfe_capture}/dm644x_ccdc.c    |  2 +-
 .../deprecated/vpfe_capture}/dm644x_ccdc.h    |  0
 .../vpfe_capture}/dm644x_ccdc_regs.h          |  0
 .../media/deprecated/vpfe_capture}/isif.c     |  2 +-
 .../media/deprecated/vpfe_capture}/isif.h     |  0
 .../deprecated/vpfe_capture}/isif_regs.h      |  0
 .../deprecated/vpfe_capture}/vpfe_capture.c   |  0
 .../media/deprecated}/zr364xx/Kconfig         |  7 ++-
 .../media/deprecated}/zr364xx/Makefile        |  0
 drivers/staging/media/deprecated/zr364xx/TODO |  8 +++
 .../media/deprecated}/zr364xx/zr364xx.c       |  0
 163 files changed, 264 insertions(+), 123 deletions(-)
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

-- 
2.35.1

