Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 867BF40A712
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 09:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240430AbhINHIu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 03:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240277AbhINHIt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 03:08:49 -0400
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::1b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8520C061574
        for <linux-media@vger.kernel.org>; Tue, 14 Sep 2021 00:07:32 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Q2XPmLSTeeJ0cQ2XRmn9ft; Tue, 14 Sep 2021 09:07:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1631603249; bh=a4pLDSn7mqpg6SBciufU9/LVM5UJMc781CjXOQEYPOM=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=lt/ZOLzq4LBIz25LRAdZTP/gz1q8pGaZVbwVYk/lPULKK/wsAckaGuTX5jXkTYNCz
         JQdajKvzN8i1WKmM5RTj40mpKc7HLpV51tNu92F1J2xcCNOXT8KJoe4yh7yNkEK//j
         4NPC2XudsSyCnSlLsSwmANQil8CJPbVKwxI5+66vmyrbGprwLX8O3HAC4wjPwyyfdK
         zY2feRDcYvscGhQGKc/s7DtIvjKPFp6bwvIcLen8wXz23XyOLuowKrxZuI+Z2jFiga
         wzkW3gNJ7sYBAWmGLevKp6X81VBCPlM3VAIHVuERKKC5vzz1YyPyl31KAzAPcqJiM/
         JbiBhUH6+dXfw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.16] Various fixes/enhancements
Message-ID: <d91f4ecb-8aa7-9faf-a21b-4d4d274abb81@xs4all.nl>
Date:   Tue, 14 Sep 2021 09:07:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfLQWga29A6I7wxUq7+pZXaZRUW92aetOAv+fJe9hg9h5ONG+5Ig7gx+tBpiAqAV4Nm57Ia8VbOSAG8v6juaIE5R7bDzB4Zm3FwmRPlQKCIijF3kKP783
 hsjkYzDXb/BC3H481wP3qBs3tAM5/6GDt3KI9XWaDSz4A150Gu46+7l22ATB+/6gul5FTzxnjPL9VRS0V110WgO7qOLyS4/Ia97rK2nOn7hImh0ieP4jbj+p
 VY+JxlKytVAumpfbBmvOQIAA9cL45rmFPVBv+zl3AozTcQkBeShx9OoTt/RD1+yG
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 826a9903fab5f7404265ddccd0bb4f240382e825:

  media: camss: vfe: Don't call hw_version() before its dependencies are met (2021-09-06 09:40:05 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.16e

for you to fetch changes up to bd8eee34df9066fbac39fea16ee290ad0f234a13:

  media: atmel: fix the ispck initialization (2021-09-13 13:04:42 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Arnd Bergmann (1):
      media: rcar_drif: select CONFIG_V4L2_ASYNC

Cai Huoqing (4):
      media: s3c-camif: Remove unused including <linux/version.h>
      usb: stkwebcam: Update the reference count of the usb device structure
      MAINTAINERS: Add linux-renesas-soc mailing list to renesas JPU
      staging: media: rkvdec: Make use of the helper function devm_platform_ioremap_resource()

Colin Ian King (2):
      media: saa7164: Remove redundant assignment of pointer t
      media: cx23885: Fix snd_card_free call on null card pointer

Dan Carpenter (1):
      ivtv: don't allow negative resolutions as module parameters

Deepak R Varma (1):
      staging: media: atomisp: code formatting changes atomisp_csi2.c

Eugen Hristev (1):
      media: atmel: fix the ispck initialization

Ezequiel Garcia (1):
      MAINTAINERS, .mailmap: Update Ezequiel Garcia's email address

Hans Verkuil (1):
      staging/media/meson: vdec.h: fix kerneldoc warnings

Kees Cook (3):
      media: radio-wl1273: Avoid card name truncation
      media: si470x: Avoid card name truncation
      media: tm6000: Avoid card name truncation

Martin Kepplinger (2):
      media: hantro: Fix media device bus_info string
      media: imx: set a media_device bus_info string

Mirela Rabulea (1):
      media: dt-bindings: imx-jpeg: Add compatible for i.MX8QM JPEG codec

Niklas Söderlund (1):
      media: rcar-vin: Use user provided buffers when starting

Ondrej Jirman (1):
      media: sun6i-csi: Allow the video device to be open multiple times

Pedro Terra (1):
      media: vimc: Enable set resolution at the scaler src pad

Randy Dunlap (1):
      media: i2c: ths8200 needs V4L2_ASYNC

Seongyong Park (1):
      media: video-i2c: more precise intervals between frames

zhaoxiao (1):
      Media: meson: vdec: Use devm_platform_ioremap_resource_byname()

 .mailmap                                                   |   1 +
 Documentation/admin-guide/media/vimc.rst                   |  20 +--
 Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml |  19 ++-
 MAINTAINERS                                                |   7 +-
 drivers/media/i2c/Kconfig                                  |   1 +
 drivers/media/i2c/video-i2c.c                              |  21 +--
 drivers/media/pci/cx23885/cx23885-alsa.c                   |   3 +-
 drivers/media/pci/ivtv/ivtvfb.c                            |   8 +-
 drivers/media/pci/saa7164/saa7164-api.c                    |   2 -
 drivers/media/platform/Kconfig                             |   1 +
 drivers/media/platform/atmel/atmel-isc-base.c              |  25 ++-
 drivers/media/platform/atmel/atmel-isc.h                   |   2 +
 drivers/media/platform/atmel/atmel-sama5d2-isc.c           |  39 ++---
 drivers/media/platform/atmel/atmel-sama7g5-isc.c           |  22 +--
 drivers/media/platform/rcar-vin/rcar-dma.c                 |   3 +-
 drivers/media/platform/s3c-camif/camif-core.c              |   1 -
 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c       |   6 +-
 drivers/media/radio/radio-wl1273.c                         |   2 +-
 drivers/media/radio/si470x/radio-si470x-i2c.c              |   2 +-
 drivers/media/radio/si470x/radio-si470x-usb.c              |   2 +-
 drivers/media/test-drivers/vimc/vimc-scaler.c              | 366 +++++++++++++++++---------------------------
 drivers/media/usb/stkwebcam/stk-webcam.c                   |  11 +-
 drivers/media/usb/tm6000/tm6000-video.c                    |   3 +-
 drivers/staging/media/atomisp/pci/atomisp_csi2.c           |  70 ++++-----
 drivers/staging/media/hantro/hantro_drv.c                  |   2 +-
 drivers/staging/media/imx/imx-media-dev-common.c           |   2 +
 drivers/staging/media/meson/vdec/esparser.h                |   6 +-
 drivers/staging/media/meson/vdec/vdec.c                    |   7 +-
 drivers/staging/media/meson/vdec/vdec.h                    |  16 +-
 drivers/staging/media/meson/vdec/vdec_helpers.h            |   3 +-
 drivers/staging/media/rkvdec/rkvdec.c                      |   4 +-
 31 files changed, 298 insertions(+), 379 deletions(-)
