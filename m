Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99F8232C746
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:10:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353181AbhCDAbY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:31:24 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:33017 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243802AbhCCO4i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Mar 2021 09:56:38 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id HStXlanbUqY4WHStalTVz5; Wed, 03 Mar 2021 15:54:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1614783278; bh=h8FTZVsg3tijCGkW+2bE/nPBB/8ibThbdxg4yhiWfls=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rIGL/yaMYuoofNT9PqYg++CO5pTwhdHUzACZQM0yaJDl2Jlzf2xtJIOs6dBT/9q1+
         Dz/GIhcR6GXdzrw8uTSVBNTMKxJzdU3kb8h/OaxqTsImYs1UGo39fcYpyayO/00S7Q
         9mx+taq5Zm9hN6YOqBj/t0KKR6yFla8i71CmaB7m/F1DJe+VpBNitGFJmA0BLRU3l0
         e+d+uhQsWJMnqZ2Uvk8FI9D70jkxYmuBBi1SHXPiBF4AV0F+u/UPESrH81lrZkGpE5
         vaCIroE1kN0PcntZt/0UvEncIMQt3Ak3u6mCmnn0/FpMQxfjbnFxiiuuw7Z0jahkmM
         keJ2Px7KnomXg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.13] Various fixes
Message-ID: <40c1ab80-c9c5-f784-ba54-457c6f21b3c2@xs4all.nl>
Date:   Wed, 3 Mar 2021 15:54:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDCTlyLXUcKjKR7isXjtkYoN32PzyqLnwUXigyLiR1EeHaS4SsRmY+TTjTxWM7CFavE9oyWMM5jXRhOahJAT+IGJOOOKzQJmXGYdpS+04QB6Z06UtZf8
 LrApKqC3PqarZcxD4YG0s9Llj8EL1jGMEzYh0Wfg/+nt0MYezTpH/B8oU2jcn4mzCPrzP1DOheVyZqNznJVQ34eKZLbZCliayYg=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:

  Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.13a

for you to fetch changes up to 7cfa5cec56956f488b1116fac53aab65df34e129:

  media: cec-notifier: also search for HDMI devices on I2C (2021-03-03 15:37:38 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Andrey Konovalov (2):
      v4l: common: v4l2_get_link_freq: add printing a warning
      media: camss: use v4l2_get_link_freq() to calculate the relevant clocks

Andrzej Pietrasiewicz (1):
      media: uapi: Correct doc comment in H264 uAPI

Arnd Bergmann (1):
      media: mtk: fix mtk-smi dependency

Bhaskar Chowdhury (4):
      include: media: davinci: Fixed up few trivial spellings in the file isif.h
      drivers/media/pci/cx18: Fix a spelling minimze to minimize in the file cx18-firmware.c
      drivers: media: pci: cx18: Couple of spell fixes in the file cx18-av-core.c
      drivers: media: pci: cx18: Spelling fix of minimze to minimize in the file cx18-av-audio.c

Colin Ian King (1):
      media: platform: sti: make a const arrays static, makes object smaller

Dafna Hirschfeld (1):
      media: rkisp1: params: remove extra 'if' conditions

Johan Fjeldtvedt (1):
      media: cec-notifier: also search for HDMI devices on I2C

Julia Lawall (1):
      media: use getter/setter functions

Julian Braha (1):
      drivers: media: pci: sta2x11: fix Kconfig dependency on GPIOLIB

Nicolas Dufresne (1):
      doc: h264/hevc: Clarify _START_CODE_NONE meaning

Pavel Skripkin (1):
      drivers/media/usb: fix memory leak in zr364xx_probe

Rikard Falkeborn (1):
      media: usbtv: constify static structs

Vladimir Lypak (1):
      media: qcom: camss: Fix overflows in clock rate calculations

Yang Li (1):
      media: solo6x10: Switch to using the new API kobj_to_dev()

dingsenjie (2):
      media/usb:Remove superfluous "breaks"
      media/usb:Remove superfluous "breaks" in the ttusb_dec.c

zuoqilin (1):
      media/i2c: remove unneeded variable: "ret"

 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst |   4 +-
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst           |   4 +-
 drivers/media/cec/core/cec-notifier.c                               |  33 ++-
 drivers/media/i2c/max2175.c                                         |   3 +-
 drivers/media/pci/cx18/cx18-av-audio.c                              |   2 +-
 drivers/media/pci/cx18/cx18-av-core.c                               |   4 +-
 drivers/media/pci/cx18/cx18-firmware.c                              |   2 +-
 drivers/media/pci/ivtv/ivtv-driver.c                                |   2 +-
 drivers/media/pci/solo6x10/solo6x10-core.c                          |   2 +-
 drivers/media/pci/sta2x11/Kconfig                                   |   1 +
 drivers/media/platform/Kconfig                                      |   3 +
 drivers/media/platform/fsl-viu.c                                    |   6 +-
 drivers/media/platform/pxa_camera.c                                 |   4 +-
 drivers/media/platform/qcom/camss/camss-csid.c                      |  20 +-
 drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c            |  22 +-
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c            |  22 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c                    |  36 ++-
 drivers/media/platform/qcom/camss/camss-csiphy.h                    |   2 +-
 drivers/media/platform/qcom/camss/camss-vfe.c                       |   4 +-
 drivers/media/platform/qcom/camss/camss.c                           |  25 +-
 drivers/media/platform/qcom/camss/camss.h                           |   4 +-
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c              | 445 ++++++++++++++------------------
 drivers/media/platform/sti/hva/hva-h264.c                           |  10 +-
 drivers/media/radio/radio-maxiradio.c                               |   2 +-
 drivers/media/spi/cxd2880-spi.c                                     |   4 +-
 drivers/media/usb/pwc/pwc-if.c                                      |   8 -
 drivers/media/usb/ttusb-dec/ttusb_dec.c                             |   4 -
 drivers/media/usb/usbtv/usbtv-video.c                               |   6 +-
 drivers/media/usb/zr364xx/zr364xx.c                                 |  13 +-
 drivers/media/v4l2-core/v4l2-common.c                               |   5 +
 include/media/davinci/isif.h                                        |   8 +-
 include/uapi/linux/v4l2-controls.h                                  |   2 +-
 32 files changed, 342 insertions(+), 370 deletions(-)
