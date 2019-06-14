Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F21F4581A
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 11:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbfFNJCJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 05:02:09 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:49159 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725812AbfFNJCJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 05:02:09 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id bi5yhHgUf41bFbi61hPJiz; Fri, 14 Jun 2019 11:02:06 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        "Eugen.Hristev@microchip.com" <Eugen.Hristev@microchip.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.3] Various fixes/improvements
Message-ID: <563d8e02-eae4-8090-8c4a-a4b5141f7220@xs4all.nl>
Date:   Fri, 14 Jun 2019 11:02:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfA3fCrLXAPqknSInNewbR3vx5pB3sURnXT37e/o9K4K8ayJJywHjtuYpMJdbB9YVdMa+Jy9bFldWaZNywRcwUjYadKsds5T1/+lPEhp0T+FY9KpP/601
 /is1tZIZY2Lp/+8oRDXcco36GoYBeQ0XTX90dNyiB+aym9FrymDVOL0Y5XqF04lONXTUbSLEpa6WgovI/sjrHJiLv8n1kIo5Jc/zf96C9SzXEG9bKwKblYua
 6Xa0Hg792wzkyvfaMZ7uuDhezgjrQ1hVP49w8VLLo1AWyrhzV13+ojyxzgcDaml+jSYwuJ32j0vxW2F+fj6ejEQYLmyC7pB9M7ee6CwrNh4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 513dbd35b5d93c45fa7291147f21fc0227a9f999:

  media: add SPDX headers to some files (2019-06-12 11:42:27 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.3q

for you to fetch changes up to b18217be1085474960fa4b074b5d751a2a724775:

  media: mtk-vcodec: remove unneeded proxy functions (2019-06-14 10:25:17 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Alexandre Courbot (2):
      media: mtk-vcodec: avoid unneeded pointer-to-long conversions
      media: mtk-vcodec: remove unneeded proxy functions

Anders Roxell (1):
      media: i2c: fix warning same module names

André Almeida (2):
      media: vimc: debayer: Fix typos
      media: vimc: Makefile: file cleanup

Colin Ian King (2):
      staging: davinci: fix memory leaks and check for allocation failure
      staging: media: meson: remove redundant initialization of mpeg12

Dan Carpenter (1):
      media: hantro: remove an unnecessary NULL check

Eugen Hristev (2):
      media: atmel: atmel-isc: split driver into driver base and isc
      media: atmel: atmel-isc: fix and cleanup potential bugs

Ezequiel Garcia (5):
      media: v4l2-ctrl: Initialize _BUTTON and _CTRL_CLASS
      media: vb2: Introduce a vb2_get_buffer accessor
      media: mtk-jpeg: Use vb2_get_buffer
      media: mtk-vcodec: Use vb2_get_buffer
      media: sti: Use vb2_get_buffer

Luca Ceresoli (8):
      media: docs: v4l2-controls: remove repeated ioctl names
      media: docs: v4l2-controls: fix indentation
      media: docs: v4l2-controls: add links to structs
      media: docs: v4l2-controls: rearrange control initialization sequence
      media: docs: v4l2-controls: add links to functions
      media: docs: v4l2-controls: convert code blocks to C
      media: docs: v4l2-controls: document file to include
      media: docs: v4l2-controls: remove outdated paragraph

Marek Szyprowski (1):
      media: s5p-mfc: Make additional clocks optional

Maxime Jourdan (1):
      media: MAINTAINERS: fix linux-media mailing list for meson drivers

Niklas Söderlund (8):
      rcar-vin: Do not call pm_runtime_{resume,suspend}()
      rcar-vin: Remove unneeded calls to pm_runtime_{enable, disable}
      rcar-vin: Allow interrupting lock when trying to open the video device
      rcar-vin: Do not sync subdevice format when opening the video device
      rcar-vin: Move pm_runtime_{get,put} out of helpers
      rcar-vin: Merge helpers dealing with powering the parallel subdevice
      rcar-vin: Fold rvin_initialize_device() into rvin_open()
      rcar-vin: Merge Gen2 and Gen3 file operations

Rui Miguel Silva (1):
      media: imx7-media-csi: get csi upstream endpoint

Shuah Khan (2):
      media: media.h: Fix shifting signed 32-bit value by 31 bits problem
      media: videodev2.h: Fix shifting signed 32-bit value by 31 bits problem

Tomasz Figa (1):
      media: Clarify the meaning of file descriptors in VIDIOC_DQBUF

 Documentation/media/kapi/v4l2-controls.rst                     | 206 +++++++-------
 Documentation/media/uapi/v4l/extended-controls.rst             |   6 +-
 Documentation/media/uapi/v4l/vidioc-qbuf.rst                   |   8 +
 MAINTAINERS                                                    |   8 +-
 drivers/media/i2c/Makefile                                     |   2 +-
 drivers/media/i2c/{adv7511.c => adv7511-v4l2.c}                |   5 +
 drivers/media/platform/atmel/Makefile                          |   4 +-
 drivers/media/platform/atmel/{atmel-isc.c => atmel-isc-base.c} | 548 +++----------------------------------
 drivers/media/platform/atmel/atmel-isc.h                       | 249 +++++++++++++++++
 drivers/media/platform/atmel/atmel-sama5d2-isc.c               | 348 +++++++++++++++++++++++
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c                |   2 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h             |   2 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c             |  14 +-
 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c          |  21 +-
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c           |  21 +-
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c           |  23 +-
 drivers/media/platform/mtk-vcodec/vdec_drv_base.h              |   8 +-
 drivers/media/platform/mtk-vcodec/vdec_drv_if.c                |  20 +-
 drivers/media/platform/mtk-vcodec/vdec_drv_if.h                |   4 +
 drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c          |  19 +-
 drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c           |  19 +-
 drivers/media/platform/mtk-vcodec/venc_drv_base.h              |   8 +-
 drivers/media/platform/mtk-vcodec/venc_drv_if.c                |  13 +-
 drivers/media/platform/mtk-vcodec/venc_drv_if.h                |   3 +
 drivers/media/platform/rcar-vin/rcar-v4l2.c                    | 190 +++----------
 drivers/media/platform/s5p-mfc/s5p_mfc_pm.c                    |   5 +
 drivers/media/platform/sti/hva/hva-v4l2.c                      |   4 +-
 drivers/media/platform/vimc/Makefile                           |  12 +-
 drivers/media/platform/vimc/vimc-common.c                      |   4 -
 drivers/media/platform/vimc/vimc-debayer.c                     |   6 +-
 drivers/media/platform/vimc/vimc-streamer.c                    |   4 -
 drivers/media/v4l2-core/v4l2-ctrls.c                           |   4 +
 drivers/staging/media/davinci_vpfe/dm365_ipipe.c               |  15 +-
 drivers/staging/media/hantro/hantro_v4l2.c                     |   2 +-
 drivers/staging/media/imx/imx7-media-csi.c                     |   8 +
 drivers/staging/media/meson/vdec/codec_mpeg12.c                |   2 +-
 include/media/videobuf2-core.h                                 |  18 ++
 include/uapi/linux/media.h                                     |   2 +-
 include/uapi/linux/videodev2.h                                 |   2 +-
 39 files changed, 937 insertions(+), 902 deletions(-)
 rename drivers/media/i2c/{adv7511.c => adv7511-v4l2.c} (99%)
 rename drivers/media/platform/atmel/{atmel-isc.c => atmel-isc-base.c} (82%)
 create mode 100644 drivers/media/platform/atmel/atmel-isc.h
 create mode 100644 drivers/media/platform/atmel/atmel-sama5d2-isc.c
