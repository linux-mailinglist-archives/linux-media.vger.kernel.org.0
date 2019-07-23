Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE9FE715F5
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 12:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730626AbfGWKXp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 06:23:45 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:35595 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726680AbfGWKXo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 06:23:44 -0400
Received: from [IPv6:2001:420:44c1:2579:b924:5c77:4556:9fd2] ([IPv6:2001:420:44c1:2579:b924:5c77:4556:9fd2])
        by smtp-cloud7.xs4all.net with ESMTPA
        id prxLhubiZLqASprxOhIVOS; Tue, 23 Jul 2019 12:23:42 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL v2 FOR v5.4] Various fixes/enhancements
Message-ID: <bad1c4cd-aea9-869e-6138-1684da8254cd@xs4all.nl>
Date:   Tue, 23 Jul 2019 12:23:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfL92pXfvOqQiKGEiW/vcBqO/x5toS9ATY0b77kraDPVtiOM2BX+zWt1y4SMz/mcSMlbJQ4Y9xP2tRSmgEvolNWBFo9HmfLm417wxKTWX2A8BokEBYIZQ
 p+Ap6W32j9FjDV9ZfloRp/uVfmV15YuyPNkWu0CVxQ+v41S2NODIbnHwVnLzDOpf99e3gF3D6d5Uewty81xBGVTgiv37mrYRqrR7PvcXL6jWd3rVgttOHyBO
 rcwnjoH94m8lNxr36a1nBGX+I5ofnxlW6ojm97lyH0H1F4ZbyDPlIjMRIYuR9WHV
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is part one of pending fixes/enhancements from my todo list.

Once this is merged, I'll prepare a second PR for the remaining patches.

Regards,

	Hans

Changes since v1:

- Dropped "MAINTAINERS: Update my email address" since it went in via the sunxi tree.


The following changes since commit 66193b24514c91aeda88da744554b2665471aeae:

  media: dvbsky: add support for Mygica T230C v2 (2019-07-22 15:33:30 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.4c3

for you to fetch changes up to c944e896aa22d7cd1a94053aaa39d2dc0b5f82cf:

  media: vimc.rst: add vimc-streamer source documentation (2019-07-23 11:28:07 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
André Almeida (5):
      media: vimc: stream: remove obsolete function doc
      media: vimc: stream: fix style of argument description
      media: vimc: stream: format comments as kernel-doc
      media: vimc.rst: Add a proper alt attribute to vimc.dot
      media: vimc.rst: add vimc-streamer source documentation

Arnd Bergmann (2):
      media: davinci-vpbe: remove obsolete includes
      media: vivid: work around high stack usage with clang

Colin Ian King (3):
      media: vivid: fix potential integer overflow on left shift
      media: cobalt: remove redundant assignment to variable data
      saa7134: remove redundant assignment to variable value

Frederick Lawler (1):
      media: cobalt: Prefer pcie_capability_read_word()

Hans Verkuil (11):
      v4l2-ioctl: call v4l_pix_format_touch() for TRY_FMT
      input/touchscreen/sur40: use COLORSPACE_RAW
      drivers/media: don't set pix->priv = 0
      via-camera: call viafb_pm_unregister in remove()
      via-camera: use struct v4l2_fh
      ov7670: don't return ENOTTY if SUBDEV_API is not set
      via-camera: fix v4l2-compliance fails
      media/i2c: don't return ENOTTY if SUBDEV_API is not set
      m2m-deinterlace: use struct v4l2_fh
      omap_vout: use struct v4l2_fh
      mx2_emmaprp: use struct v4l2_fh

Hariprasad Kelam (1):
      staging/media/davinci_vpfe: Add null check post kmalloc

Joe Perches (2):
      media: m2m-deinterlace: Fix misuse of strscpy
      media: go7007: Fix misuse of strscpy

Lucas Stach (1):
      media: vb2-dc: skip CPU sync in map/unmap dma_buf

Michael Tretter (2):
      media: vb2: reorder checks in vb2_poll()
      media: v4l2-mem2mem: reorder checks in v4l2_m2m_poll()

Neil Armstrong (2):
      dt-bindings: media: meson-ao-cec: add SM1 compatible
      media: platform: meson-ao-cec-g12a: add support for SM1

Stephen Rothwell (1):
      media: vp8-ctrls.h: new file needs types.h

Steve Longerbeam (1):
      media: staging/imx: Fix NULL deref in find_pipeline_entity()

Vandana BN (1):
      media:vivid:add sanity check to avoid divide error and set value to 1 if 0.

Wen Yang (2):
      media: exynos4-is: fix leaked of_node references
      media: ti-vpe: fix leaked of_node references

 Documentation/devicetree/bindings/media/meson-ao-cec.txt |   8 +++--
 Documentation/media/v4l-drivers/vimc.rst                 |  13 +++++++-
 drivers/input/touchscreen/sur40.c                        |   4 +--
 drivers/media/common/videobuf2/videobuf2-dma-contig.c    |  23 +++++++++-----
 drivers/media/common/videobuf2/videobuf2-v4l2.c          |   8 +++--
 drivers/media/i2c/mt9m111.c                              |   2 +-
 drivers/media/i2c/ov2640.c                               |   2 +-
 drivers/media/i2c/ov2659.c                               |   4 +--
 drivers/media/i2c/ov2680.c                               |   5 +--
 drivers/media/i2c/ov5695.c                               |   5 +--
 drivers/media/i2c/ov7670.c                               |   6 ++--
 drivers/media/i2c/ov7740.c                               |   8 ++---
 drivers/media/pci/cobalt/cobalt-driver.c                 |  38 +++++++++-------------
 drivers/media/pci/cobalt/cobalt-flash.c                  |   2 +-
 drivers/media/pci/cobalt/cobalt-v4l2.c                   |   1 -
 drivers/media/pci/saa7134/saa7134-tvaudio.c              |   1 -
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c           |   2 --
 drivers/media/pci/solo6x10/solo6x10-v4l2.c               |   2 --
 drivers/media/pci/tw68/tw68-video.c                      |   1 -
 drivers/media/platform/davinci/vpbe_display.c            |   4 ---
 drivers/media/platform/davinci/vpbe_osd.c                |   5 ---
 drivers/media/platform/davinci/vpbe_venc.c               |   5 ---
 drivers/media/platform/davinci/vpif_capture.c            |   1 -
 drivers/media/platform/exynos4-is/fimc-is.c              |   1 +
 drivers/media/platform/exynos4-is/media-dev.c            |   2 ++
 drivers/media/platform/m2m-deinterlace.c                 | 126 ++++++++++++++++++++++---------------------------------------------------
 drivers/media/platform/meson/ao-cec-g12a.c               |  36 ++++++++++++++++++++-
 drivers/media/platform/mx2_emmaprp.c                     | 132 +++++++++++++++++++----------------------------------------------------------
 drivers/media/platform/omap/omap_vout.c                  |  53 ++++++++++++++++---------------
 drivers/media/platform/ti-vpe/cal.c                      |   1 +
 drivers/media/platform/via-camera.c                      |  94 +++++++++++++++++++++++++++++++++----------------------
 drivers/media/platform/vimc/vimc-streamer.c              |  38 +++++++++++++---------
 drivers/media/platform/vimc/vimc-streamer.h              |  18 ++++-------
 drivers/media/platform/vivid/vivid-ctrls.c               |  24 +++++++-------
 drivers/media/platform/vivid/vivid-kthread-cap.c         |   9 ++++--
 drivers/media/usb/au0828/au0828-video.c                  |   2 --
 drivers/media/usb/cpia2/cpia2_v4l.c                      |   2 --
 drivers/media/usb/em28xx/em28xx-video.c                  |   1 -
 drivers/media/usb/go7007/snd-go7007.c                    |   2 +-
 drivers/media/usb/gspca/gspca.c                          |  28 +++++++++--------
 drivers/media/usb/s2255/s2255drv.c                       |   2 --
 drivers/media/usb/uvc/uvc_v4l2.c                         |   2 --
 drivers/media/v4l2-core/v4l2-ioctl.c                     |   3 ++
 drivers/media/v4l2-core/v4l2-mem2mem.c                   |  47 ++++++++++++++++------------
 drivers/staging/media/davinci_vpfe/dm365_ipipe.c         |   5 +++
 drivers/staging/media/imx/imx-media-utils.c              |   2 +-
 include/media/vp8-ctrls.h                                |   2 ++
 47 files changed, 358 insertions(+), 424 deletions(-)
