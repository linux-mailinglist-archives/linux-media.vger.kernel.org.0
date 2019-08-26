Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C44B19D427
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 18:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732579AbfHZQiN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 12:38:13 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:37680 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729338AbfHZQiN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 12:38:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=DVyGfC2KtnD1prlIDE0OXA575RIoEwAyCuegsYbGfMI=; b=j5AcWf+rPDentQOnQrMAoUIhC
        w3Z7a6tiHBfWvxD60xfPUhWtV8sEUgQHU15bCjRxIo6W7cdgKDpXTOeODmlrM1qNdHqesDHqUL6ER
        wR1kGtiE06bOsKhd4RrkU3F7aUzIE1wISeJmsluTgmUcayvUW+14iC9+Y8JAvu6sYZJIgUZw3Ow71
        eVRmQS/J8q8eO3hmHg9exfx6tD40teajVtmdEqk+idSmKDDLyEYB96VQMlKTN451sjh952w87CNjQ
        aAsecVkqT8sEb3+qCqFuNC/p6vdFdf/zbu0Mk5pFlroycgy7tcItVOMB0JZeolvDqPZdTacmj+VVd
        g9+Cr0zFg==;
Received: from 177.17.135.157.dynamic.adsl.gvt.net.br ([177.17.135.157] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i2I0S-0000zX-7y; Mon, 26 Aug 2019 16:38:12 +0000
Date:   Mon, 26 Aug 2019 13:38:08 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [GIT PULL] media patches
Message-ID: <20190826133808.1bb4f296@coco.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 01faced6f65d0224bf6ce1262a4137771e28519f:

  media: dt-bindings: media: Convert Allwinner A10 IR to a schema (2019-08-21 18:39:55 -0300)

are available in the Git repository at:

  git://git://linuxtv.org/mchehab/experimental.git patches/v5.3-1

for you to fetch changes up to 03905f3929e5c8241aa0188eda41dcb37ffd64c5:

  media: don't do a 31 bit shift on a signed int (2019-08-26 06:49:18 -0300)

----------------------------------------------------------------

Media patches solving some issues detected by cppcheck.

----------------------------------------------------------------
Mauro Carvalho Chehab (6):
      media: remove include stdarg.h from some drivers
      media: vicodec: make life easier for static analyzers
      media: aspeed-video: address a protential usage of an unit var
      media: ov9650: add a sanity check
      media: use the BIT() macro
      media: don't do a 31 bit shift on a signed int

 drivers/media/dvb-frontends/cx24123.c             |   2 +-
 drivers/media/i2c/ov9650.c                        |   5 +
 drivers/media/pci/bt8xx/bttv-input.c              |   4 +-
 drivers/media/pci/cobalt/cobalt-driver.h          |  63 +--
 drivers/media/pci/cx18/cx18-ioctl.c               |   2 +-
 drivers/media/pci/cx18/cx18-mailbox.c             |   2 +-
 drivers/media/pci/ivtv/ivtv-driver.c              |   2 +-
 drivers/media/pci/ivtv/ivtv-ioctl.c               |   4 +-
 drivers/media/pci/ivtv/ivtv-irq.h                 |  28 +-
 drivers/media/pci/ivtv/ivtv-mailbox.c             |   2 -
 drivers/media/pci/mantis/mantis_reg.h             | 152 +++---
 drivers/media/pci/solo6x10/solo6x10-gpio.c        |   6 +-
 drivers/media/pci/solo6x10/solo6x10-regs.h        | 286 +++++------
 drivers/media/pci/ttpci/av7110_hw.c               |   1 -
 drivers/media/platform/am437x/am437x-vpfe_regs.h  |  26 +-
 drivers/media/platform/aspeed-video.c             |   5 +-
 drivers/media/platform/davinci/dm644x_ccdc_regs.h |  20 +-
 drivers/media/platform/exynos4-is/fimc-lite-reg.h |  80 +--
 drivers/media/platform/exynos4-is/fimc-reg.h      | 138 ++---
 drivers/media/platform/exynos4-is/mipi-csis.c     |   6 +-
 drivers/media/platform/fsl-viu.c                  |   2 +-
 drivers/media/platform/mx2_emmaprp.c              |   2 +-
 drivers/media/platform/omap3isp/ispreg.h          | 584 +++++++++++-----------
 drivers/media/platform/pxa_camera.c               |   4 +-
 drivers/media/platform/qcom/venus/core.c          |   2 +-
 drivers/media/platform/s3c-camif/camif-regs.h     | 118 ++---
 drivers/media/platform/s5p-jpeg/jpeg-regs.h       |  10 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c   |   4 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_opr_v6.c   |   2 +-
 drivers/media/platform/tegra-cec/tegra_cec.h      |  82 +--
 drivers/media/platform/ti-vpe/vpe_regs.h          |  94 ++--
 drivers/media/platform/vicodec/vicodec-core.c     |  11 +-
 drivers/media/platform/vsp1/vsp1_regs.h           | 224 ++++-----
 drivers/media/platform/xilinx/xilinx-vip.h        |  29 +-
 drivers/media/radio/radio-gemtek.c                |   2 +-
 drivers/media/radio/radio-trust.c                 |   1 -
 drivers/media/radio/wl128x/fmdrv_common.h         |  88 ++--
 drivers/media/usb/dvb-usb-v2/gl861.c              |   2 +-
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c           |  14 +-
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c          |   4 +-
 drivers/media/v4l2-core/v4l2-ioctl.c              |   2 +-
 drivers/staging/media/ipu3/ipu3-tables.h          |   4 +-
 42 files changed, 1068 insertions(+), 1051 deletions(-)


---

Ok, sending an e-mail to me sounds a little... selfish :-)

Yet, doing that makes the pull request to be parsed by the builder, so,
if everything wents fine, I may end doing it from now on.
