Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD80848DBAC
	for <lists+linux-media@lfdr.de>; Thu, 13 Jan 2022 17:25:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236588AbiAMQZg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jan 2022 11:25:36 -0500
Received: from ewsoutbound.kpnmail.nl ([195.121.94.168]:19693 "EHLO
        ewsoutbound.kpnmail.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236631AbiAMQZf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jan 2022 11:25:35 -0500
X-KPN-MessageId: 55ffea9c-748d-11ec-8862-005056aba152
Received: from smtp.kpnmail.nl (unknown [10.31.155.40])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 55ffea9c-748d-11ec-8862-005056aba152;
        Thu, 13 Jan 2022 17:24:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:to:subject:from:mime-version:date:message-id;
        bh=dalBRL4inG+FB3siFN5MKHAiQ73UWnzx7XJcc7Cy9OQ=;
        b=jkcBTAf2XPBehR+zNkyek4iTamlQQBvtCgJ59+4ctKFeYiGzZGQNxMdnr13b6VRiv+0nsW2k2vM4K
         6aATBi1rZ5hxAG3u58Evc8gcHmjDuIzOpX9ucsyGs9y6aM/RfXBmBOvpi2eD8R0u4fCxWgyr/tABdL
         g7zXI63o8hTdXeVzI2h8w3HPeyWDspDo1PcgD+59d2JdQ/jel+EUTD/5OMJtt9Jn/hkhD6ZI1kiDSn
         aZ7sRWxD02nHW5WQ8LCqvwj8+hRFXoqAvedbysNvSxgR+PQ7i0UG0ToS0dLoRWNfX8AB6pPDBNNXAO
         vPuZf6jCalM0VL+BR5emtVSqZ2AHO+Q==
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|84+s8FTz2N8NM6NNXFkacqnDIYcWcImEg9wrBWxrdmLnTqZlKjtDifY+3Y9fUCT
 P3yFFS0GsHZPYOIA4TKGuQw==
X-Originating-IP: 193.91.129.219
Received: from [192.168.2.10] (cdb815bc1.dhcp.as2116.net [193.91.129.219])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 6e20ff51-748d-11ec-b76f-005056ab7584;
        Thu, 13 Jan 2022 17:25:33 +0100 (CET)
Message-ID: <09d9ade9-e6fd-8c77-68d6-d392a4948c6a@xs4all.nl>
Date:   Thu, 13 Jan 2022 17:25:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.18] More various fixes/enhancements
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c:

  media: ipu3-cio2: Add support for instantiating i2c-clients for VCMs (2021-12-16 20:58:56 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.18e

for you to fetch changes up to 0cda2064f6130e5956b277736f862d69e0f29df4:

  MAINTAINERS: Change maintainers for mipid02 driver (2022-01-13 14:17:56 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benjamin Mugnier (1):
      MAINTAINERS: Change maintainers for mipid02 driver

Christophe JAILLET (1):
      media: v4l2-dev: Use non-atomic bitmap API when applicable

Daniel Lundberg Pedersen (1):
      media: docs: v4l2grab.c.rst: change unintended assignment

Jacopo Mondi (3):
      dt-bindings: media: max9286: Re-indent example
      dt-bindings: media: max9286: Define 'maxim,gpio-poc'
      media: i2c: max9286: Use "maxim,gpio-poc" property

Jean-Michel Hautbois (1):
      media: doc: pixfmt-yuv: Fix V4L2-PIX-FMT-Y10P format

Jiasheng Jiang (1):
      media: meson: vdec: potential dereference of null pointer

Lad Prabhakar (11):
      media: vsp1: Use platform_get_irq() to get the interrupt
      media: camss: Use platform_get_irq_byname() to get the interrupt
      media: bdisp: Use platform_get_irq() to get the interrupt
      media: s5p-mfc: Use platform_get_irq() to get the interrupt
      media: stm32-dma2d: Use platform_get_irq() to get the interrupt
      media: exynos-gsc: Use platform_get_irq() to get the interrupt
      media: marvell-ccic: Use platform_get_irq() to get the interrupt
      media: exynos4-is: Use platform_get_irq() to get the interrupt
      media: s5p-g2d: Use platform_get_irq() to get the interrupt
      media: mtk-vpu: Drop unnecessary call to platform_get_resource()
      media: coda: Use platform_get_irq() to get the interrupt

Martin Kepplinger (2):
      media: imx: imx7-media-csi: add support for imx8mq
      dt-bindings: media: document imx8mq support for imx7-csi

Miaoqian Lin (1):
      media: coda: Fix missing put_device() call in coda_get_vdoa_data

Mirela Rabulea (1):
      media: imx-jpeg: Prevent decoding NV12M jpegs into single-planar buffers

 Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml | 275 ++++++++++++++++++++++--------------
 Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml      |   1 +
 Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst      |   4 +-
 Documentation/userspace-api/media/v4l/v4l2grab.c.rst           |   2 +-
 MAINTAINERS                                                    |   3 +-
 drivers/media/i2c/max9286.c                                    | 120 ++++++++++++----
 drivers/media/platform/coda/coda-common.c                      |   1 +
 drivers/media/platform/coda/imx-vdoa.c                         |   9 +-
 drivers/media/platform/exynos-gsc/gsc-core.c                   |  14 +-
 drivers/media/platform/exynos4-is/fimc-core.c                  |  11 +-
 drivers/media/platform/exynos4-is/fimc-lite.c                  |  11 +-
 drivers/media/platform/imx-jpeg/mxc-jpeg.c                     |   6 +
 drivers/media/platform/marvell-ccic/mmp-driver.c               |   8 +-
 drivers/media/platform/mtk-vpu/mtk_vpu.c                       |  10 +-
 drivers/media/platform/qcom/camss/camss-csid.c                 |  12 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c               |  12 +-
 drivers/media/platform/qcom/camss/camss-ispif.c                |  12 +-
 drivers/media/platform/qcom/camss/camss-vfe.c                  |  12 +-
 drivers/media/platform/s5p-g2d/g2d.c                           |  10 +-
 drivers/media/platform/s5p-mfc/s5p_mfc.c                       |  11 +-
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c                  |  10 +-
 drivers/media/platform/stm32/dma2d/dma2d.c                     |   9 +-
 drivers/media/platform/vsp1/vsp1_drv.c                         |  14 +-
 drivers/media/v4l2-core/v4l2-dev.c                             |  68 ++++-----
 drivers/staging/media/imx/imx7-media-csi.c                     |  32 ++++-
 drivers/staging/media/meson/vdec/esparser.c                    |   7 +-
 drivers/staging/media/meson/vdec/vdec_helpers.c                |   8 +-
 drivers/staging/media/meson/vdec/vdec_helpers.h                |   4 +-
 28 files changed, 412 insertions(+), 284 deletions(-)
