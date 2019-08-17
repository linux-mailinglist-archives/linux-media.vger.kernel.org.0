Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17B1090FAB
	for <lists+linux-media@lfdr.de>; Sat, 17 Aug 2019 11:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbfHQJb6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Aug 2019 05:31:58 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:51041 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725267AbfHQJb5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Aug 2019 05:31:57 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id yv3th8PggDqPeyv3xhexsE; Sat, 17 Aug 2019 11:31:55 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.4] Hantro H.264 + finish stateful decoder spec
Message-ID: <1be8ac17-349b-ef4d-299d-4f38889492ec@xs4all.nl>
Date:   Sat, 17 Aug 2019 11:31:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAwpQMbI/00WKg4F1E7TcH133fMg2o3NdotuC5HwZ/lu6wyWwlTGGJRF6GAeMeuGnyt7+GkHTRoYDXox20PnJ0iJr5+tnNCZvV0ej2tvAB/xoWVflu9/
 q7F72mGXUBTaXtoVkyN73OcxBsANtJ2ImhFIbm21g8Cr3QMKbewhCFD3NQuHNi5oQyrYiIcn2ERLEjUFlpoCR6GUKFdJQRWw/sD/cqXwGnBpKGKOm7LgR/VD
 E5PCvEvtmbaqPN8b4StoslrEOFXcuImaQTAKpN6it3LTtDiujIYzxA9fpzqH4DFJxvSVBa76Uw/z/yMhZ9ibmg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This PR takes Ezequiel's series adding H.264 decoding for hantro
(https://patchwork.linuxtv.org/project/linux-media/list/?series=603).

The first patch (lib/sort.c) is Acked by Andrew Morton and is intended to
go in through the media subsystem since this is the first driver that uses
it.

This series substantially improves the H.264 API. Only H.264 slicing support
still requires some more work.

I double-checked that the H.264 control structures have the same layout between
32 and 64 bit architectures and do not contain any holes.

The second part of this PR is core API improvements to help give more
information about the HW capabilities by adding two new format flags.

This second part consists of patches 1-3 and 5-8 of this series:

https://patchwork.linuxtv.org/project/linux-media/list/?series=588

I dropped patch 4 until I have an Ack from Samsung, and patches 9-12
are not ready yet for merging.

Most importantly, the stateful decoder specification is now merged.

The final patch improves pixfmt-compressed.srt. It's still not perfect
and I plan to make more changes there with references to the various
codec standards, so there will be a follow-up patch, but for now this
is still better than what we had.

Note that the v4l2-compliance test fails with vicodec after this PR
is merged. I have a patch for v4l-utils ready to fix this.

Regards,

	Hans


The following changes since commit 31d5d15dfc3418a57cfab419a353d8dc5f5698b5:

  media: MAINTAINERS: Add entry for the ov5670 driver (2019-08-15 08:17:04 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.4l

for you to fetch changes up to bf7ca7e0046e7f4e246876e9cfab5a65ca1ec72a:

  pixfmt-compressed.rst: improve H264/HEVC/MPEG1+2/VP8+9 documentation (2019-08-17 10:24:37 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Boris Brezillon (3):
      media: uapi: h264: Add the concept of decoding mode
      media: uapi: h264: Get rid of the p0/b0/b1 ref-lists
      media: hantro: Move copy_metadata() before doing a decode operation

Ezequiel Garcia (4):
      media: uapi: h264: Rename pixel format
      media: uapi: h264: Add the concept of start code
      media: cedrus: Cleanup control initialization
      media: cedrus: Specify H264 startcode and decoding mode

Hans Verkuil (2):
      videodev2.h: add V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM
      pixfmt-compressed.rst: improve H264/HEVC/MPEG1+2/VP8+9 documentation

Hertz Wong (3):
      media: hantro: Add core bits to support H264 decoding
      media: hantro: Add support for H264 decoding on G1
      media: hantro: Enable H264 decoding on rk3288

Maxime Jourdan (4):
      videodev2.h: add V4L2_FMT_FLAG_DYN_RESOLUTION
      media: venus: vdec: flag OUTPUT formats with V4L2_FMT_FLAG_DYN_RESOLUTION
      media: mtk-vcodec: flag OUTPUT formats with V4L2_FMT_FLAG_DYN_RESOLUTION
      media: vicodec: set flags for vdec/stateful OUTPUT coded formats

Rasmus Villemoes (1):
      lib/sort.c: implement sort() variant taking context argument

Tomasz Figa (1):
      media: docs-rst: Document memory-to-memory video decoder interface

 Documentation/media/uapi/v4l/dev-decoder.rst        | 1101 +++++++++++++++++++++++++++++++++++++++++++++++
 Documentation/media/uapi/v4l/dev-mem2mem.rst        |    8 +-
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst    |   99 ++++-
 Documentation/media/uapi/v4l/pixfmt-compressed.rst  |   47 +-
 Documentation/media/uapi/v4l/pixfmt-v4l2.rst        |    5 +
 Documentation/media/uapi/v4l/v4l2.rst               |   10 +-
 Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst |   41 +-
 Documentation/media/uapi/v4l/vidioc-dqevent.rst     |   11 +-
 Documentation/media/uapi/v4l/vidioc-enum-fmt.rst    |   16 +
 Documentation/media/videodev2.h.rst.exceptions      |    2 +
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c  |    4 +
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h  |    1 +
 drivers/media/platform/qcom/venus/core.h            |    1 +
 drivers/media/platform/qcom/venus/vdec.c            |   11 +
 drivers/media/platform/vicodec/vicodec-core.c       |    3 +
 drivers/media/v4l2-core/v4l2-ctrls.c                |   18 +
 drivers/media/v4l2-core/v4l2-ioctl.c                |    2 +-
 drivers/staging/media/hantro/Makefile               |    2 +
 drivers/staging/media/hantro/hantro.h               |    9 +-
 drivers/staging/media/hantro/hantro_drv.c           |   50 ++-
 drivers/staging/media/hantro/hantro_g1_h264_dec.c   |  292 +++++++++++++
 drivers/staging/media/hantro/hantro_h264.c          |  646 +++++++++++++++++++++++++++
 drivers/staging/media/hantro/hantro_hw.h            |   56 +++
 drivers/staging/media/hantro/hantro_v4l2.c          |   10 +
 drivers/staging/media/hantro/rk3288_vpu_hw.c        |   21 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c         |   63 ++-
 drivers/staging/media/sunxi/cedrus/cedrus.h         |    3 +-
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c     |    2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_video.c   |    6 +-
 include/linux/sort.h                                |    5 +
 include/media/h264-ctrls.h                          |   21 +-
 include/uapi/linux/videodev2.h                      |    6 +-
 lib/sort.c                                          |   34 +-
 33 files changed, 2523 insertions(+), 83 deletions(-)
 create mode 100644 Documentation/media/uapi/v4l/dev-decoder.rst
 create mode 100644 drivers/staging/media/hantro/hantro_g1_h264_dec.c
 create mode 100644 drivers/staging/media/hantro/hantro_h264.c
