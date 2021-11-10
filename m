Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE9944BE3E
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 11:04:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbhKJKHp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 05:07:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhKJKHo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 05:07:44 -0500
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54B6C061764
        for <linux-media@vger.kernel.org>; Wed, 10 Nov 2021 02:04:56 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id kkTKm8sDwnkS9kkTOmsxyZ; Wed, 10 Nov 2021 11:04:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1636538694; bh=la2Gwel//Z2unp1HtlU2gFK4lWWhOo/UgF/Ley4fPzE=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=uzsD3wkJL4fOq/Lq254zY5b1ja2p8KmQ4ZmwfrE1XQRsMkA/gVsTuSczFb/kC97zv
         K+fGKlKuA0P0EdszFf+PX0dxbjw3ahp8nQsWMKp1EgmpDBmMGw2DLzk2iUVh2mxbEX
         w4fjgft4EQ6WPpe0WdoeyDHBPRpS+MCi+yWGqXDU4riWjyM9Wzg+E/TNoIomTh5F/8
         KVElqTX4Gk72ZTgml+1HpfcILo+TjsGF8Dmm1nFHrP65SeU1Sg2OWnMtjl1u+g46l2
         wZHXy8ZCRNmTFqxG16/DW45+jROCjb0pFrpM4TbFiP3tNfgWMH2bzog6hJEWMeqR8i
         rDVLOKyWcyleA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.17] Various fixes/enhancements
Message-ID: <734bd659-3f59-63a1-dbf8-28e50ff733e4@xs4all.nl>
Date:   Wed, 10 Nov 2021 11:04:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfLMfOHiLuVlIIJgtXk0alyMMLurwPL04vJ3XRnWB47/rtJN32Khf0sbSVOkGI/xcJpsLpQj9Wm3RL+zbQOJDzoyneLulA3OQjEFzvlUklUK4slxDefOH
 1N5Lw5ydSTq/Dni+0sx9bPI/AvQbZhrYegHb1ogbjqEhyiqCftLfc3P2phZf5+Ti3ddsN1y+0CJ8bvcOQRub2jfEDoq1D76C98E=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 3951ae98f0ba1003464e60adf41100e70dddbcde:

  media: atomisp: only initialize mode if pipe is not null (2021-11-08 09:52:55 +0000)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.17a

for you to fetch changes up to 9c3ef010e02034f6d9a975c3b63413ff2bda9b29:

  media: mtk-vcodec: Remove redundant 'flush_workqueue()' calls (2021-11-10 10:15:54 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Cai Huoqing (1):
      media: gspca: Make use of the helper macro kthread_run()

Christophe JAILLET (4):
      media: tw5864: Simplify 'tw5864_finidev()'
      media: s5p-mfc: Use 'bitmap_zalloc()' when applicable
      media: mtk-vpu: Remove redundant 'flush_workqueue()' calls
      media: mtk-vcodec: Remove redundant 'flush_workqueue()' calls

Dillon Min (2):
      media: stm32-dma2d: fix compile errors when W=1
      media: stm32-dma2d: fix compile-testing failed

Dongliang Mu (1):
      media: em28xx: fix memory leak in em28xx_init_dev

Hans Verkuil (3):
      cec-ioc-receive.rst: clarify sequence and status fields
      v4l2-ioctl.c: readbuffers depends on V4L2_CAP_READWRITE
      media: drivers/index.rst: add missing rkisp1 entry

Jammy Huang (2):
      media: aspeed: fix mode-detect always time out at 2nd run
      media: aspeed: Update signal status immediately to ensure sane hw state

Kieran Bingham (1):
      media: tw5864: Disable PCI device when finished

Kwang Son (1):
      media: docs: Fix newline typo

Niklas Söderlund (1):
      dt-bindings: adv748x: Convert bindings to json-schema

Randy Dunlap (1):
      media: correct MEDIA_TEST_SUPPORT help text

Tzung-Bi Shih (1):
      media: mtk-vcodec: vdec: remove redundant 'pfb' assignment

Yunfei Dong (1):
      media: mtk-vcodec: Align width and height to 64 bytes

 Documentation/devicetree/bindings/media/i2c/adv748x.txt      | 116 ---------------------
 Documentation/devicetree/bindings/media/i2c/adv748x.yaml     | 212 ++++++++++++++++++++++++++++++++++++++
 Documentation/driver-api/media/drivers/index.rst             |   1 +
 Documentation/userspace-api/media/cec/cec-ioc-receive.rst    |  49 ++++-----
 Documentation/userspace-api/media/v4l/capture.c.rst          |  52 +++++-----
 Documentation/userspace-api/media/v4l/v4l2grab.c.rst         |   8 +-
 MAINTAINERS                                                  |   1 +
 drivers/media/Kconfig                                        |   8 +-
 drivers/media/pci/tw5864/tw5864-core.c                       |   5 +-
 drivers/media/platform/Kconfig                               |   3 +-
 drivers/media/platform/aspeed-video.c                        |  14 +--
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h           |   1 +
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c       |   1 -
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c |   1 -
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c       |   1 -
 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c    |   4 +-
 drivers/media/platform/mtk-vpu/mtk_vpu.c                     |   4 +-
 drivers/media/platform/s5p-mfc/s5p_mfc.c                     |   9 +-
 drivers/media/platform/stm32/dma2d/dma2d-hw.c                |  10 --
 drivers/media/usb/em28xx/em28xx-cards.c                      |  18 ++--
 drivers/media/usb/gspca/m5602/m5602_s5k83a.c                 |   5 +-
 drivers/media/v4l2-core/v4l2-ioctl.c                         |   4 +-
 22 files changed, 309 insertions(+), 218 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/adv748x.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/adv748x.yaml
