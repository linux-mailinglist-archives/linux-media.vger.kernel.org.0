Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F303F2A7FEC
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 14:50:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730465AbgKENuG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 08:50:06 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:32885 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725468AbgKENuG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 08:50:06 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id afeKkDLo2NanzafeNkoZvu; Thu, 05 Nov 2020 14:50:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604584203; bh=YncTeJh/rzkVfsoNGVWm28PWw39Lfgf77lsTc/fspg4=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=sdNELgtXwiu9vhF21MmeU4tXddQrRKzhBiCBOwHRJjop67TVCfR5VgfKiu8d2t1g4
         Hm2xda0YT01aApItXASjTYpT+FZ+Nsf+X2c6dSkizrFeAy861zmF7QlCysZRtyXnQy
         +fzx/Gl6t9s/ecniCok44mh84Dyd9lJZRihydnSziwpzxTfB3ZvayBpq2VJxBDXTl6
         GqQEYL5oLLgrElTRnHY+R/AQiroDBy4AmiuH+okKTf9kX6hWzSaOdJHMqDbKgen6YV
         ebTATWyM/JXM30C0gGiUhXtvRmyUt70dM4YW+zpe9I8R9U/yR1nGjW54BPj3GjwvoM
         Ct5I0hMgn+w6w==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.11] v2: Various fixes
Message-ID: <f3b8e5e2-5f0e-fb6f-e5b2-7f44f7e365e7@xs4all.nl>
Date:   Thu, 5 Nov 2020 14:50:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNSEvl4vxDX6/d2js4RFA7260/UGeKMEbGLVoyZEd7jtk7NKiYXTpdOVKIgE32U3itwVsdO+zlXH6FLuVREPk/r04n3UgqVkz9GZQ9s0adAPf/2FRG4X
 FfpyxwVZ1jF3HNqZCOTJdnC9HqnkGZ/LNICX/9Wcs6LYpUlSkJJ+iZxy1IoJP2irrwlRAfNrQoY2dbqivvfWmVNRKcz52MbPiz8=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Supersedes https://patchwork.linuxtv.org/project/linux-media/patch/01dbfda7-c126-8b8b-4af5-2cc767b34e19@xs4all.nl/

The only change is that two patches from Jernej were added.

Regards,

	Hans

The following changes since commit dfe3d19bd092cefb184c6e65b881602c793edd33:

  Merge tag 'v5.10-rc1' into patchwork (2020-10-29 09:03:21 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.11e

for you to fetch changes up to 451afd8c2a0a889105c27f16a38a8897086532f3:

  media: cedrus: Add support for R40 (2020-11-05 14:44:59 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dafna Hirschfeld (2):
      media: uapi: add MEDIA_BUS_FMT_METADATA_FIXED media bus format.
      media: staging: rkisp1: isp: set metadata pads to MEDIA_BUS_FMT_METADATA_FIXED

Evgeny Novikov (1):
      media: isif: reset global state

Ezequiel Garcia (2):
      coda: coda_buffer_meta housekeeping fix
      coda: Add a V4L2 user for control error macroblocks count

Hsin-Yi Wang (1):
      media: mtk-vcodec: remove allocated dma_parms

Jernej Skrabec (2):
      dt-bindings: media: allwinner,sun4i-a10-video-engine: Add R40 compatible
      media: cedrus: Add support for R40

Liu Shixin (1):
      media: media/pci: simplify the return expression of verify_window_lock

Yu Kuai (6):
      media: platform: add missing put_device() call in mtk_jpeg_clk_init()
      media: platform: add missing put_device() call in mtk_jpeg_probe() and mtk_jpeg_remove()
      media: mtk-vcodec: add missing put_device() call in mtk_vcodec_init_dec_pm()
      media: mtk-vcodec: add missing put_device() call in mtk_vcodec_release_dec_pm()
      media: mtk-vcodec: add missing put_device() call in mtk_vcodec_init_enc_pm()
      media: mtk-vcodec: add missing put_device() call in mtk_vcodec_release_enc_pm()

Zhang Qilong (2):
      media: staging: rkisp1: cap: fix runtime PM imbalance on error
      media: cedrus: fix reference leak in cedrus_start_streaming

 .../devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml  |  1 +
 Documentation/userspace-api/media/v4l/subdev-formats.rst             | 27 +++++++++++++++++
 drivers/media/pci/bt8xx/bttv-driver.c                                | 12 +++-----
 drivers/media/platform/coda/coda-bit.c                               | 52 +++++++++++++++++++++++++++-----
 drivers/media/platform/coda/coda-common.c                            | 18 +++++++++++
 drivers/media/platform/coda/coda.h                                   | 11 +++++++
 drivers/media/platform/davinci/isif.c                                | 11 +++++--
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c                      |  9 ++++++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c               |  9 +-----
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c                | 19 ++++++++----
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c               |  9 +-----
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c                | 28 ++++++++++++-----
 drivers/staging/media/rkisp1/TODO                                    |  1 -
 drivers/staging/media/rkisp1/rkisp1-capture.c                        |  1 +
 drivers/staging/media/rkisp1/rkisp1-isp.c                            |  8 ++---
 drivers/staging/media/sunxi/cedrus/cedrus.c                          |  9 ++++++
 drivers/staging/media/sunxi/cedrus/cedrus_video.c                    |  4 ++-
 include/uapi/linux/media-bus-format.h                                |  8 +++++
 include/uapi/linux/v4l2-controls.h                                   |  6 ++++
 19 files changed, 191 insertions(+), 52 deletions(-)
