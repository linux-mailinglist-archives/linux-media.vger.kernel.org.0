Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A39A02FE748
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 11:16:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727155AbhAUKOw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 05:14:52 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:53835 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728803AbhAUKOl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 05:14:41 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 2WyKlaYYVyutM2WyOlgjO6; Thu, 21 Jan 2021 11:13:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611224032; bh=vFldCs0uCsla7nsO6tILqtpoaUWPlgyl3Ou2eNpC9WE=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=gxkl7D/1CR7f1z9G2fM2wJn6rWrvZW+/qnID0KeKpZgrCVCz2sDuS/oNvevGzTV3r
         2p8F1F8/n45+Kv5uP3/g9FIGzMEwfuxnSwUC1ZWk42IWsK/n69HsczUMRYU114VjaT
         65GRIFqUfxpIbvzCgBHsJxoTNglikE+P24It/j4ktrEnMDtceymTDG5yJtIb3qjlwj
         zVDrMiuI8FsGLFnm1Z2wCaFc+j3bdbK+OB1+p8G/i/4ubXKZ8YlX9Ar6vk4cWOKYc4
         SfUrLoqpLcRe7Bo2Z31PLqLPgSXxigw51EuxkTpPXaQWkUArq3KmweYJQPGM0cY9qa
         UYqFYcfp3vzZQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.12] Various fixes
Message-ID: <827141bf-e952-e716-9366-c9b7e09c73d3@xs4all.nl>
Date:   Thu, 21 Jan 2021 11:13:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEcWvF7eUvTLC1mGxP6eYdkFvW7fs5uy9xnPVbTUfsZD1Tb/SOViJVrlTMxfxU37gmDc7uxFxnEqKaSX3gXZ/6U3NJhRh75VUsb2mlgtl+vrcGVN8V82
 +C+Dqhi5jAvr+InhkQS3TDhFQQJOtVYrmhXA3WnAb23PzNaAwAJIOuLBtddje3K5aMy3xXrdXhPOK5xGZ3uBPTNP7MW0PDm0hxw=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 321af22a3d2f6ed1fb1737c8588c01f6fec8a7b8:

  media: atomisp: convert comma to semicolon (2021-01-14 13:59:46 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.12e

for you to fetch changes up to 4e221f315d321688858493f8e097741b569b5232:

  media: pxa_camera: declare variable when DEBUG is defined (2021-01-21 11:08:13 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Arnd Bergmann (1):
      media: rc: select CONFIG_BITREVERSE where needed

Christophe JAILLET (2):
      media: saa7164: switch from 'pci_' to 'dma_' API
      media: cx25821: Fix a bug when reallocating some dma memory

Dan Carpenter (1):
      media: atomisp: Fix a buffer overflow in debug code

Evan Benn (1):
      media: mtk-vcodec: Fix order of log arguments

Gustavo A. R. Silva (6):
      media: dvb-frontends: Fix fall-through warnings for Clang
      media: usb: dvb-usb-v2: Fix fall-through warnings for Clang
      media: atomisp: Fix fall-through warnings for Clang
      media: dvb_frontend: Fix fall-through warnings for Clang
      media: rcar_jpu: Fix fall-through warnings for Clang
      media: saa7134: Fix fall-through warnings for Clang

Jernej Skrabec (1):
      media: cedrus: Remove checking for required controls

Luo Meng (1):
      qm1d1c0042: fix error return code in qm1d1c0042_init()

Ricardo Ribalda (7):
      media: mtk-mdp: Do not zero reserved fields
      media: fdp1: Do not zero reserved fields
      media: jpu: Do not zero reserved fields
      media: ti-vpe: Do not zero reserved fields
      media: vicodec: Do not zero reserved fields
      media: sun4i-csi: Do not zero reserved fields
      media: mtk-vcodec: Do not zero reserved fields

Tom Rix (2):
      media: mtk-vcodec: fix argument used when DEBUG is defined
      media: pxa_camera: declare variable when DEBUG is defined

 drivers/media/dvb-core/dvb_frontend.c                   |  1 +
 drivers/media/dvb-frontends/cx24120.c                   |  1 +
 drivers/media/dvb-frontends/dib0090.c                   |  2 ++
 drivers/media/dvb-frontends/drxk_hard.c                 |  1 +
 drivers/media/dvb-frontends/m88rs2000.c                 |  1 +
 drivers/media/pci/cx25821/cx25821-core.c                |  4 +++-
 drivers/media/pci/saa7134/saa7134-tvaudio.c             | 25 ++++++++++++-----------
 drivers/media/pci/saa7164/saa7164-buffer.c              | 16 ++++++++-------
 drivers/media/pci/saa7164/saa7164-core.c                |  2 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c            |  3 ---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c      |  6 ------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c      | 10 ---------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  4 ++--
 drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c     | 12 +++++------
 drivers/media/platform/pxa_camera.c                     |  3 +++
 drivers/media/platform/rcar_fdp1.c                      |  4 ----
 drivers/media/platform/rcar_jpu.c                       |  6 +-----
 drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c     |  4 ----
 drivers/media/platform/ti-vpe/vpe.c                     |  2 --
 drivers/media/rc/Kconfig                                |  2 ++
 drivers/media/rc/img-ir/Kconfig                         |  1 +
 drivers/media/test-drivers/vicodec/vicodec-core.c       |  5 -----
 drivers/media/tuners/qm1d1c0042.c                       |  4 +++-
 drivers/media/usb/cx231xx/Kconfig                       |  1 +
 drivers/media/usb/dvb-usb-v2/af9015.c                   |  1 +
 drivers/media/usb/dvb-usb-v2/lmedm04.c                  |  1 +
 drivers/media/usb/em28xx/Kconfig                        |  1 +
 drivers/staging/media/atomisp/pci/atomisp_subdev.c      | 24 ++++++++++++++--------
 drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c |  1 +
 drivers/staging/media/sunxi/cedrus/cedrus.c             | 49 ---------------------------------------------
 drivers/staging/media/sunxi/cedrus/cedrus.h             |  1 -
 31 files changed, 71 insertions(+), 127 deletions(-)
