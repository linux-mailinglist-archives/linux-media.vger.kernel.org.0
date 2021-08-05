Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2355F3E126D
	for <lists+linux-media@lfdr.de>; Thu,  5 Aug 2021 12:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240012AbhHEKSt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Aug 2021 06:18:49 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:56815 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239866AbhHEKSt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Aug 2021 06:18:49 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id BaSPmOidw4JsbBaSQmqIQY; Thu, 05 Aug 2021 12:18:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1628158714; bh=VLMci+fahUEvPcVlCq2dHMDDfeYryUWll6p6VzQubYs=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tO4RdOh/eaxQbjqV/aQeSy69tWXTbZmhr5bv2Tkk2ZpbkhnJj6O2Qs1X0wpkooCyC
         TtYyLua+unQJi9l2ZdqHV7RtgHhMiMT2Bxsw2N6N/3SNKNGWzF4QyEJroyx+5d4s9T
         o83FRVWQH/Nu6rGoAxlHTAfgsO5Uq/Z+QcWuRGwzdzSgE3Thvs1wB8IW1aGLL6v86T
         UW0LHRvB2gk8VLvD8HEVgwa1gHmqokOSZtOm5o0GaYo5dhFiyeD+70sjxVBf9XpJIP
         c75BafCrgxSYljOwlcjd/BV6oYkDrKrmuUYPdgjwevXJfWDuicLqrmL68wpCFg+sBT
         Pb6c/omEtRnrQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Robert Foss <robert.foss@linaro.org>,
        Irui Wang <irui.wang@mediatek.com>,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.15] v2: Various fixes and enhancements
Message-ID: <71026122-e9bc-a481-70ab-fde4e89af571@xs4all.nl>
Date:   Thu, 5 Aug 2021 12:18:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfD0lhZABqfpSbdvh3wBT7U91/XbBftMHsdG4ceyNNRrEf7F7oVu05f2Txygh1lp7dkwnL5rx/e5pQNSqDR/5i0/1DLJvy8/uYrZEYLv76KxCJnMJC0ft
 NXjlleuBh/wqp7OQwMtvX6GA2s/Ry5H8fYhAA5FnqENQ++eSa8cQBF2Pi1Ai99NyORFWTpqbTJQFA4rKIFDdzHvdL7t57a1qpNWMM7aXy9PXRAUqarYtf9aQ
 A7KCV7Omj3QXM4CQQlAmTSSRShomxOy+wMhwEfhEFmGCfAzrIiGWHw9hqwh4m49KY6BvwsC5HlvkrNZy4g8ENS09qLmdBczc9fAPo2McNOYGiypXHHQQcwG1
 6bPXW0F6XxvYOqi+wJus0CwkN0Bk63hMo/Z9vQrLgqiq4Y717oWWESmtgVBwFvrl6E7fQ19YbyKKX3fAPyIfbVcazhaxJWmrMKnXgKnxYhkn/030mO6GajhN
 FpmZGaREe0VK9s82
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Compared to v1 this adds five new patches:

      media: cedrus: hevc: Add support for scaling lists
      media: Rename V4L2_PIX_FMT_SUNXI_TILED_NV12 to V4L2_PIX_FMT_NV12_32L32
      media: Rename V4L2_PIX_FMT_HM12 to V4L2_PIX_FMT_NV12_16L16
      media: Add NV12_4L4 tiled format
      media: Clean V4L2_PIX_FMT_NV12MT documentation

And it fixes a typo (mt8192 -> mt8195) in the commit log of:

      dt-bindings: media: mtk-vcodec: Add binding for MT8195 VENC

Regards,

	Hans

The following changes since commit bfee75f73c37a2f46a6326eaa06f5db701f76f01:

  media: venus: venc: add support for V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control (2021-08-04 14:43:52 +0200)


are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.15f

for you to fetch changes up to b44234e9ac7997271f3412a2a2bb57f0cdc4ee06:

  media: Clean V4L2_PIX_FMT_NV12MT documentation (2021-08-05 11:01:29 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benjamin Gaignard (2):
      media: hevc: Add scaling matrix control
      media: hantro: Add scaling lists feature

Christophe JAILLET (1):
      media: meson-ge2d: Fix rotation parameter changes detection in 'ge2d_s_ctrl()'

Ezequiel Garcia (4):
      media: Rename V4L2_PIX_FMT_SUNXI_TILED_NV12 to V4L2_PIX_FMT_NV12_32L32
      media: Rename V4L2_PIX_FMT_HM12 to V4L2_PIX_FMT_NV12_16L16
      media: Add NV12_4L4 tiled format
      media: Clean V4L2_PIX_FMT_NV12MT documentation

Hans Verkuil (3):
      cedrus: drop min_buffers_needed.
      vivid: add module option to set request support mode
      videobuf2-core: sanity checks for requests and qbuf

Irui Wang (3):
      media: mtk-vcodec: Clean redundant encoder format definition
      dt-bindings: media: mtk-vcodec: Add binding for MT8195 VENC
      media: mtk-vcodec: Add MT8195 H264 venc driver

Jernej Skrabec (1):
      media: cedrus: hevc: Add support for scaling lists

Krzysztof Hałasa (1):
      TDA1997x: fix tda1997x_remove()

Pavel Skripkin (1):
      media: em28xx: add missing em28xx_close_extension

Pete Hemery (1):
      media: gspca/sn9c20x: Add ability to control built-in webcam LEDs

Robert Foss (4):
      media: camss: vfe: Don't read hardware version needlessly
      media: camss: vfe: Decrease priority of of VFE HW version to 'dbg'
      media: camss: vfe: Remove vfe_hw_version_read() argument
      media: camss: vfe: Rework vfe_hw_version_read() function definition

 Documentation/admin-guide/media/ivtv.rst                     |  2 +-
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt  |  1 +
 Documentation/userspace-api/media/drivers/cx2341x-uapi.rst   |  8 ++---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst    | 57 +++++++++++++++++++++++++++++++++++
 Documentation/userspace-api/media/v4l/pixfmt-reserved.rst    | 22 --------------
 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst  | 50 +++++++++++++++++++++----------
 Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst   |  6 ++++
 Documentation/userspace-api/media/videodev2.h.rst.exceptions |  2 ++
 drivers/media/common/videobuf2/videobuf2-core.c              | 23 +++++++++++++-
 drivers/media/i2c/tda1997x.c                                 |  4 +--
 drivers/media/pci/cx18/cx18-ioctl.c                          |  4 +--
 drivers/media/pci/cx18/cx18-streams.c                        |  8 ++---
 drivers/media/pci/ivtv/ivtv-ioctl.c                          |  8 ++---
 drivers/media/platform/meson/ge2d/ge2d.c                     |  6 +---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h           |  1 +
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c       | 63 +++++++++++++++++++-------------------
 drivers/media/platform/qcom/camss/camss-vfe-170.c            |  9 ++++--
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c            |  8 +++--
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c            |  8 +++--
 drivers/media/platform/qcom/camss/camss-vfe-4-8.c            |  8 +++--
 drivers/media/platform/qcom/camss/camss-vfe.c                |  3 +-
 drivers/media/platform/qcom/camss/camss-vfe.h                |  2 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c           | 10 +++----
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h           |  2 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c         |  2 +-
 drivers/media/test-drivers/vivid/vivid-core.c                | 14 +++++++--
 drivers/media/usb/em28xx/em28xx-cards.c                      |  5 +++-
 drivers/media/usb/gspca/sn9c20x.c                            | 22 +++++++++++++-
 drivers/media/v4l2-core/v4l2-common.c                        |  3 ++
 drivers/media/v4l2-core/v4l2-ctrls-core.c                    |  6 ++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                    |  4 +++
 drivers/media/v4l2-core/v4l2-ioctl.c                         |  5 ++--
 drivers/staging/media/hantro/hantro_drv.c                    |  8 +++--
 drivers/staging/media/hantro/hantro_g2_hevc_dec.c            | 52 ++++++++++++++++++++++++++++++++
 drivers/staging/media/hantro/hantro_hevc.c                   | 21 +++++++++++++
 drivers/staging/media/hantro/hantro_hw.h                     |  4 +++
 drivers/staging/media/sunxi/cedrus/cedrus.c                  |  8 ++++-
 drivers/staging/media/sunxi/cedrus/cedrus.h                  |  1 +
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c              |  2 ++
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c             | 70 ++++++++++++++++++++++++++++++++++++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c               |  2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h             |  2 ++
 drivers/staging/media/sunxi/cedrus/cedrus_video.c            |  6 ++--
 include/media/hevc-ctrls.h                                   | 11 +++++++
 include/uapi/linux/videodev2.h                               | 19 +++++++++---
 45 files changed, 449 insertions(+), 133 deletions(-)
