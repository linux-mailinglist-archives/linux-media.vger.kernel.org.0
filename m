Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD9CC078F
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 16:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727587AbfI0O26 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 10:28:58 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:35151 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727079AbfI0O26 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 10:28:58 -0400
Received: from [IPv6:2001:420:44c1:2577:2521:77be:ff76:8085] ([IPv6:2001:420:44c1:2577:2521:77be:ff76:8085])
        by smtp-cloud8.xs4all.net with ESMTPA
        id DrEriY76LKKNGDrEuiEG4e; Fri, 27 Sep 2019 16:28:56 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v5.5] Various fixes/enhancements
Message-ID: <e99ce728-5571-b043-c6c7-3d6d96c35870@xs4all.nl>
Date:   Fri, 27 Sep 2019 16:28:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGMDI7pn0IezbZc2wtrXcUcTWDa1P0F1xtFHegUXoPUJxifQuUWHtkukY0KYNzKQNtJAK/Cca8mGUMmnJFwugxQyO+HAQ2Xax25xoDzFjRoGfbLXYZDy
 I1Qd13VGrRF5m1sqXG50wpqwZPq5moXDq9Mg7v4yQbJQl1kuNHDCKHQq8LB3xTIDETpEtRFWmovHHs4cBM4owrrkums3gpohij4No/xVRVOAfSERqGmO/TMk
 ov9iN4OtxiAFLuOdLE563QXIv5mUn40QiORYtFfwcgrc9BPNLhkYKKwQsaSDomL9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 6f51fdfd8229d5358c2d6e272cf73478866e8ddc:

  media: videobuf-core.c: poll_wait needs a non-NULL buf pointer (2019-09-05 06:26:57 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.5d

for you to fetch changes up to ecccfa3b1f8a873e28758e111f533e2ef86d0eb2:

  media: imx: enable V4L2_PIX_FMT_XBGR32, _BGRX32, and _RGBX32 (2019-09-27 09:54:06 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Alexandre Courbot (2):
      media: mtk-vcodec: vdec: set VPI IPI handler in one place
      media: mtk-vcodec: vdec: clean up vidioc_vdec_s_fmt a bit

Boris Brezillon (3):
      media: hantro: h264: Fix a comment in b1_ref_list_cmp()
      media: hantro: h264: Rename POC_CMP() into HANTRO_CMP()
      media: hantro: h264: Fix the frame_num wraparound case

Christophe JAILLET (1):
      media: seco-cec: Add a missing 'release_region()' in an error handling path

Colin Ian King (2):
      media: s3c-camif: make array 'registers' static const, makes object smaller
      media: em28xx: make various arrays static const, makes object smaller

Ezequiel Garcia (2):
      media: hantro: Simplify macroblock macros
      media: hantro: Simplify buffer helpers

Hans Verkuil (6):
      cedrus: fill in bus_info for media device
      cedrus: choose default pixelformat in try_fmt
      cedrus: fix various format-related compliance issues
      ext-ctrls-flash.rst: fix typo
      v4l2-dv-timings.c: fix format string
      vidioc-g-fbuf.rst: remove duplicate 'struct'

Jernej Skrabec (1):
      media: vim2m: Fix abort issue

Kefeng Wang (1):
      media: vim2m: Fix BUG_ON in vim2m_device_release()

Niklas Söderlund (5):
      rcar-vin: Fix incorrect return statement in rvin_try_format()
      rcar-vin: Make use of V4L2_FIELD_IS_INTERLACED() macro
      rcar-vin: Rename rectangle holding the video source information
      rcar-vin: Do not reset the crop and compose rectangles in s_fmt
      rcar-vin: Add support for V4L2_FIELD_ALTERNATE

Philipp Zabel (5):
      media: hantro: streamline open, reuse error path
      media: uapi: h264: clarify dec_ref_pic_marking_bit_size fields
      media: uapi: h264: clarify V4L2_PIX_FMT_H264_SLICE format
      media: uapi: h264: clarify num_ref_idx_l[01]_(default_)active fields
      media: imx: enable V4L2_PIX_FMT_XBGR32, _BGRX32, and _RGBX32

Vandana BN (1):
      vivid: Set vid_cap_streaming and vid_out_streaming to true

Yunfei Dong (1):
      media: mtk-vcodec: vdec: fix incorrect pointer dereference

 Documentation/media/uapi/v4l/ext-ctrls-codec.rst       |  8 +++---
 Documentation/media/uapi/v4l/ext-ctrls-flash.rst       |  2 +-
 Documentation/media/uapi/v4l/pixfmt-compressed.rst     | 12 ++++++---
 Documentation/media/uapi/v4l/vidioc-g-fbuf.rst         |  2 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c     | 20 +++++++++++----
 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c  |  1 -
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c   |  1 -
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c   |  1 -
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.c        |  9 ++++++-
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.h        |  9 -------
 drivers/media/platform/rcar-vin/rcar-dma.c             | 54 +++++++++++++++++++++------------------
 drivers/media/platform/rcar-vin/rcar-v4l2.c            | 65 +++++++++++++++++++++++------------------------
 drivers/media/platform/rcar-vin/rcar-vin.h             |  4 +--
 drivers/media/platform/s3c-camif/camif-regs.c          |  2 +-
 drivers/media/platform/seco-cec/seco-cec.c             |  1 +
 drivers/media/platform/vim2m.c                         |  4 +++
 drivers/media/platform/vivid/vivid-vid-cap.c           |  3 ---
 drivers/media/platform/vivid/vivid-vid-out.c           |  3 ---
 drivers/media/usb/em28xx/em28xx-dvb.c                  | 30 +++++++++++-----------
 drivers/media/v4l2-core/v4l2-dv-timings.c              |  2 +-
 drivers/staging/media/hantro/hantro.h                  | 20 +++------------
 drivers/staging/media/hantro/hantro_drv.c              | 16 ++++++------
 drivers/staging/media/hantro/hantro_g1_h264_dec.c      |  7 +++---
 drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c     | 11 +++-----
 drivers/staging/media/hantro/hantro_g1_vp8_dec.c       | 11 ++++----
 drivers/staging/media/hantro/hantro_h1_jpeg_enc.c      |  4 +--
 drivers/staging/media/hantro/hantro_h264.c             | 64 +++++++++++++++++++++++++++++-----------------
 drivers/staging/media/hantro/hantro_hw.h               |  4 +--
 drivers/staging/media/hantro/rk3288_vpu_hw.c           | 16 ++++++------
 drivers/staging/media/hantro/rk3399_vpu_hw.c           | 12 ++++-----
 drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c  |  4 +--
 drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c | 11 +++-----
 drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c   | 12 ++++-----
 drivers/staging/media/imx/imx-media-utils.c            | 10 +++++++-
 drivers/staging/media/sunxi/cedrus/cedrus.c            | 12 +++++++++
 drivers/staging/media/sunxi/cedrus/cedrus_video.c      | 74 +++++++++++++++++-------------------------------------
 drivers/staging/media/sunxi/cedrus/cedrus_video.h      |  1 +
 37 files changed, 261 insertions(+), 261 deletions(-)
