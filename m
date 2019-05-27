Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1F52B150
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 11:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbfE0JaQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 05:30:16 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:56427 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726097AbfE0JaP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 05:30:15 -0400
Received: from [IPv6:2001:983:e9a7:1:f4bd:6355:63eb:2e52] ([IPv6:2001:983:e9a7:1:f4bd:6355:63eb:2e52])
        by smtp-cloud9.xs4all.net with ESMTPA
        id VBxMhZukrsDWyVBxNhYOtZ; Mon, 27 May 2019 11:30:13 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.3] Various fixes and enhancements
Message-ID: <692ede18-6b6a-9274-27a1-fa8391797f6c@xs4all.nl>
Date:   Mon, 27 May 2019 11:30:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPCxk/XvOBGfrbfHNX7GqCHHmOjNrbYk6XsRN+3qQ2zOS+qMHvLdQhYJZoi88tx9NzF8F+qWlGtN1PT6yO+HrrpxL9VA7DujNd1GI9eIYP6XAsBT0VQX
 5XCeBY8Gegn6KrfDZtwX3shG/P5PrrhGK3yOBKpwmqbbovNLV1aPry+WxvPQmZzn7N5jf5dcJzrmrA2YjR/LmlbutaM9kxXP1EZrEHM818BMbJm+j51xBAZl
 6iOXpenmtL+urw92NUqKxAZv4hufDI70OxWlpJvWkOazQjhlW3OfrAzcBToG9ZeoqUFxvRgCqmbwztPkCfcicnIATwlbGLywbpJdR6OEMG+4CrkCAzDpTL+W
 wvAE0zSV
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Lots of fixes and improvements.

Regards,

	Hans

The following changes since commit 2c41cc0be07b5ee2f1167f41cd8a86fc5b53d82c:

  media: venus: firmware: fix leaked of_node references (2019-05-24 09:03:06 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.3c

for you to fetch changes up to 4cb6dff8b17d71269ad5a9012f93818347c9dc5f:

  v4l2-pci-skeleton.c: fix doc warning (2019-05-27 10:44:09 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Andrey Konovalov (1):
      media: pvrusb2: use a different format for warnings

Boris Brezillon (2):
      rockchip/vpu: Remove a useless test
      media: v4l2: Initialize mpeg slice controls

Ezequiel Garcia (8):
      rockchip/vpu: Use pixel format helpers
      rockchip/vpu: Use v4l2_m2m_buf_copy_metadata
      rockchip/vpu: Cleanup macroblock alignment
      rockchip/vpu: Cleanup JPEG bounce buffer management
      media: coda: Print a nicer device registered message
      media: coda: Remove unbalanced and unneeded mutex unlock
      media: coda: Replace the threaded interrupt with a hard interrupt
      media: coda: Clear the interrupt reason

Hans Verkuil (4):
      coda/venus/s5p_mfc: fix control typo
      media: move drivers/media/media-* to drivers/media/mc/mc-*
      vicodec: correctly support unbinding of the driver
      v4l2-pci-skeleton.c: fix doc warning

Hariprasad Kelam (1):
      staging: media: imx: fix Unneeded variable: "ret". Return "0"

Helen Koike (1):
      media: vimc: fix component match compare

Kefeng Wang (1):
      media: vim2m: fix two double-free issues

Niklas Söderlund (2):
      rcar-csi2: Fix coccinelle warning for PTR_ERR_OR_ZERO()
      vimc: Remove unneeded return statement in vimc_sen_s_stream()

Oliver Neukum (2):
      cpia2_usb: first wake up, then free in disconnect
      media: pwc: convert to BIT macro

Rui Miguel Silva (1):
      media: imx7_mipi_csis: fix racy entity pads init

Steve Longerbeam (1):
      docs-rst: Clarify older field vs. first transmitted field

Vandana BN (1):
      media:usb:zr364xx:Fix KASAN:null-ptr-deref Read in zr364xx_vidioc_querycap

sumitg (1):
      v4l2-core: fix use-after-free error

 Documentation/media/uapi/v4l/field-order.rst                   |  17 ++++---
 drivers/media/Kconfig                                          |  34 +-------------
 drivers/media/Makefile                                         |  13 +-----
 drivers/media/mc/Kconfig                                       |  33 ++++++++++++++
 drivers/media/mc/Makefile                                      |  10 +++++
 drivers/media/{media-dev-allocator.c => mc/mc-dev-allocator.c} |   0
 drivers/media/{media-device.c => mc/mc-device.c}               |   0
 drivers/media/{media-devnode.c => mc/mc-devnode.c}             |   0
 drivers/media/{media-entity.c => mc/mc-entity.c}               |   0
 drivers/media/{media-request.c => mc/mc-request.c}             |   0
 drivers/media/platform/coda/coda-bit.c                         |   6 +--
 drivers/media/platform/coda/coda-common.c                      |  19 +++++---
 drivers/media/platform/qcom/venus/venc_ctrls.c                 |   2 +-
 drivers/media/platform/rcar-vin/rcar-csi2.c                    |   4 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c                   |   2 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c                |   4 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_opr_v6.c                |   8 ++--
 drivers/media/platform/vicodec/vicodec-core.c                  |  23 +++++++---
 drivers/media/platform/vim2m.c                                 |   6 +--
 drivers/media/platform/vimc/vimc-core.c                        |   7 +--
 drivers/media/platform/vimc/vimc-sensor.c                      |   1 -
 drivers/media/usb/cpia2/cpia2_usb.c                            |   3 +-
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c                        |   4 +-
 drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c                   |   6 +--
 drivers/media/usb/pvrusb2/pvrusb2-std.c                        |   2 +-
 drivers/media/usb/pwc/pwc.h                                    |  18 ++++----
 drivers/media/usb/zr364xx/zr364xx.c                            |   3 +-
 drivers/media/v4l2-core/v4l2-ctrls.c                           |  38 +++++++++++-----
 drivers/staging/media/imx/imx-media-capture.c                  |   3 +-
 drivers/staging/media/imx/imx7-mipi-csis.c                     |  24 ++++++----
 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw.c             |   2 +
 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c    |   4 +-
 drivers/staging/media/rockchip/vpu/rk3399_vpu_hw.c             |   2 +
 drivers/staging/media/rockchip/vpu/rk3399_vpu_hw_jpeg_enc.c    |   4 +-
 drivers/staging/media/rockchip/vpu/rockchip_vpu.h              |  12 +++--
 drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c          |  24 +++++-----
 drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c          | 134 +++++++-------------------------------------------------
 drivers/staging/media/rockchip/vpu/rockchip_vpu_hw.h           |  28 ++++++++++++
 drivers/staging/media/rockchip/vpu/rockchip_vpu_jpeg.c         |  29 ++++++++++++
 include/uapi/linux/v4l2-controls.h                             |   5 +++
 samples/v4l/v4l2-pci-skeleton.c                                |   1 +
 41 files changed, 271 insertions(+), 264 deletions(-)
 create mode 100644 drivers/media/mc/Kconfig
 create mode 100644 drivers/media/mc/Makefile
 rename drivers/media/{media-dev-allocator.c => mc/mc-dev-allocator.c} (100%)
 rename drivers/media/{media-device.c => mc/mc-device.c} (100%)
 rename drivers/media/{media-devnode.c => mc/mc-devnode.c} (100%)
 rename drivers/media/{media-entity.c => mc/mc-entity.c} (100%)
 rename drivers/media/{media-request.c => mc/mc-request.c} (100%)
