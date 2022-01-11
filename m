Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE7A348AB40
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 11:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237686AbiAKKVK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 05:21:10 -0500
Received: from ewsoutbound.kpnmail.nl ([195.121.94.168]:15844 "EHLO
        ewsoutbound.kpnmail.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233911AbiAKKVJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 05:21:09 -0500
X-KPN-MessageId: 192b4fd6-72c8-11ec-8862-005056aba152
Received: from smtp.kpnmail.nl (unknown [10.31.155.40])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 192b4fd6-72c8-11ec-8862-005056aba152;
        Tue, 11 Jan 2022 11:20:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:subject:from:to:mime-version:date:message-id;
        bh=dVmFmEDq1afgSKpuiMRhnhBmpOd71gU4scMwlu4YAe8=;
        b=YizzTfAkTJMTwyiEYexRruhNZiob77bAk6hFrCMD8/drMUHm8vJkoER054Q5+pqoUCDYD490CSyT2
         YFvpIRQTEToG9hHw7OntP7nH2nNnmbIr+ax3QN91k5Sl+sxuUSVIbQSajFhOm/DwktIOPNHy6X/CnH
         1qlGYHsehiVfIoAcvLf1+CVEG+Z3NuypRcN8U7nwy50GoyJrQCu21ZJ2q5biKHgCfWeK0TEUcEuBUp
         v6IFIqHs/CwagAHkeCpuOMH3LNZ06nLlufCl923vK4v7JVi5giarCobfl+DCXpkELpapVTIHhoNaZ0
         aGQj3BMfsOEDWGAtmzELOH1i2ECAmMg==
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|NSKFleKpnTKcohEGnY0Y88mlgJkBef/C42uBdRfNfeOzTjzwt4d5KAdsQK4PgQk
 eSUvOZam2bVU4u0S5kOUohA==
X-Originating-IP: 193.91.129.219
Received: from [192.168.2.10] (cdb815bc1.dhcp.as2116.net [193.91.129.219])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 30dfd402-72c8-11ec-b76f-005056ab7584;
        Tue, 11 Jan 2022 11:21:08 +0100 (CET)
Message-ID: <63d723aa-b6a3-ff42-c3e4-f1fcb979be11@xs4all.nl>
Date:   Tue, 11 Jan 2022 11:21:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.18] Various fixes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c:

  media: ipu3-cio2: Add support for instantiating i2c-clients for VCMs (2021-12-16 20:58:56 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.18a

for you to fetch changes up to 675fd0b04a0c48eefcc853d6c2189ddd4f5e8d15:

  media: stm32: dcmi: create a dma scatterlist based on DMA max_sg_burst value (2022-01-11 11:09:57 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Alain Volmat (1):
      media: stm32: dcmi: create a dma scatterlist based on DMA max_sg_burst value

Chen-Yu Tsai (2):
      media: docs: vidioc-dqbuf: State all remaining fields are filled by driver
      media: v4l2-mem2mem: Apply DST_QUEUE_OFF_BASE on MMAP buffers across ioctls

Colin Ian King (3):
      media: gspca: make array regs_to_read static const
      media: media/radio: make array probe_ports static const
      media: v4l2-ctrls: make array range static

Dafna Hirschfeld (1):
      media: rkisp1: fix grey format iommu page faults

Deborah Brouwer (1):
      media: vivid: fix timestamp and sequence wrapping

Jiasheng Jiang (1):
      media: mtk-vcodec: potential dereference of null pointer

Johan Hovold (4):
      media: davinci: vpif: fix unbalanced runtime PM get
      media: davinci: vpif: fix unbalanced runtime PM enable
      media: davinci: vpif: fix use-after-free on driver unbind
      media: davinci: vpif: drop probe printk

Martin Kepplinger (2):
      media: imx: imx8mq-mipi-csi2: remove wrong irq config write operation
      media: imx: imx8mq-mipi_csi2: fix system resume

Ming Qian (1):
      media: imx-jpeg: use NV12M to represent non contiguous NV12

Ondrej Zary (1):
      bttv: fix WARNING regression on tunerless devices

Yang Guang (1):
      media: saa7134: use swap() to make code cleaner

Zhuohao Lee (1):
      media: platform: cros-ec: Add brask to the match table

 Documentation/userspace-api/media/v4l/vidioc-qbuf.rst   |   2 +-
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c        |   2 +
 drivers/media/pci/bt8xx/bttv-driver.c                   |   4 +-
 drivers/media/pci/saa7134/saa7134-video.c               |   9 ++--
 drivers/media/platform/davinci/vpif.c                   | 111 +++++++++++++++++++++++++++++++------------
 drivers/media/platform/imx-jpeg/mxc-jpeg.c              |  12 ++---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c   |   2 +
 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c |  28 ++++++++---
 drivers/media/platform/stm32/stm32-dcmi.c               |  51 +++++++++++++++-----
 drivers/media/radio/radio-sf16fmi.c                     |   2 +-
 drivers/media/test-drivers/vivid/vivid-core.h           |   5 +-
 drivers/media/test-drivers/vivid/vivid-ctrls.c          |  32 ++++++-------
 drivers/media/test-drivers/vivid/vivid-kthread-cap.c    |   7 ++-
 drivers/media/test-drivers/vivid/vivid-kthread-out.c    |   9 ++--
 drivers/media/test-drivers/vivid/vivid-kthread-touch.c  |   7 +++
 drivers/media/test-drivers/vivid/vivid-sdr-cap.c        |  12 +++--
 drivers/media/test-drivers/vivid/vivid-touch-cap.c      |   2 +-
 drivers/media/usb/gspca/jl2005bcd.c                     |   4 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c               |   2 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c                  |  53 ++++++++++++++++-----
 drivers/staging/media/imx/imx8mq-mipi-csi2.c            |  74 ++++++++++++++++++-----------
 21 files changed, 294 insertions(+), 136 deletions(-)
