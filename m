Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C97266C354
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 16:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231852AbjAPPJt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 10:09:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233192AbjAPPJL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 10:09:11 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 887CC1D900
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:56:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id ECB75B80FD3
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 14:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61757C433EF
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 14:56:52 +0000 (UTC)
Message-ID: <ccb23c4f-2a1a-0b26-0865-14cb1e4f6323@xs4all.nl>
Date:   Mon, 16 Jan 2023 15:56:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.3] (v2) media: delete deprecated drivers
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

The saa7146 driver is not deleted: it turns out that the DVB part is still
in use.

The best approach is probably to drop analog video support from this driver,
but keep the digital video part, and move what remains back to mainline.

That will be a separate series, though.

Regards,

	Hans

Changes since v1: drop the last 9 patches that remove saa7146 from the PR.

The following changes since commit 6599e683db1bf22fee74302c47e31b9a42a1c3d2:

  Merge tag 'v6.2-rc1' into media_tree (2022-12-28 16:07:44 +0000)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.3b

for you to fetch changes up to 67dcebbac5b509af8734921c247a13104368735e:

  tm6000: remove deprecated driver (2023-01-14 11:27:06 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (7):
      meye: remove this deprecated driver
      cpia2: remove deprecated driver
      fsl-viu: remove deprecated driver
      stkwebcam: remove deprecated driver
      zr364xx: remove deprecated driver
      vpfe_capture: remove deprecated davinci drivers
      tm6000: remove deprecated driver

 Documentation/admin-guide/media/cpia2.rst                        |  145 ----
 Documentation/admin-guide/media/dvb-drivers.rst                  |    1 -
 Documentation/admin-guide/media/meye.rst                         |   93 --
 Documentation/admin-guide/media/other-usb-cardlist.rst           |   14 -
 Documentation/admin-guide/media/pci-cardlist.rst                 |    1 -
 Documentation/admin-guide/media/platform-cardlist.rst            |    1 -
 Documentation/admin-guide/media/tm6000-cardlist.rst              |   83 --
 Documentation/admin-guide/media/usb-cardlist.rst                 |    7 -
 Documentation/admin-guide/media/v4l-drivers.rst                  |    2 -
 Documentation/admin-guide/media/zr364xx.rst                      |  102 ---
 Documentation/driver-api/media/drivers/cpia2_devel.rst           |   56 --
 Documentation/driver-api/media/drivers/index.rst                 |    1 -
 Documentation/userspace-api/media/drivers/index.rst              |    1 -
 Documentation/userspace-api/media/drivers/meye-uapi.rst          |   53 --
 MAINTAINERS                                                      |   27 -
 drivers/staging/media/Kconfig                                    |    7 -
 drivers/staging/media/Makefile                                   |    7 -
 drivers/staging/media/deprecated/cpia2/Kconfig                   |   13 -
 drivers/staging/media/deprecated/cpia2/Makefile                  |    4 -
 drivers/staging/media/deprecated/cpia2/TODO                      |    6 -
 drivers/staging/media/deprecated/cpia2/cpia2.h                   |  475 -----------
 drivers/staging/media/deprecated/cpia2/cpia2_core.c              | 2434 -----------------------------------------------------
 drivers/staging/media/deprecated/cpia2/cpia2_registers.h         |  463 ----------
 drivers/staging/media/deprecated/cpia2/cpia2_usb.c               |  966 ---------------------
 drivers/staging/media/deprecated/cpia2/cpia2_v4l.c               | 1226 ---------------------------
 drivers/staging/media/deprecated/fsl-viu/Kconfig                 |   15 -
 drivers/staging/media/deprecated/fsl-viu/Makefile                |    2 -
 drivers/staging/media/deprecated/fsl-viu/TODO                    |    7 -
 drivers/staging/media/deprecated/fsl-viu/fsl-viu.c               | 1599 -----------------------------------
 drivers/staging/media/deprecated/meye/Kconfig                    |   19 -
 drivers/staging/media/deprecated/meye/Makefile                   |    2 -
 drivers/staging/media/deprecated/meye/TODO                       |    6 -
 drivers/staging/media/deprecated/meye/meye.c                     | 1814 ---------------------------------------
 drivers/staging/media/deprecated/meye/meye.h                     |  311 -------
 drivers/staging/media/deprecated/stkwebcam/Kconfig               |   18 -
 drivers/staging/media/deprecated/stkwebcam/Makefile              |    5 -
 drivers/staging/media/deprecated/stkwebcam/TODO                  |   12 -
 drivers/staging/media/deprecated/stkwebcam/stk-sensor.c          |  587 -------------
 drivers/staging/media/deprecated/stkwebcam/stk-webcam.c          | 1434 -------------------------------
 drivers/staging/media/deprecated/stkwebcam/stk-webcam.h          |  123 ---
 drivers/staging/media/deprecated/tm6000/Kconfig                  |   37 -
 drivers/staging/media/deprecated/tm6000/Makefile                 |   14 -
 drivers/staging/media/deprecated/tm6000/TODO                     |    7 -
 drivers/staging/media/deprecated/tm6000/tm6000-alsa.c            |  440 ----------
 drivers/staging/media/deprecated/tm6000/tm6000-cards.c           | 1397 ------------------------------
 drivers/staging/media/deprecated/tm6000/tm6000-core.c            |  916 --------------------
 drivers/staging/media/deprecated/tm6000/tm6000-dvb.c             |  454 ----------
 drivers/staging/media/deprecated/tm6000/tm6000-i2c.c             |  317 -------
 drivers/staging/media/deprecated/tm6000/tm6000-input.c           |  503 -----------
 drivers/staging/media/deprecated/tm6000/tm6000-regs.h            |  588 -------------
 drivers/staging/media/deprecated/tm6000/tm6000-stds.c            |  623 --------------
 drivers/staging/media/deprecated/tm6000/tm6000-usb-isoc.h        |   38 -
 drivers/staging/media/deprecated/tm6000/tm6000-video.c           | 1703 -------------------------------------
 drivers/staging/media/deprecated/tm6000/tm6000.h                 |  396 ---------
 drivers/staging/media/deprecated/vpfe_capture/Kconfig            |   58 --
 drivers/staging/media/deprecated/vpfe_capture/Makefile           |    4 -
 drivers/staging/media/deprecated/vpfe_capture/TODO               |    7 -
 drivers/staging/media/deprecated/vpfe_capture/ccdc_hw_device.h   |   80 --
 drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.c       |  934 --------------------
 drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.h       |  308 -------
 drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc_regs.h  |  297 -------
 drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.c      |  879 -------------------
 drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.h      |  171 ----
 drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc_regs.h |  140 ---
 drivers/staging/media/deprecated/vpfe_capture/isif.c             | 1127 -------------------------
 drivers/staging/media/deprecated/vpfe_capture/isif.h             |  518 ------------
 drivers/staging/media/deprecated/vpfe_capture/isif_regs.h        |  256 ------
 drivers/staging/media/deprecated/vpfe_capture/vpfe_capture.c     | 1902 -----------------------------------------
 drivers/staging/media/deprecated/zr364xx/Kconfig                 |   18 -
 drivers/staging/media/deprecated/zr364xx/Makefile                |    3 -
 drivers/staging/media/deprecated/zr364xx/TODO                    |    7 -
 drivers/staging/media/deprecated/zr364xx/zr364xx.c               | 1635 -----------------------------------
 include/media/davinci/ccdc_types.h                               |   30 -
 include/uapi/linux/meye.h                                        |   65 --
 include/uapi/linux/v4l2-controls.h                               |    8 +-
 75 files changed, 6 insertions(+), 28016 deletions(-)
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
