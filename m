Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA31A3FD8DC
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 13:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243753AbhIALi3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 07:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243737AbhIALi2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 07:38:28 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18CFBC061575
        for <linux-media@vger.kernel.org>; Wed,  1 Sep 2021 04:37:31 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id LOYbmJoGs0e6wLOYcmQHGl; Wed, 01 Sep 2021 13:37:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630496250; bh=BMJwXxcYkRJkpKaGwc2kbHAlTfuJLXlXscdxpZtp1UE=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=DuQdFB6BBHUaWbQht90QBzQl3DC27/S89dvlvqvOhxRH+VDcU/+KktD4WXpBm+uuK
         4CNQ8B4AW3qEeZsqp7u3RnAusEKoZX0/HOxTwJjGrMJJ9mmdeIKPnJ9mDWdx8PBWCT
         AGTWbTNB+mp52JFwXmLb+xxY+Kl+E/J1vxjgoG8wtVi3qoRHkeXgub+8tIR1qHOFCD
         I/34Ez/f5Zs6WiSBJZMg1j6wmM2oQszekSoL7dPACGZoBsz56poiVP8dzK9+ocw+vR
         Ng9s/oWCB4J9aFqnTMlokTSoxtMig6qahJVnIokAM5IGKM4iwJSBEHZ97YNRCCMHTo
         Qe1s38l3Gwa5A==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.16] Various fixes
Message-ID: <7151eb26-7cea-aff8-24e5-587266b700c0@xs4all.nl>
Date:   Wed, 1 Sep 2021 13:37:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfB3agM7kdNC70GFOIOydBVz60zyr8l8zJqrhczHB9IXa6kW5ljfsI8QkgJMiNbYfGiFmYoOEcUQ3tJuP+nD2atNnUxos1SfDpr5l70xUk6LA+LZWeMn8
 9S2bS+THRt3PzFWeLnLZ1k27yHUKo6MVHKyxDIuAf2UyWcS8AU+a7M5Ymm1Bnvnqx7fp7R98c8ewGa4u2p0jt/RUwCFw5D9+RLl4IZKwVBStHTGIyJUHFC/4
 DSSg4/tdx4XRzD3Vn1+xECc3MFf+89FsOFP9bSg7tUh5Hna+AtSuQQDJta/MPVmM
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit d62cd4d277cc711f781a7bdec4109c6148529b25:

  media: uvcvideo: Remove unused including <linux/version.h> (2021-08-21 09:11:04 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.16c

for you to fetch changes up to 1ff8a1958e10f52762323ab98ad84bd417c4bd24:

  gspca: Limit frame size to sizeimage. (2021-09-01 13:29:39 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Cai Huoqing (3):
      media: smsusb: Use usb_get_dev() for the reference count of udev
      media: videobuf2: Convert to SPDX identifier
      media: vim2m: Remove repeated verbose license text

Chad Fraleigh (1):
      gspca: Limit frame size to sizeimage.

Christophe JAILLET (4):
      media: mtk-vpu: Fix a resource leak in the error handling path of 'mtk_vpu_probe()'
      media: imx-jpeg: Fix the error handling path of 'mxc_jpeg_probe()'
      media: pci/ivtv: switch from 'pci_' to 'dma_' API
      media: switch from 'pci_' to 'dma_' API

Dafna Hirschfeld (1):
      media: mtk-vcodec: venc: fix return value when start_streaming fails

Dan Carpenter (1):
      media: firewire: firedtv-avc: fix a buffer overflow in avc_ca_pmt()

Deborah Brouwer (1):
      media: vivid: add signal-free time for cec message xfer

Evgeny Novikov (1):
      media: vidtv: Fix memory leak in remove

Ezequiel Garcia (1):
      media: Request API is no longer experimental

Fabio Estevam (2):
      media: imx7.rst: Provide an example for imx6ull-evk capture
      media: imx: TODO: Remove items that are already supported

Hans Verkuil (1):
      cec-pin: fix off-by-one SFT check

Liu Shixin (1):
      media: pvrusb2: Replaced simple_strtol() with kstrtoint()

Nadezda Lutovinova (1):
      media: s5p-mfc: Add checking to s5p_mfc_probe().

Nil Yi (1):
      media: usb: airspy: clean the freed pointer and counter

Tom Rix (2):
      media: TDA1997x: handle short reads of hdmi info frame.
      media: camss: vfe: simplify vfe_get_wm_sizes()

Tuo Li (1):
      media: s5p-mfc: fix possible null-pointer dereference in s5p_mfc_probe()

Zev Weiss (1):
      media: aspeed-video: ignore interrupts that aren't enabled

lijian (1):
      media: via-camera: deleted these redundant semicolons

 Documentation/admin-guide/media/imx7.rst              |  60 +++++++++
 drivers/media/cec/core/cec-pin.c                      |   4 +-
 drivers/media/common/videobuf2/videobuf2-core.c       |   5 +-
 drivers/media/common/videobuf2/videobuf2-dma-contig.c |   5 +-
 drivers/media/common/videobuf2/videobuf2-dma-sg.c     |   5 +-
 drivers/media/common/videobuf2/videobuf2-memops.c     |   5 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c       |   5 +-
 drivers/media/common/videobuf2/videobuf2-vmalloc.c    |   5 +-
 drivers/media/firewire/firedtv-avc.c                  |  14 +-
 drivers/media/firewire/firedtv-ci.c                   |   2 +
 drivers/media/i2c/tda1997x.c                          |   8 +-
 drivers/media/mc/Kconfig                              |   8 --
 drivers/media/pci/cobalt/cobalt-driver.c              |   4 +-
 drivers/media/pci/cx18/cx18-driver.c                  |   2 +-
 drivers/media/pci/cx18/cx18-queue.c                   |  13 +-
 drivers/media/pci/cx18/cx18-streams.c                 |  16 +--
 drivers/media/pci/ddbridge/ddbridge-main.c            |   4 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c         |   2 +-
 drivers/media/pci/ivtv/ivtv-driver.c                  |   2 +-
 drivers/media/pci/ivtv/ivtv-queue.c                   |  18 +--
 drivers/media/pci/ivtv/ivtv-streams.c                 |  22 ++--
 drivers/media/pci/ivtv/ivtv-udma.c                    |  19 ++-
 drivers/media/pci/ivtv/ivtv-yuv.c                     |  10 +-
 drivers/media/pci/netup_unidvb/netup_unidvb_core.c    |   2 +-
 drivers/media/pci/pluto2/pluto2.c                     |  20 +--
 drivers/media/pci/pt1/pt1.c                           |   2 +-
 drivers/media/pci/tw5864/tw5864-core.c                |   2 +-
 drivers/media/platform/aspeed-video.c                 |  16 +--
 drivers/media/platform/imx-jpeg/mxc-jpeg.c            |   2 +
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c    |   8 +-
 drivers/media/platform/mtk-vpu/mtk_vpu.c              |   5 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c     |  20 +--
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c     |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-8.c     |   9 +-
 drivers/media/platform/s5p-mfc/s5p_mfc.c              |   6 +-
 drivers/media/platform/via-camera.c                   |   6 +-
 drivers/media/test-drivers/vidtv/vidtv_bridge.c       |   1 +
 drivers/media/test-drivers/vim2m.c                    |   5 -
 drivers/media/test-drivers/vivid/vivid-cec.c          | 341 +++++++++++++++++++++++++++----------------------
 drivers/media/test-drivers/vivid/vivid-cec.h          |   9 +-
 drivers/media/test-drivers/vivid/vivid-core.c         |  38 +++---
 drivers/media/test-drivers/vivid/vivid-core.h         |  23 ++--
 drivers/media/usb/airspy/airspy.c                     |   5 +-
 drivers/media/usb/gspca/gspca.c                       |   2 +
 drivers/media/usb/pvrusb2/pvrusb2-ctrl.c              |  25 +---
 drivers/media/usb/siano/smsusb.c                      |   3 +-
 drivers/staging/media/imx/TODO                        |   5 -
 47 files changed, 426 insertions(+), 377 deletions(-)
