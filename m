Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64FBA2CBAD8
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 11:46:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729421AbgLBKnN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 05:43:13 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:53101 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725885AbgLBKnM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 05:43:12 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id kPackD6EKN7XgkPafksTkh; Wed, 02 Dec 2020 11:42:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606905750; bh=H2POcUX7lcfoSCDZp3m/X6rLGZDF/LBpsCqB+YeFwdI=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=T2OgKPykhPjMd4Q2LZzAy5e2ibsJNFMVFHU7F9xIqFD9rIHn5DMx4MTN1D9Ct/c6P
         8bt9VhrFJYUM/6UjPxzR5c9FuFPO6RM4UFiNEAu0hAmdoMq4llwObLxceKf76wSt5u
         eFydT2I1oyje12XkRNJdSWbXzsXNSL4vQjZPtYqt7uWtFGPn6I/ohodnX/q0IR2v8N
         zhH+MYehbxV9Nmk2C17RW5Km2xBRXY2DAzNaRP4qSYxlmxOFJBaL2aww+0fWiA1HP4
         PGFRlCnwQi+0RFV8vXkwkRbwdBXpyijA8Qqq0ils4XSm0YDCcZLoBXKQalijRe0/7j
         07WV+jsokDX/Q==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.11] Various fixes/enhancements
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>
Message-ID: <5dbd468d-1d10-e0c8-43f0-ebe8f17abef8@xs4all.nl>
Date:   Wed, 2 Dec 2020 11:42:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfJMyLDLfLoxGpZyYOI046orQwxRbJ6lPFFjbNfDL9T1o3FDts2mLDHSzhZVmgltdqBzfDY3lmLNg7aOJsHZL3qCuIWreMFxRHCO9jOHF/G9DTBBnR6Xo
 pJzfF5D9yZX1ZzCorL95uP+KlyZ2ARs84cXgMQIGz5DrvgEn0svu06TydCy8Y8aAzSX+9pS9rncLvMenMU++VZq5u7l2BB2B3/dkoYJ8Lg51zNlFwvkFdsez
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Lots of fixes and enhancements. The main enhancement is adding support for vp8
to the cedrus driver.

Note that you'll get a message about a wrong commit id in
"media: rcar-vin: Mask VNCSI_IFMD register": that commit id is for the rcar
BSP repo, not the linux kernel repo.

Regards,

	Hans

The following changes since commit 67e061f044e46c9823e59ca7981786f858bfa292:

  Merge tag 'v5.10-rc6' into patchwork (2020-12-01 16:21:40 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.11c

for you to fetch changes up to 4bb8c5bfe39745de36bf6162fa054778e0028053:

  media: rockchip: rkisp1: remove useless debugfs checks (2020-12-02 11:39:23 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Andrey Konovalov (2):
      Revert "media: camss: Make use of V4L2_CAP_IO_MC"
      media: camss: Make use of V4L2_CAP_IO_MC

Baskov Evgeniy (1):
      s5p-jpeg: handle error condition in s5p_jpeg_probe

Christian Hewitt (1):
      media: meson: vdec: add G12/SM1 to module description

Christophe JAILLET (3):
      media: solo6x10: switch from 'pci_' to 'dma_' API
      media: ttpci: switch from 'pci_' to 'dma_' API
      media: saa7146: switch from 'pci_' to 'dma_' API

Dan Carpenter (2):
      media: saa7146: fix array overflow in vidioc_s_audio()
      media: rockchip: rkisp1: remove useless debugfs checks

Emmanuel Gil Peyrot (2):
      media: uapi: Expose VP8 probability lengths as defines
      media: hantro: Use VP8 lengths defined in uapi

Fabio Estevam (2):
      media: fsl-viu: Use the ioread/write32be() accessors
      media: staging/imx: Increase IMX_MEDIA_EOF_TIMEOUT

Irui Wang (2):
      media: mtk-vpu: VPU should be in idle state before system is suspended
      media: mtk-vpu: dump VPU status when IPI times out

Jacopo Mondi (2):
      media: rcar-vin: Remove unused macro
      media: rcar-vin: Mask VNCSI_IFMD register

Jernej Skrabec (1):
      media: cedrus: Add support for VP8 decoding

Jonathan Corbet (1):
      media: stop pretending to maintain cafe and ov7670

Marek Szyprowski (1):
      media: platform: exynos4-is: remove all references to physical addresses

Niklas Söderlund (4):
      adv748x: Only set i2c addresses once during probe
      adv748x: afe: Select input port when device is reset
      adv748x: csi2: Set virtual channel when device is reset
      adv748x: Configure device when resuming from sleep

Peilin Ye (1):
      media: rockchip: rkisp1: Fix typos in comments and macro definitions

Tom Rix (1):
      si4713: remove trailing semicolon in macro definition

 MAINTAINERS                                             |   6 +-
 drivers/media/common/saa7146/saa7146_core.c             |  39 +-
 drivers/media/common/saa7146/saa7146_fops.c             |   7 +-
 drivers/media/common/saa7146/saa7146_vbi.c              |   6 +-
 drivers/media/i2c/adv748x/adv748x-afe.c                 |   6 +-
 drivers/media/i2c/adv748x/adv748x-core.c                |  31 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c                |   6 +-
 drivers/media/i2c/adv748x/adv748x.h                     |   2 +
 drivers/media/pci/saa7146/mxb.c                         |  19 +-
 drivers/media/pci/solo6x10/solo6x10-g723.c              |  11 +-
 drivers/media/pci/solo6x10/solo6x10-p2m.c               |  10 +-
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c          |  35 +-
 drivers/media/pci/ttpci/av7110.c                        |  13 +-
 drivers/media/platform/exynos4-is/fimc-capture.c        |   6 +-
 drivers/media/platform/exynos4-is/fimc-core.c           |  28 +-
 drivers/media/platform/exynos4-is/fimc-core.h           |  18 +-
 drivers/media/platform/exynos4-is/fimc-is.c             |  20 +-
 drivers/media/platform/exynos4-is/fimc-is.h             |   6 +-
 drivers/media/platform/exynos4-is/fimc-lite-reg.c       |   4 +-
 drivers/media/platform/exynos4-is/fimc-lite.c           |   2 +-
 drivers/media/platform/exynos4-is/fimc-lite.h           |   4 +-
 drivers/media/platform/exynos4-is/fimc-m2m.c            |   8 +-
 drivers/media/platform/exynos4-is/fimc-reg.c            |  18 +-
 drivers/media/platform/exynos4-is/fimc-reg.h            |   4 +-
 drivers/media/platform/fsl-viu.c                        | 119 +++---
 drivers/media/platform/mtk-vpu/mtk_vpu.c                | 101 ++++-
 drivers/media/platform/qcom/camss/camss-video.c         |  87 ++---
 drivers/media/platform/rcar-vin/rcar-dma.c              |  26 +-
 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c |   4 +-
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c     |   4 -
 drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h    |   4 +-
 drivers/media/platform/s5p-jpeg/jpeg-core.c             |   2 +
 drivers/media/radio/si4713/si4713.c                     |   2 +-
 drivers/staging/media/hantro/hantro_vp8.c               |   4 +-
 drivers/staging/media/imx/imx-media.h                   |   2 +-
 drivers/staging/media/meson/vdec/vdec.c                 |   2 +-
 drivers/staging/media/sunxi/cedrus/Makefile             |   3 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c             |   8 +
 drivers/staging/media/sunxi/cedrus/cedrus.h             |  24 ++
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c         |   5 +
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c          |   2 +
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h        |  80 ++++
 drivers/staging/media/sunxi/cedrus/cedrus_video.c       |   9 +
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c         | 907 ++++++++++++++++++++++++++++++++++++++++++++
 include/media/vp8-ctrls.h                               |   6 +-
 45 files changed, 1427 insertions(+), 283 deletions(-)
 create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
