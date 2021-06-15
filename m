Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F54E3A8082
	for <lists+linux-media@lfdr.de>; Tue, 15 Jun 2021 15:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbhFONkg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Jun 2021 09:40:36 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:50187 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231776AbhFONj7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Jun 2021 09:39:59 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id t9GIlm4bchqltt9GLlrnXB; Tue, 15 Jun 2021 15:37:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623764273; bh=hu6RrDWxD8Y4DLo+affllNx/DP7kuOPrCoCllpM4b5c=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=IMFLNh+T3+D8YdjddmoEGDRKNGLCkU5Gn7HH2CQognFqMtJQvZjaBWD34Qy2r3Y+G
         i+hu2QvaI/5eeHbTi4EoPIzur3nXCNKhIddBKKf6n85/oqVIlpwGNFdWAs4EiHKolP
         GSrtEPVjWemuGhVgudaLUJ4m+j87fpE1ZzAVCB/MkA20R2weFq7lSfcYCx1/JKPms4
         6X1V9kM59IaiBFqezKntlxDtcOgRIjs6Gu7FqRx8tLNDk0iDWEYfsx0koB/dW9mFWs
         VGqiMEEZtwl05kzQujH1eHyGDxUtmUrZAeSC+ZKeEFwAI23KgmGY3swf3ONoOynTRw
         w8sd1/Rcn/lRw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.14] Various fixes
Message-ID: <199ddb07-4d21-7143-eddd-3df21f6062c3@xs4all.nl>
Date:   Tue, 15 Jun 2021 15:37:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfPt5jv/yNKjQr3HfTvPk6IDU8woCzD++HNJiaoWDEO1OxotuCY7xItZ4n28st8PvJ2Nw+6mvJfG3L/wLKdM90mis5ovfxnOqIDFj6w0GyRl4pS2pdjMq
 QhN5nCRMiw4iQ+y5egs04RSu3uRBt0IERA1cMvgs/r0kKIK4q1u5T9EZtQFwc51PInVjfn/r5rGHe8sck4QumFkAsWesrjymZvs=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 45040f675041956ad763f9ef139ecee3647aa8bb:

  media: hantro: IMX8M: add variant for G2/HEVC codec (2021-06-08 16:13:53 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.14n

for you to fetch changes up to e70643cf5bfa2787079f9d005685c1cd3b66e0df:

  mtk-vcodec: fix kerneldoc warnings (2021-06-15 15:36:39 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Christophe JAILLET (1):
      media: pci: cx88: switch from 'pci_' to 'dma_' API

Dillon Min (1):
      media: s5p-g2d: Fix a memory leak on ctx->fh.m2m_ctx

Evgeny Novikov (1):
      media: marvell-ccic: set error code in probe

Hans Verkuil (2):
      adv7842: remove spurious & and fix vga_edid size
      mtk-vcodec: fix kerneldoc warnings

Niklas Söderlund (1):
      rcar-csi2: Add support for Y10 and Y8

Piyush Thange (1):
      media: usb: cpia2: Fixed Coding Style issues

Rikard Falkeborn (2):
      media: imx-jpeg: Constify static struct v4l2_m2m_ops
      media: imx-jpeg: Constify static struct mxc_jpeg_fmt

Steve Longerbeam (1):
      media: imx-csi: Skip first few frames from a BT.656 source

Wolfram Sang (1):
      media: coda: set debugfs blobs to read only

lijian (1):
      media: v4l2-event: Modified variable type 'unsigned' to 'unsigned int'

 drivers/media/i2c/adv7842.c                        |   8 +--
 drivers/media/pci/cx88/cx88-alsa.c                 |   6 +--
 drivers/media/pci/cx88/cx88-blackbird.c            |   3 +-
 drivers/media/pci/cx88/cx88-core.c                 |   6 ++-
 drivers/media/pci/cx88/cx88-dvb.c                  |   3 +-
 drivers/media/pci/cx88/cx88-mpeg.c                 |   6 +--
 drivers/media/pci/cx88/cx88-vbi.c                  |   3 +-
 drivers/media/pci/cx88/cx88-video.c                |   5 +-
 drivers/media/platform/coda/coda-common.c          |   4 +-
 drivers/media/platform/imx-jpeg/mxc-jpeg.c         |  18 +++----
 drivers/media/platform/imx-jpeg/mxc-jpeg.h         |  18 +++----
 drivers/media/platform/marvell-ccic/cafe-driver.c  |  12 +++--
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |  25 +++++----
 drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h   |   2 +-
 drivers/media/platform/mtk-vcodec/venc_ipi_msg.h   |   4 +-
 drivers/media/platform/rcar-vin/rcar-csi2.c        |   2 +
 drivers/media/platform/s5p-g2d/g2d.c               |   3 ++
 drivers/media/usb/cpia2/cpia2_v4l.c                | 149 +++++++++++++++++++++++++--------------------------
 drivers/media/v4l2-core/v4l2-event.c               |   6 +--
 drivers/staging/media/imx/imx-media-csi.c          |  14 ++++-
 20 files changed, 164 insertions(+), 133 deletions(-)
