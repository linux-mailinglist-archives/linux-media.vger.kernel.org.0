Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5C011E249
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 11:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbfLMKsq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 05:48:46 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:56673 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725928AbfLMKsq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 05:48:46 -0500
Received: from [IPv6:2001:983:e9a7:1:c93c:45bd:1710:e478]
 ([IPv6:2001:983:e9a7:1:c93c:45bd:1710:e478])
        by smtp-cloud7.xs4all.net with ESMTPA
        id fiV0il3nSapzpfiV1idv5z; Fri, 13 Dec 2019 11:48:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576234124; bh=q9WCQnSJK0dN1iObZCsSbodAkz0ILsCmdtkb7tjUKaY=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Wma0y7NwrK71vqGoVGSFFCCwPQSs7OFD042So2JJDYx8V2UqPCAghVl+z5bTp0rmX
         CkI3RxjoeBb4+lK/Uotm6KdvI2tUtkWmKZ2YgFEuVz7WWr1hgTPTAI6TQ9Omkgaj80
         nck8tBGGm442E56es/fOvHouE2iW1Skg5AjxdEtChwLSE7OzZlyNogyC9TzKBuKkme
         V/l5AQrMre0jAo0bHsuI5immXmVGf0bR8P1cp958PeHogMw5z4s7CSJSQM+75R9qG8
         5Qjr/ugQ7BuTCPc89mQjJHlsOX425ZaqcoJ85E97rXHDW3/op5SIyupzx7vjDqFvo5
         j3AtWpRxOLrzA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Neil Armstrong <narmstrong@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.6] Various fixes/enhancements
Message-ID: <e47a67f8-da88-b0af-d59a-bf54f28e56c1@xs4all.nl>
Date:   Fri, 13 Dec 2019 11:48:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJuOf6iWT4V2PE3NjVY5XmI2GfcNbW/+2rv5P2IvlZjb7L7TSElX+IpK289s/f4ZS9zjYDxDL4lPZBd/etkxFpYVsuTw2gT7tXYTLbRqgBFtP2o2apHa
 OWhzGpemHH2HOa72OesEW9G4WsaNzhRloVkBZfNTOMy1Fzb+dnOj/J0wPn5dok3hZ4+t+jmf2C+k80TEOsXCkrjSOafGxduGUBYwr7t7uejiBfZlTsUzrE37
 KrOHzZr9gdttWqLq3NYoIwe5G0ns5rA8hnQ5zM1PIkmvVe1sqCftxkOkx2IVUzTmzMXSxKc3U1pEyEUSmt+TN90k0TQDhtmPoRz799n1+KObZXA+hwz45m+s
 iSffvKuazKwWhMm5yIBJNFqRppYm+b81H+OWIozxBFXA1Ko/c6c=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit da090bf60370c9ad6ede4e76adbf37ce79b84791:

  media: Drop superfluous ioctl PCM ops (2019-12-13 09:33:22 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.6d

for you to fetch changes up to 425738b4771df9c973bf8d233835b198ba141677:

  media: vimc: Implement get/set selection in sink (2019-12-13 11:37:05 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Eugen Hristev (8):
      media: atmel: atmel-isc-base: allow 8 bit direct dump
      media: atmel: atmel-isc-base: add support for Y10 format
      media: atmel: atmel-isc-base: properly initialize pad_cfg
      media: atmel: atmel-isc-base: fix enum calls default format
      media: atmel: atmel-isc-base: initialize the try_crop for the pads in try_fmt
      media: atmel: atmel-isi: add support for mono sensors, GRAY and Y16
      media: atmel: atmel-isi: properly initialize pad_cfg
      media: atmel: atmel-isi: initialize the try_crop for the pads in try_fmt

Guilherme Alcarde Gallo (1):
      media: vimc: Implement get/set selection in sink

Hans Verkuil (1):
      pixfmt-tch-td16/tu16.rst: document that this is little endian

Hirokazu Honda (1):
      media: mtk-vcodec: Remove extra area allocation in an input buffer on encoding

Maxime Jourdan (1):
      media: meson: vdec: add g12a platform

Neil Armstrong (4):
      dt-bindings: media: amlogic,vdec: convert to yaml
      dt-bindings: media: amlogic,gx-vdec: add bindings for G12A family
      dt-bindings: media: amlogic,gx-vdec: add bindings for SM1 family
      media: meson: vdec: add sm1 platform

Niklas Söderlund (2):
      dt-bindings: rcar-vin: Remove paragraph about aliases
      dt-bindings: rcar-vin: Document compatibility string for R8A77470

Philipp Zabel (6):
      media: coda: do not skip finish_run if aborting
      media: coda: jpeg: merge Huffman table bits and values
      media: coda: jpeg: add JPEG register definitions for CODA960
      media: coda: jpeg: add CODA960 JPEG encoder support
      media: coda: remove redundant platform_get_irq error message
      media: coda: avoid hardware lockups with more than 13 capture buffers

Rui Miguel Silva (1):
      media: imx7-mipi-csis: remove subdev_notifier

Wei Yongjun (1):
      media: sun8i: Remove redundant dev_err call in deinterlace_probe()

 Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml | 141 ++++++++
 Documentation/devicetree/bindings/media/amlogic,vdec.txt     |  72 ----
 Documentation/devicetree/bindings/media/renesas,vin.txt      |   4 +-
 Documentation/media/uapi/v4l/pixfmt-tch-td16.rst             |  34 +-
 Documentation/media/uapi/v4l/pixfmt-tch-tu16.rst             |  34 +-
 drivers/media/platform/atmel/atmel-isc-base.c                |  94 ++++--
 drivers/media/platform/atmel/atmel-isi.c                     |  42 ++-
 drivers/media/platform/atmel/atmel-isi.h                     |   2 +
 drivers/media/platform/coda/coda-bit.c                       |  29 +-
 drivers/media/platform/coda/coda-common.c                    |  45 ++-
 drivers/media/platform/coda/coda-jpeg.c                      | 746 ++++++++++++++++++++++++++++++++++++++++--
 drivers/media/platform/coda/coda.h                           |   3 +
 drivers/media/platform/coda/coda_regs.h                      |  83 +++++
 drivers/media/platform/coda/trace.h                          |  10 +
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c           |   9 +-
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c             |   5 +-
 drivers/media/platform/vimc/vimc-scaler.c                    | 166 +++++++++-
 drivers/staging/media/imx/imx7-mipi-csis.c                   |   3 -
 drivers/staging/media/meson/vdec/vdec.c                      |  16 +-
 drivers/staging/media/meson/vdec/vdec.h                      |   1 +
 drivers/staging/media/meson/vdec/vdec_1.c                    |  29 +-
 drivers/staging/media/meson/vdec/vdec_platform.c             |  60 ++++
 drivers/staging/media/meson/vdec/vdec_platform.h             |   4 +
 23 files changed, 1427 insertions(+), 205 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/amlogic,vdec.txt
